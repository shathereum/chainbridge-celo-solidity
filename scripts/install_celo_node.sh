#!/usr/bin/env bash
# Copyright 2020 ChainSafe Systems
# SPDX-License-Identifier: LGPL-3.0-only


# Exit on failure
set -eux

git clone --depth 1 git@github.com:celo-org/celo-blockchain.git --branch celo-v1.0.1 --single-branch
cd celo-blockchain
make geth
env GOBIN=$PWD/build/bin go install ./cmd/abigen
mkdir -p ~/.local/bin
ln -f -s  $PWD/build/bin/abigen  ~/.local/bin/celo-abigen
