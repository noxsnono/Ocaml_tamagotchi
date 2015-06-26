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

class save =
	object (self)
		val _savename = "../save/save.itama"
		val _line = 8

		method check_file =
			print_endline "check_file";
			let lst = ref [] in
			let fd = open_in _savename in
			let rec loop lst i =
				begin try
					let line = input_line fd in
					print_endline line;
					lst := (List.append !lst [line]);
					if i + 1 < _line then loop lst (i + 1)
					else print_endline "end"
				with
				| End_of_file -> close_in fd
				end
				
			in
			loop lst 0;
			(!lst:string list)

		method check_string str =
			let rec loop str i len =
				if i < (len - 1) && str.[i] >= '0' && str.[i] <= '9' then loop str (i + 1) len
				else if i < len then false
				else true
			in
			loop str 0 (String.length str)

		method load_game =
			let ret = Type.get_record in
			if Sys.file_exists _savename = false then begin print_endline "No saved game !"; ret end
			else begin
				print_endline "load game Test";
				let info = self#check_file in
				if List.length info <> _line then begin "Corrupted save file !"; ret end
				else begin
					if self#check_string (List.nth info 1) = false
						|| self#check_string (List.nth info 3) = false
						|| self#check_string (List.nth info 5) = false
						|| self#check_string (List.nth info 7) = false then
						begin print_endline "Bad save file !"; ret end
					else begin
						ret.health = int_of_string (List.nth info 1);
						ret.energy = int_of_string (List.nth info 3);
						ret.hygiene = int_of_string (List.nth info 5);
						ret.happyness = int_of_string (List.nth info 7);
						ret
					end
				end	
			end
	end
