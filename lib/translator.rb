require 'yaml'

def load_library(stuff)
  emotes = YAML.load_file(stuff)
  hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emotes.each do |names, emoticons|
    hash['get_meaning'][emoticons[1]] = names 
    hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  hash
end

def get_japanese_emoticon(yaml_path, emoticon)
  my_library = load_library(yaml_path)
  japanese = ""
  my_library["get_emoticon"].each do |a, b|
    if emoticon == a 
      japanese = b 
    end
  end
  if japanese == ""
    return "Sorry, that emoticon was not found"
  else 
    return japanese
  end
end

def get_english_meaning(yaml_path, emoticon)
  my_library = load_library(yaml_path)
  english = ""
  my_library['get_meaning'].each do |a, b|
    if a == emoticon 
      p a
    end
   
    if english = ""
      return "Sorry, that emoticon was not found"
    end
    return english
end

