# Bourne-Shell-Process-Framwork
This is a framework I created for running several tasks within one framework.  Originally I designed it towards installs but this could be used for other tasks.

-----------------
Aaron's Framework
-----------------

This Bourne shell module is a framework for running large, complex programs
written (largely) in Bourne shell.  An example is a large installer script or
upgrade script for a server with many moving parts.

This package contains the framework, and a simple example script which uses
this framework.

aarons_framework		- The framework
aarons_framework_runner.sh 	- An example script which invokes the framework
aarons_foo.conf			- An example configuration for the framework.
				  This contains some notes on how to setup a
				  configuration file.
aarons_foo_mod			- An additional module loaded by the framework.
				  This contains functions which are called by the
				  framework, and found via the configuration file.
aarons_foo_script.sh		- A script run by the framework, also found via
				  the configuration file.


To run the example, first make sure that aarons_foo.sh and
aarons_foo_script.sh are executable.  Next run ./aarons_framework_runner.sh.
You will see some very basic output from the functions and scripts that are
run.

If you wish to see additional output, run the framework as follows:
./aarons_framework_runner.sh -d

If you wish to see the script handle a failure from a module called by the
framework, edit aarons_foo.conf by changing these lines : 

-----------
step4   function afm_start_it2 valid_parameter
;step4  function afm_start_it2
-----------

to

-----------
;step4   function afm_start_it2 valid_parameter
step4  function afm_start_it2
-----------

afm_start_it2 will fail if no parameter is supplied.
