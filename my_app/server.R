library(shiny)
library(datasets)
library(ggplot2)

words <- read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv",
                  header = T)

shinyServer(function(input, output) {
  output$table <- DT::renderDataTable(DT::datatable({
    data <- words
    if (input$language != "All") {
      data <- data[data$language == input$language,]
    }
    data
  }))
})
