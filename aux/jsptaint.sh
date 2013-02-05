#!/bin/sh
# JSP taint checking with graudit - PoC script
# Written by Wireghoul - http://www.justanotherhacker.com
# Released under the GPL licence
VERSION=0.1
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/check"
    exit 2
fi
graudit -z -d jsp "$1" | \
perl -ne 'if ($_ =~ m/(\S+)\s*=\s*request\./) { print "$1\n"; }' | \
sort | uniq | \
graudit -d - "$1"
