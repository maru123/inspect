require 'pp'

results = Dir.glob('*.log').map do |file_name|
  details = File.foreach(file_name).map do |row|
    profiles = row.split(' ')
    {mem: profiles.first.to_i, loc: profiles.last}
  end

  { time: file_name.split('.').first,
    total: details.map{|detail| detail[:mem]}.inject(:+),
    top3: details.sort_by{|detail| detail[:mem]}.reverse[0..2]
  }
end

pp results
