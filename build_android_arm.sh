#!/bin/bash
export TMPDIR=/Users/michael/ffmpegbuilddir/temp/
NDK=/Users/michael/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-16/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=arm
PREFIX=/Users/michael/ffmpegbuilddir/ffmpeg-install-dir/arm/
ADDI_CFLAGS="-marm"

# 加入x264编译库
EXTRA_DIR=./../XCFx264/x264/build/android
EXTRA_CFLAGS="-I./${EXTRA_DIR}/include"
EXTRA_LDFLAGS="-L./${EXTRA_DIR}/lib"

function build_one
{
./configure \
--prefix=$PREFIX \
--enable-gpl \
--enable-libx264 \
--enable-shared \
--enable-filter=crop \
--enable-filter=rotate \
--enable-filter=scale \
--disable-encoders \
--enable-encoder=mpeg4 \
--enable-encoder=aac \
--enable-encoder=png \
--enable-encoder=libx264 \
--disable-decoders \
--enable-decoder=mpeg4 \
--enable-decoder=h264 \
--enable-decoder=aac \
--enable-parser=h264 \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS $EXTRA_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS $EXTRA_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install

}

build_one
say "Your building has been completed!"