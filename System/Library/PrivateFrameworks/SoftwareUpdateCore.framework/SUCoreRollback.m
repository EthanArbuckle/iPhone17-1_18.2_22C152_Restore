@interface SUCoreRollback
+ (BOOL)supportsSecureCoding;
- (SUCoreRollback)init;
- (SUCoreRollback)initWithCoder:(id)a3;
- (SUCoreRollbackDescriptor)eligibleRollback;
- (SUCoreRollbackDescriptor)rollback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)previousRollback;
- (void)encodeWithCoder:(id)a3;
- (void)loadPersistedStateFile;
- (void)rollbackCompleted;
- (void)setRollback:(id)a3;
@end

@implementation SUCoreRollback

- (SUCoreRollback)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUCoreRollback;
  v2 = [(SUCoreRollback *)&v10 init];
  if (v2)
  {
    v3 = (const char *)[@"com.apple.su.core.rollback.statequeue" UTF8String];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create(v3, v4);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(SUCoreRollbackDescriptor);
    rollback = v2->_rollback;
    v2->_rollback = v7;

    [(SUCoreRollback *)v2 loadPersistedStateFile];
  }
  return v2;
}

- (SUCoreRollbackDescriptor)eligibleRollback
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUCoreRollback_eligibleRollback__block_invoke;
  v6[3] = &unk_2640DC310;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCoreRollbackDescriptor *)v4;
}

void __34__SUCoreRollback_eligibleRollback__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) rollbackEligible])
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 24);
    v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v3, v2);
  }
}

- (void)loadPersistedStateFile
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "Failed to create filePath. Creating filePath with filename set to bundleIdentifier", v1, 2u);
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) loadPersistedState] & 1) == 0)
  {
    v1 = [MEMORY[0x263F77DE8] sharedLogger];
    v2 = [v1 oslog];

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1(v2);
    }
  }
}

- (id)previousRollback
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUCoreRollback_previousRollback__block_invoke;
  v6[3] = &unk_2640DC360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__SUCoreRollback_previousRollback__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)MEMORY[0x263EFFA08];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  dispatch_queue_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v6 = [v4 setWithArray:v5];
  uint64_t v7 = [v2 secureCodedObjectForKey:@"previousRollback" ofClass:v3 encodeClasses:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)rollbackCompleted
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SUCoreRollback_rollbackCompleted__block_invoke;
  block[3] = &unk_2640DC338;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __35__SUCoreRollback_rollbackCompleted__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:@"previousRollback" shouldPersist:1];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SUCoreRollback *)self rollback];
  dispatch_queue_t v5 = (void *)[v3 initWithFormat:@"rollback:%@", v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollback)initWithCoder:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(SUCoreRollback);

  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rollback"];
    [(SUCoreRollback *)v5 setRollback:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreRollback *)self rollback];
  [v4 encodeObject:v5 forKey:@"rollback"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[SUCoreRollback allocWithZone:a3] init];
  id v5 = [(SUCoreRollback *)self rollback];
  [(SUCoreRollback *)v4 setRollback:v5];

  return v4;
}

- (SUCoreRollbackDescriptor)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

void __40__SUCoreRollback_loadPersistedStateFile__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "Failed loading persisted state", v1, 2u);
}

@end