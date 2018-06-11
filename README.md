copy-partitions-payton
======

Instructions to build:
1. Clone https://github.com/Lanchon/Flashize.git
$ git clone https://github.com/Lanchon/Flashize.git flashize

2. Clone this repository:
$ git clone https://github.com/filipeferraz/copy-partitions-payton.git scripts

3. Make a flashable zip (test):
$ ./flashize/flashize ./scripts/copy-partitions-a-to-b-print.sh copy-partitions-payton-print.zip

4. Make a flashable zip (copy):
$ ./flashize/flashize ./scripts/copy-partitions-a-to-b.sh copy-partitions-payton.zip
