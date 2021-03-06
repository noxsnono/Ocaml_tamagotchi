(*****************************************************************************)
(*                                                                           *)
(*   Vincent Jacquier                                     :::      ::::::::  *)
(*   Jean-Jacques MOIROUX                               :+:      :+:    :+:  *)
(*                                                    +:+ +:+         +:+    *)
(*   By: vjacquie <vjacquie@student.42.fr>          +#+  +:+       +#+       *)
(*   By: jmoiroux <jjmoiroux@gmail.com>           +#+#+#+#+#+   +#+          *)
(*                                                     #+#    #+#            *)
(*   Created: 2015/06/26 by vjacquie jmoiroux         ###   ########.fr      *)
(*                                                                           *)
(*****************************************************************************)

include Type

class pet =
	object (self)
		val mutable _health = 100
		val mutable _energy = 100
		val mutable _hygiene = 100
		val mutable _happyness = 100
		val mutable _last_action = Type.Eat

		method init_all (d:Type.data) =
			_health <- d.health;
			_energy <- d.energy;
			_hygiene <- d.hygiene;
			_happyness <- d.happyness;
			_last_action <- Type.Eat

		method eat =
			_health <- _health + 20;
			_energy <- _energy - 10;
			_hygiene <- _hygiene - 20;
			_happyness <- _happyness + 5;
			_last_action <- Type.Eat

		method thunder =
			_health <- _health - 20;
			_energy <- _energy + 25;
			_happyness <- _happyness - 20;
			_last_action <- Type.Thunder


		method bath =
			_health <- _health - 20;
			_energy <- _energy - 10;
			_hygiene <- _hygiene + 25;
			_happyness <- _happyness + 5;
			_last_action <- Type.Bath

		method kill =
			_health <- _health - 20;
			_energy <- _energy - 10;
			_happyness <- _happyness + 20;
			_last_action <- Type.Kill

		method restart = 
			_health <- 100;
			_energy <- 100;
			_hygiene <- 100;
			_happyness <- 100;
			_last_action <- Type.Restart

		method sleep =
			_energy <- _energy + 10;
			_hygiene <- _hygiene - 5;
			_happyness <- _happyness - 5;
			_last_action <- Type.Sleep

		method dance =
			_happyness <- _happyness + 30;
			_energy <- _energy - 10;
			_hygiene <- _hygiene - 5;
			_last_action <- Type.Dance

		method cheat =
			_health <- 999;
			_energy <- 999;
			_hygiene <- 999;
			_happyness <- 999;
			_last_action <- Type.Cheat

		method decrHealth = _health <- _health - 1

		method is_alive =
			if _health <= 0 || _energy <= 0 || _hygiene <= 0 || _happyness <= 0 then false
			else true

		method get_health = _health
		method get_energy = _energy
		method get_hygiene = _hygiene
		method get_happyness = _happyness
		method get_last_action = _last_action
	end
