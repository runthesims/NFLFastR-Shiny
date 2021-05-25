FROM rocker/r-base:latest

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
    libssl-dev

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean


RUN R -e "install.packages(c('plyr', 'dplyr','DT', 'DBI', 'odbc', 'RPostgres', 'shiny', 'stringr', 'xgboost', 'fastrmodels' , 'nflfastR'), repos='http://cran.rstudio.com/')"
