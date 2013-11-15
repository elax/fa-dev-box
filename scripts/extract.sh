##################################################
# FA
#================================================
# Standard distribution of FA mixes sources and
# configurations files. Private files are extracted
# in the private folder. All files are generated
# under FA folder. We need to extract them to 
# the private directory. For this, we move the 
# _private_ file in the private directory and
# replace them with a link. Those link needs
# to be refreshed every time a new file
# is created. However, we move entire folders
# when possible. File under a folder doesn't need
# to be moved.
##################################################




pushd fa
FA_GIT='../.git/modules/fa'

for file in company config.php config_db.php installed_extensions.php tmp lang modules sql
do
	# Check if the link alread exists in FA directory
	# or if the file needs to be moved and linked
	if [ ! -L $file ] ; then
		# We need to hide those modification to git
		# We do it first, when the file is still there
		if [ -d $file ] ; then
			# for a dir we need to hide n
			# find $file -exec git update-index --assume-unchanged {} \;
			find $file -exec echo {} >> $FA_GIT/info/exclude \;
			# we can't *assume unchanged* a directory so we have to ignore it
			
			#echo $file >> $FA_GIT/info/exclude
		else
			echo $file >> $FA_GIT/info/exclude
			#git update-index --assume-unchanged $file
		fi

		if ! grep $file $FA_GIT/info/exclude ; then
			echo $file >> $FA_GIT/info/exclude
		fi

		# move the private location only
		# However, if they already exits in the private directory, keep them
		if [ ! -e ../private/$file ]; then
			rm -rf ../private/$file
			mv -f $file ../private/$file
		else
			# copy what ever exists in the FA file
			# before linking it to the private version
			find $file -exec cp -n {} ../private/{}
			rm -f $file
		fi

		# create a link 
		ln -s ../private/$file $file
	fi
done

popd
