@interface WBSStartPageSuggestionsManager
- (NSArray)highlights;
- (NSArray)suggestions;
- (WBSStartPageSectionManager)sectionManager;
- (WBSStartPageSuggestionsManager)initWithSectionManager:(id)a3;
- (id)_providerForSuggestion:(id)a3;
- (id)attributionViewForSuggestion:(id)a3;
- (void)_recomputeCachedSuggestionsForcingReload:(BOOL)a3;
- (void)_sectionsDidChange:(id)a3;
- (void)_updateCachedSuggestionsForStartPageSuggestionsProvider:(id)a3 suggestions:(id)a4;
- (void)_updateDefaultStartPageVisibleProviders;
- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4;
- (void)registerProvider:(id)a3;
- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4;
- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4;
@end

@implementation WBSStartPageSuggestionsManager

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4
{
  [(WBSStartPageSuggestionsManager *)self _updateCachedSuggestionsForStartPageSuggestionsProvider:a3 suggestions:a4];
  [(WBSStartPageSuggestionsManager *)self _recomputeCachedSuggestionsForcingReload:1];
}

- (void)_recomputeCachedSuggestionsForcingReload:(BOOL)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v33 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v4 = self->_providers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = *MEMORY[0x1E4F98890];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = [(NSMapTable *)self->_providersToCachedSuggestions objectForKey:v10];
        if ([(NSSet *)self->_defaultStartPageVisibleProviders containsObject:v10])
        {
          [v33 addObjectsFromArray:v11];
          v12 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
            goto LABEL_12;
          }
          v13 = v12;
          uint64_t v14 = [v11 count];
          uint64_t v15 = objc_opt_class();
          *(_DWORD *)buf = 134218242;
          uint64_t v39 = v14;
          __int16 v40 = 2114;
          uint64_t v41 = v15;
          v16 = v13;
          v17 = "Adding %zu suggestions from provider %{public}@ in manager";
        }
        else
        {
          v18 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_12;
          }
          v13 = v18;
          uint64_t v19 = [v11 count];
          uint64_t v20 = objc_opt_class();
          *(_DWORD *)buf = 134218242;
          uint64_t v39 = v19;
          __int16 v40 = 2114;
          uint64_t v41 = v20;
          v16 = v13;
          v17 = "Skipping %zu suggestions from provider %{public}@ in manager";
        }
        _os_log_impl(&dword_1ABB70000, v16, OS_LOG_TYPE_INFO, v17, buf, 0x16u);

LABEL_12:
        v21 = [v10 providerSectionIdentifier];
        int v22 = [v21 isEqualToString:v8];

        if (v22)
        {
          v23 = (NSArray *)[v11 copy];
          highlights = self->_highlights;
          self->_highlights = v23;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v6);
  }

  if (a3 || ![(NSArray *)self->_suggestions isEqualToArray:v33])
  {
    v25 = (NSArray *)[v33 copy];
    suggestions = self->_suggestions;
    self->_suggestions = v25;

    v27 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = self->_suggestions;
      v29 = v27;
      uint64_t v30 = [(NSArray *)v28 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v30;
      _os_log_impl(&dword_1ABB70000, v29, OS_LOG_TYPE_INFO, "Recomputed %lu suggestions in manager", buf, 0xCu);
    }
    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 postNotificationName:@"WBSStartPageSuggestionsManagerDidUpdateSuggestions" object:self];
  }
}

- (void)_updateCachedSuggestionsForStartPageSuggestionsProvider:(id)a3 suggestions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_providersToCachedSuggestions objectForKey:v6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NSMapTable *)self->_cachedSuggestionsToProviders removeObjectForKey:*(void *)(*((void *)&v24 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  providersToCachedSuggestions = self->_providersToCachedSuggestions;
  uint64_t v14 = (void *)[v7 copy];
  [(NSMapTable *)providersToCachedSuggestions setObject:v14 forKey:v6];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = -[NSMapTable objectForKey:](self->_providersToCachedSuggestions, "objectForKey:", v6, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NSMapTable *)self->_cachedSuggestionsToProviders setObject:v6 forKey:*(void *)(*((void *)&v20 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (WBSStartPageSuggestionsManager)initWithSectionManager:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSStartPageSuggestionsManager;
  id v6 = [(WBSStartPageSuggestionsManager *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionManager, a3);
    suggestions = v7->_suggestions;
    v7->_suggestions = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    providers = v7->_providers;
    v7->_providers = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    providersToCachedSuggestions = v7->_providersToCachedSuggestions;
    v7->_providersToCachedSuggestions = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    cachedSuggestionsToProviders = v7->_cachedSuggestionsToProviders;
    v7->_cachedSuggestionsToProviders = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel__sectionsDidChange_ name:*MEMORY[0x1E4F98898] object:0];

    [(WBSStartPageSuggestionsManager *)v7 _updateDefaultStartPageVisibleProviders];
    uint64_t v16 = v7;
  }

  return v7;
}

- (void)registerProvider:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setSuggestionsProviderDelegate:self];
    [(NSMutableArray *)self->_providers addObject:v4];
    [(WBSStartPageSuggestionsManager *)self _updateDefaultStartPageVisibleProviders];
    id v5 = [v4 suggestions];
    [(WBSStartPageSuggestionsManager *)self startPageSuggestionsProvider:v4 didUpdateSuggestions:v5];
  }
}

- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4
{
  [(WBSStartPageSuggestionsManager *)self _updateCachedSuggestionsForStartPageSuggestionsProvider:a3 suggestions:a4];
  [(WBSStartPageSuggestionsManager *)self _recomputeCachedSuggestionsForcingReload:0];
}

- (void)_updateDefaultStartPageVisibleProviders
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(WBSStartPageSectionManager *)self->_sectionManager suggestionsDataSourceSections];
  id v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_58);

  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_providers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "providerSectionIdentifier", (void)v16);
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (NSSet *)[v5 copy];
  defaultStartPageVisibleProviders = self->_defaultStartPageVisibleProviders;
  self->_defaultStartPageVisibleProviders = v14;
}

id __73__WBSStartPageSuggestionsManager__updateDefaultStartPageVisibleProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled])
  {
    v3 = [v2 identifier];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_sectionsDidChange:(id)a3
{
  [(WBSStartPageSuggestionsManager *)self _updateDefaultStartPageVisibleProviders];
  [(WBSStartPageSuggestionsManager *)self _recomputeCachedSuggestionsForcingReload:0];
}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WBSStartPageSuggestionsManager *)self _providerForSuggestion:v7];
  [v8 fetchMetadataForSuggestion:v7 completionHandler:v6];
}

- (id)attributionViewForSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSStartPageSuggestionsManager *)self _providerForSuggestion:v4];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 attributionViewForSuggestion:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_providerForSuggestion:(id)a3
{
  return [(NSMapTable *)self->_cachedSuggestionsToProviders objectForKey:a3];
}

- (WBSStartPageSectionManager)sectionManager
{
  return self->_sectionManager;
}

- (NSArray)highlights
{
  return self->_highlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionManager, 0);
  objc_storeStrong((id *)&self->_defaultStartPageVisibleProviders, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionsToProviders, 0);
  objc_storeStrong((id *)&self->_providersToCachedSuggestions, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end