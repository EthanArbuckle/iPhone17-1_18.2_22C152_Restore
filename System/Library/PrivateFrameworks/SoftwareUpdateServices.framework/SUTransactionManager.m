@interface SUTransactionManager
+ (id)sharedInstance;
- (BOOL)_hasOpenTransactionForName:(id)a3;
- (BOOL)_isKeepAliveEnabled:(id *)a3;
- (BOOL)hasOpenTransactionForName:(id)a3;
- (BOOL)isKeepAliveEnabled;
- (SUTransactionManager)init;
- (id)copyTransactions;
- (void)_setKeepAlive:(BOOL)a3;
- (void)_toggleKeepAliveStatus;
- (void)beginTransaction:(id)a3;
- (void)beginTransaction:(id)a3 keepAlive:(BOOL)a4;
- (void)clearKeepAliveIfNecessary:(BOOL)a3;
- (void)dealloc;
- (void)endTransaction:(id)a3;
- (void)setKeepAliveClearable:(BOOL)a3;
@end

@implementation SUTransactionManager

void __51__SUTransactionManager_beginTransaction_keepAlive___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasOpenTransactionForName:*(void *)(a1 + 40)])
  {
    SULogDebug(@"ERROR: trying to start a transaction with already used name %@%@", v2, v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
  }
  else
  {
    SULogDebug(@"Beginning transaction: %@%@", v2, v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
    v9 = [MEMORY[0x263F089D8] stringWithString:@"com.apple.SoftwareUpdateServices."];
    [v9 appendString:*(void *)(a1 + 40)];
    v10 = *(void **)(*(void *)(a1 + 32) + 8);
    id v12 = v9;
    [v12 UTF8String];
    v11 = (void *)os_transaction_create();
    [v10 setSafeObject:v11 forKey:*(void *)(a1 + 40)];

    if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _toggleKeepAliveStatus];
    }
  }
}

void __39__SUTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasOpenTransactionForName:*(void *)(a1 + 40)])
  {
    SULogDebug(@"Ended transaction: %@", v2, v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
    {
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
      v9 = *(void **)(a1 + 32);
      [v9 _toggleKeepAliveStatus];
    }
  }
  else
  {
    SULogDebug(@"ERROR: trying to end a non existent transaction with name %@", v2, v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
  }
}

- (BOOL)_hasOpenTransactionForName:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_openTransactions objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUTransactionManager_endTransaction___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)beginTransaction:(id)a3 keepAlive:(BOOL)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUTransactionManager_beginTransaction_keepAlive___block_invoke;
  block[3] = &unk_26447CED8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(workQueue, block);
}

- (void)beginTransaction:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)sharedInstance___instance_2;
  return v2;
}

uint64_t __40__SUTransactionManager_copyTransactions__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x270F9A758]();
}

- (id)copyTransactions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  id v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUTransactionManager_copyTransactions__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->_openTransactions allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUTransactionManager *)self endTransaction:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUTransactionManager;
  [(SUTransactionManager *)&v8 dealloc];
}

- (SUTransactionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUTransactionManager;
  uint64_t v2 = [(SUTransactionManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.softwareupdateservicesd.SUTransactionManager", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = v5;

    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    keepAliveTransactions = v2->_keepAliveTransactions;
    v2->_keepAliveTransactions = v7;

    v2->_keepAliveClearable = 1;
  }
  return v2;
}

uint64_t __38__SUTransactionManager_sharedInstance__block_invoke()
{
  sharedInstance___instance_2 = objc_alloc_init(SUTransactionManager);
  return MEMORY[0x270F9A758]();
}

- (BOOL)hasOpenTransactionForName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUTransactionManager_hasOpenTransactionForName___block_invoke;
  block[3] = &unk_26447D728;
  id v9 = v4;
  objc_super v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

uint64_t __50__SUTransactionManager_hasOpenTransactionForName___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hasOpenTransactionForName:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)setKeepAliveClearable:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUTransactionManager_setKeepAliveClearable___block_invoke;
  v4[3] = &unk_26447CD98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(workQueue, v4);
}

uint64_t __46__SUTransactionManager_setKeepAliveClearable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isKeepAliveEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SUTransactionManager_isKeepAliveEnabled__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SUTransactionManager_isKeepAliveEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isKeepAliveEnabled:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)clearKeepAliveIfNecessary:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SUTransactionManager_clearKeepAliveIfNecessary___block_invoke;
  v4[3] = &unk_26447CD98;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(workQueue, v4);
}

uint64_t __50__SUTransactionManager_clearKeepAliveIfNecessary___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count]) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    return [v2 _setKeepAlive:0];
  }
  return result;
}

- (void)_toggleKeepAliveStatus
{
  BOOL v3 = [(NSMutableSet *)self->_keepAliveTransactions count] != 0;
  [(SUTransactionManager *)self _setKeepAlive:v3];
}

- (void)_setKeepAlive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || self->_keepAliveClearable)
  {
    uint64_t v14 = 0;
    int v4 = [(SUTransactionManager *)self _isKeepAliveEnabled:&v14] ^ a3;
    if (v14 || v4 != 0)
    {
      if (vproc_swap_integer())
      {
        NSLog(&cfstr_Softwareupdate_1.isa);
      }
      else
      {
        uint64_t v13 = @"Disabled";
        if (v3) {
          uint64_t v13 = @"Enabled";
        }
        SULogDebug(@"Keep alive status: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
      }
    }
  }
}

- (BOOL)_isKeepAliveEnabled:(id *)a3
{
  if (vproc_swap_integer())
  {
    NSLog(&cfstr_Softwareupdate_2.isa);
    +[SUUtility assignError:a3 withCode:-1];
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_keepAliveTransactions, 0);
  objc_storeStrong((id *)&self->_openTransactions, 0);
}

@end