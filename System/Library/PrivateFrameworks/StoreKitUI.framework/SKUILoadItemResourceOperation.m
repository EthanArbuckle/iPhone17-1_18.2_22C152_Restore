@interface SKUILoadItemResourceOperation
- (SKUILoadItemResourceOperation)initWithResourceRequest:(id)a3;
- (SSVPlatformRequestOperation)underlyingOperation;
- (void)cancel;
- (void)main;
- (void)setUnderlyingOperation:(id)a3;
@end

@implementation SKUILoadItemResourceOperation

- (SKUILoadItemResourceOperation)initWithResourceRequest:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadItemResourceOperation initWithResourceRequest:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadItemResourceOperation;
  v5 = [(SKUILoadResourceOperation *)&v7 initWithResourceRequest:v4];

  return v5;
}

- (void)main
{
  v3 = [(SKUILoadResourceOperation *)self clientContext];
  id v4 = objc_alloc(MEMORY[0x1E4FA8350]);
  v5 = [v3 platformContext];
  v6 = (void *)[v4 initWithPlatformContext:v5];

  objc_super v7 = [(SKUILoadResourceOperation *)self resourceRequest];
  v8 = [v7 imageProfile];
  [v6 setImageProfile:v8];

  v9 = [v7 keyProfile];
  [v6 setKeyProfile:v9];

  v10 = [v3 valueForConfigurationKey:@"sfsuffix"];
  [v6 setStoreFrontSuffix:v10];

  v11 = [v7 itemIdentifiers];
  [v6 setItemIdentifiers:v11];
  v12 = [(SKUILoadResourceOperation *)self outputBlock];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __37__SKUILoadItemResourceOperation_main__block_invoke;
  v18 = &unk_1E6428218;
  id v19 = v11;
  id v20 = v12;
  id v13 = v11;
  id v14 = v12;
  [v6 setResponseBlock:&v15];
  -[SKUILoadItemResourceOperation setUnderlyingOperation:](self, "setUnderlyingOperation:", v6, v15, v16, v17, v18);
  [v6 main];
}

void __37__SKUILoadItemResourceOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    objc_super v7 = objc_alloc_init(SKUILoadItemsResponse);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 32)];
    v9 = [v5 allItems];
    if ([v9 count])
    {
      uint64_t v22 = a1;
      id v23 = v6;
      id v24 = v5;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v21 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v17 = [SKUIItem alloc];
            v18 = [v16 lookupDictionary];
            id v19 = [(SKUIItem *)v17 initWithLookupDictionary:v18];

            if (v19)
            {
              id v20 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[SKUIItem itemIdentifier](v19, "itemIdentifier"));
              [v10 setObject:v19 forKey:v20];
              [v8 removeObject:v20];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }

      id v6 = v23;
      id v5 = v24;
      a1 = v22;
      v9 = v21;
    }
    else
    {
      id v10 = 0;
    }
    [(SKUILoadItemsResponse *)v7 setInvalidItemIdentifiers:v8];
    [(SKUILoadItemsResponse *)v7 setLoadedItems:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)SKUILoadItemResourceOperation;
  [(SKUILoadResourceOperation *)&v4 cancel];
  v3 = [(SKUILoadItemResourceOperation *)self underlyingOperation];
  [v3 cancel];
}

- (SSVPlatformRequestOperation)underlyingOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingOperation);

  return (SSVPlatformRequestOperation *)WeakRetained;
}

- (void)setUnderlyingOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithResourceRequest:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadItemResourceOperation initWithResourceRequest:]";
}

@end