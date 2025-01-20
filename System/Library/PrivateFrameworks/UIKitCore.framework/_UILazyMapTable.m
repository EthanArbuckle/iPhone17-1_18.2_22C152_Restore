@interface _UILazyMapTable
- (BOOL)hasCachedObjectForKey:(id)a3;
- (_UILazyMapTable)initWithMappingBlock:(id)a3;
- (id)cachedObjectEnumerable;
- (id)cachedObjects;
- (id)description;
- (id)keyEnumerable;
- (id)keys;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)registerClient:(id)a3 ofObjectForKey:(id)a4;
- (void)unregisterClient:(id)a3 ofObjectForKey:(id)a4;
@end

@implementation _UILazyMapTable

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_keysToValues objectForKey:v4];
  if (!v5)
  {
    v5 = (*((void (**)(void))self->_mappingBlock + 2))();
    v6 = [(NSMapTable *)self->_keysToClientTables objectForKey:v4];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      [(NSMapTable *)self->_keysToValues setObject:v5 forKey:v4];
      [(NSMapTable *)self->_valuesToKeys setObject:v4 forKey:v5];
    }
  }

  return v5;
}

- (void)unregisterClient:(id)a3 ofObjectForKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_keysToClientTables objectForKey:v6];
  v8 = v7;
  if (v7)
  {
    [v7 removeObject:v10];
    if (![v8 count])
    {
      [(NSMapTable *)self->_keysToClientTables removeObjectForKey:v6];
      v9 = [(NSMapTable *)self->_keysToValues objectForKey:v6];
      [(NSMapTable *)self->_keysToValues removeObjectForKey:v6];
      [(NSMapTable *)self->_valuesToKeys removeObjectForKey:v9];
    }
  }
}

- (void)registerClient:(id)a3 ofObjectForKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_keysToClientTables objectForKey:v6];
  if (!v7)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:1];
    [(NSMapTable *)self->_keysToClientTables setObject:v7 forKey:v6];
  }
  [v7 addObject:v8];
}

- (BOOL)hasCachedObjectForKey:(id)a3
{
  v3 = [(NSMapTable *)self->_keysToValues objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)cachedObjectEnumerable
{
  return self->_valuesToKeys;
}

- (_UILazyMapTable)initWithMappingBlock:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UILazyMapTable;
  v5 = [(_UILazyMapTable *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id mappingBlock = v5->_mappingBlock;
    v5->_id mappingBlock = (id)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    keysToClientTables = v5->_keysToClientTables;
    v5->_keysToClientTables = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    keysToValues = v5->_keysToValues;
    v5->_keysToValues = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    valuesToKeys = v5->_valuesToKeys;
    v5->_valuesToKeys = (NSMapTable *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p cachedValues=%@, clients=%@>", v5, self, self->_keysToValues, self->_keysToClientTables];

  return v6;
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_keysToValues count];
}

- (id)keys
{
  return NSAllMapTableKeys(self->_keysToValues);
}

- (id)cachedObjects
{
  return NSAllMapTableKeys(self->_valuesToKeys);
}

- (id)keyEnumerable
{
  return self->_keysToValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesToKeys, 0);
  objc_storeStrong((id *)&self->_keysToValues, 0);
  objc_storeStrong((id *)&self->_keysToClientTables, 0);
  objc_storeStrong(&self->_mappingBlock, 0);
}

@end