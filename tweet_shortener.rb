def dictionary
  {"hello" => 'hi', "to" => '2', "two" => '2', "too" => '2',
    "for" => '4', "four" => '4', "For" => '4', "be" => 'b', "you" => 'u',
    "at" => "@", "and" => "&"
  }
end

def word_substituter(string)
  keys_array = dictionary.keys
  string_array = string.split
  counter = 0
  string_array.each do |word|
    keys_array.each do |key_word|
      if word == key_word
        string_array[counter].replace(dictionary[key_word])
      end
    end
    counter += 1
  end
  output_string = string_array.join(' ')
  return output_string
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
    output_tweet = word_substituter(tweet)
    puts output_tweet
  end
end

def selective_tweet_shortener(tweet_string)
  if tweet_string.length > 140
    output_tweet = word_substituter(tweet_string)
  else
    return tweet_string
  end
end

def shortened_tweet_truncator(tweet_string)
  output_string = tweet_string.selective_tweet_shortener
  if output_string.length >= 140
    string_end = output_string.length
    output_string = output_string.delete(135..string_end)
    puts output_string + "(...)"
  else
    puts output_string
  end
end
