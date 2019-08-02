#!/bin/sh
set -e

gitRepo=$1
pat=$2
srcDir=/home/dev/src
gitDir=${gitRepo##*/}
#gitDir=$gitRepo | rev | cut -d / -f1 | rev
cd $srcDir

if [ -d "${gitDir}" ] 
then
    echo "$gitRepo already cloned" 
    exit 0
fi

if [ "$pat" != "NOTSET" ]
then
    echo "cloninng git repo $gitRepo"
    git clone "https://$pat@$gitRepo"
    echo "git repo cloned successfully"
fi