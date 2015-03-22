library(shiny)

# Load the data on school usage and teacher logins
# into a dataframe, "schools".
load("./Data/schools.RData")

# Calculate a linear model for predicting "hours" from "logins"
fit<-lm(hours ~ logins, data=schools)

shinyServer(function(input, output) {
        
        # plot hours against logins
        # show linear model with red line
        # show slider estimate and prediction with blue lines
        output$usagePlot <- renderPlot({
                x<-schools$logins
                y<-schools$hours
                new.school<-data.frame(logins=c(input$tlogins))
                
                plot(
                        schools$logins,
                        schools$hours,
                        xlab = "number of teacher logins",
                        ylab = "usage (hours)"
                        )
                abline(fit, col="red")
                abline(v=input$tlogins, col="blue")
                abline(h=predict(fit, new.school), col="blue")
                
        # Show the user what slider value they selected
        output$estimate<-renderText(
                        paste(
                                "You chose an estimate of",
                                input$tlogins,
                                "teacher logins."
                        )
                              
                )
        
        # Show the user the corresponding estimate of hours of usage
        output$result<-renderText(
                        paste(
                                "The estimated usage would be",
                                round(predict(fit, new.school)),
                                "."
                        )
                )
        })
})