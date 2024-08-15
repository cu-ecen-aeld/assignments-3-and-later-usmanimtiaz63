#!/bin/bash

if [ $# -eq 2 ]
then
	file=$1
	str=$2

	dir=$( dirname "$file" )

	if [ "$dir" != "" ]
	then
		mkdir -p "$dir"
        	if [ $? -ne 0 ]
        	then
                	echo "Unable to create parent directory of file"
        	        exit 1
	        fi

	fi

	touch "$file"

        if [ $? -ne 0 ]
        then
                echo "Unable to create file"
                exit 1
        fi

	echo "$str" > "$file"

	if [ $? -ne 0 ]
	then
		echo "Unable to write string to file"
		exit 1
	fi
else
	if [ $# -eq 0 ]
	then
		echo "Please specify file and string to write"
	elif [ $# -gt 2 ]
	then
		echo "Too many arguments"
	else
		echo "Please specify string to write"
	fi
	exit 1
fi

