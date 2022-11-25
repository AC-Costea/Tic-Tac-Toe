class Board
    def initialize
        @cell_1 = '-'
        @cell_2 = '-'
        @cell_3 = '-'
        @cell_4 = '-'
        @cell_5 = '-'
        @cell_6 = '-'
        @cell_7 = '-'
        @cell_8 = '-'
        @cell_9 = '-'
        @sign = 'x'
        @sign_round = 0
    end

    def create_board
        puts line_1 = ["#{@cell_1}|#{@cell_2}|#{@cell_3}"]
        puts line_2 = ["#{@cell_4}|#{@cell_5}|#{@cell_6}"]
        puts line_3 = ["#{@cell_7}|#{@cell_8}|#{@cell_9}"]
    end

    def mark_cell(cell_number)
        if @sign_round % 2 == 0
            @sign = 'x'
        else
            @sign = 'o'
        end

        case cell_number
        when 1
            @cell_1 = @sign
        when 2
            @cell_2 = @sign
        when 3
            @cell_3 = @sign
        when 4
            @cell_4 = @sign
        when 5
            @cell_5 = @sign
        when 6
            @cell_6 = @sign
        when 7
            @cell_7 = @sign
        when 8
            @cell_8 = @sign
        when 9
            @cell_9 = @sign
        end
        self.create_board
        @sign_round += 1
    end

    def calculate_winner
        if (@cell_1 == 'x' && @cell_2 == 'x' && @cell_3 == 'x') || (@cell_1 == 'o' && @cell_2 == 'o' && @cell_3 == 'o')
            puts 'You win'
        elsif (@cell_4 == 'x' && @cell_5 == 'x' && @cell_6 == 'x') || (@cell_4 == 'o' && @cell_5 == 'o' && @cell_6 == 'o')
            puts 'You win'
        elsif (@cell_7 == 'x' && @cell_8 == 'x' && @cell_9 == 'x') || (@cell_7 == 'o' && @cell_8 == 'o' && @cell_9 == 'o')
            puts 'You win'
        elsif (@cell_1 == 'x' && @cell_4 == 'x' && @cell_7 == 'x') || (@cell_1 == 'o' && @cell_4 == 'o' && @cell_7 == 'o')
            puts 'You win'
        elsif (@cell_2 == 'x' && @cell_5 == 'x' && @cell_8 == 'x') || (@cell_2 == 'o' && @cell_5 == 'o' && @cell_9 == 'o')
            puts 'You win'
        elsif (@cell_3 == 'x' && @cell_6 == 'x' && @cell_9 == 'x') || (@cell_3 == 'o' && @cell_6 == 'o' && @cell_9 == 'o')
            puts 'You win'
        elsif (@cell_1 == 'x' && @cell_5 == 'x' && @cell_9 == 'x') || (@cell_1 == 'o' && @cell_5 == 'o' && @cell_9 == 'o')
            puts 'You win'
        elsif (@cell_3 == 'x' && @cell_5 == 'x' && @cell_7 == 'x') || (@cell_3 == 'o' && @cell_5 == 'o' && @cell_7 == 'o')
            puts 'You win'
        else
            puts 'You lost'
        end
    end
end

class Player
    attr_accessor :name, :sign
    def initialize(name, sign)
        @name = name
        @sign = sign
    end
end

class Game
    attr_reader :player_1

    def initialize(player_1, player_2, board)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def play
        puts 'Choose the name for player 1'
        @player_1.name = gets
        puts 'Choose your sign'
        @player_1.sign = gets
        puts 'Choose the name for player 2'
        @player_2.name = gets
        puts 'Choose your sign'
        @player_2.sign = gets
        puts @player_1.name, @player_2.name
    end

end
   
game = Game.new(Player.new('first', 'x'), Player.new('second', 'o'), Board.new)
game.play
