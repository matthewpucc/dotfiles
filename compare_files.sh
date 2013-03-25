#!/bin/bash

mismatched() {
  WHAT=$1
  echo "$WHAT is mismatched"
  if [[ -f ~/$WHAT && -f ./$WHAT ]]; then
    diff $WHAT ~/$WHAT
  else
    [ -f "~/$WHAT" ] && echo "~/$WHAT is missing"
    [ -f "$WHAT" ] && echo "$WHAT is missing"
  fi
  echo
}

for FILE in .aliases .bash_profile .bash_prompt .bashrc .brew .exports .functions .gitattributes .gitconfig .gitignore .gvimrc .inputrc .linux .osx .osx_specific .screenrc .vimrc .wgetrc
do
  [ "`md5sum $FILE | awk '{print $1}'`" = "`md5sum ~/$FILE | awk '{print $1}'`" ] && echo "$FILE is good" || mismatched "$FILE"
done