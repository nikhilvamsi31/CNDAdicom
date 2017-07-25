#!/bin/bash

PATH=$PATH:/nrgpackages/tools/dcmtk/bin

for h in ./*; do
    #echo $h;
    if [ -d $h/arc001 ]; then
        firstSession=`find $h/arc001 -mindepth 1 -maxdepth 1 -type d | head -1`
        if [ -d $firstSession ]; then
            file=`find $firstSession -type f -name '*.dcm' | head -1`
            bodyPart=`dcmdump --search 18,15 $file | cut -d[ -f2 | cut -d] -f1`
            proc=`dcmdump --search 32,1060 $file | cut -d[ -f2 | cut -d] -f1`
            echo $h,$bodyPart,$proc
        fi
    fi
done
