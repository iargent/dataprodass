library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("How Teacher Logins Affect Student Usage (Academic Year 2012)"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("tlogins",
                                    "Number of logins:",
                                    min = 0,
                                    max = 10000,
                                    value = 1000)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("usagePlot")
                )
        )
))