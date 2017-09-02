#!/bin/sh

DATE=`date +%s`
/usr/local/bin/curl -X PUT --data-bin $DATE 'http://127.0.2.1:8500/v1/kv/letsencrypt/timestamp'
