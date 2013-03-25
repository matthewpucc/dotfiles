#!/bin/bash
cd "$(dirname "$0")"

function doIt() {

	if ! [[ "$OSTYPE" =~ ^darwin ]]; then
		NO_OSX="--exclude '.osx*'"
	fi
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "compare_files.sh" --exclude "bootstrap.sh" --exclude "README.md" $NO_OSX -av . ~	
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile