#!/bin/sh
#get the file mode by number
# zhaoyang.peng@tcl.com 2016-5-12

function getmode {
 [ "$#" -ne 1 ] && echo "param must be only one" && exit 1
 [ ! -e "$1" ] && echo "the file is not exist!" && exit 1

 result=$(ls -ld $1 | gawk '{print $1}')
 mode=${result:1}
 owner=${mode:0:3}
 group=${mode:3:3}
 other=${mode:6:3}
 #echo $owner $group $other
 #nperm=$(echo $mode | sed -e 's/rw[x|s|t]/7/;s/--[-|S|T]/0/;s/--[x|s|t]/1/;s/-w[-|S|T]/2/;s/-w[x|s|t]/3/;s/r-[-|S|T]/4/;s/r-[x|s|t]/5/;s/rw[-|S|T]/6/')

 ownerval=$(echo $owner | sed -e 's/rw[x|s|t]/7/;s/--[-|S|T]/0/;s/--[x|s|t]/1/;s/-w[-|S|T]/2/;s/-w[x|s|t]/3/;s/r-[-|S|T]/4/;s/r-[x|s|t]/5/;s/rw[-|S|T]/6/')
 groupval=$(echo $group | sed -e 's/rw[x|s|t]/7/;s/--[-|S|T]/0/;s/--[x|s|t]/1/;s/-w[-|S|T]/2/;s/-w[x|s|t]/3/;s/r-[-|S|T]/4/;s/r-[x|s|t]/5/;s/rw[-|S|T]/6/')
 otherval=$(echo $other | sed -e 's/rw[x|s|t]/7/;s/--[-|S|T]/0/;s/--[x|s|t]/1/;s/-w[-|S|T]/2/;s/-w[x|s|t]/3/;s/r-[-|S|T]/4/;s/r-[x|s|t]/5/;s/rw[-|S|T]/6/')
 nperm=$ownerval$groupval$otherval

 local suid=0
 local sgid=0
 local sticky=0

 if [ "${owner:2:1}" == "s" ] || [ "${owner:2:1}" == "S" ];then
     suid=4
 fi

 if [ "${group:2:1}" == "s" ] || [ "${group:2:1}" == "S" ];then
     sgid=2
 fi

 if [ "${other:2:1}" == "t" ] || [ "${other:2:1}" == "T" ];then
     sticky=1
 fi

 sperm=$[$suid +  $sgid +  $sticky]

 echo $sperm$nperm
}

getmode $@
