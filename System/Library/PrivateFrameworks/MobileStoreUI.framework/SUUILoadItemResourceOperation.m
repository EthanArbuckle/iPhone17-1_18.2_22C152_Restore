@interface SUUILoadItemResourceOperation
- (SSVPlatformRequestOperation)underlyingOperation;
- (SUUILoadItemResourceOperation)initWithResourceRequest:(id)a3;
- (void)cancel;
- (void)main;
- (void)setUnderlyingOperation:(id)a3;
@end

@implementation SUUILoadItemResourceOperation

- (SUUILoadItemResourceOperation)initWithResourceRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadItemResourceOperation;
  return [(SUUILoadResourceOperation *)&v4 initWithResourceRequest:a3];
}

- (void)main
{
  v3 = [(SUUILoadResourceOperation *)self clientContext];
  id v4 = objc_alloc(MEMORY[0x263F7B3B8]);
  v5 = [v3 platformContext];
  v6 = (void *)[v4 initWithPlatformContext:v5];

  v7 = [(SUUILoadResourceOperation *)self resourceRequest];
  v8 = [v7 imageProfile];
  [v6 setImageProfile:v8];

  v9 = [v7 keyProfile];
  [v6 setKeyProfile:v9];

  v10 = [v3 valueForConfigurationKey:@"sfsuffix"];
  [v6 setStoreFrontSuffix:v10];

  v11 = [v7 itemIdentifiers];
  [v6 setItemIdentifiers:v11];
  v12 = [(SUUILoadResourceOperation *)self outputBlock];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __37__SUUILoadItemResourceOperation_main__block_invoke;
  v18 = &unk_265404110;
  id v19 = v11;
  id v20 = v12;
  id v13 = v11;
  id v14 = v12;
  [v6 setResponseBlock:&v15];
  -[SUUILoadItemResourceOperation setUnderlyingOperation:](self, "setUnderlyingOperation:", v6, v15, v16, v17, v18);
  [v6 main];
}

void __37__SUUILoadItemResourceOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    v7 = objc_alloc_init(SUUILoadItemsResponse);
    v8 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:*(void *)(a1 + 32)];
    v9 = [v5 allItems];
    if ([v9 count])
    {
      uint64_t v22 = a1;
      id v23 = v6;
      id v24 = v5;
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
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
            v17 = [SUUIItem alloc];
            v18 = [v16 lookupDictionary];
            id v19 = [(SUUIItem *)v17 initWithLookupDictionary:v18];

            if (v19)
            {
              id v20 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[SUUIItem itemIdentifier](v19, "itemIdentifier"));
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
    [(SUUILoadItemsResponse *)v7 setInvalidItemIdentifiers:v8];
    [(SUUILoadItemsResponse *)v7 setLoadedItems:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILoadItemResourceOperation;
  [(SUUILoadResourceOperation *)&v4 cancel];
  v3 = [(SUUILoadItemResourceOperation *)self underlyingOperation];
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

@end