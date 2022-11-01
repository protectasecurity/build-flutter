#!/bin/bash

set -u

function main() {

    if [ "${INPUT_TYPE}" == "" ]; then
        echo "Build type cannot be empty"
        exit 1
	fi

    if [ "${INPUT_TYPE}" != "web" ]; then
        echo "Build type not supported"
        exit 1
	fi

    if [ "${INPUT_WORKSPACE}" != "" ]; then
        cd ${INPUT_WORKSPACE}
    fi

    echo "Run flutter build for web project"
    set -o pipefail

    flutter pub get && \
    flutter build ${INPUT_TYPE} ${INPUT_PARAMS} && \
    cp -R build/${INPUT_TYPE} ${GITHUB_WORKSPACE}/dist

    exitCode=${?}

    set +o pipefail
    echo "status=${exitCode}" >> $GITHUB_OUTPUT

    if [ "${exitCode}" != "0" ]; then
        echo "Flutter build has failed. See above console output for more details."
        exit 1  
    fi
}

main
