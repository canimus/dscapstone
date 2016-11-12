Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")
install.packages(Needed, dependencies=TRUE) 
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/", type = "source")  

# Location of corpus locally
cname <- file.path("d:", "dscapstone", "final", "en_US")

library(tm)   
docs <- Corpus(DirSource(cname))

## Transformattion stage for standarisation of document content
## START: Preprocessing Stage
## ========================================================================
docs <- tm_map(docs, removePunctuation)   # *Removing punctuation:*
docs <- tm_map(docs, removeNumbers)      # *Removing numbers:*
docs <- tm_map(docs, tolower)   # *Converting to lowercase:*
docs <- tm_map(docs, removeWords, stopwords("english"))   # *Removing "stopwords"

library(SnowballC) 
docs <- tm_map(docs, stemDocument)   # *Removing common word endings* (e.g., "ing", "es")
docs <- tm_map(docs, stripWhitespace)   # *Stripping whitespace  
docs <- tm_map(docs, PlainTextDocument)
# END: Preprocessing Stage


dtm <- DocumentTermMatrix(docs)
tdm <- TermDocumentMatrix(docs)


