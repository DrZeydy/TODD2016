load ("uwtracts.RData")

dpal <- colorQuantile("Blues", c(min.pov, max.pov), n=9)
opal <- colorQuantile("Oranges", c(min.pov, max.pov), n=9)
wpal <- colorQuantile("Reds", c(min.pov, max.pov), n=9)
jpal <- colorQuantile("Greens", c(min.pov, max.pov), n=9)

m <- leaflet() %>% addProviderTiles("OpenStreetMap.BlackAndWhite") %>%
  addPolygons(data=uwtracts[uwtracts$COUNTYFP == "063",], group="Durham", popup=~tract_popup,
              fillColor=~dpal(numChildrenPov), fillOpacity = 0.5, color = "blue", weight = 1) %>%
  addPolygons(data=uwtracts[uwtracts$COUNTYFP == "101",], group="Johnston", popup=~tract_popup,
              fillColor=~jpal(numChildrenPov), fillOpacity = 0.5, color = "green", weight = 1) %>%
  addPolygons(data=uwtracts[uwtracts$COUNTYFP == "135",], group="Orange", popup=~tract_popup,
              fillColor=~opal(numChildrenPov), fillOpacity = 0.5, color = "orange", weight = 1) %>%
  addPolygons(data=uwtracts[uwtracts$COUNTYFP == "183",], group="Wake", popup=~tract_popup,
              fillColor=~wpal(numChildrenPov), fillOpacity = 0.5, color = "red", weight = 1) %>%
  addLayersControl(overlayGroups = c("Wake","Durham","Orange","Johnston"),
                   options = layersControlOptions(collapsed = FALSE))
m