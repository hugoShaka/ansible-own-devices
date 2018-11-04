#!/bin/sh

# Script stolen from Lindenk's dotfiles :
# https://github.com/Lindenk/dotfiles/blob/master/desktop/gpg/scripts/pinentry-rofi.sh

echo "OK"
while read cmd rest; do
    cmd=$(printf "%s" "$cmd" | tr 'A-Z' 'a-z')
    if [ -z "$cmd" ]; then
        continue;
    fi
    case "$cmd" in
        \#*)
        ;;
        getpin)
            _PP=$(echo "" | DISPLAY=:0 rofi -dmenu -password -p "Passphrase: " -theme purple -lines 0)
            echo "D $_PP"
            echo "OK"
            ;;
        bye)
            echo "OK"
            exit 0
            ;;
        *)
            echo "OK"
            ;;
    esac
done
