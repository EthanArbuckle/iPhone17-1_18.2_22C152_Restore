@interface SKUILoadGratisEligibilityOperation
- (SKUILoadGratisEligibilityOperation)init;
- (SKUILoadGratisEligibilityOperation)initWithBundleIdentifiers:(id)a3 clientContext:(id)a4;
- (id)_bodyData;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUILoadGratisEligibilityOperation

- (SKUILoadGratisEligibilityOperation)init
{
  v3 = +[SKUIClientContext defaultContext];
  v4 = [(SKUILoadGratisEligibilityOperation *)self initWithBundleIdentifiers:0 clientContext:v3];

  return v4;
}

- (SKUILoadGratisEligibilityOperation)initWithBundleIdentifiers:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadGratisEligibilityOperation initWithBundleIdentifiers:clientContext:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUILoadGratisEligibilityOperation;
  v8 = [(SKUILoadGratisEligibilityOperation *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_clientContext, a4);
    id v11 = (id) [[NSString alloc] initWithFormat:@"com.apple.StoreKitUI.SKUILoadGratisEligibilityOperation"];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

- (id)outputBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__96;
  v10 = __Block_byref_object_dispose__96;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SKUILoadGratisEligibilityOperation_outputBlock__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __49__SKUILoadGratisEligibilityOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 272) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SKUILoadGratisEligibilityOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_1E6423820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__53__SKUILoadGratisEligibilityOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 272) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 272);
    *(void *)(v5 + 272) = v4;
    return (void *)MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

- (void)main
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__7;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(SKUIClientContext *)self->_clientContext URLBag];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__SKUILoadGratisEligibilityOperation_main__block_invoke;
  v14[3] = &unk_1E6428CA8;
  v16 = &v18;
  v17 = &v24;
  uint64_t v5 = v3;
  objc_super v15 = v5;
  [v4 loadValueForKey:@"up-to-date-eligibility-read" completionBlock:v14];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v19[5])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F18D50]);
    id v7 = (void *)[v6 initWithURL:v19[5]];
    id v8 = [(SKUILoadGratisEligibilityOperation *)self _bodyData];
    [v7 setHTTPBody:v8];

    [v7 setHTTPMethod:@"POST"];
    [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v9 = [(SKUIClientContext *)self->_clientContext newLoadStoreURLOperationWithURLRequest:v7];
    v10 = [MEMORY[0x1E4FA8388] consumer];
    [v9 setDataConsumer:v10];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__SKUILoadGratisEligibilityOperation_main__block_invoke_2;
    v13[3] = &unk_1E6425980;
    v13[4] = &v30;
    v13[5] = &v24;
    [v9 setOutputBlock:v13];
    [v9 main];
  }
  uint64_t v11 = [(SKUILoadGratisEligibilityOperation *)self outputBlock];
  dispatch_queue_t v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v31[5], v25[5]);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __42__SKUILoadGratisEligibilityOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v12];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__SKUILoadGratisEligibilityOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 objectForKey:@"status"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ![v7 integerValue])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v11 = [v5 objectForKey:@"items"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v6;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v21 = v11;
        id v12 = v11;
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
              v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v18 = [v17 objectForKey:@"item-id"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v18];
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        id v6 = v22;
        id v11 = v21;
      }
    }
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;
}

- (id)_bodyData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA8330]);
  uint64_t v4 = [MEMORY[0x1E4FA8100] defaultStore];
  id v5 = [v4 activeAccount];
  id v6 = [v5 uniqueIdentifier];
  [v3 setAccountIdentifier:v6];

  [v3 setBundleIdentifiers:self->_bundleIDs];
  uint64_t v7 = [v3 JSONBodyData];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

- (void)initWithBundleIdentifiers:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadGratisEligibilityOperation initWithBundleIdentifiers:clientContext:]";
}

@end