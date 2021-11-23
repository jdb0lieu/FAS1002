
tdv_table <- tdv_table %>% fill(prov_territ, .direction = "down") # default is down

tdv_table <- tdv_table %>% extract(col = airport, #colone à extraire
                                   into = "airport_code", #on assigne dans quelle colone
                                   regex = "\\(([A-Z]{3})\\)$", #il s'agit ici de mettre le pattern dans l'exemple au moins 3 lettres, de A-Z en majuscule
                                   remove = FALSE) # dit si on enleve ou pas la colone

