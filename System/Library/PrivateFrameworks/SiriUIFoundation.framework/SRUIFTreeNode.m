@interface SRUIFTreeNode
+ (id)absoluteIndexPathsForTreeNodes:(id)a3;
- (BOOL)containsNodeAtIndexPath:(id)a3;
- (NSMutableArray)_childNodes;
- (SRUIFTreeNode)init;
- (SRUIFTreeNode)parentNode;
- (id)absoluteIndexPath;
- (id)childNodeAtIndex:(int64_t)a3;
- (id)description;
- (id)indexPathFromAncestorNode:(id)a3;
- (id)indexPathOfNodeWithItem:(id)a3;
- (id)item;
- (id)lastChildNode;
- (id)nodeAtIndexPath:(id)a3;
- (int64_t)indexOfChildNode:(id)a3;
- (int64_t)numberOfChildNodes;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4;
- (void)_setParentNode:(id)a3;
- (void)addChildNode:(id)a3;
- (void)enumerateChildNodesUsingBlock:(id)a3;
- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateDescendentNodesUsingBlock:(id)a3;
- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4;
- (void)removeChildNode:(id)a3;
- (void)removeChildNodeAtIndex:(int64_t)a3;
- (void)removeFromParentNode;
- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4;
- (void)setItem:(id)a3;
@end

@implementation SRUIFTreeNode

+ (id)absoluteIndexPathsForTreeNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "absoluteIndexPath", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (SRUIFTreeNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRUIFTreeNode;
  v2 = [(SRUIFTreeNode *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    childNodes = v2->_childNodes;
    v2->_childNodes = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 appendString:v7];
  uint64_t v8 = objc_opt_class();
  v9 = [(SRUIFTreeNode *)self item];
  v10 = [(SRUIFTreeNode *)self _childNodes];
  objc_msgSend(v6, "appendFormat:", @"<%@ %p: item=%@; %lu children=("), v8, self, v9, objc_msgSend(v10, "count");

  v11 = [(SRUIFTreeNode *)self _childNodes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    long long v13 = [v7 stringByAppendingString:@"  "];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v14 = self;
    uint64_t v15 = [(SRUIFTreeNode *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
          [v6 appendString:@"\n"];
          [v19 _appendDescriptionToString:v6 withIndentation:v13];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(SRUIFTreeNode *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    [v6 appendString:v7];
    [v6 appendString:@"\n>"]);
  }
  else
  {
    [v6 appendString:@"none>"]);
  }
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  [(SRUIFTreeNode *)self _appendDescriptionToString:v3 withIndentation:&stru_26D9AE000];
  return v3;
}

- (id)indexPathFromAncestorNode:(id)a3
{
  v4 = (SRUIFTreeNode *)a3;
  if (self == v4)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F088C8]);
  }
  else
  {
    id v5 = [(SRUIFTreeNode *)self parentNode];

    if (!v5)
    {
      v11 = (void *)MEMORY[0x263EFF940];
      uint64_t v12 = *MEMORY[0x263EFF4A0];
      long long v13 = [NSString stringWithFormat:@"Cannot generate an index path relative to node %@, which isn't an ancestor", v4];
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
    id v6 = [(SRUIFTreeNode *)self parentNode];
    id v7 = [v6 indexPathFromAncestorNode:v4];
    uint64_t v8 = [(SRUIFTreeNode *)self parentNode];
    objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v8, "indexOfChildNode:", self));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)absoluteIndexPath
{
  uint64_t v3 = [(SRUIFTreeNode *)self parentNode];

  if (v3)
  {
    v4 = [(SRUIFTreeNode *)self parentNode];
    id v5 = [v4 absoluteIndexPath];
    id v6 = [(SRUIFTreeNode *)self parentNode];
    objc_msgSend(v5, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfChildNode:", self));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F088C8]);
  }
  return v7;
}

- (BOOL)containsNodeAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = [v4 length];
  BOOL v7 = v6 == 0;
  if (v6)
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v4 indexAtPosition:v8];
      if (v9 >= [(SRUIFTreeNode *)v5 numberOfChildNodes]) {
        break;
      }
      v10 = [(SRUIFTreeNode *)v5 childNodeAtIndex:v9];

      ++v8;
      unint64_t v11 = [v4 length];
      id v5 = v10;
      BOOL v7 = v8 >= v11;
      if (v8 >= v11) {
        goto LABEL_7;
      }
    }
  }
  v10 = v5;
LABEL_7:

  return v7;
}

- (id)nodeAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      -[SRUIFTreeNode childNodeAtIndex:](v5, "childNodeAtIndex:", [v4 indexAtPosition:v6]);
      BOOL v7 = (SRUIFTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v6;
      id v5 = v7;
    }
    while (v6 < [v4 length]);
  }
  else
  {
    BOOL v7 = v5;
  }

  return v7;
}

- (id)indexPathOfNodeWithItem:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  long long v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke;
  v14[3] = &unk_264786790;
  id v5 = v4;
  id v15 = v5;
  unint64_t v6 = (unsigned int (**)(void, void))MEMORY[0x22A643DA0](v14);
  if (((unsigned int (**)(void, SRUIFTreeNode *))v6)[2](v6, self))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F088C8]);
    unint64_t v8 = (void *)v17[5];
    v17[5] = (uint64_t)v7;
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke_2;
    v11[3] = &unk_2647867B8;
    uint64_t v12 = v6;
    long long v13 = &v16;
    v11[4] = self;
    [(SRUIFTreeNode *)self enumerateDescendentNodesUsingBlock:v11];
    unint64_t v8 = v12;
  }

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 item];
  if (v4 == *(void **)(a1 + 32))
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v5 = [v3 item];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  return v6;
}

void __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    uint64_t v5 = [v8 indexPathFromAncestorNode:a1[4]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (void)removeFromParentNode
{
  id v3 = [(SRUIFTreeNode *)self parentNode];
  [v3 removeChildNode:self];
}

- (int64_t)numberOfChildNodes
{
  v2 = [(SRUIFTreeNode *)self _childNodes];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)indexOfChildNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRUIFTreeNode *)self _childNodes];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)childNodeAtIndex:(int64_t)a3
{
  id v4 = [(SRUIFTreeNode *)self _childNodes];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)lastChildNode
{
  v2 = [(SRUIFTreeNode *)self _childNodes];
  int64_t v3 = [v2 lastObject];

  return v3;
}

- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4
{
  id v11 = a3;
  int64_t v6 = [MEMORY[0x263EFF9C0] setWithObject:self];
  uint64_t v7 = [(SRUIFTreeNode *)self parentNode];
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      [v6 addObject:v8];
      uint64_t v9 = [v8 parentNode];

      id v8 = (void *)v9;
    }
    while (v9);
  }
  [v11 enumerateDescendentNodesUsingBlock:&__block_literal_global_4];
  [v11 removeFromParentNode];
  v10 = [(SRUIFTreeNode *)self _childNodes];
  [v10 insertObject:v11 atIndex:a4];

  [v11 _setParentNode:self];
}

- (void)addChildNode:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFTreeNode *)self _childNodes];
  -[SRUIFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v4, [v5 count]);
}

- (void)removeChildNodeAtIndex:(int64_t)a3
{
  id v5 = [(SRUIFTreeNode *)self _childNodes];
  id v7 = [v5 objectAtIndex:a3];

  int64_t v6 = [(SRUIFTreeNode *)self _childNodes];
  [v6 removeObjectAtIndex:a3];

  [v7 _setParentNode:0];
}

- (void)removeChildNode:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFTreeNode *)self _childNodes];
  uint64_t v6 = [v5 indexOfObject:v4];

  [(SRUIFTreeNode *)self removeChildNodeAtIndex:v6];
}

- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4
{
  id v6 = a4;
  [(SRUIFTreeNode *)self removeChildNodeAtIndex:a3];
  [(SRUIFTreeNode *)self insertChildNode:v6 atIndex:a3];
}

- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(SRUIFTreeNode *)self _childNodes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__SRUIFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke;
    v8[3] = &unk_264786800;
    id v9 = v6;
    [v7 enumerateObjectsWithOptions:a3 usingBlock:v8];
  }
}

uint64_t __59__SRUIFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(SRUIFTreeNode *)self _childNodes];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)enumerateDescendentNodesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, SRUIFTreeNode *, unsigned char *))a3;
  if (v4)
  {
    char v10 = 0;
    id v5 = objc_alloc_init(MEMORY[0x263F285A8]);
    id v6 = [(SRUIFTreeNode *)self _childNodes];
    [v5 enqueueObjects:v6];

    do
    {
      id v7 = [v5 frontObject];

      if (!v7) {
        break;
      }
      id v8 = [v5 dequeueObject];
      if (v8 != self)
      {
        v4[2](v4, v8, &v10);
        unint64_t v9 = [(SRUIFTreeNode *)v8 _childNodes];
        [v5 enqueueObjects:v9];
      }
    }
    while (!v10);
  }
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (SRUIFTreeNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  return (SRUIFTreeNode *)WeakRetained;
}

- (void)_setParentNode:(id)a3
{
}

- (NSMutableArray)_childNodes
{
  return self->_childNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong(&self->_item, 0);
}

@end