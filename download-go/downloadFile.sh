#!/usr/bin/env bash

touch temp.txt
curl -L "https://golang.org/dl/" |
grep -Eoi '^<a [^>]+>' |
grep -Eo '(http|https)://[a-zA-Z0-9./?=_-]*' |
grep $1 > temp.txt
link = cat temp.txt
rm temp.txt

touch temp.txt
grep -Eo 'go[a-zA-Z0-9.-]*' |
grep $1 > temp.txt
fileName = cat temp.txt

echo 'link is: ' $link

# Downlad the file
wget $link
if[[ $1 == "darwin")]]; then
  echo "Run the .pkg file to complete the Installing GO on macOS"
else
  echo "please enter sudo password when prompted"
  sudo tar -C /usr/local -xzf $fileName
fi
