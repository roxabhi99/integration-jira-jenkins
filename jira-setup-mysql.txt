## ubuntu t2 medium instance

#Install java-openjdk:

apt update -y
apt-get install openjdk-11-jdk -y
javac -version


#Install Mysql:

curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
ls -l
dpkg -i mysql-apt-config_0.8.24-1_all.deb
apt update -y
apt install mysql-server -y
mysql -V
mysqladmin -u root -p version
mysql_secure_installation
systemctl status mysql

#Create DataBase :

mysql -u root -p
cat > configure.sql <<-EOF

CREATE DATABASE jira_db;
CREATE USER 'jira_user'@'<private-ip>' IDENTIFIED BY 'Nitish@11';
GRANT ALL PRIVILEGES ON jira_db.* TO 'jira_user'@'<private-ip>';
FLUSH PRIVILEGES;
EOF

sudo mysql < configure.sql

# Install Jira Software:
#In The root user

wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-8.20.15-x64.bin
chmod a+x atlassian-jira-software-8.20.15-x64.bin
ls -la 
#(if appears in green is ok)
./atlassian-jira-software-8.20.15-x64.bin 
#-> Enter -> 2 -> Enter -> Enter -> 1 -> Y -> i -> Y
apt install ufw
ufw allow 8181
ufw allow 8005
ufw allow 8080
ufw enable
ufw status
wget https://dev.mysql.com/get/archives/mysql-connector-java-8.0/mysql-connector-java-8.0.30.zip
apt install unzip -y
unzip mysql-connector-java-8.0.30.zip 

#Next, navigate into the  mysql-connector-java directory and copy the jar file to the path /opt/atlassian/jira/lib
cd mysql-connector-java-8.0.30/
cp mysql-connector-java-8.0.30.jar  /opt/atlassian/jira/lib
cd ..
ls /opt/atlassian/jira/lib 
#(check if the mysql .jar is there)
/etc/init.d/jira stop
/etc/init.d/jira start
