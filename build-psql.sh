apt-get install wget ca-certificates
apt-get install gnupg -y
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

apt-get update
apt-get upgrade
apt-get install postgresql-12 postgresql-9.6 postgresql-contrib -y

pg_ctlcluster 9.6 main stop
pg_ctlcluster 12 main stop

