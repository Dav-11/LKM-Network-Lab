#!/bin/sh
#
# SO2 - Networking Lab (#10)
#
# Test script for exercise #1
#

# listen for connections on localhost, port 60000 (run in background)
nc -l -p 60000 &

# wait for netcat to start listening
sleep 1

# connect to localhost, port 60000, starting a connection using local
# port number 600001;
echo "Should show up in filter." | nc -q 2 127.0.0.1 60000

# look for filter message in dmesg output
echo "Check dmesg output."
