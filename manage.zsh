#!/bin/zsh
emulate -LR zsh

OK='[\033[1;32mOK\033[0m]\t'
WARN='[\033[1;33mWARN\033[0m]\t'
ERROR='[\033[1;31mERROR\033[0m]\t'
BUILDING='\033[1;33m ___                      ___       ___
/\  \                    /\  \     /\  \\
\ \  \                   \ \  \    \ \  \\
 \ \  \_____  ___  ___  __\ \  \  __\_\  \\  __  ______  ______
  \ \  \__  \/\  \/\  \/\  \ \  \/\   _\  \/\ \/\  __ \/\  __ \\
   \ \  \_\  \ \  \_\  \ \  \ \  \ \  \_\  \ \ \ \ \ \ \ \ \_\ \\
    \ \_______\ \_______\ \__\ \__\ \_______\ \_\ \_\ \_\ \___  \\
     \/_______/\/_______/\/__/\/__/\/_______/\/_/\/_/\/_/\/___/\ \\
 _____________________________________________________________\_\ \\
/\_________________________________________________________________\\
\/_________________________________________________________________/\033[0m\t'
USAGE='Usage: ./manage.sh [build/usage]'

BUILD_NAME='atfal-khateera'
SRC_FILES='src/main.c'

assert() {
    exit_code=$?
    [ $exit_code = 0 ] && ([ -z $1 ] || echo $OK$1) || (
    [ -z $2 ] || echo $ERROR$2 - exit code:$exit_code)
}

case ${1:-'usage'} in
    build)
        echo $BUILDING
        echo ${WARN}build at build/$BUILD_NAME
        mkdir -p build
        clang -g -Wall $SRC_FILES -o build/$BUILD_NAME
        assert "built successfully" "build failed"  ;;
    usage)
        echo $WARN$USAGE ;;
    *)
        echo $ERROR$USAGE ;;
esac
