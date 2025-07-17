#!/bin/bash
HERE=$(dirname "$0")

if [ "$#" == 0 ] ; then
    echo "Usage: $0 <METS_file.xml>"
    exit 2
fi

XML_CATALOG_FILES=${HERE}/catalog-strict \
xmllint --noout --schema "${HERE}/cumulative-schema.xsd" "$@"
