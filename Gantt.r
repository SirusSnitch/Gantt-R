library(tidyverse)
library(ggplot2)

#Forming Gantt Elements as a data.frame

Gantt <- data.frame(
  Task = c("Phase 1","Task 1","Task 2","Task 3","Phase 2",
           "Task 4","Task 5","Task 6","Phase 3",
           "Task 7","Task 8","Task 9","Task 10","Phase 4",
           "Task 11","Task 12","Task 13"),
  StartDate = as.Date(c("2024-02-05","2024-02-05","2024-02-15","2024-02-25","2024-03-05",
                        "2024-03-05","2024-03-15","2024-03-25","2024-04-05",
                        "2024-04-05","2024-04-13","2024-04-21","2024-04-29",
                        "2024-05-05","2024-05-05","2024-05-15","2024-05-25")),
  EndDate = as.Date(c("2024-03-05","2024-02-15","2024-02-25","2024-03-05","2024-04-05",
                      "2024-03-15","2024-03-25","2024-04-05","2024-05-05",
                      "2024-04-13","2024-04-21","2024-04-29","2024-05-05",
                      "2024-06-05","2024-05-15","2024-05-25","2024-06-05")),
  Phase = c("Phase","Tâche","Tâche","Tâche","Phase",
            "Tâche","Tâche","Tâche","Phase",
            "Tâche","Tâche","Tâche","Tâche","Phase",
            "Tâche","Tâche","Tâche")
)


Gantt

#Constructing Gantt Module


ggplot(Gantt, aes(x = StartDate, xend = EndDate, y = fct_rev(fct_inorder(Task)), yend = Task, color = Phase)) +
  geom_segment(linewidth = 10) +
  labs(
    x = "Duration",
    y = "Task"
  ) +
  theme_bw() +
  theme(legend.position = "none") +
  theme(
    plot.title = element_text(size = 20),
    axis.text.x = element_text(size = 11),
    axis.text.y = element_text(size = 11)
  ) +
  scale_x_date(date_breaks = "1 month", date_labels = "%B", position="top")

