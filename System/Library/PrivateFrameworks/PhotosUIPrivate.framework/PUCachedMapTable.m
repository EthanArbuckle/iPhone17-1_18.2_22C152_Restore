@interface PUCachedMapTable
- (NSMapTable)_mapTable;
- (NSMutableOrderedSet)_cachedObjects;
- (id)_cachedObjectsCreateIfNeeded:(BOOL)a3;
- (id)_mapTableCreateIfNeeded:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)_initialCapacity;
- (unint64_t)accurateCount;
- (unint64_t)cacheCountLimit;
- (void)_objectWasRecentlyUsed:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setCacheCountLimit:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PUCachedMapTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedObjects, 0);
  objc_storeStrong((id *)&self->__mapTable, 0);
}

- (NSMutableOrderedSet)_cachedObjects
{
  return self->__cachedObjects;
}

- (NSMapTable)_mapTable
{
  return self->__mapTable;
}

- (void)setCacheCountLimit:(unint64_t)a3
{
  self->_cacheCountLimit = a3;
}

- (unint64_t)cacheCountLimit
{
  return self->_cacheCountLimit;
}

- (void)_objectWasRecentlyUsed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [(PUCachedMapTable *)self _cachedObjectsCreateIfNeeded:1];
    id v6 = [v5 lastObject];

    if (v6 != v8)
    {
      if ([v5 containsObject:v8]) {
        [v5 removeObject:v8];
      }
      [v5 addObject:v8];
      unint64_t v7 = [(PUCachedMapTable *)self cacheCountLimit];
      if ([v5 count] > v7) {
        objc_msgSend(v5, "removeObjectsInRange:", 0, objc_msgSend(v5, "count") - v7);
      }
    }

    id v4 = v8;
  }
}

- (unint64_t)_initialCapacity
{
  unint64_t v2 = [(PUCachedMapTable *)self cacheCountLimit];
  if (2 * v2) {
    return 2 * v2;
  }
  else {
    return 64;
  }
}

- (id)_cachedObjectsCreateIfNeeded:(BOOL)a3
{
  cachedObjects = self->__cachedObjects;
  if (cachedObjects) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[PUCachedMapTable _initialCapacity](self, "_initialCapacity", a3));
    id v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = self->__cachedObjects;
    self->__cachedObjects = v6;

    cachedObjects = self->__cachedObjects;
  }
  return cachedObjects;
}

- (id)_mapTableCreateIfNeeded:(BOOL)a3
{
  mapTable = self->__mapTable;
  if (mapTable) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, -[PUCachedMapTable _initialCapacity](self, "_initialCapacity"));
    unint64_t v7 = self->__mapTable;
    self->__mapTable = v6;

    mapTable = self->__mapTable;
  }
  return mapTable;
}

- (id)keyEnumerator
{
  unint64_t v2 = [(PUCachedMapTable *)self _mapTableCreateIfNeeded:1];
  v3 = [v2 keyEnumerator];

  return v3;
}

- (void)removeAllObjects
{
  v3 = [(PUCachedMapTable *)self _mapTable];
  [v3 removeAllObjects];

  id v4 = [(PUCachedMapTable *)self _cachedObjects];
  [v4 removeAllObjects];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUCachedMapTable.m", 59, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  id v6 = [(PUCachedMapTable *)self _mapTable];
  unsigned __int8 v20 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v7 = [v6 keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      v13 = [v6 objectForKey:v12];
      if (v13) {
        v5[2](v5, v12, v13, &v20);
      }
      int v14 = v20;

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  unint64_t v7 = [(PUCachedMapTable *)self _mapTableCreateIfNeeded:1];
  [v7 setObject:v8 forKey:v6];

  [(PUCachedMapTable *)self _objectWasRecentlyUsed:v8];
}

- (void)removeObjectForKey:(id)a3
{
  id v8 = a3;
  id v4 = [(PUCachedMapTable *)self _mapTable];
  BOOL v5 = [v4 objectForKey:v8];

  if (v5)
  {
    id v6 = [(PUCachedMapTable *)self _cachedObjects];
    [v6 removeObject:v5];
  }
  unint64_t v7 = [(PUCachedMapTable *)self _mapTable];
  [v7 removeObjectForKey:v8];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUCachedMapTable *)self _mapTable];
  id v6 = [v5 objectForKey:v4];

  [(PUCachedMapTable *)self _objectWasRecentlyUsed:v6];
  return v6;
}

- (unint64_t)accurateCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v2 = [(PUCachedMapTable *)self _mapTable];
  v3 = [v2 keyEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        --v8;
      }
      while (v8);
      v6 += v5;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(PUCachedMapTable *)self _mapTable];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = (void *)v4[2];
    v4[2] = v6;

    uint64_t v8 = [(PUCachedMapTable *)self _cachedObjects];
    uint64_t v9 = [v8 mutableCopy];
    long long v10 = (void *)v4[3];
    v4[3] = v9;
  }
  return v4;
}

@end