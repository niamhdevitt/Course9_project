library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("US Arrest Data: Violent Crimes by Population"),
  
  # Sidebar with a radio buttons
  sidebarLayout(
    sidebarPanel(
      h3("Select radio buttons to view relationship with population"),
      radioButtons("radio", "Select a crime for the graph",
                   list("Murder", "Assault", "Rape")),
      hr()
    ),
    
    #Main panel with plot
    mainPanel(
      plotOutput("plot1")
    )
  )
))
