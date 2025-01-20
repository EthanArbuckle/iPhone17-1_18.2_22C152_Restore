@interface SDMigrationMonitor
+ (id)sharedInstance;
- (BOOL)finishedDataMigration;
- (BOOL)foundExtensions;
- (BOOL)unlocked;
- (OS_dispatch_queue)queue;
- (SDMigrationMonitor)init;
- (id)completionBlock;
- (id)eventHandler;
- (void)_didFindExtensions:(id)a3;
- (void)_finishMigration;
- (void)dealloc;
- (void)monitorDataMigrationWithCompletionBlock:(id)a3;
- (void)registerHandlerWithEventMonitor:(id)a3;
- (void)resumeMigrationQueue;
- (void)setCompletionBlock:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setFinishedDataMigration:(BOOL)a3;
- (void)setFoundExtensions:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUnlocked:(BOOL)a3;
- (void)suspendMigrationQueue;
- (void)unlock;
@end

@implementation SDMigrationMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_sSDMigrationMonitor;
  return v2;
}

uint64_t __36__SDMigrationMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sSDMigrationMonitor;
  sharedInstance_sSDMigrationMonitor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SDMigrationMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDMigrationMonitor;
  v2 = [(SDMigrationMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchd.migrationMonitor", v3);
    [(SDMigrationMonitor *)v2 setQueue:v4];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__didFindExtensions_ name:*MEMORY[0x263F02B58] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F02B58] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SDMigrationMonitor;
  [(SDMigrationMonitor *)&v4 dealloc];
}

- (void)suspendMigrationQueue
{
}

- (void)resumeMigrationQueue
{
}

- (void)_didFindExtensions:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SDMigrationMonitor__didFindExtensions___block_invoke;
  block[3] = &unk_2645063F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __41__SDMigrationMonitor__didFindExtensions___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v1 = result;
    v2 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor found index extensions", v4, 2u);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 9) = 1;
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:*(void *)(v1 + 32) name:*MEMORY[0x263F02B58] object:0];

    return [*(id *)(v1 + 32) _finishMigration];
  }
  return result;
}

- (void)_finishMigration
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_unlocked && self->_foundExtensions && self->_finishedDataMigration && self->_completionBlock)
  {
    v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor _finishMigration", (uint8_t *)v10, 2u);
    }

    (*((void (**)(void))self->_completionBlock + 2))();
    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;
  }
  else
  {
    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL unlocked = self->_unlocked;
      BOOL foundExtensions = self->_foundExtensions;
      BOOL finishedDataMigration = self->_finishedDataMigration;
      id v9 = self->_completionBlock;
      v10[0] = 67109888;
      v10[1] = unlocked;
      __int16 v11 = 1024;
      BOOL v12 = foundExtensions;
      __int16 v13 = 1024;
      BOOL v14 = finishedDataMigration;
      __int16 v15 = 1024;
      int v16 = (int)v9;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor unlocked: %d, foundExtensions: %d, migrationFinished: %d, completion: %d", (uint8_t *)v10, 0x1Au);
    }

    completionBlock = +[SDLockHandler sharedLockHandler];
    [completionBlock checkMigrationComplete];
  }
}

- (void)unlock
{
  v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor unlock", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SDMigrationMonitor_unlock__block_invoke;
  block[3] = &unk_2645063F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__SDMigrationMonitor_unlock__block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    v2 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor unlocked", v3, 2u);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 8) = 1;
    return [*(id *)(v1 + 32) _finishMigration];
  }
  return result;
}

- (void)monitorDataMigrationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke;
  v7[3] = &unk_264507168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_2;
  v10 = &unk_264509290;
  v2 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v2;
  v3 = (void *)MEMORY[0x223C48320](&v7);
  id v4 = +[SDEventMonitor sharedInstance];
  v5 = [*(id *)(a1 + 32) eventHandler];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) eventHandler];
    [v4 unregisterHandler:v6 forEventName:@"com.apple.datamigrator.migrationDidFinish"];
  }
  [*(id *)(a1 + 32) setEventHandler:v3];
  [v4 registerHandler:v3 forEventName:@"com.apple.datamigrator.migrationDidFinish"];
}

void __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_error_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_ERROR, "SDMigrationMonitor received an error for \"%@\", userInfo:%@, error:%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(NSObject **)(v12 + 16);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_9;
    v14[3] = &unk_264507168;
    v14[4] = v12;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v13, v14);
  }
}

uint64_t __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_9(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 10))
  {
    uint64_t v1 = result;
    v2 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor was notified of data migration completion", v9, 2u);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 10) = 1;
    uint64_t v3 = MEMORY[0x223C48320](*(void *)(v1 + 40));
    uint64_t v4 = *(void *)(v1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    id v6 = +[SDEventMonitor sharedInstance];
    uint64_t v7 = [*(id *)(v1 + 32) eventHandler];
    [v6 unregisterHandler:v7 forEventName:@"com.apple.datamigrator.migrationDidFinish"];

    [*(id *)(v1 + 32) setEventHandler:0];
    id v8 = +[SDLockHandler sharedLockHandler];
    [v8 forceMigrationComplete];

    return [*(id *)(v1 + 32) _finishMigration];
  }
  return result;
}

- (void)registerHandlerWithEventMonitor:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[SDMigrationMonitor registerHandlerWithEventMonitor:]", "SDMigrationMonitor.m", 129, "0");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_BOOL unlocked = a3;
}

- (BOOL)foundExtensions
{
  return self->_foundExtensions;
}

- (void)setFoundExtensions:(BOOL)a3
{
  self->_BOOL foundExtensions = a3;
}

- (BOOL)finishedDataMigration
{
  return self->_finishedDataMigration;
}

- (void)setFinishedDataMigration:(BOOL)a3
{
  self->_BOOL finishedDataMigration = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end