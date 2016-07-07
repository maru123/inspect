require 'pp'

results = []
total = 0

Dir.glob('*.log').each do |file|
  details = []

  File.open(file).each do |row|
    profiles = row.split(' ')
    details << {mem: profiles[0].to_i, loc: profiles[1]}
  end

  results << { time: file.split('.').first,
                total: details.map{|detail| detail[:mem]}.inject(:+),
                top3: details.sort_by{|detail| detail[:mem]}.reverse[0..2]
              }
end

pp results
