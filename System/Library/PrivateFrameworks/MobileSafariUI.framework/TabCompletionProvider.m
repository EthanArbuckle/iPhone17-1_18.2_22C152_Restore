@interface TabCompletionProvider
- (BOOL)browserTabCompletionProvider:(id)a3 shouldExtensionURLAppearAsSwitchToTabItem:(id)a4;
- (TabCompletionProviderDataSource)tabCompletionProviderDataSource;
- (id)bestTabCompletionMatchForQuery:(id)a3 withTopHitURL:(id)a4;
- (id)browserTabCompletionProvider:(id)a3 alternativeDisplayTextForURLForExtensionURL:(id)a4;
- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3;
- (id)tabInfosForBrowserTabCompletionProvider:(id)a3;
- (void)dealloc;
- (void)didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:(id)a3;
- (void)invalidateCachedTabData;
- (void)setQueryToComplete:(id)a3;
- (void)setTabCompletionProviderDataSource:(id)a3;
@end

@implementation TabCompletionProvider

- (void)dealloc
{
  [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TabCompletionProvider;
  [(TabCompletionProvider *)&v3 dealloc];
}

- (id)bestTabCompletionMatchForQuery:(id)a3 withTopHitURL:(id)a4
{
  id v6 = a4;
  v7 = [(CompletionProvider *)self completionsForQuery:a3];
  if ([v7 count])
  {
    v8 = [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider bestTabCompletionMatchFromMatches:v7 withTopHitURL:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setQueryToComplete:(id)a3
{
  id v8 = a3;
  v4 = [v8 queryString];
  browserTabCompletionProvider = self->_browserTabCompletionProvider;
  if (!browserTabCompletionProvider)
  {
    id v6 = (WBSBrowserTabCompletionProvider *)objc_alloc_init(MEMORY[0x1E4F989D8]);
    v7 = self->_browserTabCompletionProvider;
    self->_browserTabCompletionProvider = v6;

    [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider setDataSource:self];
    [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider setDelegate:self];
    browserTabCompletionProvider = self->_browserTabCompletionProvider;
  }
  -[WBSBrowserTabCompletionProvider setCurrentQuery:forQueryID:](browserTabCompletionProvider, "setCurrentQuery:forQueryID:", v4, [v8 queryID]);
}

- (void)invalidateCachedTabData
{
}

- (id)tabInfosForBrowserTabCompletionProvider:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [WeakRetained windowUUIDsToTabsForTabCompletionProvider:self];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke;
  v33[3] = &unk_1E6D7A0C8;
  id v7 = v5;
  id v34 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v33];
  id v8 = [WeakRetained currentWindowUUIDForTabCompletionProvider:self];
  [WeakRetained tabGroupsForTabCompletionProvider:self];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F29128]);
        v15 = [v13 uuid];
        v16 = (void *)[v14 initWithUUIDString:v15];

        v17 = [v13 displayTitle];
        v18 = [v13 tabs];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_3;
        v24[3] = &unk_1E6D7A0F0;
        id v25 = v8;
        id v26 = v16;
        id v27 = v17;
        id v28 = v7;
        id v19 = v17;
        id v20 = v16;
        [v18 enumerateObjectsUsingBlock:v24];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v10);
  }
  id v21 = v7;

  return v21;
}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_2;
  v7[3] = &unk_1E6D7A0A0;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = [v11 url];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F989C8]);
    id v7 = [v11 uuid];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v11 title];
    uint64_t v10 = objc_msgSend(v6, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v7, v8, 0, 0, a3, v5, v9, objc_msgSend(v11, "pageStatus"));

    [*(id *)(a1 + 40) addObject:v10];
  }
}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  id v5 = [v18 url];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F989C8]);
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v8 = [v18 uuid];
    id v9 = (void *)[v7 initWithUUIDString:v8];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13 = [v18 url];
    uint64_t v14 = [v18 title];
    uint64_t v15 = a3;
    v16 = (void *)v14;
    v17 = (void *)[v6 initWithUUID:v9 windowUUID:v10 tabGroupUUID:v11 tabGroupTitle:v12 tabIndex:v15 url:v13 title:v14 pageStatus:0];

    [*(id *)(a1 + 56) addObject:v17];
  }
}

- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
  id v5 = [WeakRetained selectedTabDocumentForTabCompletionProvider:self];

  if (v5)
  {
    id v6 = [v5 browserController];
    id v7 = [v6 tabController];
    uint64_t v8 = [v7 currentTabs];
    uint64_t v9 = [v8 indexOfObjectIdenticalTo:v5];

    id v10 = objc_alloc(MEMORY[0x1E4F989C8]);
    uint64_t v11 = [v5 uuid];
    uint64_t v12 = [v6 UUID];
    v13 = [v5 URL];
    uint64_t v14 = [v5 title];
    uint64_t v15 = objc_msgSend(v10, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v11, v12, 0, 0, v9, v13, v14, objc_msgSend(v5, "pageStatus"));
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:(id)a3
{
  id v5 = [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider currentTabCompletionMatches];
  v4 = [(WBSBrowserTabCompletionProvider *)self->_browserTabCompletionProvider currentQuery];
  [(CompletionProvider *)self setCompletions:v5 forString:v4];
}

- (BOOL)browserTabCompletionProvider:(id)a3 shouldExtensionURLAppearAsSwitchToTabItem:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = +[Application sharedApplication];
  id v6 = [v5 allWebExtensionsControllers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v4 host];
        uint64_t v12 = [v10 webExtensionForBaseURIHost:v11];

        if (v12)
        {
          v13 = (void *)[v12 newTabOverridePageURL];
          LODWORD(v7) = [v4 isEqual:v13] ^ 1;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)browserTabCompletionProvider:(id)a3 alternativeDisplayTextForURLForExtensionURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[Application sharedApplication];
  id v6 = [v5 allWebExtensionsControllers];

  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v4 host];
        uint64_t v12 = [v10 webExtensionForBaseURIHost:v11];

        if (v12)
        {
          uint64_t v7 = [v12 displayName];

          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (TabCompletionProviderDataSource)tabCompletionProviderDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
  return (TabCompletionProviderDataSource *)WeakRetained;
}

- (void)setTabCompletionProviderDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabCompletionProviderDataSource);
  objc_storeStrong((id *)&self->_browserTabCompletionProvider, 0);
}

@end