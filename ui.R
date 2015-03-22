library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("How Teacher Logins Affect Student Usage (Academic Year 2012)"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        p("Set the slider to the number of times teachers log in.
                          This app will predict the resulting amount of usage from students."
                        ),
                        sliderInput("tlogins",
                                    "Number of logins:",
                                    min = 0,
                                    max = 10000,
                                    value = 1000,
                                    step = 100)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        p("The plot below compares student usage of an
                        online revision service with the number of times
                        that teachers logged in. Each plotted point is one
                         secondary school in the UK."
                        ),
                        p("The hypothesis is that the more teachers log
                          in to use the service and set tasks for their
                          students, the more students will use the service,
                          too."
                        ),
                        p("The red line shows a linear model calculated
                          from the data. The blue lines indicate
                          predicted usage for a school where the number of
                          times teachers logged in over a year (set by
                          the slider on the left)."                        
                        ),
                        plotOutput("usagePlot"),
                        textOutput("estimate"),
                        textOutput("result")
                )
        )
))