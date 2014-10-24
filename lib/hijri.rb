class Hijri
  attr_accessor :day, :month, :year, :month_name
         
  def self.convert(time)
    h = self.new

    jd = gregorian_to_jd(time.year, time.month, time.day)    
    isl = jd_to_islamic(jd)

    h.year  = isl[0]
    h.month = isl[1]
    h.day   = isl[2]
    h.month_name = hijri_month(isl[1])

    return h
  end
  
  # LEAP_GREGORIAN  --  Is a given year in the Gregorian calendar a leap year ?
  def self.leap_gregorian(year)
    if ((year % 4) == 0) && (!((year % 100) == 0) && ((year % 400) != 0))
      true
    else
      false
    end
  end
  
  # GREGORIAN_TO_JD  --  Determine Julian day number from Gregorian calendar date
  # using GREGORIAN_EPOCH = 1721425.5;
  def self.gregorian_to_jd(year, month, day)
    (1721425.5 - 1) + (365 * (year - 1)) +
      ((year - 1) / 4).floor + (-((year - 1) / 100).floor) +
        ((year - 1) / 400).floor + ((((367 * month) - 362) / 12) +
          ((month <= 2) ? 0 : (leap_gregorian(year) ? -1 : -2)) + day).floor
  end
  
  # ISLAMIC_TO_JD  --  Determine Julian day from Islamic date
  # using ISLAMIC_EPOCH = 1948439.5;
  def self.islamic_to_jd(year, month, day)
    (day  + (29.5 * month - 1).ceil + (year - 1) * 354 +
      ((3 + (11 * year)) / 30).floor + 1948439.5) - 2
  end

  # JD_TO_ISLAMIC  --  Calculate Islamic date from Julian day
  def self.jd_to_islamic(jd)
    jd = (jd).floor + 0.5
    year = (((30 * (jd - 1948439.5)) + 10646) / 10631).floor
    month = [12, ((jd - (29 + islamic_to_jd(year, 1, 1))) / 29.5).ceil + 1].min
    day = (jd - islamic_to_jd(year, month, 1)).floor
    if day == 0
      day = 30
    else
      day
    end    
    return dt = [year, month, day]
  end

  def self.hijri_month(month)

    case month
      when 0
        "MUHARRAM-UL-HARAAM"
      when 1
        "MUHARRAM-UL-HARAAM"
      when 2
        "SAFAR-UL-MOZAFFAR"
      when 3
        "RABI-UL-AWWAL"  
      when 4
        "RABI-UL-AKHAR"
      when 5
        "JAMADI-UL-AWWAL"
      when 6
        "JAMADI-UL-AKHAR"
      when 7
        "RAJAB-UL-HARAAM"  
      when 8
        "SHABAN-UL-MOAZZAM"
      when 9
        "RAMZAN-UL-MUBARAK"
      when 10
        "SHAWWAL-UL-KARIM"
      when 11
        "ZILQADAT-UL-HARAAM"  
      when 12
        "ZILHAJAT-UL-HARAAM"        
    end

  end

end