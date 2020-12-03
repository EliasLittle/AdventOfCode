### A Pluto.jl notebook ###
# v0.12.14

using Markdown
using InteractiveUtils

# ╔═╡ cd079d24-33e9-11eb-2657-b5d8b026582a
md"""
## Advent of Code

This notebook will contain all of my solutions, and attempted solutions for the [advent of code](https://adventofcode.com)

If you are seeing this on my website, it is unfortunately not interactive, but should still be completely readable and feel free to email me if you want a runnable Julia file
"""

# ╔═╡ 372ffe08-33ea-11eb-2124-85a9b6123282
md"""
### Question 1

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

|Report|
|------|
|1721|
|979|
|366|
|299|
|675|
|1456|
In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

"""

# ╔═╡ 702776fc-33e8-11eb-1400-c993105ccf6a
day1 = [1779
1737
1537
1167
1804
1873
1894
1446
1262
1608
1430
1421
1826
1718
1888
1314
1844
248
1812
1627
1605
1641
1126
1051
1839
1067
1685
1800
1383
1415
1781
1372
1711
1687
1357
1603
1899
1856
1240
1872
1483
1624
1358
1168
1238
1585
1159
1409
1615
1258
1412
1468
1912
1840
1681
1700
1031
1757
1911
1096
1239
1331
1881
1304
1694
1705
1680
820
1744
1245
1922
1545
1335
1852
1318
1565
1505
1535
1536
1758
1508
1453
1957
1375
1647
1531
1261
1202
1701
1562
1933
1293
1828
334
1714
1931
1385
1294
1469
1629
1842
1730
1534
1544
1946
1805
1188
1684
1875
1623
1248
1347
2006
1191
1037
1387
1903
1746
16
952
1246
384
1518
1738
1269
1747
1423
1764
1666
1999
1776
1673
1350
1698
2004
1235
1719
1131
1671
1334
1556
1299
1569
1523
1655
1189
1023
1264
1821
1639
1114
1391
1154
1225
1906
1481
1728
1309
1682
1662
1017
1952
1948
2010
1809
1394
1039
1493
1509
1628
1401
1515
1497
1164
1829
1452
1706
1919
1831
1643
1849
1558
1162
1328
1432
680
1169
1393
1646
1161
1104
1678
1477
1824
1353
1260
1736
1777
1658
1715]

# ╔═╡ 7667c5dc-33eb-11eb-1c06-1dbefd10b08a
begin
	function solution1(data)
		solution1 = 0
		for a in data, b in data
			if a+b == 2020
				solution1 = a*b
				break
			end
		end
		solution1
	end
end

# ╔═╡ a841d6e8-34c6-11eb-2fb4-ff2a7132d015
solution1(day1)

# ╔═╡ 26c1523e-3425-11eb-1732-a184c3dd5778
md"###### A better solution. 
This one should run in O(n) time compared to O(n²) above" 

# ╔═╡ 0e79ba04-3425-11eb-11cf-9dec74fb0c35
begin
	function solution1_fast(data)
		solution1_1 = 0
		cache = Dict()
		for item in data
			pair = 2020-item
			if get(cache, pair, 0) == 1
				solution1_1 = item * pair
				break
			end
			cache[item] = 1
		end
		solution1_1
	end
end

# ╔═╡ b7214a7c-34c6-11eb-351d-b34dd6e1906f
solution1_fast(day1)

# ╔═╡ 8ef1a46a-33eb-11eb-10a6-a9dc2c2c98f9
md"""
---
### Question 2
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?
"""

# ╔═╡ 7d61e118-33e8-11eb-0c06-dd1c84aad4d5
begin
	function solution2(data)
		solution2 = 0
		for a in data, b in data, c in data
			if a+b+c == 2020
				solution2 = a*b*c
				break
			end
		end
		solution2
	end
end

# ╔═╡ 97b948e2-34c6-11eb-3b9a-c7105c3ccd0d
solution2(day1)

# ╔═╡ 3c77d628-3427-11eb-2f21-f5afccb77b7e
md"###### A better solution. 
This one should run in O(n²) time compared to O(n³) above"

# ╔═╡ 584f8ee0-3427-11eb-26e5-ad9a5adbcbba
begin
	function solution2_fast(data)
		solution2_1 = 0
		cache = Dict()
		for item1 in data, item2 in data
			triplet = 2020-item1-item2
			if get(cache, triplet, 0) == 1
				solution2_1 = item1 * item2 * triplet
				break
			end
			cache[item1] = 1
			cache[item2] = 1
		end
		solution2_1
	end
end

# ╔═╡ 7f556b3c-34c6-11eb-2823-3b75a81a5314
solution2_fast(day1)

# ╔═╡ 800a04a2-34c1-11eb-0e91-15fb701b087f
md"""
"""

# ╔═╡ ae10be0e-34c1-11eb-2c47-edc37e3fa92c
md"""
---
### Question 3

Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

For example, suppose you have the following list:


|Policy | Password |
|-------|----------|
|1-3 a:| abcde|
|1-3 b:| cdefg|
|2-9 c:| ccccccccc|

Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

How many passwords are valid according to their policies?
"""

# ╔═╡ 4e6a05a2-34c2-11eb-0266-052790143648
begin
	function solution3(input::String)
		valid = open(input) do file
			valid = 0
			for line in eachline(file)
				components = split(line," ")
				min, max = parse.(Int32, split(components[1],"-"))
				char = string(components[2][1])
				password = components[3]
				
				if min ≤ count(char,password) ≤ max
					valid += 1
				end
			end
			valid
		end
	end
end

# ╔═╡ b4d324aa-34c3-11eb-2944-9b4884c3b2d8
solution3("Day2.txt")

# ╔═╡ 3d595e90-34c5-11eb-1f2d-1b7a04e6b578
md"""
### Question 4

While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:

|Policy | Password | Validity|
|:-------|:----------|:---------|
|1-3 a: | abcde | is valid: position 1 contains a and position 3 does not.|
|1-3 b: | cdefg | is invalid: neither position 1 nor position 3 contains b.|
|2-9 c: | ccccccccc | is invalid: both position 2 and position 9 contain c.|
How many passwords are valid according to the new interpretation of the policies?
"""

# ╔═╡ ad7bf25c-34c5-11eb-1f69-59ac12cd266f
begin
	function solution4(input::String)
		valid = open(input) do file
			valid = 0
			for line in eachline(file)
				components = split(line," ")
				loc1, loc2 = parse.(Int32, split(components[1],"-"))
				char = components[2][1]
				password = components[3]
				
				pair = (password[loc1],password[loc2])
				
				if char in pair && pair[1]!=pair[2]
					valid += 1
				end
			end
			valid
		end
	end
end

# ╔═╡ 14c21e00-34c6-11eb-0b8f-511b8ec911bb
solution4("Day2.txt")

# ╔═╡ 24b0a9a4-352e-11eb-3c8c-e5bb60df6bbd
md"""
"""

# ╔═╡ 2dd8df38-352e-11eb-03d4-555ad8ef47e5
md"""
---
### Question 5

With the toboggan login problems resolved, you set off toward the airport. While travel by toboggan might be easy, it's certainly not safe: there's very minimal steering and the area is covered in trees. You'll need to see which angles will take you near the fewest trees.

Due to the local geology, trees in this area only grow on exact integer coordinates in a grid. You make a map (your puzzle input) of the open squares (.) and trees (#) you can see. For example:
```
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
```
These aren't the only trees, though; due to something you read about once involving arboreal genetics and biome stability, the same pattern repeats to the right many times:
```
..##.........##.........##.........##.........##.........##.......  ---> \
#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..\
.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.\
..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#\
.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........#.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...##....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
```
You start on the open square (.) in the top-left corner and need to reach the bottom (below the bottom-most row on your map).

The toboggan can only follow a few specific slopes (you opted for a cheaper model that prefers rational numbers); start by counting all the trees you would encounter for the slope right 3, down 1:

From your starting position at the top-left, check the position that is right 3 and down 1. Then, check the position that is right 3 and down 1 from there, and so on until you go past the bottom of the map.

The locations you'd check in the above example are marked here with O where there was an open square and X where there was a tree:
```
..##.........##.........##.........##.........##.........##.......  --->
#..O#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....X..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#O#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..X...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.X#.......#.##.......#.##.......#.##.......#.##.....  --->
.#.#.#....#.#.#.#.O..#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........X.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.X#...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...#X....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...X.#.#..#...#.#.#..#...#.#.#..#...#.#  --->
```
In this example, traversing the map using this slope would cause you to encounter 7 trees.

Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?
"""

# ╔═╡ 98c75738-352f-11eb-28a9-01831e99f127
begin
	function solution5(input,x_incr,y_incr)
		tree_count = open(input) do file
			map, tree_count = [],0
			for line in eachline(file)
				push!(map, collect(line))
		    end
			
			x,y = 1,1
			while y ≤ 323
				if map[y][x] == '#'
					tree_count += 1
				end
				x += x_incr
				if x > 31
					x -= 31
				end
				y += y_incr
			end
			tree_count
		end
	end
end

# ╔═╡ 04a1c0a0-3536-11eb-021a-99137b91e87e
solution5("Day3.txt",3,1)

# ╔═╡ 90090656-3538-11eb-3037-1bb261555d15
md"""
### Question 6

Time to check the rest of the slopes - you need to minimize the probability of a sudden arboreal stop, after all.

Determine the number of trees you would encounter if, for each of the following slopes, you start at the top-left corner and traverse the map all the way to the bottom:

Right 1, down 1. \
Right 3, down 1. (This is the slope you already checked.) \
Right 5, down 1. \
Right 7, down 1. \
Right 1, down 2. \
In the above example, these slopes would find 2, 7, 3, 4, and 2 tree(s) respectively; multiplied together, these produce the answer 336.

What do you get if you multiply together the number of trees encountered on each of the listed slopes?
"""

# ╔═╡ d7f7f5d0-3538-11eb-3900-27db227e4f30
begin
	function solution6(slopes)
		sols = [solution5("Day3.txt",x,y) for (x,y) in slopes]
		prod(sols)
	end
end

# ╔═╡ b00ac57e-3539-11eb-1805-533701bcde60
solution6([(1,1),(3,1),(5,1),(7,1),(1,2)])

# ╔═╡ Cell order:
# ╟─cd079d24-33e9-11eb-2657-b5d8b026582a
# ╠═372ffe08-33ea-11eb-2124-85a9b6123282
# ╟─702776fc-33e8-11eb-1400-c993105ccf6a
# ╠═7667c5dc-33eb-11eb-1c06-1dbefd10b08a
# ╠═a841d6e8-34c6-11eb-2fb4-ff2a7132d015
# ╟─26c1523e-3425-11eb-1732-a184c3dd5778
# ╠═0e79ba04-3425-11eb-11cf-9dec74fb0c35
# ╠═b7214a7c-34c6-11eb-351d-b34dd6e1906f
# ╟─8ef1a46a-33eb-11eb-10a6-a9dc2c2c98f9
# ╠═7d61e118-33e8-11eb-0c06-dd1c84aad4d5
# ╠═97b948e2-34c6-11eb-3b9a-c7105c3ccd0d
# ╟─3c77d628-3427-11eb-2f21-f5afccb77b7e
# ╠═584f8ee0-3427-11eb-26e5-ad9a5adbcbba
# ╠═7f556b3c-34c6-11eb-2823-3b75a81a5314
# ╟─800a04a2-34c1-11eb-0e91-15fb701b087f
# ╟─ae10be0e-34c1-11eb-2c47-edc37e3fa92c
# ╠═4e6a05a2-34c2-11eb-0266-052790143648
# ╠═b4d324aa-34c3-11eb-2944-9b4884c3b2d8
# ╟─3d595e90-34c5-11eb-1f2d-1b7a04e6b578
# ╠═ad7bf25c-34c5-11eb-1f69-59ac12cd266f
# ╠═14c21e00-34c6-11eb-0b8f-511b8ec911bb
# ╟─24b0a9a4-352e-11eb-3c8c-e5bb60df6bbd
# ╟─2dd8df38-352e-11eb-03d4-555ad8ef47e5
# ╠═98c75738-352f-11eb-28a9-01831e99f127
# ╠═04a1c0a0-3536-11eb-021a-99137b91e87e
# ╟─90090656-3538-11eb-3037-1bb261555d15
# ╠═d7f7f5d0-3538-11eb-3900-27db227e4f30
# ╠═b00ac57e-3539-11eb-1805-533701bcde60
