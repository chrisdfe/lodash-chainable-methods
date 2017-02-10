express = require 'express'
router = express.Router()

chainableMethods = require '../lib/chainable'
nonChainableMethods = require '../lib/non_chainable'

# GET home page.

router.get '/', (req, res) ->
  res.render 'index',
    chainable     : chainableMethods
    non_chainable : nonChainableMethods


module.exports = router
