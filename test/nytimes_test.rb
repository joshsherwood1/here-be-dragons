require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/nytimes'

class NytimesTest < Minitest::Test
  attr_reader :hash

  def setup
    @hash = Nytimes::DATA
  end

  def test_it_can_get_copyright
    result = @hash[:copyright]

    assert result, "Copyright (c) 2018 The New York Times Company. All Rights Reserved."
  end

  def test_it_can_get_array_of_stories
    # binding.pry
    result_2 = @hash[:results]

    assert result_2.is_a? (Array)
    assert_equal 44, result_2.count
  end

  def test_it_can_get_all_stories_with_subsection_of_politics
    result_3 = @hash[:results].select{|hash| hash[:subsection] == "Politics" }


    assert result_3.is_a? (Array)
    assert_equal 6, result_3.count
    assert_equal "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight",
      result_3.first[:title]
    assert_equal "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.",
      result_3.last[:title]
  end

end
