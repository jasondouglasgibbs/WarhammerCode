##Warhammer Stats Script##


##Libraries##
library(readxl)
library(tidyverse)
library(plotly)
library(tictoc)

tic("Run Time")
StatsTable<-read_xlsx("Warhammer Inventory.xlsx", skip=1)

##Summarizes data based on various groupings.##
##Battlefield Role.##
PieData_Role<-StatsTable %>%
  group_by(`Battlefield Role`) %>%
  summarize(Sum = sum(`Total As Built Points`, na.rm = FALSE))

PieData_Role

##Model Name.##
PieData_Model<-StatsTable %>%
  group_by(`Model Name`) %>%
  summarize(Sum = sum(`Total As Built Points`, na.rm = FALSE))

PieData_Model

##Creates Donut Plot on various groupings##

##Battlefield Role.##
DonutPlot_Role<- plot_ly(PieData_Role, labels = ~`Battlefield Role`, values = ~Sum,
                    showlegend=FALSE, textinfo = "label+percent", textposition="inside")

DonutPlot_Role<-DonutPlot_Role%>% add_pie(hole=0.6)
DonutPlot_Role<-DonutPlot_Role %>% layout(title = 'Total As Built Points by Battlefield Role')
DonutPlot_Role

##Model Name.##
DonutPlot_Model<- plot_ly(PieData_Model, labels = ~`Model Name`, values = ~Sum,
                    showlegend=FALSE, textinfo = "label+percent", textposition="inside")

DonutPlot_Model<-DonutPlot_Model%>% add_pie(hole=0.6)
DonutPlot_Model<-DonutPlot_Model %>% layout(title = 'Total As Built Points by Model Name')
DonutPlot_Model
toc()