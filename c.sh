#!/bin/sh --
set -ex
xstatic g++ -fno-stack-protector -fomit-frame-pointer -mpreferred-stack-boundary=2 -falign-functions=1 -falign-jumps=1 -falign-loops=1 -W -Wall -s -Os -o mklibs-readelf -I. -DPACKAGE_STRING=\"mklibs\ 0.1.38\" \
    elf.cpp main.cpp
strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id mklibs-readelf
upx.pts --brute mklibs-readelf
ls -l mklibs-readelf
: c.sh OK.