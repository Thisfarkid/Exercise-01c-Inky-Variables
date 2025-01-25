/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 Variable Checking: 
 Equality: "Spot" == "Spot"
 Not equality: 1 |= 2
 Greater or equal: >=
 Less or equal: <=
 
*/

VAR location = 0
VAR visited_1 = false
VAR pet_name = ""
VAR torches = 0

->memory


==memory==
Before you stands the cavern. You wish your childhood pet was with you. What was your pet's name?
*[Charles] 
    ~pet_name = "Charles" 
    -> cave_mouth
*[Haze]
    ~pet_name = "Haze" 
    -> cave_mouth
*[Rover]
    ~pet_name = "Rover" 
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You currently have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west.
* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
*[Take gold] ->take_gold
*[Look around]  ->Examine_east
*[Leave] ->cave_mouth

==west_tunnel_lit==
The light of your torches reveals hundreds a cockroaches crawling around the walls.
{pet_name == "Haze": Haze wouldn't have liked it here| }
*[Burn them] ->Cockroach_battle
*[Leave] -> cave_mouth

==Cockroach_battle==
You point your torch to burn them all. As you get closer you can see that these are no ordinary roaches and a few leap at you biting into your flesh. You are able to get those off. Do you risk it and kill more?
*[Kill the rest] ->Roach_battle_cont
*[Leave] ->cave_mouth

==Roach_battle_cont==
You brave the insects once more, killing the last of them even as they attack you. Oce killing them all you can see a crevice in the wall that leads out of the room.
*[Go through tunnel] ->east_tunnel_lit
*[Go back]->cave_mouth

==take_gold==
{ visited_1 == false: 
    ~location = location + 1
    ~ visited_1 = true
}
{visited_1 == true: 
~location = location + 2
}
{location + 2: Why did you touch it? You catch fire again and die. ->END}
{visited_1 == true: }
As you touch the gold, your hand catches fire. You are able to put out the fire.
*[Still take gold?] ->take_gold
*[Back] ->east_tunnel_lit


==Examine_east==
As you look around you see a crack in the wall that leads out of the room
{not take_gold: You can also notice that the gold has a strangely red hue to it as if its being melted.} 
*[Back]->east_tunnel_lit


