library(shiny)
load("./Data/schools.RData")
fit<-lm(hours ~ logins, data=schools)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should re-execute automatically
        #     when inputs change
        #  2) Its output type is a plot
        
        output$distPlot <- renderPlot({
                x    <- faithful[, 2]  # Old Faithful Geyser data
                bins <- seq(min(x), max(x), length.out = input$bins + 1)
                
                # draw the histogram with the specified number of bins
                hist(x, breaks = bins, col = 'skyblue', border = 'white')
        })
        
        output$usagePlot <- renderPlot({
                x<-schools$logins
                y<-schools$hours
                new.school<-data.frame(logins=c(input$tlogins))
                
                plot(
                        schools$logins,
                        schools$hours,
                        xlab = "usage (hours)",
                        ylab = "number of teacher logins"
                        )
                abline(fit, col="red")
                abline(v=input$tlogins, col="blue")
                abline(h=predict(fit, new.school), col="blue")
                
                output$estimate<-renderText(
                        paste(
                                "You chose an estimate of",
                                input$tlogins,
                                "teacher logins."
                        )
                              
                )
                output$result<-renderText(
                        paste(
                                "The estimated usage would be",
                                round(predict(fit, new.school)),
                                "."
                        )
                )
        })
})