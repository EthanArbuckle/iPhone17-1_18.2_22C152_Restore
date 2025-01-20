@interface REUpNextSetNode
- (NSMutableArray)children;
- (REUpNextSetNode)initWithItem:(id)a3;
- (REUpNextSetNode)parent;
- (id)item;
- (id)rootNode;
- (unint64_t)rank;
- (void)join:(id)a3;
- (void)remove;
- (void)setChildren:(id)a3;
- (void)setParent:(id)a3;
- (void)setRank:(unint64_t)a3;
@end

@implementation REUpNextSetNode

- (REUpNextSetNode)initWithItem:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REUpNextSetNode;
  v6 = [(REUpNextSetNode *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_item, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    children = v7->_children;
    v7->_children = (NSMutableArray *)v8;

    v7->_rank = 0;
    parent = v7->_parent;
    v7->_parent = 0;
  }
  return v7;
}

- (id)rootNode
{
  p_parent = &self->_parent;
  parent = self->_parent;
  if (parent)
  {
    id v5 = [(REUpNextSetNode *)parent rootNode];
    v6 = (REUpNextSetNode *)v5;
    if (*p_parent != (REUpNextSetNode *)v5)
    {
      [(NSMutableArray *)(*p_parent)->_children removeObject:self];
      objc_storeStrong((id *)p_parent, v5);
      [v5[3] addObject:self];
      v6 = self->_parent;
    }
    v7 = v6;
  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (void)join:(id)a3
{
  id v4 = a3;
  v9 = [(REUpNextSetNode *)self rootNode];
  id v5 = [v4 rootNode];

  if (v9 != v5)
  {
    unint64_t v6 = [v9 rank];
    if (v6 >= [v5 rank])
    {
      unint64_t v7 = [v9 rank];
      unint64_t v8 = [v5 rank];
      [v5 setParent:v9];
      if (v7 <= v8) {
        v9[4] = (char *)v9[4] + 1;
      }
    }
    else
    {
      [v9 setParent:v5];
      [v5[3] addObject:v9];
    }
  }
}

- (void)remove
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_parent)
  {
    uint64_t v3 = [(REUpNextSetNode *)self rootNode];
    [(NSMutableArray *)self->_parent->_children removeObject:self];
    parent = self->_parent;
    self->_parent = 0;

    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_children lastObject];
    uint64_t v3 = v5;
    if (!v5) {
      goto LABEL_14;
    }
    unint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    *(void *)(v3 + 32) = self->_rank - 1;
    [(NSMutableArray *)self->_children removeLastObject];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v7 = self->_children;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(v3 + 24), "addObject:", v12, (void)v13);
        objc_storeStrong((id *)(v12 + 16), (id)v3);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

LABEL_14:
  [(NSMutableArray *)self->_children removeAllObjects];
}

- (id)item
{
  return self->_item;
}

- (REUpNextSetNode)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_item, 0);
}

@end