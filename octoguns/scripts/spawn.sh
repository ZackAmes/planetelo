#!/usr/bin/env bash
set -euo pipefail
pushd $(dirname "$0")/..

export RPC_URL="http://localhost:5050";

export WORLD_ADDRESS=$(cat ./manifests/dev/deployment/manifest.json | jq -r '.world.address')

# sozo execute --world <WORLD_ADDRESS> <CONTRACT> <ENTRYPOINT>
sozo execute mapmaker default_map --world $WORLD_ADDRESS 
sozo execute planetelo create_playlist --world $WORLD_ADDRESS -c 1,0,300,3,1,100,400

