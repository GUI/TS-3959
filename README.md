# TS-3959

Scripts to demonstrate [TS-3959](https://issues.apache.org/jira/browse/TS-3959).

1. Install [`trafficserver/remap.config`](trafficserver/remap.config) into your TrafficServer installation.
2. Start TrafficServer on port 8080 (the default).
3. Run nginx in the foreground (on port 8070):

    ```sh
    $ nginx -p $PWD/nginx/ -c conf/nginx.conf 
    ```

4. In a new terminal window, run the test script:

    ```sh
    $ ruby test.rb
    ```

In TrafficServer 6+ (including master as of [0c5f3d7](https://github.com/apache/trafficserver/commit/0c5f3d7b1df42736936956b5396b58c04c861378)), after around 1 minute of running, you'll likely see a couple errors in the output like this (`.`s are printed for each successful request):

```
2016-05-31T02:12:54+00:00 Reloading nginx (25530)
.........................................................................
................................................................................
................................................................................
..................................................
ERROR: 502
<HTML>
<HEAD>
<TITLE>Server Connection Closed</TITLE>
</HEAD>

<BODY BGCOLOR="white" FGCOLOR="black">
<H1>Server Connection Closed</H1>
<HR>

<FONT FACE="Helvetica,Arial"><B>
Description: The server requested closed the connection before
the transaction was completed.
</B></FONT>
<HR>
</BODY>
```
