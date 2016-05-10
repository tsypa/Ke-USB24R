#!/bin/sh

usage() {
    echo $(basename ${0}) '<device> <line> <on|off>'
}

if [ ${#} -ne 3 ] ; then
    usage
    exit;
fi

DEVICE=${1}
LINE=${2}

if [ ${LINE} -lt 1 -o ${LINE} -gt 4  ]; then
    usage
    exit
fi

case ${3} in
    on) ACTION=1 ;;
    off) ACTION=0 ;;
    *)
	usage;
	exit;
	;;
    esac

printf "\$KE,REL,${LINE},${ACTION}\r\n" > ${DEVICE}
