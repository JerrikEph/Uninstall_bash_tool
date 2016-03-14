#!/bin/bash

uinstall()
{
    local srcdir=$1
    local dstdir=$2

    for file in $(ls -A $srcdir)
    do
	if [ -f ${srcdir}/$file ]
	then 
	    rm ${dstdir}/$file
	    printf "%s: is removed\n" "${dstdir}/${file}"
	elif [ -d ${srcdir}/$file ]
	then
	    uinstall ${srcdir}/$file ${dstdir}/$file
	fi
    done

    if [ "$(ls -A $dstdir)" = "" ]
    then
	rmdir $dstdir
    fi
    return 0
}

manual()
{
    echo "---------------------------------------"
    echo "this script is intended to uinstall a manually installed program."
    echo "aka, user install the program via copying files."
    echo "you should use this command as follows:"
    printf "\n\n"
    echo "$0 <reference dir> <target dir>"
    printf "\n\n"
    echo "usually user merge <reference dir> into <target dir> to perform the install operation."
    echo "the purpose of this command is to remove those merged files and directory from
    <target dir>, thus serve the purpose of uinstall."
    echo "---------------------------------------"
    exit
}

guide()
{
    echo "Oops, I think something is wrong"
    echo "input $0 --help to get help"
}  

#check the legitimacy of the parameter & help guide user
if [ "$1" = "--help" ] 
then
    manual
elif [ "$1" = "" ]||[ "$2" = "" ]||[ ! -d $1 ]||[ ! -d $2 ]
then
    guide
exit
fi

uinstall $1 $2
