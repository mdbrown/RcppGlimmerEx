library(shiny)
library(Rcpp)
sourceCpp("routines.cpp")


# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$quantPlot <- renderTable({
    
    # generate an rnorm distribution and plot it
    data <- matrix(rnorm(input$rownum*input$colnum), nrow = input$rownum, ncol = input$colnum)
    getQuantsC(data, alpha = 0.05)
  })
})
