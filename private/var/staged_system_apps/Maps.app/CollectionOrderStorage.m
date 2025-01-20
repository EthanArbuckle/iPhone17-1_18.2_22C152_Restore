@interface CollectionOrderStorage
- (CollectionOrderStorage)init;
- (id)orderCollections:(id)a3;
- (void)_loadOrder;
- (void)_saveOrder;
- (void)editCollection:(id)a3;
- (void)removeCollections:(id)a3;
@end

@implementation CollectionOrderStorage

- (CollectionOrderStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)CollectionOrderStorage;
  v2 = [(CollectionOrderStorage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CollectionOrderStorage *)v2 _loadOrder];
  }
  return v3;
}

- (void)_loadOrder
{
  v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"__internal_CollectionOrderStorage"];
  objc_super v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = +[NSMutableOrderedSet orderedSetWithArray:v7];

  orderedIdentifiers = self->_orderedIdentifiers;
  self->_orderedIdentifiers = v8;
}

- (id)orderCollections:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v27 = [v4 mutableCopy];
    v25 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    v23 = v5;
    id v6 = [v5 indexOfObjectPassingTest:&stru_1013196C8];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v6;
      v8 = [v27 objectAtIndexedSubscript:v6];
      [v27 removeObjectAtIndex:v7];
      [v25 addObject:v8];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obj = self->_orderedIdentifiers;
    id v9 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v13 = v27;
          id v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                v19 = [v18 identifier];
                unsigned int v20 = [v19 isEqualToString:v12];

                if (v20)
                {
                  [v25 addObject:v18];
                  [v13 removeObject:v18];
                  goto LABEL_19;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
        id v10 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    [v25 addObjectsFromArray:v27];
    id v21 = [v25 copy];

    objc_super v5 = v23;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
}

- (void)_saveOrder
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [(NSMutableOrderedSet *)self->_orderedIdentifiers array];
  [v4 setObject:v3 forKey:@"__internal_CollectionOrderStorage"];
}

- (void)removeCollections:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        orderedIdentifiers = self->_orderedIdentifiers;
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) identifier];
        v11 = [v10 UUIDString];
        [(NSMutableOrderedSet *)orderedIdentifiers removeObject:v11];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)editCollection:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  id v5 = [v4 UUIDString];

  if (v5)
  {
    if (([v5 isEqualToString:@"__internal_CollectionSavedLinesIdentifier"] & 1) == 0
      && ([v5 isEqualToString:@"__internal_CollectionSavedPlacesIdentifier"] & 1) == 0)
    {
      unsigned int v6 = [v8 isLegacyFavoritesCollection];
      orderedIdentifiers = self->_orderedIdentifiers;
      if (v6)
      {
        [(NSMutableOrderedSet *)orderedIdentifiers addObject:v5];
      }
      else
      {
        [(NSMutableOrderedSet *)orderedIdentifiers removeObject:v5];
        [(NSMutableOrderedSet *)self->_orderedIdentifiers insertObject:v5 atIndex:0];
      }
    }
    [(CollectionOrderStorage *)self _saveOrder];
  }
}

@end