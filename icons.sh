#! /bin/ksh

for f in mxp-de.svg mxp-fr.svg; do
    cairosvg -f png -o ${f%%.svg}.png $f
done

for size in 16 32 128 256 512
do
    dim="${size}x${size}"

    for f in mxp-de.png mxp-fr.png
    do
        convert $f -resize $dim ${f%%.png}.iconset/icon_"${size}x${size}".png
    done
done

# See <https://superuser.com/questions/665494/how-to-make-a-custom-keyboard-layout-in-os-x>

for f in *.iconset
do
    iconutil --convert icns --output ${f%%.iconset}.icns $f
done
