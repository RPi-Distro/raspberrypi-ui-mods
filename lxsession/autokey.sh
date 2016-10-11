#!/bin/sh
if [ -e ${HOME}/.config/lxkeymap.cfg ]; then
  echo "lxkeymap found"
  lxkeymap --autostart
else
  if lsusb -d 1c4f:0027; then
	echo "Pi Keyboard"
	setxkbmap us
  elif lsusb -d 1c4f:0016; then
	echo "Black keyboard"
	setxkbmap gb
  else
	# /etc/default/keyboard contains system-wide default keyboard
	# settings, but for some reason those don't seem to get loaded
	# automatically during the X session setup. Running setxkbmap without
	# arguments loads the default settings, so let's do that here.
	setxkbmap
  fi
fi
