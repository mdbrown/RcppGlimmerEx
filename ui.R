library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    numericInput("colnum", 
                "Number of columns:", 
                min = 1,
                max = 1000, 
                value = 500), 
    numericInput("rownum",
                 "Number of rows:", 
                 min = 1, max = 1000, 
                 value = 500)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tableOutput("quantPlot")
  )
))