library(plotly)
Hives <- c('Treatment Hive 1', 'Treatment Hive 2','Treatment Hive 3','Control Hive 1', 'Control Hive 2','Control Hive 3')
Honeybees <-c(495,305,282,456,442,528)
Varroa <-c(92,18,30,189,90,60)
varroa.infestation.data <- data.frame(Hives, Honeybees, Varroa)

Bs<- plot_ly(
  data = varroa.infestation.data,
  x = Hives,
  y = Honeybees,
  type = "bar",
  name = "Honeybees",
  marker = list(
    color = toRGB("gray"))
)
Bs

Bs_V<- add_trace(
  Bs,
  x = Hives,
  y = Varroa,
  type = "bar",
  name = "Varroa",
  marker = list(
    color = toRGB("black"))
)


Bs_V<-layout(barmode = "stack", 
             xaxis = list(
               title = " ",
               showgrid = F
             ),
             yaxis = list(
               title = "# of Honeybees and Varroa",
               showgrid = F)
)

Bs_V

