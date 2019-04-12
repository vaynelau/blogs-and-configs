## python2 与 python3

#### python2

```python
>>> print(12132)  # 只有一个参数时，加括号与不加括号相同
12132
>>> print 12132
12132
>>> print  12132,3,8
12132 3 8
>>> print  12132,3,8,'qw'
12132 3 8 qw
>>> print(12132,'wq')  # 有多个参数，加括号相当于输出元组
(12132, 'wq')
>>> print ( 12132, 'wq' ,)
(12132, 'wq')
>>> print(1,)
(1,)

>>> from __future__ import print_function  # 导入后print函数与python3的print函数完全相同
>>> print 1
  File "<stdin>", line 1
    print 1
          ^
SyntaxError: invalid syntax
>>> print ( 12132, 'wq' )
12132 wq
>>> print ( 12132, 'wq' ,)
12132 wq


>>> str = "我爱北京天安门"
>>> str
'\xce\xd2\xb0\xae\xb1\xb1\xbe\xa9\xcc\xec\xb0\xb2\xc3\xc5'
>>> print(str)
我爱北京天安门
>>> str = u"我爱北京天安门"
>>> str
u'\u6211\u7231\u5317\u4eac\u5929\u5b89\u95e8'
>>> print(str)
我爱北京天安门


>>> 1/2  # 与python3不同，两数均为整数时进行整除，否则为实除
0
>>> 1.0/2
0.5
>>> 1/2.0
0.5

>>> -9//5  # 整除方式为地板除，向下取整，尤其是对于负数
-2
>>> -9//2
-5
>>> 9//-2
-5
>>> -9%2
1
>>> 9%-2
-1
>>> 9%2
1

>>> 9>>-2  # 移位的位数可以为0，但不可以为负数
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: negative shift count
>>> 9>>0
9
>>> 9>>1
4
>>> -9>>1 # 右移为算数右移
-5
>>> -1>>3
-1


>>> 1 <> 2  # python2同时支持'<>'和'!='号，python3则不支持'<>'号
True
>>> 1 <> 1
False
>>> 1 != 1
False


>>> 我 = 1  # python2不支持中文变量
  File "<stdin>", line 1
    我 = 1
    ^
SyntaxError: invalid syntax
    
    
# python2以0开头的整数会识别为八进制
>>> 012
10
>>> 087
  File "<stdin>", line 1
    087
      ^
SyntaxError: invalid token

```

#### python3

```python
# python3支持中文变量（不包括中文符号），中文可当做字母看待
>>> 我 = 1  
>>> 我
1
>>> 我， = 1
  File "<stdin>", line 1
    我， = 1
     ^
SyntaxError: invalid character in identifier
>>> 1我 =1
  File "<stdin>", line 1
    1我 =1
     ^
SyntaxError: invalid syntax
>>> 我1 =2
>>> 我1
2
>>> len('12')
2
>>> len('12我')
3
>>> len('我')
1


>>> a = 1  # python大小写敏感
>>> A
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'A' is not defined
>>> a
1

#关键字（保留字）无法作为标识符
>>> if = 1 
  File "<stdin>", line 1
    if = 1
       ^
SyntaxError: invalid syntax
>>> If = 1
>>> true = 1
>>> true
1
>>> True = 1
  File "<stdin>", line 1
SyntaxError: can't assign to keyword


# 保留字列表，共33个保留字
>>> import keyword
>>> keyword.kwlist  
['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
>>> len(keyword.kwlist)
33


# python内置函数可以作为变量赋值，但不推荐
>>> len = 1
>>> len(keyword.kwlist)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'int' object is not callable

# 一行语句结尾换行符之前输入反斜杠可另起一行继续该语句
>>> string = "i love this country,"\
...          +"because it is very beautiful!"\
...          + "how do you think about it?" \
...          + "Do you like it too?"
>>> string
'i love this country,because it is very beautiful!how do you think about it?Do you like it too?'

# 反斜杠之后不可加空格
>>> string = "i love this country,"\ 
  File "<stdin>", line 1
    string = "i love this country,"\
                                    ^
SyntaxError: unexpected character after line continuation character


# 函数的参数另起一行则不必加反斜杠
>>> sum(1, 
... 2,
... 3
... ,
... )
Traceback (most recent call last):
  File "<stdin>", line 3, in <module>
TypeError: sum expected at most 2 arguments, got 3


# 多个相邻的字符串，'+'不是必须的
>>> string = "i love this country,""qw"
>>> string
'i love this country,qw'
>>> string = "i love this country,"\
... "wewewe"
>>> string
'i love this country,wewewe'

# 字符串与整数，不可直接相加
>>> string = "i love this country,"+23
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: must be str, not int

# 三引号（三个引号必须连续）在此处只会被作为一个整体识别
>>> a = ''' sdwd '''
>>> a
' sdwd '
>>> a = '' sdwd ''
  File "<stdin>", line 1
    a = '' sdwd ''
              ^
SyntaxError: invalid syntax

# 使用三引号可以直接输入多行字符串
>>> a = '''"""Hello,
... World!
... """
... '''
>>> a
'"""Hello,\nWorld!\n"""\n'
>>> print(a)
"""Hello,
World!
"""

>>>

# 对于python3，'/'始终为实数除法，'//'为整除（地板除），向下取整
>>> 9/2
4.5
>>> 9/3
3.0
>>> 9//2
4
>>> -9//2
-5
>>> -9//-2
4
>>> 9//-2
-5


# 对于复数，不可用关系运算符比较大小
>>> 5+4j > 2-3j
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'complex' and 'complex'
>>> 5+4j
(5+4j)
>>> a = 5+4j
>>> a
(5+4j)
>>> type(a)
<class 'complex'>


# 对于字符串，可以直接比较大小，按字典序
>>> 'abc' < 'xyz'
True
>>> 'abc' < 'a'
False
>>> 'abc' == 'a'
False


# python3已经不支持'<>'不等号
>>> 1 <> 2
  File "<stdin>", line 1
    1 <> 2
       ^
SyntaxError: invalid syntax
>>> 1 != 2
True


# 整数和字符串，不能直接比较大小
>>> (3, 2) < ('a', 'b')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '<' not supported between instances of 'int' and 'str'
>>> 3 < 'a'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '<' not supported between instances of 'int' and 'str'
>>> (3, 2) < (4, 1)
True
>>> (3, 2) < (3, 1)
False
>>> (3, 2, 2) == (3, 2,2)
True

# True和False参与比较时，True的值为1，False的值为0
>>> True == 1
True
>>> True == 2
False
>>> True == -1
False
>>> False == 0
True
>>> False == 1
False


# 有多个关系运算符时，每相邻的两个进行一次比较，最后进行逻辑与
>>> 3>2>1
True
>>> 3>2>2
False
>>> (3>2)>1
False
>>> (3>2)>0
True
>>> (3>2)>-1
True
>>> 3>2<3
True
>>> 3>2<3<4
True
>>> 3>2<3<2
False


# python支持'//='符号
>>> a = 3
>>> a//=2
>>> a
1


>>> a = [12,4]
>>> sum(a)
16

# python3整数不支持前导0，含前导零会识别为语法错误
>>> 0787
  File "<stdin>", line 1
    0787
       ^
SyntaxError: invalid token
>>> 01
  File "<stdin>", line 1
    01
     ^
SyntaxError: invalid token

    
# 逻辑表达式的短路规则
>>> 2 or 1
2
>>> -2 or 4
-2
>>> 0 or 4
4
>>> 0 and 4
0
>>> 1 and 4
4
>>> -1 and 4
4
>>> -1 and 0
0
>>> not-1
False
>>> not 0
True

```

