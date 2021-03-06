require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel'

class ChiselTest <Minitest::Test

  def test_if_instance_of_chisel_exist
    chisel = Chisel.new

    assert_instance_of Chisel, chisel
  end

  def test_single_line_paragraph
    chisel = Chisel.new
    result = chisel.single_line_paragraph("This is the first line of the paragraph.")

    assert_equal "<p>This is the first line of the paragraph.</p>", result

  end

  def test_single_line_break_paragraph
    chisel = Chisel.new
    result = chisel.single_line_break_paragraph("This is the first line of the paragraph.\n This is the second line of the same paragraph.")

    assert_equal "<p>This is the first line of the paragraph. This is the second line of the same paragraph.</p>", result

  end


    def test_multiple_paragraphs_with_2_line_breaks
      chisel = Chisel.new
      result = chisel.multiple_paragraphs_with_2_line_breaks("This is the first line of the first paragraph.\n\nThis is the first line of the second paragraph.")

      assert_equal "<p>This is the first line of the first paragraph.</p>\n<p>This is the first line of the second paragraph.</p>", result
    end

    def test_for_hashtags
      chisel = Chisel.new
      result = chisel.for_hashtags("## Here's an H2")

      assert_equal "<h2>Here's an H2</h2>", result
    end

    def test_header_and_paragraph
      skip
      chisel = Chisel.new
      result = chisel.header_and_paragraph("# Header\n
      followed by text")

      assert_equal "<h1>Header</h1>\n <p>followed by text</p>", result
    end

    def test_for_more_hashtags
      skip
      chisel = Chisel.new
      result = chisel.for_hashtags("## Header 1\n## Header 2")

      assert_equal "<h2>Header 1</h2>\n<h2>Header 2</h2>", result
    end




end
