#!/bin/bash
GREP=`grep "$1" "./.gitignore"`
[ ! -f "./.gitignore" ] && touch "./.gitignore" && echo "File does not exist, making one."
if [ "$GREP" ]; then
	echo "File already exists in .gitignore"
else
	echo "$1" >> ./.gitignore
fi
