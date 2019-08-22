# Title     : Twitter API Scraping
# Objective : Scrap Twitter with API

# Step 1: Install and load rtweet package 

install.packages("rtweet")
library(rtweet)

install.packages("devtools")
library(devtools)

# Step 2: API Authorization 
# With access token / secret
token <- create_token(
  consumer_key = "vxjRvkmQx23R1aPu2hRnw6ADO",
  consumer_secret = "SIHhGBsIZwmPurBdUPh9joHUKmgEYC1CYEYIXc6S3sKB5wipJb",
  access_token = "111589223-vYzDUbIs6k49l8wz8uhGxAWRvr4zAZsGS12lCRZ9",
  access_secret = "sMkngJV2QjCqV9jwBDaFk3eblRh1YtFAZDadz3irHjXt2")

# Step 3: Crawling Data Twitter 

# Define your twitter username 
my_username='CommuterLine'

# Setelah proses otentikasi berhasil, kita siap untuk “menambang” data (crawling) dari Twitter. Untuk kepeluan ini, rtweet mengemas berbagai fungsi yang cukup lengkap, di antaranya:
#   
#   search_tweets() : mencari tweet dengan kata kunci tertentu
# lookup_users() : menampilkan data detail dari satu atau lebih user(s)
# get_timelines() : menampilkan status/tweet yang pernah diposting oleh user tertentu aka timeline
# get_followers() : menampilkan list followers dari user tertentu
# get_friends() : menampilkan list fiends/followings atau yang di-follow user tentu
# dan masih banyak yang lain seperti untuk menampilkan retweet, siapa yang me-retweet, mendapatkan list favorite, menampilkan trending topics, cleansing tweet, dan juga ekspor data ke file csv.

# find 1000 tweets with keywords: "#JKTLife"
tweet <- search_tweets(q = "#JKTLife", n = 1000)

# to know the column names of tweet 
colnames(tweet)
dim(tweet)

# let's take a look at three columns
k <- tweet[,c("created_at", "screen_name", "text")]

# Menampilkan timeline atau status/tweet terbaru yang pernah di-posting oleh satu atau beberapa user(s). Setiap user akan ditampilkan hingga maksimal 3.200 tweet.
# menampilkan timeline dari infojakarta
timeline <- get_timeline(my_username)

# filter or select three columns
timeline[,c("created_at", "source", "text")]

# Menampilkan data detail dari satu atau lebih akun/user(s).
user <- lookup_users(my_username)

# filter or select three columns
user[,c("created_at", "screen_name", "name", "location", "description")]

head(user)

# followers <- get_followers()
# followings <- get_friends()
# lookup_users(followings$user_id)

write.csv(k, "TwitterApi.csv")
