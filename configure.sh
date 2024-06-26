#!/usr/bin/env bash

readonly PROGNAME=$(basename "$0")
readonly PROGDIR="$(cd "$(dirname "$0")"; pwd)"
readonly GIT_DIR="$(git rev-parse --git-dir)"

export GIT_DIR

. "$PROGDIR/hooks/hook_switcher.sh"

main() {
	local hookName
	for directory in $(find "$PROGDIR/hooks" -type d | sort | \
	awk '$0 !~ last "/" {print last} {last=$0} END {print last}')
	do
		hookName=${directory#$PROGDIR/hooks/}
		echo "Configuring $hookName"
		switch_hook "$hookName"
		find "$directory" -name configure.sh -exec {} \;
	done
}

main
