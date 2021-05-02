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

echo
echo "Set DEFCONFIG"
echo 

export PATH="/home/kristof/android/aarch64-linux-gnu/bin:${PATH}"
time make O=out omega_defconfig

echo
echo "Build The Kernel"
echo 

time make -j$(nproc --all) O=out CROSS_COMPILE=aarch64-linux-gnu-
find /home/kristof/omega-11.0/out/arch/arm64/boot/dts/vendor/qcom -name '*.dtb' -exec cat {} + > /home/kristof/omega-11.0/out/arch/arm64/boot/dtb