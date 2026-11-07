extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	
	# When player dies, everything is slowed down and the player dies
	Engine.time_scale = 0.5	
	# This code is needed for death of player
	body.get_node("CollisionShape2D").queue_free()	
	timer.start()


func _on_timer_timeout() -> void:
	# When player revives again, everything is back to normal
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
