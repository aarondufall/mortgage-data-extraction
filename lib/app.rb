# Working with Tesseract version 3.02.02_3d
# Export environment variables so compiler can find tessract and leptonica
ENV['CFLAGS'] = '-I/usr/local/Cellar/tesseract/3.02.02_3/include -I/usr/local/Cellar/leptonica/1.72/include'
ENV['LDFLAGS'] = '-L/usr/local/Cellar/tesseract/3.02.02_3/lib -L/usr/local/Cellar/leptonica/1.72/lib'

require 'tesseract'
require 'pdf-reader'

# PDF reader test

pdf = PDF::Reader.new(Dir.pwd + '/images/summary.pdf')

puts "PDF"
pdf.pages.each do |page|
  puts page.text
end


# OCR test

e = Tesseract::Engine.new {|e|
  e.language  = :eng
  e.blacklist = '|'
}

test = e.text_for(Dir.pwd + '/images/summary.jpg')

puts "IMAGE"
puts test
