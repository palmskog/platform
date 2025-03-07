#!/bin/bash

###################### COPYRIGHT/COPYLEFT ######################

# (C) 2020 Michael Soegtrop

# Released to the public under the
# Creative Commons CC0 1.0 Universal License
# See https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt

###################### CONTROL VARIABLES #####################

# The two lines below are used by the package selection script
COQ_PLATFORM_VERSION_TITLE="Coq dev (latest master of all packages)"
COQ_PLATFORM_VERSION_SORTORDER=9999

# The package list name is the final part of the opam switch name.
# It is usually either empty ot starts with ~.
# It might also be used for installer package names, but with ~ replaced by _
# It is also used for version specific file selections in the smoke test kit.
COQ_PLATFORM_PACKAGELIST_NAME='~dev'

# The corresponding Coq development branch and tag
COQ_PLATFORM_COQ_BRANCH='dev'
COQ_PLATFORM_COQ_TAG='dev'

# This controls if opam repositories for development packages are selected
COQ_PLATFORM_USE_DEV_REPOSITORY='Y'

# This extended descriptions is used for readme files
COQ_PLATFORM_VERSION_DESCRIPTION='This is the latest development version of Coq and all packages.'

###################### PACKAGE SELECTION #####################

# - Comment out packages you do not want.
# - Packages which take a long time to build should be given last.
#   There is some evidence that they are built early then.

PACKAGES="coq.dev"

# GTK based IDE for Coq - alternatives are VSCoq and Proofgeneral for Emacs
if  [[ "${COQ_PLATFORM_EXTENT}"  =~ ^[iIfFxX] ]]
then
PACKAGES="${PACKAGES} coqide.dev lablgtk3.3.1.1"
fi

if  [[ "${COQ_PLATFORM_EXTENT}"  =~ ^[fFxX] ]]
then

# Some generally useful packages
PACKAGES="${PACKAGES} coq-unicoq.dev"
PACKAGES="${PACKAGES} coq-ext-lib.dev"
PACKAGES="${PACKAGES} coq-equations.dev"
PACKAGES="${PACKAGES} coq-bignums.dev"
PACKAGES="${PACKAGES} coq-aac-tactics.dev"
PACKAGES="${PACKAGES} coq-mtac2.dev"
PACKAGES="${PACKAGES} coq-simple-io.dev"
PACKAGES="${PACKAGES} coq-quickchick.dev"

# Analysis and numerics
PACKAGES="${PACKAGES} coq-flocq.3.dev"
PACKAGES="${PACKAGES} coq-coquelicot.dev"
PACKAGES="${PACKAGES} coq-gappa.dev"
PACKAGES="${PACKAGES} coq-interval.dev"

# Elpi, Coq-elpi and hierarchy builder
PACKAGES="${PACKAGES} coq-elpi.dev"
PACKAGES="${PACKAGES} coq-hierarchy-builder.dev"

# The standard set of mathcomp modules
PACKAGES="${PACKAGES} coq-mathcomp-ssreflect.dev"
PACKAGES="${PACKAGES} coq-mathcomp-fingroup.dev"
PACKAGES="${PACKAGES} coq-mathcomp-algebra.dev"
PACKAGES="${PACKAGES} coq-mathcomp-solvable.dev"
PACKAGES="${PACKAGES} coq-mathcomp-field.dev"
PACKAGES="${PACKAGES} coq-mathcomp-character.dev"
# Plus a few extra mathcomp modules
PACKAGES="${PACKAGES} coq-mathcomp-bigenough.dev"
PACKAGES="${PACKAGES} coq-mathcomp-finmap.dev"
PACKAGES="${PACKAGES} coq-mathcomp-real-closed.dev"

# Menhir, CompCert and Princeton VST - these take longer to compile !
PACKAGES="${PACKAGES} coq-menhirlib.dev menhir.dev"
case "$COQ_PLATFORM_COMPCERT" in
  [yY]) PACKAGES="${PACKAGES} coq-compcert.dev" ;;
  [nN]) true ;;
  *) echo "Illegal value for COQ_PLATFORM_COMPCERT - aborting"; false ;;
esac

case "$COQ_PLATFORM_VST" in
  [yY]) PACKAGES="${PACKAGES} coq-vst.dev" ;;
  [nN]) true ;;
  *) echo "Illegal value for COQ_PLATFORM_VST - aborting"; false ;;
esac

fi
