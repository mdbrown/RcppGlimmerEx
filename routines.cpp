#include <Rcpp.h>
using namespace Rcpp;

// Below is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar)

// For more on using Rcpp click the Help button on the editor toolbar

// [[Rcpp::export]]
int timesTwo(int x) {
   return x * 2;
}


// [[Rcpp::export]]  
NumericMatrix getQuantsC(NumericMatrix X, double alpha){
            
      int myncol = X.ncol(); 
      int mynrow = X.nrow(); 

      NumericMatrix out(2, myncol); 
      NumericVector x(mynrow);      
      for( int i = 0; i < myncol; i++){
         x = X(_, i); 
         //for( int j = 0; j < mynrow;j ++){
        //    x[j] = X(j, i); 
        // }

         NumericVector xs = x.sort(); 
         double mylow = xs[floor(mynrow*(alpha/2.0))];  
         double myup  = xs[ceil(mynrow*(1.0-alpha/2.0))-1]; 
         
         out(0, i) = mylow; 
         out(1, i) = myup; 
 
      }
      return out; 
  }
