#! /bin/bash
# For each file, output the name and then the contents
set -o nounset
set -o errexit

readonly ECLIPSE="Eclipse-oxygen/eclipse/eclipse.exe"

function newEclipse {
  "${ECLIPSE}" -showlocation "$@" &
}

function findWksp {
  echo "wksp-oxygen"
}

function usage {
  cat >&2 <<HELP
Usage: $(basename "$0") [ opts | files.. ]
  --help: this message
HELP
}

function main {

  while [ $# -gt 0 ]; do
    case $1 in
    --help)
      echo "Using workspace ${wksp}"
      newLuna -nosplash -data "${wksp}" "$@"
      usage
      exit 0;;
    esac
  done

  newEclipse "$@"
}

main "$@"
