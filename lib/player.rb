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

      # word_array = word.chars
      word.upcase!

      temp_array = []

      word.each_char do |char|
        if @tiles.include? char
          temp_array << @tiles.delete_at(@tiles.index(char))
        else
          @tiles.concat(temp_array)
          return nil #TODO For Game Play
        end
      end

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
      # For Game Wave 3
      num_to_draw = MAX_TILES - @tiles.length

      @tiles.concat(tile_bag.draw_tiles(num_to_draw)) if num_to_draw > 0
    end

    def pass

    end

    private #begin private methods
    # leaving here for assignment; real usage in Game class
    def won?
      return @total_score > 100
    end


  end #end of Player class

end #end of module
