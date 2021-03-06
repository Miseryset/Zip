#!/system/bin/sh

grep_prop() {
  local findfor="s/^$1=//p"
  cat $2 2>/dev/null | dos2unix | sed -n "$findfor" | head -n 1
}

deco(){
	rnd=$((${RANDOM}%35+1))
	if [ $rnd == 1 ];then
		_deco="๐ฆ"
	elif [ $rnd == 2 ];then
		_deco="๐ฆ"
	elif [ $rnd == 3 ];then
		_deco="๐น"
	elif [ $rnd == 4 ];then
		_deco="๐ท"
	elif [ $rnd == 5 ];then
		_deco="๐"
	elif [ $rnd == 6 ];then
		_deco="๐ธ"
	elif [ $rnd == 7 ];then
		_deco="๐บ"
	elif [ $rnd == 8 ];then
		_deco="๐ผ"
	elif [ $rnd == 9 ];then
		_deco="๐ฌ"
	elif [ $rnd == 10 ];then
		_deco="๐ญ"
	elif [ $rnd == 11 ];then
		_deco="๐"
	elif [ $rnd == 12 ];then
		_deco="๐"
	elif [ $rnd == 13 ];then
		_deco="๐"
	elif [ $rnd == 14 ];then
		_deco="๐"
	elif [ $rnd == 15 ];then
		_deco="๐"
	elif [ $rnd == 16 ];then
		_deco="๐"
	elif [ $rnd == 17 ];then
		_deco="๐"
	elif [ $rnd == 18 ];then
		_deco="๐"
	elif [ $rnd == 19 ];then
		_deco="๐"
	elif [ $rnd == 20 ];then
		_deco="๐ฎ"
	elif [ $rnd == 21 ];then
		_deco="๐"
	elif [ $rnd == 22 ];then
		_deco="โค๏ธ"
	elif [ $rnd == 23 ];then
		_deco="๐"
	elif [ $rnd == 24 ];then
		_deco="๐งก"
	elif [ $rnd == 25 ];then
		_deco="๐"
	elif [ $rnd == 26 ];then
		_deco="๐"
	elif [ $rnd == 27 ];then
		_deco="๐"
	elif [ $rnd == 28 ];then
		_deco="๐ค"
	elif [ $rnd == 29 ];then
		_deco="๐"
	elif [ $rnd == 30 ];then
		_deco="๐"
	elif [ $rnd == 31 ];then
		_deco="๐"
	elif [ $rnd == 32 ];then
		_deco="๐"
	elif [ $rnd == 33 ];then
		_deco="๐"
	elif [ $rnd == 34 ];then
		_deco="๐"
	else
		_deco="๐"
	fi
}

if [[ $1 == "" ]]; then

	_default=/dev/tmp/module.prop
	_tonew=/data/adb/modules_update
	_tonew2=`ls -dt $_tonew/* | head -n 1` >/dev/null 2>&1
	after='module.prop'
	
elif [[ $1 == "-h" || $1 == "-help" ]]; then
	
	echo ''
	echo '---  _Display by Miseryset'
	echo ''
	echo '---  ้ป่ฎคๅค็ๆพ็คบ  module.prop  '
	echo '---  ๆๅฎๅค็ๆพ็คบๆ ผๅผ  _Display ็ปๅฏน่ทฏๅพ/module.prop ๅค็ๅ็ไฝ็ฝฎ  '
	echo '---  ่ฅไธๆๅฎ  ๅค็ๅ็ไฝ็ฝฎ  ๏ผๅๅจๅ่ทฏๅพไธ็ๆ  exe_module.prop  '
	echo '---  ็คบไพ๏ผ'
	echo '---  _Display /dev/tmp/module.prop'
	echo '---  _Display /dev/tmp/module.prop /data/adb/modules_update/xxx  '
	echo ''
	
	exit
	
elif [[ $2 == "" ]]; then

	_default=$1
	_tonew2=${1%/*}
	after='exe_module.prop'
		
else

	_default=$1
	_tonew2=$2
	if [[ "${1%/*}" == "$2" ]]; then
		after='exe_module.prop'
	else
		after='module.prop'
	fi
	
fi

if [[ ! -e $_default ]]; then
	echo '---  ๆชๆพๅฐ  module.prop  ๏ผ่ฏทๆฃๆฅ  ๆ ผๅผ้่ฏฏ  ๆ  ๆไปถไธๅญๅจ  '
	exit
fi


Mod_id=`grep_prop 'id' $_default`
Mod_name=`grep_prop 'name' $_default`
Mod_version=`grep_prop 'version' $_default`
Mod_versionCode=`grep_prop 'versionCode' $_default`
Mod_author=`grep_prop 'author' $_default`
Mod_description=`grep_prop 'description' $_default`
Mod_updateJson=`grep_prop 'updateJson' $_default`

deco
deco1="$_deco"
deco
deco2="$_deco"

echo "id=${Mod_id}
name=๐${Mod_name}๐(${Mod_id})
version=${Mod_version}
versionCode=${Mod_versionCode}
author=๐บ${Mod_author}
description=${deco1} ${Mod_description} ${deco2}
updateJson=${Mod_updateJson}" >${_tonew2}/${after}
