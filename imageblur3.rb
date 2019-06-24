class Image

  def initialize (picture)
    @picture = picture
  end

  def get_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!(blur_dist)
    ones = get_ones

    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        ones.each do |found_row_number, found_col_number|
          if man_dist(col_number, row_number, found_col_number, found_row_number) <= blur_dist
            @picture[row_number][col_number] = 1
          end
        end
      end
    end
  end

  def man_dist (x1, y1, x2, y2)
    hor_dist = (x2 - x1).abs
    vert_dist = (y2 - y1).abs
    # (x2 - x1).abs + (y2 - y1).abs
    hor_dist + vert_dist
  end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

# original
image.output_image
puts

# blurred
image.blur!(2)
image.output_image