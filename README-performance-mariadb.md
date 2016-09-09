# m4.large, us-west-1, direkte Ausführung perf.test auf DB-Server

```bash
mysql  Ver 15.1 Distrib 5.5.50-MariaDB, for Linux (x86_64) using readline 5.1
```

Nach dem Laden der Indizes:

Dateisystem    Größe Benutzt Verf. Verw% Eingehängt auf
/dev/xvda1      250G    126G  125G   51% /
devtmpfs        3,9G       0  3,9G    0% /dev
tmpfs           3,7G       0  3,7G    0% /dev/shm
tmpfs           3,7G     17M  3,7G    1% /run
tmpfs           3,7G       0  3,7G    0% /sys/fs/cgroup
tmpfs           757M       0  757M    0% /run/user/1000
[centos@ip-172-31-19-10 tpcc-mysql]$ df -h

## Datensätze:

```bash
$ mysql -u root -p -D tpcc1000 < count.sql 
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
```

```bash
./tpcc_start -h127.0.0.1 -P3306 -dtpcc1000 -uroot -w1000 -c32 -r10 -l10800 -f 20160909-001.report -t 20160909-001.trx
```

```bash
<Raw Results>
  [0] sc:0 lt:63076  rt:0  fl:0 avg_rt: 2677.1 (5)
  [1] sc:61 lt:62635  rt:0  fl:0 avg_rt: 940.5 (5)
  [2] sc:8 lt:6299  rt:0  fl:0 avg_rt: 652.6 (5)
  [3] sc:0 lt:6300  rt:0  fl:0 avg_rt: 7333.5 (80)
  [4] sc:0 lt:6306  rt:0  fl:0 avg_rt: 10706.0 (20)
 in 10800 sec.

<Raw Results2(sum ver.)>
  [0] sc:0  lt:63081  rt:0  fl:0 
  [1] sc:61  lt:63017  rt:0  fl:0 
  [2] sc:8  lt:6299  rt:0  fl:0 
  [3] sc:0  lt:6307  rt:0  fl:0 
  [4] sc:0  lt:6307  rt:0  fl:0 

<Constraint Check> (all must be [OK])
 [transaction percentage]
        Payment: 43.33% (>=43.0%) [OK]
   Order-Status: 4.36% (>= 4.0%) [OK]
       Delivery: 4.35% (>= 4.0%) [OK]
    Stock-Level: 4.36% (>= 4.0%) [OK]
 [response time (at least 90% passed)]
      New-Order: 0.00%  [NG] *
        Payment: 0.10%  [NG] *
   Order-Status: 0.13%  [NG] *
       Delivery: 0.00%  [NG] *
    Stock-Level: 0.00%  [NG] *

<TpmC>
                 350.422 TpmC
```

# m4.large, us-west-1, Ausführung über Client (m4.large)

