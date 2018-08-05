// --------------------
// Load Modules
// --------------------
fe.load_module("helpers");
fe.load_module("shuffle");
fe.load_module("shader");

fe.load_module("fade");
fe.load_module("animate");

// --------------------
// Layout User Options
// --------------------
class UserConfig {
	</ label="Enable CRT Shader on Background",
		help="Snap and Artwork is simulated to look like it is being displayed on a crt.",
		options="Yes, No",
		order=1 />
	enableSnapShader="No";
	
	</ label="CRT Shader Resolution",
		help="Select CRT resolution.",
		options="640x480, 320x240",
		order=2 />
	shaderResolution="320x240";
	
	</ label="Hide Brackets in Game Title",
		help="Hide brackets in game title.",
		options="Yes, No",
		order=3 />
	hideBrackets="Yes";
	
	</ label="Marquee Color",
		help="Color for marquee background.",
		options="Black, Green",
		order=4 />
	marqueeColor="Green";
	
	</ label="Marquee Opacity",
		help="Percentage of opacity for marquee background.",
		order=5 />
	marqueeOpacity="85";
	
	</ label="Favorite Image",
		help="Select which image to show for favorites.",
		options="Star, Heart",
		order=6 />
	favoriteImage="Star";
	
	</ label="Enable SoundFx",
		help="Enable SoundFx.",
		options="Yes, No",
		order=7 />
	enableSoundFx="Yes";
}
local user_config = fe.get_config();

// --------------------
// Config
// --------------------
fe.do_nut("config.nut");

// --------------------
// Magic Functions
// --------------------
function displayString() {
	return fe.displays[fe.list.display_index].name.toupper();
}

function titleString(index_offset = 0) {
	local s = fe.game_info(Info.Title, index_offset).toupper();
	if (toBool(user_config.hideBrackets)) s = split(s, "(/[");
	return rstrip(s[0]);
}

function filterString() {
	return fe.filters[fe.list.filter_index].name.toupper();
}

// --------------------
// Layout
// --------------------
local snap = FadeArt("snap", -1, -1, 1, 1);
	setProps(snap, config.snap);
	
local marquee = fe.add_image("white.png", -1, -1, 1, 1);
	setProps(marquee, config.marquee);
	if (user_config["marqueeColor"] == "Green") setProps(marquee, config.marqueeGreen);
	marquee.alpha = per(user_config["marqueeOpacity"].tointeger(), 255);

local container = fe.add_surface(config.container.width, config.container.height);
	setProps(container, config.container);

local display = container.add_text("[!displayString]", -1, -1, 1, 1);
	setProps(display, config.display);

local pill = container.add_image("white.png", -1, -1, 1, 1);
	setProps(pill, config.pill);

local channel = container.add_text("CHANNEL SELECT MENU", -1, -1, 1, 1);
	setProps(channel, config.channel);

local filter = container.add_text("[!filterString]", -1, -1, 1, 1);
	setProps(filter, config.filter);

class ShuffleList extends Shuffle {
	function select(slot) {
		slot.set_rgb(255, 255, 255);
	}

	function deselect(slot) {
		slot.set_rgb(0, 0, 0);
	}
}
local entry = ShuffleList(5, "text", "[ListEntry]  ....", false, container);
	setProps(entry.slots[0], config.entry[0]);
	setProps(entry.slots[1], config.entry[1]);
	setProps(entry.slots[2], config.entry[2]);
	setProps(entry.slots[3], config.entry[3]);
	setProps(entry.slots[4], config.entry[4]);
local title = ShuffleList(5, "text", "[!titleString]  ................................................................................", false, container);
	setProps(title.slots[0], config.title[0]);
	setProps(title.slots[1], config.title[1]);
	setProps(title.slots[2], config.title[2]);
	setProps(title.slots[3], config.title[3]);
	setProps(title.slots[4], config.title[4]);

class ShuffleFavorite extends Shuffle {
	config = null;

	constructor(pm="image", r=true, pt=::fe) {
		base.constructor(5, "image", pm, r, pt);

		config = {
			frame = 0,
			time = 1920,
			delay = 0,
			wait = false,
			loop = true,
			width = 50,
			height = 50,
			orientation = "horizontal",
		}
		for (local i=0; i<slots.len(); i++) {
			animation.add(SpriteAnimation(slots[i], config));
		}

		fe.add_transition_callback(this, "status");
	}

	function status(ttype, var, ttime) {
		for (local i=0; i<slots.len(); i++) {
			fe.game_info(Info.Favourite, slots[i].index_offset) == "1" ? slots[i].visible = true : slots[i].visible = false;
		}
	}
}
local favorite = ShuffleFavorite(user_config.favoriteImage.tolower() + ".png", false, container);
	setProps(favorite.slots[0], config.favorite[0]);
	setProps(favorite.slots[1], config.favorite[1]);
	setProps(favorite.slots[2], config.favorite[2]);
	setProps(favorite.slots[3], config.favorite[3]);
	setProps(favorite.slots[4], config.favorite[4]);

// --------------------
// Enable Shaders
// --------------------
if (fe.load_module("shader")) {
	// Snap Shader
	if (toBool(user_config.enableSnapShader)) {
		snapShader <- CrtLottes(splitRes(user_config.shaderResolution, "width"), splitRes(user_config.shaderResolution, "height"));
		snap.shader = snapShader.shader;
	}
	
	// Slot Artwork Shader
	pillShader <- RoundCorners(config.pill.height/2, config.pill.width, config.pill.height*4);
		pill.shader = pillShader.shader;
}

// --------------------
// Sounds
// --------------------

local click = fe.add_sound("click.wav");
	click.loop = false;
	click.playing = false;

local select = fe.add_sound("select.mp3"); // duration via terminal $ afinfo select.mp3 : 2.063650 sec
	select.loop = false;
	select.playing = false;

if (toBool(user_config.enableSoundFx)) {
	fe.add_signal_handler("soundFxSignals")
	function soundFxSignals(signal_str) {
		switch(signal_str) {
			case "prev_game":
			case "next_game":
			case "prev_filter":
			case "next_filter":
			case "add_favourite":
			case "prev_letter":
			case "next_letter":
				click.playing = true;
				break;
			case "select":
				select.playing = true;
				break;
		}
		return false;
	}
	
	fe.add_transition_callback("soundFxTransitions");
	function soundFxTransitions(ttype, var, ttime) {
		switch(ttype) {
			case Transition.ToGame:
				if (ttime < 1620) {
					return true;
				}
				break;
		}
		return false;
	}
}

// --------------------
// Save/Load Selected Slots
// --------------------
