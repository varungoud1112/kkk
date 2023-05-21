#!/bin/bash -e

# Copyright (C) 2022 Shra1V32 <namanageshwar@outlook.com>
#        GitHub: https://github.com/Shra1V32

RED='\033[0;31m'
NC='\033[0m'

if [[ $OSTYPE == 'linux-android'* && $(echo "$TERMUX_VERSION" | cut -c 3-5) -ge "117" ]]; then
    dpkg -s git >>/dev/null 2>&1 || pkg install git -y
    git clone https://github.com/varungoud1112/kkk || {
        FILES='.tplaycreds .usercreds userDetails.json'
        for i in $FILES; do
            cp -frp "kkk/$i" .
        done
        rm -rf kkk
        git clone https://github.com/varungoud1112/kkk
        for i in $FILES; do
            cp "$i" "kkk/"
        done
    }
    cd kkk
    

elif [[ $OSTYPE == 'linux-gnu'* ]]; then
    dpkg -s git >>/dev/null 2>&1 || sudo apt install git -y
    git clone https://github.com/varungoud1112/kkk || {
        FILES='.tplaycreds .usercreds userDetails.json'
        for i in $FILES; do
            cp -frp "kkk/$i" .
        done
        rm -rf kkk
        git clone https://github.com/varungoud1112/kkk
        for i in $FILES; do
            cp "$i" "kkk/"
        done
    }
    cd kkk
    ./main.sh
elif [[ $(echo "$TERMUX_VERSION" | cut -c 3-5) -le "117" ]]; then
    echo -e "Please use Latest Termux release, i.e, from FDroid (https://f-droid.org/en/packages/com.termux/)"
    exit 1
else
    echo "Platform not supported"
    exit 1
fi
