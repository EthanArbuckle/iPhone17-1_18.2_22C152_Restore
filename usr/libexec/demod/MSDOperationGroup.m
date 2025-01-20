@interface MSDOperationGroup
- (BOOL)isLeaf;
- (BOOL)isRoot;
- (MSDOperationGroup)init;
- (MSDOperationGroup)initWithOperationGroups:(id)a3;
- (MSDOperationGroup)initWithOperations:(id)a3;
- (NSMutableSet)allOperations;
- (NSMutableSet)leafOperations;
- (NSMutableSet)rootOperations;
- (void)_addOperationGroups:(id)a3;
- (void)_addOperations:(id)a3;
- (void)addDependency:(id)a3;
- (void)setAllOperations:(id)a3;
- (void)setIsLeaf:(BOOL)a3;
- (void)setIsRoot:(BOOL)a3;
- (void)setLeafOperations:(id)a3;
- (void)setRootOperations:(id)a3;
@end

@implementation MSDOperationGroup

- (MSDOperationGroup)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDOperationGroup;
  v2 = [(MSDOperationGroup *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    rootOperations = v2->_rootOperations;
    v2->_rootOperations = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    leafOperations = v2->_leafOperations;
    v2->_leafOperations = v5;

    id v7 = objc_alloc_init((Class)NSMutableSet);
    [(MSDOperationGroup *)v2 setAllOperations:v7];

    [(MSDOperationGroup *)v2 setIsRoot:1];
    [(MSDOperationGroup *)v2 setIsLeaf:1];
    v8 = v2;
  }

  return v2;
}

- (MSDOperationGroup)initWithOperations:(id)a3
{
  id v4 = a3;
  v5 = [(MSDOperationGroup *)self init];
  v6 = v5;
  if (v5)
  {
    [(MSDOperationGroup *)v5 _addOperations:v4];
    id v7 = v6;
  }

  return v6;
}

- (MSDOperationGroup)initWithOperationGroups:(id)a3
{
  id v4 = a3;
  v5 = [(MSDOperationGroup *)self init];
  v6 = v5;
  if (v5)
  {
    [(MSDOperationGroup *)v5 _addOperationGroups:v4];
    id v7 = v6;
  }

  return v6;
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  [v4 setIsLeaf:0];
  [(MSDOperationGroup *)self setIsRoot:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = v4;
  v5 = [v4 leafOperations];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v9);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v11 = [(MSDOperationGroup *)self rootOperations];
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) addDependency:v10];
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)_addOperations:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isRoot])
        {
          uint64_t v10 = [(MSDOperationGroup *)self rootOperations];
          [v10 addObject:v9];
        }
        if ([v9 isLeaf])
        {
          v11 = [(MSDOperationGroup *)self leafOperations];
          [v11 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  id v12 = [(MSDOperationGroup *)self allOperations];
  [v12 addObjectsFromArray:v4];
}

- (void)_addOperationGroups:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 isRoot])
        {
          uint64_t v10 = [(MSDOperationGroup *)self rootOperations];
          v11 = [v9 rootOperations];
          [v10 unionSet:v11];
        }
        if ([v9 isLeaf])
        {
          id v12 = [(MSDOperationGroup *)self leafOperations];
          long long v13 = [v9 leafOperations];
          [v12 unionSet:v13];
        }
        long long v14 = [(MSDOperationGroup *)self allOperations];
        long long v15 = [v9 operations];
        [v14 unionSet:v15];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (NSMutableSet)rootOperations
{
  return self->_rootOperations;
}

- (void)setRootOperations:(id)a3
{
}

- (NSMutableSet)leafOperations
{
  return self->_leafOperations;
}

- (void)setLeafOperations:(id)a3
{
}

- (NSMutableSet)allOperations
{
  return self->_allOperations;
}

- (void)setAllOperations:(id)a3
{
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (BOOL)isLeaf
{
  return self->_isLeaf;
}

- (void)setIsLeaf:(BOOL)a3
{
  self->_isLeaf = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperations, 0);
  objc_storeStrong((id *)&self->_leafOperations, 0);

  objc_storeStrong((id *)&self->_rootOperations, 0);
}

@end