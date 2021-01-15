input <- function(inputfile) {
  parameters <- read.table(inputfile, as.is=T);
  rownames(parameters) <- parameters[,1]
  abund_raw <<- read.csv(toString(parameters["inputfile",2]), header = T)
  doNorm <<- toString(parameters["normalize", 2]);
  startCol <<- as.integer(parameters["startcol", 2]);
  cn <<- colnames(abund_raw);
  cn <<- cn[startCol:length(cn)];

  leadingcolumns <<- abund_raw[,1:startCol-1];
  abund_raw <<- abund_raw[startCol:length(cn)]
  abund_raw <<- apply(abund_raw, 1, as.numeric);
  abund_raw <<- as.matrix(t(abund_raw));
  if (doNorm == "true") {
     temp_sum <- rowSums(abund_raw);
     retval <<- abund_raw / temp_sum;
  }
  else {
     retval <<- abund_raw;
  }
  minreads <<- as.numeric(parameters["threshold", 2]);
}

run <- function() {
   keep.cols <- retval[,which(colSums(abund_raw)>minreads)];
   colnames(keep.cols) <- cn[which(colSums(abund_raw)>minreads)];
   #retval <<- keep.cols[,sort(colnames(keep.cols))];
   retval <<- cbind(leadingcolumns, retval);
}

output <- function(outputfile) {
   write.table(retval, file=outputfile, sep=",", append=FALSE, row.names=FALSE, col.names=TRUE)
}
