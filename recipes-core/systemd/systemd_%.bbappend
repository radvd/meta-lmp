FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
	file://tmpfiles.d-var.conf-also-create-var-lib-misc.patch \
"

do_install_append() {
	echo 'L+ /var/tmp - - - - /var/volatile/tmp' >> ${D}${sysconfdir}/tmpfiles.d/00-create-volatile.conf
	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
		echo 'L+ /var/log - - - - /var/volatile/log' >> ${D}${sysconfdir}/tmpfiles.d/00-create-volatile.conf
	fi
}
