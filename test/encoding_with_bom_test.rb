require 'test_helper'
require 'iconv'
require 'encoding_with_bom/string_ext'

class EncodingWithBomTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, EncodingWithBom
  end

  test "Equals encoding" do
    encoding_to = "UTF-16LE"
    in_str = "FOO"
    out_str = "FOO"
    encoding_from = in_str.encoding.to_s

    assert_equal in_str.set_encoding_and_add_bom(encoding_to).encoding.to_s, (Iconv.conv encoding_to, encoding_from, out_str).encoding.to_s
  end
end
