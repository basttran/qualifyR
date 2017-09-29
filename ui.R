#Add to break down the original file: 6000 rows was impossible to load in my context
files<-list(
  "Aucun fichier choisi" = 0,
  "A2T1" = "A2T1",
  "A2T2" = "A2T2",
  "A2T3" = "A2T3",
  "A3T1" = "A3T1",
  "A3T2" = "A3T2",
  "A3T3" = "A3T3",
  "A4T1" = "A4T1",
  "A4T2" = "A4T2",
  "A4T3" = "A4T3",
  "B2T1" = "B2T1",
  "B2T2" = "B2T2",
  "B2T3" = "B2T3",
  "B3T1" = "B3T1",
  "B3T2" = "B3T2",
  "B3T3" = "B3T3",
  "B4T1" = "B4T1",
  "B4T2" = "B4T2",
  "B4T3" = "B4T3",
  "C2T1" = "C2T1",
  "C2T2" = "C2T2",
  "C2T3" = "C2T3",
  "C3T1" = "C3T1",
  "C3T2" = "C3T2",
  "C3T3" = "C3T3",
  "C4T1" = "C4T1",
  "C4T2" = "C4T2",
  "C4T3" = "C4T3")

question<-list("Aucun questionnaire" = 0,
               "décision"= 1,
               "activité" = 2,
               "débat" = 3,
               "lexique" = 4,
               "résolution" = 5)


  fluidPage(title = 'ZLB QDAP',
          sidebarLayout(
            #the control panel
            sidebarPanel(style = "position:fixed;width:inherit;",
                         #Choose a file to label
                         selectInput("file","Fichier",choices = files),
                         #We want the user to ignore other questionnaires while filling one
                         selectInput("question","Questionnaire", choices=question),
                         #Help texts or labeling task instructions
                         uiOutput("help")),
            #A table of text strings (depending on the file) with checkboxes (depending on the questionnaire)
            mainPanel(uiOutput("qda"))
          )
)

