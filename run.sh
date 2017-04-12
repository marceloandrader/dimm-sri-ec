#!/bin/bash

xhost +

docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v $HOME/dimm:/dimm \
    marceloandrader/dimm-sri-ec:1.7
