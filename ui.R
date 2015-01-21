library(shiny)

# Define UI for price of Diamonds application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict the Price of Diamonds"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      
      ##checkboxInput("outliers", "Show outliers", FALSE),
      sliderInput('mass', 'Enter mass',value = 0.25, min = 0.10, max = 0.50, step = 0.05,),
      selectInput("color", "Points Color:",
                  c("Black" = "black",
                    "Blue" = "blue",
                    "Red" = "red")),
      h3('Author: Hugo Cam'),
      p('This application is the final project for the Data Science specialization offered by Coursera and the Johns Hopkins Bloomberg School of Public Health.')
      
      
    ),
    
    # Show the caption and plot of the requested variable against
    # 
    mainPanel(
      h3(textOutput("caption")),
      
      textOutput("captionMass"),
      textOutput("captionPrice"),
      
      plotOutput("mpgPlot"),
      
      h3('Explanation'),
      p('This is a basic regression model. Data is diamond prices (Singapore dollars) and diamond weight in carats (standard measure of diamond mass).To get the data use library(UsingR); data(diamond)'),
      p('Plotting the fitted regression line and datas stored '),
      p('It shows the Price valueas against the mass of the Diamond.'),
      p('Based on the diamond weight the application will predict the Diamond price.')
      
  )
)))
