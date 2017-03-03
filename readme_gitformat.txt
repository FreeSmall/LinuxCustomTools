提取工程的patch:

1.用gitformat命令遍历工程中所有的.git目录,然后通过git format-patch -M origin/master生成对应工程所有的.patch文件
  用法是: gitformat 工程路径
2.用cfs命令进行拷贝:
   该命令的作用是根据目录结构来拷贝对应的文件
   用法是：cfs 源目录  拷贝的文件（可以用通配符）目标目录
3.删除建库的patch, 每个git库的第一个patch是0001开始的所以可以查找直接删除：
   eg: find . -name "0001*.patch" | xargs rm -rf

