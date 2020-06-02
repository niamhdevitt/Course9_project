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




