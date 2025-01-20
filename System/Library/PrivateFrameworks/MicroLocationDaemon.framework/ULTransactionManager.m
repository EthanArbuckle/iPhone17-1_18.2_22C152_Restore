@interface ULTransactionManager
+ (id)shared;
- (NSMutableDictionary)transactions;
- (OS_dispatch_queue)queue;
- (ULTransactionManager)init;
- (id)dumpActiveTransactions;
- (void)beginTransaction:(id)a3;
- (void)endTransaction:(id)a3;
- (void)invalidateAllTransactions;
- (void)performUnderTransaction:(id)a3 block:(id)a4;
- (void)setQueue:(id)a3;
- (void)setTransactions:(id)a3;
@end

@implementation ULTransactionManager

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__ULTransactionManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_ul_once_token_4 != -1) {
    dispatch_once(&shared_ul_once_token_4, block);
  }
  v2 = (void *)shared_ul_once_object_4;
  return v2;
}

void __30__ULTransactionManager_shared__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_ul_once_object_4;
  shared_ul_once_object_4 = (uint64_t)v1;
}

- (ULTransactionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ULTransactionManager;
  v2 = [(ULTransactionManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.milod.ULTransactionManager", v3);
    [(ULTransactionManager *)v2 setQueue:v4];

    v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(ULTransactionManager *)v2 setTransactions:v5];
  }
  return v2;
}

- (void)beginTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(ULTransactionManager *)self queue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(ULTransactionManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__ULTransactionManager_beginTransaction___block_invoke;
  v8[3] = &unk_2653F9228;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __41__ULTransactionManager_beginTransaction___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) transactions],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKeyedSubscript:*(void *)(a1 + 32)],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        !v3))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_65);
    }
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "beginTransaction for identifier: %@", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) UTF8String];
    v8 = (void *)os_transaction_create();
    id v9 = [*(id *)(a1 + 40) transactions];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_65);
    }
    id v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "beginTransaction: transaction exists: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULTransactionManager *)self queue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(ULTransactionManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__ULTransactionManager_endTransaction___block_invoke;
  v8[3] = &unk_2653F9228;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __39__ULTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) transactions],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKeyedSubscript:*(void *)(a1 + 32)],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_65);
    }
    id v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "endTransaction for identifier: %@", (uint8_t *)&v9, 0xCu);
    }
    v6 = [*(id *)(a1 + 40) transactions];
    [v6 removeObjectForKey:*(void *)(a1 + 32)];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_65);
    }
    id v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "endTransaction: transaction doesnt exist: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)performUnderTransaction:(id)a3 block:(id)a4
{
  v6 = (void (**)(void))a4;
  id v8 = a3;
  id v7 = [(ULTransactionManager *)self queue];
  dispatch_assert_queue_not_V2(v7);

  [(ULTransactionManager *)self beginTransaction:v8];
  v6[2](v6);

  [(ULTransactionManager *)self endTransaction:v8];
}

- (void)invalidateAllTransactions
{
  v3 = [(ULTransactionManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(ULTransactionManager *)self dumpActiveTransactions];
  uint64_t v5 = [(ULTransactionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__ULTransactionManager_invalidateAllTransactions__block_invoke;
  v7[3] = &unk_2653F9228;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __49__ULTransactionManager_invalidateAllTransactions__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_65);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating all transactions: %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) transactions];
  [v4 removeAllObjects];
}

- (id)dumpActiveTransactions
{
  uint64_t v3 = [(ULTransactionManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  uint64_t v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v4 = [(ULTransactionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ULTransactionManager_dumpActiveTransactions__block_invoke;
  v7[3] = &unk_2653F9310;
  void v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__ULTransactionManager_dumpActiveTransactions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) transactions];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end