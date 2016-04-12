#!/bin/bash
set -e

docker build \
	--tag lqb10/jenkins-client \
	--build-arg="http_proxy=$http_proxy" \
	--build-arg="HTTP_PROXY=$HTTP_PROXY" \
	.
