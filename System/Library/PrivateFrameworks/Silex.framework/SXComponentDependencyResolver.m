@interface SXComponentDependencyResolver
- (id)componentNodeForComponentIdentifier:(uint64_t)a3 andAttribute:;
- (id)componentNodesDependentOnComponentNode:(uint64_t)a1;
- (id)createComponentNodesForComponentIdentifiers:(void *)a1;
- (id)debugDescription;
- (id)solvableOrder;
- (id)solvedOrderForComponentNodes:(uint64_t)a1;
- (void)addComponentNode:(uint64_t)a1;
- (void)addDependency:(uint64_t)a1;
- (void)initWithComponentIdentifiers:(void *)a1;
- (void)resolveStack:(void *)a3 withSolvedNodes:;
@end

@implementation SXComponentDependencyResolver

- (void)initWithComponentIdentifiers:(void *)a1
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)SXComponentDependencyResolver;
    a1 = objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      uint64_t v4 = [MEMORY[0x263EFF980] array];
      v5 = (void *)a1[2];
      a1[2] = v4;

      v22[0] = &unk_26D593DE8;
      v6 = [MEMORY[0x263EFF9A0] dictionary];
      v22[1] = &unk_26D593E00;
      v23[0] = v6;
      v7 = [MEMORY[0x263EFF9A0] dictionary];
      v23[1] = v7;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      v9 = (void *)a1[3];
      a1[3] = v8;

      v10 = -[SXComponentDependencyResolver createComponentNodesForComponentIdentifiers:](a1, v3);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            -[SXComponentDependencyResolver addComponentNode:]((uint64_t)a1, *(void **)(*((void *)&v16 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }

  return a1;
}

- (id)createComponentNodesForComponentIdentifiers:(void *)a1
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    a1 = [MEMORY[0x263EFF980] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = -[SXComponentNode initWithComponentIdentifier:andAttribute:]([SXComponentNode alloc], v9, 1);
          objc_msgSend(a1, "addObject:", v10, (void)v13);
          uint64_t v11 = -[SXComponentNode initWithComponentIdentifier:andAttribute:]([SXComponentNode alloc], v9, 2);
          [a1 addObject:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return a1;
}

- (void)addComponentNode:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 24);
    id v4 = NSNumber;
    uint64_t v5 = a2[2];
    uint64_t v6 = a2;
    uint64_t v7 = [v4 numberWithInteger:v5];
    id v9 = [v3 objectForKey:v7];

    uint64_t v8 = -[SXFullscreenCaption text]((uint64_t)v6);
    [v9 setObject:v6 forKey:v8];

    [*(id *)(a1 + 16) addObject:v6];
  }
}

- (void)addDependency:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
    id v4 = a2;

    -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](a1, *((void **)v4 + 1), *((void *)v4 + 3));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponentNode addComponentDependency:]((uint64_t)v5, v4);
  }
}

- (id)componentNodeForComponentIdentifier:(uint64_t)a3 andAttribute:
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v5 = NSNumber;
    id v6 = a2;
    uint64_t v7 = [v5 numberWithInteger:a3];
    uint64_t v8 = [v4 objectForKey:v7];

    id v9 = [v8 objectForKey:v6];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)solvableOrder
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1;
    if (!a1[1])
    {
      id v3 = a1[2];
      uint64_t v4 = -[SXComponentDependencyResolver solvedOrderForComponentNodes:](v2, v3);
      id v5 = *(void **)(v2 + 8);
      *(void *)(v2 + 8) = v4;
    }
    id v6 = *(void **)(v2 + 8);
    if (!v6) {
      id v6 = (void *)MEMORY[0x263EFFA68];
    }
    a1 = v6;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)solvedOrderForComponentNodes:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    id v5 = [MEMORY[0x263EFF980] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          -[SXComponentDependencyResolver resolveStack:withSolvedNodes:](a1, v4, v5);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)componentNodesDependentOnComponentNode:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 16);
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
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (-[SXComponentNode hasDependencyToComponentIdentifier:attribute:](v10, *((void **)v3 + 1), *((void *)v3 + 2)))objc_msgSend(v4, "addObject:", v10, (void)v12); {
        }
          }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)resolveStack:(void *)a3 withSolvedNodes:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1 && [v5 count])
  {
    long long v16 = v5;
    do
    {
      objc_msgSend(v5, "lastObject", v16);
      uint64_t v7 = (id *)objc_claimAutoreleasedReturnValue();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = -[SXComponentNode dependencies](v7);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v17 = v7;
        uint64_t v10 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v8);
            }
            long long v12 = -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](a1, *(void **)(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16), *(void *)(*(void *)(*((void *)&v18 + 1) + 8 * i) + 32));
            if ([v6 indexOfObjectIdenticalTo:v12] == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v5 = v16;
              LOBYTE(v9) = [v16 containsObject:v12];
              if ((v9 & 1) == 0) {
                [v16 addObject:v12];
              }

              goto LABEL_16;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            continue;
          }
          break;
        }
        id v5 = v16;
LABEL_16:
        uint64_t v7 = v17;
      }

      long long v13 = [v5 lastObject];

      if (v7 == v13)
      {
        [v5 removeLastObject];
        if ([v6 indexOfObjectIdenticalTo:v7] == 0x7FFFFFFFFFFFFFFFLL) {
          [v6 addObject:v7];
        }
      }

      uint64_t v14 = [v5 count];
      char v15 = v9 ^ 1;
      if (!v14) {
        char v15 = 0;
      }
    }
    while ((v15 & 1) != 0);
  }
}

- (id)debugDescription
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"\n----------- Dependency Graph -----------\n\n"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (self) {
    componentNodes = self->_componentNodes;
  }
  else {
    componentNodes = 0;
  }
  obuint64_t j = componentNodes;
  uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id **)(*((void *)&v31 + 1) + 8 * i);
        if (-[SXFullscreenCaption caption]((uint64_t)v6) == 2) {
          uint64_t v7 = @"size";
        }
        else {
          uint64_t v7 = @"position";
        }
        uint64_t v8 = v7;
        uint64_t v9 = -[SXFullscreenCaption text]((uint64_t)v6);
        [v3 appendFormat:@"The %@ of %@ depends on:\n", v8, v9];

        uint64_t v10 = -[SXComponentNode dependencies](v6);
        uint64_t v11 = [v10 count];

        if (v11)
        {
          v25 = v8;
          uint64_t v26 = i;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v12 = -[SXComponentNode dependencies](v6);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                if (-[SXAnimatedImageFrame index](v17) == 2) {
                  long long v18 = @"size";
                }
                else {
                  long long v18 = @"position";
                }
                long long v19 = v18;
                long long v20 = -[SXFullscreenCaption caption](v17);
                [v3 appendFormat:@" - the %@ of component %@\n", v19, v20];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }

          uint64_t v8 = v25;
          uint64_t i = v26;
        }
        else
        {
          [v3 appendString:@" - none\n"];
        }
        [v3 appendString:@"\n"];
      }
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  [v3 appendString:@"\n----------- End of Dependency Graph -----------"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedComponentNodes, 0);
  objc_storeStrong((id *)&self->_componentNodes, 0);
  objc_storeStrong((id *)&self->_solvedComponentNodes, 0);
}

@end