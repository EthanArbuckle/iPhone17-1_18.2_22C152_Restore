@interface TSKTreeNode
- (BOOL)hasChildWithName:(id)a3;
- (NSMutableArray)children;
- (NSString)name;
- (TSKTreeNode)initWithContext:(id)a3;
- (TSKTreeNode)nodeWithObject:(id)a3;
- (id)childEnumerator;
- (id)dataObject;
- (id)description;
- (id)nodeAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)shallowCopy;
- (int64_t)indexOfNodeWithObject:(id)a3;
- (void)addChildWithName:(id)a3 object:(id)a4;
- (void)addNode:(id)a3 atIndex:(unint64_t)a4;
- (void)addObject:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateAllChildrenWithBlock:(id)a3;
- (void)removeAllChildren;
- (void)removeChildAtIndex:(unint64_t)a3;
- (void)removeChildWithDataObject:(id)a3;
- (void)removeChildWithName:(id)a3;
- (void)setChildren:(id)a3;
- (void)setDataObject:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TSKTreeNode

- (TSKTreeNode)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKTreeNode;
  v3 = [(TSPObject *)&v6 initWithContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->mObject = 0;
    v3->mDisplayName = 0;
    v3->mChildren = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKTreeNode;
  [(TSKTreeNode *)&v3 dealloc];
}

- (NSString)name
{
  return self->mDisplayName;
}

- (void)setName:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mDisplayName = (NSString *)a3;
}

- (NSMutableArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mChildren = (NSMutableArray *)a3;
}

- (id)dataObject
{
  return self->mObject;
}

- (void)setDataObject:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mObject = a3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  objc_super v3 = (void *)[(NSMutableArray *)self->mChildren objectAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (id)[v3 dataObject];
}

- (id)nodeAtIndex:(unint64_t)a3
{
  objc_super v3 = (void *)[(NSMutableArray *)self->mChildren objectAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKTreeNode nodeAtIndex:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTreeNode.mm"), 119, @"Not a tree node where there should be one!");
  }
  return v3;
}

- (TSKTreeNode)nodeWithObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mChildren = self->mChildren;
  uint64_t v5 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mChildren);
    }
    v9 = *(TSKTreeNode **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(-[TSKTreeNode dataObject](v9, "dataObject"), "isEqual:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (int64_t)indexOfNodeWithObject:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->mChildren count];
  if (v5 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while ((objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", v7), "dataObject"), "isEqual:", a3) & 1) == 0)
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (BOOL)hasChildWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mChildren = self->mChildren;
  uint64_t v5 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mChildren);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "name"), "isEqualToString:", a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)addChildWithName:(id)a3 object:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mChildren = self->mChildren;
  uint64_t v8 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(mChildren);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", a3))
        {
          [v12 setDataObject:a4];
          return;
        }
      }
      uint64_t v9 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  [(TSPObject *)self willModify];
  long long v13 = [[TSKTreeNode alloc] initWithContext:[(TSPObject *)self context]];
  [(TSKTreeNode *)v13 setName:a3];
  [(TSKTreeNode *)v13 setDataObject:a4];
  [(NSMutableArray *)self->mChildren addObject:v13];
}

- (void)addObject:(id)a3 atIndex:(unint64_t)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKTreeNode addObject:atIndex:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTreeNode.mm"), 184, @"Can't get a name for this object!");
  }
  [(TSPObject *)self willModify];
  uint64_t v9 = [[TSKTreeNode alloc] initWithContext:[(TSPObject *)self context]];
  -[TSKTreeNode setName:](v9, "setName:", [a3 name]);
  [(TSKTreeNode *)v9 setDataObject:a3];
  [(NSMutableArray *)self->mChildren insertObject:v9 atIndex:a4];
}

- (void)addNode:(id)a3 atIndex:(unint64_t)a4
{
  [(TSPObject *)self willModify];
  mChildren = self->mChildren;

  [(NSMutableArray *)mChildren insertObject:a3 atIndex:a4];
}

- (void)removeChildWithName:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mChildren = self->mChildren;
  uint64_t v7 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(mChildren);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a3))
        {
          [(TSPObject *)self willModify];
          [(NSMutableArray *)self->mChildren removeObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableArray *)self->mChildren removeObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)removeChildWithDataObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mChildren = self->mChildren;
  uint64_t v7 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(mChildren);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "dataObject"), "isEqual:", a3))
        {
          [(TSPObject *)self willModify];
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableArray *)self->mChildren removeObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)removeChildAtIndex:(unint64_t)a3
{
  [(TSPObject *)self willModify];
  mChildren = self->mChildren;

  [(NSMutableArray *)mChildren removeObjectAtIndex:a3];
}

- (void)removeAllChildren
{
  [(TSPObject *)self willModify];
  mChildren = self->mChildren;

  [(NSMutableArray *)mChildren removeAllObjects];
}

- (id)childEnumerator
{
  return (id)[(NSMutableArray *)self->mChildren objectEnumerator];
}

- (void)enumerateAllChildrenWithBlock:(id)a3
{
  mChildren = self->mChildren;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__TSKTreeNode_enumerateAllChildrenWithBlock___block_invoke;
  v4[3] = &unk_2646B0778;
  v4[4] = a3;
  [(NSMutableArray *)mChildren enumerateObjectsUsingBlock:v4];
}

uint64_t __45__TSKTreeNode_enumerateAllChildrenWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ((*(unsigned int (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 dataObject]))
  {
    *a4 = 1;
  }
  uint64_t result = [a2 children];
  if (result)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    return [a2 enumerateAllChildrenWithBlock:v8];
  }
  return result;
}

- (id)shallowCopy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = [[TSKTreeNode alloc] initWithContext:[(TSPObject *)self context]];
  [(TSKTreeNode *)v3 setName:self->mDisplayName];
  [(TSKTreeNode *)v3 setDataObject:self->mObject];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mChildren = self->mChildren;
  uint64_t v6 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mChildren);
        }
        uint64_t v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9) shallowCopy];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)mChildren countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [(TSKTreeNode *)v3 setChildren:v4];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"node(%p): %@, children: %@", self, self->mDisplayName, self->mChildren];
}

@end