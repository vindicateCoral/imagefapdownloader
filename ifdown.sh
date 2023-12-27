#!/bin/bash
#
# Imagefap album downloader
#
# with bash and python, enjoy ;)
#

# vars
sdir=~/scripts/ifdown # script dir
dest=/data/pics/ # downlaod dest
pyscript=pyifdl.py # python script to get full img

# functions
function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

# get param
while [ $# -ge 1 ];do
    case "$1" in
        *)
            url=$1
            ;;
    esac
    shift
done

# ask url if no param
if [ -z "$url" ]; then
  read -p "URL [https://*.com/abced/] :" url
fi

# imagefap album name
dir_name_tmp=$(echo $url | awk -F "/" '{print $6}')
# real name with url decode
dir_name=$(urldecode $dir_name_tmp)

# links file write by python script
link_list=$(echo $dir_name".txt" ) 

echo -e "Dest : ${dest}${dir_name}"
echo -e "link_list: ${sdir}/${link_list}\n"

# if dest exist : exit
if [ -d ${dest}${dir_name} ];then
	echo -e "...Already download...next"
	exit
fi

# get links in file
cd $sdir
python3 $pyscript $url

# if links file is empty exist
if [ ! -s "$link_list" ];then
       echo "Empty links file $link_list ! ... exit"
       exit
fi

# create and go to dest
mkdir -p ${dest}${dir_name}
cd ${dest}${dir_name}

echo -en "Download $(cat ${sdir}/${link_list} | wc -l) pics :"
for f in $(cat ${sdir}/${link_list});
do
	echo -en "."
	fname=$(echo $f | awk -F "?" '{print $1}' |  awk -F "/" '{print $8}')
	#curl -s $f -o $fname
	wget -q -c --no-use-server-timestamps $f -O $fname &
done
wait
rm ${sdir}/${link_list} -f
echo -e "Finish.\n"
