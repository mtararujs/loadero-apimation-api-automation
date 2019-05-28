#!/usr/bin/env bash
# https://github.com/adrienverge/yamllint
# https://stackoverflow.com/a/21699210

errcount=0
ErrorHandler () {
    (( errcount++ ))
}

trap ErrorHandler ERR

shopt -s globstar
for f in **/*.yaml; do
  yamllint -d "{extends: default, rules: {line-length: disable}}" "$f"
done

exit $errcount
