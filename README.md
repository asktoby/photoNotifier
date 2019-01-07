# photoNotifier
Script to run from cron each day to count how many photos I need to develop and send me an email with a progress graph.

appendData.sh trawls a directory to count files.
It compares the count to a logged count from the previous time it was run in data.txt.

If the count has changed, it logs the new value, and calls showGraph.sh, which uses gnuplot to prepare an ASCII graph (using gnuplotsettings for the settings).

This ASCII graph is then emailed to me.
