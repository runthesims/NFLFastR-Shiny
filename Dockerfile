FROM rocker/r-base:latest

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

RUN R -e "install.packages(c('plyr', 'data.table', 'dplyr','DT', 'DBI', 'odbc', 'RPostgres', 'shiny', 'shinycssloaders', 'stringr', 'xgboost', 'fastrmodels' , 'nflfastR', 'dbplyr', 'shinyWidgets', 'shinydashboard', 'tidyverse', 'DT'), repos='http://cran.rstudio.com/', dependencies = T)"
