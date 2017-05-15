sudo dpkg -i debs/libaio1_0.3.109-4_i386.deb
sudo dpkg -i debs/libck-connector0_0.4.5-3.1ubuntu2_i386.deb
sudo dpkg -i debs/openssh-sftp-server_6.6p1-2ubuntu2.4_i386.deb
sudo dpkg -i debs/openssh-client_6.6p1-2ubuntu2.4_i386.deb
sudo dpkg -i debs/openssh-server_6.6p1-2ubuntu2.4_i386.deb
sudo dpkg -i debs/mysql-common_5.5.47-0ubuntu0.14.04.1_all.deb
sudo dpkg -i debs/libnet-daemon-perl_0.48-1_all.deb
sudo dpkg -i debs/libplrpc-perl_0.2020-2_all.deb
sudo dpkg -i debs/libdbi-perl_1.630-1_i386.deb
sudo dpkg -i debs/libmysqlclient18_5.5.47-0ubuntu0.14.04.1_i386.deb
sudo dpkg -i debs/libdbd-mysql-perl_4.025-1_i386.deb
sudo dpkg -i debs/mysql-client-core-5.5_5.5.47-0ubuntu0.14.04.1_i386.deb
sudo dpkg -i debs/libterm-readkey-perl_2.31-1_i386.deb
sudo dpkg -i debs/mysql-client-5.5_5.5.47-0ubuntu0.14.04.1_i386.deb
sudo dpkg -i debs/mysql-client_5.5.47-0ubuntu0.14.04.1_all.deb
sudo dpkg -i debs/mysql-server-core-5.5_5.5.47-0ubuntu0.14.04.1_i386.deb
sudo dpkg -i debs/libhtml-template-perl_2.95-1_all.deb
sudo dpkg -i debs/mysql-server-5.5_5.5.47-0ubuntu0.14.04.1_i386.deb
sudo dpkg -i debs/mysql-server_5.5.47-0ubuntu0.14.04.1_all.deb
sudo dpkg -i debs/libvncserver0_0.9.9+dfsg-1ubuntu1.1_i386.deb
sudo dpkg -i debs/tcl_8.6.0+6ubuntu3_i386.deb
sudo dpkg -i debs/tk_8.6.0+6ubuntu3_i386.deb
sudo dpkg -i debs/x11vnc-data_0.9.13-1.1_all.deb
sudo dpkg -i x11vnc_0.9.13-1.1_i386.deb
sudo cp overrides/defaultdesktop /usr/share/xsessions/default.desktop
sudo cp overrides/commonsetupvars /etc/X11/Xsession.d/01x11-common_setup-vars
sudo cp overrides/xsession ~/.xsession
sudo cp overrides/interfaces /etc/network/
sudo cp overrides/omr_lpr /usr/local/bin
sudo cp overrides/printers.conf /etc/cups/
sudo cp overrides/my.cnf /etc/mysql/
sudo cp overrides/lpttoB /home/pos/
sudo chown -R pos: /usr/local/bin/omr_lpr
cp -r PenguinPOS-FMCG ~/
sudo chown -R pos: ~/PenguinPOS-FMCG
cp -v dates/update_my_date.sh ~/
cp -v dates/get_server_date.sql ~/
mysql -uroot -ppenpos < sql/users.sql
mysql -uroot -ppenpos < sql/terminal_fmcg.sql
mysql -uroot -ppenpos < sql/terminalclean.sql
sudo /etc/init.d/mysql restart
echo 
echo '+-Network setup------------------------------------+'
echo '|                                                  |'
echo '|  modify your ip by with the command              |'
echo '|   "sudo nano /etc/network/interfaces"            |'
echo '|                                                  |'
echo '+-Time updates-------------------------------------+'
echo '|                                                  |'
echo '|  Add "55 * * * * sh /home/pos/update_my_date.sh" |'
echo '|  to "sudo crontab -e"                            |'
echo '|                                                  |'
echo '+-Parallel Expander cards--------------------------+'
echo '|                                                  |'
echo '|  sudo cp overrides/rc.local /etc/rc.local        |'
echo '|                                                  |'
echo '+-Complete Install---------------------------------+'
echo '|                                                  |'
echo '|  Logout gnome and login after selecting          |'
echo '|   "run PenguinPos FMCG" as your session          |'
echo '|                                                  |'
echo '+--------------------------------------------------+'
echo

