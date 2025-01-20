@interface NATreeNodeDeepNodeEnumerator
- (NATreeNode)node;
- (NATreeNodeDeepNodeEnumerator)initWithNode:(id)a3;
- (NSArray)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextObject;
@end

@implementation NATreeNodeDeepNodeEnumerator

- (NATreeNodeDeepNodeEnumerator)initWithNode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NATreeNodeDeepNodeEnumerator;
  v5 = [(NATreeNodeDeepNodeEnumerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    node = v5->_node;
    v5->_node = (NATreeNode *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NATreeNodeDeepNodeEnumerator allocWithZone:a3];
  v5 = [(NATreeNodeDeepNodeEnumerator *)self node];
  uint64_t v6 = [(NATreeNodeDeepNodeEnumerator *)v4 initWithNode:v5];

  return v6;
}

- (id)nextObject
{
  enumeratorStack = self->_enumeratorStack;
  if (!enumeratorStack)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [(NATreeNodeDeepNodeEnumerator *)self node];
    uint64_t v6 = [v5 shallowNodeEnumerator];
    v7 = [v4 arrayWithObject:v6];
    v8 = self->_enumeratorStack;
    self->_enumeratorStack = v7;

    enumeratorStack = self->_enumeratorStack;
  }
  if ([(NSMutableArray *)enumeratorStack count])
  {
    do
    {
      objc_super v9 = [(NSMutableArray *)self->_enumeratorStack lastObject];
      v10 = [v9 nextObject];

      v11 = self->_enumeratorStack;
      if (v10)
      {
        v12 = [v10 shallowNodeEnumerator];
        [(NSMutableArray *)v11 na_safeAddObject:v12];
      }
      else
      {
        [(NSMutableArray *)self->_enumeratorStack removeLastObject];
      }
    }
    while ([(NSMutableArray *)self->_enumeratorStack count] && !v10);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (NSArray)allObjects
{
  v3 = objc_opt_new();
  id v4 = (void *)[(NATreeNodeDeepNodeEnumerator *)self copy];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    do
    {
      [v3 addObject:v6];
      uint64_t v7 = [v4 nextObject];

      uint64_t v6 = (void *)v7;
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NATreeNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_enumeratorStack, 0);
}

@end