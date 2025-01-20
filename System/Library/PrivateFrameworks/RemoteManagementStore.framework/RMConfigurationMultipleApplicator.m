@interface RMConfigurationMultipleApplicator
- (BOOL)_supportedConfigurationType:(id)a3;
- (BOOL)_usesKeychain;
- (BOOL)doKeychainUnassign;
- (BOOL)inPlaceUpdates;
- (BOOL)removeBeforeApply;
- (RMConfigurationMultipleAdapter)adapter;
- (RMConfigurationMultipleApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
- (WrappedMultipleAdapter)wrappingAdapter;
- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3;
- (void)_beginProcessingWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_cleanupDeclarationKeysIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6;
- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)_fetchExistingDeclarationKeysWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_installDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6;
- (void)_processExistingDeclarationKeysWithConfigurations:(id)a3 oldDeclarationKeys:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7;
- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)_usesKeychain;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setDoKeychainUnassign:(BOOL)a3;
- (void)setInPlaceUpdates:(BOOL)a3;
- (void)setRemoveBeforeApply:(BOOL)a3;
@end

@implementation RMConfigurationMultipleApplicator

- (RMConfigurationMultipleApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMConfigurationMultipleApplicator;
  v8 = [(RMConfigurationMultipleApplicator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adapter, a3);
    v10 = [[WrappedMultipleAdapter alloc] initWithAdapter:v9->_adapter];
    wrappingAdapter = v9->_wrappingAdapter;
    v9->_wrappingAdapter = v10;

    v9->_inPlaceUpdates = a4;
    v9->_removeBeforeApply = 0;
    v9->_doKeychainUnassign = [(RMConfigurationMultipleApplicator *)v9 _usesKeychain];
  }

  return v9;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = [(RMConfigurationMultipleApplicator *)self adapter];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(RMConfigurationMultipleApplicator *)self adapter];
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
  objc_super v13 = [(RMConfigurationMultipleApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
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
  objc_super v13 = [(RMConfigurationMultipleApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
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
  id v34 = a7;
  id v11 = a4;
  id v12 = [(RMConfigurationMultipleApplicator *)self _configurationByDeclarationKeyFromConfigurations:a3];
  objc_super v13 = (void *)MEMORY[0x263EFFA08];
  id v14 = [v12 allKeys];
  uint64_t v15 = [v13 setWithArray:v14];

  id v51 = 0;
  v52[0] = 0;
  id v50 = 0;
  +[RMStoreDeclarationKey synchronizeOldKeys:v11 newKeys:v15 returningUnchangedKeys:v52 returningApplyKeys:&v51 returningRemoveKeys:&v50];

  id v16 = v52[0];
  id v17 = v51;
  id v18 = v50;
  id v19 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke;
  v48[3] = &unk_26548F410;
  id v20 = v19;
  id v49 = v20;
  [v17 enumerateObjectsUsingBlock:v48];
  if ([(RMConfigurationMultipleApplicator *)self inPlaceUpdates])
  {
    id v21 = v18;
  }
  else
  {
    id v21 = [v20 setByAddingObjectsFromSet:v18];
  }
  v22 = v21;
  v36 = v16;
  v37 = (void *)v15;
  v35 = v18;
  if ([(RMConfigurationMultipleApplicator *)self removeBeforeApply])
  {
    v33 = [v20 objectEnumerator];
    if ([(RMConfigurationMultipleApplicator *)self inPlaceUpdates]) {
      BOOL v23 = [(RMConfigurationMultipleApplicator *)self doKeychainUnassign];
    }
    else {
      BOOL v23 = 0;
    }
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_5;
    v38[3] = &unk_26548F460;
    v38[4] = self;
    v39 = v22;
    int64_t v43 = a6;
    v25 = &v40;
    id v40 = v17;
    v26 = &v41;
    id v41 = v12;
    v27 = v34;
    id v42 = v34;
    id v31 = v22;
    int64_t v32 = a6;
    v30 = &v39;
    [(RMConfigurationMultipleApplicator *)self _cleanupDeclarationKeysIfNeeded:v33 scope:v32 doIt:v23 completionHandler:v38];

    v24 = v42;
  }
  else
  {
    v24 = [v17 objectEnumerator];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_2;
    v44[3] = &unk_26548F398;
    v44[4] = self;
    v47[1] = a6;
    v25 = &v46;
    id v45 = v20;
    v46 = v22;
    v26 = (id *)v47;
    v27 = v34;
    v47[0] = v34;
    id v28 = v22;
    int64_t v29 = a6;
    v30 = &v45;
    [(RMConfigurationMultipleApplicator *)self _installDeclarationKeys:v24 scope:v29 configurations:v12 completionHandler:v44];
  }
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 replaceKey];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v6 replaceKey];
    [v4 addObject:v5];
  }
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v4 = *(void *)(a1 + 64);
  if ([*(id *)(a1 + 32) inPlaceUpdates]) {
    uint64_t v5 = [*(id *)(a1 + 32) doKeychainUnassign];
  }
  else {
    uint64_t v5 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_3;
  v9[3] = &unk_26548F438;
  v9[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v10 = v6;
  uint64_t v12 = v7;
  id v11 = v8;
  [v2 _cleanupDeclarationKeysIfNeeded:v3 scope:v4 doIt:v5 completionHandler:v9];
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_4;
  v5[3] = &unk_26548F370;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v7 = v4;
  id v6 = *(id *)(a1 + 48);
  [v2 _uninstallDeclarationKeys:v3 scope:v4 completionHandler:v5];
}

uint64_t __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endProcessingWithSuccess:1 scope:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v4 = *(void *)(a1 + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_6;
  v7[3] = &unk_26548F398;
  v7[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v8 = v5;
  uint64_t v11 = v6;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v2 _uninstallDeclarationKeys:v3 scope:v4 completionHandler:v7];
}

void __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_6(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v4 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_7;
  v6[3] = &unk_26548F370;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v4;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 _installDeclarationKeys:v3 scope:v4 configurations:v5 completionHandler:v6];
}

uint64_t __149__RMConfigurationMultipleApplicator__processExistingDeclarationKeysWithConfigurations_oldDeclarationKeys_storesByIdentifier_scope_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endProcessingWithSuccess:1 scope:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_installDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(void))a6;
  objc_super v13 = [v10 nextObject];
  id v14 = v13;
  if (v13)
  {
    v27 = [v13 applyKey];
    uint64_t v15 = objc_msgSend(v11, "objectForKeyedSubscript:");
    id v16 = [v15 declaration];
    if ([(RMConfigurationMultipleApplicator *)self _supportedConfigurationType:v16])
    {
      id v17 = [v15 store];
      char v18 = [v17 isValidDeclaration:v16];

      if (v18)
      {
        v26 = [(RMConfigurationMultipleApplicator *)self wrappingAdapter];
        id v19 = [v14 replaceKey];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2;
        v28[3] = &unk_26548F4B0;
        id v29 = v27;
        id v30 = v15;
        id v31 = v16;
        int64_t v32 = self;
        id v33 = v10;
        int64_t v36 = a4;
        id v34 = v11;
        v35 = v12;
        [v26 applyConfiguration:v30 replaceKey:v19 scope:a4 completionHandler:v28];

        id v20 = v29;
      }
      else
      {
        v24 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:]();
        }

        v25 = [v15 store];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_54;
        v37[3] = &unk_26548F488;
        v37[4] = self;
        id v38 = v10;
        int64_t v41 = a4;
        id v39 = v11;
        id v40 = v12;
        [v25 configurationNotSupported:v16 error:0 completionHandler:v37];

        id v20 = v38;
      }
    }
    else
    {
      id v21 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:]();
      }

      v22 = [MEMORY[0x263F63598] createInternalError];
      BOOL v23 = [v15 store];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke;
      v42[3] = &unk_26548F488;
      v42[4] = self;
      id v43 = v10;
      int64_t v46 = a4;
      id v44 = v11;
      id v45 = v12;
      [v23 configurationIsInvalid:v16 error:v22 completionHandler:v42];
    }
  }
  else
  {
    v12[2](v12);
  }
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_2(a1);
    }

    id v9 = [*(id *)(a1 + 40) store];
    uint64_t v10 = *(void *)(a1 + 48);
    if (v5)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_55;
      v32[3] = &unk_26548F488;
      id v11 = *(void **)(a1 + 64);
      v32[4] = *(void *)(a1 + 56);
      uint64_t v12 = &v33;
      id v13 = v11;
      uint64_t v14 = *(void *)(a1 + 88);
      id v33 = v13;
      v35[1] = v14;
      uint64_t v15 = &v34;
      id v34 = *(id *)(a1 + 72);
      id v16 = (id *)v35;
      v35[0] = *(id *)(a1 + 80);
      [v9 configurationErrorReasons:v10 reasons:v5 completionHandler:v32];
    }
    else
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_56;
      v28[3] = &unk_26548F488;
      id v21 = *(void **)(a1 + 64);
      void v28[4] = *(void *)(a1 + 56);
      uint64_t v12 = &v29;
      id v22 = v21;
      uint64_t v23 = *(void *)(a1 + 88);
      id v29 = v22;
      v31[1] = v23;
      uint64_t v15 = &v30;
      id v30 = *(id *)(a1 + 72);
      id v16 = (id *)v31;
      v31[0] = *(id *)(a1 + 80);
      [v9 configurationFailedToApply:v10 error:v6 completionHandler:v28];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(a1);
    }

    id v9 = [*(id *)(a1 + 40) store];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_57;
    v24[3] = &unk_26548F488;
    uint64_t v17 = *(void *)(a1 + 48);
    char v18 = *(void **)(a1 + 64);
    v24[4] = *(void *)(a1 + 56);
    uint64_t v12 = &v25;
    id v19 = v18;
    uint64_t v20 = *(void *)(a1 + 88);
    id v25 = v19;
    v27[1] = v20;
    uint64_t v15 = &v26;
    id v26 = *(id *)(a1 + 72);
    id v16 = (id *)v27;
    v27[0] = *(id *)(a1 + 80);
    [v9 configurationSuccessfullyApplied:v17 reasons:v5 completionHandler:v24];
  }
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_cleanupDeclarationKeysIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  uint64_t v12 = v11;
  if (a5)
  {
    id v13 = [v10 nextObject];
    uint64_t v14 = v13;
    if (v13)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke;
      v15[3] = &unk_26548F4D8;
      id v16 = v13;
      uint64_t v17 = self;
      id v18 = v10;
      int64_t v20 = a4;
      BOOL v21 = a5;
      id v19 = v12;
      +[RMSubscriberStore unassignAssets:v16 scope:a4 completionHandler:v15];
    }
    else
    {
      v12[2](v12);
    }
  }
  else
  {
    v11[2](v11);
  }
}

void __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(a1);
    }
  }
  [*(id *)(a1 + 40) _cleanupDeclarationKeysIfNeeded:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) doIt:*(unsigned __int8 *)(a1 + 72) completionHandler:*(void *)(a1 + 56)];
}

- (void)_uninstallDeclarationKeys:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = [v8 nextObject];
  if (v10)
  {
    id v11 = [(RMConfigurationMultipleApplicator *)self wrappingAdapter];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke;
    v12[3] = &unk_26548F488;
    id v13 = v10;
    uint64_t v14 = self;
    int64_t v17 = a4;
    id v15 = v8;
    id v16 = v9;
    [v11 removeDeclarationKey:v13 scope:a4 completionHandler:v12];
  }
  else
  {
    v9[2](v9);
  }
}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(a1);
  }

  v19[0] = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v7 = *(void **)(a1 + 40);
  id v8 = [v6 objectEnumerator];
  uint64_t v9 = *(void *)(a1 + 64);
  if (v3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [*(id *)(a1 + 40) doKeychainUnassign];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_61;
  v15[3] = &unk_26548F438;
  id v11 = *(void **)(a1 + 48);
  void v15[4] = *(void *)(a1 + 40);
  id v12 = v11;
  uint64_t v14 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  id v16 = v12;
  uint64_t v18 = v13;
  id v17 = v14;
  [v7 _cleanupDeclarationKeysIfNeeded:v8 scope:v9 doIt:v10 completionHandler:v15];
}

uint64_t __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _uninstallDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(RMConfigurationMultipleApplicator *)self wrappingAdapter];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_26548F148;
  id v12 = v8;
  id v10 = v8;
  [v9 endProcessingConfigurations:v6 scope:a4 completionHandler:v11];
}

void __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
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
        id v12 = [(RMConfigurationMultipleApplicator *)self adapter];
        uint64_t v13 = [v12 declarationKeyForConfiguration:v11];

        [v5 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_supportedConfigurationType:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RMConfigurationMultipleApplicator *)self adapter];
  id v6 = [v5 configurationClasses];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_usesKeychain
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(RMConfigurationMultipleApplicator *)self adapter];
  id v3 = [v2 configurationClasses];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) usesKeychainAssets])
        {
          uint64_t v9 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[RMConfigurationMultipleApplicator _usesKeychain](v9);
          }

          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v3 = [MEMORY[0x263F635B0] configurationMultipleApplicator];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[RMConfigurationMultipleApplicator _usesKeychain](v3);
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (RMConfigurationMultipleAdapter)adapter
{
  return self->_adapter;
}

- (BOOL)inPlaceUpdates
{
  return self->_inPlaceUpdates;
}

- (void)setInPlaceUpdates:(BOOL)a3
{
  self->_inPlaceUpdates = a3;
}

- (BOOL)removeBeforeApply
{
  return self->_removeBeforeApply;
}

- (void)setRemoveBeforeApply:(BOOL)a3
{
  self->_removeBeforeApply = a3;
}

- (WrappedMultipleAdapter)wrappingAdapter
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

void __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to begin processing configurations: %{public}@", v2, v3, v4, v5, v6);
}

void __128__RMConfigurationMultipleApplicator__fetchExistingDeclarationKeysWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to fetch declaration keys: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_installDeclarationKeys:scope:configurations:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Declaration not supported: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_installDeclarationKeys:scope:configurations:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Incorrect declaration class: %{public}@", v2, v3, v4, v5, v6);
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Applied new configuration: %{public}@", v4, v5, v6, v7, v8);
}

void __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to apply new configuration: %{public}@ error:%{public}@", v4, v5, v6, v7, v8);
}

void __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to unassign asset reference %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_0(&dword_25B003000, v2, v3, "Removed configuration: %{public}@", v4, v5, v6, v7, v8);
}

void __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_2_1(a1) key];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_25B003000, v2, v3, "Failed to remove configuration: %{public}@ error:%{public}@", v4, v5, v6, v7, v8);
}

void __87__RMConfigurationMultipleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to end processing configurations: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_usesKeychain
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Uses keychain assets", v1, 2u);
}

@end