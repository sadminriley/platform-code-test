require_relative 'award'


def blue_plus_quality(award)
  # it would appear this value never changes. Storing as static value and breaking monolithic function into several.
  award.quality = 80
end

def blue_first_age(award)
  # increases with 2 if expired and 1 otherwise
  if award.expires_in <= 0
    award.quality += 2
  else
    award.quality += 1
  end
 end

def normal_age(award)
  if award.expires_in <= 0
    award.quality -= 2
  else
    award.quality -= 1
  end
end


def blue_star_age(award)
  if award.expires_in <= 0
    award.quality -= 4
  else
    award.quality -= 2
  end
end


def blue_quality_compare(award)
  # if quality expires return 0
  if award.expires_in <= 0
    award.quality = 0
  # +3 if it expires in 5 days
  elsif award.expires_in <= 5
    award.quality += 3
  # +2 if it expires in 10 days
  elsif award.expires_in <= 10
    award.quality += 2
  else
    award.quality +=1
  end
end

def update_quality(awards)
  awards.each do |award|
    if award.name != 'Blue First' && award.name != 'Blue Compare'
      if award.quality > 0
        if award.name != 'Blue Distinction Plus'
          award.quality -= 1
        end
      end
    else
      if award.quality < 50
        award.quality += 1
        if award.name == 'Blue Compare'
          if award.expires_in < 11
            if award.quality < 50
              award.quality += 1
            end
          end
          if award.expires_in < 6
            if award.quality < 50
              award.quality += 1
            end
          end
        end
      end
    end
    if award.name != 'Blue Distinction Plus'
      award.expires_in -= 1
    end
    if award.expires_in < 0
      if award.name != 'Blue First'
        if award.name != 'Blue Compare'
          if award.quality > 0
            if award.name != 'Blue Distinction Plus'
              award.quality -= 1
            end
          end
        else
          award.quality = award.quality - award.quality
        end
      else
        if award.quality < 50
          award.quality += 1
        end
      end
    end
  end
end
