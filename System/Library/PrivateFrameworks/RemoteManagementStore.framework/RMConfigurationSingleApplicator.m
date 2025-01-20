@interface RMConfigurationSingleApplicator
- (BOOL)_supportedConfigurationType:(id)a3;
- (BOOL)_usesKeychain;
- (BOOL)doKeychainUnassign;
- (RMConfigurationSingleAdapter)adapter;
- (RMConfigurationSingleApplicator)initWithAdapter:(id)a3;
- (WrappedSingleAdapter)wrappingAdapter;
- (id)_configurationByDeclarationKeyFromConfigurations:(id)a3;
- (void)_beginProcessingWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_cleanupDeclarationKeyIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6;
- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)_fetchExistingDeclarationKeyWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)_installDeclarationKey:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6;
- (void)_invalidDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6;
- (void)_processExistingDeclarationKeyWithConfigurations:(id)a3 oldDeclarationKey:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7;
- (void)_uninstallDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setDoKeychainUnassign:(BOOL)a3;
@end

@implementation RMConfigurationSingleApplicator

- (RMConfigurationSingleApplicator)initWithAdapter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationSingleApplicator;
  v6 = [(RMConfigurationSingleApplicator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = [[WrappedSingleAdapter alloc] initWithAdapter:v7->_adapter];
    wrappingAdapter = v7->_wrappingAdapter;
    v7->_wrappingAdapter = v8;

    v7->_doKeychainUnassign = [(RMConfigurationSingleApplicator *)v7 _usesKeychain];
  }

  return v7;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = [(RMConfigurationSingleApplicator *)self adapter];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    objc_super v11 = [(RMConfigurationSingleApplicator *)self adapter];
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
  v13 = [(RMConfigurationSingleApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __113__RMConfigurationSingleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __113__RMConfigurationSingleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F635B0] configurationSingleApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __115__RMConfigurationMultipleApplicator__beginProcessingWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _fetchExistingDeclarationKeyWithConfigurations:*(void *)(a1 + 40) storesByIdentifier:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)_fetchExistingDeclarationKeyWithConfigurations:(id)a3 storesByIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(RMConfigurationSingleApplicator *)self wrappingAdapter];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke;
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

void __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x263F635B0] configurationSingleApplicator];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _endProcessingWithSuccess:0 scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    v7 = [a2 anyObject];
    if (v7 || [*(id *)(a1 + 40) count]) {
      [*(id *)(a1 + 32) _processExistingDeclarationKeyWithConfigurations:*(void *)(a1 + 40) oldDeclarationKey:v7 storesByIdentifier:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
    }
    else {
      [*(id *)(a1 + 32) _endProcessingWithSuccess:1 scope:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
    }
  }
}

- (void)_processExistingDeclarationKeyWithConfigurations:(id)a3 oldDeclarationKey:(id)a4 storesByIdentifier:(id)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v39 = a5;
  id v13 = a7;
  v40 = v11;
  id v14 = [(RMConfigurationSingleApplicator *)self _configurationByDeclarationKeyFromConfigurations:v11];
  id v15 = (void *)MEMORY[0x263EFFA08];
  id v16 = [v14 allKeys];
  v17 = [v15 setWithArray:v16];

  if (v12)
  {
    uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v12];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  id v19 = (void *)v18;
  id v59 = 0;
  v60[0] = 0;
  id v58 = 0;
  +[RMStoreDeclarationKey synchronizeOldKeys:v18 newKeys:v17 returningUnchangedKeys:v60 returningApplyKeys:&v59 returningRemoveKeys:&v58];
  id v20 = v60[0];
  id v21 = v59;
  id v42 = v58;

  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke;
  v51[3] = &unk_26548F500;
  v51[4] = &v52;
  v43 = v21;
  [v21 enumerateObjectsUsingBlock:v51];
  v22 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v38 = v17;
  if ([v20 count])
  {
    [v22 unionSet:v17];
    v23 = [v20 anyObject];
    [v22 removeObject:v23];
    id v24 = 0;
LABEL_15:
    v29 = self;
    v30 = v20;
    v31 = v12;

LABEL_16:
    v28 = 0;
    goto LABEL_17;
  }
  v25 = (void *)v53[5];
  if (v25)
  {
    id v24 = v25;
    [v22 unionSet:v17];
    v23 = [v24 applyKey];
    [v22 removeObject:v23];
    goto LABEL_15;
  }
  if ([v21 count])
  {
    if ([v42 count])
    {
      v37 = [v21 anyObject];
      v26 = [v37 applyKey];
      v27 = [v42 anyObject];
      id v24 = +[RMStoreDeclarationKeyPair newDeclarationKeyPairWithUpdateKey:v26 replaceKey:v27];
    }
    else
    {
      id v24 = [v21 anyObject];
    }
    [v22 unionSet:v17];
    v23 = [v24 applyKey];
    [v22 removeObject:v23];
    goto LABEL_15;
  }
  if (![v42 count])
  {
    v29 = self;
    v30 = v20;
    v31 = v12;
    id v24 = 0;
    goto LABEL_16;
  }
  v28 = [v42 anyObject];
  v29 = self;
  v30 = v20;
  v31 = v12;
  id v24 = 0;
LABEL_17:
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_2;
  v44[3] = &unk_26548F528;
  v44[4] = v29;
  id v32 = v22;
  id v45 = v32;
  int64_t v50 = a6;
  id v33 = v14;
  id v46 = v33;
  id v34 = v24;
  id v47 = v34;
  id v35 = v28;
  id v48 = v35;
  id v36 = v13;
  id v49 = v36;
  [(RMConfigurationSingleApplicator *)v29 _installDeclarationKey:v34 scope:a6 configurations:v33 completionHandler:v44];

  _Block_object_dispose(&v52, 8);
}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  v6 = [v7 replaceKey];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectEnumerator];
  uint64_t v4 = *(void *)(a1 + 80);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_3;
  v8[3] = &unk_26548F398;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 80);
  id v9 = v6;
  uint64_t v12 = v7;
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  [v2 _invalidDeclarationKeys:v3 scope:v4 configurations:v5 completionHandler:v8];
}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) replaceKey];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = [*(id *)(a1 + 32) doKeychainUnassign];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_4;
  v9[3] = &unk_26548F438;
  v9[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v10 = v6;
  uint64_t v12 = v7;
  id v11 = v8;
  [v2 _cleanupDeclarationKeyIfNeeded:v3 scope:v4 doIt:v5 completionHandler:v9];
}

void __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_5;
  v4[3] = &unk_26548F370;
  v4[4] = v1;
  uint64_t v6 = v3;
  id v5 = *(id *)(a1 + 48);
  [v1 _uninstallDeclarationKey:v2 scope:v3 completionHandler:v4];
}

uint64_t __145__RMConfigurationSingleApplicator__processExistingDeclarationKeyWithConfigurations_oldDeclarationKey_storesByIdentifier_scope_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endProcessingWithSuccess:1 scope:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_installDeclarationKey:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v10)
  {
    id v14 = [v10 applyKey];
    id v15 = [v11 objectForKeyedSubscript:v14];
    id v16 = [v15 declaration];
    if ([(RMConfigurationSingleApplicator *)self _supportedConfigurationType:v16])
    {
      v17 = [v15 store];
      char v18 = [v17 isValidDeclaration:v16];

      if (v18)
      {
        id v19 = [(RMConfigurationSingleApplicator *)self wrappingAdapter];
        id v20 = [v10 replaceKey];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2;
        v26[3] = &unk_26548F550;
        id v27 = v14;
        id v28 = v15;
        id v29 = v16;
        id v30 = v13;
        [v19 applyConfiguration:v28 replaceKey:v20 scope:a4 completionHandler:v26];

        id v21 = v27;
      }
      else
      {
        id v24 = [MEMORY[0x263F635B0] configurationSingleApplicator];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:]();
        }

        v25 = [v15 store];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_55;
        v31[3] = &unk_26548F148;
        id v32 = v13;
        [v25 configurationNotSupported:v16 error:0 completionHandler:v31];

        id v21 = v32;
      }
    }
    else
    {
      v22 = [MEMORY[0x263F635B0] configurationSingleApplicator];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:]();
      }

      id v21 = [MEMORY[0x263F63598] createInternalError];
      v23 = [v15 store];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke;
      v33[3] = &unk_26548F148;
      id v34 = v13;
      [v23 configurationIsInvalid:v16 error:v21 completionHandler:v33];
    }
  }
  else
  {
    (*((void (**)(id))v12 + 2))(v12);
  }
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F635B0] configurationSingleApplicator];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_2(a1);
    }

    id v9 = [*(id *)(a1 + 40) store];
    uint64_t v10 = *(void *)(a1 + 48);
    if (v5)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_56;
      v17[3] = &unk_26548F148;
      id v11 = &v18;
      id v18 = *(id *)(a1 + 56);
      [v9 configurationErrorReasons:v10 reasons:v5 completionHandler:v17];
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2_57;
      v15[3] = &unk_26548F148;
      id v11 = &v16;
      id v16 = *(id *)(a1 + 56);
      [v9 configurationFailedToApply:v10 error:v6 completionHandler:v15];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __100__RMConfigurationMultipleApplicator__installDeclarationKeys_scope_configurations_completionHandler___block_invoke_2_cold_1(a1);
    }

    id v9 = [*(id *)(a1 + 40) store];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_58;
    v13[3] = &unk_26548F148;
    id v11 = &v14;
    uint64_t v12 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v9 configurationSuccessfullyApplied:v12 reasons:v5 completionHandler:v13];
  }
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_2_57(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__RMConfigurationSingleApplicator__installDeclarationKey_scope_configurations_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidDeclarationKeys:(id)a3 scope:(int64_t)a4 configurations:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(void))a6;
  id v13 = [v10 nextObject];
  if (v13)
  {
    id v14 = [v11 objectForKeyedSubscript:v13];
    id v15 = [v14 declaration];
    if ([(RMConfigurationSingleApplicator *)self _supportedConfigurationType:v15])
    {
      id v16 = [v14 store];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke_2;
      v20[3] = &unk_26548F488;
      v20[4] = self;
      id v21 = v10;
      int64_t v24 = a4;
      id v22 = v11;
      v23 = v12;
      [v16 configurationFailedAlreadyPresent:v15 completionHandler:v20];
    }
    else
    {
      v17 = [MEMORY[0x263F635B0] configurationSingleApplicator];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[RMConfigurationMultipleApplicator _installDeclarationKeys:scope:configurations:completionHandler:]();
      }

      id v18 = [MEMORY[0x263F63598] createInternalError];
      id v19 = [v14 store];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke;
      v25[3] = &unk_26548F488;
      v25[4] = self;
      id v26 = v10;
      int64_t v29 = a4;
      id v27 = v11;
      id v28 = v12;
      [v19 configurationIsInvalid:v15 error:v18 completionHandler:v25];
    }
  }
  else
  {
    v12[2](v12);
  }
}

uint64_t __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __98__RMConfigurationSingleApplicator__invalidDeclarationKeys_scope_configurations_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidDeclarationKeys:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) configurations:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_cleanupDeclarationKeyIfNeeded:(id)a3 scope:(int64_t)a4 doIt:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = v10;
  if (v9 && a5)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __95__RMConfigurationSingleApplicator__cleanupDeclarationKeyIfNeeded_scope_doIt_completionHandler___block_invoke;
    v12[3] = &unk_26548F578;
    id v13 = v9;
    id v14 = v11;
    +[RMSubscriberStore unassignAssets:v13 scope:a4 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

void __95__RMConfigurationSingleApplicator__cleanupDeclarationKeyIfNeeded_scope_doIt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F635B0] configurationSingleApplicator];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98__RMConfigurationMultipleApplicator__cleanupDeclarationKeysIfNeeded_scope_doIt_completionHandler___block_invoke_cold_1(a1);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_uninstallDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    id v11 = [(RMConfigurationSingleApplicator *)self wrappingAdapter];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __84__RMConfigurationSingleApplicator__uninstallDeclarationKey_scope_completionHandler___block_invoke;
    v12[3] = &unk_26548F5A0;
    id v13 = v8;
    id v14 = self;
    int64_t v16 = a4;
    id v15 = v10;
    [v11 removeDeclarationKey:v13 scope:a4 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

void __84__RMConfigurationSingleApplicator__uninstallDeclarationKey_scope_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F635B0] configurationSingleApplicator];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_2((uint64_t)a1);
    }

    uint64_t v6 = 0;
    uint64_t v8 = a1[4];
    uint64_t v7 = (void *)a1[5];
    uint64_t v9 = a1[7];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __87__RMConfigurationMultipleApplicator__uninstallDeclarationKeys_scope_completionHandler___block_invoke_cold_1((uint64_t)a1);
    }

    uint64_t v8 = a1[4];
    uint64_t v7 = (void *)a1[5];
    uint64_t v9 = a1[7];
    uint64_t v6 = [v7 doKeychainUnassign];
  }
  [v7 _cleanupDeclarationKeyIfNeeded:v8 scope:v9 doIt:v6 completionHandler:a1[6]];
}

- (void)_endProcessingWithSuccess:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(RMConfigurationSingleApplicator *)self wrappingAdapter];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__RMConfigurationSingleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke;
  v11[3] = &unk_26548F148;
  id v12 = v8;
  id v10 = v8;
  [v9 endProcessingConfigurations:v6 scope:a4 completionHandler:v11];
}

void __85__RMConfigurationSingleApplicator__endProcessingWithSuccess_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F635B0] configurationSingleApplicator];
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
        id v12 = [(RMConfigurationSingleApplicator *)self adapter];
        id v13 = [v12 declarationKeyForConfiguration:v11];

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
  id v5 = [(RMConfigurationSingleApplicator *)self adapter];
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
  uint64_t v2 = [(RMConfigurationSingleApplicator *)self adapter];
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
          uint64_t v9 = [MEMORY[0x263F635B0] configurationSingleApplicator];
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

  id v3 = [MEMORY[0x263F635B0] configurationSingleApplicator];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[RMConfigurationMultipleApplicator _usesKeychain](v3);
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (RMConfigurationSingleAdapter)adapter
{
  return self->_adapter;
}

- (WrappedSingleAdapter)wrappingAdapter
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

void __125__RMConfigurationSingleApplicator__fetchExistingDeclarationKeyWithConfigurations_storesByIdentifier_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed to fetch declaration key: %{public}@", v2, v3, v4, v5, v6);
}

@end