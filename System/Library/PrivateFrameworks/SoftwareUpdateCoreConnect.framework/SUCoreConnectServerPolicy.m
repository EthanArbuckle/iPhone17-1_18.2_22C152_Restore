@interface SUCoreConnectServerPolicy
+ (id)_getAllowlistedClassesForKey:(id)a3;
+ (id)_getSharedServerAccessQueue;
+ (id)_getSharedServerAllowlistedClasses;
+ (id)getAllowlistedClassesForKey:(id)a3;
+ (void)clearAllowlistedClasses;
+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4;
- (NSSet)entitlements;
- (NSString)description;
- (NSString)serviceName;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)delegateQueue;
- (SUCoreConnectServerDelegate)serverDelegate;
- (SUCoreConnectServerPolicy)initWithServiceName:(id)a3 entitlements:(id)a4 serverDelegate:(id)a5;
@end

@implementation SUCoreConnectServerPolicy

uint64_t __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  v4 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses];
    v6 = [v5 safeObjectForKey:v3 ofClass:objc_opt_class()];
  }
  else
  {
    v7 = [MEMORY[0x263F77DE8] sharedLogger];
    v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_210A6A000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectServerPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes", v10, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  v4 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v5 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_2641881C0;
  id v10 = v3;
  v11 = &v12;
  id v6 = v3;
  dispatch_sync(v5, v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)_getSharedServerAccessQueue
{
  if (_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken != -1) {
    dispatch_once(&_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken, &__block_literal_global_0);
  }
  v2 = (void *)_getSharedServerAccessQueue_sharedServerAccessQueue;
  return v2;
}

+ (id)_getSharedServerAllowlistedClasses
{
  v2 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_assert_queue_V2(v2);

  if (_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken != -1) {
    dispatch_once(&_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken, &__block_literal_global_9);
  }
  id v3 = (void *)_getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses;
  return v3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (SUCoreConnectServerDelegate)serverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  return (SUCoreConnectServerDelegate *)WeakRetained;
}

- (SUCoreConnectServerPolicy)initWithServiceName:(id)a3 entitlements:(id)a4 serverDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SUCoreConnectServerPolicy;
  uint64_t v12 = [(SUCoreConnectServerPolicy *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_entitlements, a4);
    objc_storeWeak((id *)&v13->_serverDelegate, v11);
    uint64_t v14 = (const char *)[@"com.apple.SUCoreConnect.ConnectionQueue" UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    connectionQueue = v13->_connectionQueue;
    v13->_connectionQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)[@"com.apple.SUCoreConnect.ServerDelegateQueue" UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    delegateQueue = v13->_delegateQueue;
    v13->_delegateQueue = (OS_dispatch_queue *)v20;
  }
  return v13;
}

void __56__SUCoreConnectServerPolicy__getSharedServerAccessQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.SUCoreConnect.ServerAllowlistAccessQueue" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)_getSharedServerAccessQueue_sharedServerAccessQueue;
  _getSharedServerAccessQueue_sharedServerAccessQueue = (uint64_t)v1;
}

uint64_t __63__SUCoreConnectServerPolicy__getSharedServerAllowlistedClasses__block_invoke()
{
  _getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a4;
  id v8 = [v5 setWithObject:a3];
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];

  +[SUCoreConnectServerPolicy setAllowlistedClasses:v8 forKeys:v7];
}

+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = [v5 setWithObject:a4];
  +[SUCoreConnectServerPolicy setAllowlistedClasses:v6 forKeys:v7];
}

+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_assert_queue_not_V2(v7);

  if (!v6 || ![v6 count])
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    [v9 trackAnomaly:@"SUCoreConnectServerPolicy" forReason:@"Cannot set allowlisted classes for a nil/empty NSSet of keys" withResult:8102 withError:0];
LABEL_8:

    goto LABEL_9;
  }
  if (!v5 || ![v5 count])
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    id v10 = [NSString stringWithFormat:@"Cannot set nil/empty NSSet of classes for keys %@", v6];
    [v9 trackAnomaly:@"SUCoreConnectServerPolicy" forReason:v10 withResult:8102 withError:0];

    goto LABEL_8;
  }
  id v8 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke;
  block[3] = &unk_2641881E8;
  id v12 = v6;
  id v13 = v5;
  dispatch_sync(v8, block);

LABEL_9:
}

void __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x216678F30]();
        id v8 = (void *)MEMORY[0x263EFFA08];
        id v9 = +[SUCoreConnectConstants defaultClasses];
        id v10 = [v8 setWithArray:v9];

        id v11 = +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:v6];
        if (v11)
        {
          uint64_t v12 = [v10 setByAddingObjectsFromSet:v11];

          id v10 = (void *)v12;
        }
        id v13 = [v10 setByAddingObjectsFromSet:*(void *)(a1 + 40)];

        uint64_t v14 = +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses];
        [v14 setSafeObject:v13 forKey:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

+ (void)clearAllowlistedClasses
{
  uint64_t v2 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_assert_queue_not_V2(v2);

  uint64_t v3 = +[SUCoreConnectServerPolicy _getSharedServerAccessQueue];
  dispatch_sync(v3, &__block_literal_global_26);
}

void __52__SUCoreConnectServerPolicy_clearAllowlistedClasses__block_invoke()
{
  v0 = +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses];
  [v0 removeAllObjects];

  dispatch_queue_t v1 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v2 = [v1 oslog];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_210A6A000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectServerPolicy] All entries removed from allowlisted classes dictionary", v3, 2u);
  }
}

- (NSString)description
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(SUCoreConnectServerPolicy *)self serviceName];
  uint64_t v4 = [v2 stringWithFormat:@"SUCoreConnectServerPolicy(serviceName:%@)", v3];

  return (NSString *)v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSSet)entitlements
{
  return self->_entitlements;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end