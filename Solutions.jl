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
data = [1779
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
	solution1 = 0
	for a in data, b in data
		if a+b == 2020
			solution1 = a*b
			break
		end
	end
	solution1
end

# ╔═╡ 8ef1a46a-33eb-11eb-10a6-a9dc2c2c98f9
md"""
### Question 2
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?
"""

# ╔═╡ 7d61e118-33e8-11eb-0c06-dd1c84aad4d5
begin
	solution2 = 0
	for a in data, b in data, c in data
		if a+b+c == 2020
			solution2 = a*b*c
			break
		end
	end
	solution2
end

# ╔═╡ Cell order:
# ╟─cd079d24-33e9-11eb-2657-b5d8b026582a
# ╟─372ffe08-33ea-11eb-2124-85a9b6123282
# ╟─702776fc-33e8-11eb-1400-c993105ccf6a
# ╠═7667c5dc-33eb-11eb-1c06-1dbefd10b08a
# ╟─8ef1a46a-33eb-11eb-10a6-a9dc2c2c98f9
# ╠═7d61e118-33e8-11eb-0c06-dd1c84aad4d5
