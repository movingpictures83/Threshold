# Threshold
# Language: R
# Input: TXT (key, value pairs)
# Output: CSV (thresholded abundance data)
# Tested with: PluMA 1.1, R 4.0.0

PluMA plugin designed to take raw abundance data and threshold it, based on the number
of recorded observations across a set of samples.  All observables that do not meet a user-specified
threshold will be removed from the dataset.

The plugin accepts input in the form of a text file consisting of keyword, value pairs.
There are four parameters that can be specified:

inputfile: Input data, in CSV format (rows are samples, columns are observables)
threshold: Minimum amount of observations over all samples to be included in the final dataset
normalize: Whether or not the output should be normalized
startcol: Column number where the data starts, convenient since sometimes initial columns of a dataset are labels

It will then generate the thresholded output file in CSV format.  Note columns from 1 to startcol-1
will be included in this final dataset.

