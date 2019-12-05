install.packages("httr")
library(httr)
library(jsonlite)
bechdel <- fromJSON("http://bechdeltest.com/api/v1/getAllMovies?")
movies <- IMDB_Top250movies2_OMDB_Detailed%>%
          separate(imdbID,into=c("imdbID","imdbid"), sep=2)%>%
          select(-imdbID)
movies_comb <- left_join(movies,bechdel,by="imdbid")%>%select(-title,-year)
movies_comb <- movies_comb(mutate)

#rename award column to just have oscar_win and another column saying
# oscar_nom, separate each actor into its own row, separate each writer
#and director into their own row