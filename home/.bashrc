#!/run/current-system/sw/bin/bash

if [ -f ~/.bash_aliases ] ; then
	. ~/.bash_aliases
fi

export PATH="/home/laura/scripts:$PATH"

function wifi() {
	nmtui
}
export -f wifi

function write() {
	mkdir -p ~/stories
	cd ~/stories
	micro
}
export -f write

fastfetch

echo "Hi, Laura! Welcome to your writing terminal!"
echo "To begin, please type the following command: write"
