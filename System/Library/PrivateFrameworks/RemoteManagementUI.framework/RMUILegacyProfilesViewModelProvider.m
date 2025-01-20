@interface RMUILegacyProfilesViewModelProvider
- (NSMutableArray)profileViewModels;
- (NSSet)filterDeclarationIdentifiers;
- (RMObserverStore)observerStore;
- (RMUILegacyProfilesViewModelProvider)initWithScope:(int64_t)a3;
- (int64_t)scope;
- (void)_updateViewModelsWithDeclarations:(id)a3;
- (void)loadProfilesFromConfigurationsWithCompletionHandler:(id)a3;
- (void)setFilterDeclarationIdentifiers:(id)a3;
- (void)setObserverStore:(id)a3;
- (void)setProfileViewModels:(id)a3;
@end

@implementation RMUILegacyProfilesViewModelProvider

- (RMUILegacyProfilesViewModelProvider)initWithScope:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMUILegacyProfilesViewModelProvider;
  v4 = [(RMUILegacyProfilesViewModelProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    profileViewModels = v4->_profileViewModels;
    v4->_profileViewModels = (NSMutableArray *)v5;

    v4->_scope = a3;
  }
  return v4;
}

- (void)_updateViewModelsWithDeclarations:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RMUILegacyProfilesViewModelProvider *)self profileViewModels];
  [v5 removeAllObjects];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        v12 = objc_opt_new();
        v13 = objc_msgSend(v11, "label", (void)v21);
        [v12 setTitle:v13];

        v14 = [v11 profileIdentifier];
        [v12 setProfileIdentifier:v14];

        v15 = [v11 declaration];
        [v12 setDeclaration:v15];

        [v12 setSymbol:1];
        objc_msgSend(v12, "setIsInteractiveProfile:", objc_msgSend(v11, "isRequired") ^ 1);
        if ([v12 isInteractiveProfile])
        {
          v16 = [v11 label];
          v17 = [v12 toggleViewModel];
          [v17 setTitle:v16];

          uint64_t v18 = [v11 isActive];
          v19 = [v11 profileIdentifier];
          [v12 setInteractiveProfileActive:v18 profileIdentifier:v19];
        }
        v20 = [(RMUILegacyProfilesViewModelProvider *)self profileViewModels];
        [v20 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)loadProfilesFromConfigurationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_2646FEC48;
  objc_copyWeak(&v14, &location);
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x22A620FE0](v12);
  uint64_t v7 = [(RMUILegacyProfilesViewModelProvider *)self observerStore];
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8;
    v9[3] = &unk_2646FEC70;
    v11 = v6;
    v9[4] = self;
    id v10 = v7;
    [v10 displayableProfileConfigurationsWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v8 = +[RMUILog profilesViewModelProvider];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RMUILegacyProfilesViewModelProvider loadProfilesFromConfigurationsWithCompletionHandler:](v8);
    }

    v6[2](v6, MEMORY[0x263EFFA68]);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_2646FEC20;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

uint64_t __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _updateViewModelsWithDeclarations:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
    }
  }

  return MEMORY[0x270F9A758]();
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RMUILog profilesViewModelProvider];
  id v8 = v7;
  if (v5)
  {
    id v33 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_2(v5, v8);
    }

    v37 = objc_msgSend(MEMORY[0x263F63708], "newProfileControllerWithPrefix:scope:", *MEMORY[0x263F636D8], objc_msgSend(*(id *)(a1 + 32), "scope"));
    v36 = [v37 installedProfileIdentifiers];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F63708], "newProfileControllerWithPrefix:scope:", *MEMORY[0x263F636E0], objc_msgSend(*(id *)(a1 + 32), "scope"));
    v35 = [v9 installedProfileIdentifiers];
    v38 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v5;
    id v10 = v5;
    v11 = v9;
    id obj = v10;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          v16 = v11;
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "declarationIdentifier", v33);
          uint64_t v19 = [*(id *)(a1 + 32) filterDeclarationIdentifiers];
          if (v19)
          {
            v20 = (void *)v19;
            long long v21 = [*(id *)(a1 + 32) filterDeclarationIdentifiers];
            char v22 = [v21 containsObject:v18];

            if ((v22 & 1) == 0)
            {
              long long v23 = +[RMUILog profilesViewModelProvider];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v18;
                _os_log_debug_impl(&dword_224D14000, v23, OS_LOG_TYPE_DEBUG, "Ignoring configuration: %@", buf, 0xCu);
              }
              v11 = v16;
              goto LABEL_24;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = v16;
            long long v23 = [v16 profileIdentifierForDeclaration:v17 store:*(void *)(a1 + 40)];
            if (!v23
              || ([v16 profileNameForProfileIdentifier:v23],
                  (uint64_t v24 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v25 = +[RMUILog profilesViewModelProvider];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v23;
                _os_log_error_impl(&dword_224D14000, v25, OS_LOG_TYPE_ERROR, "Error fetching name from legacy profile %{public}@", buf, 0xCu);
              }
              goto LABEL_23;
            }
            v25 = v24;
            uint64_t v26 = [v35 containsObject:v23];
            v27 = [RMUIDeclarationInfo alloc];
            v28 = v17;
            v29 = v25;
            v30 = v23;
            uint64_t v31 = 1;
          }
          else
          {
            objc_opt_class();
            v11 = v16;
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_25;
            }
            long long v23 = [v37 profileIdentifierForDeclaration:v17 store:*(void *)(a1 + 40)];
            v25 = [v17 payloadVisibleName];
            uint64_t v26 = [v36 containsObject:v23];
            v27 = [RMUIDeclarationInfo alloc];
            v28 = v17;
            v29 = v25;
            v30 = v23;
            uint64_t v31 = 0;
          }
          v32 = [(RMUIDeclarationInfo *)v27 initWithProfileDeclaration:v28 label:v29 profileIdentifier:v30 isRequired:v31 isActive:v26];
          [v38 addObject:v32];

          v11 = v16;
LABEL_23:

LABEL_24:
LABEL_25:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v13);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = v33;
    id v5 = v34;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (NSMutableArray)profileViewModels
{
  return self->_profileViewModels;
}

- (void)setProfileViewModels:(id)a3
{
}

- (RMObserverStore)observerStore
{
  return self->_observerStore;
}

- (void)setObserverStore:(id)a3
{
}

- (NSSet)filterDeclarationIdentifiers
{
  return self->_filterDeclarationIdentifiers;
}

- (void)setFilterDeclarationIdentifiers:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);

  objc_storeStrong((id *)&self->_profileViewModels, 0);
}

- (void)loadProfilesFromConfigurationsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D14000, log, OS_LOG_TYPE_ERROR, "Cannot loadProfiles without an observerStore", v1, 2u);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224D14000, a2, OS_LOG_TYPE_ERROR, "Failed to find RMConfigurationTypeLegacyProfiles & RMConfigurationTypeLegacyInteractiveProfiles configurations: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __91__RMUILegacyProfilesViewModelProvider_loadProfilesFromConfigurationsWithCompletionHandler___block_invoke_8_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_224D14000, a2, OS_LOG_TYPE_DEBUG, "Found RMConfigurationTypeLegacyProfiles & RMConfigurationTypeLegacyInteractiveProfiles configurations: %lu", (uint8_t *)&v3, 0xCu);
}

@end