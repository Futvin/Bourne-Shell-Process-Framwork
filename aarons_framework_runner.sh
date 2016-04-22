#!/bin/sh
#
# aarons_foo.sh
#
# This script uses the aarons_framework to coordinate the script.
#
# Created by Aaron DeForest
#

# This configuration file describes what this script will actual do.
MY_CONFIG_FILE="aarons_foo.conf"

# location of aarons_framework
AARONS_FRAMEWORK="./aarons_framework"

# Loading the framework.  If this fails, the script will just blowup.
. "${AARONS_FRAMEWORK}"
# We could search for an error here, but the script will exit if the 
# above command fails.

# Parse commandline arguments.
while getopts "hc:d" flag ; do
    case $flag in
	h)
            echo "Usage: $0 [-c <config_file>]"
            exit 0
            ;;
        c)
            MY_CONFIG_FILE="$OPTARG"
            ;;
	d)
	    af_set_debug true
    esac
done

if af_is_debug ; then log_msg "" "Tring to start the framework using : ${MY_CONFIG_FILE}"; fi
af_start_framework "${MY_CONFIG_FILE}"
_exit_code=$?
if af_is_debug ; then log_msg "" "Script completed with exit code : ${_exit_code}."; fi
exit ${_exit_code}

