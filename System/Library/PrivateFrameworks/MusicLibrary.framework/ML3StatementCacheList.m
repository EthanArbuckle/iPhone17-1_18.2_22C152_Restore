@interface ML3StatementCacheList
- (ML3StatementCacheNode)firstNode;
- (ML3StatementCacheNode)lastNode;
- (id)description;
- (id)oldestNode;
- (unint64_t)count;
- (void)appendNode:(id)a3;
- (void)deleteAllNodes;
- (void)deleteOldestNode;
- (void)promoteNodeWithDictionaryKey:(id)a3;
@end

@implementation ML3StatementCacheList

- (void)promoteNodeWithDictionaryKey:(id)a3
{
  id v12 = a3;
  v4 = self->_firstNode;
  v5 = 0;
  if (v4)
  {
    while (1)
    {
      v6 = [(ML3StatementCacheNode *)v4 dictionaryKey];
      char v7 = [v12 isEqual:v6];

      if (v7) {
        break;
      }
      v8 = v4;

      v4 = [(ML3StatementCacheNode *)v8 next];

      v5 = v8;
      if (!v4)
      {
        v5 = v8;
        goto LABEL_9;
      }
    }
    if (v4 != self->_lastNode)
    {
      if (v4 == self->_firstNode)
      {
        v9 = [(ML3StatementCacheNode *)v4 next];
        firstNode = self->_firstNode;
        self->_firstNode = v9;
      }
      v11 = [(ML3StatementCacheNode *)v4 next];
      [(ML3StatementCacheNode *)v5 setNext:v11];

      [(ML3StatementCacheNode *)v4 setNext:0];
      [(ML3StatementCacheList *)self appendNode:v4];
    }
  }
LABEL_9:
}

- (void)appendNode:(id)a3
{
  v5 = (ML3StatementCacheNode *)a3;
  if (self->_firstNode)
  {
    lastNode = self->_lastNode;
    p_lastNode = &self->_lastNode;
    [(ML3StatementCacheNode *)lastNode setNext:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_firstNode, a3);
    p_lastNode = &self->_lastNode;
  }
  v8 = *p_lastNode;
  *p_lastNode = v5;
}

- (unint64_t)count
{
  v2 = self->_firstNode;
  if (!v2) {
    return 0;
  }
  v3 = v2;
  unint64_t v4 = 0;
  do
  {
    uint64_t v5 = [v3 next];

    ++v4;
    v3 = (void *)v5;
  }
  while (v5);
  return v4;
}

- (id)oldestNode
{
  return self->_firstNode;
}

- (void)deleteOldestNode
{
  uint64_t v5 = self->_firstNode;
  v3 = [(ML3StatementCacheNode *)v5 next];
  firstNode = self->_firstNode;
  self->_firstNode = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);

  objc_storeStrong((id *)&self->_firstNode, 0);
}

- (ML3StatementCacheNode)lastNode
{
  return self->_lastNode;
}

- (ML3StatementCacheNode)firstNode
{
  return self->_firstNode;
}

- (void)deleteAllNodes
{
  lastNode = self->_lastNode;
  self->_lastNode = 0;

  firstNode = self->_firstNode;
  self->_firstNode = 0;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = self->_firstNode;
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 next];

      uint64_t v5 = (void *)v6;
    }
    while (v6);
  }
  char v7 = [v3 componentsJoinedByString:@",\n\t"];
  v8 = [NSString stringWithFormat:@"<%@ %p = {\n\t%@\n}>", objc_opt_class(), self, v7];

  return v8;
}

@end