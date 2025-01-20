@interface ICCRTreeNode
+ (id)CRProperties;
- (BOOL)isInLoop;
- (BOOL)isLoopNode;
- (ICCRTree)tree;
- (ICCRTreeNode)initWithValue:(id)a3 parent:(id)a4 tree:(id)a5;
- (ICCRTreeNode)parent;
- (NSArray)children;
- (id)insertNodeWithValue:(id)a3 atIndex:(unint64_t)a4;
- (id)parentReference;
- (void)insertNode:(id)a3 atIndex:(unint64_t)a4;
- (void)moveNode:(id)a3 toIndex:(unint64_t)a4;
- (void)removeNode:(id)a3;
- (void)setChildren:(id)a3;
- (void)setParent:(id)a3;
- (void)setTree:(id)a3;
@end

@implementation ICCRTreeNode

- (ICCRTreeNode)initWithValue:(id)a3 parent:(id)a4 tree:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F29128] UUID];
  v17.receiver = self;
  v17.super_class = (Class)ICCRTreeNode;
  v12 = [(ICCRObject *)&v17 initWithDocument:0 identity:v11];

  if (v12)
  {
    objc_storeWeak((id *)&v12->_tree, v10);
    [(ICCRTreeNode *)v12 setValue:v8];
    if (v9)
    {
      v13 = [ICCRWeakReference alloc];
      v14 = [v10 document];
      v15 = [(ICCRWeakReference *)v13 initWithContents:v9 document:v14];
      [(ICCRTreeNode *)v12 setParentRef:v15];
    }
  }

  return v12;
}

+ (id)CRProperties
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"value";
  v2 = +[ICCRConstant constant];
  v6[1] = @"parentRef";
  v7[0] = v2;
  v3 = +[ICCRRegister registerWithType:0 contents:0];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)parentReference
{
  v2 = [(ICCRObject *)self fields];
  v3 = [v2 objectForKeyedSubscript:@"parentRef"];
  v4 = [v3 contents];

  return v4;
}

- (ICCRTreeNode)parent
{
  v2 = [(ICCRTreeNode *)self parentReference];
  v3 = [v2 contents];

  return (ICCRTreeNode *)v3;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v5 = [ICCRWeakReference alloc];
  id v10 = [(ICCRTreeNode *)self tree];
  v6 = [v10 document];
  v7 = [(ICCRWeakReference *)v5 initWithContents:v4 document:v6];

  id v8 = [(ICCRObject *)self fields];
  id v9 = [v8 objectForKeyedSubscript:@"parentRef"];
  [v9 setContents:v7];
}

- (BOOL)isInLoop
{
  uint64_t v3 = [(ICCRTreeNode *)self parent];
  id v4 = (ICCRTreeNode *)v3;
  for (BOOL i = v3 != 0; v4 != self && v4; BOOL i = v4 != 0)
  {
    v6 = v4;
    id v4 = [(ICCRTreeNode *)v4 parent];
  }
  return i;
}

- (BOOL)isLoopNode
{
  if ([(ICCRTreeNode *)self isInLoop])
  {
    uint64_t v3 = [(ICCRTreeNode *)self parent];
    if (v3)
    {
      unint64_t v4 = -1;
      while (1)
      {
        v5 = [(ICCRTreeNode *)self tree];
        v6 = [v5 nodes];
        unint64_t v7 = [v6 indexOfObject:v3];

        if (v4 >= v7) {
          unint64_t v4 = v7;
        }
        if (v3 == self) {
          break;
        }
        uint64_t v8 = [(ICCRTreeNode *)v3 parent];

        uint64_t v3 = (ICCRTreeNode *)v8;
        if (!v8) {
          return (char)v3;
        }
      }
      id v9 = [(ICCRTreeNode *)self tree];
      id v10 = [v9 nodes];
      LOBYTE(v3) = v4 == [v10 indexOfObject:self];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (NSArray)children
{
  children = self->_children;
  if (!children)
  {
    unint64_t v4 = [(ICCRTreeNode *)self tree];
    [v4 computeChildren];

    children = self->_children;
  }
  if (children) {
    v5 = children;
  }
  else {
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  id v11 = a3;
  v6 = [(ICCRTreeNode *)self tree];
  unint64_t v7 = [v6 nodes];
  int v8 = [v7 containsObject:v11];

  id v9 = [(ICCRTreeNode *)self tree];
  id v10 = v9;
  if (v8) {
    [v9 moveNode:v11 toParent:self atIndex:a4];
  }
  else {
    [v9 insertNode:v11 inParent:self atIndex:a4];
  }
}

- (id)insertNodeWithValue:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(ICCRTreeNode *)self tree];
  int v8 = [v7 insertNodeWithValue:v6 inParent:self atIndex:a4];

  return v8;
}

- (void)moveNode:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ICCRTreeNode *)self tree];
  [v7 moveNode:v6 toParent:self atIndex:a4];
}

- (void)removeNode:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(ICCRTreeNode *)self children];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    id v6 = [(ICCRTreeNode *)self tree];
    [v6 removeNode:v7];
  }
}

- (ICCRTree)tree
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tree);
  return (ICCRTree *)WeakRetained;
}

- (void)setTree:(id)a3
{
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_tree);
}

@end