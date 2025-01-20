@interface SKUILoadSortDataOperation
- (SKUILoadSortDataOperation)initWithResourceRequest:(id)a3;
- (SSVLoadURLOperation)underlyingOperation;
- (void)cancel;
- (void)main;
- (void)setUnderlyingOperation:(id)a3;
@end

@implementation SKUILoadSortDataOperation

- (SKUILoadSortDataOperation)initWithResourceRequest:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadSortDataOperation initWithResourceRequest:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadSortDataOperation;
  v5 = [(SKUILoadResourceOperation *)&v7 initWithResourceRequest:v4];

  return v5;
}

- (void)main
{
  id v3 = objc_alloc(MEMORY[0x1E4FA8338]);
  id v4 = [(SKUILoadResourceOperation *)self resourceRequest];
  v5 = [v4 sortURL];
  v6 = (void *)[v3 initWithURL:v5];

  objc_super v7 = [MEMORY[0x1E4FA8388] consumer];
  [v6 setDataConsumer:v7];

  v8 = [(SKUILoadResourceOperation *)self clientContext];
  v9 = [v8 valueForConfigurationKey:@"sfsuffix"];
  [v6 setStoreFrontSuffix:v9];

  v10 = [(SKUILoadResourceOperation *)self outputBlock];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__SKUILoadSortDataOperation_main__block_invoke;
  v12[3] = &unk_1E6429A10;
  id v13 = v10;
  id v11 = v10;
  [v6 setOutputBlock:v12];
  [(SKUILoadSortDataOperation *)self setUnderlyingOperation:v6];
  [v6 main];
}

void __33__SKUILoadSortDataOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [v5 objectForKey:@"storePlatformData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v5 objectForKey:@"storePlatformPrewarmDataKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      uint64_t v11 = objc_opt_class();
      v10 = SKUIStorePageItemsWithStorePlatformDictionary(v7, v9, v11);
    }
    else
    {
      v10 = 0;
    }
    v12 = [v5 objectForKey:@"adamIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v7;
      uint64_t v27 = a1;
      id v28 = v5;
      long long v36 = 0uLL;
      uint64_t v37 = 0;
      SKUILockupStyleDefault((uint64_t)&v36);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v25 = v12;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [v10 objectForKey:v18];
              v20 = [SKUILockupComponent alloc];
              v21 = v20;
              if (v19)
              {
                long long v30 = v36;
                uint64_t v31 = v37;
                uint64_t v22 = [(SKUILockupComponent *)v20 initWithItem:v19 style:&v30];
              }
              else
              {
                uint64_t v23 = [v18 longLongValue];
                long long v30 = v36;
                uint64_t v31 = v37;
                uint64_t v22 = [(SKUILockupComponent *)v21 initWithItemIdentifier:v23 style:&v30];
              }
              v24 = (void *)v22;
              objc_msgSend(v29, "addObject:", v22, v25);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v15);
      }

      id v5 = v28;
      objc_super v7 = v26;
      a1 = v27;
      v12 = v25;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)SKUILoadSortDataOperation;
  [(SKUILoadResourceOperation *)&v4 cancel];
  id v3 = [(SKUILoadSortDataOperation *)self underlyingOperation];
  [v3 cancel];
}

- (SSVLoadURLOperation)underlyingOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingOperation);

  return (SSVLoadURLOperation *)WeakRetained;
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
  v1 = "-[SKUILoadSortDataOperation initWithResourceRequest:]";
}

@end