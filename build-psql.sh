apt-get install wget ca-certificates
echo "hey"
apt-get clean
apt-get install gnupg -y
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
apt-get clean
apt-get update

apt-get install postgresql-12 postgresql-9.6 postgresql-contrib -y
echo "check001"
sed -i -e "s:port = 5433:port = 5435:g" /etc/postgresql/12/main/postgresql.conf
cat /etc/postgresql/12/main/postgresql.conf
echo "check002"
pg_ctlcluster 9.6 main start
echo "check003"
pg_ctlcluster 12 main start
echo "check004"
netstat -napt |grep "5435\|5432"

sudo -u postgres createuser -p 5432 -s $(whoami); createdb -p 5432 $(whoami)
sudo -u postgres createuser -p 5435 -s $(whoami); createdb -p 5435 $(whoami)

sudo -u postgres psql -p 5432 -U postgres -d postgres -c "ALTER USER postgres PASSWORD 'mysecretpassword';"
sudo -u postgres psql -p 5435 -U postgres -d postgres -c "ALTER USER postgres PASSWORD 'mysecretpassword';"
