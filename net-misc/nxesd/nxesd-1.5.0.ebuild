# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Modified esound server, used by nxclient"
HOMEPAGE="http://www.nomachine.com/"
SRC_URI="http://web04.nomachine.com/download/1.5.0/sources/$P-3.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="alsa debug ipv6 tcpd"

DEPEND=">=media-libs/audiofile-0.1.5
	alsa? ( >=media-libs/alsa-lib-0.5.10b )
	tcpd? ( >=sys-apps/tcp-wrappers-7.6-r2 )"

S=${WORKDIR}/${PN}

src_compile() {
	local myconf="--prefix=/usr/NX --sysconfdir=/etc/esd \
		$(use_enable ipv6) $(use_enable debug debugging) \
		$(use_enable alsa) $(use_with tcpd libwrap)"

	elibtoolize

	econf $myconf || die "Configure failed"
	emake || die "Make failed"
}

src_install() {
	emake DESTDIR=${D} install || die "unable to install nxesd"
}