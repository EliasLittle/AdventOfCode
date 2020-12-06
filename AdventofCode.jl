### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ f5ac8de6-35ee-11eb-1529-2b0fb4e3ede9
begin
	using DelimitedFiles
	
	function solution7(📁)
		✔ = 0
		📚 = []
		cache = []
		for line in readdlm(📁,'\n',skipblanks=false)
			if line != ""
				push!(cache, (split(line,' ')...))
				
			else
				push!(📚, Dict(split.(cache,':')))
				cache = []
			end
		end

		valid_📚 = []
		for 📖 in 📚
			len = length(📖)
			if len == 8 || (len == 7 && !haskey(📖,"cid"))
				✔ += 1
				push!(valid_📚,📖)
			end
		end
		✔, valid_📚
	end
end

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

# ╔═╡ 989c7bf2-35ee-11eb-2e27-bfd1f1e27a7a
md"""
"""

# ╔═╡ 9eb9e24a-35ee-11eb-23fb-cbfe4cf18908
md"""
---
### Question 7

You arrive at the airport only to realize that you grabbed your North Pole Credentials instead of your passport. While these documents are extremely similar, North Pole Credentials aren't issued by a country and therefore aren't actually valid documentation for travel in most of the world.

It seems like you're not the only one having problems, though; a very long line has formed for the automatic passport scanners, and the delay could upset your travel itinerary.

Due to some questionable network security, you realize you might be able to solve both of these problems at the same time.

The automatic passport scanners are slow because they're having trouble detecting which passports have all required fields. The expected fields are as follows:

- byr (Birth Year) \
- iyr (Issue Year) \
- eyr (Expiration Year) \
- hgt (Height) \
- hcl (Hair Color) \
- ecl (Eye Color) \
- pid (Passport ID) \
- cid (Country ID) \
Passport data is validated in batch files (your puzzle input). Each passport is - represented as a sequence of key:value pairs separated by spaces or newlines. Passports are separated by blank lines.

Here is an example batch file containing four passports:

```
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
```
The first passport is valid - all eight fields are present. The second passport is invalid - it is missing hgt (the Height field).

The third passport is interesting; the only missing field is cid, so it looks like data from North Pole Credentials, not a passport at all! Surely, nobody would mind if you made the system temporarily ignore missing cid fields. Treat this "passport" as valid.

The fourth passport is missing two fields, cid and byr. Missing cid is fine, but missing any other field is not, so this passport is invalid.

According to the above rules, your improved system would report 2 valid passports.

Count the number of valid passports - those that have all required fields. Treat cid as optional. In your batch file, how many passports are valid?
"""

# ╔═╡ cfb2fcf2-35f2-11eb-3642-9b7461a4af98
solution7("Day4.txt")

# ╔═╡ 2e1448f8-35f7-11eb-0854-1bb2efa55083
md"""
"""

# ╔═╡ 32a4a672-35f7-11eb-06f7-07de6bfc0730
md"""
### Question 8

The line is moving more quickly now, but you overhear airport security talking about how passports with invalid data are getting through. Better add some data validation, quick!

You can continue to ignore the cid field, but each other field has strict rules about what values are valid for automatic validation:

- byr (Birth Year) - four digits; at least 1920 and at most 2002.
- iyr (Issue Year) - four digits; at least 2010 and at most 2020.
- eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
- hgt (Height) - a number followed by either cm or in:
	* If cm, the number must be at least 150 and at most 193.
	* If in, the number must be at least 59 and at most 76.
- hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
- ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
- pid (Passport ID) - a nine-digit number, including leading zeroes.
- cid (Country ID) - ignored, missing or not.

Your job is to count the passports where all required fields are both present and valid according to the above rules. Here are some example values:

```
byr valid:   2002
byr invalid: 2003

hgt valid:   60in
hgt valid:   190cm
hgt invalid: 190in
hgt invalid: 190

hcl valid:   #123abc
hcl invalid: #123abz
hcl invalid: 123abc

ecl valid:   brn
ecl invalid: wat

pid valid:   000000001
pid invalid: 0123456789
```

Here are some invalid passports:

```
eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007
```

Here are some valid passports:

```
pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
```

Count the number of valid passports - those that have all required fields and valid values. Continue to treat cid as optional. In your batch file, how many passports are valid?
"""

# ╔═╡ 8fe2df46-35f7-11eb-3cdc-8bad39627cab
begin
	function cred_check(passport)
		a = 1920 ≤ parse(Int64,passport["byr"]) ≤ 2002
		b = 2010 ≤ parse(Int64,passport["iyr"]) ≤ 2020
		c = 2020 ≤ parse(Int64,passport["eyr"]) ≤ 2030
		hgt = passport["hgt"]
		if occursin("cm",hgt)
			d = 150 ≤ parse(Int64,hgt[1:end-2]) ≤ 193
		elseif occursin("in",hgt)
			d = 59 ≤ parse(Int64,hgt[1:end-2]) ≤ 76
		else
			d = false
		end
		
		hcl = passport["hcl"]
		e = occursin("#",hcl) && length(hcl)==7
		f = passport["ecl"] in ["amb" "blu" "brn" "gry" "grn" "hzl" "oth"]
		g = length(passport["pid"])==9
		
		all([a,b,c,d,e,f,g])
	end
	
	function solution8()
		📚 = solution7("Day4.txt")[2]
		✔ = 0
		for 📖 ∈ 📚
			if cred_check(📖)
				✔ += 1
			end
		end
		✔
	end
		
end

# ╔═╡ dbc9bfec-35f9-11eb-2c12-2f3e11bc1f1d
solution8()

# ╔═╡ 3f8ab94e-36b5-11eb-26bf-c74642550a33
md"""
"""

# ╔═╡ 431dbdd6-36b5-11eb-080e-bd7b50d5b511
md"""
---
### Question 9

You board your plane only to discover a new problem: you dropped your boarding pass! You aren't sure which seat is yours, and all of the flight attendants are busy with the flood of people that suddenly made it through passport control.

You write a quick program to use your phone's camera to scan all of the nearby boarding passes (your puzzle input); perhaps you can find your seat through process of elimination.

Instead of zones or groups, this airline uses binary space partitioning to seat people. A seat might be specified like FBFBBFFRLR, where F means "front", B means "back", L means "left", and R means "right".

The first 7 characters will either be F or B; these specify exactly one of the 128 rows on the plane (numbered 0 through 127). Each letter tells you which half of a region the given seat is in. Start with the whole list of rows; the first letter indicates whether the seat is in the front (0 through 63) or the back (64 through 127). The next letter indicates which half of that region the seat is in, and so on until you're left with exactly one row.

For example, consider just the first seven characters of FBFBBFFRLR:

Start by considering the whole range, rows 0 through 127. \
F means to take the lower half, keeping rows 0 through 63. \
B means to take the upper half, keeping rows 32 through 63. \
F means to take the lower half, keeping rows 32 through 47. \
B means to take the upper half, keeping rows 40 through 47. \
B keeps rows 44 through 47. \
F keeps rows 44 through 45. \
The final F keeps the lower of the two, row 44. \
The last three characters will be either L or R; these specify exactly one of the 8 columns of seats on the plane (numbered 0 through 7). The same process as above proceeds again, this time with only three steps. L means to keep the lower half, while R means to keep the upper half.

For example, consider just the last 3 characters of FBFBBFFRLR:

Start by considering the whole range, columns 0 through 7. \
R means to take the upper half, keeping columns 4 through 7. \
L means to take the lower half, keeping columns 4 through 5. \
The final R keeps the upper of the two, column 5. \
So, decoding FBFBBFFRLR reveals that it is the seat at row 44, column 5. \

Every seat also has a unique seat ID: multiply the row by 8, then add the column. In this example, the seat has ID 44 * 8 + 5 = 357.

Here are some other boarding passes:

BFFFBBFRRR: row 70, column 7, seat ID 567. \
FFFBBBFRRR: row 14, column 7, seat ID 119. \
BBFFBBFRLL: row 102, column 4, seat ID 820. \
As a sanity check, look through your list of boarding passes. What is the highest seat ID on a boarding pass?

"""

# ╔═╡ 121923b2-36b8-11eb-19f4-214fb9723036
begin
	function convert(string,zero_char)
		str = join(map(c->(c==zero_char ? 0 : 1),collect(string)))
		parse(Int, "0b"*str)
	end
	
	function solution9(file)
		ids = Set()
		f = open(file)
		for line in eachline(f)
			row = convert(line[1:7],'F')
			col = convert(line[8:10],'L')
			val = row*8+col
			push!(ids, val)
		end
		maximum(ids),ids
	end
end

# ╔═╡ f932aa8e-36b8-11eb-0beb-d5e9630621b5
solution9("Day5.txt")[1]

# ╔═╡ 4fea6436-36b9-11eb-31e5-13e22e0aff6c
md"""
"""

# ╔═╡ 534d6b3a-36b9-11eb-02b9-d5ca1e451aa7
md"""
### Question 10

Ding! The "fasten seat belt" signs have turned on. Time to find your seat.

It's a completely full flight, so your seat should be the only missing boarding pass in your list. However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well.

Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list.

What is the ID of your seat?
"""

# ╔═╡ 5ad05980-36b9-11eb-04e5-6dca6f96d569
begin
	function solution10()
		max,ids = solution9("Day5.txt")
		id_set = Set(ids)
		not_found = []
		for i in minimum(ids):max
			if i ∉ id_set
				push!(not_found, i)
			end
		end
		not_found
	end
end

# ╔═╡ facd2f08-36b9-11eb-268b-49dd3fe5870f
solution10()

# ╔═╡ dd3116e2-377e-11eb-0a74-c127f4d04332
md"""
⛳ Version
"""

# ╔═╡ 5a77b2f6-36bb-11eb-1831-a7cac2831e8e
begin
	max,ids = solution9("Day5.txt")
	setdiff(Set(minimum(ids):max),Set(ids))
end

# ╔═╡ 4ec234ee-377f-11eb-2a55-c32fd8aa74f0
md"""
"""

# ╔═╡ 41fc1644-377f-11eb-3f82-3bfdc7f41c88
md"""
---
### Question 11

As your flight approaches the regional airport where you'll switch to a much larger plane, customs declaration forms are distributed to the passengers.

The form asks a series of 26 yes-or-no questions marked a through z. All you need to do is identify the questions for which anyone in your group answers "yes". Since your group is just you, this doesn't take very long.

However, the person sitting next to you seems to be experiencing a language barrier and asks if you can help. For each of the people in their group, you write down the questions for which they answer "yes", one per line. For example:
```
abcx
abcy
abcz
```
In this group, there are 6 questions to which anyone answered "yes": a, b, c, x, y, and z. (Duplicate answers to the same question don't count extra; each question counts at most once.)

Another group asks for your help, then another, and eventually you've collected answers from every group on the plane (your puzzle input). Each group's answers are separated by a blank line, and within each group, each person's answers are on a single line. For example:
```
abc

a
b
c

ab
ac

a
a
a
a

b
```
This list represents answers from five groups:

The first group contains one person who answered "yes" to 3 questions: a, b, and c.
The second group contains three people; combined, they answered "yes" to 3 questions: a, b, and c.
The third group contains two people; combined, they answered "yes" to 3 questions: a, b, and c.
The fourth group contains four people; combined, they answered "yes" to only 1 question, a.
The last group contains one person who answered "yes" to only 1 question, b.
In this example, the sum of these counts is 3 + 3 + 3 + 1 + 1 = 11.

For each group, count the number of questions to which anyone answered "yes". What is the sum of those counts?

"""

# ╔═╡ 52c6986e-377f-11eb-29b4-8d8b323550c7
begin
	function solution11()
		f = open("Day6.txt")
		str = read(f,String)
		groups = split(str,"\n\n")
		ppl = map(x->split(x,"\n"),groups)
		
		count = 0
		for i in ppl
			unique = Set()
			for j in i
				union!(unique,Set(j))
			end
			count += length(unique)
		end
		count
	end
end

# ╔═╡ e339c4ce-3780-11eb-3cff-6536232d3200
solution11()

# ╔═╡ b2a5aa96-3788-11eb-1ced-41ed2babbf0d
md"""
⛳ Version
"""

# ╔═╡ 5c108cee-3785-11eb-0c17-5d0c188e8f04
begin
	sum(map(x->length(union(Set.(x)[:]...)),split.(split(read("Day6.txt",String),"\n\n"),"\n")))
end

# ╔═╡ b16f496a-3784-11eb-3e07-a9e7a3f14f5d
md"""
"""

# ╔═╡ 88b3c4c4-3784-11eb-27d5-aba800a8d6ce
md"""
### Question 12

As you finish the last group's customs declaration, you notice that you misread one word in the instructions:

You don't need to identify the questions to which anyone answered "yes"; you need to identify the questions to which everyone answered "yes"!

Using the same example as above:

```
abc

a
b
c

ab
ac

a
a
a
a

b
```
This list represents answers from five groups:

In the first group, everyone (all 1 person) answered "yes" to 3 questions: a, b, and c.
In the second group, there is no question to which everyone answered "yes".
In the third group, everyone answered yes to only 1 question, a. Since some people did not answer "yes" to b or c, they don't count.
In the fourth group, everyone answered yes to only 1 question, a.
In the fifth group, everyone (all 1 person) answered "yes" to 1 question, b.
In this example, the sum of these counts is 3 + 0 + 1 + 1 + 1 = 6.

For each group, count the number of questions to which everyone answered "yes". What is the sum of those counts?
"""

# ╔═╡ 404c301a-3782-11eb-21a9-77b1693098b7
begin
	function solution12()
		f = open("Day6.txt")
		str = read(f,String)
		groups = split(str,"\n\n")
		ppl = map(x->split(x,"\n"),groups)
		
		count = 0
		for i in ppl
			unique = Set(i[1])
			for j in 2:length(i)
				intersect!(unique,Set(i[j]))
			end
			count += length(unique)
		end
		count
	end
end

# ╔═╡ 8a61e28e-3788-11eb-274b-a34e5cc5f7e9
solution12()

# ╔═╡ 944cf8ec-3788-11eb-21e7-d74bd7be029e
md"""
⛳ Version
"""

# ╔═╡ 4d814a22-3782-11eb-1740-3d8b944f64a3
sum(map(x->length(intersect(Set.(x)[:]...)),split.(split(read("Day6.txt",String),"\n\n"),"\n")))

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
# ╟─989c7bf2-35ee-11eb-2e27-bfd1f1e27a7a
# ╟─9eb9e24a-35ee-11eb-23fb-cbfe4cf18908
# ╠═f5ac8de6-35ee-11eb-1529-2b0fb4e3ede9
# ╠═cfb2fcf2-35f2-11eb-3642-9b7461a4af98
# ╟─2e1448f8-35f7-11eb-0854-1bb2efa55083
# ╟─32a4a672-35f7-11eb-06f7-07de6bfc0730
# ╠═8fe2df46-35f7-11eb-3cdc-8bad39627cab
# ╠═dbc9bfec-35f9-11eb-2c12-2f3e11bc1f1d
# ╟─3f8ab94e-36b5-11eb-26bf-c74642550a33
# ╟─431dbdd6-36b5-11eb-080e-bd7b50d5b511
# ╠═121923b2-36b8-11eb-19f4-214fb9723036
# ╠═f932aa8e-36b8-11eb-0beb-d5e9630621b5
# ╟─4fea6436-36b9-11eb-31e5-13e22e0aff6c
# ╟─534d6b3a-36b9-11eb-02b9-d5ca1e451aa7
# ╠═5ad05980-36b9-11eb-04e5-6dca6f96d569
# ╠═facd2f08-36b9-11eb-268b-49dd3fe5870f
# ╟─dd3116e2-377e-11eb-0a74-c127f4d04332
# ╠═5a77b2f6-36bb-11eb-1831-a7cac2831e8e
# ╟─4ec234ee-377f-11eb-2a55-c32fd8aa74f0
# ╟─41fc1644-377f-11eb-3f82-3bfdc7f41c88
# ╠═52c6986e-377f-11eb-29b4-8d8b323550c7
# ╠═e339c4ce-3780-11eb-3cff-6536232d3200
# ╟─b2a5aa96-3788-11eb-1ced-41ed2babbf0d
# ╠═5c108cee-3785-11eb-0c17-5d0c188e8f04
# ╟─b16f496a-3784-11eb-3e07-a9e7a3f14f5d
# ╟─88b3c4c4-3784-11eb-27d5-aba800a8d6ce
# ╠═404c301a-3782-11eb-21a9-77b1693098b7
# ╠═8a61e28e-3788-11eb-274b-a34e5cc5f7e9
# ╟─944cf8ec-3788-11eb-21e7-d74bd7be029e
# ╠═4d814a22-3782-11eb-1740-3d8b944f64a3
