#!/bin/bash

VERSION=1.7

xhost +

if [ ! -f $HOME/Documents/DtsRuc.xml ]; then
	docker create --name dimm-sri-ec-tmp marceloandrader/dimm-sri-ec:$VERSION
	docker cp dimm-sri-ec-tmp:/opt/dimm/src/xml/data/DtsRuc.xml ~/Documents/DtsRuc.xml
	docker rm dimm-sri-ec-tmp
fi

docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v $HOME/dimm:/dimm \
    -v $HOME/Documents/DtsRuc.xml:/opt/dimm/src/xml/data/DtsRuc.xml \
    --name dimm-sri-ec \
    marceloandrader/dimm-sri-ec:$VERSION
