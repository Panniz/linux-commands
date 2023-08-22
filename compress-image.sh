#!/bin/sh
# Converte file source.jpg e crea il file compresso result.jpg
convert -strip -interlace Plane -sampling-factor 4:2:0 -quality 85% -resize 1400x1400 source.jpg result.jpg

# Bulk conversion using find
find . -maxdepth 1 -type f -name "*.jp*g" ! -name "compr-*" -execdir sh -c 'convert -strip -interlace Plane -sampling-factor 4:2:0 -quality 80% -resize 1400x1400 "$0" "compr-$(basename "$0")"' {} \;
