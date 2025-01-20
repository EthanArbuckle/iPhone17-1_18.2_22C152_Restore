@interface RMConfigurationSubscriberDelegate
+ (id)sharedDelegateWithApplicators:(id)a3;
- (NSDictionary)applicatorClassNameByConfigurationType;
- (OS_dispatch_queue)applicatorQueue;
- (RMConfigurationSubscriberDelegate)initWithApplicators:(id)a3;
- (id)_configurationsByApplicatorClassNameForConfigurationsByType:(id)a3;
- (void)_sendConfigurationUIForConfigurationReference:(id)a3 visible:(BOOL)a4 configurationUI:(id)a5 configurationUIGroup:(id)a6;
- (void)didFailToFetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 error:(id)a5;
- (void)didFetchConfigurationsByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)didFetchConfigurationsWithVisibleUIByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)setApplicatorQueue:(id)a3;
@end

@implementation RMConfigurationSubscriberDelegate

+ (id)sharedDelegateWithApplicators:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__RMConfigurationSubscriberDelegate_sharedDelegateWithApplicators___block_invoke;
  block[3] = &unk_26548F640;
  id v9 = v3;
  uint64_t v4 = sharedDelegateWithApplicators__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedDelegateWithApplicators__onceToken, block);
  }
  id v6 = (id)sharedDelegateWithApplicators__delegate;

  return v6;
}

uint64_t __67__RMConfigurationSubscriberDelegate_sharedDelegateWithApplicators___block_invoke(uint64_t a1)
{
  sharedDelegateWithApplicators__delegate = [[RMConfigurationSubscriberDelegate alloc] initWithApplicators:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (RMConfigurationSubscriberDelegate)initWithApplicators:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RMConfigurationSubscriberDelegate;
  id v5 = [(RMConfigurationSubscriberDelegate *)&v29 init];
  id v6 = v5;
  if (v5)
  {
    v27 = v5;
    id v28 = v4;
    id v7 = v4;
    v8 = (NSDictionary *)objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(objc_class **)(*((void *)&v34 + 1) + 8 * i);
          v15 = NSStringFromClass(v14);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v16 = [(objc_class *)v14 supportedConfigurationTypes];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v16);
                }
                -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, *(void *)(*((void *)&v30 + 1) + 8 * j), v27);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v18);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    id v6 = v27;
    applicatorClassNameByConfigurationType = v27->_applicatorClassNameByConfigurationType;
    v27->_applicatorClassNameByConfigurationType = v8;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.rmstore.applicator", 0);
    applicatorQueue = v27->_applicatorQueue;
    v27->_applicatorQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    applyLock = v27->_applyLock;
    v27->_applyLock = (NSConditionLock *)v24;

    id v4 = v28;
  }

  return v6;
}

- (void)didFetchConfigurationsByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v10;
    _os_log_impl(&dword_25B003000, v13, OS_LOG_TYPE_DEFAULT, "Did fetch configurations by type: %{public}@", buf, 0xCu);
  }

  v14 = self->_applyLock;
  if (![(NSConditionLock *)v14 tryLockWhenCondition:0])
  {
    v15 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25B003000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for previous fetch to finish...", buf, 2u);
    }

    [(NSConditionLock *)v14 lockWhenCondition:0];
  }
  [(NSConditionLock *)v14 unlockWithCondition:1];
  v16 = [(RMConfigurationSubscriberDelegate *)self _configurationsByApplicatorClassNameForConfigurationsByType:v10];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke;
  v24[3] = &unk_26548F6B8;
  id v25 = v11;
  int64_t v26 = a5;
  v24[4] = self;
  id v17 = v11;
  [v16 enumerateKeysAndObjectsUsingBlock:v24];
  uint64_t v18 = [(RMConfigurationSubscriberDelegate *)self applicatorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_12;
  block[3] = &unk_26548F6E0;
  dispatch_queue_t v22 = v14;
  id v23 = v12;
  id v19 = v12;
  v20 = v14;
  dispatch_async(v18, block);
}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) applicatorQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v11[3] = &unk_26548F690;
  v8 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  Class v2 = NSClassFromString(*(NSString **)(a1 + 32));
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 56));
    id v7 = [(objc_class *)v2 supportedConfigurationTypes];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v5;
    __int16 v19 = 2114;
    v20 = v6;
    __int16 v21 = 2114;
    dispatch_queue_t v22 = v7;
    _os_log_impl(&dword_25B003000, v4, OS_LOG_TYPE_DEFAULT, "Applicator %{public}@ in %{public}@ scope starting processing configurations of types: %{public}@", buf, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_9;
  v13[3] = &unk_26548F668;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v14 = v11;
  uint64_t v15 = v12;
  Class v16 = v2;
  [v3 applyConfigurations:v8 storesByIdentifier:v9 scope:v10 completionHandler:v13];
}

void __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  Class v2 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 40));
    uint64_t v5 = [*(id *)(a1 + 48) supportedConfigurationTypes];
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_25B003000, v2, OS_LOG_TYPE_DEFAULT, "Applicator %{public}@ in %{public}@ scope finished processing configurations of types: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t __109__RMConfigurationSubscriberDelegate_didFetchConfigurationsByType_storesByIdentifier_scope_completionHandler___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) lockWhenCondition:1];
  Class v2 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_25B003000, v2, OS_LOG_TYPE_DEFAULT, "Fetching complete.", v4, 2u);
  }

  [*(id *)(a1 + 32) unlockWithCondition:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)didFailToFetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = objc_msgSend(NSString, "rms_stringWithScope:", a4);
    int v11 = 138543874;
    uint64_t v12 = v10;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_25B003000, v9, OS_LOG_TYPE_DEFAULT, "Did fail in %{public}@ scope to fetch configurations %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)didFetchConfigurationsWithVisibleUIByType:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_25B003000, v13, OS_LOG_TYPE_DEFAULT, "Fetch configurationUIs by type: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v14 = self->_applyLock;
  if (![(NSConditionLock *)v14 tryLockWhenCondition:0])
  {
    __int16 v15 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_25B003000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for previous fetch UIs to finish...", (uint8_t *)&buf, 2u);
    }

    [(NSConditionLock *)v14 lockWhenCondition:0];
  }
  [(NSConditionLock *)v14 unlockWithCondition:1];
  id v16 = [(RMConfigurationSubscriberDelegate *)self _configurationsByApplicatorClassNameForConfigurationsByType:v10];
  dispatch_group_t v17 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__1;
  long long v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke;
  v26[3] = &unk_26548F758;
  uint64_t v18 = v17;
  v27 = v18;
  id v28 = self;
  p_long long buf = &buf;
  int64_t v30 = a5;
  [v16 enumerateKeysAndObjectsUsingBlock:v26];
  __int16 v19 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2_17;
  block[3] = &unk_26548F780;
  uint64_t v23 = v14;
  id v24 = v12;
  id v25 = &buf;
  id v20 = v12;
  __int16 v21 = v14;
  dispatch_group_notify(v18, v19, block);

  _Block_object_dispose(&buf, 8);
}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v7 = [*(id *)(a1 + 40) applicatorQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v11[3] = &unk_26548F730;
  uint64_t v16 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    Class v2 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v2);
    return;
  }
  Class v3 = NSClassFromString(*(NSString **)(a1 + 40));
  id v20 = objc_opt_new();
  char v4 = objc_opt_respondsToSelector();
  id v5 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 72));
      id v9 = [(objc_class *)v3 supportedConfigurationTypes];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v30 = v7;
      __int16 v31 = 2114;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      long long v34 = v9;
      id v10 = "Applicator %{public}@ in %{public}@ scope processes configurationUIs of types: %{public}@";
LABEL_21:
      _os_log_debug_impl(&dword_25B003000, v5, OS_LOG_TYPE_DEBUG, v10, buf, 0x20u);
    }
  }
  else if (v6)
  {
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend(NSString, "rms_stringWithScope:", *(void *)(a1 + 72));
    id v9 = [(objc_class *)v3 supportedConfigurationTypes];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    long long v34 = v9;
    id v10 = "Applicator %{public}@ in %{public}@ scope does not process configurationUIs of types: %{public}@";
    goto LABEL_21;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (v4)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_15;
          v21[3] = &unk_26548F708;
          uint64_t v17 = *(void *)(a1 + 72);
          uint64_t v18 = *(void *)(a1 + 56);
          uint64_t v23 = *(void *)(a1 + 64);
          v21[4] = v18;
          v21[5] = v16;
          id v22 = *(id *)(a1 + 32);
          [v20 configurationUIForConfiguration:v16 scope:v17 completionHandler:v21];
        }
        else
        {
          [*(id *)(a1 + 56) _sendConfigurationUIForConfigurationReference:*(void *)(*((void *)&v24 + 1) + 8 * i) visible:0 configurationUI:0 configurationUIGroup:*(void *)(a1 + 32)];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  }
  else {
    [*(id *)(a1 + 32) _sendConfigurationUIForConfigurationReference:*(void *)(a1 + 40) visible:a2 configurationUI:a3 configurationUIGroup:*(void *)(a1 + 48)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __122__RMConfigurationSubscriberDelegate_didFetchConfigurationsWithVisibleUIByType_storesByIdentifier_scope_completionHandler___block_invoke_2_17(uint64_t a1)
{
  [*(id *)(a1 + 32) lockWhenCondition:1];
  Class v2 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_25B003000, v2, OS_LOG_TYPE_DEFAULT, "Fetching configuration UIs complete.", v4, 2u);
  }

  [*(id *)(a1 + 32) unlockWithCondition:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_configurationsByApplicatorClassNameForConfigurationsByType:(id)a3
{
  char v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  BOOL v6 = [(RMConfigurationSubscriberDelegate *)self applicatorClassNameByConfigurationType];
  uint64_t v7 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__RMConfigurationSubscriberDelegate__configurationsByApplicatorClassNameForConfigurationsByType___block_invoke;
  v12[3] = &unk_26548F7A8;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __97__RMConfigurationSubscriberDelegate__configurationsByApplicatorClassNameForConfigurationsByType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 applicatorClassNameByConfigurationType];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    if (!v9)
    {
      id v9 = objc_opt_new();
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v8];
    }
    [v9 addObjectsFromArray:v10];
  }
}

- (void)_sendConfigurationUIForConfigurationReference:(id)a3 visible:(BOOL)a4 configurationUI:(id)a5 configurationUIGroup:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = a6;
  id v13 = [v10 store];
  dispatch_group_enter(v12);
  uint64_t v14 = [(RMConfigurationSubscriberDelegate *)self applicatorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke;
  block[3] = &unk_26548F7D0;
  id v20 = v13;
  id v21 = v10;
  BOOL v24 = a4;
  id v22 = v11;
  uint64_t v23 = v12;
  uint64_t v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke(uint64_t a1)
{
  Class v2 = *(void **)(a1 + 32);
  Class v3 = [*(id *)(a1 + 40) declaration];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2;
  v6[3] = &unk_26548F280;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 setConfigurationUI:v3 visible:v4 ui:v5 completionHandler:v6];
}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F635B0] configurationSubscriberDelegate];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NSDictionary)applicatorClassNameByConfigurationType
{
  return self->_applicatorClassNameByConfigurationType;
}

- (OS_dispatch_queue)applicatorQueue
{
  return self->_applicatorQueue;
}

- (void)setApplicatorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicatorQueue, 0);
  objc_storeStrong((id *)&self->_applicatorClassNameByConfigurationType, 0);
  objc_storeStrong((id *)&self->_applyLock, 0);
}

void __128__RMConfigurationSubscriberDelegate__sendConfigurationUIForConfigurationReference_visible_configurationUI_configurationUIGroup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25B003000, a2, OS_LOG_TYPE_ERROR, "Failed to update configuration UI: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end