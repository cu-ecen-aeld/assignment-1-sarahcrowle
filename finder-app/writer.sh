#!/bin/bash

writefile="$1"
writestr="$2"

# make sure we have both args
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
	echo "Please specify a file to write to and a string to write to the file."
	echo " Usage: writer.sh <file> <string>"
	exit 1
fi

# set up an error handler in case creating or writing the file fails
trap 'echo "Error creating or writing file!"; exit 1' ERR

# create the path and write the file
mkdir -p "$(dirname ${writefile})"
echo "${writestr}" > "${writefile}"
