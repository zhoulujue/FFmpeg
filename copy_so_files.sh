#!/bin/bash
OUTDIR=/Users/michael/ffmpegbuilddir/ffmpeg-install-dir/arm/lib
TARGETDIR=/Users/michael/Developer/code/CodeLocal/ffmpeg-commands-executor-library/library/jni/prebuilt/armeabi

function xcf {
	currentDir=$(pwd -L)
	echo $currentDir
	
	cd $OUTDIR

	for name in $(ls *-*.so | xargs -n1)
	do
		targertName=$(echo $name | awk -F "-" '{print $1}')
		echo $targertName
		suffix=.so
		cp $name $TARGETDIR/$targertName$suffix
	done

	cd $currentDir
}
xcf


