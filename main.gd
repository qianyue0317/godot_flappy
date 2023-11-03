extends Node2D

@export var basketballZA: PackedScene

var delta = 0

var exitCount = 0

var space = 200
var basketballHeight = 968

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("Player").fail:
		var finishShowLabel = get_node("coninLayer/finishShow")
		finishShowLabel.visible = true
		finishShowLabel.text = "结束了，你的得分为：" + String.num_int64(get_node("Player").coinCount)
		set_process(false)
		print("监听到结束了")
	pass


func _on_basketball_some_body_exit():
	#print("接受到了退出")
	exitCount = exitCount + 1
	
	if exitCount % 2 == 0:
		var minTransY1  = -850
		var maxTransY1 = -408
		
		
		var bZA = basketballZA.instantiate()
		
		var zhangaiNode = get_node("basketballzhangai")
		
		bZA.someBodyExit.connect(_on_basketball_some_body_exit.bind())
		var tempDelta = delta + 300
		var transY1 = randi_range(minTransY1, maxTransY1)
		bZA.position = Vector2(1736 + tempDelta, transY1)
		
		zhangaiNode.add_child(bZA)
		
		var bZA2 = basketballZA.instantiate()
		bZA2.someBodyExit.connect(_on_basketball_some_body_exit.bind())
		bZA2.coinPlus.connect(get_node("Player")._on_basketball_coin_plus.bind())
		bZA2.position = Vector2(1736 + tempDelta, transY1 + basketballHeight + space)
		
		zhangaiNode.add_child(bZA2)
		
		delta = tempDelta
	pass # Replace with function body.
# Replace with function body.
