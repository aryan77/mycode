# This script installs Libre Office from the following .tar.gz files
# LibreOffice_*_Linux_x86-64_deb.tar.gz
# LibreOffice_*_Linux_x86-64_deb_langpack_en-GB.tar.gz
# LibreOffice_*_Linux_x86-64_deb_helppack_en-GB.tar.gz
# There is also an option to remove the currently installed version of LibreOffice

for i in LibreOffice*.tar.gz; do tar -xvzf $i; done
for i in LibreOffice*.tar; do tar -xvf $i; done
echo 'I have finished extracting the LibreOffice TAR Files.'
echo 'Would you like to REMOVE the currently installed version of LibreOffice now? (y/n)'
read REMOVE_OLDVERSION
if [ "$REMOVE_OLDVERSION" == "y" ]; then
	echo "Uinstalling old LibreOffice now ..."
          sudo apt-get remove libreoffice*
fi
echo 'Install new LibreOffice now? (y/n)'
read INSTALL_NEWVERSION
if [ "$INSTALL_NEWVERSION" == "y" ]; then
          echo 'Installing new version now'
          echo

          cd LibreOffice_*_Linux_x86-64_deb/DEBS
          sudo dpkg -i *.deb
          cd ../../LibreOffice_*_Linux_x86-64_deb_langpack_en-GB/DEBS
          sudo dpkg -i *.deb
          cd ../../LibreOffice_*_Linux_x86-64_deb_helppack_en-GB/DEBS
          sudo dpkg -i *.deb
          echo Installation of LibreOffice successfully completed
fi
