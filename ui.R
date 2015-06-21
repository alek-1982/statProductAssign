library(shiny)
library(lattice)
library(ggplot2)
shinyUI(pageWithSidebar(
    
    headerPanel("Linear Regression Model"),
    
    sidebarPanel(
        h5("Before starting see the documentation tab"),
        selectInput("variable","Choose a variable",
                    choices = c("Displacement","Horse.Power","Weight")),
        numericInput("predictor","Select the value for the prediction:",100),
        h3("Features"),
        checkboxInput("showNames","Show Names",FALSE),
        checkboxInput("showLine","Show Line",TRUE),
        checkboxInput("showFormula","Show Formula",FALSE)
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Plot",h3(textOutput("graphTitle")),
                     h5(textOutput("graphFormula")),
                     plotOutput("view"),
                     tableOutput("table")),
            tabPanel("Documentation",h5("This is a tutorial on how to use the Linear Regression App."),
                     h5("For this app we use the dataset mtcars and estimate the Miles per Gallon using a simple Linear Regression Model according to different variables."),
                     h5("The first step is to select the predictor variable. This variable will be used to build the linear regression to predict the estimated miles per gallon. We can notice that the plot and the regression model is automatically updated to our selection."),
                     h5("The next step is to write a specific value for our prediction. We can see how the point is automatically predicted and ploted in our graph."),
                     h5("At last we can add or remove features. For example, use the formula checkbox to see the model formula and the value of the prediction made. We can also show or hide the regression line and we can also show the names of the regression values."),
                     h5("We are now ready to take a look and play with the app. :)")
            )
        )
    )
))