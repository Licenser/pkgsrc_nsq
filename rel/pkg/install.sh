#!/usr/bin/bash

case $2 in
    PRE-INSTALL)
        ;;
    POST-INSTALL)
        for manifest in nsqadmin.xml nsqd.xml nsqlookupd.xml
        do
	        svccfg import /opt/local/lib/svc/manifest/$manifest
        done
        ;;
esac
