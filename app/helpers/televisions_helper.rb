module TelevisionsHelper
  def price_range_name(bucket)
    if bucket["from"] && bucket["to"]
      "#{number_to_currency bucket["from"], precision: 0} - #{number_to_currency bucket["to"], precision: 0}"
    elsif bucket["from"]
      "#{number_to_currency bucket["from"], precision: 0} & Above"
    elsif bucket["to"]
      "#{number_to_currency bucket["to"], precision: 0} & Below"
    else
      bucket["key"]
    end
  end
end
