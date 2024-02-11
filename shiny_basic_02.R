library(shiny)

# User Interface (UI)
ui <- fluidPage(
  titlePanel("Simple Sum Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter first number:", value = 0),
      numericInput("num2", "Enter second number:", value = 0)
    ),
    mainPanel(
      textOutput("sum")
    )
  )
)

# Server Logic
server <- function(input, output) {
  output$sum <- renderText({
    sum(input$num1, input$num2)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
