# imagefap album downloader

## Language

* bash
* python

# Install

## OS

Tested on Debian & Ubuntu

## Packages needed 
```bash
sudo apt update
sudo apt python3
pip install numpy
```

## Use default scripts dir
```bash
mkdir -p ~/scripts/ifdown
mkdir -p /data/pics/
```

## Clone the repo and make scripts executable : 
```bash
cd ~/scripts/ifdown

git clone _URL_

chmod u+x *.sh
chmod u+x *.py
```

# Use it

## Download imagefap album :

Album url exemple : https://www.imaginef.com/pictures/1234567/album_of_pic

```bash
cd ~/scripts/ifdown
chmod u+x ifdown.sh
./ifdown.sh
URL [https://*.com/abced/] : https://www.imaginef.com/pictures/1234567/album_of_pic
```

### with url in arg
```bash
./ifdown.sh https://www.imaginef.com/pictures/1234567/album_of_pic
```

The full pic album will be download in "/data/pics/*album_of_pic*"

## Download multiple imagefap album :
* insert multiple album links in ~/scripts/ifdown/list
exemples : 
```
https://www.imaginef.com/pictures/1234567/album_of_pic
https://www.imaginef.com/pictures/8912345/new_album
...
```
* launch the multi download script : 
```bash
cd ~/scripts/ifdown
./multi_ifdown.sh
```

Each album will be download in his album dir :
"/data/pics/*album_of_pic*"
"/data/pics/*new_album*"
