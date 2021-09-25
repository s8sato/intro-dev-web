#!/bin/bash
sudo pg_ctlcluster 12 main start
cd ~/clones/sprig/web
elm reactor &
cd ../api
target/debug/api
