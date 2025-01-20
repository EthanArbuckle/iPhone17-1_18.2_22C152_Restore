@interface RMProviderStore
+ (BOOL)supportsSecureCoding;
+ (RMProviderStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
+ (void)createStoreWithType:(int64_t)a3 scope:(int64_t)a4 defaultToInteractive:(BOOL)a5 dataSeparated:(BOOL)a6 options:(id)a7 completionHandler:(id)a8;
+ (void)removeStoreWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStore:(id)a3;
- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)applyChangesWithCompletionHandler:(id)a3;
- (void)deleteDeclarationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)saveDeclaration:(id)a3 completionHandler:(id)a4;
@end

@implementation RMProviderStore

+ (void)createStoreWithType:(int64_t)a3 scope:(int64_t)a4 defaultToInteractive:(BOOL)a5 dataSeparated:(BOOL)a6 options:(id)a7 completionHandler:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v15 resume];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke;
  v24[3] = &unk_26548F148;
  id v16 = v13;
  id v25 = v16;
  v17 = [v15 remoteObjectProxyWithErrorHandler:v24];
  v18 = +[RMStoreXPCConnection storeXPCConnection:v15];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_12;
  v21[3] = &unk_26548F958;
  id v22 = v18;
  id v23 = v16;
  id v19 = v18;
  id v20 = v16;
  [v17 createStoreWithType:a3 defaultToInteractive:v10 dataSeparated:v9 options:v14 completionHandler:v21];
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_12_cold_1();
    }
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Created store", v8, 2u);
    }
    [v5 setXpcConnection:*(void *)(a1 + 32)];
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

+ (void)removeStoreWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v9 resume];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke;
  v17[3] = &unk_26548F148;
  id v10 = v7;
  id v18 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_14;
  v14[3] = &unk_26548F578;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 removeStoreWithIdentifier:v8 completionHandler:v14];
}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_14_cold_1();
    }
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Removed store", v5, 2u);
    }
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

+ (RMProviderStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v9 resume];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v19[3] = &unk_26548F148;
  id v10 = v7;
  id v20 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v19];
  id v12 = +[RMStoreXPCConnection storeXPCConnection:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke_15;
  v16[3] = &unk_26548F958;
  id v17 = v12;
  id v18 = v10;
  id v13 = v12;
  id v14 = v10;
  [v11 providerStoreWithIdentifier:v8 completionHandler:v16];

  return result;
}

void __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__RMProviderStore_storeWithIdentifier_scope_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
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

+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[RMStoreXPCProxy newConnectionWithScope:a3];
  [v6 resume];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__RMProviderStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_26548F148;
  id v7 = v5;
  id v16 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v15];
  id v9 = +[RMStoreXPCConnection storeXPCConnection:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__RMProviderStore_storesWithScope_completionHandler___block_invoke_16;
  v12[3] = &unk_26548F1E8;
  id v13 = v9;
  id v14 = v7;
  id v10 = v9;
  id v11 = v7;
  [v8 providerStoresWithCompletionHandler:v12];
}

void __53__RMProviderStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RMProviderStore_storesWithScope_completionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
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

- (void)applyChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  uint64_t v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_18;
  v11[3] = &unk_26548F0D0;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 applyChangesForStoreIdentifier:v9 completionHandler:v11];
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_18_cold_1();
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Applied changes for store", v5, 2u);
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)deleteDeclarationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RMBaseStore *)self xpcConnection];
  uint64_t v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_19;
  v14[3] = &unk_26548F0D0;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 deleteDeclarationWithIdentifier:v7 storeIdentifier:v12 completionHandler:v14];
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_19_cold_1();
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Deleted declaration", v5, 2u);
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)saveDeclaration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RMBaseStore *)self xpcConnection];
  uint64_t v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_20;
  v14[3] = &unk_26548F0D0;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 saveDeclaration:v7 storeIdentifier:v12 completionHandler:v14];
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_20_cold_1();
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Saved declaration", v5, 2u);
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
  [*(id *)(a1 + 32) xpcConnection];
}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(RMBaseStore *)self xpcConnection];
  uint64_t v11 = [v10 connection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke;
  v25[3] = &unk_26548F280;
  id v12 = v9;
  id v26 = v12;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v25];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  id v14 = [(RMBaseStore *)self identifier];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_21;
  v18[3] = &unk_26548FB08;
  v18[4] = &v19;
  [v13 setMetadataValue:v8 forKey:v12 storeIdentifier:v14 completionHandler:v18];

  uint64_t v15 = v20[5];
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[RMProviderStore setMetadataValue:forKey:error:]();
      if (!a5) {
        goto LABEL_8;
      }
    }
    else if (!a5)
    {
      goto LABEL_8;
    }
    long long v16 = (void *)v20[5];
    if (v16) {
      *a5 = v16;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    -[RMProviderStore setMetadataValue:forKey:error:]();
  }
LABEL_8:
  _Block_object_dispose(&v19, 8);

  return v15 == 0;
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_cold_1(a1, a2);
  }
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_21(uint64_t a1, void *a2)
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMProviderStore *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMProviderStore *)self isEqualToStore:v4];
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMProviderStore;
  return [(RMBaseStore *)&v4 isEqualToStore:a3];
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while creating store: %{public}@", v1, v2, v3, v4, v5);
}

void __106__RMProviderStore_createStoreWithType_scope_defaultToInteractive_dataSeparated_options_completionHandler___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to create store: %{public}@", v1, v2, v3, v4, v5);
}

void __69__RMProviderStore_removeStoreWithIdentifier_scope_completionHandler___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to remove store: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while applying changes for store: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMProviderStore_applyChangesWithCompletionHandler___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to apply changes for store: %{public}@", v1, v2, v3, v4, v5);
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while deleting declaration: %{public}@", v1, v2, v3, v4, v5);
}

void __69__RMProviderStore_deleteDeclarationWithIdentifier_completionHandler___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to delete declaration: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while saving declaration: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMProviderStore_saveDeclaration_completionHandler___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to save declaration: %{public}@", v1, v2, v3, v4, v5);
}

- (void)setMetadataValue:forKey:error:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v2 = 2114;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Set metadata key %{public}@: %{public}@", v1, 0x16u);
}

- (void)setMetadataValue:forKey:error:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  __int16 v2 = 2114;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to set metadata key %{public}@: %{public}@", v1, 0x16u);
}

void __49__RMProviderStore_setMetadataValue_forKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed XPC connection while setting metadata key %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end