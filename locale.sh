#!/bin/bash
#
# Generates all locales we currently support.
#
# Author: Mike Schueler
# EMAIL:  moc.liamg@releuhcs.leahcim
# Licensed under the terms of the WTFPL
#

/var/lib/locales/supported.d/local

INTERDIR=/var/lib/locales/supported.d/
FILENAME=local
FULLPATH="${INTERDIR}/${FILENAME}"

chkpkg(){
  if [ "dpkg -s ${1}" ] ; then
    aptitude -y install "$1"
  fi
}

DEPENDENCIES=( locale-gen localechooser-data locales localization-conig util-linux-locales )

aptitude -y -q update

if [ -f "${FULLPATH}.bak" ] ; then
  rm ${FULLPATH}.bak
fi

cp ${FULLPATH}{,.bak}

cat << 'EOF' > ${FULLPATH}
de_DE.UTF-8 UTF-8
de_DE ISO-8859-1
de_DE@euro ISO-8859-15
en_US.UTF-8 UTF-8
en_US ISO-8859-1
en_US.ISO-8859-15 ISO-8859-15
es_ES.UTF-8 UTF-8
es_ES ISO-8859-1
es_ES@euro ISO-8859-15
fi_FI.UTF-8 UTF-8
fi_FI ISO-8859-1
fi_FI@euro ISO-8859-15
fr_FR.UTF-8 UTF-8
fr_FR ISO-8859-1
fr_FR@euro ISO-8859-15
it_IT.UTF-8 UTF-8
it_IT ISO-8859-1
it_IT@euro ISO-8859-15
ja_JP.EUC-JP EUC-JP
ja_JP.UTF-8 UTF-8
ko_KR.EUC-KR EUC-KR
ko_KR.UTF-8 UTF-8
nn_NO.UTF-8 UTF-8
nn_NO ISO-8859-1
pt_PT.UTF-8 UTF-8
pt_PT ISO-8859-1
pt_PT@euro ISO-8859-15
ru_RU.KOI8-R KOI8-R
ru_RU.UTF-8 UTF-8
ru_RU ISO-8859-5
ru_RU.CP1251 CP1251
sv_SE.UTF-8 UTF-8
sv_SE ISO-8859-1
sv_SE.ISO-8859-15 ISO-8859-15
zh_CN.GB18030 GB18030
zh_CN.GBK GBK
zh_CN.UTF-8 UTF-8
zh_CN GB2312
EOF

dpkg-reconfigure locales

