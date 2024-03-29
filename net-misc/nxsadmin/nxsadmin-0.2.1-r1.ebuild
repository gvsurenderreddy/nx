# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="graphical tool for management of active NX sessions on FreeNX server"
HOMEPAGE="http://sourceforge.net/projects/nxsadmin.berlios/"
SRC_URI="mirror://sourceforge/${PN}.berlios/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/gtkmm:2.4
	dev-util/intltool"
RDEPEND="dev-cpp/gtkmm:2.4
	net-misc/nxserver-freenx"

src_prepare() {
	# Needs to be regenerated
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
}
