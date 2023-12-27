#!/bin/bash

list=mylinks

cd ~/scripts/ifdown
for f in $(cat $list)
do
 ./ifdown.sh $f
done
