# df<-read.csv("zlb_qda.csv", header=TRUE, sep="\t", quote ="\"", stringsAsFactors =FALSE)
# df<-df[1:50,]
# saveRDS(df,"df")
server <- reactiveValues(df = NULL)
# file <-"df"
# server$df<-readRDS("df")
# if (file.exists(paste0(file))){
#   df <- readRDS(paste0(file))
# }
 
function(input, output, session) {
  
  

    output$help <- renderUI({
      if (input$question =='0') {
        return()
      } else if (input$question == '1') {
        includeMarkdown("help_idc.Rmd")
      } else if (input$question == '2') {
        includeMarkdown("help_act.Rmd")
      } else if (input$question=='3') {
        includeMarkdown("help_deb.Rmd")
      } else if (input$question=='4') {
        includeMarkdown("help_lex.Rmd")
      }else if (input$question=='5') {
        includeMarkdown("help_def.Rmd")
      }
    })
        output$qda <- renderUI({
      if (input$file=='0') {return()}
      if (input$file=='0') {
        return()
      } else if (input$question=='1') {
        isolate(server$df<-readRDS(paste0(input$file)))
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("intel_", i)]], {
            server$recorded<-"prout"
            isolate(server$df[i,7]<-input[[paste0("intel_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("model_", i)]], {
            isolate(server$df[i,8]<-input[[paste0("model_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("choix_", i)]], {
            isolate(server$df[i,9]<-input[[paste0("choix_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
      } else if (input$question=='2') {
        isolate(server$df<-readRDS(paste0(input$file)))
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("tache_", i)]], {
            isolate(server$df[i,10]<-input[[paste0("tache_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("regul_", i)]], {
            isolate(server$df[i,11]<-input[[paste0("regul_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
      } else if (input$question=='3') {
        isolate(server$df<-readRDS(paste0(input$file)))
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("expan_", i)]], {
            isolate(server$df[i,12]<-input[[paste0("expan_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("raffi_", i)]], {
            isolate(server$df[i,13]<-input[[paste0("raffi_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
      } else if (input$question=='4') {
        isolate(server$df<-readRDS(paste0(input$file)))
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("class_", i)]], {
            isolate(server$df[i,14]<-input[[paste0("class_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("descr_", i)]], {
            isolate(server$df[i,15]<-input[[paste0("descr_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
      } else if (input$question=='5') {
        isolate(server$df<-readRDS(paste0(input$file)))
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("probl_", i)]], {
            isolate(server$df[i,16]<-input[[paste0("probl_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
        lapply(1:isolate(nrow(server$df)), function (i) {
          observeEvent(input[[paste0("solut_", i)]], {
            isolate(server$df[i,17]<-input[[paste0("solut_", i)]])
            isolate(saveRDS(server$df,paste0(input$file)))
          })
        })
      }
      isolate(server$df<-readRDS(paste0(input$file)))
      wellPanel(id="scroll",
                lapply(1:isolate(nrow(server$df)), function(i) {
                  fluidRow(
                    renderText("********************************************************************************************************************************************************************************************************************"),
                    column(2,renderText(isolate(server$df[i,1]))),
                    column(2,renderText(isolate(server$df[i,4]))),
                    column(2,renderText(isolate(server$df[i,5]))),
                    column(4,renderText(isolate(server$df[i,6]))),
                    if (input$question == '0') {
                      return()
                    } else if (input$question == '1') { 
                      column(2,checkboxInput(paste0("intel_",i),"intel",value=isolate(server$df[i,7])),
                             checkboxInput(paste0("model_",i),"model",value=isolate(server$df[i,8])),
                             checkboxInput(paste0("choix_",i),"choix",value=isolate(server$df[i,9])))
                    } else if (input$question == '2') {
                      column(2,checkboxInput(paste0("tache_",i),"tâche",value=isolate(server$df[i,10])),
                             checkboxInput(paste0("regul_",i),"régulation",value=isolate(server$df[i,11])))
                    } else if (input$question=='3') {
                    column(2,checkboxInput(paste0("expan_",i),"expansion",value=isolate(server$df[i,12])),
                           checkboxInput(paste0("raffi_",i),"raffinement",value=isolate(server$df[i,13])))
                    } else if (input$question=='4') {
                  column(2,checkboxInput(paste0("class_",i),"classification",value=isolate(server$df[i,14])),
                         checkboxInput(paste0("descr_",i),"description",value=isolate(server$df[i,15])))
                    }else if (input$question=='5') {
                      column(2,checkboxInput(paste0("probl_",i),"définition de problème",value=isolate(server$df[i,16])),
                             checkboxInput(paste0("solut_",i),"définition de solution",value=isolate(server$df[i,17])))
                    }
                  )
                  })
                )
  })
}

