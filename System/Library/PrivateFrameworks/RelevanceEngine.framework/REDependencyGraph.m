@interface REDependencyGraph
- (BOOL)containsItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)item:(id)a3 isDependencyOfItem:(id)a4;
- (NSArray)allItems;
- (REDependencyGraph)init;
- (REDependencyGraph)initWithPointerFunctions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)topologicalSortedItems;
- (id)topologicalSortedItemsWithComparator:(id)a3;
- (unint64_t)count;
- (void)_enumerateSortedFirstLevelDependenciesOfItem:(id)a3 usingComparator:(id)a4 withBlock:(id)a5;
- (void)_visitNode:(id)a3 visited:(id)a4 temporary:(id)a5 result:(id)a6 comparator:(id)a7 warn:(BOOL)a8;
- (void)addItem:(id)a3;
- (void)enumerateDependenciesOfItem:(id)a3 usingBlock:(id)a4;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)markItem:(id)a3 dependentOnItem:(id)a4;
- (void)removeItem:(id)a3;
@end

@implementation REDependencyGraph

- (BOOL)containsItem:(id)a3
{
  v3 = [(NSMapTable *)self->_nodes objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)markItem:(id)a3 dependentOnItem:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  v7 = [(NSMapTable *)self->_nodes objectForKey:v20];
  uint64_t v8 = [(NSMapTable *)self->_nodes objectForKey:v6];
  v15 = (void *)v8;
  if (!v7)
  {
    v17 = (void *)*MEMORY[0x263EFF4A0];
    uint64_t v19 = (uint64_t)v20;
LABEL_7:
    v18 = @"Item %@ not in dependency graph %@";
    goto LABEL_9;
  }
  if (!v8)
  {
    v17 = (void *)*MEMORY[0x263EFF4A0];
    uint64_t v19 = (uint64_t)v6;
    goto LABEL_7;
  }
  if (v7 != (void *)v8)
  {
    v16 = [v7 connections];
    [v16 addObject:v15];

    goto LABEL_10;
  }
  v17 = (void *)*MEMORY[0x263EFF4A0];
  uint64_t v19 = (uint64_t)v20;
  v18 = @"Cannot make item %@ not in dependency of itself";
LABEL_9:
  RERaiseInternalException(v17, v18, v9, v10, v11, v12, v13, v14, v19);
LABEL_10:
}

- (void)addItem:(id)a3
{
  id v11 = a3;
  if (-[REDependencyGraph containsItem:](self, "containsItem:")) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Item %@ already in dependency graph %@", v4, v5, v6, v7, v8, v9, (uint64_t)v11);
  }
  uint64_t v10 = [[REDependencyGraphNode alloc] initWithItem:v11];
  [(NSMapTable *)self->_nodes setObject:v10 forKey:v11];
}

- (void)_enumerateSortedFirstLevelDependenciesOfItem:(id)a3 usingComparator:(id)a4 withBlock:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v17 = [(NSMapTable *)self->_nodes objectForKey:v8];
    if (v17)
    {
      id v34 = v10;
      id v35 = v9;
      id v36 = v8;
      char v45 = 0;
      v18 = [MEMORY[0x263EFF980] array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v19 = self->_nodes;
      uint64_t v20 = [(NSMapTable *)v19 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [(NSMapTable *)self->_nodes objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * i)];
            v25 = v24;
            if (v17 != v24)
            {
              v26 = [v24 connections];
              int v27 = [v26 containsObject:v17];

              if (v27)
              {
                v28 = [v25 item];
                [v18 addObject:v28];
              }
            }
          }
          uint64_t v21 = [(NSMapTable *)v19 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v21);
      }

      id v10 = v34;
      id v9 = v35;
      if (v35) {
        [v18 sortUsingComparator:v35];
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v29 = v18;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v38;
LABEL_17:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v29);
          }
          (*((void (**)(id, void, char *))v34 + 2))(v34, *(void *)(*((void *)&v37 + 1) + 8 * v33), &v45);
          if (v45) {
            break;
          }
          if (v31 == ++v33)
          {
            uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v31) {
              goto LABEL_17;
            }
            break;
          }
        }
      }

      id v8 = v36;
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Item %@ not in dependency graph %@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }
  }
}

uint64_t __92__REDependencyGraph_REGraphExtensions___visitNode_visited_temporary_result_comparator_warn___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _visitNode:a2 visited:*(void *)(a1 + 40) temporary:*(void *)(a1 + 48) result:*(void *)(a1 + 56) comparator:*(void *)(a1 + 64) warn:*(unsigned __int8 *)(a1 + 72)];
}

- (id)topologicalSortedItemsWithComparator:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REDependencyGraph count](self, "count"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F088B0]), "initWithOptions:capacity:", 512, -[REDependencyGraph count](self, "count"));
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F088B0]), "initWithOptions:capacity:", 512, -[REDependencyGraph count](self, "count"));
  if (v4)
  {
    id v8 = [(REDependencyGraph *)self allItems];
    id v9 = [v8 sortedArrayUsingComparator:v4];
  }
  else
  {
    id v9 = self->_nodes;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[REDependencyGraph _visitNode:visited:temporary:result:comparator:warn:](self, "_visitNode:visited:temporary:result:comparator:warn:", *(void *)(*((void *)&v17 + 1) + 8 * i), v6, v7, v5, v4, v4 == 0, (void)v17);
      }
      uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  uint64_t v15 = (void *)[v5 copy];
  return v15;
}

- (void)_visitNode:(id)a3 visited:(id)a4 temporary:(id)a5 result:(id)a6 comparator:(id)a7 warn:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (([v15 containsObject:v14] & 1) == 0)
  {
    if ([v16 containsObject:v14])
    {
      if (v8) {
        RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"A cycle was detected in the graph. Cannot run topoligcal sort", v19, v20, v21, v22, v23, v24, v27);
      }
    }
    else
    {
      [v16 addObject:v14];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __92__REDependencyGraph_REGraphExtensions___visitNode_visited_temporary_result_comparator_warn___block_invoke;
      uint64_t v30 = &unk_2644BC9E8;
      uint64_t v31 = self;
      id v25 = v15;
      id v32 = v25;
      id v33 = v16;
      id v26 = v17;
      id v34 = v26;
      id v35 = v18;
      BOOL v36 = v8;
      [(REDependencyGraph *)self _enumerateSortedFirstLevelDependenciesOfItem:v14 usingComparator:v35 withBlock:&v27];
      objc_msgSend(v25, "addObject:", v14, v27, v28, v29, v30, v31);
      [v26 insertObject:v14 atIndex:0];
    }
  }
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_nodes count];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v14 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_nodes;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateDependenciesOfItem:(id)a3 usingBlock:(id)a4
{
}

- (REDependencyGraph)initWithPointerFunctions:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)REDependencyGraph;
  id v4 = [(REDependencyGraph *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:a3 valueOptions:a3 capacity:0];
    nodes = v4->_nodes;
    v4->_nodes = (NSMapTable *)v5;
  }
  return v4;
}

- (id)topologicalSortedItems
{
  return [(REDependencyGraph *)self topologicalSortedItemsWithComparator:0];
}

- (REDependencyGraph)init
{
  return [(REDependencyGraph *)self initWithPointerFunctions:512];
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [+[REDependencyGraph allocWithZone:a3] init];
  uint64_t v22 = 0;
  uint64_t v23 = (id *)&v22;
  uint64_t v24 = 0x3042000000;
  id v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __34__REDependencyGraph_copyWithZone___block_invoke;
  v19[3] = &unk_2644BC998;
  uint64_t v5 = v4;
  uint64_t v20 = v5;
  uint64_t v21 = &v22;
  uint64_t v6 = (uint64_t (**)(void, void))MEMORY[0x223C31700](v19);
  objc_storeWeak(v23 + 5, v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_nodes;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        id v12 = (id)((uint64_t (**)(void, void *))v6)[2](v6, v11);
      }
      uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v8);
  }

  long long v13 = v5;
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v27);
  return v13;
}

id __34__REDependencyGraph_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = [v3 item];
  uint64_t v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    uint64_t v7 = [REDependencyGraphNode alloc];
    uint64_t v8 = [v3 item];
    uint64_t v9 = [(REDependencyGraphNode *)v7 initWithItem:v8];

    long long v10 = *(void **)(*(void *)(a1 + 32) + 8);
    long long v11 = [v3 item];
    [v10 setObject:v9 forKey:v11];
  }
  id v12 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v13 = [v3 item];
  char v14 = [v12 objectForKey:v13];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v15 = objc_msgSend(v3, "connections", 0);
  long long v16 = [v15 objectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40));
        uint64_t v23 = WeakRetained[2](WeakRetained, v21);

        uint64_t v24 = [v14 connections];
        char v25 = [v24 containsObject:v23];

        if ((v25 & 1) == 0)
        {
          id v26 = [v14 connections];
          [v26 addObject:v23];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  return v14;
}

- (void)removeItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = [(NSMapTable *)self->_nodes objectForKey:v4];
  if (v11)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = self->_nodes;
    uint64_t v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [(NSMapTable *)self->_nodes objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          uint64_t v18 = [v17 connections];
          [v18 removeObject:v11];
        }
        uint64_t v14 = [(NSMapTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [(NSMapTable *)self->_nodes removeObjectForKey:v4];
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Item %@ not in dependency graph %@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
}

- (BOOL)item:(id)a3 isDependencyOfItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMapTable *)self->_nodes objectForKey:v6];
  uint64_t v9 = [(NSMapTable *)self->_nodes objectForKey:v7];
  long long v16 = (void *)v9;
  if (!v8)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Item %@ not in dependency graph %@", v10, v11, v12, v13, v14, v15, (uint64_t)v6);
LABEL_6:
    char v18 = 0;
    goto LABEL_7;
  }
  if (!v9)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Item %@ not in dependency graph %@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    goto LABEL_6;
  }
  uint64_t v17 = [v8 connections];
  char v18 = [v17 containsObject:v16];

LABEL_7:
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (REDependencyGraph *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(REDependencyGraph *)self count];
      p_isa = (id *)&v5->super.isa;
      if (v6 == [(REDependencyGraph *)v5 count])
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        obj = self->_nodes;
        uint64_t v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v12 = [(NSMapTable *)self->_nodes objectForKey:v11];
              uint64_t v13 = [p_isa[1] objectForKey:v11];
              uint64_t v14 = v13;
              if (v12) {
                BOOL v15 = v13 == 0;
              }
              else {
                BOOL v15 = 1;
              }
              if (v15)
              {

LABEL_22:
                BOOL v19 = 0;
                goto LABEL_23;
              }
              long long v16 = [v12 connections];
              uint64_t v17 = [v14 connections];
              int v18 = [v16 isEqualToHashTable:v17];

              if (!v18) {
                goto LABEL_22;
              }
            }
            uint64_t v8 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
            BOOL v19 = 1;
            if (v8) {
              continue;
            }
            break;
          }
        }
        else
        {
          BOOL v19 = 1;
        }
LABEL_23:
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)REDependencyGraph;
  id v3 = [(REDependencyGraph *)&v7 description];
  id v4 = [(NSMapTable *)self->_nodes description];
  uint64_t v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (NSArray)allItems
{
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REDependencyGraph count](self, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__REDependencyGraph_REGraphExtensions__allItems__block_invoke;
  v7[3] = &unk_2644BC9C0;
  id v8 = v3;
  id v4 = v3;
  [(REDependencyGraph *)self enumerateObjectsUsingBlock:v7];
  uint64_t v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __48__REDependencyGraph_REGraphExtensions__allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end