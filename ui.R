library(shiny)
shinyUI(fluidPage(
  titlePanel("Choose 3 different models for mtcars dataset"),
  sidebarLayout(
      sidebarPanel(
          radioButtons("variable1", "What variable would you like to see in model 1?", 
                       c("Cylinders" = "cyl","Transmission" = "am","Gears" = "gear",
                         "Displacement"="disp","Horsepower"="hp","Weight"="wt",
                         "1/4 mile time"="qsec")),
          radioButtons("variable2", "What variable would you like to see in model 2?", 
                       c("Cylinders" = "cyl","Transmission" = "am","Gears" = "gear",
                         "Displacement"="disp","Horsepower"="hp","Weight"="wt",
                         "1/4 mile time"="qsec")),
          radioButtons("variable3", "What variable would you like to see in model 3?", 
                       c("Cylinders" = "cyl","Transmission" = "am","Gears" = "gear",
                         "Displacement"="disp","Horsepower"="hp","Weight"="wt",
                         "1/4 mile time"="qsec")),
          h5("See for further information about this application the tab Documentation")
          
      ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Models", 
                           h2("Summary model 1"),
                           tableOutput("mod1"),
                           h4("R squared:"),
                           tableOutput("R1"),
                           h2("Summary model 2"),
                           tableOutput("mod2"),
                           h4("R squared:"),
                           tableOutput("R2"),
                           h2("Summary model 3"),
                           tableOutput("mod3"), 
                           h4("R squared:"),
                           tableOutput("R3")
                           ),
                  tabPanel("Documentation", 
                           h2("Information about the application."),
                           h5("In this application the user can compare 3 different models to predict the miles per gallon of a vehicle. Each model is a linear regression model with one input variable.The output per model shows the coefficients of the model, p-values and the R-squared value."),
                           h5("The used data is from the R dataset mtcars. It has measurements of 32 automobiles."),
                           h5("See for further information about this dataset: Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
                           )
      )
    )
  )
))