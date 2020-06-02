Week4_Project_Shiny
========================================================
author: Niamh Devitt
date: 30th May 2020
autosize: true

Shiny Application Summary
========================================================

- This shiny app shows the relationship between population and violent crimes in the US
- It shows the relationship is *strongest* in terms of rape violent crimes and *weakest* in terms of murder violent crimes as population increases

Data
========================================================

- The data used in this application is the data on US arrests, which details the number of violent crimes per 100,000 population in different US cities.

```r
str(USArrests)
```

```
'data.frame':	50 obs. of  4 variables:
 $ Murder  : num  13.2 10 8.1 8.8 9 7.9 3.3 5.9 15.4 17.4 ...
 $ Assault : int  236 263 294 190 276 204 110 238 335 211 ...
 $ UrbanPop: int  58 48 80 50 91 78 77 72 80 60 ...
 $ Rape    : num  21.2 44.5 31 19.5 40.6 38.7 11.1 15.8 31.9 25.8 ...
```

```r
head(USArrests)
```

```
           Murder Assault UrbanPop Rape
Alabama      13.2     236       58 21.2
Alaska       10.0     263       48 44.5
Arizona       8.1     294       80 31.0
Arkansas      8.8     190       50 19.5
California    9.0     276       91 40.6
Colorado      7.9     204       78 38.7
```

How it works
========================================================

- Use the radio buttons to select a violent crime from the data
- The associated data will be displayed in relation to urban population in the scatter graph opposite
- You can change the graph by selecting a different radio button
- The linear regression line will update with your selection to show us the increasing or decreasing relatinoship with Urban population and these violent crimes

========================================================


```r
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

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  dataX <- USArrests$UrbanPop
  
  output$plot1 <- renderPlot({
   
    if (input$radio == "Murder") {
      ggplot(USArrests, aes(x=UrbanPop, y=Murder)) + geom_point()+geom_smooth(method=lm)
    }
    else if (input$radio == "Assault") {
      ggplot(USArrests, aes(x=UrbanPop, y=Assault)) + geom_point()+geom_smooth(method=lm)
    }
    else {
      ggplot(USArrests, aes(x=UrbanPop, y=Rape)) + geom_point()+geom_smooth(method=lm)
    }
  })
})
```

Example plot from Shiny Application
========================================================

![plot of chunk unnamed-chunk-1](Week4_project_shiny-figure/unnamed-chunk-1-1.png)
