require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")


def fight(player1, player2)
    puts "Joueur 1 :#{player1.name}"
    puts "Joueur 2 :#{player2.name}"
    puts "------------"
end

def battle(player1, player2)
    puts "Voici l'etat de chaque joueur"
    puts "#{player1.name} a #{player1.life_point} points de vie"
    puts "#{player2.name} a #{player2.life_point} points de vie"
    puts "------------"
    puts "Passons a la face d'attaque"
    while player1.life_point > 0 && player2.life_point > 0
        player1.attacks(player2)
        if player2.life_point <= 0
            break
        end
        player2.attacks(player1)
        puts "------------"
        puts "Voici l'etat de chaque joueur"
        puts "#{player1.name} a #{player1.life_point} points de vie"
        puts "#{player2.name} a #{player2.life_point} points de vie"
        puts "------------"
    end
end

def perform(player1, player2)
    fight(player1, player2)
    battle(player1, player2)
end

perform(player1, player2)