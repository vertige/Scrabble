# SimpleCov needs to be FIRST THING in spec helper
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
#require 'minitest/pride'
require_relative '../lib/scoring'
require_relative '../lib/player'
require_relative '../lib/tile_bag'
require_relative '../lib/dictionary'
require_relative '../lib/board'
require_relative '../lib/game'

reporter_options = { color:true}
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(reporter_options)

# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
