library(shiny)
library(UsingR)

library(ggplot2)

# diamond data and regression line

data(diamond)
fit <- lm(price ~ carat, data = diamond)

# Define server logic required to plot 
shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is
  # shared by .... functions
  
  formulaText <- reactive({
    input$mass
    })
   
  # Return the formula text for printing as a caption
  output$caption <- renderText("Price ~ Mass")
    
  
  # Weight entered
   
  output$captionMass <- renderText({
    paste("Diamond Mass = ",formulaText())
          })
  
  # predicting the price of a diamind  
  
  output$captionPrice <- renderText({
     x <- formulaText()
     y <-coef(fit)[1] + coef(fit)[2] * as.numeric(x)
     paste("Diamond Price =", as.character(y))
    
  }) 
  
  # Generate a plot 
  output$mpgPlot <- renderPlot({
    g = ggplot(diamond, aes(x = carat, y = price))
    g = g + xlab("Mass (carats)")
    g = g + ylab("Price (SIN $)")
    g = g + geom_point(size = 7, colour = input$color, alpha=0.5)
    g = g + geom_point(size = 5, colour = "blue", alpha=0.2)
    g = g + geom_smooth(method = "lm", colour = "black")
    g
     })
})
