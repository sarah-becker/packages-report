library(tidyverse)
library(repurrrsive)


View(got_chars) #30
length(got_chars)
got_chars[9]
got_chars[[9]]


str(got_chars[9], list.len = 4)
str(got_chars[[9]], list.len = 4)

str(got_chars[[18]], list.len = 4)

# aliases 
dany <- got_chars[[9]]

View(dany)

dany[["aliases"]]

length(dany[["aliases"]])

#test for just dany in preparation for map
.x <-  got_chars[[9]]
length(.x[["aliases"]])  
 
#map 
map(got_chars, ~length(.x[["aliases"]])) #.x is being redefined within the function( aka it is no longer dany)


# titles 
#map 
map(got_chars, ~length(.x[["titles"]])) 

#other versions of map that turns into an atomic vector
# change alias into integer vector
map_int(got_chars, ~length(.x[["aliases"]])) 

# map name and make a character vector
map_chr(got_chars, ~.x[["name"]])

#name shortcut
map_chr(got_chars, "name")

# map name and make a character vector
map_lgl(got_chars, ~.x[["alive"]])

# map aliases and make a character vector
map_chr(got_chars, ~.x[["aliases"]]) # Error: Result 1 is not a length 1 atomic vector

map_chr(got_chars, ~.x[["playedBy"]]) # Error: Result 20 is not a length 1 atomic vector
map(got_chars, ~.x[["playedBy"]]) # maps to list with no error
pluck(got_chars, 20, "playedBy") # look at problem result
map_chr(got_chars, list("playedBy",1)) # pulls out the characters played by one actor

# map birth and make a character vector
map_chr(got_chars, ~.x[["born"]])

#sw pilots
map(sw_vehicles, "pilots") #lots of different values
map_chr(sw_vehicles, "pilots") #Error: Result 1 is not a length 1 atomic vector
# solutions in jennys code


#when names would be helpful but you arent getting them!
map_lgl(got_chars, "alive")
got_chars_names <- set_names(got_chars, map_chr(got_chars, "name"))
map_lgl(got_chars_names, "alive") #yay!
map_lgl(got_chars_names, "alive") %>% tibble::enframe() #turns into a "normal looking rectangle"
