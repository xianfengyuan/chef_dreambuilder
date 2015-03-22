maintainer       "Xianfeng Yuan"
name		 "dreambuilder"
maintainer_email "xianfengyuan@yahoo.com"
license          "All rights reserved"
description      "Installs/Configures dreambuilder"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

provides "dreambuilder"

depends "opsworks_nodejs"
depends "runit"
