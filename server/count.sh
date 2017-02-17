#!/bin/sh

/opt/jboss/infinispan-server/bin/ispn-cli.sh -c --controller=$(hostname -i):9990 '/subsystem=datagrid-infinispan/cache-container=clustered/distributed-cache=transactions:query' | grep -i "number-of-entries"