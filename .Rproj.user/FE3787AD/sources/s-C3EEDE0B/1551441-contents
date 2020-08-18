library(shiny)
# source("prepare_scratch.R")
# source("turn_scan_into_single_cards.R")


# Define UI for application that draws a histogram
ui <- fluidPage(

  h1("Digitalisierung von Aussteigerkarten und Versendung an das zuständige Gesundheitsamt"),
    sidebarPanel(
      
      h3("Scans"),
      textOutput("numberofscans"),
      br(),
      actionButton("neuescans", "Neue Scans holen"),
  
      h3("Karten"),
      textOutput("numberofcards"),
      br(),
      actionButton("naechstekarte", "Nächste Karte"),
      
      h3("Eingabe"),
      textOutput("nameofscan"),
      textOutput("pdflengthtext"),
      br(),
      dateInput("date",  "Flugdatum", value = "2020-06-11"),
      textInput("Flugnummer", "Flugnummer", "Flugnummer"),
      verbatimTextOutput("Flugnummer"),
      textInput("Sitzplatz", "Sitzplatz", "Sitzplatz"),
      verbatimTextOutput("Sitzplatz"),
      textInput("PLZ", "PLZ", "PLZ"), verbatimTextOutput("PLZ"),
      actionButton("anGAsenden", "Senden")
    ),
    
    mainPanel(
      imageOutput("image1", width="100px")
    )
  
)
    

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  
  observeEvent(input$aufnull, {
    prepare_scratch()
  })
  

  observeEvent(input$neuescans, {
    showModal(modalDialog(
      title = "Neuen Scan verarbeiten",
      "Hier sollte das Script gestartet werden, dass einen Scan aus dem gemeinsamen Scan-Eingangsordner holt, zu Bildern verarbeitet und die Bilder in einen pesönlichen Bilderordner speichert"
    ))
  })
  
  observeEvent(input$naechstekarte, {
    showModal(modalDialog(
      title = "Nächste Karte",
      "Hier sollte das Script gestartet werden, dass das erste Bild aus dem persönlichen Bilderordner anzeigt und verschiebt"
    ))
  })

    observeEvent(input$anGAsenden, {
    showModal(modalDialog(
      title = "An das zuständige Gesundheitsamt senden",
      "Hier sollte das Script gestartet werden, dass das die oben eingegebenen Informationen in einer Excel-Tabelle speichert, diese mit einem Passwort versieht, anhand der PLZ das passende Gesundheitsamt raussucht und entweder direkt verschickt oder Outlook öffnet und eine passende E-Mail vorbereitet. Außerdem sollen die oben eingegebenen Informationen noch in einer großen Excel-Tabelle gespeichert werden, so dass bei einer Flugzeug-Nachverfolgung anhand der Flugnummer alle betroffenen Personen identifiziert werden können."
    ))
  })
    output$numberofscans <- renderText({
      anzahlscans <- length(list.files(paste0("01_scans/")))
      paste("Unbearbeitete Scans:", anzahlscans)
    })
  
    output$numberofcards <- renderText({
      anzahlcards <- length(list.files(paste0("03_pngs/")))
      paste("Unbearbeitete Karten:", anzahlcards)
    })  
    
  
    output$image1 <- renderImage({
      list(src = "www/examplescan_output_clean.png",
           alt = paste("Aussteigerkarte"))

    }, deleteFile = FALSE)


}

# Run the application 
shinyApp(ui = ui, server = server)
