local flw = fe.layout.width;
local flh = fe.layout.height;
local overscan = per(2, flh);

fe.layout.font = "VAG Rounded Bold";

::config <- {
	snap = {
		x = 0,
		y = 0,
		width = flw,
		height = flh,
	},
	marquee = {
		x = 0,
		y = 0,
		width = flw,
		height = per(50, flh),
		rgb = [0, 0, 0],
	},
	marqueeGreen = {
		rgb = [98, 188, 31],
	},
	container = {
		x = ((flw - matchAspect(4, 3, "height", flh)) / 2) + overscan,
		y = overscan,
		width = matchAspect(4, 3, "height", flh) - (overscan * 2),
		height = per(50, flh) - (overscan * 2),
	},
	channel_radius = overscan / 2,
}

config.display <- {
	x = 0,
	y = 0,
	width = per(25, config.container.width),
	height = per(10, config.container.height),
	align = Align.Left,
	nomargin = true,
}

config.pill <- {
	x = per(25, config.container.width),
	y = per(1, config.container.height),
	width = per(50, config.container.width),
	height = per(10, config.container.height),
	rgb = [241, 0, 0],
}

config.channel <- {
	x = per(25, config.container.width),
	y = 0,
	width = per(50, config.container.width),
	height = per(10, config.container.height),
	align = Align.Centre,
}

config.filter <- {
	x = per(75, config.container.width),
	y = 0,
	width = per(25, config.container.width),
	height = per(10, config.container.height),
	align = Align.Right,
	nomargin = true,
}

config.entry <- [
	{
		x = 0,
		y = per(20, config.container.height),
		width = per(15, config.container.width),
		height = per(10, config.container.height),
		align = Align.Right,
	},
	{
		x = 0,
		y = per(34, config.container.height),
		width = per(15, config.container.width),
		height = per(10, config.container.height),
		align = Align.Right,
	},
	{
		x = 0,
		y = per(48, config.container.height),
		width = per(15, config.container.width),
		height = per(10, config.container.height),
		align = Align.Right,
	},
	{
		x = 0,
		y = per(62, config.container.height),
		width = per(15, config.container.width),
		height = per(10, config.container.height),
		align = Align.Right,
	},
	{
		x = 0,
		y = per(76, config.container.height),
		width = per(15, config.container.width),
		height = per(10, config.container.height),
		align = Align.Right,
	},
]

config.title <- [
	{
		x = per(15, config.container.width),
		y = per(20, config.container.height),
		width = per(70, config.container.width),
		height = per(10, config.container.height),
		align = Align.Left,
	},
	{
		x = per(15, config.container.width),
		y = per(34, config.container.height),
		width = per(70, config.container.width),
		height = per(10, config.container.height),
		align = Align.Left,
	},
	{
		x = per(15, config.container.width),
		y = per(48, config.container.height),
		width = per(70, config.container.width),
		height = per(10, config.container.height),
		align = Align.Left,
	},
	{
		x = per(15, config.container.width),
		y = per(62, config.container.height),
		width = per(70, config.container.width),
		height = per(10, config.container.height),
		align = Align.Left,
	},
	{
		x = per(15, config.container.width),
		y = per(76, config.container.height),
		width = per(70, config.container.width),
		height = per(10, config.container.height),
		align = Align.Left,
	},
]

config.favorite <- [
		{
			x = per(85, config.container.width),
			y = per(20, config.container.height),
			width = matchAspect(1, 1, "height", per(10, config.container.height)),
			height = per(10, config.container.height),
		},
		{
			x = per(85, config.container.width),
			y = per(34, config.container.height),
			width = matchAspect(1, 1, "height", per(10, config.container.height)),
			height = per(10, config.container.height),
		},
		{
			x = per(85, config.container.width),
			y = per(48, config.container.height),
			width = matchAspect(1, 1, "height", per(10, config.container.height)),
			height = per(10, config.container.height),
		},
		{
			x = per(85, config.container.width),
			y = per(62, config.container.height),
			width = matchAspect(1, 1, "height", per(10, config.container.height)),
			height = per(10, config.container.height),
		},
		{
			x = per(85, config.container.width),
			y = per(76, config.container.height),
			width = matchAspect(1, 1, "height", per(10, config.container.height)),
			height = per(10, config.container.height),
		},
]
