#!/bin/bash
set -e

docker run -it -u jenkins \
	jenkins-client /bin/bash
