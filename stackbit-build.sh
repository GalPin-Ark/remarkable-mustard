#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb076dced1a5000191427fa/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb076dced1a5000191427fa
curl -s -X POST https://api.stackbit.com/project/5eb076dced1a5000191427fa/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb076dced1a5000191427fa/webhook/build/publish > /dev/null
