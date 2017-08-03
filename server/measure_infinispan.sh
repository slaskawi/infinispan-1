#!/usr/bin/env bash

while true ; do
  echo "---- JStat ----"
  jstat -gccause $1

  echo "---- VM Flags ----"
  jcmd $1 VM.flags

  echo "---- NMT ----"
  jcmd $1 VM.native_memory summary

  echo "---- PMAP ----"
  pmap -x $1 | tail -1

  echo "---- Free [kB] ----"
  free -k

  echo "---- Memory stat ----"
  cat /sys/fs/cgroup/memory/memory.stat

  used=$(cat /sys/fs/cgroup/memory/memory.usage_in_bytes)
  limit=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)
  echo "---- Memory usage [KB] ----"
  echo "$((used/1024))"

  echo "---- Memory limit [kB] ----"
  echo "$((limit/1024))"

  echo "---- Fail count ----"
  cat /sys/fs/cgroup/memory/memory.failcnt

  echo "---- Usage ratio ----"
  echo $((used*100/limit))

  echo "---- DStat ----"
  dstat -cmsa 1 5

  echo "---- $(date) ----"
done


