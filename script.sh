#!/bin/bash

PATH=./.gitignore
[ ! -f $PATH ] && eval touch $PATH

if eval grep -R "$1" "$PATH"
then
	eval echo "File already exists in gitignore."
else
	eval cat "$1" >> "$PATH"
fi

