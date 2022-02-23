library(shiny)

navbarPage(

  title = 'metadat: Database',

  tabPanel(
    'Test',
        DT::dataTableOutput('x11'),
        verbatimTextOutput('y11')

  )
)
