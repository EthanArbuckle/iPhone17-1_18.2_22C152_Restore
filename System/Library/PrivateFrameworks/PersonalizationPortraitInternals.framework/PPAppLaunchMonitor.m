@interface PPAppLaunchMonitor
+ (id)sharedInstance;
- (id)_init;
- (id)registerForAppLaunchWithBundleId:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)deregisterForAppLaunchWithToken:(id)a3;
@end

@implementation PPAppLaunchMonitor

void __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v5 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v3;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "_CDContextualChangeHandler called: %@ %@", buf, 0x16u);
  }

  uint64_t v16 = a1;
  [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (!v12 || (id v13 = *(id *)(v12 + 16), (v14 = v13) == 0))
        {
          id v13 = 0;
          v14 = *(void **)(*(void *)(v16 + 48) + 16);
        }
        v15 = v14;

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke_115;
        block[3] = &unk_1E65DC568;
        block[4] = v12;
        id v19 = v6;
        dispatch_async(v15, block);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

uint64_t __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke_115(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 24);
  }
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, *(void *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextHandlerQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)deregisterForAppLaunchWithToken:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    lock = self->_lock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke;
    v7[3] = &unk_1E65D7328;
    id v8 = v4;
    [(_PASLock *)lock runWithLockAcquired:v7];
  }
}

void __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 24))
  {
    v2 = *(void **)(a2 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_2;
    v3[3] = &unk_1E65D7300;
    id v4 = *(id *)(a1 + 32);
    [v2 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

void __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_3;
  v7[3] = &unk_1E65D72D8;
  id v8 = *(id *)(a1 + 32);
  id v5 = a3;
  v6 = [v4 predicateWithBlock:v7];
  [v5 filterUsingPredicate:v6];
}

uint64_t __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 8);
  }
  else {
    v2 = 0;
  }
  return [v2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (id)registerForAppLaunchWithBundleId:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PPAppLaunchMonitor.m", 100, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PPAppLaunchMonitor.m", 101, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__10938;
  v30 = __Block_byref_object_dispose__10939;
  id v31 = 0;
  lock = self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PPAppLaunchMonitor_registerForAppLaunchWithBundleId_queue_handler___block_invoke;
  v21[3] = &unk_1E65D72B0;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  id v15 = v12;
  id v24 = v15;
  id v16 = v9;
  id v23 = v16;
  v25 = &v26;
  [(_PASLock *)lock runWithLockAcquired:v21];
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __69__PPAppLaunchMonitor_registerForAppLaunchWithBundleId_queue_handler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = v3;
  id v32 = v5;
  if (v4 && !*((unsigned char *)v5 + 24))
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v32 + 1);
    *((void *)v32 + 1) = v6;

    *((void *)v32 + 2) = 1;
    *((unsigned char *)v32 + 24) = 1;
    uint64_t v8 = [MEMORY[0x1E4F5B6A8] userContext];
    id v9 = (void *)*((void *)v32 + 4);
    *((void *)v32 + 4) = v8;

    id v10 = [MEMORY[0x1E4F5B6B8] keyPathForAppDataDictionary];
    id v11 = [MEMORY[0x1E4F5B6E8] predicateForChangeAtKeyPath:v10];
    aBlock.receiver = (id)MEMORY[0x1E4F143A8];
    aBlock.super_class = (Class)3221225472;
    v34 = __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke;
    v35 = &unk_1E65D7350;
    id v36 = v32;
    id v37 = v10;
    uint64_t v38 = v4;
    id v12 = v10;
    id v13 = _Block_copy(&aBlock);
    id v14 = [MEMORY[0x1E4F5B6C8] localNonWakingRegistrationWithIdentifier:@"com.apple.proactive.PersonalizationPortrait.AppLaunch" contextualPredicate:v11 clientIdentifier:@"com.apple.proactive.PersonalizationPortrait" callback:v13];
    [*((id *)v32 + 4) registerCallback:v14];
  }
  id v15 = NSNumber;
  ++*((void *)v32 + 2);
  id v16 = objc_msgSend(v15, "numberWithUnsignedInteger:");
  id v17 = [PPAppLaunchMonitorRegistrationContext alloc];
  v18 = (void *)a1[5];
  id v19 = (void *)a1[7];
  id v20 = v16;
  id v21 = v18;
  id v22 = v19;
  id v23 = v22;
  if (v17)
  {
    if (v20)
    {
      if (v22) {
        goto LABEL_7;
      }
    }
    else
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:sel_initWithToken_queue_handler_, v17, @"PPAppLaunchMonitor.m", 43, @"Invalid parameter not satisfying: %@", @"token != nil" object file lineNumber description];

      if (v23) {
        goto LABEL_7;
      }
    }
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:sel_initWithToken_queue_handler_, v17, @"PPAppLaunchMonitor.m", 44, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_7:
    aBlock.receiver = v17;
    aBlock.super_class = (Class)PPAppLaunchMonitorRegistrationContext;
    id v24 = (PPAppLaunchMonitorRegistrationContext *)objc_msgSendSuper2(&aBlock, sel_init);
    id v17 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_token, v16);
      objc_storeStrong((id *)&v17->_queue, v18);
      v25 = _Block_copy(v23);
      id handler = v17->_handler;
      v17->_id handler = v25;
    }
  }

  __int16 v27 = [*((id *)v32 + 1) objectForKeyedSubscript:a1[6]];
  if (!v27) {
    __int16 v27 = objc_opt_new();
  }
  [v27 addObject:v17];
  [*((id *)v32 + 1) setObject:v27 forKeyedSubscript:a1[6]];
  uint64_t v28 = *(void *)(a1[8] + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v20;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)PPAppLaunchMonitor;
  v2 = [(PPAppLaunchMonitor *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    uint64_t v7 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.appLaunchMonitorQueue" qosClass:17];
    contextHandlerQueue = v2->_contextHandlerQueue;
    v2->_contextHandlerQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PPAppLaunchMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_10975 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_10975, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_10976;
  return v2;
}

void __36__PPAppLaunchMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v4 = (void *)sharedInstance__pasExprOnceResult_10976;
  sharedInstance__pasExprOnceResult_10976 = v3;
}

@end