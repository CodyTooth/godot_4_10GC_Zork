extends Control

@onready var player_input = $MarginContainer/VBoxContainer/PlayerInput

# Objects
var door: test_object = load("res://Test/test_door.tres")

# Object Dictionary
var dictOfObjects = {
	"door": door
}

func _ready():
	player_input.grab_focus()


func _on_player_input_text_submitted(new_text):
	parse_player_input(new_text)
	player_input.clear()
	player_input.grab_focus()


func parse_player_input(input: String) -> void:
	var parsedInput: Array = []
	parsedInput = input.split(" ", false)
	interpret_player_input(parsedInput)


func interpret_player_input(input: Array) -> void:
	var inputSize = input.size()
	if inputSize == 0:
		return
	
	var verb: String = input[0]
	var object: String = ""
	if inputSize > 1:
		for i in inputSize - 1:
			var potentialObject = input[i+1]
			if dictOfObjects.has(potentialObject):
				object = potentialObject
				break
	
	match verb:
		"open":
			if object == "":
				print("What exactly are you trying to open?")
			else:
				var target = dictOfObjects[object]
				if target.canBeOpened:
					print(object + " has been opened")
					target.canBeOpened = false
				else:
					print(object + " cannot be opened, because it's already open")
		"use":
			pass
		"look":
			pass
		"help":
			pass
		"answer":
			pass
