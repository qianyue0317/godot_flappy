extends Node2D

signal someBodyExit
signal coinPlus

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	someBodyExit.emit()
	queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_entered():
	pass # Replace with function body.





func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		coinPlus.emit()
	pass # Replace with function body.


func _on_checkerbox_body_entered(body):
	if body.name == "Player":
		print("checkerBox effect")
		get_node("../../Player").fail = true
	pass # Replace with function body.
