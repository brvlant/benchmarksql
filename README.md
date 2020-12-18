BenchmarkSQL is a GPLv2 fair-use TPC-C like testing tool. By changing the percentage mix of the transactions, you can simulate many different workloads.

---

<h3>This fork allows to run BenhamrkSQL against Informix.</h3>

---

**This is an early stage modification with a lot of issues to fix**

:bulb: Remember to have a blank database ready with the name of your own choosing, preferably located in a dbspace _different_ than rootdbs. For the purpose of this demo I'm using name **bmsql**

To run the software follow either original [how-to](https://github.com/brvlant/benchmarksql/blob/master/doc/HOW-TO-RUN.txt)
OR steps described below:

1. Clone this repository
   > git clone https://github.com/brvlant/benchmarksql.git
2. Enter into **benchmarksql** directory
3. Run
   > ant
   and wait for it to build.
   Expected output should look similar to the one below:
   ```shell
   pi@pocket:~/GITHUB/benchmarksql $ ant
   Buildfile: /home/pi/GITHUB/benchmarksql/build.xml

   init:

   compile:
       [javac] Compiling 11 source files to /home/pi/GITHUB/benchmarksql/build

   dist:
         [jar] Building jar: /home/pi/GITHUB/benchmarksql/dist/BenchmarkSQL-5.1.jar

   BUILD SUCCESSFUL
   Total time: 4 seconds

4. Edit or copy [run/sample.informix.properties](https://github.com/brvlant/benchmarksql/blob/master/run/sample.informix.properties) file and modify it acordingly - change connection string for informix jdbc.
Additional Informix environment settings are up to you and those provided in the sample are for demo purpose.

5. Enter [run](https://github.com/brvlant/benchmarksql/tree/master/run) directory and run:
   ```shell
   pi@pocket:~/GITHUB/benchmarksql/run $ ./runDatabaseBuild.sh sample.informix.properties
   ```

   wait for it to finish and then

   ```shell
   pi@pocket:~/GITHUB/benchmarksql/run $ ./runBenchmark.sh sample.informix.properties
   ```
   wait for it :sparkles:

6. Before you run another round do
   ```shell
   benchmarksql/run $ ./runDatabaseDestroy.sh sample.informix.properties
   ```


