library(shinytest2)

test_that("{shinytest2} recording: twi-name-greeting", {
  app <- AppDriver$new(test_path("../.."), name = "twi-name-greeting", height = 761, 
      width = 1211)
  app$set_inputs(name_input = "Aakriti")
  app$set_inputs(name_input = "Aakriti p")
  app$set_inputs(name_input = "Aakriti ")
  app$set_inputs(name_input = "Aakriti Poudel")
  app$click("greeting_button_input")
  app$set_inputs(name_input = "Aakriti")
  app$click("greeting_button_input")
  app$click("greeting_button_input")
  app$set_window_size(width = 1211, height = 761)
  app$set_inputs(name_input = "Aakriti ")
  app$set_inputs(name_input = "Aakriti Poudel")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: repeated-greetings", {
  app <- AppDriver$new(test_path("../.."), name = "repeated-greetings", height = 761, 
      width = 1211)
  app$set_inputs(name_input = "sam")
  app$click("greeting_button_input")
  app$expect_values()
  app$set_inputs(name_input = "s")
  app$set_inputs(name_input = "")
  app$set_inputs(name_input = "Aakriti")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
  app$set_inputs(name_input = "Kalu")
  app$click("greeting_button_input")
})


test_that("{shinytest2} recording: no-name-greeting", {
  app <- AppDriver$new(test_path("../.."), name = "no-name-greeting", height = 761, 
      width = 1211)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: no-name-greeting-01", {
  app <- AppDriver$new(test_path("../.."), name = "no-name-greeting-01", height = 761, 
      width = 1211)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: default-three-spp", {
  app <- AppDriver$new(test_path("../.."), name = "default-three-spp", height = 761, 
      width = 1211)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: deselect-adelie", {
  app <- AppDriver$new(test_path("../.."), name = "deselect-adelie", height = 761, 
      width = 1211)
  app$set_inputs(penguin_spp_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguin_spp_input = c("Chinstrap", "Gentoo"))
  app$set_inputs(penguin_spp_input_open = FALSE, allow_no_input_binding_ = TRUE)
  app$expect_values()
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: repeated-plot-selection", {
  app <- AppDriver$new(test_path("../.."), name = "repeated-plot-selection", height = 761, 
      width = 1211)
  app$set_inputs(penguin_spp_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguin_spp_input = character(0))
  app$set_inputs(penguin_spp_input_open = FALSE, allow_no_input_binding_ = TRUE)
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguin_spp_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguin_spp_input = "Chinstrap")
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguin_spp_input_open = FALSE, allow_no_input_binding_ = TRUE)
  app$expect_values(output = "scatterplot_output")
})
