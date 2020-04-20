#!/bin/bash

echo 'Installing latest package of go for the current OS'
echo

# Find the OS and get the download link
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  touch temp.txt
  echo "Current OS: Linux"
  echo 'Downloading golang file for Linux'
    rm -rf /usr/local/go
  ./downloadFile.sh linux
  export PATH=$PATH:/usr/local/go/bin
elif [[ "$OSTYPE" == "darwin" ]]; then
  touch temp.txt
  echo "Current OS: macOS"
  echo 'Downloading golang file for macOS'
  rm -rf /usr/local/go
  rm /etc/paths.d/go
  ./downloadFile.sh darwin
else
  echo "Current OS: Some other"
  echo 'Downloading golang src file (binaries)'
  ./downloadFile.sh src
fi
