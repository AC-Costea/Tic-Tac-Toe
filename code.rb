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
    end

    def create_board
        puts line_1 = ["#{@cell_1}|#{@cell_2}|#{@cell_3}"]
        puts line_2 = ["#{@cell_4}|#{@cell_5}|#{@cell_6}"]
        puts line_3 = ["#{@cell_7}|#{@cell_8}|#{@cell_9}"]
    end

    def mark_cell(cell_number)
        case cell_number
        when 1
            @cell_1 = 'x'
        when 2
            @cell_2 = 'x'
        when 3
            @cell_3 = 'x'
        when 4
            @cell_4 = 'x'
        when 5
            @cell_5 = 'x'
        when 6
            @cell_6 = 'x'
        when 7
            @cell_7 = 'x'
        when 8
            @cell_8 = 'x'
        when 9
            @cell_9 = 'x'
        end
        self.create_board
    end
end

new_board = Board.new
new_board.create_board
new_board.mark_cell(1)
new_board.mark_cell(5)
new_board.mark_cell(9)
