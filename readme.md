# playchoicecomplete layout for AttractMode front end

by [Keil Miller Jr](http://keilmiller.com)

![Image of layout](layout.gif)

## DESCRIPTION:

*playchoicecomplete* is a layout for the [AttractMode](http://attractmode.org) front end. It is inspired from the Nintendo Playchoice-10 arcade machine.

This layout is intended to be displayed at a minimum of VGA resolution (640x480) and will scale gracefully to any higher resolutions, including widescreen resolutions.

If you are intending to use this layout only with Nintendo roms, it is recommended to use Vs. roms instead of actual Playchoice-10 roms as they are the same game, but without a menu (redundent if using AttractMode) and is single screen.

## Requirements:

* AttractMode compatible device with AttractMode 2.3.0 or greater installed
* Mame/GroovyMame installed with corresponding roms and bios

## Paths

You may need to change file paths as necessary if your differs.

## Install Files

1. Copy layout files to ```$HOME/Apps/AttractModeFE/layouts/playchoicecomplete/```
2. The [Helpers module](https://github.com/keilmillerjr/helpers-module) is **REQUIRED** for you to install. The layout will not work correctly without it.
3. The [Shuffle module](https://github.com/keilmillerjr/shuffle-module) is **REQUIRED** for you to install. The layout will not work correctly without it.

## Optional Files

1. The [Shader module](https://github.com/keilmillerjr/shader-module) is **RECOMMENDED**. Shader module is required if you intend to use crt shaders within the layout, or have round corners on the slot artwork.
2. The [Leap plugin](https://github.com/keilmillerjr/leap-plugin) is **OPTIONAL**. Leap plugin helps to leap over empty filters. Whacky things happen if you have a favorites filter and no roms selected as a favorite!
3. The [FadeToGame plugin](https://github.com/keilmillerjr/fadetogame-plugin) is **OPTIONAL**. FadeToGame will fade the screen when transitioning to and from a game. Be sure to set "To Game Run Time" to at least *2064 milliseconds* if using SoundFx in playchoicecomplete, to prevent clipping of select SoundFx.

## Credit

Sounds for this layout were obtained from the following locations.

* [click.wav](https://freesound.org/people/airblock/sounds/407720/) by [airblock](https://freesound.org/people/airblock/)
* [select.mp3](https://freesound.org/people/killkhan/sounds/150222/) by [killian](https://freesound.org/people/killkhan/)

Artwork for this layout were obtained from the following locations.

* [star.png](https://cezkid.deviantart.com/art/Favorites-Icon-3D-173089544)
* [heart.png](https://cezkid.deviantart.com/art/Heart-3D-172583175)
* gif converted to sprites using [piskelapp](https://www.piskelapp.com)
