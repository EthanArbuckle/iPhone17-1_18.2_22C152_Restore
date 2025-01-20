@interface SCRCStackQueue
- (BOOL)isEmpty;
- (id)dequeueObject;
- (id)dequeueObjectRetained;
- (id)description;
- (id)objectEnumerator;
- (id)popObject;
- (id)popObjectRetained;
- (id)topObject;
- (unint64_t)count;
- (void)_safeReleaseAllObjects;
- (void)dealloc;
- (void)pushArray:(id)a3;
- (void)pushObject:(id)a3;
- (void)removeAllObjects;
@end

@implementation SCRCStackQueue

- (void)dealloc
{
  [(SCRCStackQueue *)self removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)SCRCStackQueue;
  [(SCRCStackQueue *)&v3 dealloc];
}

- (void)removeAllObjects
{
  self->_count = 0;
}

- (void)_safeReleaseAllObjects
{
  objc_super v3 = self->_firstNode;
  firstNode = self->_firstNode;
  self->_firstNode = 0;

  lastNode = self->_lastNode;
  self->_lastNode = 0;

  if (v3)
  {
    do
    {
      uint64_t v6 = [(_SCRCStackNode *)v3 next];

      objc_super v3 = (_SCRCStackNode *)v6;
    }
    while (v6);
  }
}

- (void)pushArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(SCRCStackQueue *)self pushObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)pushObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = objc_alloc_init(_SCRCStackNode);
    [(_SCRCStackNode *)v5 setObject:v4];

    if (self->_firstNode)
    {
      [(_SCRCStackNode *)v5 setPrev:self->_lastNode];
      [(_SCRCStackNode *)self->_lastNode setNext:v5];
    }
    else
    {
      objc_storeStrong((id *)&self->_firstNode, v5);
    }
    lastNode = self->_lastNode;
    self->_lastNode = v5;

    ++self->_count;
  }
}

- (id)popObject
{
  id v2 = [(SCRCStackQueue *)self popObjectRetained];
  return v2;
}

- (id)popObjectRetained
{
  objc_super v3 = self->_lastNode;
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  v5 = [(_SCRCStackNode *)v3 object];
  lastNode = self->_lastNode;
  --self->_count;
  if (lastNode == self->_firstNode)
  {
    self->_lastNode = 0;

    firstNode = self->_firstNode;
    self->_firstNode = 0;
  }
  else
  {
    uint64_t v7 = [(_SCRCStackNode *)lastNode prev];
    uint64_t v8 = self->_lastNode;
    self->_lastNode = v7;

    [(_SCRCStackNode *)self->_lastNode setNext:0];
  }

  return v5;
}

- (id)topObject
{
  return [(_SCRCStackNode *)self->_lastNode object];
}

- (id)dequeueObjectRetained
{
  objc_super v3 = self->_firstNode;
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  v5 = [(_SCRCStackNode *)v3 object];
  firstNode = self->_firstNode;
  if (firstNode == self->_lastNode)
  {
    self->_firstNode = 0;

    lastNode = self->_lastNode;
    self->_lastNode = 0;
  }
  else
  {
    uint64_t v7 = [(_SCRCStackNode *)v4 next];
    uint64_t v8 = self->_firstNode;
    self->_firstNode = v7;

    [(_SCRCStackNode *)self->_firstNode setPrev:0];
  }
  --self->_count;

  return v5;
}

- (id)dequeueObject
{
  id v2 = [(SCRCStackQueue *)self dequeueObjectRetained];
  return v2;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"Stack (%p) has %lu items\n", self, -[SCRCStackQueue count](self, "count"));
  id v4 = self->_firstNode;
  if (v4)
  {
    v5 = v4;
    do
    {
      id v6 = [NSString alloc];
      uint64_t v7 = [v5 object];
      uint64_t v8 = (void *)[v6 initWithFormat:@"\t%@\n", v7];

      [v3 appendString:v8];
      uint64_t v9 = [v5 next];

      v5 = (void *)v9;
    }
    while (v9);
  }
  return v3;
}

- (id)objectEnumerator
{
  id v2 = [[_SCRCStackQueueEnumerator alloc] initWithListMember:self->_firstNode];
  return v2;
}

- (BOOL)isEmpty
{
  return self->_firstNode == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
}

@end