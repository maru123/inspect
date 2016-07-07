require 'pp'

results = []
total = 0

Dir.glob('*.log').each do |file|
  total = 0
  details = []

  File.open(file).each do |row|
    profiles = row.split(' ')
    total += profiles[0].to_i
    details << {mem: profiles[0].to_i, loc: profiles[1]}
  end

  results << { time: file.split('.').first,
                total: total,
                top3: details.sort_by{|detail| detail[:mem]}.reverse[0..2]
              }
end

pp results
