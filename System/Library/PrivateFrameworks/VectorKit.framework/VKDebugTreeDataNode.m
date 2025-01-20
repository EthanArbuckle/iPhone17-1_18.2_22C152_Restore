@interface VKDebugTreeDataNode
- (BOOL)isExpandable;
- (VKDebugTreeDataNode)initWithDebugTreeNode:(const void *)a3 withParent:(id)a4;
- (id)name;
- (id)propertyColumn;
- (id)tagsColumn;
- (id)valueColumn;
- (int64_t)propertyCount;
- (void)buildChildren;
- (void)searchNodes:(id)a3 withParameter:(id)a4;
@end

@implementation VKDebugTreeDataNode

- (int64_t)propertyCount
{
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)self->_node + 10) - *((void *)self->_node + 9)) >> 4);
}

- (void)searchNodes:(id)a3 withParameter:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0) {
    node = (const void **)*node;
  }
  v9 = [NSString stringWithUTF8String:node];
  uint64_t v10 = [v9 rangeOfString:v7 options:1];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v6 addObject:self];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v11 = [(VKDebugTreeNode *)self children];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) searchNodes:v6 withParameter:v7];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (id)tagsColumn
{
  return @" ";
}

- (id)valueColumn
{
  return @" ";
}

- (id)propertyColumn
{
  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0) {
    node = (const void **)*node;
  }
  return (id)[NSString stringWithUTF8String:node];
}

- (id)name
{
  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0) {
    node = (const void **)*node;
  }
  return (id)[NSString stringWithUTF8String:node];
}

- (BOOL)isExpandable
{
  v2 = [(VKDebugTreeNode *)self children];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)buildChildren
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  node = self->_node;
  uint64_t v4 = node[9];
  uint64_t v5 = node[10];
  if (v4 != v5)
  {
    do
    {
      id v6 = [[VKDebugTreePropertyNode alloc] initWithDebugTreeProperty:v4 withParent:self];
      [v10 addObject:v6];

      v4 += 80;
    }
    while (v4 != v5);
    node = self->_node;
  }
  uint64_t v7 = node[6];
  for (uint64_t i = node[7]; v7 != i; v7 += 96)
  {
    v9 = [[VKDebugTreeDataNode alloc] initWithDebugTreeNode:v7 withParent:self];
    [(VKDebugTreeDataNode *)v9 buildChildren];
    [v10 addObject:v9];
  }
  [(VKDebugTreeNode *)self setChildren:v10];
}

- (VKDebugTreeDataNode)initWithDebugTreeNode:(const void *)a3 withParent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VKDebugTreeDataNode;
  result = [(VKDebugTreeNode *)&v6 initWithParent:a4];
  if (result) {
    result->_node = a3;
  }
  return result;
}

@end