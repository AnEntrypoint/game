extends Control

const SERVER_PORT := 8000
const MAX_PLAYERS := 32
const SERVER_IP := "129.213.57.168"

func _ready():
	if "--server" in OS.get_cmdline_args():
		var peer := NetworkedMultiplayerENet.new()
		peer.create_server(8000, 32)
		start_with_peer(peer)
	else:
		var peer := NetworkedMultiplayerENet.new()
		peer.create_client(SERVER_IP, SERVER_PORT)
		start_with_peer(peer)

func _on_JoinButton_pressed():
	var peer := NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	start_with_peer(peer)


func _on_CreateServerButton_pressed():
	var peer := NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	start_with_peer(peer)


func start_with_peer(peer : NetworkedMultiplayerPeer) -> void:
	get_tree().set_network_peer(peer)
	get_tree().change_scene("res://Game/Game.tscn")
