$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "encoding_with_bom/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "encoding_with_bom"
  s.version     = EncodingWithBom::VERSION
  s.authors     = ["Andrey Kozlovskiy cfc1020"]
  s.email       = ["cfc9209@gmail.com"]
  s.homepage    = "https://github.com/cfc1020"
  s.summary     = "Encoding and adding BOM"
  s.description = "Simply encoding and adding BOM in your text data at start of line"
  s.license     = "MIT"

  s.rubyforge_project = "encoding_with_bom"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'iconv', '>= 1.0.4'

  s.add_development_dependency "sqlite3"
end
