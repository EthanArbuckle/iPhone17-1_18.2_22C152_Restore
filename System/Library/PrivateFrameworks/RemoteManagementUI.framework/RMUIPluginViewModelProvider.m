@interface RMUIPluginViewModelProvider
- (NSMutableArray)pluginSectionViewModels;
- (NSMutableArray)pluginViewModels;
- (NSSet)filterDeclarationIdentifiers;
- (RMObserverStore)observerStore;
- (RMUIPluginViewModelProvider)init;
- (id)_modelForDeclarationInfo:(id)a3;
- (id)_sectionNameForDeclarationType:(id)a3;
- (signed)_symbolForDeclarationType:(id)a3;
- (void)_addModel:(id)a3 toSection:(id)a4;
- (void)_updateViewModelsWithDeclarations:(id)a3;
- (void)loadPluginsFromConfigurationsWithCompletionHandler:(id)a3;
- (void)setFilterDeclarationIdentifiers:(id)a3;
- (void)setObserverStore:(id)a3;
- (void)setPluginSectionViewModels:(id)a3;
- (void)setPluginViewModels:(id)a3;
@end

@implementation RMUIPluginViewModelProvider

- (RMUIPluginViewModelProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)RMUIPluginViewModelProvider;
  v2 = [(RMUIPluginViewModelProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pluginSectionViewModels = v2->_pluginSectionViewModels;
    v2->_pluginSectionViewModels = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    pluginViewModels = v2->_pluginViewModels;
    v2->_pluginViewModels = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)_updateViewModelsWithDeclarations:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RMUIPluginViewModelProvider *)self pluginSectionViewModels];
  [v5 removeAllObjects];

  v6 = [(RMUIPluginViewModelProvider *)self pluginViewModels];
  [v6 removeAllObjects];

  v7 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(RMUIPluginViewModelProvider *)self _modelForDeclarationInfo:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        [(RMUIPluginViewModelProvider *)self _addModel:v13 toSection:v7];
        v14 = [(RMUIPluginViewModelProvider *)self pluginViewModels];
        [v14 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }
  v34 = v8;

  uint64_t v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"declarationType" ascending:1];
  uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  uint64_t v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"declarationIdentifier" ascending:1];
  v32 = (void *)v16;
  v33 = (void *)v15;
  v45[0] = v15;
  v45[1] = v16;
  v31 = (void *)v17;
  v45[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  v19 = [(RMUIPluginViewModelProvider *)self pluginViewModels];
  [v19 sortUsingDescriptors:v18];

  v20 = [v7 allKeys];
  v21 = [v20 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        v27 = [v7 objectForKeyedSubscript:v26];
        v28 = [v27 sortedArrayUsingDescriptors:v18];
        id v29 = +[RMUIPluginSectionViewModel newPluginSectionViewModelWithHeading:v26 viewModels:v28];

        v30 = [(RMUIPluginViewModelProvider *)self pluginSectionViewModels];
        [v30 addObject:v29];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v23);
  }
}

- (id)_modelForDeclarationInfo:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v6 = [v4 label];
  [v5 setTitle:v6];

  v7 = [v4 declarationType];
  objc_msgSend(v5, "setSymbol:", -[RMUIPluginViewModelProvider _symbolForDeclarationType:](self, "_symbolForDeclarationType:", v7));

  id v8 = [v4 declarationIdentifier];
  [v5 setDeclarationIdentifier:v8];

  uint64_t v9 = [v4 declarationServerToken];
  [v5 setDeclarationServerToken:v9];

  uint64_t v10 = [v4 declarationType];
  [v5 setDeclarationType:v10];

  uint64_t v11 = [v4 details];
  if (v11)
  {
    v25 = v5;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v24 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v18 count] == 2)
          {
            v19 = [RMUIKeyValueDetailViewModel alloc];
            v20 = [v18 objectAtIndexedSubscript:0];
            v21 = [v18 objectAtIndexedSubscript:1];
            uint64_t v22 = [(RMUIKeyValueDetailViewModel *)v19 initWithTitle:v20 value:v21];
            [v12 addObject:v22];
          }
          else
          {
            v20 = +[RMUILog pluginViewModelProvider];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v18;
              _os_log_error_impl(&dword_224D14000, v20, OS_LOG_TYPE_ERROR, "Cannot load details for non-tuple: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v15);
    }

    uint64_t v5 = v25;
    [v25 setDetailViewModels:v12];

    uint64_t v11 = v24;
  }

  return v5;
}

- (void)_addModel:(id)a3 toSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v10 declarationType];
  id v8 = [(RMUIPluginViewModelProvider *)self _sectionNameForDeclarationType:v7];

  uint64_t v9 = [v6 objectForKeyedSubscript:v8];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    [v6 setObject:v9 forKeyedSubscript:v8];
  }
  [v9 addObject:v10];
}

- (void)loadPluginsFromConfigurationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke;
  v11[3] = &unk_2646FEC48;
  objc_copyWeak(&v13, &location);
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x22A620FE0](v11);
  v7 = [(RMUIPluginViewModelProvider *)self observerStore];
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87;
    v9[3] = &unk_2646FEC98;
    v9[4] = self;
    id v10 = v6;
    [v7 displayPropertiesForConfigurationsWithCompletionHandler:v9];
  }
  else
  {
    id v8 = +[RMUILog pluginViewModelProvider];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RMUIPluginViewModelProvider loadPluginsFromConfigurationsWithCompletionHandler:](v8);
    }

    v6[2](v6, MEMORY[0x263EFFA68]);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_2646FEC20;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

uint64_t __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_2(uint64_t a1)
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

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[RMUILog pluginViewModelProvider];
  id v8 = v7;
  if (v5)
  {
    id v26 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87_cold_2(v5, v8);
    }

    v30 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v5;
    obuint64_t j = v5;
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v34;
      uint64_t v29 = a1;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "declarationIdentifier", v26);
          uint64_t v12 = [*(id *)(a1 + 32) filterDeclarationIdentifiers];
          if (v12
            && (id v13 = (void *)v12,
                [*(id *)(a1 + 32) filterDeclarationIdentifiers],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = [v14 containsObject:v11],
                v14,
                v13,
                (v15 & 1) == 0))
          {
            uint64_t v23 = +[RMUILog pluginViewModelProvider];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v38 = v11;
              _os_log_debug_impl(&dword_224D14000, v23, OS_LOG_TYPE_DEBUG, "Ignoring configuration: %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v16 = [RMUIDeclarationInfo alloc];
            uint64_t v17 = [v10 declarationServerToken];
            v18 = [v10 declarationType];
            v19 = [v10 declarationDetails];
            v20 = [v19 titleUI];
            v21 = [v10 declarationDetails];
            uint64_t v22 = [v21 descriptionUI];
            uint64_t v23 = [(RMUIDeclarationInfo *)v16 initWithDeclarationIdentifier:v11 declarationServerToken:v17 declarationType:v18 label:v20 descriptor:v22];

            uint64_t v24 = [v10 declarationDetails];
            v25 = [v24 detailsUI];
            [v23 setDetails:v25];

            a1 = v29;
            [v30 addObject:v23];
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v32);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (signed)_symbolForDeclarationType:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  __int16 v13 = 1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__RMUIPluginViewModelProvider__symbolForDeclarationType___block_invoke;
  v7[3] = &unk_2646FECC0;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = &v10;
  [&unk_26D81C668 enumerateKeysAndObjectsUsingBlock:v7];
  signed __int16 v5 = *((_WORD *)v11 + 12);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __57__RMUIPluginViewModelProvider__symbolForDeclarationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 intValue];
    *a4 = 1;
  }
}

- (id)_sectionNameForDeclarationType:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = +[RMUILocalizable string:@"RMUI_SECTION_OTHERS"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__RMUIPluginViewModelProvider__sectionNameForDeclarationType___block_invoke;
  v7[3] = &unk_2646FECE8;
  id v4 = v3;
  id v8 = v4;
  uint64_t v9 = &v10;
  [&unk_26D81C690 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __62__RMUIPluginViewModelProvider__sectionNameForDeclarationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    uint64_t v7 = +[RMUILocalizable string:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (NSMutableArray)pluginSectionViewModels
{
  return self->_pluginSectionViewModels;
}

- (void)setPluginSectionViewModels:(id)a3
{
}

- (NSMutableArray)pluginViewModels
{
  return self->_pluginViewModels;
}

- (void)setPluginViewModels:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_pluginViewModels, 0);

  objc_storeStrong((id *)&self->_pluginSectionViewModels, 0);
}

- (void)loadPluginsFromConfigurationsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D14000, log, OS_LOG_TYPE_ERROR, "Cannot loadPlugins without an observerStore", v1, 2u);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224D14000, a2, OS_LOG_TYPE_ERROR, "Failed to find plugin properties: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __82__RMUIPluginViewModelProvider_loadPluginsFromConfigurationsWithCompletionHandler___block_invoke_87_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_224D14000, a2, OS_LOG_TYPE_DEBUG, "Found configuration properties: %lu", (uint8_t *)&v3, 0xCu);
}

@end