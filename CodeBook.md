Source data
===========

In the original source data the subject ID and activity code were each provided in a separate file.
These were added to the motion data vector using a column-bind operation.

The source data randomly assigned data to two groups identified as training and test.
These groups were merged to create a single data set for analysis. 
Only the mean and standard deviations were included.

Text descriptions for the activity codes were taken from a file provided with the original data.

Analysis
========
The analysis consisted of computing the mean of the selected measures in cells defined by activity and subject.
