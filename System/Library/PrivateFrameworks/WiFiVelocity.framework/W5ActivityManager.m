@interface W5ActivityManager
+ (id)sharedActivityManager;
- (BOOL)debugTimerEnabled;
- (NSDate)dateFirstTransaction;
- (OS_dispatch_queue)queue;
- (W5ActivityManager)init;
- (id)alternateExecutionBlockForCleanExit;
- (unint64_t)osTransactionsActive;
- (unint64_t)transactionsCompleted;
- (unint64_t)transactionsStarted;
- (void)_executeTimerBlock;
- (void)debugTimer;
- (void)osTransactionComplete:(id)a3;
- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4;
- (void)setAlternateExecutionBlockForCleanExit:(id)a3;
- (void)setDateFirstTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactionsCompleted:(unint64_t)a3;
- (void)setTransactionsStarted:(unint64_t)a3;
@end

@implementation W5ActivityManager

+ (id)sharedActivityManager
{
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  }
  v2 = (void *)qword_26AB09F60;
  return v2;
}

uint64_t __42__W5ActivityManager_sharedActivityManager__block_invoke()
{
  qword_26AB09F60 = objc_alloc_init(W5ActivityManager);
  return MEMORY[0x270F9A758]();
}

- (W5ActivityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)W5ActivityManager;
  v2 = [(W5ActivityManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("W5ActivityManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager init error!", v11, 2u);
  }
  return v3;
}

- (BOOL)debugTimerEnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.wifivelocity"];

  v4 = [v3 objectForKey:@"eager-exit-debug"];
  if (v4)
  {
    NSLog(&cfstr_SFoundPreferen.isa, "-[W5ActivityManager debugTimerEnabled]", @"com.apple.wifivelocity", @"eager-exit-debug");
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)debugTimer
{
  periodicActiveListTimer = self->_periodicActiveListTimer;
  BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
  if (periodicActiveListTimer)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager debugTimer already setup", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager configuring _periodicActiveListTimer", buf, 2u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__W5ActivityManager_debugTimer__block_invoke;
    block[3] = &unk_2641FDA48;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __31__W5ActivityManager_debugTimer__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__W5ActivityManager_debugTimer__block_invoke_2;
  v5[3] = &unk_2641FDA70;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v5 block:5.0];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

void __31__W5ActivityManager_debugTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__W5ActivityManager_debugTimer__block_invoke_3;
  block[3] = &unk_2641FDA48;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __31__W5ActivityManager_debugTimer__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v1 count];
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransactions %lu", buf, 0xCu);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    v6 = MEMORY[0x263EF8438];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t description = os_transaction_get_description();
          *(_DWORD *)buf = 136315138;
          uint64_t v15 = description;
          _os_log_impl(&dword_214281000, v6, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransaction %s", buf, 0xCu);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__W5ActivityManager_osTransactionCreate_transaction___block_invoke;
  block[3] = &unk_2641FDA98;
  block[4] = self;
  id v10 = v6;
  long long v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __53__W5ActivityManager_osTransactionCreate_transaction___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  if (!v2[2])
  {
    int v3 = [v2 debugTimerEnabled];
    id v2 = (void *)a1[4];
    if (v3)
    {
      [v2 debugTimer];
      id v2 = (void *)a1[4];
    }
  }
  if (!v2[6])
  {
    uint64_t v4 = [MEMORY[0x263EFF910] now];
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    id v2 = (void *)a1[4];
  }
  v7 = (void *)v2[1];
  if (v7 && [v7 isValid])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v13, 2u);
    }
    [*(id *)(a1[4] + 8) invalidate];
    uint64_t v8 = a1[4];
    long long v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;
  }
  [*(id *)(a1[4] + 24) addObject:a1[5]];
  ++*(void *)(a1[4] + 48);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[6];
    uint64_t v11 = [*(id *)(a1[4] + 24) count];
    uint64_t v12 = *(void *)(a1[4] + 48);
    int v13 = 136315650;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v13, 0x20u);
  }
}

- (void)osTransactionComplete:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke;
  block[3] = &unk_2641FDB10;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v13 + 24) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete TRANSACTION NOT FOUND ASSERT", v7, 2u);
  }

  _Block_object_dispose(&v12, 8);
}

void __43__W5ActivityManager_osTransactionComplete___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t description = os_transaction_get_description();
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionComplete %s", buf, 0xCu);
  }
  if (([*(id *)(a1[5] + 24) containsObject:a1[4]] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = os_transaction_get_description();
      uint64_t v12 = [*(id *)(a1[5] + 24) count];
      *(_DWORD *)buf = 136315394;
      uint64_t description = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      _os_log_error_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete %s, TRANSACTION NOT FOUND, active count is now %lu", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  [*(id *)(a1[5] + 24) removeObject:a1[4]];
  ++*(void *)(a1[5] + 64);
  if (![*(id *)(a1[5] + 24) count])
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v3 = [v2 persistentDomainForName:@"com.apple.wifivelocity"];

    id v4 = [v3 objectForKey:@"eager-exit-timeout"];
    if (v4)
    {
      NSLog(&cfstr_SFoundPreferen.isa, "-[W5ActivityManager osTransactionComplete:]_block_invoke", @"com.apple.wifivelocity", @"eager-exit-timeout");
      int v5 = [v4 intValue];
      if (v5 < 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, eager exit timer disabled via defaults write", buf, 2u);
        }
        goto LABEL_21;
      }
      double v6 = (double)v5;
    }
    else
    {
      double v6 = 300.0;
    }
    v7 = *(void **)(a1[5] + 8);
    BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t description = *(void *)&v6;
        _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, extending running eager exit timer to %f seconds", buf, 0xCu);
        v7 = *(void **)(a1[5] + 8);
      }
      if ([v7 isValid]) {
        [*(id *)(a1[5] + 8) invalidate];
      }
      uint64_t v9 = a1[5];
      uint64_t v10 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = 0;
    }
    else if (v8)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t description = *(void *)&v6;
      _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, configuring eager exit timer in %f seconds", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke_17;
    block[3] = &unk_2641FDAE8;
    void block[4] = a1[5];
    *(double *)&void block[5] = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_21:
  }
}

void __43__W5ActivityManager_osTransactionComplete___block_invoke_17(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__W5ActivityManager_osTransactionComplete___block_invoke_2;
  v6[3] = &unk_2641FDAC0;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;
}

void __43__W5ActivityManager_osTransactionComplete___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 64);
    [*(id *)(v4 + 56) timeIntervalSinceNow];
    int v9 = 134218240;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    double v12 = -v6;
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v9, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) _executeTimerBlock];
  BOOL v8 = [*(id *)(a1 + 32) alternateExecutionBlockForCleanExit];

  if (!v8
    && (xpc_transaction_try_exit_clean() & 1) == 0
    && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_214281000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Cannot eager exit, still outstanding transactions", (uint8_t *)&v9, 2u);
  }
}

- (void)_executeTimerBlock
{
  id v3 = [(W5ActivityManager *)self alternateExecutionBlockForCleanExit];

  if (v3)
  {
    uint64_t v4 = [(W5ActivityManager *)self alternateExecutionBlockForCleanExit];
    v4[2]();
  }
}

- (unint64_t)osTransactionsActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__W5ActivityManager_osTransactionsActive__block_invoke;
  v5[3] = &unk_2641FDB38;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__W5ActivityManager_osTransactionsActive__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)transactionsStarted
{
  return self->_transactionsStarted;
}

- (void)setTransactionsStarted:(unint64_t)a3
{
  self->_transactionsStarted = a3;
}

- (NSDate)dateFirstTransaction
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
}

- (unint64_t)transactionsCompleted
{
  return self->_transactionsCompleted;
}

- (void)setTransactionsCompleted:(unint64_t)a3
{
  self->_transactionsCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFirstTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);
  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end