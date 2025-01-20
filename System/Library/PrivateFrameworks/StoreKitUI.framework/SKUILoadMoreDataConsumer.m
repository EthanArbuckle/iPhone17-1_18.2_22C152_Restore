@interface SKUILoadMoreDataConsumer
- (NSSet)unavailableItemIdentifiers;
- (id)_itemsWithDictionary:(id)a3;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
- (void)setUnavailableItemIdentifiers:(id)a3;
@end

@implementation SKUILoadMoreDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadMoreDataConsumer objectForData:response:error:]();
  }
  id v12 = 0;
  v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v12];
  id v9 = v12;
  objc_opt_class();
  v10 = 0;
  if (objc_opt_isKindOfClass())
  {
    v10 = [(SKUILoadMoreDataConsumer *)self _itemsWithDictionary:v8];
  }
  if (a5 && !v10) {
    *a5 = v9;
  }

  return v10;
}

- (id)_itemsWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadMoreDataConsumer _itemsWithDictionary:]();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [v4 objectForKey:@"charts"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
  {
    id v7 = [v6 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v7 objectForKey:@"contentIds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = v7;
        id v22 = v4;
        id v9 = [v4 objectForKey:@"storePlatformData"];
        uint64_t v10 = objc_opt_class();
        v11 = SKUIStorePageItemsWithStorePlatformDictionary(v9, 0, v10);
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
        v8 = v20;
        id v7 = v21;
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

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadMoreDataConsumer objectForData:response:error:]";
}

- (void)_itemsWithDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadMoreDataConsumer _itemsWithDictionary:]";
}

@end