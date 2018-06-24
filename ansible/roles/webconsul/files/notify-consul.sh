#!/bin/sh

DATE=`date +%s`
/usr/local/bin/curl -X PUT --data-bin $DATE 'http://consul.my.domain:8500/v1/kv/letsencrypt/timestamp'
