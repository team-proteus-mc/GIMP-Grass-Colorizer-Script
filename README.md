# GIMP-Grass-Colorizer-Script
Colorize Textures in GIMP using the same math that Minecraft does. The math is same for all versions 
of Minecraft. Especially handy for making custom grass block textures in MC3DS Edition, as 
each color for the grass side texture is a separate texture.

The script is very bare bones, and straight to the point, so excuse the ugly interface and lack of 
options. Currently only works on 16 x 16 textures.

## How to use
1. Open GIMP, and go to Edit > Preferences.
2. Press the + next to "Folders", and select "Scripts".
3. Download the script, and put it in the first folder shown (it should be in your User folder), then press OK.
4. Go to Filters > Script-Fu > Refresh Scripts.
5. Import your normal/carried grass side block PNG, then import your monochrome grass side block image on top of that (the monochrome image should be layered on top of the normal one).
6. Open Colors > MC-Colorizer.
7. Press on the Color box, paste the color you want in the Color Selection prompt, and press OK.
8. Once the program has colored your block, go to File > Export As..., and export your image (it should be a PNG).
9. If you want to make more grass blocks, undo the color by pressing CTRL + Z, and repeat steps 6-8.

## Grass block colors
- Forest - #79c05a
- Windswept - #8ab689
- Savanna - #bfb755
- Jungle - #59c93c
- Mushroom - #55c93f
- Birch Forest - #88bb67
- Old Growth Pine Taiga - #86b87f
- Sparse Jungle - #64c73f
- Taiga/Old Growth Spruce Taiga - #86b783
- Snowy Beach - #83b593
- Tundra - #80b497
- Plains - #91bd59
- Badlands - #90814d
- Ocean - #8eb971
- Swamp - #6a7039
- Dark Oak Forest - #507a32

These colors are in Minecraft 3DS's terrain atlas (in order).
