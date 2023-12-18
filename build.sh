#!/usr/bin/env bash
export AFFECTED=$(npx nx show projects --affected --target=build --exclude \*-e2e)
echo $AFFECTED
