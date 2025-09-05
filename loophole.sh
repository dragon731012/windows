#!/bin/bash

if ! command -v loophole &> /dev/null
then
        echo "Loophole is not installed. Installing..."
        cd ~
        wget https://github.com/loophole/cli/releases/download/1.0.0-beta.15/loophole-cli_1.0.0-beta.15_linux_64bit.tar.gz
	tar -xzf loophole-cli_1.0.0-beta.15_linux_64bit.tar.gz
        cd loophole-cli_1.0.0-beta.15_linux_64bit
        mv loophole /usr/local/bin/
        chmod +x /usr/local/bin/loophole
        cd ~
        echo "Loophole installed successfully."
	loophole account login
fi

PORT=8081

if [ -f "s.txt" ]; then
	echo "Loading subdomain..."
	SUBDOMAIN=$(cat "s.txt")
	echo "Subdomain is:"
	echo $SUBDOMAIN
	echo "Change this subdomain by editing the s.txt file!"
else
	echo "What subdomain would you like?"
	read SUBDOMAIN
	echo $SUBDOMAIN > s.txt
	echo "Subdomain saved!"
fi


while true; do
        echo "Loophole starting..."
        loophole http $PORT --hostname=$SUBDOMAIN
        echo "Loophole crashed! Restarting..."
        sleep 5
done
