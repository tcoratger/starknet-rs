#!/bin/sh

set -x
set -e

compile () {
  starknet-compile --single-file $1 "${2}_sierra.txt"
  starknet-sierra-compile "${2}_sierra.txt" "${2}_compiled.txt"
  chown $USER_ID:$GROUP_ID "${2}_sierra.txt"
  chown $USER_ID:$GROUP_ID "${2}_compiled.txt"
}

compile "/contracts/erc20.cairo" "/artifacts/erc20"
compile "/contracts/trivial.cairo" "/artifacts/trivial"
