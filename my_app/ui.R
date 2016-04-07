library(shiny)
library(datasets)
library(ggplot2)

words <- read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv",
                  header = T)

shinyUI(
  fluidPage(
    titlePanel("One thousand Most Frequently Used Words"),
    headerPanel("Это приложение показывает 1000 самых частотных слов некоторых языков. Данные основаны на материалах сайта http://www.101languages.net/common-words/. Нельзя гарантировать, что данные собраны хорошо (процесс сбора данных на сайте не описан), ровно как и не стоит верить переводам."),
    fluidRow(
      column(4,
             selectInput("language",
                         "Language:",
                         c("All",
                           unique(as.character(words$language))))
      )
    ),
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)
