# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do | candidate |
    if candidate[:id] == id then
      return candidate
    end
  end
  return nil
end

def experienced?(candidate)
  # Your code Here
  if candidate[:years_of_experience] >= 2 then
    return true
  else
    return false
  end
end

def githubPoints(candidate, threshold)
  if candidate[:github_points] >= threshold then
    return true
  else 
    return false
  end  
end

def knowsRorP(candidate)
  candidate[:languages].include? "Ruby" or candidate[:languages].include? "Python"
  # if candidate[:languages].include? "Ruby" or candidate[:languages].include? "Python" then
  #   return true
  # else
  #   return false
  # end
end

def appliedRecently(candidate)
  puts DateTime.now.to_date - candidate[:date_applied]
  if DateTime.now.to_date - candidate[:date_applied] < 15 then
    return true
  else
    return false
  end
end

def oldEnough(candidate)
  candidate[:age] > 17
end

def qualified_candidates(candidates)
  # Your code Here
  answer = []
  candidates.each do | candidate |
    if experienced?(candidate) &&
       githubPoints(candidate, 100) &&
       knowsRorP(candidate) &&
       appliedRecently(candidate) &&
       oldEnough(candidate) then
       answer << candidate   
    end
  end
  return answer
end

def ordered_by_qualifications(candidates)
  sorted_candidates = candidates.sort_by { |hsh| [hsh[:years_of_experience], hsh[:github_points]]}
  sorted_candidates.reverse!  
end

# More methods will go below
