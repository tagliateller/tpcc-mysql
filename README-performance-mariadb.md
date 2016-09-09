# m4.large, us-west-1, direkte Ausführung perf.test auf DB-Server

Nach dem Laden der Indizes:

Dateisystem    Größe Benutzt Verf. Verw% Eingehängt auf
/dev/xvda1      250G    126G  125G   51% /
devtmpfs        3,9G       0  3,9G    0% /dev
tmpfs           3,7G       0  3,7G    0% /dev/shm
tmpfs           3,7G     17M  3,7G    1% /run
tmpfs           3,7G       0  3,7G    0% /sys/fs/cgroup
tmpfs           757M       0  757M    0% /run/user/1000
[centos@ip-172-31-19-10 tpcc-mysql]$ df -h

Datensätze:

[centos@ip-172-31-19-10 tpcc-mysql]$ mysql -u root -p -D tpcc1000 < count.sql 
Enter password: 
count(w_id)
1000
count(d_w_id)
10000
count(c_w_id)
30000000
count(h_c_id)
30000000
count(no_w_id)
9000000
count(o_w_id)
30000000
count(ol_w_id)
299996396
count(i_id)
100000
count(s_w_id)
100000000
[centos@ip-172-31-19-10 tpcc-mysql]$ 
