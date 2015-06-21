library(shiny)
library(datasets)
library(caret)
library(lattice)
library(ggplot2)
names(mtcars)[c(3,4,6)] <- c("Displacement","Horse.Power","Weight")

shinyServer(function(input,output) {
    
    variableInput <- reactive({
        switch(input$variable,
               "Displacement" = Displacement,
               "Horse.Power" = Horse.Power,
               "Weight" = Weight)
    })
    output$graphTitle <- renderText({
        text <- paste("Miles per Gallon",input$variable,sep=" ~ ")
        text
    })
    
    output$graphFormula <- renderText({
        if(input$showFormula) {
            var <- mtcars[,input$variable]
            fit <- lm(mtcars$mpg ~ var)
            intercept <- round(as.numeric(fit$coefficients[1]),4)
            slope <- round(as.numeric(fit$coefficients[2]),4)
            x <- data.frame(var = input$predictor)
            prediction <- round(as.numeric(predict(fit,x)),4)
            
            text <- paste("Miles per Gallon = ",intercept," + x(",slope,")"," = ",prediction,sep="")
            text
        }
        else {NULL}
    })
    
    output$view <- renderPlot({
        var <- mtcars[,input$variable]
        fit <- lm(mtcars$mpg ~ var)
        plot(mpg ~ var,data = mtcars, ylab="Miles per Gallon",xlab=input$variable)
        
        if(input$showNames) {
            with(mtcars, text(mpg ~ var, labels = row.names(mtcars), pos = 4,cex=0.7))
        }
        
        if(input$showLine) {
            abline(fit,col = "red",lwd=2)
        }
        
        x <- data.frame(var = input$predictor)
        prediction <- as.numeric(predict(fit,x))
        points(input$predictor,prediction,col="blue",pch=4,cex=4,lwd=3)
        
    })
    
    output$table <- renderTable({
        if(input$showNames) {
            t <- mtcars[,c(input$variable,"mpg")]
            names(t) <- c(input$variable,"Miles per Gallon")
            t
        }
        else {NULL}
    })
})