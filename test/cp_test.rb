require 'test_helper'
require 'cp'

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

class CpTest < Minitest::Test
  def test_can_create_instances
    cp = Cp.new(['test_file.txt', 'copy.txt'])

    assert_instance_of Cp, cp
  end

  def test_accepts_an_array_with_two_filenames
    cp = Cp.new(['test_file.txt', 'copy.txt'])

    assert_equal 2, cp.args.count
  end

  def test_can_read_the_contents_of_the_first_file
    cp = Cp.new(['test_file.txt', 'copy.txt'])
    contents = cp.readfile
    expected =  "Here is some text\n" +
                "That we are going to copy\n" +
                "With a ruby program!\n"

    assert_equal expected, contents
  end

  def test_creates_a_new_file_named_after_second_array_element
    cp = Cp.new(['test_file.txt', 'copy.txt'])

    assert File.exists?('copy.txt')
  end

  def test_copies_contents_of_first_file_to_second_file
    cp = Cp.new(['test_file.txt', 'copy.txt'])
    cp.copyfile

    assert_equal File.read('test_file.txt'), File.read('copy.txt')
  end
end
