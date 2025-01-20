@interface VSFeaturedIdentityProviderLimitingOperation
- (NSArray)unlimitedIdentityProviders;
- (NSOperationQueue)privateQueue;
- (VSFeaturedIdentityProviderLimitingOperation)init;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setPrivateQueue:(id)a3;
- (void)setResult:(id)a3;
- (void)setUnlimitedIdentityProviders:(id)a3;
@end

@implementation VSFeaturedIdentityProviderLimitingOperation

- (VSFeaturedIdentityProviderLimitingOperation)init
{
  v13.receiver = self;
  v13.super_class = (Class)VSFeaturedIdentityProviderLimitingOperation;
  v2 = [(VSFeaturedIdentityProviderLimitingOperation *)&v13 init];
  v3 = v2;
  if (v2)
  {
    unlimitedIdentityProviders = v2->_unlimitedIdentityProviders;
    v2->_unlimitedIdentityProviders = (NSArray *)MEMORY[0x263EFFA68];

    v5 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v6 = v3->_result;
    v3->_result = v5;

    v7 = (void *)MEMORY[0x263F08A48];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 queueWithName:v9];
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = (NSOperationQueue *)v10;
  }
  return v3;
}

- (void)executionDidBegin
{
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Will attempt to determine maximum number of featured providers.", (uint8_t *)buf, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F1E158]);
  [v4 setBagKey:*MEMORY[0x263F1E320]];
  objc_initWeak(buf, v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__VSFeaturedIdentityProviderLimitingOperation_executionDidBegin__block_invoke;
  v6[3] = &unk_2650776A8;
  objc_copyWeak(&v7, buf);
  objc_copyWeak(&v8, &location);
  [v4 setCompletionBlock:v6];
  v5 = [(VSFeaturedIdentityProviderLimitingOperation *)self privateQueue];
  [v5 addOperation:v4];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  objc_destroyWeak(buf);
}

void __64__VSFeaturedIdentityProviderLimitingOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v23 = WeakRetained;
  id v4 = [WeakRetained value];
  objc_opt_class();
  v21 = v4;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    unint64_t v5 = [v4 integerValue] + 1;
  }
  else {
    unint64_t v5 = 16;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v22 = v3;
  obuint64_t j = [v3 unlimitedIdentityProviders];
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v10 = [v9 storefronts];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              v16 = [v15 sortOrdinal];
              unint64_t v17 = [v16 unsignedIntegerValue];

              if (v17 >= v5) {
                [v15 setSortOrdinal:0];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v12);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  v18 = (void *)MEMORY[0x263F1E250];
  v19 = [v22 unlimitedIdentityProviders];
  v20 = [v18 optionalWithObject:v19];
  [v22 setResult:v20];

  [v22 finishExecutionIfPossible];
}

- (NSArray)unlimitedIdentityProviders
{
  return self->_unlimitedIdentityProviders;
}

- (void)setUnlimitedIdentityProviders:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_unlimitedIdentityProviders, 0);
}

@end