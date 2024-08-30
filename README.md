# GIMP-Grass-Colorizer-Script
Colorize Textures in GIMP using the same math that Minecraft does. The math is same for all versions 
of Minecraft. Especially handy for making custom grass block textures in MC3DS Edition, as 
each color for the grass side texture is a separate texture.

The script is very bare bones, and straight to the point, so excuse the ugly interface and lack of 
options. Currently only works on 16 x 16 textures.

Please read the [How To Use](#how-to-use)


## How To Use
### Installing
1. Open GIMP, and go to `Edit`>`Preferences`
2. On the left side, at the bottom of the list, press the + next to `Folders` and select `Scripts`
3. Download the script you'd like, and put it in the first folder shown

   The script folder should be within a user folder like `/home/[name]/...` or `C:\Users\[Name]\...`
5. Go to `Filters`>`Script-Fu`>`Refresh Scripts`


### Using script-fu-mc-colorizer
1. Import any color of grass block side texture (16 by 16 only)
2. Import the uncolored grass side overlay texture, then add it as a layer on top of the first texture
3. Check [Important Notes](#important-notes)
4. Open `Colors`>`MC-Colorizer`>`MC-Colorizer`
5. Click on the Color box, and paste the color you want in the Color Selection prompt, and press OK
6. Once the program has colored your block, go to `File`>`Export As...`, and export your image (it should be a PNG)
7. If you want to make more grass textures, undo the color by pressing CTRL + Z, and repeat steps 4-6 OR if you need all 16
   colors, use the other script

   
### Using script-fu-mc-colorizer-batch
1. Import any color of grass block side texture (16 by 16 only)
2. Import the uncolored grass side overlay texture, then add it as a layer on top of the first texture
3. Check [Important Notes](#important-notes)
4. Open `Colors`>`MC-Colorizer-Batch`>`Batch MC-Colorizer`
5. Select the output folder for all 16 grass textures to be exported to
6. (Optional) Enter in an alternate prefix for the files. Null prefix is an option (Default is `grass_block_side_`)
7. (Optional) Choose whether you want the files to be numbered in the order they appear in the atlas file.
8. Click OK


## Important Notes
- Make sure the grass overlay texture is the top layer, and is the active layer (the one selected)
- Make sure your layers are the same size as your image (cropping the image doesn't always crop layers)
- If the script is greyed out, go to `Image`>`Mode` and select `RGB`
- If the script is still greyed out, right click the background layer and click `Add Alpha Channel`

  Do the same to all layers.
- STBrian's MC3DS Texture Maker has a bug, wherein the names for grass side texture colors `#88bb66` and `#83b593` are swapped.

  If the sixth `grass_block_side_######` entry in the list of textures is `88bb66`, then the bug is not fixed, so treat it as `83b593`,

  and vice versa. Note _only_ the name that the program calls these textures are swapped, not the textures or placement themselves.


## Grass Block Colors
- Forest - `#79c05a`
- Windswept - `#8ab689`
- Savanna - `#bfb755`
- Jungle - `#59c93c`
- Mushroom - `#55c93f`
- Birch Forest - `#88bb66`
- Old Growth Pine Taiga - `#86b87f`
- Sparse Jungle - `#64c73f`
- Taiga/Old Growth Spruce Taiga - `#86b783`
- Snowy Beach - `#83b593`
- Tundra - `#80b497`
- Plains - `#91bd59`
- Badlands - `#90814d`
- Ocean - `#8eb971`
- Swamp - `#6a7039`
- Dark Oak Forest - `#507a32`

These colors are in Minecraft 3DS's terrain atlas, and appear in this order.
