data_smoother <- function(date,data){
  
  #define smoothing period - test date interval
  date <- date %>% 
    mutate(diff = as.numeric((mdate - lag(mdate)), 'days'))
  
  if (mean(date$diff, na.rm = TRUE) > 29){
  timeinterval = "monthly"
  } else {
  timeinterval = "weekly"
  }
  
  #set smooth period
  if (timeinterval == "weekly"){
      sm=12
  }else{
      sm=1
  }

library(slider)
  
smoothed_data <- data %>% 
  mutate(
    moving_avg = slide_dbl(
      .x = param, 
      .f = ~ mean(., na.rm = TRUE),
      .before = 12,
      .after = 12,
      .complete = FALSE
    )
  )

}