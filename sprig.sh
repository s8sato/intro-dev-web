#!/bin/bash
sudo pg_ctlcluster 12 main start
cd ~/works/sprig/web
elm reactor &
cd ../api
target/debug/api
