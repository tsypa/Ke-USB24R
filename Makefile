all:	install
install:
	install -d /opt/kernelchip
	install -m 755 rele-turn.sh /opt/kernelchip
	install -m 755 rele-switch.sh /opt/kernelchip
	install -m 644 logrotate /etc/logrotate.d/kernelchip
