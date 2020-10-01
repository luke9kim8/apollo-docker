pg_ctlcluster 9.6 main start
pg_ctlcluster 12 main start
cd /code/apollo/src/sqlfuzz
sed -i -e "s\INIT: false\INIT: true\g" configuration/postgres.yaml
./fuzz.py -c configuration/postgres.yaml
