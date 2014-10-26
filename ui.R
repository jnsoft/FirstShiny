library(shiny)

shinyUI(fluidPage(

  titlePanel(title="T test", windowTitle = "T test"),

  sidebarLayout(position = "left",
                
                sidebarPanel(
                  p(em("For help using this application:",a("Github repo",href="https://github.com/jnsoft/FirstShiny"))),
                  
                  radioButtons("paired", "Choose test:",
                               c("Unpaired" = "unpaired",
                                 "Paired" = "paired")),
                  
                  checkboxInput("variance", "Treat the two variances as equal:", value = FALSE),
                  
                  radioButtons("hypothesis", "Alternative hypothesis:",
                               c("Two sided" = "two.sided",
                                 "Greater" = "greater",
                                 "Less" = "less")),
                
                  sliderInput("confInterval", "Confidence level of the interval", 90, 100, value=95, step = 0.5,
                            round = FALSE, locale = "us",
                            ticks = TRUE, animate = FALSE),
                  
                  textInput("values1","Enter values for group 1 (seperated by comma)"),
                  
                  textInput("values2","Enter values for group 2 (seperated by comma)"),
                  
                  br(),
                  actionButton('goButton','Run test')
 
                ),
                
                mainPanel(
                  h3('Output'),
                  
                  h4('You entered'),
                  verbatimTextOutput("inputParameters"), 
                  
                  br(),
                  h4('Test results'),
                  verbatimTextOutput("testresult")
                )
                
                
            
    )
))

# p(em("Github repository documentation:",a("Github repo",href="https://github.com/jnsoft/FirstShiny"))),
