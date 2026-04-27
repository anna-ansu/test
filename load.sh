#!/bin/bash

DB="system/test@//oracle:1521/XEPDB1"

for f in /data/incoming/*.txt
do
[ -e "$f" ] || continue

echo "Loading $f"

sqlldr $DB 
control=/data/data.ctl 
data="$f" 
log=/data/logs/$(basename "$f").log 
bad=/data/logs/$(basename "$f").bad

if [ $? -eq 0 ]; then
echo "SUCCESS: $f"
mv "$f" /data/processed/
else
echo "FAILED: $f"
mv "$f" /data/error/
fi
done

echo "DONE"
