#!/bin/sh
#
# SO2 - Networking Lab (#10)
#
# Test script for exercise #3
#

set -x

# list all currently listening servers and active connections
# for both TCP and UDP, and don't resolve hostnames
netstat -tuan

