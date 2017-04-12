#!/bin/bash

docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/dimm:/dimm \
    --name sri-ec-dimm \
    marceloandrader/dimm-sri-ec:1.7
