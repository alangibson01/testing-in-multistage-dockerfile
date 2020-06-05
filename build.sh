#!/usr/bin/env bash

# Environment variable to enable building with buildkit.
export DOCKER_BUILDKIT=1

# Build and image and run tests.
docker build -t my-test-image .
build_result=$?

if [ "${build_result}" = "0" ]; then
  # Tests passed, so build and tag the application image without the test stage.
  docker build -t my-application-image .
  build_result=$?
fi

exit ${build_result}
