#!/bin/sh
convert -strip -interlace Plane -sampling-factor 4:2:0 -quality 85% -resize 1400x1400 source.jpg result.jpg
