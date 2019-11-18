#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

IFS=$'\n\t'
# set -o xtrace

# create the directories for the docker volumes
mkdir -p volumes/{config,file,logs}

# populate the vault.json config file
cat > volumes/config/vault.json << EOF
{
  "backend": {
    "file": {
      "path": "/vault/file"
    }
  },
  "listener": {
    "tcp":{
      "address": "0.0.0.0:8200",
      "tls_disable": 1
    }
  },
  "ui": true
}
EOF