# 11_20

## 11

搜索插入位置
给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
你可以假设数组中无重复元素。

示例 1:

输入: [1,3,5,6], 5
输出: 2

示例 2:

输入: [1,3,5,6], 2
输出: 1

示例 3:

输入: [1,3,5,6], 7
输出: 4

示例 4:

输入: [1,3,5,6], 0
输出: 0

```python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        # 不管这个数在不在里面，直接append
        nums.append(target)
        # 然后再排序
        nums.sort()
        # 最后返回查找的index
        return nums.index(target)

```

---

## 12

外观数列

「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：

1. 1
2. 11
3. 21
4. 1211
5. 111221

1 被读作  "one 1"  ("一个一") , 即 11。
11 被读作 "two 1s" ("两个一"）, 即 21。
21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。

给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。

注意：整数序列中的每一项将表示为一个字符串。

示例 1:

输入: 1
输出: "1"
解释：这是一个基本样例。

示例 2:

输入: 4
输出: "1211"
解释：当 n = 3 时，序列是 "21"，其中我们有 "2" 和 "1" 两组，"2" 可以读作 "12"，也就是出现频次 = 1 而 值 = 2；类似 "1" 可以读作 "11"。所以答案是 "12" 和 "11" 组合在一起，也就是 "1211"。

```python
class Solution:
    def countAndSay(self, n: int) -> str:
        if n <= 1:
            return '1'
        pre = self.countAndSay(n - 1)

        res = ''
        count = 1
        for idx in range(len(pre)):

            if idx == 0 :
                count = 1

            elif pre[idx] != pre[idx -1]:
                tmp = str(count) + pre[idx-1]
                res += tmp
                count = 1
            elif pre[idx] == pre[idx-1]:
                count +=1

            if idx == len(pre) - 1:
                tmp = str(count) + pre[idx]
                res += tmp
        return res
```

* 递归 pre = self.countandsay(n-1)

* res = ''，初始化返回的字符串

* 因为确定了n=1时的值，所以基线条件就可以设置为 n <= 1 时返回。

* 从n-1开始逐步运行，res不断叠加，返回res

---

## 13

最大子序和

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。

* 遍历法

```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        tmp = nums[0]
        max_ = tmp
        n = len(nums)
        for i in range(1,n):
            # 当当前序列加上此时的元素的值大于tmp的值，说明最大序列和可能出现在后续序列中，记录此时的最大值
            if tmp + nums[i]>nums[i]:
                max_ = max(max_, tmp+nums[i])
                tmp = tmp + nums[i]
            else:
            #当tmp(当前和)小于下一个元素时，当前最长序列到此为止。以该元素为起点继续找最大子序列,
            # 并记录此时的最大值
                max_ = max(max_, tmp, tmp+nums[i], nums[i])
                tmp = nums[i]
        return max_

```

*
tmp = nums[0] 初始首位
max_ = tmp 当前最大值
n len

* 记录当前和

* 分治法

```python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)
        #递归终止条件
        if n == 1:
            return nums[0]
        else:
            #递归计算左半边最大子序和
            max_left = self.maxSubArray(nums[0:len(nums) // 2])
            #递归计算右半边最大子序和
            max_right = self.maxSubArray(nums[len(nums) // 2:len(nums)])

        #计算中间的最大子序和，从右到左计算左边的最大子序和，从左到右计算右边的最大子序和，再相加
        max_l = nums[len(nums) // 2 - 1]
        tmp = 0
        for i in range(len(nums) // 2 - 1, -1, -1):
            tmp += nums[i]
            max_l = max(tmp, max_l)
        max_r = nums[len(nums) // 2]
        tmp = 0
        for i in range(len(nums) // 2, len(nums)):
            tmp += nums[i]
            max_r = max(tmp, max_r)
        #返回三个中的最大值
        return max(max_right,max_left,max_l+max_r)
```

---

## 14

最后一个单词的长度

给定一个仅包含大小写字母和空格 ' ' 的字符串 s，返回其最后一个单词的长度。如果字符串从左向右滚动显示，那么最后一个单词就是最后出现的单词。

如果不存在最后一个单词，请返回 0 。

说明：一个单词是指仅由字母组成、不包含任何空格字符的 最大子字符串。

示例:

输入: "Hello World"
输出: 5

```python
class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        if not s:
            return 0
        count = 0
        flag = 0
        for i in s[::-1]:
            if i is " " and flag == 0:
                continue
            if i is not " ":
                count += 1
                flag = 1
            else:
                break
        return count
```

* 逆序遍历(原作思路好厉害呀)

---

## 15

加一

给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。

最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

你可以假设除了整数 0 之外，这个整数不会以零开头。

示例 1:

输入: [1,2,3]
输出: [1,2,4]
解释: 输入数组表示数字 123。

示例 2:

输入: [4,3,2,1]
输出: [4,3,2,2]
解释: 输入数组表示数字 4321。

```python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        num_str = " "
        for i in digits:
            num_str += str(i)

        return list(map(int, str(int(num_str)+1)))
```

* 先转换为字符串

* map 映射

map() 函数语法：

map(function, iterable, ...)

参数

function -- 函数
iterable -- 一个或多个序列

* map(int,str(x+1))
先+1，再转为str,个位数拆开填进数组

---

## 16

二进制求和

给你两个二进制字符串，返回它们的和（用二进制表示）。

输入为 非空 字符串且只包含数字 1 和 0。

示例 1:

输入: a = "11", b = "1"
输出: "100"

示例 2:

输入: a = "1010", b = "1011"
输出: "10101"

提示：

每个字符串仅由字符 '0' 或 '1' 组成。
1 <= a.length, b.length <= 10^4
字符串如果不是 "0" ，就都不含前导零。

```python
class Solution:
    def addBinary(self, a: str, b: str) -> str:
        return bin(int(a, 2) + int(b, 2))[2:]
```

---

## 17

x 的平方根

实现 int sqrt(int x) 函数。

计算并返回 x 的平方根，其中 x 是非负整数。

由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

示例 1:

输入: 4
输出: 2

示例 2:

输入: 8
输出: 2
说明: 8 的平方根是 2.82842...,
     由于返回类型是整数，小数部分将被舍去。

```python
class Solution:
    def mySqrt(self, x: int) -> int:
        for i in range(1,10000000000):
            if x == 0:
                return 0
            elif i*i <= x and (i+1)*(i+1) > x:
                return i
```
---

## 18

爬楼梯

假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

**每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？**

注意：给定 n 是一个正整数。

示例 1：

输入： 2
输出： 2
解释： 有两种方法可以爬到楼顶。

1. 1 阶 + 1 阶
2. 2 阶

示例 2：

输入： 3
输出： 3
解释： 有三种方法可以爬到楼顶。

1. 1 阶 + 1 阶 + 1 阶
2. 1 阶 + 2 阶
3. 2 阶 + 1 阶

* 低效递归

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        a = Solution()
        if n == 1:
            return 1
        elif n == 2:
            return 2 
        else:
            return a.climbStairs(n-1) + a.climbStairs(n-2)
```

* 手动发现规律

* 进化

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        resf = 1
        resb = 2
        res = 0
        #可以不适用if判断，最后输出max(res,n)
        if n == 1:
            return 1
        elif n == 2:
            return 2
        for i in range(n-2):
            res = resb + resf
            resb, resf = res, resb
        return res
```

* for i in range(n-2):
    res = resb + resf
    resb, resf = res, resb

3递归一次

---

## 19

删除排序链表中的重复元素

给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:

输入: 1->1->2
输出: 1->2

示例 2:

输入: 1->1->2->3->3
输出: 1->2->3

```python
class Solution:
    def deleteDuplicates(self, head: ListNode) -> ListNode:
        node=head #头节点
        while node and node.next:
            if node.val==node.next.val:
                node.next=node.next.next #指向下一个
            else:
                node=node.next
        return head

```

* 暴力美学暴力美学，这个看着好舒服

---

## 20

合并两个有序数组

给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

说明:
    初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
    你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
示例:

输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]

```python
class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        i, j = 0, 0
        while j < n:
            if i >= m+j: #结束条件
                nums1[i:i+n-j] = nums2[j:n]
                break
            if nums1[i] < nums2[j]:
                i += 1
            else:
                nums1[i], nums1[i+1:] = nums2[j], nums1[i:len(nums1)-1]
                j += 1; i += 1
```

* 归并排序，指针插入，判断并动态改变数组1
