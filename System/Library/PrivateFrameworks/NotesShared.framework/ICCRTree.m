@interface ICCRTree
+ (id)CRProperties;
- (ICCROrderedSet)nodes;
- (ICCRTree)init;
- (ICCRTree)initWithICCRCoder:(id)a3;
- (ICCRTreeNode)root;
- (id)insertNodeWithValue:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5;
- (int64_t)count;
- (unint64_t)insertIndexForNode:(id)a3 childIndex:(unint64_t)a4;
- (void)computeChildren;
- (void)insertNode:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5;
- (void)invalidateChildren;
- (void)mergeWith:(id)a3;
- (void)moveNode:(id)a3 toParent:(id)a4 atIndex:(unint64_t)a5;
- (void)removeNode:(id)a3;
- (void)setDocument:(id)a3;
- (void)setNodeTree:(id)a3 insertAtIndex:(unint64_t)a4;
@end

@implementation ICCRTree

- (ICCRTree)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v8.receiver = self;
  v8.super_class = (Class)ICCRTree;
  v4 = [(ICCRObject *)&v8 initWithDocument:0 identity:v3];

  if (v4)
  {
    v5 = [[ICCRTreeNode alloc] initWithValue:@"root" parent:0 tree:v4];
    v6 = [(ICCRTree *)v4 nodes];
    [v6 insertObject:v5 atIndex:0];
  }
  return v4;
}

- (ICCRTree)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRTree;
  v5 = [(ICCRObject *)&v11 initWithICCRCoder:v4];
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__ICCRTree_initWithICCRCoder___block_invoke;
    v9[3] = &unk_1E64A5520;
    v10 = v5;
    v7 = [(ICCRTree *)v10 nodes];
    [v4 addDecoderCompletionHandler:v9 dependency:v7 for:v10];
  }
  return v6;
}

void __30__ICCRTree_initWithICCRCoder___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nodes];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__ICCRTree_initWithICCRCoder___block_invoke_2;
  v3[3] = &unk_1E64A54F8;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateWithBlock:v3];
}

uint64_t __30__ICCRTree_initWithICCRCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTree:*(void *)(a1 + 32)];
}

- (ICCROrderedSet)nodes
{
  v2 = [(ICCRObject *)self fields];
  v3 = [v2 objectForKeyedSubscript:@"nodes"];

  return (ICCROrderedSet *)v3;
}

- (ICCRTreeNode)root
{
  v2 = [(ICCRTree *)self nodes];
  v3 = [v2 objectAtIndexedSubscript:0];

  return (ICCRTreeNode *)v3;
}

- (int64_t)count
{
  v2 = [(ICCRTree *)self nodes];
  int64_t v3 = [v2 count];

  return v3;
}

+ (id)CRProperties
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"nodes";
  v2 = objc_alloc_init(ICCROrderedSet);
  v6[0] = v2;
  int64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (unint64_t)insertIndexForNode:(id)a3 childIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_super v8 = [v6 children];

    v9 = [v8 objectAtIndexedSubscript:a4 - 1];

    v10 = [(ICCRTree *)self nodes];
    v7 = v10;
    objc_super v11 = v9;
  }
  else
  {
    v10 = [(ICCRTree *)self nodes];
    v9 = v10;
    objc_super v11 = v7;
  }
  uint64_t v12 = [v10 indexOfObject:v11];

  return v12 + 1;
}

- (id)insertNodeWithValue:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[ICCRTreeNode alloc] initWithValue:v9 parent:v8 tree:self];

  [(ICCRTree *)self insertNode:v10 inParent:v8 atIndex:a5];
  return v10;
}

- (void)insertNode:(id)a3 inParent:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [(ICCRTree *)self insertIndexForNode:v8 childIndex:a5];
  [v9 setParent:v8];

  [(ICCRTree *)self setNodeTree:v9 insertAtIndex:v10];
  [(ICCRTree *)self invalidateChildren];
}

- (void)setNodeTree:(id)a3 insertAtIndex:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(ICCRTree *)self nodes];
  [v7 insertObject:v6 atIndex:a4];

  id v8 = [v6 tree];

  if (v8 != self)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(v6, "children", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      unint64_t v13 = a4 + 1;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          [(ICCRTree *)self setNodeTree:*(void *)(*((void *)&v16 + 1) + 8 * v14++) insertAtIndex:v13];
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    v15 = [v6 tree];
    [v15 removeNode:v6];

    [v6 setTree:self];
  }
}

- (void)moveNode:(id)a3 toParent:(id)a4 atIndex:(unint64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = [v15 tree];

  if (v9 != self)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Can only move node from this tree." userInfo:0];
    objc_exception_throw(v14);
  }
  unint64_t v10 = [(ICCRTree *)self insertIndexForNode:v8 childIndex:a5];
  uint64_t v11 = [(ICCRTree *)self nodes];
  uint64_t v12 = [v11 indexOfObject:v15];

  unint64_t v13 = [(ICCRTree *)self nodes];
  objc_msgSend(v13, "moveObject:toIndex:", v15, (void)((__PAIR128__(v10, v12) - v10) >> 64));

  [v15 setParent:v8];
  [(ICCRTree *)self invalidateChildren];
}

- (void)removeNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(v4, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICCRTree *)self removeNode:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(ICCRTree *)self nodes];
  [v10 removeObject:v4];

  [(ICCRTree *)self invalidateChildren];
}

- (void)setDocument:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCRTree;
  [(ICCRObject *)&v6 setDocument:a3];
  id v4 = [(ICCRTree *)self nodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ICCRTree_setDocument___block_invoke;
  v5[3] = &unk_1E64A54F8;
  v5[4] = self;
  [v4 enumerateWithBlock:v5];
}

uint64_t __24__ICCRTree_setDocument___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTree:*(void *)(a1 + 32)];
}

- (void)mergeWith:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICCRTree;
  [(ICCRObject *)&v4 mergeWith:a3];
  [(ICCRTree *)self invalidateChildren];
}

- (void)invalidateChildren
{
  id v2 = [(ICCRTree *)self nodes];
  [v2 enumerateWithBlock:&__block_literal_global_12];
}

uint64_t __30__ICCRTree_invalidateChildren__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChildren:0];
}

- (void)computeChildren
{
  int64_t v3 = [(ICCRTree *)self root];
  objc_super v4 = [(ICCRTree *)self nodes];
  [v4 enumerateWithBlock:&__block_literal_global_67];

  v5 = [(ICCRTree *)self nodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__ICCRTree_computeChildren__block_invoke_2;
  v7[3] = &unk_1E64A5568;
  id v8 = v3;
  uint64_t v9 = self;
  id v6 = v3;
  [v5 enumerateWithBlock:v7];
}

void __27__ICCRTree_computeChildren__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  [v3 setChildren:v4];
}

void __27__ICCRTree_computeChildren__block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 parentReference];

  if (v3)
  {
    uint64_t v4 = [v14 parent];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [v14 parent];
      if (v6 == v14)
      {
      }
      else
      {
        char v7 = [v14 isLoopNode];

        if ((v7 & 1) == 0)
        {
          id v8 = [v14 parent];
          uint64_t v9 = [v8 children];
          [v9 addObject:v14];

LABEL_14:
          goto LABEL_15;
        }
      }
    }
    unint64_t v10 = [v14 parent];
    if (v10 != *(void **)(a1 + 32))
    {
      long long v11 = [*(id *)(a1 + 40) nodes];
      long long v12 = [v14 parent];
      if ([v11 containsObject:v12])
      {
        char v13 = [v14 isLoopNode];

        if ((v13 & 1) == 0) {
          goto LABEL_15;
        }
LABEL_13:
        id v8 = [*(id *)(a1 + 32) children];
        [v8 addObject:v14];
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
LABEL_15:
}

@end