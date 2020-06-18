# 21_30

## 21

相同的树

给定两个二叉树，编写一个函数来检验它们是否相同。

如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

```python
示例 1:

输入:       1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

输出: true

示例 2:

输入:      1          1
          /           \
         2             2

        [1,2],     [1,null,2]

输出: false

示例 3:

输入:       1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

输出: false

```

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
class Solution:
    def isSameTree(self, p: TreeNode, q: TreeNode) -> bool:
        #都是空的，情况相同，返回 是
        if p == None and q == None:
            return True
        #其中一个是空的，另一个不空，返回 否
        if p == None and q != None:
            return False
        if p!= None and q== None:
            return False
        #值不相同，返回 否
        if p.val != q.val:
            return False
        #左右都出发，看看是不是每条下去都一样。一有不一样就会返回 False，除非处处相同，才能返回 True
        return self.isSameTree(p.left,q.left) and self.isSameTree(p.right,q.right)
```

* 递归，逐渐向下检查

* 空节点 .val会报错

---

## 22

对称二叉树

给定一个二叉树，检查它是否是镜像对称的。


```python
例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

    1
   / \
  2   2
 / \ / \
3  4 4  3

但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

    1
   / \
  2   2
   \   \
   3    3

class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        queue = collections.deque()
        queue.append((root, root))
        while queue:
            left, right = queue.popleft()
            if not left and not right:
                continue
            if not left or not right:
                return False
            if left.val != right.val:
                return False
            queue.append((left.left, right.right))
            queue.append((left.right, right.left))
        return True
```

* 就很合理
            queue.append((left.left, right.right))
            queue.append((left.right, right.left))
* deque可以append((1,1))

---

## 23

二叉树的最大深度

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

```python

示例：
给定二叉树 [3,9,20,null,null,15,7]，

    3
   / \
  9  20
    /  \
   15   7

返回它的最大深度 3 。

```

```python
class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        def bottom_up(node):
            return 0 if node is None else max(bottom_up(node.left), bottom_up(node.right)) + 1
        return bottom_up(root)
```

* 大佬们= =

---

## 24

二叉树的层次遍历 II

给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

```python

例如：
给定二叉树 [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7

```

返回其自底向上的层次遍历为：

[
  [15,7],
  [9,20],
  [3]
]

```python
class Solution:
    def levelOrderBottom(self, root: TreeNode) -> List[List[int]]:
        res = []
        def helper(root, depth):
            if not root: return
            if depth == len(res):
                res.insert(0, [])
            res[-(depth+1)].append(root.val)
            helper(root.left, depth+1)
            helper(root.right, depth+1)
        helper(root, 0)
        return res
```

* 0层开始遍历，逆向append

---

## 25

将有序数组转换为二叉搜索树

将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

示例:

```python

给定有序数组: [-10,-3,0,5,9],

一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

      0
     / \
   -3   9
   /   /
 -10  5
```

```python
class Solution:
    def sortedArrayToBST(self, nums: List[int]) -> TreeNode:
        if nums:
            m = len(nums) // 2
            r = TreeNode(nums[m])
            r.left, r.right = map(self.sortedArrayToBST, [nums[:m], nums[m+1:]])
            return r

```

* **有序数组**

