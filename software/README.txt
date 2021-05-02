blindIt -- File anonymizer (v 0.2)
==================================

Description
===========

blindIt is a file anonymizing script. It turns the names of all
the files in a folder into random numbers followed by the file's original
extension. When you're done, it turns their names back to the original ones.

System Requirements
===================

blindIt is compatible with any UNIX system that supports bash scripts. Thus, it is compatible with all versions of Linux and Mac OS X. 

blindIt is not compatible with Windows or the batch scripting language.

Installation
============

In Linux:
	- Unzip blindIt.zip
	- Open a terminal and go to the location of the installation file
	  "install.sh". 
	- Type:
		bash install.sh
	- Press Enter.
	- You'll be prompted for your administrator password. Enter it.
	- You're done.

In Mac OS X:
	- Unzip blindIt.zip
	- Open a terminal and go to the location of the installation file
	  "install.sh". E.g. if the installation file is in a
	  folder called "Blindit" which is in the Downloads folder, 
	  you should enter the following in your terminal:
		
		cd Downloads/Blindit
	  
	  Here is a tutorial for opening a location in a terminal in 
	  recent versions of OS X:
		http://www.howtogeek.com/210147/how-to-open-terminal-in-the-current-os-x-finder-location/
	- Once in the location of the installation file, enter:

		bash install.sh

	- You'll be prompted for your administrator password. Enter it.
	- You're done.

Usage
=====

To blind:
In a terminal, move to the location of the files you wish to blind, and
type:
	
	blindIt -b

To unblind:
In a terminal, in the location where you have anonymized your files using blindIt, type:
	
	blindIt -u

To delete auxiliary files:
In the location of the files you have unblinded, enter:

	blindIt -c

IMPORTANT: DO NOT CLEAR AUXILIARY FILES BEFORE UNBLINDING. DOING SO WILL
PERMANENTLY IMPEDE THE RECOVERY OF THEIR ORIGINAL NAMES.

For help, enter:
	
	blindIt -h

License
=======

blindIt v0.1
Copyright (C) 2015 Martin Abreu Zavaleta

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


