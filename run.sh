#!/usr/bin/env bash

set -eo pipefail

DC="${DC:-exec}"

# If we're running in CI we need to disable TTY allocation for docker-compose
# commands that enable it by default, such as exec and run.
TTY=""
if [[ ! -t 1 ]]; then
  TTY="-T"
fi

function _dc {
  docker-compose "${DC}" ${TTY} "${@}"
}

function _aws {
    aws --endpoint-url=http://localhost:4566 "${@}"
}

function _build_run_down {
  docker-compose build
  docker-compose run ${TTY} "${@}"
  docker-compose down
}

function up {
    docker-compose up
}

function {
    echo "Generating infrastructure"
    go run main.go > sns.yaml
}

function sns {
    _aws sns "${@}"
}


function help {
  printf "%s <task> [args]\n\nTasks:\n" "${0}"

  compgen -A function | grep -v "^_" | cat -n

  printf "\nExtended help:\n  Each task has comments for general usage\n"
}

"${@:-help}"