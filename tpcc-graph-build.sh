#!/bin/bash

### goto user homedir and remove previous file
rm -f '$2'

gnuplot << EOP

### set data source file
datafile = '$1'

### set graph type and size
set terminal jpeg size 640,480

### set titles
set grid x y
set xlabel "Time (sec)"
set ylabel "Transactions"

### set output filename
set output '$2'

### set xrange
#set xrange [0:120]
#set yrange [0:10000]

### build graph
# plot datafile with lines
plot datafile title "AWS, US West 2, m4.large" with lines

EOP
