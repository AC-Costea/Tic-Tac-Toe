class Board
    attr_reader :sign, :sign_round

    def initialize
        @cell1 = '-'
        @cell2 = '-'
        @cell3 = '-'
        @cell4 = '-'
        @cell5 = '-'
        @cell6 = '-'
        @cell7 = '-'
        @cell8 = '-'
        @cell9 = '-'
        @sign = 'x'
        @sign_round = 0
    end

    def create_board
        puts line1 = ["#{@cell1}|#{@cell2}|#{@cell3}"]
        puts line2 = ["#{@cell4}|#{@cell5}|#{@cell6}"]
        puts line3 = ["#{@cell7}|#{@cell8}|#{@cell9}"]
    end

    def mark_cell(cell_number)
        if @sign_round % 2 == 0
            @sign = 'x'
        else
            @sign = 'o'
        end

        case cell_number
        when 1
            @cell1 = @sign
        when 2
            @cell2 = @sign
        when 3
            @cell3 = @sign
        when 4
            @cell4 = @sign
        when 5
            @cell5 = @sign
        when 6
            @cell6 = @sign
        when 7
            @cell7 = @sign
        when 8
            @cell8 = @sign
        when 9
            @cell9 = @sign
        end
        self.create_board
        @sign_round += 1
    end

    def calculate_winner
        if (@cell1 == 'x' && @cell2 == 'x' && @cell3 == 'x') || (@cell1 == 'o' && @cell2 == 'o' && @cell3 == 'o')
            return 'Win'
        elsif (@cell4 == 'x' && @cell5 == 'x' && @cell6 == 'x') || (@cell4 == 'o' && @cell5 == 'o' && @cell6 == 'o')
            return 'Win'
        elsif (@cell7 == 'x' && @cell8 == 'x' && @cell9 == 'x') || (@cell7 == 'o' && @cell8 == 'o' && @cell9 == 'o')
            return 'Win'
        elsif (@cell1 == 'x' && @cell4 == 'x' && @cell7 == 'x') || (@cell1 == 'o' && @cell4 == 'o' && @cell7 == 'o')
            return 'Win'
        elsif (@cell2 == 'x' && @cell5 == 'x' && @cell8 == 'x') || (@cell2 == 'o' && @cell5 == 'o' && @cell9 == 'o')
            return 'Win'
        elsif (@cell3 == 'x' && @cell6 == 'x' && @cell9 == 'x') || (@cell3 == 'o' && @cell6 == 'o' && @cell9 == 'o')
            return 'Win'
        elsif (@cell1 == 'x' && @cell5 == 'x' && @cell9 == 'x') || (@cell1 == 'o' && @cell5 == 'o' && @cell9 == 'o')
            return 'Win'
        elsif (@cell3 == 'x' && @cell5 == 'x' && @cell7 == 'x') || (@cell3 == 'o' && @cell5 == 'o' && @cell7 == 'o')
            return 'Win'
        else
            return 'Lose'
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
    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
    end

    def player_selection
        puts 'Choose the name for player 1 :'
        @player1.name = gets.chomp
        puts 'Choose the name for player 2 :'
        @player2.name = gets.chomp
    end

    def play
        @board.create_board
        puts 'Introduce the number of the cell, from 1 to 9'
        9.times do
            if @board.sign_round % 2 == 0
                puts "#{@player1.name}, write the cell number :"
            else
                puts "#{@player2.name}, write the cell number :"
            end
            cell_number_input = gets.chomp
            @board.mark_cell(cell_number_input.to_i)
            if @board.calculate_winner == 'Win'
                puts 'You win'
                break
            end
        end
        puts 'You lost' if @board.calculate_winner == 'Lose'
    end
end
   
game = Game.new(Player.new('first', 'x'), Player.new('second', 'o'), Board.new)
game.player_selection
game.play
