

library(shiny)

# Define the user interface (UI)
ui <- fluidPage(
  titlePanel("Simple Shiny App - Number display"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("number", "Choose a number:", min = 1, max = 10, value = 5)
    ),
    mainPanel(
      textOutput("output")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$output <- renderText({
    paste0("You chose number ", input$number)
  })
}

# Run the app
shinyApp(ui = ui, server = server)

