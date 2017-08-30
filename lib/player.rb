require_relative 'scoring'

module Scrabble

  MAX_TILES = 7

  class Player
    attr_reader :name, :plays, :total_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def play(word)
      return false if won?

      @plays << word
      word_score = Scrabble::Scoring.score(word)
      @total_score += word_score

      return word_score
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      num_to_draw = MAX_TILES - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(num_to_draw)) if num_to_draw > 0
    end

    private #begin private methods

    def won?
      return @total_score > 100
    end


  end #end of Player class

end #end of module
