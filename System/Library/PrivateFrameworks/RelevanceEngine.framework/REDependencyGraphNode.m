@interface REDependencyGraphNode
- (BOOL)isEqual:(id)a3;
- (NSHashTable)connections;
- (REDependencyGraphNode)initWithItem:(id)a3;
- (id)item;
- (unint64_t)hash;
- (void)setConnections:(id)a3;
@end

@implementation REDependencyGraphNode

- (unint64_t)hash
{
  return [self->_item hash];
}

- (REDependencyGraphNode)initWithItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDependencyGraphNode;
  v6 = [(REDependencyGraphNode *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_item, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    connections = v7->_connections;
    v7->_connections = (NSHashTable *)v8;
  }
  return v7;
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REDependencyGraphNode *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id item = self->_item;
      id v6 = v4->_item;
      id v7 = item;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong(&self->_item, 0);
}

- (void)setConnections:(id)a3
{
}

@end