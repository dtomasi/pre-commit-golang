#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    echo "Please add `args: [--package=]` in your pre-commit config"
    exit 1
fi

for i in "$@"; do
  case $i in
    -p=*|--package=*)
      PACKAGE="${i#*=}"
      shift # past argument=value
      ;;
    -v=*|--version=*)
      VERSION="${i#*=}"
      shift # past argument=value
      ;;
    *)
      # unknown option
      ;;
  esac
done

exec go install "${PACKAGE}@${VERSION:-latest}"
