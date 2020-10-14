require 'pry'

class Player

    attr_accessor :name, :life_point
    def initialize (player_name)
        @name = player_name
        @life_point = 10
    end

    def show_state
        puts "#{@name} a #{@life_point} points de vie"
    end

    def gets_damage(damage)
        @life_point = @life_point - damage
        if @life_point <= 0
            puts "#{name} a été tué"
        end
    end


    def attacks(player)
        puts "le joueur #{@name} attaque #{player.name}"
        damage = compute_damage
        puts "#{name} lui a infligé #{damage} point de degats"
        player.gets_damage(damage)
    end


    def compute_damage
        return rand(1..6)
      end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_point = 100
        @weapon_level = 1
    end

    def show_state
        if life_point > 0
        puts "#{name} a #{@life_point} point de vie et une arme de niveau #{@weapon_level}"
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
      end

    def search_weapon 
        de = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{de}"
        if de > @weapon_level
            @weapon_level << de
            puts "Tu as trouvé une meilleure arme, gardes la bougre"
        else
           puts "#•@@& elle n'est pas meilleure que celle que j'ai deja"
        end
    end
    
    def search_health_pack
        health = rand(1..6)
        if health == 1
            puts "Tu n'as rien trouve....dommage"
        elsif health >= 2 || health <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_point += 50
        elsif health == 6
                puts "Bravo, tu as trouvé un pack de +80 points de vie !"
                @life_point += 80
        end
        if @life_point > 100
            @life_point = 100
        end
    end

end

