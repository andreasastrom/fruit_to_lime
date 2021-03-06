require 'spec_helper'
require 'fruit_to_lime'

describe FruitToLime::CsvHelper do
  it "should" do
    v = FruitToLime::CsvHelper.text_to_hashes("id;navn
1;Noerrebro")
    v.should include({"id"=>"1","navn"=>"Noerrebro"})
  end
  it "should handle sv chars" do
    v = FruitToLime::CsvHelper.text_to_hashes("id;navn
1;Bj\u{00F6}rk")
    v.should include({"id"=>"1","navn"=>"Bj\u{00F6}rk"})
  end
end
