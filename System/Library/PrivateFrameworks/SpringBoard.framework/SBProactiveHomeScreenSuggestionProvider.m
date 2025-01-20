@interface SBProactiveHomeScreenSuggestionProvider
- (ATXHomeScreenPrediction)currentPrediction;
- (SBIconController)iconController;
- (SBProactiveHomeScreenSuggestionProvider)initWithIconController:(id)a3;
- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7;
- (id)_makeDataSourceForAtxWidget:(id)a3;
- (id)_supportedElementClasses;
- (id)iconModel;
- (id)rootFolder;
- (void)addObserver:(id)a3;
- (void)processUpdatedPredictions:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCurrentPrediction:(id)a3;
- (void)updatePredictions;
@end

@implementation SBProactiveHomeScreenSuggestionProvider

- (SBProactiveHomeScreenSuggestionProvider)initWithIconController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBProactiveHomeScreenSuggestionProvider;
  v5 = [(SBProactiveHomeScreenSuggestionProvider *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconController, v4);
    v7 = [MEMORY[0x1E4F4B0C0] sharedInstance];
    [v7 registerObserver:v6];

    [(SBProactiveHomeScreenSuggestionProvider *)v6 updatePredictions];
  }

  return v6;
}

- (id)iconModel
{
  v2 = [(SBProactiveHomeScreenSuggestionProvider *)self iconController];
  v3 = [v2 iconManager];
  id v4 = [v3 iconModel];

  return v4;
}

- (id)rootFolder
{
  v2 = [(SBProactiveHomeScreenSuggestionProvider *)self iconModel];
  v3 = [v2 rootFolder];

  return v3;
}

- (void)updatePredictions
{
  v3 = SBLogProactiveHome();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "fetching new home screen predictions", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke;
  v5[3] = &unk_1E6B03F98;
  v5[4] = self;
  [v4 homeScreenPredictionWithReply:v5];
}

void __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = a3;
  id v5 = v7;
  id v6 = v4;
  BSDispatchMain();
}

uint64_t __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    return objc_msgSend(v2, "processUpdatedPredictions:");
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = SBLogProactiveHome();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2_cold_1((uint64_t *)(a1 + 48), v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "No prediction when fetching home screen widget predictions", v7, 2u);
    }

    return [*(id *)(a1 + 40) setCurrentPrediction:0];
  }
}

- (void)processUpdatedPredictions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogProactiveHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBProactiveHomeScreenSuggestionProvider processUpdatedPredictions:](v4, v5);
  }

  id v6 = [(SBProactiveHomeScreenSuggestionProvider *)self currentPrediction];
  [(SBProactiveHomeScreenSuggestionProvider *)self setCurrentPrediction:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v11++) proactiveHomeScreenSuggestionProviderDidUpdatePrediction:self];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v12 = [(SBProactiveHomeScreenSuggestionProvider *)self rootFolder];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke;
  v15[3] = &unk_1E6B03FE8;
  id v16 = v4;
  id v17 = v6;
  v18 = self;
  id v13 = v6;
  id v14 = v4;
  [v12 enumerateAllIconsUsingBlock:v15];
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isWidgetStackIcon])
  {
    id v4 = v3;
    id v5 = [v4 uniqueIdentifier];
    id v6 = [*(id *)(a1 + 32) suggestionForStackIdentifier:v5];
    id v7 = [*(id *)(a1 + 40) suggestionForStackIdentifier:v5];
    uint64_t v8 = SBLogProactiveHome();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_cold_1();
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9;
    v14[3] = &unk_1E6AF4E28;
    uint64_t v9 = *(void *)(a1 + 48);
    id v15 = v6;
    uint64_t v16 = v9;
    id v17 = v4;
    id v18 = v5;
    id v19 = v7;
    id v10 = v7;
    id v11 = v5;
    id v12 = v4;
    id v13 = v6;
    [v12 performCoalescedDataSourceUpdate:v14];
  }
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v3 = [*(id *)(a1 + 32) suggestedWidgets];
  uint64_t v51 = [v3 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v51)
  {
    uint64_t v5 = *(void *)v62;
    *(void *)&long long v4 = 138412290;
    long long v46 = v4;
    v48 = v3;
    v49 = v2;
    uint64_t v47 = *(void *)v62;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v62 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v52 = v6;
        id v7 = *(void **)(*((void *)&v61 + 1) + 8 * v6);
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        id v10 = objc_msgSend(v7, "widgetUniqueId", v46);
        id v11 = [v7 extensionBundleId];
        id v12 = [v7 widgetKind];
        id v13 = [v8 _iconDataSourceInIcon:v9 withUniqueIdentifier:v10 extensionBundleIdentifier:v11 widgetKind:v12 suggestionSource:1];

        if (v13)
        {
          id v14 = SBLogProactiveHome();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v46;
            v67 = v13;
            _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "skipping adding data source because the suggested widget %@ is already suggested in stack", buf, 0xCu);
          }

          [v2 addObject:v13];
        }
        else
        {
          id v15 = [*(id *)(a1 + 40) _makeDataSourceForAtxWidget:v7];
          if (v15)
          {
            uint64_t v16 = SBLogProactiveHome();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v46;
              v67 = v15;
              _os_log_debug_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEBUG, "adding new suggested widget data source %@", buf, 0xCu);
            }
            v50 = v15;

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id obj = *(id *)(*(void *)(a1 + 40) + 8);
            uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v58 != v19) {
                    objc_enumerationMutation(obj);
                  }
                  long long v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  uint64_t v22 = *(void *)(a1 + 40);
                  v23 = [v7 intent];
                  uint64_t v24 = *(void *)(a1 + 56);
                  v25 = [v7 widgetUniqueId];
                  [v21 proactiveHomeScreenSuggestionProvider:v22 willUseTemporaryIntent:v23 forIconWithIdentifier:v24 widgetUniqueIdentifier:v25];
                }
                uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
              }
              while (v18);
            }

            int v26 = [*(id *)(a1 + 48) allowsSuggestions];
            v27 = *(void **)(a1 + 48);
            if (v26)
            {
              id v15 = v50;
              [v27 addIconDataSource:v50];
            }
            else
            {
              v28 = [v27 activeDataSource];
              id v15 = v50;
              [*(id *)(a1 + 48) insertIconDataSource:v50 beforeIconDataSource:v28];
            }
            id v3 = v48;
            v2 = v49;
            uint64_t v5 = v47;
            id v13 = 0;
            [v49 addObject:v15];
          }
        }
        uint64_t v6 = v52 + 1;
      }
      while (v52 + 1 != v51);
      uint64_t v51 = [v3 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v51);
  }

  v30 = (id *)(a1 + 48);
  v29 = *(void **)(a1 + 48);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_11;
  v55[3] = &unk_1E6B03FC0;
  id v31 = v2;
  id v56 = v31;
  [v29 removeIconDataSourcesPassingTest:v55];
  v32 = [*(id *)(a1 + 40) iconController];
  [v32 iconManager];
  v34 = uint64_t v33 = a1;
  if ([v34 isShowingModalInteraction])
  {
    v35 = SBLogProactiveHome();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_1(v35);
    }
  }
  else
  {
    v36 = [*(id *)(v33 + 32) topWidget];

    if (v36)
    {
      v35 = [*(id *)(v33 + 32) topWidget];
      v37 = [*(id *)(v33 + 64) topWidget];
      if ([v35 isEqual:v37])
      {
        v38 = SBLogProactiveHome();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_3();
        }
      }
      else
      {
        id obja = v37;
        v40 = *(void **)(v33 + 40);
        uint64_t v39 = *(void *)(v33 + 48);
        v41 = [v35 widgetUniqueId];
        v42 = [v35 extensionBundleId];
        v43 = [v35 widgetKind];
        v38 = [v40 _iconDataSourceInIcon:v39 withUniqueIdentifier:v41 extensionBundleIdentifier:v42 widgetKind:v43 suggestionSource:0];

        v44 = SBLogProactiveHome();
        v45 = v44;
        if (v38)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_5((uint64_t)v38, v30, v45);
          }

          [*v30 setStackChangeReason:2];
          [*v30 setActiveDataSource:v38];
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_4(v35, v45);
          }
        }
        v37 = obja;
      }
    }
    else
    {
      v35 = SBLogProactiveHome();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_2(v35);
      }
    }
  }
}

uint64_t __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && [v3 suggestionSource] == 1
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    uint64_t v6 = SBLogProactiveHome();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_11_cold_1((uint64_t)v3, v6);
    }

    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (id)_supportedElementClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = self;
  id v4 = self;
  uint64_t v5 = self;
  uint64_t v6 = self;
  id v7 = self;
  id v8 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, 0);

  return v8;
}

- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a4)
  {
    uint64_t v15 = [v12 firstIconDataSourceWithUniqueIdentifier:a4];
LABEL_3:
    uint64_t v16 = (void *)v15;
    goto LABEL_8;
  }
  uint64_t v17 = [MEMORY[0x1E4FA6228] elementClassWithIdentifier:v13];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = [(SBProactiveHomeScreenSuggestionProvider *)self _supportedElementClasses];
    int v20 = [v19 containsObject:v18];

    if (v20)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke;
      v26[3] = &__block_descriptor_48_e32_B16__0___SBLeafIconDataSource__8lu40l8;
      v26[4] = a7;
      v26[5] = v18;
      uint64_t v15 = [v12 firstIconDataSourcePassingTest:v26];
      goto LABEL_3;
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke_2;
  v22[3] = &unk_1E6B04030;
  int64_t v25 = a7;
  id v23 = v13;
  id v24 = v14;
  uint64_t v16 = [v12 firstWidgetPassingTest:v22];

LABEL_8:
  return v16;
}

uint64_t __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = self;
    char isKindOfClass = (objc_opt_isKindOfClass() & 1) != 0 && [v3 suggestionSource] == *(void *)(a1 + 32);
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __140__SBProactiveHomeScreenSuggestionProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[6] && [v3 suggestionSource] != a1[6])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v5 = [v4 extensionBundleIdentifier];
    if ([v5 isEqualToString:a1[4]])
    {
      uint64_t v7 = a1[5];
      uint64_t v6 = a1 + 5;
      if (v7)
      {
        id v8 = [v4 kind];
        uint64_t v9 = [v8 isEqualToString:*v6];
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (id)_makeDataSourceForAtxWidget:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4FA6228];
  uint64_t v6 = [v4 extensionBundleId];
  uint64_t v7 = (objc_class *)[v5 elementClassWithIdentifier:v6];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = [(SBProactiveHomeScreenSuggestionProvider *)self _supportedElementClasses];
  int v9 = [v8 containsObject:v7];

  if (!v9
    || (id v10 = [v7 alloc],
        [v4 widgetUniqueId],
        id v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = (void *)[v10 initWithUniqueIdentifier:v11],
        v11,
        id v13 = (void *)[v12 copyWithSuggestionSource:1],
        v12,
        !v13))
  {
LABEL_4:
    id v14 = [v4 widgetKind];

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4FA6388]);
      uint64_t v16 = [v4 widgetUniqueId];
      uint64_t v17 = [v4 widgetKind];
      uint64_t v18 = [v4 extensionBundleId];
      uint64_t v19 = [v4 appBundleId];
      int v20 = [v15 initWithUniqueIdentifier:v16 kind:v17 extensionBundleIdentifier:v18 containerBundleIdentifier:v19];

      id v13 = (void *)[v20 copyWithSuggestionSource:1];
      long long v21 = SBLogWidgets();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v20 extensionBundleIdentifier];
        id v23 = [v20 uniqueIdentifier];
        int v25 = 138543618;
        int v26 = v22;
        __int16 v27 = 2114;
        v28 = v23;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for home screen suggestion.", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      int v20 = SBLogProactiveHome();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[SBProactiveHomeScreenSuggestionProvider _makeDataSourceForAtxWidget:](v20);
      }
      id v13 = 0;
    }
  }
  return v13;
}

- (ATXHomeScreenPrediction)currentPrediction
{
  return self->_currentPrediction;
}

- (void)setCurrentPrediction:(id)a3
{
}

- (SBIconController)iconController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconController);
  return (SBIconController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconController);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __60__SBProactiveHomeScreenSuggestionProvider_updatePredictions__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error fetching home screen widget predictions: %@", (uint8_t *)&v3, 0xCu);
}

- (void)processUpdatedPredictions:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 suggestionsForAllStacks];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "process updated predictions: %@", (uint8_t *)&v4, 0xCu);
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "suggestion %@ for stack with identifier: %@");
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "skipping active data source update because configuration ui is showing", v1, 2u);
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "skipping active data source update because suggested top widget is nil", v1, 2u);
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "skipping active data source update because the old top widget (%@) we had was the same as the new one (%@)");
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_4(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 widgetUniqueId];
  uint64_t v5 = [a1 extensionBundleId];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "suggested top widget not found in stack for widget identifier: %@, extension bundle identifier: %@", (uint8_t *)&v6, 0x16u);
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_9_cold_5(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a2 activeDataSource];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "setting active data source to widget %@ (previously: %@)", (uint8_t *)&v6, 0x16u);
}

void __69__SBProactiveHomeScreenSuggestionProvider_processUpdatedPredictions___block_invoke_11_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "removing suggested widget data source %@ because it's no longer suggested", (uint8_t *)&v2, 0xCu);
}

- (void)_makeDataSourceForAtxWidget:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "failed to update suggestion data source because widgetKind was nil", v1, 2u);
}

@end