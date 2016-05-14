#!/bin/sh
# This is a install shell for automatic download and set env
# FreeSmall Added
# 2016-5-14

app_name='LinuxCustomTools'
[ -z $LCT_PATH ] && LCT_PATH="$HOME/.lcts"
[ -z $LCT_URL ] && LCT_URL='https://github.com/FreeSmall/LinuxCustomTools.git'
[ -z $LCT_BRANCH ] && LCT_BRANCH='master'

msg() {
    printf '%b\n' "$1" >&2 ## %b is for escape characters
}

success() {
    msg "\e[32m[✔]\e[0m $1$2"
}

error() {
    msg "\e[31m[✘]\e[0m $1$2"
    exit 1
}

lct_sync() {
    if [ ! -e "$LCT_PATH" ]; then
        git clone -b "$LCT_BRANCH" "$LCT_URL" "$LCT_PATH"
        if [ "$?" == '0' ]; then
            success "Successfully cloned $app_name"
        else
            error
        fi
    else
        cd "$LCT_PATH" && git pull origin "$LCT_BRANCH"
        if [ "$?" == '0' ]; then
            success "Successfully updated $app_name"
        else
            error
        fi
    fi
}

add_path() {
    sed -i '/\$HOME\/\.lcts/d' $HOME/.bashrc
    echo "export PATH=\$PATH:\$HOME/.lcts" >> "$HOME/.bashrc"
}

#------ main--------

lct_sync
add_path

rm -- $0 ## delete itself
