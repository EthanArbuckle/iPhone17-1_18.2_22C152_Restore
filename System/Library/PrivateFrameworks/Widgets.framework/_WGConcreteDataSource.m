@interface _WGConcreteDataSource
- (NSArray)data;
- (NSArray)dataIdentifiers;
- (_WGConcreteDataSource)init;
- (id)datumWithIdentifier:(id)a3;
- (void)addObserver:(id)a3 completion:(id)a4;
- (void)dataSource:(id)a3 removeDatumWithIdentifier:(id)a4 observerUpdateBlock:(id)a5;
- (void)dataSource:(id)a3 replaceWithDatum:(id)a4 observerUpdateBlock:(id)a5;
- (void)removeObserver:(id)a3 completion:(id)a4;
@end

@implementation _WGConcreteDataSource

- (_WGConcreteDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)_WGConcreteDataSource;
  v2 = [(_WGConcreteDataSource *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    identifiersToData = v2->_identifiersToData;
    v2->_identifiersToData = v5;
  }
  return v2;
}

- (void)addObserver:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(void))a4;
  if (v7) {
    [(NSMutableArray *)self->_observers addObject:v7];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)removeObserver:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(void))a4;
  if (v7) {
    [(NSMutableArray *)self->_observers removeObject:v7];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)dataSource:(id)a3 replaceWithDatum:(id)a4 observerUpdateBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = (void (**)(void, void, void))v8;
  if (v7 && v8)
  {
    identifiersToData = self->_identifiersToData;
    v11 = [v7 datumIdentifier];
    [(NSMutableDictionary *)identifiersToData setObject:v7 forKey:v11];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = self->_observers;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          ((void (**)(void, void, id))v9)[2](v9, *(void *)(*((void *)&v17 + 1) + 8 * v16++), v7);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (void)dataSource:(id)a3 removeDatumWithIdentifier:(id)a4 observerUpdateBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  uint64_t v9 = [v7 length];
  if (v8 && v9)
  {
    v10 = [(NSMutableDictionary *)self->_identifiersToData objectForKey:v7];
    if (v10)
    {
      [(NSMutableDictionary *)self->_identifiersToData removeObjectForKey:v7];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v11 = self->_observers;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            v8[2](v8, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v10);
          }
          while (v13 != v15);
          uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (NSArray)dataIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_identifiersToData allKeys];
}

- (NSArray)data
{
  return (NSArray *)[(NSMutableDictionary *)self->_identifiersToData allValues];
}

- (id)datumWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_identifiersToData objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToData, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end