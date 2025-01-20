@interface RMObserverStore
+ (BOOL)supportsSecureCoding;
+ (void)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
+ (void)storesWithCompletionHandler:(id)a3;
+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStore:(id)a3;
- (void)displayPropertiesForConfigurationsWithCompletionHandler:(id)a3;
- (void)displayableProfileConfigurationsWithCompletionHandler:(id)a3;
@end

@implementation RMObserverStore

+ (void)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v9 resume];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v18[3] = &unk_26548F148;
  id v10 = v7;
  id v19 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v18];
  v12 = +[RMStoreXPCConnection storeXPCConnection:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3;
  v15[3] = &unk_26548F928;
  id v16 = v12;
  id v17 = v10;
  id v13 = v12;
  id v14 = v10;
  [v11 observerStoreWithIdentifier:v8 completionHandler:v15];
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched store", v8, 2u);
    }
    [v5 setXpcConnection:*(void *)(a1 + 32)];
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

+ (void)storesWithCompletionHandler:(id)a3
{
}

+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[RMStoreXPCProxy newConnectionWithScope:a3];
  [v6 resume];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__RMObserverStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_26548F148;
  id v7 = v5;
  id v16 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v15];
  id v9 = +[RMStoreXPCConnection storeXPCConnection:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5;
  v12[3] = &unk_26548F1E8;
  id v13 = v9;
  id v14 = v7;
  id v10 = v9;
  id v11 = v7;
  [v8 observerStoresWithCompletionHandler:v12];
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched stores", buf, 2u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setXpcConnection:", *(void *)(a1 + 32), (void)v13);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v10);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)displayPropertiesForConfigurationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  uint64_t v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7;
  v11[3] = &unk_26548F1E8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 configurationUIsForStoreIdentifier:v9 completionHandler:v11];
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched configuration UIs: %lu", (uint8_t *)&v8, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)displayableProfileConfigurationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  int v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  uint64_t v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8;
  v11[3] = &unk_26548F1E8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 displayableProfileConfigurationsForStoreIdentifier:v9 completionHandler:v11];
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = [v5 count];
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched profile configurations: %lu", (uint8_t *)&v8, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMObserverStore *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMObserverStore *)self isEqualToStore:v4];
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMObserverStore;
  return [(RMBaseStore *)&v4 isEqualToStore:a3];
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching store: %{public}@", v1, v2, v3, v4, v5);
}

void __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch store: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching stores: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMObserverStore_storesWithScope_completionHandler___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch stores: %{public}@", v1, v2, v3, v4, v5);
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching configuration UIs: %{public}@", v1, v2, v3, v4, v5);
}

void __75__RMObserverStore_displayPropertiesForConfigurationsWithCompletionHandler___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch configuration UIs: %{public}@", v1, v2, v3, v4, v5);
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching profile configurations: %{public}@", v1, v2, v3, v4, v5);
}

void __73__RMObserverStore_displayableProfileConfigurationsWithCompletionHandler___block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch profile configurations: %{public}@", v1, v2, v3, v4, v5);
}

@end