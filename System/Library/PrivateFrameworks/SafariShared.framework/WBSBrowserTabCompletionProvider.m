@interface WBSBrowserTabCompletionProvider
- (BOOL)_isOperationValidForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5;
- (NSArray)currentTabCompletionMatches;
- (NSArray)tabInfos;
- (NSString)currentQuery;
- (WBSBrowserTabCompletionProvider)init;
- (WBSBrowserTabCompletionProviderDelegate)delegate;
- (WBSBrowserTabCompletionProviderSource)dataSource;
- (id)_matchesForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5 forQueryID:(int64_t)a6;
- (id)bestTabCompletionMatchFromMatches:(id)a3 withTopHitURL:(id)a4;
- (id)bestTabCompletionMatchWithTopHitURL:(id)a3;
- (id)selectedTabInfo;
- (int64_t)_compareTabMatch:(id)a3 otherTabMatch:(id)a4;
- (unint64_t)_distanceFromSelectedTabForTabMatch:(id)a3;
- (void)_prepareQueue;
- (void)invalidate;
- (void)setCurrentQuery:(id)a3 forQueryID:(int64_t)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tabCompletionMatchesForQuery:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSBrowserTabCompletionProvider

- (WBSBrowserTabCompletionProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)WBSBrowserTabCompletionProvider;
  v2 = [(WBSBrowserTabCompletionProvider *)&v5 init];
  if (v2)
  {
    if (-[WBSBrowserTabCompletionProvider init]::onceToken != -1) {
      dispatch_once(&-[WBSBrowserTabCompletionProvider init]::onceToken, &__block_literal_global_6);
    }
    v3 = v2;
  }

  return v2;
}

uint64_t __39__WBSBrowserTabCompletionProvider_init__block_invoke()
{
  return +[WBSURLCompletionDatabase initializeURLCompletionOnMainThread];
}

- (void)_prepareQueue
{
  queue = self->_queue;
  if (queue)
  {
    [(NSOperationQueue *)queue cancelAllOperations];
  }
  else
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    objc_super v5 = self->_queue;
    self->_queue = v4;

    [(NSOperationQueue *)self->_queue setQualityOfService:17];
    id v6 = [NSString stringWithFormat:@"com.apple.Safari.%@.%p.operationQueue", objc_opt_class(), self];
    -[NSOperationQueue setName:](self->_queue, "setName:");
  }
}

- (NSArray)tabInfos
{
  tabInfos = self->_tabInfos;
  if (!tabInfos)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_super v5 = [WeakRetained tabInfosForBrowserTabCompletionProvider:self];
    id v6 = self->_tabInfos;
    self->_tabInfos = v5;

    tabInfos = self->_tabInfos;
  }
  return tabInfos;
}

- (id)selectedTabInfo
{
  selectedTabInfo = self->_selectedTabInfo;
  if (!selectedTabInfo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_super v5 = [WeakRetained selectedTabInfoForBrowserTabCompletionProvider:self];
    id v6 = self->_selectedTabInfo;
    self->_selectedTabInfo = v5;

    selectedTabInfo = self->_selectedTabInfo;
  }
  return selectedTabInfo;
}

- (void)setCurrentQuery:(id)a3 forQueryID:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [v6 length];
  currentQuery = self->_currentQuery;
  if (v8)
  {
    if (![v6 isEqualToString:currentQuery])
    {
      [(WBSBrowserTabCompletionProvider *)self _prepareQueue];
      currentTabCompletionMatches = self->_currentTabCompletionMatches;
      self->_currentTabCompletionMatches = 0;

      v12 = (NSString *)[v6 copy];
      v13 = self->_currentQuery;
      self->_currentQuery = v12;

      v14 = [(WBSBrowserTabCompletionProvider *)self tabInfos];
      v15 = (void *)[v14 copy];

      v16 = [(WBSBrowserTabCompletionProvider *)self selectedTabInfo];
      objc_initWeak(&location, self);
      queue = self->_queue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke;
      v20[3] = &unk_1E5C8CAC0;
      objc_copyWeak(v24, &location);
      id v21 = v6;
      id v18 = v15;
      id v22 = v18;
      id v23 = v16;
      v24[1] = (id)a4;
      id v19 = v16;
      [(NSOperationQueue *)queue addOperationWithBlock:v20];

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);

      goto LABEL_8;
    }
    if (!self->_currentTabCompletionMatches) {
      goto LABEL_8;
    }
  }
  else
  {
    self->_currentQuery = 0;

    v10 = self->_currentTabCompletionMatches;
    self->_currentTabCompletionMatches = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [WeakRetained didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:self];
LABEL_8:
}

void __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v5 = [WeakRetained _matchesForQuery:*(void *)(a1 + 32) tabInfos:*(void *)(a1 + 40) selectedTabInfo:*(void *)(a1 + 48) forQueryID:*(void *)(a1 + 64)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke_2;
    block[3] = &unk_1E5C8CA98;
    objc_copyWeak(&v12, v2);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v12);
  }
}

void __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    char v4 = [WeakRetained _isOperationValidForQuery:*(void *)(a1 + 32) tabInfos:*(void *)(a1 + 40) selectedTabInfo:*(void *)(a1 + 48)];
    v3 = v8;
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 56) copy];
      id v6 = v8[7];
      v8[7] = (id)v5;

      id v7 = objc_loadWeakRetained(v8 + 5);
      [v7 didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:v8];

      v3 = v8;
    }
  }
}

- (void)tabCompletionMatchesForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSArray *))a4;
  if ([v6 isEqualToString:self->_currentQuery])
  {
    if (self->_currentTabCompletionMatches) {
      currentTabCompletionMatches = self->_currentTabCompletionMatches;
    }
    else {
      currentTabCompletionMatches = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v7[2](v7, currentTabCompletionMatches);
  }
  else
  {
    [(WBSBrowserTabCompletionProvider *)self _prepareQueue];
    id v9 = self->_currentTabCompletionMatches;
    self->_currentTabCompletionMatches = 0;

    id v10 = (NSString *)[v6 copy];
    currentQuery = self->_currentQuery;
    self->_currentQuery = v10;

    id v12 = [(WBSBrowserTabCompletionProvider *)self tabInfos];
    v13 = (void *)[v12 copy];

    objc_initWeak(&location, self);
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke;
    v16[3] = &unk_1E5C8CB10;
    objc_copyWeak(&v20, &location);
    id v19 = v7;
    id v17 = v6;
    id v18 = v13;
    id v15 = v13;
    [(NSOperationQueue *)queue addOperationWithBlock:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke(id *a1)
{
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _matchesForQuery:a1[4] tabInfos:a1[5] selectedTabInfo:0 forQueryID:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C8CAE8;
    objc_copyWeak(&v12, v2);
    id v11 = a1[6];
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v12);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained
    && ([WeakRetained _isOperationValidForQuery:*(void *)(a1 + 32) tabInfos:*(void *)(a1 + 40) selectedTabInfo:0] & 1) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 48) copy];
    v3 = (void *)WeakRetained[7];
    WeakRetained[7] = v2;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)invalidate
{
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  tabInfos = self->_tabInfos;
  self->_tabInfos = 0;

  selectedTabInfo = self->_selectedTabInfo;
  self->_selectedTabInfo = 0;

  currentTabCompletionMatches = self->_currentTabCompletionMatches;
  self->_currentTabCompletionMatches = 0;

  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;
}

- (id)bestTabCompletionMatchWithTopHitURL:(id)a3
{
  v3 = [(WBSBrowserTabCompletionProvider *)self bestTabCompletionMatchFromMatches:self->_currentTabCompletionMatches withTopHitURL:a3];
  return v3;
}

- (id)bestTabCompletionMatchFromMatches:(id)a3 withTopHitURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  v26 = v6;
  id v7 = [v6 firstObject];
  id v8 = v7;
  if (v7)
  {
    [v7 setHighlyRelevant:0];
    id v9 = objc_msgSend(v28, "safari_userVisibleHostWithoutWWWSubdomain");
    if (v9)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v6;
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v30;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
          v14 = [v13 tabGroupUUID];
          BOOL v15 = v14 == 0;

          if (!v15) {
            break;
          }
          v16 = [v13 windowUUID];
          id v17 = [(WBSBrowserTabCompletionInfo *)self->_selectedTabInfo windowUUID];
          char v18 = [v16 isEqual:v17];

          if ((v18 & 1) == 0) {
            break;
          }
          id v19 = [v13 url];
          char v20 = objc_msgSend(v19, "safari_isTopLevelURL");

          if (v20)
          {
            id v21 = [v13 url];
            id v22 = objc_msgSend(v21, "safari_userVisibleHostWithoutWWWSubdomain");
            int v23 = [v9 isEqualToString:v22];

            if (v23)
            {
              [v13 setHighlyRelevant:1];
              id v24 = v13;

              id obj = v8;
              id v8 = v24;
              break;
            }
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v10) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
  }

  return v8;
}

- (id)_matchesForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5 forQueryID:(int64_t)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v8 = a4;
  id v9 = a5;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v14 = [v13 uuid];
        BOOL v15 = [v9 uuid];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          id v17 = [v13 url];
          char v18 = [v9 url];
          if (([v17 isEqual:v18] & 1) == 0)
          {

LABEL_11:
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if ((objc_opt_respondsToSelector() & 1) == 0
              || ([v13 url],
                  int v23 = objc_claimAutoreleasedReturnValue(),
                  char v24 = [WeakRetained browserTabCompletionProvider:self doesURLRepresentNativeContent:v23], v23, (v24 & 1) == 0))
            {
              v25 = [v13 url];
              int v26 = objc_msgSend(v25, "safari_isSafariExtensionURL");

              if (!v26) {
                goto LABEL_18;
              }
              if ((objc_opt_respondsToSelector() & 1) == 0
                || ([v13 url],
                    v27 = objc_claimAutoreleasedReturnValue(),
                    char v28 = [WeakRetained browserTabCompletionProvider:self shouldExtensionURLAppearAsSwitchToTabItem:v27], v27, (v28 & 1) != 0))
              {
                if (objc_opt_respondsToSelector())
                {
                  long long v29 = [v13 url];
                  long long v30 = [WeakRetained browserTabCompletionProvider:self alternativeDisplayTextForURLForExtensionURL:v29];

                  goto LABEL_19;
                }
LABEL_18:
                long long v30 = 0;
LABEL_19:
                long long v31 = [[WBSBrowserTabCompletionMatch alloc] initWithTabInfo:v13 userTypedString:v35 alternativeDisplayTextForURL:v30 forQueryID:a6];
                if (v31) {
                  [v33 addObject:v31];
                }
              }
            }

            continue;
          }
          id v19 = [v13 title];
          char v20 = [v9 title];
          char v21 = [v19 isEqual:v20];

          if ((v21 & 1) == 0) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v10);
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __88__WBSBrowserTabCompletionProvider__matchesForQuery_tabInfos_selectedTabInfo_forQueryID___block_invoke;
  v38[3] = &unk_1E5C8CB38;
  v38[4] = self;
  [v33 sortUsingComparator:v38];

  return v33;
}

uint64_t __88__WBSBrowserTabCompletionProvider__matchesForQuery_tabInfos_selectedTabInfo_forQueryID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareTabMatch:a2 otherTabMatch:a3];
}

- (BOOL)_isOperationValidForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5
{
  id v8 = a3;
  id v9 = (NSArray *)a4;
  uint64_t v10 = (WBSBrowserTabCompletionInfo *)a5;
  BOOL v11 = ([v8 isEqualToString:self->_currentQuery] & 1) != 0
     && (self->_tabInfos == v9 || -[NSArray isEqualToArray:](v9, "isEqualToArray:"))
     && self->_selectedTabInfo == v10;

  return v11;
}

- (int64_t)_compareTabMatch:(id)a3 otherTabMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 tabGroupUUID];

  id v9 = [v7 tabGroupUUID];

  if (v8 || !v9)
  {
    if (v8 && !v9)
    {
      int64_t v10 = 1;
      goto LABEL_14;
    }
    BOOL v11 = [(WBSBrowserTabCompletionInfo *)self->_selectedTabInfo windowUUID];
    uint64_t v12 = [v6 windowUUID];
    int v13 = [v12 isEqual:v11];

    v14 = [v7 windowUUID];
    int v15 = [v14 isEqual:v11];

    int v16 = v13 ^ 1;
    if (((v13 ^ 1 | v15) & 1) == 0) {
      goto LABEL_10;
    }
    int v17 = v15 ^ 1;
    if ((v13 | v15 ^ 1) == 1)
    {
      uint64_t v18 = [v6 matchLocation];
      if (v18 > [v7 matchLocation])
      {
LABEL_10:
        int64_t v10 = -1;
        goto LABEL_13;
      }
      uint64_t v19 = [v6 matchLocation];
      if (v19 >= [v7 matchLocation])
      {
        char v21 = [v6 url];
        int v22 = objc_msgSend(v21, "safari_isTopLevelURL");

        int v23 = [v7 url];
        int v24 = objc_msgSend(v23, "safari_isTopLevelURL");

        if (((v22 ^ 1 | v24) & 1) == 0) {
          goto LABEL_10;
        }
        if ((v22 | v24 ^ 1) == 1)
        {
          v25 = [v6 tabGroupUUID];
          if (v25)
          {
          }
          else
          {
            int v26 = [v7 tabGroupUUID];

            if (v26) {
              int v27 = 1;
            }
            else {
              int v27 = v16;
            }
            if (((v27 | v17) & 1) == 0)
            {
              unint64_t v28 = [(WBSBrowserTabCompletionProvider *)self _distanceFromSelectedTabForTabMatch:v6];
              unint64_t v29 = [(WBSBrowserTabCompletionProvider *)self _distanceFromSelectedTabForTabMatch:v7];
              uint64_t v30 = -1;
              if (v28 >= v29) {
                uint64_t v30 = 1;
              }
              if (v28 == v29) {
                int64_t v10 = 0;
              }
              else {
                int64_t v10 = v30;
              }
              goto LABEL_13;
            }
          }
          int64_t v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
    }
    int64_t v10 = 1;
    goto LABEL_13;
  }
  int64_t v10 = -1;
LABEL_14:

  return v10;
}

- (unint64_t)_distanceFromSelectedTabForTabMatch:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WBSBrowserTabCompletionInfo *)self->_selectedTabInfo tabIndex];
  uint64_t v6 = [v4 tabIndex];
  if ((uint64_t)(v5 - v6) >= 0) {
    unint64_t v7 = v5 - v6;
  }
  else {
    unint64_t v7 = v6 - v5;
  }

  return v7;
}

- (WBSBrowserTabCompletionProviderSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WBSBrowserTabCompletionProviderSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (WBSBrowserTabCompletionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSBrowserTabCompletionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)currentQuery
{
  return self->_currentQuery;
}

- (NSArray)currentTabCompletionMatches
{
  return self->_currentTabCompletionMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTabCompletionMatches, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_selectedTabInfo, 0);
  objc_storeStrong((id *)&self->_tabInfos, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end