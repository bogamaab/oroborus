#!/bin/bash -e

# If running the rails server then create or migrate existing database
if [ "${1}" == "./bin/rails" ] && [ "${2}" == "server" ]; then
  ./bin/rails db:prepare
fi

bin/rails tailwindcss:watch &
PIDS=$!

exec "${@}"

kill $PIDS
