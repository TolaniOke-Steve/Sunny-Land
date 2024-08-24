extends Node

const SAVE_PATH = "res://savegame.bin"

# res if not launching game

#users if launching game for use

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	# saving a file
	#JSON TYPE SAVE USING DICTIONARY
	var data: Dictionary = {
		"PlayerHP": Game.playerHP,
		"Gold": Game.Gold
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	# loading a file
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP = current_line["PlayerHP"]
				Game.Gold =  current_line["Gold"]
