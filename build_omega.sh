#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper
rm -rf out

echo
echo "Issue build commands"
echo

mkdir -p out
ulimit -n 16384

echo
echo "Set DEFCONFIG"
echo 

export PATH="/home/kristof/android/aarch64-linux-gnu/bin:${PATH}"
time make O=out omega_defconfig

echo
echo "Build The Kernel"
echo 

time make -j$(nproc --all) O=out CROSS_COMPILE=aarch64-linux-gnu-