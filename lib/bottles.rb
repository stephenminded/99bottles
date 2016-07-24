class Bottles

  def song
    verses(99, 0)
  end

  def verses(start, stop)
    start.downto(stop).inject([]) do |acc, n|
      acc << verse(n)
    end.join("\n")
  end

  def verse(n)
    <<-VERSE
#{first_sentence(n)}
#{second_sentence(n)}
VERSE
  end

  private

  def first_sentence(n)
    "#{bottle_string(n).capitalize} of beer on the wall, #{bottle_string(n)} of beer."
  end

  def second_sentence(n)
    if n > 0
      "Take #{one_or_it(n)} down and pass it around, #{bottle_string(n-1)} of beer on the wall."
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end

  def bottle_string(n)
    if n == 6
      "1 six pack"
    elsif n > 1
      "#{n} bottles"
    elsif n == 1
      "1 bottle"
    else
      "no more bottles"
    end
  end

  def one_or_it(n)
    n > 1 ? "one" : "it"
  end
end
