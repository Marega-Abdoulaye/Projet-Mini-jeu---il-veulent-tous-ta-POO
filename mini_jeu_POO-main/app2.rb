require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def bienvenu
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
end

def user
    puts "Comment t'appelles tu?"
    print ">"
    human_name = gets.chomp
    human = HumanPlayer.new(human_name)
    puts "Bienvenu en enfer #{human.name}"
    return human
end

def computer
    enemies = []
    player1 = Player.new("Josiane")
    player2 = Player.new("Jose")
    enemies << player1
    enemies << player2
    puts "Voici tes enemies :"
    enemies.each do |enemie| 
        puts enemie.name
    end
    return enemies
end

def fight(user, computer)
    while user.life_point > 0 && (computer[0].life_point > 0 || computer[1].life_point >0)
        puts "----------"
        puts "Voici l'etat de tes enemies :"
        puts "#{computer[0].name} a #{computer[0].life_point} points de vie"
        puts "#{computer[1].name} a #{computer[1].life_point} points de vie"
        puts "---------------------"
        puts "Tu es a #{user.life_point} points de vie"
        puts "----------------"
        puts "Que veux tu faire?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "attaquer un joueur en vue:"
        puts "0 - Josiane a #{computer[0].life_point} points de vie"
        puts "1 - Jose a #{computer[1].life_point} points de vie"
        action = gets.chomp
        puts "------------------"
        case action
            when "a"
                user.search_weapon 
                puts "------------"
            when "s"
                user.search_health_pack
            when "0"
                user.attacks(computer[0])
            when "1"
                user.attacks(computer[1])
            else
                puts "Rechoisis bien cette fois"
            end
            computer.each do |battle|
                if battle.life_point > 0 
                battle.attacks(user)
                end
            end

      end
      puts " La partie est finie!"
      if user.life_point > 0 
        puts "Bien joueeee"
      else 
        puts "Tu as perdu chakal concentres toi"
      end
end

def perform
    bienvenu
    human = user
    ennemies = computer
    fight(human, ennemies)
end

perform