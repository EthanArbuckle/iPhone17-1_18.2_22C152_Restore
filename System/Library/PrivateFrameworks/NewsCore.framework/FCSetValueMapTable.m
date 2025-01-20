@interface FCSetValueMapTable
- (FCMapTable)backingMapTable;
- (FCSetValueMapTable)init;
- (id)_setForKey:(id)a3;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsForKey:(id)a3;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)addObjects:(id)a3 forKey:(id)a4;
- (void)removeObject:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
- (void)setBackingMapTable:(id)a3;
@end

@implementation FCSetValueMapTable

- (id)description
{
  v2 = [(FCSetValueMapTable *)self backingMapTable];
  v3 = [v2 description];

  return v3;
}

- (FCSetValueMapTable)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCSetValueMapTable;
  v2 = [(FCSetValueMapTable *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[FCMapTable mapTableWithKeyOptions:0 valueOptions:0];
    backingMapTable = v2->_backingMapTable;
    v2->_backingMapTable = (FCMapTable *)v3;
  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [+[FCSetValueMapTable allocWithZone:](FCSetValueMapTable, "allocWithZone:") init];
  objc_super v6 = [(FCSetValueMapTable *)self backingMapTable];
  v18 = v5;
  v7 = [(FCSetValueMapTable *)v5 backingMapTable];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [(FCSetValueMapTable *)self backingMapTable];
  v9 = [v8 keyEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v15 = [v6 objectForKey:v14];
        v16 = (void *)[v15 copyWithZone:a3];
        [v7 setObject:v16 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v18;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(FCSetValueMapTable *)self _setForKey:a4];
  [v7 addObject:v6];
}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(FCSetValueMapTable *)self _setForKey:a4];
  [v7 removeObject:v6];
}

- (void)addObjects:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [(FCSetValueMapTable *)self _setForKey:a4];
  [v7 unionSet:v6];
}

- (id)objectsForKey:(id)a3
{
  id v4 = a3;
  v5 = [(FCSetValueMapTable *)self backingMapTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeObjectsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSetValueMapTable *)self backingMapTable];
  [v5 removeObjectForKey:v4];
}

- (id)keyEnumerator
{
  v2 = [(FCSetValueMapTable *)self backingMapTable];
  uint64_t v3 = [v2 keyEnumerator];

  return v3;
}

- (id)objectEnumerator
{
  v2 = [(FCSetValueMapTable *)self backingMapTable];
  uint64_t v3 = [v2 objectEnumerator];

  return v3;
}

- (id)_setForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSetValueMapTable *)self backingMapTable];
  id v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [v5 setObject:v6 forKey:v4];
  }

  return v6;
}

- (FCMapTable)backingMapTable
{
  return self->_backingMapTable;
}

- (void)setBackingMapTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end