#!/bin/bash

filesdir="$1"
searchstr="$2"

# make sure both filesdir and searchstr are specified
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
	echo "Please specify a directory to search and a string to search for."
	echo " Usage: finder.sh <search directory> <search string>"
	exit 1
fi

# check if filesdir exists and exit with an error if not
if [ ! -d "$filesdir" ]; then
	echo "Search directory ${filesdir} does not exist!"
	exit 1
fi

# get number of files in filesdir (recursing through subdirectories as well)
count=$(find "${filesdir}" -type f -printf '.' | wc -c)

# get total number of lines that match our search string
total_matches=$(grep -r "${searchstr}" "${filesdir}" | wc -l)

# print the results!
echo "The number of files are ${count} and the number of matching lines are ${total_matches}"
