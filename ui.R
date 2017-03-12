
# Shiny app with 3 fields that the user can submit data for
shinyUI(
  fluidPage(
    h2(titlePanel("Shiny app with local file storage")),
    br(),
    
    sidebarLayout(
      
      sidebarPanel(
        textInput(inputId = "inptNm"
                  , label = "Name"
                  , value = ""),
        
        checkboxGroupInput(inputId    = "inptCnfrmd"
                           , label    = "Confirmed"
                           , choices  = c("Yes", "No") 
                           , selected = ""
                           , inline   = TRUE),
        
        dateInput(inputId  = "inptDt"
                  , label  = "Date confirmed"
                  , value  = ""
                  , format = "yyyy-mm-dd"),
        
        textInput(inputId = "inptNts"
                  , label = "Additional notes"
                  , value = ""),
        
        actionButton(inputId = "svData"
                     , label = "Save Data"
                     , class = "btn-primary")
      ), 
      
      mainPanel(
        dataTableOutput("responses")
      )
    )
  )
)