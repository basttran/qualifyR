# qualifyR
_A shinyApp for qualifying text data, typically with discourse analysis in view.

A modest and clumsy app that creates a form for assigning small chunks of texts to categories that are defined by the experimenter. 
Many improvements can be done, may need to be retought entirely but currently serves my purpose just fine.

__Please note the following: 

* input files and questionnaires are currently 'hardcoded' -- I hope it is understandable and transferable enough as is though.
* the app relies on dynamically creating questionnaire items and associated observers, for now it is preferable to use small dataframes as input data (aging desktop pc: ~300 rows is fine). 

__TO DO:

* Un-hardcode all the things!!!    \o \o \o
* Provide example data
* Allow the user to provide their input file(s), questionnaires and download their filled forms as dataframes (no need to write files to server as long as we deal with sensible data sizes)
* Reduce the latency when loading data or/and circumvent with a pagination system
* Progress bar and record confirmations
* Plot area (you probably do not want to viz' while you label, as rigor often requires. Still, (1) it can be used for demos and (2) may be useful for other activities...?)
* 'Loose' authentication, if you need the contribution of several labelers

