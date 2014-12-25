require 'iconv'

module EncodingWithBom
  class String
    def set_encoding_and_add_bom(encoding_to)
      set_encoding(encoding_to).add_bom
    end

    def set_encoding_and_add_bom!(encoding_to)
      replace set_encoding_and_add_bom encoding_to
    end

    def add_bom
      raise_if_encoding_does_not_exist encoding

      BOM_LIST_hex[encoding].force_encoding(encoding) + self
    end

    def add_bom!
      replace add_bom
    end

    def set_encoding(encoding_to)
      raise_if_encoding_does_not_exist encoding_to

      Iconv.conv encoding_to, encoding, self
    end

    def set_encoding! encoding_to
      replace set_encoding encoding_to
    end

    private

    # Byte Order Mark
    BOM_LIST_hex = {
        Encoding::UTF_8 => "\xEF\xBB\xBF",
        Encoding::UTF_16BE => "\xFE\xFF",
        Encoding::UTF_16LE => "\xFF\xFE",
        Encoding::UTF_32BE => "\x00\x00\xFE\xFF",
        Encoding::UTF_32LE => "\xFE\xFF\x00\x00",
    }

    BOM_LIST_hex.freeze

    def encoding_exist?(coding)
      !BOM_LIST_hex[Encoding.find coding].nil?
    end

    def raise_if_encoding_does_not_exist(*encoding_array)
      encoding_array.each do |coding|
        raise ArgumentError, "Encoding does not exist for #{coding}" unless encoding_exist? coding
      end
    end
  end
end
