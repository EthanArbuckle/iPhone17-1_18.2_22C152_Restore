@interface MTIDCompositeSecretStore
- (MTIDCompositeSecretStore)init;
- (NSMutableDictionary)stores;
- (id)debugInfo;
- (id)maintainSchemes:(id)a3 options:(id)a4;
- (id)resetSchemes:(id)a3 options:(id)a4;
- (id)schemesGroupedByStore:(id)a3;
- (id)secretForScheme:(id)a3 options:(id)a4;
- (id)secretStoreForScheme:(id)a3;
- (id)storeKeyForScheme:(id)a3;
- (id)syncForSchemes:(id)a3 options:(id)a4;
- (void)clearLocalData;
- (void)setStores:(id)a3;
@end

@implementation MTIDCompositeSecretStore

- (MTIDCompositeSecretStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTIDCompositeSecretStore;
  v2 = [(MTIDCompositeSecretStore *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
    [(MTIDCompositeSecretStore *)v2 setStores:v3];
  }
  return v2;
}

- (id)storeKeyForScheme:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 idType];
  objc_super v5 = @"Local";
  if (v4 == 2) {
    objc_super v5 = @"Cloud";
  }
  v6 = NSString;
  v7 = v5;
  v8 = [v3 containerIdentifier];

  v9 = [v6 stringWithFormat:@"%@-%@", v7, v8];

  return v9;
}

- (id)secretStoreForScheme:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = [(MTIDCompositeSecretStore *)v5 storeKeyForScheme:v4];
  v7 = [(MTIDCompositeSecretStore *)v5 stores];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = [MTIDCloudKitStore alloc];
    v11 = [v4 containerIdentifier];
    v9 = -[MTIDCloudKitStore initWithContainerIdentifer:enableSync:](v10, "initWithContainerIdentifer:enableSync:", v11, [v4 idType] == 2);

    v12 = [(MTIDCompositeSecretStore *)v5 stores];
    [v12 setObject:v9 forKeyedSubscript:v6];
  }
  objc_sync_exit(v5);

  return v9;
}

- (id)schemesGroupedByStore:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = -[MTIDCompositeSecretStore storeKeyForScheme:](self, "storeKeyForScheme:", v11, (void)v18);
        v13 = [v5 objectForKeyedSubscript:v12];
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        [v16 addObject:v11];
        [v5 setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MTIDCompositeSecretStore *)self secretStoreForScheme:v7];
  uint64_t v9 = [v8 secretForScheme:v7 options:v6];

  return v9;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v21 = v6;
  uint64_t v9 = [(MTIDCompositeSecretStore *)self schemesGroupedByStore:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        id v15 = [v14 firstObject];
        v16 = [(MTIDCompositeSecretStore *)self secretStoreForScheme:v15];

        v17 = [v16 resetSchemes:v14 options:v7];
        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  if ([v8 count])
  {
    long long v18 = +[MTPromise promiseWithAll:v8];
    long long v19 = [v18 thenWithBlock:&__block_literal_global_17];
  }
  else
  {
    long long v19 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
  }

  return v19;
}

MTPromise *__49__MTIDCompositeSecretStore_resetSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v21 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v20 = v6;
  uint64_t v8 = [(MTIDCompositeSecretStore *)self schemesGroupedByStore:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        v14 = [v13 firstObject];
        id v15 = [(MTIDCompositeSecretStore *)self secretStoreForScheme:v14];

        if (objc_opt_respondsToSelector())
        {
          v16 = [v15 maintainSchemes:v13 options:v21];
          [v7 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  if ([v7 count])
  {
    v17 = +[MTPromise promiseWithAll:v7];
    long long v18 = [v17 thenWithBlock:&__block_literal_global_15];
  }
  else
  {
    long long v18 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
  }

  return v18;
}

MTPromise *__52__MTIDCompositeSecretStore_maintainSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
}

- (void)clearLocalData
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTIDCompositeSecretStore *)v2 stores];
  id v4 = (id)[v3 copy];

  objc_sync_exit(v2);
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_18];
}

uint64_t __42__MTIDCompositeSecretStore_clearLocalData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clearLocalData];
}

- (id)debugInfo
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTIDCompositeSecretStore *)v2 stores];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __37__MTIDCompositeSecretStore_debugInfo__block_invoke;
  uint64_t v12 = &unk_264310BF8;
  id v13 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  v14 = @"subStores";
  v15[0] = v6;
  id v7 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);

  return v7;
}

void __37__MTIDCompositeSecretStore_debugInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(void **)(a1 + 32);
    objc_super v5 = [v6 debugInfo];
    [v4 addObject:v5];
  }
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  id v21 = v6;
  uint64_t v9 = [(MTIDCompositeSecretStore *)self schemesGroupedByStore:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        id v15 = [v14 firstObject];
        v16 = [(MTIDCompositeSecretStore *)self secretStoreForScheme:v15];

        v17 = [v16 syncForSchemes:v14 options:v7];
        if (v17) {
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  if ([v8 count])
  {
    long long v18 = +[MTPromise promiseWithAll:v8];
    long long v19 = [v18 thenWithBlock:&__block_literal_global_27];
  }
  else
  {
    long long v19 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA80]];
  }

  return v19;
}

MTPromise *__51__MTIDCompositeSecretStore_syncForSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
}

- (NSMutableDictionary)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (void).cxx_destruct
{
}

@end