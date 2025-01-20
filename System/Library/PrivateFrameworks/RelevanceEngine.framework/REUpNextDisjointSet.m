@interface REUpNextDisjointSet
- (BOOL)containsItem:(id)a3;
- (BOOL)isItem:(id)a3 connectedToItem:(id)a4;
- (REUpNextDisjointSet)init;
- (id)allItemsConnectedToItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (void)addItem:(id)a3;
- (void)connectItem:(id)a3 withItem:(id)a4;
- (void)dealloc;
- (void)removeItem:(id)a3;
@end

@implementation REUpNextDisjointSet

- (REUpNextDisjointSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)REUpNextDisjointSet;
  v2 = [(REUpNextDisjointSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    nodes = v2->_nodes;
    v2->_nodes = (NSMapTable *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_nodes;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMapTable *)self->_nodes objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        [v8 setParent:0];
        v9 = [v8 children];
        [v9 removeAllObjects];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)REUpNextDisjointSet;
  [(REUpNextDisjointSet *)&v10 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = [+[REUpNextDisjointSet allocWithZone:a3] init];
  uint64_t v25 = 0;
  v26 = (id *)&v25;
  uint64_t v27 = 0x3042000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  id v30 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __36__REUpNextDisjointSet_copyWithZone___block_invoke;
  v22[3] = &unk_2644BE4C8;
  uint64_t v5 = v4;
  v23 = v5;
  v24 = &v25;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x223C31700](v22);
  objc_storeWeak(v26 + 5, v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_nodes;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [v5[1] objectForKey:v11];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          long long v14 = [(NSMapTable *)self->_nodes objectForKey:v11];
          v15 = [v14 rootNode];
          ((void (**)(void, void *, void))v6)[2](v6, v15, 0);
        }
      }
      uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v16 = v5;
  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&v30);
  return v16;
}

void __36__REUpNextDisjointSet_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = [v5 item];
  uint64_t v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    objc_super v10 = [REUpNextSetNode alloc];
    uint64_t v11 = [v5 item];
    long long v12 = [(REUpNextSetNode *)v10 initWithItem:v11];

    BOOL v13 = *(void **)(*(void *)(a1 + 32) + 8);
    long long v14 = [v5 item];
    [v13 setObject:v12 forKey:v14];

    if (v6) {
      [(REUpNextSetNode *)v12 join:v6];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v15 = objc_msgSend(v5, "children", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * v19);
          WeakRetained = (void (**)(id, void, void *))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                              + 40));
          WeakRetained[2](WeakRetained, v20, v12);

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
}

- (void)addItem:(id)a3
{
  id v5 = a3;
  if (-[REUpNextDisjointSet containsItem:](self, "containsItem:")) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ already in disjoint set %@", v5, self format];
  }
  uint64_t v4 = [[REUpNextSetNode alloc] initWithItem:v5];
  [(NSMapTable *)self->_nodes setObject:v4 forKey:v5];
}

- (void)removeItem:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMapTable objectForKey:](self->_nodes, "objectForKey:");
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v5, self format];
  }
  [v4 remove];
  [(NSMapTable *)self->_nodes removeObjectForKey:v5];
}

- (void)connectItem:(id)a3 withItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_nodes objectForKey:v10];
  uint64_t v8 = [(NSMapTable *)self->_nodes objectForKey:v6];
  uint64_t v9 = (void *)v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v10, self format];
    if (v9) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v6, self format];
LABEL_3:
  [v7 join:v9];
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_nodes count];
}

- (BOOL)containsItem:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_nodes objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)allItemsConnectedToItem:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_nodes objectForKey:v4];
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v4, self format];
  }
  id v6 = [MEMORY[0x263EFF9C0] set];
  uint64_t v17 = 0;
  uint64_t v18 = (id *)&v17;
  uint64_t v19 = 0x3042000000;
  uint64_t v20 = __Block_byref_object_copy__9;
  long long v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__REUpNextDisjointSet_allItemsConnectedToItem___block_invoke;
  v13[3] = &unk_2644BE4F0;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v17;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x223C31700](v13);
  objc_storeWeak(v18 + 5, v9);
  id v10 = [v7 rootNode];
  ((void (**)(void, void *))v9)[2](v9, v10);
  uint64_t v11 = (void *)[v8 copy];

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v22);

  return v11;
}

void __47__REUpNextDisjointSet_allItemsConnectedToItem___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if ((id)a1[4] != v3)
  {
    id v5 = (void *)a1[5];
    id v6 = [v3 item];
    [v5 addObject:v6];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = objc_msgSend(v4, "children", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(a1[6] + 8) + 40));
        WeakRetained[2](WeakRetained, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (BOOL)isItem:(id)a3 connectedToItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMapTable *)self->_nodes objectForKey:v6];
  uint64_t v9 = [(NSMapTable *)self->_nodes objectForKey:v7];
  uint64_t v10 = (void *)v9;
  if (!v8)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v6, self format];
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Item %@ not in disjoint set %@", v7, self format];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = [v8 rootNode];
  uint64_t v12 = [v10 rootNode];
  char v13 = [v11 isEqual:v12];

  return v13;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)REUpNextDisjointSet;
  id v3 = [(REUpNextDisjointSet *)&v7 description];
  id v4 = [(NSMapTable *)self->_nodes description];
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end