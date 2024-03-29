FROM rocker/tidyverse:latest

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# system libraries of general use
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    curl

RUN R -e "install.packages(c('plyr', 'data.table',' DT', 'DBI', 'odbc', 'RPostgres', 'shiny', 'shinyjs', 'shinyWidgets', 'shinycssloaders', 'reactablefmtr', 'xgboost', 'fastrmodels' , 'nflfastR', 'dbplyr', 'shinydashboard', 'hrbrthemes', 'waiter', 'sever', 'glue', 'bs4Dash', 'ggtext', 'sysfonts', 'showtext'), repos='http://cran.rstudio.com/', dependencies = T)"