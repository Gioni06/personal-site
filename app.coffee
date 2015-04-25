axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
less         = require 'less'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
marked       = require 'marked'
slugify      = require 'slug'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee')
    css_pipeline(files: 'assets/css/*.less')
    contentful
      access_token: process.env.TOKEN
      space_id: '2xk63okczz9t'
      content_types:
        blog_posts:
          id: '1fUnrMgZL8WeSu26AYQyOY'
          template: 'views/_single.jade'
          path: (e) -> "blog/#{slugify(e.title)}"
        abouts:
          id: '5636uGE6XY0eeaewA20iUq'
        social_media_accounts:
          id: '4cnAEgA5W88uumg8MKwIA6'      
  ]

  less:
    sourcemap: true

  'coffee-script':
    sourcemap: true
  server:
    clean_urls: true
    error_page: '404.html'  
  jade:
    pretty: true
  locals:
    markdown: marked
    contentful: contentful
    slugify: slugify
  debug: true