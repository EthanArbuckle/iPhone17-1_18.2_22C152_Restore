@interface RMSubscriberStore
+ (BOOL)supportsSecureCoding;
+ (RMSubscriberStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
+ (void)storesWithScope:(int64_t)a3 completionHandler:(id)a4;
+ (void)subscribedStoreConfigurationsVisibleUIWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5;
+ (void)subscribedStoreDeclarationsWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5;
+ (void)unassignAssets:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStore:(id)a3;
- (BOOL)isValidStatusItem:(Class)a3;
- (id)_reasonsFromErrorWithFirstReason:(id)a3 error:(id)a4;
- (void)_removeStatusForDeclarationIdentifier:(id)a3 declarationServerToken:(id)a4 completionHandler:(id)a5;
- (void)_writeStatusForDeclaration:(id)a3 validity:(BOOL)a4 reasons:(id)a5 completionHandler:(id)a6;
- (void)assetCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)assetCannotBeDownloaded:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)assetCannotBeVerified:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)assetEncounteredInternalError:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)assetSuccessfullyResolved:(id)a3 completionHandler:(id)a4;
- (void)certificatePersistentRefForAssetKey:(id)a3 completionHandler:(id)a4;
- (void)certificateStatusWithCompletionHandler:(id)a3;
- (void)configurationCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)configurationErrorReasons:(id)a3 reasons:(id)a4 completionHandler:(id)a5;
- (void)configurationFailedAlreadyPresent:(id)a3 completionHandler:(id)a4;
- (void)configurationFailedToApply:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)configurationIsInvalid:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)configurationNotSupported:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)configurationSuccessfullyApplied:(id)a3 completionHandler:(id)a4;
- (void)configurationSuccessfullyApplied:(id)a3 reasons:(id)a4 completionHandler:(id)a5;
- (void)publishStatus:(id)a3 completionHandler:(id)a4;
- (void)resolveAsset:(id)a3 completionHandler:(id)a4;
- (void)setConfigurationUI:(id)a3 visible:(BOOL)a4 ui:(id)a5 completionHandler:(id)a6;
@end

@implementation RMSubscriberStore

+ (RMSubscriberStore)storeWithIdentifier:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v9 resume];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke;
  v19[3] = &unk_26548F148;
  id v10 = v7;
  id v20 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v19];
  v12 = +[RMStoreXPCConnection storeXPCConnection:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke_3;
  v16[3] = &unk_26548FD60;
  id v17 = v12;
  id v18 = v10;
  id v13 = v12;
  id v14 = v10;
  [v11 subscriberStoreWithIdentifier:v8 completionHandler:v16];

  return result;
}

void __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__RMSubscriberStore_storeWithIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  v15[2] = __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke;
  v15[3] = &unk_26548F148;
  id v7 = v5;
  id v16 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v15];
  id v9 = +[RMStoreXPCConnection storeXPCConnection:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke_5;
  v12[3] = &unk_26548F1E8;
  id v13 = v9;
  id v14 = v7;
  id v10 = v9;
  id v11 = v7;
  [v8 subscriberStoresWithCompletionHandler:v12];
}

void __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __63__RMObserverStore_storeWithIdentifier_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__RMSubscriberStore_storesWithScope_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

+ (void)subscribedStoreDeclarationsWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a3];
  [v9 resume];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke;
  v18[3] = &unk_26548F148;
  id v10 = v7;
  id v19 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v18];
  v12 = +[RMStoreXPCConnection storeXPCConnection:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7;
  v15[3] = &unk_26548FD88;
  id v16 = v12;
  id v17 = v10;
  id v13 = v12;
  id v14 = v10;
  [v11 subscribedStoreDeclarationsWithTypes:v8 completionHandler:v15];
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7_cold_1();
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched stores and declarations", buf, 2u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "setXpcConnection:", *(void *)(a1 + 32), (void)v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

+ (void)subscribedStoreConfigurationsVisibleUIWithScope:(int64_t)a3 configurationTypes:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a3];
  [v9 resume];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke;
  v18[3] = &unk_26548F148;
  id v10 = v7;
  id v19 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v18];
  uint64_t v12 = +[RMStoreXPCConnection storeXPCConnection:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9;
  v15[3] = &unk_26548FD88;
  id v16 = v12;
  id v17 = v10;
  id v13 = v12;
  id v14 = v10;
  [v11 subscribedStoreConfigurationsVisibleUIWithTypes:v8 completionHandler:v15];
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9_cold_1();
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched stores and configurations with visible UI", buf, 2u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "setXpcConnection:", *(void *)(a1 + 32), (void)v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

- (void)resolveAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RMBaseStore *)self xpcConnection];
  id v9 = [v8 connection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke;
  v19[3] = &unk_26548F148;
  id v10 = v7;
  id v20 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v19];

  if ([v6 resolveAs] != 1)
  {
LABEL_6:
    long long v15 = [(RMBaseStore *)self identifier];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12;
    v17[3] = &unk_26548FDB0;
    v17[4] = self;
    id v18 = v10;
    [v11 resolveAsset:v6 storeIdentifier:v15 completionHandler:v17];

    long long v16 = v18;
    goto LABEL_7;
  }
  uint64_t v12 = (void *)MEMORY[0x263F635C8];
  uint64_t v13 = [v6 downloadURL];
  uint64_t v14 = [v12 tokenForURL:v13];

  if (v14)
  {
    [v6 addExtensionToken:v14];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      -[RMSubscriberStore resolveAsset:completionHandler:](v6);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[RMSubscriberStore resolveAsset:completionHandler:]();
  }
  long long v16 = [MEMORY[0x263F63598] createInternalError];
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
LABEL_7:
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Resolved asset", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

+ (void)unassignAssets:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[RMStoreXPCProxy newConnectionWithScope:a4];
  [v9 resume];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke;
  v17[3] = &unk_26548F148;
  id v10 = v7;
  id v18 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14;
  v14[3] = &unk_26548F0D0;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  [v11 unassignAssets:v8 completionHandler:v14];
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14_cold_1();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Unassigned assets", v4, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)assetCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.AssetCannotBeDeserialized" description:@"Asset cannot be deserialized" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)assetCannotBeDownloaded:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.AssetCannotBeDownloaded" description:@"Asset cannot be downloaded" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)assetCannotBeVerified:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.AssetCannotBeVerified" description:@"Asset cannot be verified" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)assetEncounteredInternalError:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.AssetEncounteredInternalError" description:@"Asset encountered an internal error" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)assetSuccessfullyResolved:(id)a3 completionHandler:(id)a4
{
}

- (void)configurationCannotBeDeserialized:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.ConfigurationCannotBeDeserialized" description:@"Configuration cannot be deserialized" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)configurationFailedToApply:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.ConfigurationCannotBeApplied" description:@"Configuration cannot be applied" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)configurationFailedAlreadyPresent:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x263F63688];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 reasonWithCode:@"Error.ConfigurationAlreadyPresent" description:@"Configuration cannot be applied as another is already present" underlyingError:0];
  id v10 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v9 error:0];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v8 validity:0 reasons:v10 completionHandler:v7];
}

- (void)configurationIsInvalid:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.ConfigurationIsInvalid" description:@"Configuration is invalid" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)configurationNotSupported:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F63688];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 reasonWithCode:@"Error.ConfigurationNotSupported" description:@"Configuration not supported" underlyingError:v10];
  id v13 = [(RMSubscriberStore *)self _reasonsFromErrorWithFirstReason:v12 error:v10];

  [(RMSubscriberStore *)self _writeStatusForDeclaration:v11 validity:0 reasons:v13 completionHandler:v9];
}

- (void)configurationErrorReasons:(id)a3 reasons:(id)a4 completionHandler:(id)a5
{
}

- (void)configurationSuccessfullyApplied:(id)a3 completionHandler:(id)a4
{
}

- (void)configurationSuccessfullyApplied:(id)a3 reasons:(id)a4 completionHandler:(id)a5
{
}

- (void)certificatePersistentRefForAssetKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RMBaseStore *)self xpcConnection];
  id v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_70;
  v14[3] = &unk_26548F210;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 certificatePersistentRefForAssetKey:v7 storeIdentifier:v12 completionHandler:v14];
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_70_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched certificate  persistent ref", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)certificateStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMBaseStore *)self xpcConnection];
  id v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke;
  v13[3] = &unk_26548F148;
  id v7 = v4;
  id v14 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v13];

  id v9 = [(RMBaseStore *)self identifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_72;
  v11[3] = &unk_26548FDD8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v8 certificateStatusWithStoreIdentifier:v9 completionHandler:v11];
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_72_cold_1();
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Fetched certificate status", v8, 2u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)setConfigurationUI:(id)a3 visible:(BOOL)a4 ui:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(RMBaseStore *)self xpcConnection];
  id v14 = [v13 connection];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke;
  v26[3] = &unk_26548F148;
  id v15 = v11;
  id v27 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v26];

  id v17 = [(RMBaseStore *)self identifier];
  id v18 = [v10 declarationIdentifier];
  long long v19 = [v10 declarationServerToken];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74;
  v22[3] = &unk_26548FE00;
  v24 = self;
  id v25 = v15;
  id v23 = v10;
  id v20 = v15;
  id v21 = v10;
  [v16 setConfigurationUIWithStoreIdentifier:v17 declarationIdentifier:v18 declarationServerToken:v19 visible:v8 ui:v12 completionHandler:v22];
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74_cold_2();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74_cold_1(a1);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) xpcConnection];
}

- (void)publishStatus:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(RMBaseStore *)self xpcConnection];
  id v9 = [v8 connection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke;
  v16[3] = &unk_26548F148;
  id v10 = v6;
  id v17 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];

  id v12 = [(RMBaseStore *)self identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75;
  v14[3] = &unk_26548F0D0;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v11 publishStatusWithStoreIdentifier:v12 status:v7 completionHandler:v14];
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75_cold_2();
    }
  }
  else
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v4) {
      __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) xpcConnection];
}

- (BOOL)isValidStatusItem:(Class)a3
{
  uint64_t v5 = [MEMORY[0x263F63680] currentPlatform];
  int64_t v6 = [(RMBaseStore *)self scope];
  int64_t v7 = [(RMBaseStore *)self type];
  return [(objc_class *)a3 isSupportedForPlatform:v5 scope:v6 enrollmentType:v7];
}

- (id)_reasonsFromErrorWithFirstReason:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  uint64_t v8 = v7;
  if (v5) {
    [v7 addObject:v5];
  }
  if (v6)
  {
    uint64_t v9 = [v6 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"RMModelStatusReasons"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 addObject:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 addObjectsFromArray:v10];
      }
    }
  }
  return v8;
}

- (void)_writeStatusForDeclaration:(id)a3 validity:(BOOL)a4 reasons:(id)a5 completionHandler:(id)a6
{
  BOOL v23 = a4;
  id v9 = a6;
  id v22 = a5;
  id v10 = a3;
  uint64_t v11 = [(RMBaseStore *)self xpcConnection];
  id v12 = [v11 connection];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke;
  v26[3] = &unk_26548F148;
  id v13 = v9;
  id v27 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v26];

  id v15 = [(RMBaseStore *)self identifier];
  id v16 = [v10 declarationType];
  id v17 = [v10 declarationIdentifier];
  id v18 = [v10 declarationServerToken];

  long long v19 = [MEMORY[0x263F086E0] mainBundle];
  id v20 = [v19 bundleIdentifier];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80;
  v24[3] = &unk_26548F0D0;
  v24[4] = self;
  id v25 = v13;
  id v21 = v13;
  [v14 writeStatusWithStoreIdentifier:v15 declarationType:v16 declarationIdentifier:v17 declarationServerToken:v18 sourceIdentifier:v20 validity:v23 reasons:v22 completionHandler:v24];
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80_cold_2();
    }
  }
  else
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v4) {
      __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) xpcConnection];
}

- (void)_removeStatusForDeclarationIdentifier:(id)a3 declarationServerToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(RMBaseStore *)self xpcConnection];
  id v12 = [v11 connection];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke;
  v21[3] = &unk_26548F148;
  id v13 = v8;
  id v22 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v21];

  id v15 = [(RMBaseStore *)self identifier];
  id v16 = [MEMORY[0x263F086E0] mainBundle];
  id v17 = [v16 bundleIdentifier];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81;
  v19[3] = &unk_26548F0D0;
  void v19[4] = self;
  id v20 = v13;
  id v18 = v13;
  [v14 removeStatusWithStoreIdentifier:v15 declarationIdentifier:v10 declarationServerToken:v9 sourceIdentifier:v17 completionHandler:v19];
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81_cold_2();
    }
  }
  else
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v4) {
      __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) xpcConnection];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (RMSubscriberStore *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMSubscriberStore *)self isEqualToStore:v4];
  }

  return v5;
}

- (BOOL)isEqualToStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMSubscriberStore;
  return [(RMBaseStore *)&v4 isEqualToStore:a3];
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching stores and declarations: %{public}@", v1, v2, v3, v4, v5);
}

void __95__RMSubscriberStore_subscribedStoreDeclarationsWithScope_configurationTypes_completionHandler___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch stores and declarations: %{public}@", v1, v2, v3, v4, v5);
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching stores and configurations with missing UI: %{public}@", v1, v2, v3, v4, v5);
}

void __106__RMSubscriberStore_subscribedStoreConfigurationsVisibleUIWithScope_configurationTypes_completionHandler___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch stores and configurations with visible UI: %{public}@", v1, v2, v3, v4, v5);
}

- (void)resolveAsset:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for file: %d", (uint8_t *)v1, 8u);
}

- (void)resolveAsset:(void *)a1 completionHandler:.cold.2(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 downloadURL];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Created sandbox extension for file: %{public}@", v2, 0xCu);
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while resolving asset: %{public}@", v1, v2, v3, v4, v5);
}

void __52__RMSubscriberStore_resolveAsset_completionHandler___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to resolve: %{public}@", v1, v2, v3, v4, v5);
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while unassigning assets: %{public}@", v1, v2, v3, v4, v5);
}

void __60__RMSubscriberStore_unassignAssets_scope_completionHandler___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to unassign assets: %{public}@", v1, v2, v3, v4, v5);
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching certificate persistent ref: %{public}@", v1, v2, v3, v4, v5);
}

void __75__RMSubscriberStore_certificatePersistentRefForAssetKey_completionHandler___block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch certificate persistent ref: %{public}@", v1, v2, v3, v4, v5);
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while fetching certificate status: %{public}@", v1, v2, v3, v4, v5);
}

void __60__RMSubscriberStore_certificateStatusWithCompletionHandler___block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed to fetch certificate status: %{public}@", v1, v2, v3, v4, v5);
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while publishing status: %{public}@", v1, v2, v3, v4, v5);
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74_cold_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) declarationIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) declarationServerToken];
  int v4 = 138543618;
  uint8_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_25B003000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Set configuration UI for: %{public}@ %{public}@", (uint8_t *)&v4, 0x16u);
}

void __69__RMSubscriberStore_setConfigurationUI_visible_ui_completionHandler___block_invoke_74_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Could not set configuration UI: %{public}@", v1, v2, v3, v4, v5);
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__RMSubscriberStore_publishStatus_completionHandler___block_invoke_75_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Could not publish status: %{public}@", v1, v2, v3, v4, v5);
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while writing status: %{public}@", v1, v2, v3, v4, v5);
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__RMSubscriberStore__writeStatusForDeclaration_validity_reasons_completionHandler___block_invoke_80_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Could not write status: %{public}@", v1, v2, v3, v4, v5);
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Failed XPC connection while removing status: %{public}@", v1, v2, v3, v4, v5);
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__RMSubscriberStore__removeStatusForDeclarationIdentifier_declarationServerToken_completionHandler___block_invoke_81_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, MEMORY[0x263EF8438], v0, "Could not remove status: %{public}@", v1, v2, v3, v4, v5);
}

@end