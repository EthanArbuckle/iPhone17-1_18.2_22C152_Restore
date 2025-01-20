@interface SUUILoadMoreDataConsumer
- (NSSet)unavailableItemIdentifiers;
- (id)_itemsWithDictionary:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (void)setUnavailableItemIdentifiers:(id)a3;
@end

@implementation SUUILoadMoreDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v11 = 0;
  v7 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v11];
  id v8 = v11;
  objc_opt_class();
  v9 = 0;
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SUUILoadMoreDataConsumer *)self _itemsWithDictionary:v7];
  }
  if (a5 && !v9) {
    *a5 = v8;
  }

  return v9;
}

- (id)_itemsWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [v4 objectForKey:@"charts"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
  {
    v7 = [v6 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 objectForKey:@"contentIds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = v7;
        id v22 = v4;
        v9 = [v4 objectForKey:@"storePlatformData"];
        uint64_t v10 = objc_opt_class();
        id v11 = SUUIStorePageItemsWithStorePlatformDictionary(v9, 0, v10);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v20 = v8;
        id v12 = v8;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ![(NSSet *)self->_unavailableItemIdentifiers containsObject:v17])
              {
                v18 = [v11 objectForKey:v17];
                if (v18) {
                  [v5 addObject:v18];
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        id v4 = v22;
        id v8 = v20;
        v7 = v21;
      }
    }
  }

  return v5;
}

- (NSSet)unavailableItemIdentifiers
{
  return self->_unavailableItemIdentifiers;
}

- (void)setUnavailableItemIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end