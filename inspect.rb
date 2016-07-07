require 'pp'

results = []
total = 0

Dir.glob('*.log').each do |file_name|
  details = File.foreach(file_name).map do |row|
    profiles = row.split(' ')
    {mem: profiles[0].to_i, loc: profiles[1]}
  end

  results << { time: file_name.split('.').first,
                total: details.map{|detail| detail[:mem]}.inject(:+),
                top3: details.sort_by{|detail| detail[:mem]}.reverse[0..2]
              }
end

pp results
