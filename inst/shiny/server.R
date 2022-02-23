library(shiny)
library(DT)
library(metadat)
library(tools)

shinyServer(function(input, output, session) {

  db <- tools:::Rd_db("metadat")
  ## Concept metadata per Rd file.
  name <- lapply(db, tools:::.Rd_get_metadata, "name")
  title <- lapply(db, tools:::.Rd_get_metadata, "title")
  concepts <- lapply(db, tools:::.Rd_get_metadata, "concept")

  dataExtracted <- as.data.frame(cbind(name, title))


  df = dataExtracted
  options(DT.options = list(pageLength = 15))

  # row selection
  output$x11 = DT::renderDataTable(df, server = FALSE, selection = 'single', colnames=cbind("File Name", "Title"))
  output$y11 = renderPrint(input$x11_rows_selected)


})


