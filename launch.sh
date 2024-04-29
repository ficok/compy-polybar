#!/bin/bash

compyFile=~/.COMPY
simplishaFile=~/.SIMPLISHA

test -e $simplishaFile
if [ $? -eq 0 ]; then
    mv $compyFile $simplishaFile
fi

DIR="$HOME/.config/polybar/compy"
export POLYBAR="compy"

pkill polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c "$DIR"/config.ini &
