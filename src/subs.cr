require "shodan"

module Subs
  VERSION = "0.1.0"

  # Basic input validation
  if ARGV.size != 2
    puts "Usage: subs <api key> <domain>"
    exit
  end

  # Setup the API wrapper
  client = Shodan::Client.new(ARGV[0])

  begin
    # Grab the list of subdomains
    domain_info = client.domain(ARGV[1])

    if domain_info.data
      # Create a unique list of subdomains
      # We need to tell the compiler that this value will never be nil
      info = domain_info.data.not_nil!.uniq { |item| item.subdomain }

      # Print the information
      info.each do |item|
        if item.subdomain != nil && item.subdomain != ""
          puts "#{item.subdomain}.#{ARGV[1]}"
        end
      end
    else
      puts "No data available"
    end
  rescue ex: Shodan::ShodanClientException
    puts ex.to_s
  end

end
