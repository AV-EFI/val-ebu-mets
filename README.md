# Validate EBUCore XML documents – standalone or embedded into METS

This repository provides a wrapper around [xmllint][] in order to
simplify validation of [EBUCore XML][EBUCore] embedded into [METS][].
More specifically, the METS schema declares several wrapper elements
(e.g. `mdWrap`) intended to embed XML documents from different domains
and of various schemas. These elements have been defined with the
attribute `processContents="lax"` which instructs validators to check
the contents of those elements for well-formedness but skip schema
validation unless the respective schema has been explicitly loaded
into the validator. Thus, many errors in EBUCore may go unnoticed
because validators will complain loudly if the METS schema is not
found or not adhered to but they will happily declare the whole
document "valid" even if they do not have a clue about the EBUCore
schema.

This package provides:

-   offline copies of the relevant XML schemas,
-   an XML catalog file for libxml2 to locate those schemas,
-   a wrapper schema importing the above, and
-   a shell script passing all required information to [xmllint][].

[xmllint]: https://gnome.pages.gitlab.gnome.org/libxml2/xmllint.html
[EBUCore]: https://tech.ebu.ch/metadata/ebucore
[METS]: https://www.loc.gov/standards/mets/mets-schemadocs.html

# Usage

Simply call the script `validate.sh` from this package as follows:

```console
$ path/to/valid_ebu_mets/validate.sh <metsfile_containing_ebucore.xml>
```

Please note that on Debian based systems the package libxml2-utils
needs to be installed for this script to work, on Red Hat based
systems it depends on the libxml2 package.
