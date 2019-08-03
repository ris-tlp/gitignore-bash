#!/bin/bash
usage()
{
  echo "Usage: $0 [ -a FILE_TO_ADD ] [ -r FILE_TO_REMOVE ]"
  exit 1;
}

add_file()
{
  GREP=`grep "$1" "./.gitignore"`
  if [ "$GREP" ]; then
    echo "File already exists in .gitignore"
  else
    echo $1 >> "./.gitignore"
  fi
}

remove_file()
{
  GREP=`grep "$1" "./.gitignore"`
  if [ "$GREP" ]; then
    sed -i "/$1/d" ./.gitignore
  else
    echo "$1 does not exist."
  fi
}

unset GREP
[ ! -f "./.gitignore" ] && touch "./.gitignore" && echo "File does not exist, making one."

while getopts 'a:r:h' c
do
  case $c in
    a) add_file $OPTARG ;;
    r) remove_file $OPTARG ;;
    *|h) usage ;;
  esac
done
