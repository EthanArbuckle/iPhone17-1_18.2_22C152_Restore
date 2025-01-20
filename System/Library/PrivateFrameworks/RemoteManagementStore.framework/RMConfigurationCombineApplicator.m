@interface RMConfigurationCombineApplicator
- (BOOL)doKeychainUnassign;
- (RMConfigurationCombineAdapter)adapter;
- (RMConfigurationCombineApplicator)initWithAdapter:(id)a3;
- (WrappedCombineAdapter)wrappingAdapter;
- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3;
- (void)_beginProcessingWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)_fetchExistingDeclarationKeysWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_installDeclarationKeysWithScope:(int64_t)a3 configurations:(id)a4 completionHandler:(id)a5;
- (void)_processExistingDeclarationKeysWithConfigurations:(id)a3 oldDeclarationKeys:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7;
- (void)_sendStatusForFailedKeys:(id)a3 enumerator:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7;
- (void)_sendStatusForSuccessKeys:(id)a3 failedKeys:(id)a4 reasons:(id)a5 scope:(int64_t)a6 configurations:(id)a7 completionHandler:(id)a8;
- (void)_sendStatusForSuccessKeys:(id)a3 reasons:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7;
- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setDoKeychainUnassign:(BOOL)a3;
@end

@implementation RMConfigurationCombineApplicator

- (RMConfigurationCombineApplicator)initWithAdapter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationCombineApplicator;
  v6 = [(RMConfigurationCombineApplicator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = [[WrappedCombineAdapter alloc] initWithAdapter:v7->_adapter];
    wrappingAdapter = v7->_wrappingAdapter;
    v7->_wrappingAdapter = v8;
  }
  return v7;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = [(RMConfigurationCombineApplicator *)self adapter];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    objc_super v11 = [(RMConfigurationCombineApplicator *)self adapter];
    [v11 configurationUIForConfiguration:v12 scope:a4 completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
  }
}

- (void)_beginProcessingWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
  v17[3] = &unk_26548F2D0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int64_t v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 beginProcessingConfigurationsForScope:a5 completionHandler:v17];
}

void __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _fetchExistingDeclarationKeysWithConfigurations:*(void *)(a1 + 40) storesByIdentifier:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)_fetchExistingDeclarationKeysWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
  v17[3] = &unk_26548F2F8;
  id v20 = v12;
  int64_t v21 = a5;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 allDeclarationKeysForScope:a5 completionHandler:v17];
}

void __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
    }

    id v8 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v11 = 0;
  }
  else
  {
    if ([v5 count] || objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      [*(id *)(a1 + 32) _processExistingDeclarationKeysWithConfigurations:*(void *)(a1 + 40) oldDeclarationKeys:v5 storesByIdentifier:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
      goto LABEL_9;
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v11 = 1;
  }
  [v8 _endProcessingWithSuccess:v11 scope:v9 completionHandler:v10];
LABEL_9:
}

- (void)_processExistingDeclarationKeysWithConfigurations:(id)a3 oldDeclarationKeys:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [(RMConfigurationCombineApplicator *)self _configurationByDeclarationKeyFromConfigurations:v11];
  id v15 = (void *)MEMORY[0x263EFFA08];
  id v16 = [v14 allKeys];
  v17 = [v15 setWithArray:v16];

  if ([v12 isEqualToSet:v17])
  {
    id v18 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[RMConfigurationCombineApplicator _processExistingDeclarationKeysWithConfigurations:oldDeclarationKeys:storesByIdentifier:scope:completionHandler:](v18);
    }

    [(RMConfigurationCombineApplicator *)self _endProcessingWithSuccess:1 scope:a6 completionHandler:v13];
  }
  else if ([v11 count])
  {
    [(RMConfigurationCombineApplicator *)self _installDeclarationKeysWithScope:a6 configurations:v14 completionHandler:v13];
  }
  else
  {
    id v19 = [v12 objectEnumerator];
    [(RMConfigurationCombineApplicator *)self _uninstallDeclarationKeys:v19 scope:a6 completionHandler:v13];
  }
}

- (void)_installDeclarationKeysWithScope:(int64_t)a3 configurations:(id)a4 completionHandler:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v31 = a5;
  v34 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v33 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count"));
  v35 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
      id v14 = [v8 objectForKeyedSubscript:v13];
      id v15 = [v14 declaration];
      id v16 = [(RMConfigurationCombineApplicator *)self adapter];
      [v16 configurationClass];
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v18 = [v14 store];
        char v19 = [v18 isValidDeclaration:v15];

        if (v19)
        {
          [v34 addObject:v15];
          [v33 addObject:v13];
          goto LABEL_16;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[RMConfigurationCombineApplicator _installDeclarationKeysWithScope:configurations:completionHandler:](v52, (uint64_t)v15, &v53);
        }
        int64_t v21 = v35;
        v22 = &unk_2708CB3A0;
      }
      else
      {
        id v20 = [MEMORY[0x263F635B0] configurationCombineApplicator];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v15;
          _os_log_error_impl(&dword_25B003000, v20, OS_LOG_TYPE_ERROR, "Incorrect declaration class: %{public}@", buf, 0xCu);
        }

        int64_t v21 = v35;
        v22 = &unk_2708CB388;
      }
      [v21 setObject:v22 forKeyedSubscript:v13];
LABEL_16:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
  }
  while (v10);
LABEL_18:

  if ([v34 count])
  {
    v23 = [(RMConfigurationCombineApplicator *)self adapter];
    id v24 = [v23 combineConfigurations:v34];

    v25 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_55;
    v36[3] = &unk_26548F348;
    id v40 = v31;
    int64_t v41 = a3;
    v36[4] = self;
    id v37 = v33;
    id v38 = v35;
    id v39 = v8;
    id v26 = v8;
    id v27 = v35;
    id v28 = v33;
    id v29 = v31;
    [v25 applyCombinedConfiguration:v24 declarationKeys:v28 scope:a3 completionHandler:v36];
  }
  else
  {
    v30 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke;
    v42[3] = &unk_26548F320;
    id v46 = v31;
    int64_t v47 = a3;
    v42[4] = self;
    id v43 = v33;
    id v44 = v35;
    id v45 = v8;
    id v27 = v8;
    id v28 = v35;
    id v29 = v33;
    id v24 = v31;
    [v30 removeCombinedConfigurationForScope:a3 completionHandler:v42];
  }
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _endProcessingWithSuccess:0 scope:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    [*(id *)(a1 + 32) _sendStatusForSuccessKeys:*(void *)(a1 + 40) failedKeys:*(void *)(a1 + 48) reasons:0 scope:*(void *)(a1 + 72) configurations:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_55_cold_1();
    }

    [*(id *)(a1 + 32) _endProcessingWithSuccess:0 scope:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    [*(id *)(a1 + 32) _sendStatusForSuccessKeys:*(void *)(a1 + 40) failedKeys:*(void *)(a1 + 48) reasons:a2 scope:*(void *)(a1 + 72) configurations:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
}

- (void)_sendStatusForSuccessKeys:(id)a3 failedKeys:(id)a4 reasons:(id)a5 scope:(int64_t)a6 configurations:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  id v18 = [a3 objectEnumerator];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke;
  v22[3] = &unk_26548F398;
  v22[4] = self;
  id v23 = v14;
  id v25 = v16;
  int64_t v26 = a6;
  id v24 = v15;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [(RMConfigurationCombineApplicator *)self _sendStatusForSuccessKeys:v18 reasons:v17 scope:a6 configurations:v20 completionHandler:v22];
}

void __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v4 = [v3 keyEnumerator];
  uint64_t v5 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke_2;
  v7[3] = &unk_26548F370;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 _sendStatusForFailedKeys:v3 enumerator:v4 scope:v5 configurations:v6 completionHandler:v7];
}

uint64_t __120__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_failedKeys_reasons_scope_configurations_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endProcessingWithSuccess:1 scope:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_sendStatusForSuccessKeys:(id)a3 reasons:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(void))a7;
  id v16 = [v12 nextObject];
  if (v16)
  {
    id v17 = [v14 objectForKeyedSubscript:v16];
    id v18 = [v17 store];
    id v19 = [v17 declaration];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke;
    v20[3] = &unk_26548F3C0;
    id v21 = v16;
    v22 = self;
    id v23 = v12;
    id v24 = v13;
    int64_t v27 = a5;
    id v25 = v14;
    int64_t v26 = v15;
    [v18 configurationSuccessfullyApplied:v19 reasons:v24 completionHandler:v20];
  }
  else
  {
    v15[2](v15);
  }
}

uint64_t __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  return [*(id *)(a1 + 40) _sendStatusForSuccessKeys:*(void *)(a1 + 48) reasons:*(void *)(a1 + 56) scope:*(void *)(a1 + 80) configurations:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

- (void)_sendStatusForFailedKeys:(id)a3 enumerator:(id)a4 scope:(int64_t)a5 configurations:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(void))a7;
  id v16 = [v13 nextObject];
  id v17 = [v12 objectForKeyedSubscript:v16];
  uint64_t v18 = [v17 integerValue];

  if (v16)
  {
    id v19 = [v14 objectForKeyedSubscript:v16];
    int64_t v27 = [v19 store];
    if (v18 == 2)
    {
      id v20 = [v19 declaration];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_57;
      v34[3] = &unk_26548F3C0;
      int64_t v26 = (id *)v35;
      v35[0] = v16;
      v35[1] = self;
      id v25 = &v36;
      id v36 = v12;
      id v24 = &v37;
      id v37 = v13;
      v39[1] = a5;
      id v21 = &v38;
      id v38 = v14;
      v22 = (id *)v39;
      id v23 = v27;
      v39[0] = v15;
      [v27 configurationNotSupported:v20 error:0 completionHandler:v34];
    }
    else
    {
      [v19 declaration];
      if (v18) {
        id v20 = {;
      }
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_58;
        v28[3] = &unk_26548F3C0;
        int64_t v26 = (id *)v29;
        v29[0] = v16;
        v29[1] = self;
        id v25 = &v30;
        id v30 = v12;
        id v24 = &v31;
        id v31 = v13;
        v33[1] = a5;
        id v21 = &v32;
        id v32 = v14;
        v22 = (id *)v33;
        v33[0] = v15;
        id v23 = v27;
        [v27 configurationFailedToApply:v20 error:0 completionHandler:v28];
      }
      else {
        id v20 = {;
      }
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke;
        v40[3] = &unk_26548F3C0;
        int64_t v26 = (id *)v41;
        v41[0] = v16;
        v41[1] = self;
        id v25 = &v42;
        id v42 = v12;
        id v24 = &v43;
        id v43 = v13;
        v45[1] = a5;
        id v21 = &v44;
        id v44 = v14;
        v22 = (id *)v45;
        v45[0] = v15;
        id v23 = v27;
        [v27 configurationIsInvalid:v20 error:0 completionHandler:v40];
      }
    }
  }
  else
  {
    v15[2](v15);
  }
}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  return [*(id *)(a1 + 40) _sendStatusForFailedKeys:*(void *)(a1 + 48) enumerator:*(void *)(a1 + 56) scope:*(void *)(a1 + 80) configurations:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_57(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  return [*(id *)(a1 + 40) _sendStatusForFailedKeys:*(void *)(a1 + 48) enumerator:*(void *)(a1 + 56) scope:*(void *)(a1 + 80) configurations:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

uint64_t __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_58(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(a1, v3);
    }
  }
  return [*(id *)(a1 + 40) _sendStatusForFailedKeys:*(void *)(a1 + 48) enumerator:*(void *)(a1 + 56) scope:*(void *)(a1 + 80) configurations:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263F635B0] configurationCombineApplicator];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[RMConfigurationCombineApplicator _uninstallDeclarationKeys:scope:completionHandler:]();
  }

  uint64_t v11 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke;
  v14[3] = &unk_26548F3E8;
  id v16 = v9;
  int64_t v17 = a4;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [v11 removeCombinedConfigurationForScope:a4 completionHandler:v14];
}

void __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F635B0] configurationCombineApplicator];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(a1, v5);
  }

  [*(id *)(a1 + 32) _endProcessingWithSuccess:v3 == 0 scope:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(RMConfigurationCombineApplicator *)self wrappingAdapter];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_26548F148;
  id v12 = v8;
  id v10 = v8;
  [v9 endProcessingConfigurations:v6 scope:a4 completionHandler:v11];
}

void __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F635B0] configurationCombineApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(RMConfigurationCombineApplicator *)self adapter];
        id v13 = [v12 declarationKeyForConfiguration:v11];

        [v5 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (RMConfigurationCombineAdapter)adapter
{
  return self->_adapter;
}

- (WrappedCombineAdapter)wrappingAdapter
{
  return self->_wrappingAdapter;
}

- (BOOL)doKeychainUnassign
{
  return self->_doKeychainUnassign;
}

- (void)setDoKeychainUnassign:(BOOL)a3
{
  self->_doKeychainUnassign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingAdapter, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

void __114__RMConfigurationCombineApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, v0, v1, "Failed to begin processing configurations: %{public}@", v2);
}

void __127__RMConfigurationCombineApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, v0, v1, "Failed to fetch declaration keys: %{public}@", v2);
}

- (void)_processExistingDeclarationKeysWithConfigurations:(os_log_t)log oldDeclarationKeys:storesByIdentifier:scope:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Declaration keys match - nothing to apply", v1, 2u);
}

- (void)_installDeclarationKeysWithScope:(uint8_t *)a1 configurations:(uint64_t)a2 completionHandler:(void *)a3 .cold.1(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138543362;
  *a3 = a2;
  OUTLINED_FUNCTION_1_0(&dword_25B003000, MEMORY[0x263EF8438], (uint64_t)a3, "Declaration not supported: %{public}@", a1);
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, v0, v1, "Failed to remove effective state: %{public}@", v2);
}

void __102__RMConfigurationCombineApplicator__installDeclarationKeysWithScope_configurations_completionHandler___block_invoke_55_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, v0, v1, "Failed to apply effective state: %{public}@", v2);
}

void __109__RMConfigurationCombineApplicator__sendStatusForSuccessKeys_reasons_scope_configurations_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, a2, v4, "Failed to notify store of applied declaration key: %{public}@", v5);
}

void __111__RMConfigurationCombineApplicator__sendStatusForFailedKeys_enumerator_scope_configurations_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, a2, v4, "Failed to notify store of failure of declaration key: %{public}@", v5);
}

- (void)_uninstallDeclarationKeys:scope:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_25B003000, v0, OS_LOG_TYPE_DEBUG, "Removing all declaration keys: %{public}@", v1, 0xCu);
}

void __86__RMConfigurationCombineApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_25B003000, a2, OS_LOG_TYPE_DEBUG, "Removed all declaration keys: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __86__RMConfigurationCombineApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_25B003000, v0, v1, "Failed to end processing configurations: %{public}@", v2);
}

@end