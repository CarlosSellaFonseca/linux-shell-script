#!/bin/bash

img_convert(){
local img_path=$1
local img_without_ext=$(ls $img_path | awk -F. '{ print $1 }')
convert $img_without_ext.jpg $img_without_ext.png
}

dir_scan(){
cd $1
for obj in *
do
	local obj_path=$(find ~/Documentos/new-books-imgs -name $obj)
	if [ -d $obj_path ]
	then
		dir_scan $obj_path
	else
		img_convert $obj_path
	fi
done
}

dir_scan ~/Documentos/new-books-imgs
if [ $? -eq 0 ]
then
	echo "Files were converted successfuly"
else
	echo "Error occurred while converting the files"
fi
