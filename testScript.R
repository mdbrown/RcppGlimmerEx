# script to run some tests while I build this app
library(Rcpp)

sourceCpp("routines.cpp")


tst.data <- matrix(rnorm(10e6), ncol =5000)



getQuantsC(tst.data, alpha = .05)

apply(tst.data, 2, quantile, probs = c(.025, .975))


## speed test
library(microbenchmark)

microbenchmark(getQuantsC(tst.data, alpha = .05),
               apply(tst.data, 2, quantile, probs = c(.025, .975))
 )


