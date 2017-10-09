#! /bin/bash
# For each file, output the name and then the contents
set -o nounset
set -o errexit

function launchConsole {
  mintty -i /Cygwin-Terminal.ico -e "source ${HOME}/Projects/Containers/git/Tools/at-Containers" - &
}

function usage {
  cat >&2 <<HELP
Usage:  [ opts | files.. ]
  --wksp: launch with "wksp-*" from a higher level directory
  --help: this message
HELP
}

function main {

  while [ $# -gt 0 ]; do
    case $1 in
    --wksp)
      echo >&2 "unable to find any workspace"
      exit 1;;
    --help)
      usage
      exit 0;;
    esac
  done

  launchConsole "$@"
}

main "$@"

