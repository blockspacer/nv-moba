extends "res://scripts/player.gd"

onready var placement = preload("res://scripts/placement.gd").new(self, "res://scenes/heroes/5_portal.tscn")

# --- Godot overrides ---

func _ready():
	placement.start_action = "hero_5_place_portal"
	placement.confirm_action = "hero_5_confirm_portal"
	placement.delete_action = "hero_5_remove_portal"
	placement.max_placed = 100

func _process(delta):
	if is_network_master():
		placement.place_input()

func _exit_tree():
	._exit_tree()
	if placement:
		placement.clear()

# --- Player overrides ---

# --- Own ---

