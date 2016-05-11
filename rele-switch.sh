#!/bin/sh

usage() {
    echo ${0##*/} '<device> <line> <seconds>'
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
    ''|*[!0-9]*)
	usage
	exit
	;;
    *)
	SLEEPTIME=${3}
	;;
esac

PROGNAME=${0##*/}
LOGFILE=/var/log/${PROGNAME%.*}
echo "date:\"$(date --rfc-3339=seconds)\" duration:\"${SLEEPTIME}\"" >> ${LOGFILE}

printf "\$KE,REL,${LINE},1\r\n" > ${DEVICE}
sleep ${SLEEPTIME}
printf "\$KE,REL,${LINE},0\r\n" > ${DEVICE}
