penguin_spp_pickerInput <- function(inputId) {
  
  pickerInput(inputId = inputId, 
              label = "Select species:",
              choices = c("Adelie", "Chinstrap", "Gentoo"),
              selected = c("Adelie", "Chinstrap", "Gentoo"),
              multiple = TRUE,
              options = pickerOptions(actionsBox = TRUE))
  
}