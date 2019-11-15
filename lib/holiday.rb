require 'pry'

def second_supply_for_fourth_of_july( holiday_hash )
  
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays( holiday_hash, supply )
  holiday_hash[:winter].each {|holiday, values| values << supply }
end


def add_supply_to_memorial_day( holiday_hash, supply )
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies (holiday_hash, season, holiday_name, supply_array )
  holiday_hash[season][holiday_name] = supply_array 
  holiday_hash
end

def all_winter_holiday_supplies( holiday_hash )
  all_supplies =  holiday_hash[:winter].collect{ |key,val| val}
  all_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)

  holiday_hash.each do |season, holiday|
    puts "#{season.to_s.capitalize}:"
    
    holiday.each do |key,val|
        supply = val.join(", ")
        capitalized_holiday =  key.to_s.split("_").collect{|el| el.capitalize}.join(" ") 
        puts "  #{capitalized_holiday}: #{supply}" 
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
 result = []
   holiday_hash.each do |season, holiday|
      holiday.each do |key, val|
       result << key if val.include?("BBQ")
     end
  end
  
  result
end