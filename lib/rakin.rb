class Rakin

  ANGRY_RAKINS_PHRASES = ["GONNA RAKE THINGS UP! BRR!", 
                          "WHY YOU GOTTA CALL UP A RAKIN FO' NUTHIN?",
                          "RAKINS GONNA GETCHA!",
                          "STEALIN YO' STUFF!"]

  def self.speaks message
    rakin = <<-EOF
                   ,,,, 
                 .'     `/\\_/\\
                '        <@V@>     /===#{ '=' * (message.length+2) }
     <((((((((((  )    (  \\./   <==   #{message}  =
                \\(''''''\\(\\(       \\===#{ '=' * (message.length+2) }
                 `-"`-"  " "
    EOF

    rakin
  end

  def self.talks_back
    speaks ANGRY_RAKINS_PHRASES[ rand(ANGRY_RAKINS_PHRASES.length)]
  end

  def self.consider_events
    first_arg  = ARGV[0]
    second_arg = ARGV[1]

    if first_arg.nil?
      puts Rakin.talks_back
    elsif !first_arg.nil? && first_arg=='install'
      puts Rakin.speaks "INSTALLIN' #{second_arg}, YO."
      system "gem", "install", second_arg
    elsif !first_arg.nil? && first_arg=='help'
      puts "rakins install <gem> will install a gem, rakins <command> will bundle exec the command."
    elsif !first_arg.nil? && first_arg=='origin'
      system "open", "http://www.youtube.com/watch?v=QHQ7bt5LBj8"
    else
      puts Rakin.speaks "EXECIN' #{first_arg}, YO."
      system "bundle", "exec", *ARGV
    end
  end

end
