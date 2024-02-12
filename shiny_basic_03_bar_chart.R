# # Install required packages if not installed
# if (!requireNamespace("shiny", quietly = TRUE)) {
#   install.packages("shiny")
# }

# Load necessary libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Define the data
data <- data.frame(
  colour = c("Red", "Red", "White", "Green", "Blue", "Brown", "Orange", "Blue", "White", "Brown", "Green", "White"),
  count = c(20, 35, 28, 15, 32, 18, 22, 24, 20, 34, 32, 36)
)

# Define the UI for the Shiny app
ui <- fluidPage(
  titlePanel("Color Count Bar Chart"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Dropdown menu for selecting multiple color categories 
      #(use checkboxGroupInput or selectizeInput with option , multiple = TRUE)
      checkboxGroupInput("color_selector", "Choose Color Categories", choices = unique(data$colour))
    ),
    mainPanel(
      # Output for the bar chart
      plotOutput("bar_chart")
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output) {
  # Reactive function to filter data based on selected color categories
  filtered_data <- reactive({
    data %>%
      filter(colour %in% input$color_selector)
  })
  
  # Output for the bar chart
  output$bar_chart <- renderPlot({
    ggplot(filtered_data(), aes(x = colour, y = count, fill = colour)) +
      geom_bar(stat = "identity") +
      labs(title = "Count of Selected Colors")
  })
}

# Run the Shiny app
shinyApp(ui, server)



