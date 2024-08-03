#!/bin/bash

# Copyright (c) 2022 Alex313031.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0='\033[0m' # Reset Text
bold='\033[1m' # Bold Text
underline='\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${GRE}Script to build nvtop on Linux.${c0}\n" &&
	printf "${bold}${YEL}Use the --build flag to build${c0}\n" &&
	printf "${bold}${YEL}Use the --clean flag to clean build artifacts${c0}\n" &&
	printf "${bold}${YEL}Use the --help flag to show this help${c0}\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

buildNvtop () {
printf "\n" &&
printf "${bold}${GRE}Script to build nvtop on Linux.${c0}\n" &&
printf "${YEL}Building nvtop...\n" &&
printf "${CYA}\n" &&

# Build nvtop
export NINJA_SUMMARIZE_BUILD=1 &&

mkdir -p ./build &&

cd build &&

cmake .. -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON -DINTEL_SUPPORT=ON &&

make VERBOSE=1 V=1 &&

printf "\n" &&
printf "${GRE}${bold}Build Completed. ${YEL}${bold}You can now cd to `build` and run `sudo make install` to install it.\n" &&
printf "\n" &&
tput sgr0
}
case $1 in
	--build) buildNvtop; exit 0;;
esac

cleanNvtop () {
printf "\n" &&
printf "${YEL}Cleaning build artifacts...${c0}\n" &&
printf "\n" &&

rm -r -f -v ./build

printf "\n" &&
printf "${GRE}${bold}Done.\n" &&
printf "\n" &&
tput sgr0
}
case $1 in
	--clean) cleanNvtop; exit 0;;
esac

printf "\n" &&
printf "${bold}${GRE}Script to build nvtop on Linux.${c0}\n" &&
printf "${bold}${YEL}Use the --build flag to build${c0}\n" &&
printf "${bold}${YEL}Use the --clean flag to clean build artifacts${c0}\n" &&
printf "${bold}${YEL}Use the --help flag to show this help${c0}\n" &&
printf "\n" &&
tput sgr0
