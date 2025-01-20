@interface RMProfileStore
+ (id)profileStoreForOwner:(id)a3;
+ (id)profileStoreForOwner:(id)a3 scope:(int64_t)a4;
- (BOOL)_removeDeclarationKeysForPayload:(id)a3 error:(id *)a4;
- (BOOL)_saveDeclarationKeysForPayload:(id)a3 keys:(id)a4 error:(id *)a5;
- (NSString)ownerIdentifier;
- (OS_dispatch_queue)workQueue;
- (RMObserverStore)observerStore;
- (RMProfileStore)initWithOwner:(id)a3 scope:(int64_t)a4;
- (RMProviderStore)providerStore;
- (id)_createStoreReturningError:(id *)a3;
- (id)_metadataKeyForPayload:(id)a3;
- (id)_newDeclarationsMap:(id)a3 error:(id *)a4;
- (id)_oldDeclarationKeysForPayload:(id)a3 store:(id)a4 error:(id *)a5;
- (int64_t)scope;
- (void)_applyDeclarationsForPayload:(id)a3 declarations:(id)a4 completionHandler:(id)a5;
- (void)_findObserverStoreWithCompletionHandler:(id)a3;
- (void)_findProviderStoreWithCompletionHandler:(id)a3;
- (void)_removeDeclarationsForPayload:(id)a3 completionHandler:(id)a4;
- (void)declarationIdentifiersForProfilePayloadIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)installProfile:(id)a3 declarations:(id)a4 completionHandler:(id)a5;
- (void)observerStoreWithCompletionHandler:(id)a3;
- (void)providerStoreWithCompletionHandler:(id)a3;
- (void)removeProfile:(id)a3 completionHandler:(id)a4;
- (void)setObserverStore:(id)a3;
- (void)setOwnerIdentifier:(id)a3;
- (void)setProviderStore:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation RMProfileStore

+ (id)profileStoreForOwner:(id)a3
{
  v3 = (void *)MEMORY[0x263F635C0];
  id v4 = a3;
  v5 = [v3 currentManagedDevice];
  int v6 = [v5 isSharediPad];

  v7 = [[RMProfileStore alloc] initWithOwner:v4 scope:v6 ^ 1u];
  return v7;
}

+ (id)profileStoreForOwner:(id)a3 scope:(int64_t)a4
{
  id v5 = a3;
  int v6 = [[RMProfileStore alloc] initWithOwner:v5 scope:a4];

  return v6;
}

- (RMProfileStore)initWithOwner:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMProfileStore;
  v7 = [(RMProfileStore *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    ownerIdentifier = v7->_ownerIdentifier;
    v7->_ownerIdentifier = (NSString *)v8;

    v7->_scope = a4;
    dispatch_queue_t v10 = dispatch_queue_create("RMProfileStore", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)providerStoreWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(RMProfileStore *)self providerStore];

  if (v5)
  {
    id v6 = [(RMProfileStore *)self providerStore];
    v4[2](v4, v6, 0);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke;
    v7[3] = &unk_26548F958;
    v7[4] = self;
    uint64_t v8 = v4;
    [(RMProfileStore *)self _findProviderStoreWithCompletionHandler:v7];
  }
}

void __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
    return;
  }
  [*(id *)(a1 + 32) setProviderStore:a2];
  id v5 = [*(id *)(a1 + 32) providerStore];

  if (v5)
  {
LABEL_8:
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = [*(id *)(a1 + 32) providerStore];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

    return;
  }
  id v6 = *(void **)(a1 + 32);
  id v13 = 0;
  v7 = [v6 _createStoreReturningError:&v13];
  id v8 = v13;
  [*(id *)(a1 + 32) setProviderStore:v7];

  v9 = [*(id *)(a1 + 32) providerStore];

  if (v9)
  {

    goto LABEL_8;
  }
  v12 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)installProfile:(id)a3 declarations:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore installProfile:declarations:completionHandler:]((uint64_t)v8, v9, v11);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke;
  v15[3] = &unk_26548F9A8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(RMProfileStore *)self providerStoreWithCompletionHandler:v15];
}

void __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [a1[4] workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2;
  v11[3] = &unk_26548F980;
  id v8 = a1[4];
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v17 = a1[7];
  id v15 = a1[5];
  id v16 = a1[6];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    v2 = (void *)a1[5];
    uint64_t v3 = a1[7];
    uint64_t v4 = a1[8];
    uint64_t v5 = a1[9];
    return [v2 _applyDeclarationsForPayload:v3 declarations:v4 completionHandler:v5];
  }
  else
  {
    v7 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2_cold_1((uint64_t)a1);
    }

    return (*(uint64_t (**)(void))(a1[9] + 16))();
  }
}

- (void)removeProfile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore removeProfile:completionHandler:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__RMProfileStore_removeProfile_completionHandler___block_invoke;
  v11[3] = &unk_26548F9F8;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(RMProfileStore *)self providerStoreWithCompletionHandler:v11];
}

void __50__RMProfileStore_removeProfile_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2;
  block[3] = &unk_26548F9D0;
  id v8 = a1[4];
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v16 = a1[6];
  id v15 = a1[5];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    v2 = (void *)a1[5];
    uint64_t v3 = a1[7];
    uint64_t v4 = a1[8];
    return [v2 _removeDeclarationsForPayload:v3 completionHandler:v4];
  }
  else
  {
    id v6 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2_cold_1((uint64_t)a1);
    }

    return (*(uint64_t (**)(void))(a1[8] + 16))();
  }
}

- (void)observerStoreWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  id v5 = [(RMProfileStore *)self observerStore];

  if (v5)
  {
    id v6 = [(RMProfileStore *)self observerStore];
    v4[2](v4, v6, 0);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__RMProfileStore_observerStoreWithCompletionHandler___block_invoke;
    v7[3] = &unk_26548F928;
    v7[4] = self;
    id v8 = v4;
    [(RMProfileStore *)self _findObserverStoreWithCompletionHandler:v7];
  }
}

void __53__RMProfileStore_observerStoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    [*(id *)(a1 + 32) setObserverStore:a2];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) observerStore];
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, 0);
  }
}

- (void)declarationIdentifiersForProfilePayloadIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_26548FA20;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(RMProfileStore *)self observerStoreWithCompletionHandler:v10];
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_26548F9D0;
  id v8 = a1[4];
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v16 = a1[6];
  id v15 = a1[5];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v3 = *(id *)(a1 + 56);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v9 = *(void **)(a1 + 40);
          id v10 = [v9 observerStore];
          id v26 = 0;
          id v11 = [v9 _oldDeclarationKeysForPayload:v8 store:v10 error:&v26];
          id v12 = v26;

          if (v12)
          {
            v20 = [MEMORY[0x263F635B0] profileStore];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();
            }

            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            goto LABEL_21;
          }
          id v13 = [v11 allObjects];
          [v2 addObjectsFromArray:v13];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v2;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "declarationIdentifier", (void)v22);
          [v12 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v16);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_21:
  }
  else
  {
    v21 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_findProviderStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _findProviderStoreWithCompletionHandler:]();
  }

  int64_t v6 = [(RMProfileStore *)self scope];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_26548FA48;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[RMProviderStore storesWithScope:v6 completionHandler:v8];
}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v19 = v6;
      id v20 = v5;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", v19, v20, (void)v21) == 2)
          {
            id v13 = [v12 metadataValueForKey:@"RMProfileStoreIdentifier" error:0];
            id v14 = [*(id *)(a1 + 32) ownerIdentifier];
            int v15 = [v13 isEqualToString:v14];

            if (v15)
            {
              id v16 = v12;

              goto LABEL_17;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v16 = 0;
LABEL_17:
      id v6 = v19;
      id v5 = v20;
    }
    else
    {
      id v16 = 0;
    }

    id v18 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_2(v16);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_findObserverStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _findObserverStoreWithCompletionHandler:]();
  }

  int64_t v6 = [(RMProfileStore *)self scope];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke;
  v8[3] = &unk_26548FA48;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[RMObserverStore storesWithScope:v6 completionHandler:v8];
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  id v24 = v6;
  id v25 = v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9)
  {
LABEL_12:

LABEL_20:
    id v20 = objc_msgSend(MEMORY[0x263F635B0], "profileStore", v24, v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_2(a1, v20);
    }

    long long v21 = (void *)MEMORY[0x263F63598];
    uint64_t v22 = *(void *)(a1 + 40);
    id v18 = [*(id *)(a1 + 32) ownerIdentifier];
    long long v23 = [v21 createManagementSourceNotFoundErrorWithIdentifier:v18];
    (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);

    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v27;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v27 != v11) {
      objc_enumerationMutation(v8);
    }
    id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
    if (objc_msgSend(v13, "type", v24, v25, (void)v26) != 2) {
      goto LABEL_10;
    }
    id v14 = [v13 metadataValueForKey:@"RMProfileStoreIdentifier" error:0];
    int v15 = [*(id *)(a1 + 32) ownerIdentifier];
    char v16 = [v14 isEqualToString:v15];

    if (v16) {
      break;
    }

LABEL_10:
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  id v18 = v13;

  if (!v18) {
    goto LABEL_20;
  }
  id v19 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_3(v18);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_23:
  id v7 = v24;
  id v5 = v25;

LABEL_24:
}

- (id)_createStoreReturningError:(id *)a3
{
  id v5 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _createStoreReturningError:].cold.4();
  }

  id v6 = objc_opt_new();
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  int64_t v7 = [(RMProfileStore *)self scope];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __45__RMProfileStore__createStoreReturningError___block_invoke;
  v27[3] = &unk_26548FA70;
  long long v29 = &v37;
  long long v30 = &v31;
  id v8 = v6;
  id v28 = v8;
  +[RMProviderStore createStoreWithType:2 scope:v7 defaultToInteractive:0 dataSeparated:0 options:0 completionHandler:v27];
  [v8 waitForCompletion];
  if (v38[5])
  {
    uint64_t v9 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _createStoreReturningError:]();
    }

    if (a3 && (uint64_t v10 = (void *)v38[5]) != 0)
    {
      id v11 = 0;
      *a3 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = (void *)v32[5];
    id v13 = [(RMProfileStore *)self ownerIdentifier];
    id v26 = 0;
    char v14 = [v12 setMetadataValue:v13 forKey:@"RMProfileStoreIdentifier" error:&v26];
    id v15 = v26;

    if (v14)
    {
      id v11 = (id)v32[5];
    }
    else
    {
      char v16 = [MEMORY[0x263F635B0] profileStore];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[RMProfileStore _createStoreReturningError:]();
      }

      uint64_t v17 = objc_opt_new();
      id v18 = [(id)v32[5] identifier];
      int64_t v19 = [(RMProfileStore *)self scope];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __45__RMProfileStore__createStoreReturningError___block_invoke_26;
      v23[3] = &unk_26548FA98;
      id v25 = &v37;
      id v20 = v17;
      id v24 = v20;
      +[RMProviderStore removeStoreWithIdentifier:v18 scope:v19 completionHandler:v23];

      [v20 waitForCompletion];
      if (v38[5])
      {
        long long v21 = [MEMORY[0x263F635B0] profileStore];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[RMProfileStore _createStoreReturningError:]();
        }
      }
      if (a3 && v15) {
        *a3 = v15;
      }

      id v11 = 0;
    }
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v11;
}

void __45__RMProfileStore__createStoreReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  [*(id *)(a1 + 32) complete];
}

void __45__RMProfileStore__createStoreReturningError___block_invoke_26(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

- (void)_applyDeclarationsForPayload:(id)a3 declarations:(id)a4 completionHandler:(id)a5
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v57 = a4;
  v56 = (void (**)(id, id))a5;
  int64_t v7 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.7(v57);
  }

  v63 = objc_opt_new();
  id v95 = 0;
  id v62 = [(RMProfileStore *)self _newDeclarationsMap:v57 error:&v95];
  id v8 = v95;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.6();
    }

    v56[2](v56, v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = [v62 allKeys];
    v54 = [v11 setWithArray:v12];

    id v13 = [(RMProfileStore *)self providerStore];
    id v94 = 0;
    v53 = [(RMProfileStore *)self _oldDeclarationKeysForPayload:v55 store:v13 error:&v94];
    id v9 = v94;

    if (v9)
    {
      char v14 = [MEMORY[0x263F635B0] profileStore];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();
      }

      v56[2](v56, v9);
    }
    else
    {
      v64 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v54, "count"));
      id v93 = 0;
      id v92 = 0;
      id v91 = 0;
      +[RMStoreDeclarationKey synchronizeOldKeys:v53 newKeys:v54 returningUnchangedKeys:&v93 returningApplyKeys:&v92 returningRemoveKeys:&v91];
      id v52 = v93;
      id v15 = v92;
      id v51 = v91;
      char v16 = [MEMORY[0x263F635B0] profileStore];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:].cold.4(v15);
      }

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      obuint64_t j = v15;
      uint64_t v17 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
      if (v17)
      {
        uint64_t v60 = *(void *)v88;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v88 != v60) {
              objc_enumerationMutation(obj);
            }
            int64_t v19 = *(void **)(*((void *)&v87 + 1) + 8 * v18);
            id v20 = (void *)MEMORY[0x26115B460]();
            long long v21 = [v19 applyKey];
            uint64_t v22 = (void *)MEMORY[0x263F63660];
            long long v23 = [v62 objectForKeyedSubscript:v21];
            id v24 = [v22 loadData:v23 serializationType:1 error:0];

            id v25 = objc_opt_new();
            uint64_t v81 = 0;
            v82 = &v81;
            uint64_t v83 = 0x3032000000;
            v84 = __Block_byref_object_copy__2;
            v85 = __Block_byref_object_dispose__2;
            id v86 = 0;
            id v26 = [MEMORY[0x263F635B0] profileStore];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              long long v27 = [v24 declarationIdentifier];
              -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:](v27, v101, &v102, v26);
            }

            id v28 = [(RMProfileStore *)self providerStore];
            v77[0] = MEMORY[0x263EF8330];
            v77[1] = 3221225472;
            v77[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke;
            v77[3] = &unk_26548FAC0;
            id v29 = v24;
            id v78 = v29;
            v80 = &v81;
            id v30 = v25;
            id v79 = v30;
            [v28 saveDeclaration:v29 completionHandler:v77];

            [v30 waitForCompletion];
            if (v82[5])
            {
              uint64_t v31 = [MEMORY[0x263F635B0] profileStore];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v35 = [v21 declarationIdentifier];
                *(_DWORD *)buf = 138543618;
                v98 = v35;
                __int16 v99 = 2114;
                uint64_t v100 = 0;
                _os_log_error_impl(&dword_25B003000, v31, OS_LOG_TYPE_ERROR, "Failed to save declaration %{public}@: %{public}@", buf, 0x16u);
              }
              uint64_t v32 = [v21 declarationIdentifier];
              [v63 addObject:v32];

              uint64_t v33 = [v19 replaceKey];
              LOBYTE(v32) = v33 == 0;

              if ((v32 & 1) == 0)
              {
                v34 = [v19 replaceKey];
                [v64 addObject:v34];
              }
            }
            else
            {
              [v64 addObject:v21];
            }

            _Block_object_dispose(&v81, 8);
            ++v18;
          }
          while (v17 != v18);
          uint64_t v17 = [obj countByEnumeratingWithState:&v87 objects:v103 count:16];
        }
        while (v17);
      }

      [v64 unionSet:v52];
      id v36 = [MEMORY[0x263F635B0] profileStore];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:](v51);
      }

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v59 = v51;
      uint64_t v37 = [v59 countByEnumeratingWithState:&v73 objects:v96 count:16];
      if (v37)
      {
        uint64_t v61 = *(void *)v74;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v74 != v61) {
              objc_enumerationMutation(v59);
            }
            uint64_t v39 = *(void **)(*((void *)&v73 + 1) + 8 * v38);
            v40 = (void *)MEMORY[0x26115B460]();
            v41 = objc_opt_new();
            uint64_t v81 = 0;
            v82 = &v81;
            uint64_t v83 = 0x3032000000;
            v84 = __Block_byref_object_copy__2;
            v85 = __Block_byref_object_dispose__2;
            id v86 = 0;
            id v42 = [(RMProfileStore *)self providerStore];
            v43 = [v39 declarationIdentifier];
            v70[0] = MEMORY[0x263EF8330];
            v70[1] = 3221225472;
            v70[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_32;
            v70[3] = &unk_26548FAC0;
            v70[4] = v39;
            v72 = &v81;
            id v44 = v41;
            id v71 = v44;
            [v42 deleteDeclarationWithIdentifier:v43 completionHandler:v70];

            [v44 waitForCompletion];
            if (v82[5])
            {
              v45 = [MEMORY[0x263F635B0] profileStore];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                v47 = [v39 declarationIdentifier];
                *(_DWORD *)buf = 138543618;
                v98 = v47;
                __int16 v99 = 2114;
                uint64_t v100 = 0;
                _os_log_error_impl(&dword_25B003000, v45, OS_LOG_TYPE_ERROR, "Failed to delete declaration %{public}@: %{public}@", buf, 0x16u);
              }
              v46 = [v39 declarationIdentifier];
              [v63 addObject:v46];

              [v64 addObject:v39];
            }

            _Block_object_dispose(&v81, 8);
            ++v38;
          }
          while (v37 != v38);
          uint64_t v37 = [v59 countByEnumeratingWithState:&v73 objects:v96 count:16];
        }
        while (v37);
      }

      id v69 = 0;
      [(RMProfileStore *)self _saveDeclarationKeysForPayload:v55 keys:v64 error:&v69];
      id v48 = v69;
      if (v48)
      {
        v49 = [MEMORY[0x263F635B0] profileStore];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:]();
        }
      }
      v50 = [(RMProfileStore *)self providerStore];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_33;
      v66[3] = &unk_26548F578;
      id v9 = v48;
      id v67 = v9;
      v68 = v56;
      [v50 applyChangesWithCompletionHandler:v66];
    }
  }
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_cold_1(a1);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  [*(id *)(a1 + 40) complete];
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_32_cold_1(a1);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  [*(id *)(a1 + 40) complete];
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_33_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_removeDeclarationsForPayload:(id)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v25 = a4;
  uint64_t v5 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _removeDeclarationsForPayload:completionHandler:].cold.5();
  }

  id v29 = objc_opt_new();
  uint64_t v6 = [(RMProfileStore *)self providerStore];
  id v50 = 0;
  id v24 = [(RMProfileStore *)self _oldDeclarationKeysForPayload:v26 store:v6 error:&v50];
  id v7 = v50;

  if (!v7)
  {
    id v28 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v24, "count"));
    id v9 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RMProfileStore _removeDeclarationsForPayload:completionHandler:](v24);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v24;
    uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v10)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x26115B460]();
          char v14 = objc_opt_new();
          uint64_t v40 = 0;
          v41 = &v40;
          uint64_t v42 = 0x3032000000;
          v43 = __Block_byref_object_copy__2;
          id v44 = __Block_byref_object_dispose__2;
          id v45 = 0;
          id v15 = [(RMProfileStore *)self providerStore];
          char v16 = [v12 declarationIdentifier];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke;
          v37[3] = &unk_26548FAC0;
          v37[4] = v12;
          uint64_t v39 = &v40;
          id v17 = v14;
          id v38 = v17;
          [v15 deleteDeclarationWithIdentifier:v16 completionHandler:v37];

          [v17 waitForCompletion];
          if (v41[5])
          {
            uint64_t v18 = [MEMORY[0x263F635B0] profileStore];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v20 = [v12 declarationIdentifier];
              *(_DWORD *)buf = 138543618;
              id v52 = v20;
              __int16 v53 = 2114;
              uint64_t v54 = 0;
              _os_log_error_impl(&dword_25B003000, v18, OS_LOG_TYPE_ERROR, "Failed to delete declaration %{public}@: %{public}@", buf, 0x16u);
            }
            int64_t v19 = [v12 declarationIdentifier];
            [v29 addObject:v19];

            [v28 addObject:v12];
          }

          _Block_object_dispose(&v40, 8);
          ++v11;
        }
        while (v10 != v11);
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v10);
    }

    if ([v28 count])
    {
      id v35 = 0;
      [(RMProfileStore *)self _saveDeclarationKeysForPayload:v26 keys:v28 error:&v35];
      id v21 = v35;
      if (v21)
      {
        uint64_t v22 = [MEMORY[0x263F635B0] profileStore];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[RMProfileStore _applyDeclarationsForPayload:declarations:completionHandler:]();
        }
LABEL_27:
      }
    }
    else
    {
      id v36 = 0;
      [(RMProfileStore *)self _removeDeclarationKeysForPayload:v26 error:&v36];
      id v21 = v36;
      if (v21)
      {
        uint64_t v22 = [MEMORY[0x263F635B0] profileStore];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[RMProfileStore _removeDeclarationsForPayload:completionHandler:]();
        }
        goto LABEL_27;
      }
    }
    long long v23 = [(RMProfileStore *)self providerStore];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke_34;
    v32[3] = &unk_26548F578;
    id v7 = v21;
    id v33 = v7;
    id v34 = v25;
    [v23 applyChangesWithCompletionHandler:v32];

    goto LABEL_29;
  }
  id v8 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2();
  }

  (*((void (**)(id, id))v25 + 2))(v25, v7);
LABEL_29:
}

void __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_32_cold_1(a1);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  [*(id *)(a1 + 40) complete];
}

void __66__RMProfileStore__removeDeclarationsForPayload_completionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_33_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_newDeclarationsMap:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v22 = a4;
    obuint64_t j = v8;
    uint64_t v11 = *(void *)v26;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
      char v14 = (void *)MEMORY[0x26115B460]();
      id v24 = 0;
      id v15 = [MEMORY[0x263F63660] loadData:v13 serializationType:1 error:&v24];
      id v16 = v24;
      if (v16) {
        break;
      }
      id v17 = [(RMProfileStore *)self providerStore];
      id v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"ProfileSubscriber" store:v17 declaration:v15];

      [v7 setObject:v13 forKey:v18];
      if (v10 == ++v12)
      {
        id v8 = obj;
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int64_t v19 = v16;

    id v8 = obj;

    if (v22)
    {
      id v20 = v19;
      id v7 = 0;
      *uint64_t v22 = v20;
      int64_t v19 = v20;
      goto LABEL_12;
    }
    id v7 = 0;
  }
  else
  {
LABEL_9:
    int64_t v19 = 0;
    id v20 = v8;
LABEL_12:
  }
  return v7;
}

- (id)_oldDeclarationKeysForPayload:(id)a3 store:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [(RMProfileStore *)self _metadataKeyForPayload:a3];
  id v29 = 0;
  uint64_t v10 = [v8 metadataValueForKey:v9 error:&v29];
  id v11 = v29;
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:].cold.4();
    }

    if (a5) {
      *a5 = v11;
    }
    goto LABEL_23;
  }
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:]();
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x263F635B0] profileStore];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _oldDeclarationKeysForPayload:store:error:]();
    }
LABEL_22:

LABEL_23:
    id v21 = objc_opt_new();
    goto LABEL_24;
  }
  id v24 = v8;
  uint64_t v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = +[RMStoreDeclarationKey newDeclarationKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v16);
  }

  id v20 = [MEMORY[0x263F635B0] profileStore];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[RMProfileStore _oldDeclarationKeysForPayload:store:error:]();
  }

  id v21 = [MEMORY[0x263EFFA08] setWithArray:v13];

  id v8 = v24;
LABEL_24:

  return v21;
}

- (BOOL)_saveDeclarationKeysForPayload:(id)a3 keys:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v25 + 1) + 8 * v15) key];
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(RMProfileStore *)self _metadataKeyForPayload:v8];
  id v18 = [(RMProfileStore *)self providerStore];
  id v24 = 0;
  char v19 = [v18 setMetadataValue:v10 forKey:v17 error:&v24];
  id v20 = v24;

  id v21 = [MEMORY[0x263F635B0] profileStore];
  uint64_t v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _saveDeclarationKeysForPayload:keys:error:]();
    }

    if (a5 && v20) {
      *a5 = v20;
    }
  }

  return v19;
}

- (BOOL)_removeDeclarationKeysForPayload:(id)a3 error:(id *)a4
{
  id v6 = [(RMProfileStore *)self _metadataKeyForPayload:a3];
  id v7 = [(RMProfileStore *)self providerStore];
  id v13 = 0;
  char v8 = [v7 setMetadataValue:0 forKey:v6 error:&v13];
  id v9 = v13;

  uint64_t v10 = [MEMORY[0x263F635B0] profileStore];
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[RMProfileStore _removeDeclarationKeysForPayload:error:]();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RMProfileStore _removeDeclarationKeysForPayload:error:]();
    }

    if (a4 && v9) {
      *a4 = v9;
    }
  }

  return v8;
}

- (id)_metadataKeyForPayload:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = [v3 DMCSHA256Hash];
  uint64_t v5 = [v4 DMCHexString];
  id v6 = [NSString stringWithFormat:@"%@_%@", @"RMProfileStore", v5];

  return v6;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (RMProviderStore)providerStore
{
  return self->_providerStore;
}

- (void)setProviderStore:(id)a3
{
}

- (RMObserverStore)observerStore
{
  return self->_observerStore;
}

- (void)setObserverStore:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_providerStore, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

void __53__RMProfileStore_providerStoreWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to create provider store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)installProfile:(uint64_t)a1 declarations:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_debug_impl(&dword_25B003000, a3, OS_LOG_TYPE_DEBUG, "Install profile %{public}@ with %lu declarations", (uint8_t *)&v4, 0x16u);
}

void __64__RMProfileStore_installProfile_declarations_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) ownerIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to install profile for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)removeProfile:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_25B003000, v0, v1, "Remove profile %{public}@", v2);
}

void __50__RMProfileStore_removeProfile_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) ownerIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to remove profile for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) ownerIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to get declarations for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

void __87__RMProfileStore_declarationIdentifiersForProfilePayloadIdentifiers_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to get old declaration keys: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_findProviderStoreWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Find provider store", v2, v3, v4, v5, v6);
}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) ownerIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to lookup provider store for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

void __58__RMProfileStore__findProviderStoreWithCompletionHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Found provider store with identifier: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_findObserverStoreWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Find observer store", v2, v3, v4, v5, v6);
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) ownerIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to lookup observer store for owner %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1(a1) ownerIdentifier];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_25B003000, a2, OS_LOG_TYPE_ERROR, "No observer store with identifier: %{public}@", v4, 0xCu);
}

void __58__RMProfileStore__findObserverStoreWithCompletionHandler___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Found observer store with identifier: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_createStoreReturningError:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to remove provider store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_createStoreReturningError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to set provider store metadata: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_createStoreReturningError:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to create provider store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_createStoreReturningError:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Creating provider store", v2, v3, v4, v5, v6);
}

- (void)_applyDeclarationsForPayload:declarations:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to save declaration manifest: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v1, v2, "Removing %lu declarations", v3, v4, v5, v6, v7);
}

- (void)_applyDeclarationsForPayload:(void *)a3 declarations:(NSObject *)a4 completionHandler:.cold.3(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_2_3(&dword_25B003000, a4, (uint64_t)a3, "Saving declaration %{public}@", a2);
}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.4(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v1, v2, "Install %lu declarations", v3, v4, v5, v6, v7);
}

- (void)_applyDeclarationsForPayload:declarations:completionHandler:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to build declaration map: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_applyDeclarationsForPayload:(void *)a1 declarations:completionHandler:.cold.7(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v1, v2, "Apply profile payload with %lu declarations", v3, v4, v5, v6, v7);
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) declarationIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Saved declaration %{public}@", v4, v5, v6, v7, v8);
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_32_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) declarationIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Removed declaration %{public}@", v4, v5, v6, v7, v8);
}

void __78__RMProfileStore__applyDeclarationsForPayload_declarations_completionHandler___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to apply declarations: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_removeDeclarationsForPayload:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to remove declaration manifest: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_removeDeclarationsForPayload:(void *)a1 completionHandler:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v1, v2, "Removing %lu declarations", v3, v4, v5, v6, v7);
}

- (void)_removeDeclarationsForPayload:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Remove profile payload declarations", v2, v3, v4, v5, v6);
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_25B003000, v0, v1, "Empty declaration manifest for key %{public}@", v2);
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_25B003000, v0, v1, "Read declaration manifest for key %{public}@", v2);
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid saved declaration manifest for key %{public}@", v2, v3, v4, v5, v6);
}

- (void)_oldDeclarationKeysForPayload:store:error:.cold.4()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Failed to read declaration manifest for key %{public}@: %{public}@");
}

- (void)_saveDeclarationKeysForPayload:keys:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_25B003000, v0, v1, "Saved declaration manifest for key %{public}@", v2);
}

- (void)_saveDeclarationKeysForPayload:keys:error:.cold.2()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Failed to save declaration manifest for key %{public}@: %{public}@");
}

- (void)_removeDeclarationKeysForPayload:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_25B003000, v0, v1, "Removed declaration manifest for key %{public}@", v2);
}

- (void)_removeDeclarationKeysForPayload:error:.cold.2()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Failed to remove declaration manifest for key %{public}@: %{public}@");
}

@end