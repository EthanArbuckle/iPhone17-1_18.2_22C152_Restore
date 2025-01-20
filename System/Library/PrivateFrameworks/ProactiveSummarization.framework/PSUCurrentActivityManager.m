@interface PSUCurrentActivityManager
+ (PSUCurrentActivityManager)sharedInstance;
- (BOOL)_hasLayoutInfo;
- (BOOL)_isAppVisibleWithBundleId:(id)a3;
- (PSUCurrentActivityManager)init;
- (void)_visibilityForAppWithBundleId:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)fetchUserActivityContentIdentifiersForBundleId:(id)a3 completionHandler:(id)a4;
- (void)prewarm;
@end

@implementation PSUCurrentActivityManager

- (void).cxx_destruct
{
}

- (BOOL)_isAppVisibleWithBundleId:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v20 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v4 = [(FBSDisplayLayoutMonitor *)self->_monitor currentLayout];
  v5 = [v4 elements];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v23 = *(void *)v25;
    uint64_t v9 = *MEMORY[0x263F3F560];
    uint64_t v10 = *MEMORY[0x263F3F568];
    uint64_t v22 = *MEMORY[0x263F3F558];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = [v12 identifier];
        if ([v13 isEqualToString:v9]) {
          goto LABEL_15;
        }
        v14 = [v12 identifier];
        if ([v14 isEqualToString:v10])
        {

LABEL_15:
          goto LABEL_16;
        }
        v15 = [v12 identifier];
        char v16 = [v15 isEqualToString:v22];

        if (v16) {
          goto LABEL_16;
        }
        if ([v12 conformsToProtocol:&unk_27087C080])
        {
          v17 = [v12 bundleIdentifier];
          char v18 = [v17 isEqualToString:v20];

          v8 |= v18;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_16:
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_hasLayoutInfo
{
  v2 = [(FBSDisplayLayoutMonitor *)self->_monitor currentLayout];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_visibilityForAppWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, BOOL))a4;
  if ([(PSUCurrentActivityManager *)self _hasLayoutInfo])
  {
    v7[2](v7, [(PSUCurrentActivityManager *)self _isAppVisibleWithBundleId:v6]);
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    uint64_t v9 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__PSUCurrentActivityManager__visibilityForAppWithBundleId_completionHandler___block_invoke;
    block[3] = &unk_26547F9C8;
    v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_after(v8, v9, block);
  }
}

uint64_t __77__PSUCurrentActivityManager__visibilityForAppWithBundleId_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) _isAppVisibleWithBundleId:*(void *)(a1 + 40)];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)fetchUserActivityContentIdentifiersForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke;
  v10[3] = &unk_26547F978;
  v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(PSUCurrentActivityManager *)self _visibilityForAppWithBundleId:v8 completionHandler:v10];
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    BOOL v3 = (void *)MEMORY[0x263F018D0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_2;
    v8[3] = &unk_26547F9A0;
    id v11 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v9 = v4;
    uint64_t v10 = v5;
    [v3 _currentUserActivityProxiesWithOptions:0 matching:0 completionHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v7, 0);
  }
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_3;
    v34[3] = &unk_26547F928;
    id v35 = *(id *)(a1 + 32);
    uint64_t v6 = objc_msgSend(a2, "_pas_filteredArrayWithTest:", v34);
    if ([v6 count])
    {
      uint64_t v22 = a1;
      id v7 = dispatch_group_create();
      id v8 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = v6;
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            dispatch_group_enter(v7);
            v14 = (void *)MEMORY[0x263F018D0];
            v15 = [v13 uuid];
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_4;
            v27[3] = &unk_26547F950;
            v27[4] = v13;
            id v28 = v8;
            uint64_t v29 = v7;
            [v14 _fetchUserActivityWithUUID:v15 completionHandler:v27];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v10);
      }

      char v16 = (void *)MEMORY[0x263F61E38];
      qos_class_t v17 = qos_class_self();
      char v18 = dispatch_get_global_queue(v17, 0);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_11;
      v24[3] = &unk_26547F978;
      id v19 = *(id *)(v22 + 48);
      id v25 = v8;
      id v26 = v19;
      v24[4] = *(void *)(v22 + 40);
      id v20 = v8;
      [v16 notifyGroup:v7 onQueue:v18 withTimeout:v24 block:5.0];
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 48);
      id v7 = objc_opt_new();
      (*(void (**)(uint64_t, NSObject *, void))(v21 + 16))(v21, v7, 0);
    }
  }
}

uint64_t __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PSUSummarizationLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = [*(id *)(a1 + 32) uuid];
      int v13 = 138412546;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl(&dword_25A8BB000, v7, OS_LOG_TYPE_ERROR, "Could not fetch user activity for UUID: %@; error: %@",
        (uint8_t *)&v13,
        0x16u);
    }
  }
  id v8 = [v5 targetContentIdentifier];

  if (v8)
  {
    id v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = [v5 targetContentIdentifier];
    [v10 addObject:v11];

    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __94__PSUCurrentActivityManager_fetchUserActivityContentIdentifiersForBundleId_completionHandler___block_invoke_11(uint64_t a1, char a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id obj = *(id *)(a1 + 40);
    objc_sync_enter(obj);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_sync_exit(obj);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = (void *)MEMORY[0x263F087E8];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"Timed out";
    id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = [v4 errorWithDomain:v6 code:-1 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v8);
  }
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_monitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PSUCurrentActivityManager;
  [(PSUCurrentActivityManager *)&v3 dealloc];
}

- (void)prewarm
{
  id v2 = (id)[(FBSDisplayLayoutMonitor *)self->_monitor currentLayout];
}

- (PSUCurrentActivityManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSUCurrentActivityManager;
  id v2 = [(PSUCurrentActivityManager *)&v7 init];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    uint64_t v4 = [MEMORY[0x263F3F728] monitorWithConfiguration:v3];
    monitor = v2->_monitor;
    v2->_monitor = (FBSDisplayLayoutMonitor *)v4;
  }
  return v2;
}

+ (PSUCurrentActivityManager)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_34);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult;
  return (PSUCurrentActivityManager *)v2;
}

void __43__PSUCurrentActivityManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x26114B190]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end