require 'test_helper'

class CpAcceptanceTest < Minitest::Test
  def test_copies_file_to_a_new_file
    `cp test_file.txt another_file.txt`
    first_file_content = `cat test_file.txt`
    second_file_content = `cat another_file.txt`

    assert_equal first_file_content, second_file_content

    `ruby lib/cp.rb another_file.txt yet_another_file.txt`
    third_file_content = `cat yet_another_file.txt`

    assert_equal second_file_content, third_file_content
  end
end
