# 11

## 1

* 两数之和
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
示例:
给定 nums = [2, 7, 11, 15], target = 9
因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]

``` python
class Solution:
    def twoSum(self,nums, target):
        _len = len(nums) #没用到
        j = -1
        for i in range(_len):
            if target - nums[i] in nums:
                #判断是否为同值同坐标
                if (target - nums[i] == nums[i]) & (nums.count(target - nums[i]) == 1):
                #if (nums.count(target - nums[i]) == 1)&(target - nums[i] == nums[i]):
                    continue

                else:
                    #不是同一个的话
                    j = nums.index(target - nums[i], i+1)
                    break

        if j > 0:
            return [i,j]
        else:
            return []
```

* python3，定义函数twoSum，包含参数：
'self'：
在定义单独函数时不需要定义，但在定义类函数时需要定义;
只需要定义不需要在使用时传参;
可以为其他词如：mywife，但为了规范阅读建议使用self;
指向类实例本身;
'nums':
任务给定的整数数组
'target':
目标所定的两数之和，找到nums中相加为此值的非同位置的两个整数的坐标
_len获得数组nums的元素个数
j = -1
使用for i in range(_len)
对于nums中的每一个元素,判断目标值和现有值的差是否在nums中
如果是则判断是否重复，为同一坐标值(此处为判断只有一个该元素)
则continue跳过
else则获得所需元素
index(a,i,j):
获得某个值在list中的‘第一个’索引位置
a为查找的目标对象
i可选，起始位置;
j可选，终止位置;
此处为从i+1处开始，减少运行时间，并且避免重复数据。
if j > 0,则循环有成功查找数据，j<=0即j还为初始值-1，即查找失败，返回空集。

---

## 2

* 两数相加
给出两个非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序的方式存储的，并且它们的每个节点只能存储一位数字。
如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
您可以假设除了数字0之外，这两个数都不会以0开头。
示例：
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807

``` python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        f = ListNode(0) #定义输出链表的第一个节点
        p = f #p类似于指针，代表输出链表的第一个节点
        carry = 0 #进位
        while l1 or l2: #判断l1和l2两个链表是否都结束了
            x = l1.val if l1 else 0 #如果l1链表没结束那么将l1的值给x，否则0给x
            y = l2.val if l2 else 0
            res = x + y + carry #与进位一起相加的结果
            carry = res // 10 #检查是否有进位
            p.next = ListNode(res%10) #下一个节点的地址给此时的节点
            p = p.next #这时p指向的是上一行定义的节点
            l1 = l1.next if l1 else 0 #如果链表l1没有了，那么要给l1赋值0，否则会报l1没有next属性的错
            l2 = l2.next if l2 else 0
        if carry > 0: #如果到最后还有进位，那么还要新建个节点记录进位的值
            p.next = ListNode(1)
        return f.next #返回的链表一定要从定义的输出链表f的第二个节点开始
```

* 链表
ListNode定义为：

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None
```

* __init__方法
前面带有'_x2'，函数被声明为私有函数，不可类外调用
此方法可以带参数初始化，self为内置，调用时只需要给出一个初始值x,定义为单向链表

* /表示浮点数除法，//表示整数除法
//返回数字序列中比真正的商小的，最接近的数字。

简单来说就是求商。

* 定义列表需要给出值和指向的地址

* ->
在def时定义元数据，注明返回类型。使用预期的类型来注释参数，然后在函数返回值验证时检验参数的类型或者将其强制转换成预期的类型。

* addTwoNumbers
输入为两个单向链表，输出为一个单向链表
定义输出的链表f，给第一个节点的初始值0
p指向输出链表的第一个节点
定义进位变量

* p.next = ListNode(res%10)
输出链表的下一位指向新得到的(进位之外的个位数)

* if carry > 0:

```python
p.next = ListNode(1)
```

判断是否有最后一个进位

* return f.next
返回链表的第一个节点为0值，从第二个节点开始返回

* 返回也是逆序链表

---

## 3

* 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
示例 1:
输入: 121
输出: true
示例 2:
输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
示例 3:
输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。
进阶:
你能不将整数转为字符串来解决这个问题吗？

* 方法一

```python
class Solution:

    # 方法一: 将int转化成str类型: 双向队列
    # 复杂度: O(n^2) [每次pop(0)都是O(n)..比较费时]
    def isPalindrome(self,x: int) -> bool:
        lst = list(str(x))
        while len(lst) > 1:
            if lst.pop(0) != lst.pop():
                return  False
        return True

x = 10
x = 10001
print(Solution().isPalindrome(x))
```

* 判断数字回文，返回bool

* 参数区别
positional argument即通过在参数列表中的相对位置确定传递给哪个形参，
keyword argument通过name=value这样的形式，根据name确定传递给哪个形参

* list使用append和pop(0)方法模拟双向列表(deque)

* 关键句为：

```python
if lst.pop(0) != lst.pop():
    return False
```

* pop为pop最后一个元素，pop(0)为pop第一个元素
pop:移除元素并返回该元素的值
pop(0)效率较慢

* class内定义函数参数缺少self时会报错:
need 1 and 2 is given

* 尝试使用deque

* 错误原因：
pop()返回值后弹出值，无法二次对比。while循环解决问题

```python
import collections

class Solution:
    def isPalindrome(self, x: int) -> bool:
        d = collections.deque(str(x))
        #print(d)
        #print(len(d))
        if len(d) == 1:
            return True
        else:
            i = 0
            for i in range (0,len(d) // 2):
                if d.pop() != d.popleft():
                    return False
                    break
                elif d.pop() == d.popleft():
                    continue
                elif len(d) <= 3:
                    if d.pop() == d.popleft():
                        return True
                        break
````

* while的方法

```python
import collections

class Solution:
    def isPalindrome(self, x: int) -> bool:
        d = collections.deque(str(x))
        #print(d)
        #print(len(d))
        while len(d)>1:
            if d.pop() != d.popleft():
                return False
        return True

```

* 和list.pop(0)相比，deque.popleft在运行时间和占用内存上有些许提升：
96ms->92ms
13.8MB->13.7MB

* 方法二

```python
    # 方法二: 将int转化成str类型: 双指针 (指针的性能一直都挺高的)
    # 复杂度: O(n)
    def isPalindrome(self,x: int) -> bool:
        lst = list(str(x))
        L, R = 0, len(lst)-1
        while L <= R:
            if lst[L] != lst[R]:
                return  False
            L += 1
            R -= 1
        return True

```

* 双指针
L初始指向首位0，R指向末位len(lst)-1
思路和栈pop类似，只是取值后不弹出

* 100ms,13.7MB

```python
    # 方法三: 进阶:不将整数转为字符串来解决: 使用log来计算x的位数
    # 复杂度: O(n)
    def isPalindrome(self, x: int) -> bool:
        """
        模仿上面字符串的方法:分别取'第一位的数'与'第二位的数'对比
                        (弊端是:频繁计算,导致速度变慢)
        """
        if x < 0:
            return False
        elif x == 0:
            return True
        else:
            import math
            length = int(math.log(x, 10)) + 1
            L = length-1
            #print("l = ", L)
            for i in range(length//2):
                if x // 10**L != x % 10:
                    return False
                x = (x % 10**L) //10
                L -= 2
            return True
```

* *乘法 ** 乘方

* 关键句
在不转化为字符串的前提下，使用log10X+1取位数：

```python
            length = int(math.log(x, 10)) + 1
```

* 乘方幂(10的N-1次方)

```python
            L = length-1
```

* 判断

```python
            for i in range(length//2):
                if x // 10**L != x % 10:
                    return False
                x = (x % 10**L) //10
                L -= 2
```

* 地板除取小，9//2 = 4， 只运算到合理需求位

* **指数为python最高优先级

* x%10永远取个位数(最后一位)

* x // 10**L 永远取第一位

* x = (x % 10**L) //10： l = l-2
实现左指针右移一位，右指针左移一位

* good point!

* 差别在于数字不会被pop()掉，所以两端需要同时实现位数缩进

## 4

* 罗马数字转整数
罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
    I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
    X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
    C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
示例 1:
输入: "III"
输出: 3
示例 2:
输入: "IV"
输出: 4
示例 3:
输入: "IX"
输出: 9
示例 4:
输入: "LVIII"
输出: 58
解释: L = 50, V= 5, III = 3.
示例 5:
输入: "MCMXCIV"
输出: 1994
解释: M = 1000, CM = 900, XC = 90, IV = 4.

```python
class Solution:
    def romanToInt(self, s: str) -> int:
        d = {'I':1, 'IV':3, 'V':5, 'IX':8, 'X':10, 'XL':30, 'L':50, 'XC':80, 'C':100, 'CD':300, 'D':500, 'CM':800, 'M':1000}
        return sum(d.get(s[max(i-1, 0):i+1], d[n]) for i, n in enumerate(s))
```

* enumerate(s)
内置函数，枚举，返回一个(index,value)的元组
i = index, n = value
n = 'X'之类的字符

* s[max(i-1, 0):i+1]
[a:b] 从a到b的所有元素,[]不包含右界
max(i-1, 0)：防止i=0

* python自动识别？？

---

## 5

* 最长公共前缀
编写一个函数来查找字符串数组中的最长公共前缀。
如果不存在公共前缀，返回空字符串 ""。
示例 1:
输入: ["flower","flow","flight"]
输出: "fl"
示例 2:
输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。
说明:
所有输入只包含小写字母 a-z。

```python
class Solution(object):
    def longestCommonPrefix(self, strs):
        ans = ''
        for i in zip(*strs):
            if len(set(i)) == 1:
                ans += i[0]
            else:
                break
        return ans

```

* 初始化ans为''，字符串类型

* zip
zip() 函数用于将可迭代的对象作为参数，将对象中对应的元素打包成一个个元组，然后返回由这些元组组成的列表。
如果各个迭代器的元素个数不一致，则返回列表长度与最短的对象相同，利用 * 号操作符，可以将元组解压为列表。
python3中zip不支持直接输出，只能通过遍历访问

* set
无序不重复的队列，不重复(转换自动去重？)

```python
            if len(set(i)) == 1:
                ans += i[0]
```

* i单例一个set，set自动去重，len(set(1)) == 1,则set中元素相等。

---

## 6

有效的括号
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
有效字符串需满足：
左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
注意空字符串可被认为是有效字符串。
示例 1:
输入: "()"
输出: true
示例 2:
输入: "()[]{}"
输出: true
示例 3:
输入: "(]"
输出: false
示例 4:
输入: "([)]"
输出: false
示例 5:
输入: "{[]}"
输出: true

```python
class Solution:
    def isValid(self, s: str) -> bool:
        dic = {'{': '}',  '[': ']', '(': ')', '?': '?'}
        stack = ['?']
        for c in s:
            if c in dic: stack.append(c)
            elif dic[stack.pop()] != c: return False 
        return len(stack) == 1
```

* 栈先入后出特点恰好与本题括号排序特点一致，即若遇到左括号入栈，遇到右括号时将对应栈顶左括号出栈，则遍历完所有括号后 stack 仍然为空；
建立哈希表 dic 构建左右括号对应关系：keykeykey 左括号，valuevaluevalue 右括号；这样查询 222 个括号是否对应只需 O(1)O(1)O(1) 时间复杂度；建立栈 stack，遍历字符串 s 并按照算法流程一一判断。

* 三个？可以用三个！或其他符号代替
确保有初始位，不会pop到空，避免出错

---

## 7

合并两个有序链表
将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：

输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4

```python
class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        if l1 and l2:
            if l1.val > l2.val: l1, l2 = l2, l1
            l1.next = self.mergeTwoLists(l1.next, l2)
        return l1 or l2

```

* 递归逐渐链接下一个节点
* l1 and l2 当l1为空时自动截断，不再执行
* l1,l2流动根据值转变

---
## 8

删除排序数组中的重复项

给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 

示例 1:

给定数组 nums = [1,1,2], 

函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。 

你不需要考虑数组中超出新长度后面的元素。

示例 2:

给定 nums = [0,0,1,1,1,2,2,3,3,4],

函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

你不需要考虑数组中超出新长度后面的元素。

说明:

为什么返回数值是整数，但输出的答案是数组呢?

请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

你可以想象内部操作如下:

// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
int len = removeDuplicates(nums);

// 在函数里修改输入数组对于调用者是可见的。
// 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
for (int i = 0; i < len; i++) {
    print(nums[i]);
}

```python
class Solution:
    def removeDuplicates(self,nums):
        for num_index in range(len(nums)-1, 0, -1):
            if nums[num_index] == nums[num_index-1]:
                nums.pop(num_index)
        return len(nums)
```

* num_index
num的索引值

* range()
range(start, stop[, step])
参数说明：

    start: 计数从 start 开始。默认是从 0 开始。例如range（5）等价于range（0， 5）;
    stop: 计数到 stop 结束，但不包括 stop。例如：range（0， 5） 是[0, 1, 2, 3, 4]没有5
    step：步长，默认为1。例如：range（0， 5） 等价于 range(0, 5, 1)

* range(len(nums)-1, 0, -1)
实现逆序遍历

---

## 9

移除元素

给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

 

示例 1:

给定 nums = [3,2,2,3], val = 3,

函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。

你不需要考虑数组中超出新长度后面的元素。

示例 2:

给定 nums = [0,1,2,2,3,0,4,2], val = 2,

函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。

注意这五个元素可为任意顺序。

你不需要考虑数组中超出新长度后面的元素。

```python
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        for num_index in range(len(nums)-1, -1, -1):
            if nums[num_index] == val:
                nums.pop(num_index)
        return len(nums)
```

* 与8类似，但要注意range()的stop参数不包含这个数字，如果需要遍历到首位，则应该设置为-1

---

## 10

实现 strStr()

实现 strStr() 函数。

给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

示例 1:

输入: haystack = "hello", needle = "ll"
输出: 2

示例 2:

输入: haystack = "aaaaa", needle = "bba"
输出: -1

说明:

当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。

* 尝试

```python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        len1 = len(haystack)
        len2 = len(needle)
        for haystack_index in range(len1):
            for needle_index in range(len2):

```

```python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
    
        # Func: 计算偏移表
        def calShiftMat(st):
            dic = {}
            for i in range(len(st)-1,-1,-1): #逆序遍历needle
                if not dic.get(st[i]): #如果get取回为空（默认none）,即st[i]还不存在于dic
                    dic[st[i]] = len(st)-i # 新增dic[st[i]] = 从1开始的当前 #如果可以get到则不再创建字典
            dic["ot"] = len(st)+1 #（len+1）
            return dic #
        
        # 其他情况判断 特殊情况
        if len(needle) > len(haystack):return -1
        if needle=="": return 0
       
        # 偏移表预处理    
        dic = calShiftMat(needle)
        idx = 0 #初始值
    
        while idx+len(needle) <= len(haystack):
            
            # 待匹配字符串
            str_cut = haystack[idx:idx+len(needle)]
            
            # 判断是否匹配
            if str_cut==needle:
                return idx
            else:
                # 边界处理
                if idx+len(needle) >= len(haystack):
                    return -1
                # 不匹配情况下，根据下一个字符的偏移，移动idx
                cur_c = haystack[idx+len(needle)]
                if dic.get(cur_c):
                    idx += dic[cur_c]
                else:
                    idx += dic["ot"]
            
        
        return -1 if idx+len(needle) >= len(haystack) else idx

```

* ot控制找不到则后移一位

* Sunday 匹配机制

匹配机制非常容易理解：

    目标字符串String

    模式串 Pattern

    当前查询索引 idx （初始为 0）

    待匹配字符串 str_cut : String [ idx : idx + len(Pattern) ]

* 每次匹配都会从目标字符串中提取待匹配字符串与模式串进行匹配：

    若匹配，则返回当前 idx

    不匹配，则查看待匹配字符串的后一位字符 c：

        若c存在于Pattern中，则 idx = idx + 偏移表[c]

        否则，idx = idx + len(pattern)

Repeat Loop 直到 idx + len(pattern) > len(String)


* 若c存在于Pattern中，则 idx = idx + 偏移表[c]

* 偏移表

偏移表的作用是存储每一个在模式串中出现的字符，在模式串中出现的**最右位置到尾部的距离 +1**，例如 aab：

    a 的偏移位就是 len(pattern)-1 = 2
    b 的偏移位就是 len(pattern)-2 = 1
    其他的均为 len(pattern)+1 = 4
    
* Python 字典(Dictionary) get() 函数返回指定键的值，如果值不在字典中返回默认值。
get()方法语法：
dict.get(key, default=None)

* 尝试上传Github
