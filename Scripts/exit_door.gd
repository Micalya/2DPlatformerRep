extends Node2D

@export var next_scene : String





func _on_door_open_animate_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	$DoorOpen.show()

func _on_door_open_animate_body_exited(body: Node2D) -> void:
	if body.name != "Player":
		return
	$DoorOpen.hide()


func _on_go_to_next_scene_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	call_deferred("_change_scene")
func _change_scene() -> void:
	get_tree().change_scene_to_file(next_scene)
