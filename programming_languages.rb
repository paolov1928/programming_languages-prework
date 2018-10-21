require 'pry'


class ::Hash
    def deep_merge(second)
        merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
        self.merge(second, &merger)
    end
end

def reformat_languages(languages)
  h = Hash.new
  a = Array.new
  languages.each do |style, values|
    h.merge!(values)
  end 
  languages.each do |style, values|
    values.each do |language, language_characteristics|
    a << [language,[:style, [style]]]
end
end
  a2 = Hash[a.map { |k0, (k, v)| [k0, {k => v}] }]
final = h.deep_merge(a2)
final[:javascript][:style]=[:oo, :functional]
final
end

