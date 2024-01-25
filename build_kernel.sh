#!/bin/bash

# samsung f23 kernel source code :  SM-E236B_SWA_14_Opensource.zip (https://opensource.samsung.com/main)
# clang for ARM : https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
# cross-compiler toolchain: https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -- tag android-14.0.0_r0.32
# command: docker exec -it -u 1000 kontainer zsh -c "/home/tm9k1/.scripts/build_mykernel" | tee kernel.log
#
#
## edit these as per your source code and build dir location
SOURCE_DIR_ECTORY=/home/tm9k1/samsung/kernel
OUTPUT_DIR_ECTORY=/home/tm9k1/samsung/build

## edit these when setting up your toolchain
export BUILD_CROSS_COMPILE=/home/tm9k1/samsung/toolchain/cross/bin/aarch64-linux-android-
export KERNEL_LLVM_BIN=/home/tm9k1/samsung/toolchain/linux/bin/clang
#
## stop editing here. Align your filesystem as per the script now.

export CLANG_TRIPLE=aarch64-linux-gnu-

pushd $SOURCE_DIR_ECTORY

## Set up output directory
rm -rf $OUTPUT_DIR_ECTORY
mkdir -p $OUTPUT_DIR_ECTORY

## Start building
export ARCH=arm64

export PROJECT_NAME=m23xq
export DTC_EXT=dtc
export KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j12 -C $(pwd) O=$OUTPUT_DIR_ECTORY CC=$KERNEL_LLVM_BIN CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE CONFIG_SECTION_MISMATCH_WARN_ONLY=y $KERNEL_MAKE_ENV ARCH=arm64 vendor/m23xq_swa_open_defconfig --no-print-directory

if [ $? -eq 0 ]; then
   make -j12 -C $(pwd) O=$OUTPUT_DIR_ECTORY CC=$KERNEL_LLVM_BIN CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE CONFIG_SECTION_MISMATCH_WARN_ONLY=y $KERNEL_MAKE_ENV ARCH=arm64 --no-print-directory

    if [ $? -eq 0 ]; then
       $(pwd)/tools/mkdtimg create $OUTPUT_DIR_ECTORY/arch/arm64/boot/dtbo.img --page_size=4096 $(find out/arch/arm64/boot/dts/samsung/m23/m23xq/ -name *.dtbo)

    fi

fi

popd
