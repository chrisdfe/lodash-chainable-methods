_       = require 'lodash'
request = require 'request-promise'
cheerio = require 'cheerio'
Promise = require 'bluebird'

class Scraper
  url: 'https://lodash.com/docs/'

  constructor: ->
    @body = null
    @$ = null

  scrape: ->
    Promise.try => @request()
      .then => @parse()
      .then => @print()

  request: ->
    request @url
      .then (body) =>
        @body = body
        @$ = cheerio.load @body
        @body

  parse: ->
    $docContainer = @$('.doc-container')
    $sections = $docContainer.children('div')

    chainableSection = _.find $sections, (section) =>
      title = @$(section).children('h2').children('code').html()
      _.includes title, "Seq"

    # chainableList = _.find @$(chainableSection).children('div')[0]
    chainableList = @$(chainableSection).html()

  print: ->

module.exports = Scraper
