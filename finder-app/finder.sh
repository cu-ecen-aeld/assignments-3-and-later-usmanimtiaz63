#!/bin/bash

if [ $# -eq 2 ]
then
	filedir=$1
	searchstr=$2

	if [[ ! -d $filedir ]]
	then
		echo "$1 is not a directory or it does not exist."
		exit 1
	fi
	totalfiles=$( find $filedir -type f | wc -l )
	totalmatch=$( grep -r "$searchstr" $filedir | wc -l )
	echo "The number of files are $totalfiles and the number of matching lines are $totalmatch"
else
	if [ $# -eq 0 ]
	then
		echo "Please specify directory and search string"
	elif [ $# -gt 2 ]
	then
		echo "Too many arguments"
	else
		echo "Please specify search string"
	fi
	exit 1
fi

