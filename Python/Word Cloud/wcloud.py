# [5 Levels of Generating Word Cloud in Python](https://medium.com/techtofreedom/5-levels-of-generating-word-cloud-in-python-e95471d0d9b1)
# This is a way to generate a word cloud image.
# First `pip install wordcloud`

import wordcloud
import imageio.v3 as iio

# Take an image and make an outline fot the wordcloud.

mk = iio.imread('python/python.jpg')

# create a working variable for accessing the module wordcloud

w = wordcloud.WordCloud(width=1400,
                        height=700,
                        min_font_size=10,
                        min_word_length=4,
                        background_color='white',
                        max_words=200,
                        include_numbers=True,
                        prefer_horizontal=.5,
                        stopwords="with")

# Use a file to make a wordcloud. Read it into the module so it can generate and output to a file the word cloud.

with open('python/Road Trip Home.md','r') as text:
    w.generate(text.read())
    w.to_file("python/zenwordcloud.png")