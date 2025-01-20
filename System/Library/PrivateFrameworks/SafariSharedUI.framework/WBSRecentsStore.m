@interface WBSRecentsStore
- (NSArray)availableDevices;
- (NSArray)displayableRecentItems;
- (WBSRecentsStore)initWithSiteMetadataManager:(id)a3;
- (WBSSiteMetadataManager)siteMetadataManager;
- (id)providerForItem:(id)a3;
- (void)_fetchPendingMetadataAndNotifyRecentItemChanges;
- (void)_notifyRecentItemsDidReceiveMetadata;
- (void)_rebuildAllRecentItemsAndDevices;
- (void)dealloc;
- (void)fetchMetadata;
- (void)ingestRecentItemsFromProvider:(id)a3;
- (void)registerProvider:(id)a3;
- (void)updateRecentItem:(id)a3 withLinkMetadata:(id)a4;
@end

@implementation WBSRecentsStore

- (NSArray)displayableRecentItems
{
  return self->_displayableRecentItems;
}

- (NSArray)availableDevices
{
  return self->_availableDevices;
}

- (WBSRecentsStore)initWithSiteMetadataManager:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSRecentsStore;
  v5 = [(WBSRecentsStore *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    providers = v5->_providers;
    v5->_providers = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    recentItemsByProviderIndex = v5->_recentItemsByProviderIndex;
    v5->_recentItemsByProviderIndex = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_siteMetadataManager, v4);
    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    recentItemsToMetadataTokens = v5->_recentItemsToMetadataTokens;
    v5->_recentItemsToMetadataTokens = (NSMapTable *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)registerProvider:(id)a3
{
  providers = self->_providers;
  id v7 = a3;
  [(NSMutableArray *)providers addObject:v7];
  recentItemsByProviderIndex = self->_recentItemsByProviderIndex;
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  [(NSMutableArray *)recentItemsByProviderIndex addObject:v6];

  [v7 setRecentsStore:self];
  [(WBSRecentsStore *)self ingestRecentItemsFromProvider:v7];
}

- (void)ingestRecentItemsFromProvider:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_providers indexOfObject:v4];
  v24 = v4;
  uint64_t v6 = [v4 recentItems];
  uint64_t v22 = v5;
  v23 = self;
  id v7 = [(NSMutableArray *)self->_recentItemsByProviderIndex objectAtIndexedSubscript:v5];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = [v7 member:v14];
        v16 = (void *)v15;
        if (v15) {
          v17 = (void *)v15;
        }
        else {
          v17 = v14;
        }
        id v18 = v17;
        v19 = [v14 device];
        [v18 setDevice:v19];

        v20 = [v14 date];
        [v18 setDate:v20];

        [v8 addObject:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v21 = (void *)[v8 copy];
  [(NSMutableArray *)v23->_recentItemsByProviderIndex setObject:v21 atIndexedSubscript:v22];

  [(WBSRecentsStore *)v23 _rebuildAllRecentItemsAndDevices];
  [(WBSRecentsStore *)v23 fetchMetadata];
}

- (void)fetchMetadata
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:*MEMORY[0x1E4F98450]];

  if (v4)
  {
    [(WBSRecentsStore *)self _fetchPendingMetadataAndNotifyRecentItemChanges];
  }
}

- (void)_rebuildAllRecentItemsAndDevices
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v28 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v25 = self;
  obuint64_t j = self->_recentItemsByProviderIndex;
  uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v6 = [v5 allObjects];
        [v28 addObjectsFromArray:v6];

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v31 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              v13 = [v12 device];
              [v3 addObject:v13];

              objc_super v14 = [v12 metadata];

              if (!v14)
              {
                id v15 = objc_alloc_init(MEMORY[0x1E4F30A78]);
                v16 = [v12 URL];
                [v15 setOriginalURL:v16];

                v17 = [v12 URL];
                [v15 setURL:v17];

                id v18 = [v12 title];
                [v15 setTitle:v18];

                [v12 setMetadata:v15];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v9);
        }
      }
      uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v29);
  }

  [v28 sortUsingComparator:&__block_literal_global_67];
  uint64_t v19 = [v28 copy];
  displayableRecentItems = v25->_displayableRecentItems;
  v25->_displayableRecentItems = (NSArray *)v19;

  v21 = [v3 allObjects];
  uint64_t v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_16_0];
  availableDevices = v25->_availableDevices;
  v25->_availableDevices = (NSArray *)v22;

  v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 postNotificationName:@"WBSRecentsStoreDidRebuildRecentItems" object:v25];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siteMetadataManager);
  int v4 = [(NSMapTable *)self->_recentItemsToMetadataTokens objectEnumerator];
  uint64_t v5 = [v4 allObjects];
  [WeakRetained cancelRequestsWithTokens:v5];

  v6.receiver = self;
  v6.super_class = (Class)WBSRecentsStore;
  [(WBSRecentsStore *)&v6 dealloc];
}

- (void)_notifyRecentItemsDidReceiveMetadata
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"WBSRecentsStoreDidUpdateRecentItemsWithMetadata" object:self];
}

- (id)providerForItem:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__33;
  v17 = __Block_byref_object_dispose__33;
  id v18 = 0;
  recentItemsByProviderIndex = self->_recentItemsByProviderIndex;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__WBSRecentsStore_providerForItem___block_invoke;
  v9[3] = &unk_1E5E46E10;
  id v6 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [(NSMutableArray *)recentItemsByProviderIndex enumerateObjectsUsingBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __35__WBSRecentsStore_providerForItem___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 containsObject:a1[4]])
  {
    *a4 = 1;
    uint64_t v7 = [*(id *)(a1[5] + 8) objectAtIndexedSubscript:a3];
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

uint64_t __51__WBSRecentsStore__rebuildAllRecentItemsAndDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __51__WBSRecentsStore__rebuildAllRecentItemsAndDevices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_fetchPendingMetadataAndNotifyRecentItemChanges
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = self->_displayableRecentItems;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v3)
  {

LABEL_16:
    [(WBSRecentsStore *)self _notifyRecentItemsDidReceiveMetadata];
    return;
  }
  char v4 = 0;
  uint64_t v5 = *(void *)v20;
  p_siteMetadataManager = (id *)&self->_siteMetadataManager;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v20 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (!objc_msgSend(v7, "metadataState", p_siteMetadataManager))
      {
        [v7 setMetadataState:1];
        objc_initWeak(&location, self);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke;
        v16[3] = &unk_1E5E46E78;
        objc_copyWeak(&v17, &location);
        v16[4] = v7;
        uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD115160](v16);
        id WeakRetained = objc_loadWeakRetained(p_siteMetadataManager);
        if (WeakRetained)
        {
          id v10 = [WBSLPLinkMetadataRequest alloc];
          uint64_t v11 = [v7 URL];
          uint64_t v12 = [(WBSLPLinkMetadataRequest *)v10 initWithURL:v11];

          uint64_t v13 = [WeakRetained registerOneTimeRequest:v12 priority:2 responseHandler:v8];
          [(NSMapTable *)self->_recentItemsToMetadataTokens setObject:v13 forKey:v7];
        }
        else
        {
          v8[2](v8, 0);
        }

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
        char v4 = 1;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v3);

  if ((v4 & 1) == 0) {
    goto LABEL_16;
  }
}

void __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke_2;
  block[3] = &unk_1E5E40E00;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained[3] removeObjectForKey:*(void *)(a1 + 32)];
    id v3 = +[WBSLPLinkMetadataProvider unpackMetadataFromResponse:*(void *)(a1 + 40)];
    if (v3) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    [*(id *)(a1 + 32) setMetadataState:v4];
    uint64_t v5 = [v7 providerForItem:*(void *)(a1 + 32)];
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        id v6 = v5;
      }
      else {
        id v6 = v7;
      }
      [v6 updateRecentItem:*(void *)(a1 + 32) withLinkMetadata:v3];
    }
    [v7 _notifyRecentItemsDidReceiveMetadata];

    id WeakRetained = v7;
  }
}

- (void)updateRecentItem:(id)a3 withLinkMetadata:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  id v6 = [v12 title];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v12 title];
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v8 = [v5 title];
    uint64_t v9 = v12;
  }
  [v9 setTitle:v8];

  id v10 = [v12 imageProvider];

  if (!v10)
  {
    uint64_t v11 = [v5 imageProvider];
    [v12 setImageProvider:v11];
  }
  [v12 setMetadata:v5];
}

- (WBSSiteMetadataManager)siteMetadataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siteMetadataManager);
  return (WBSSiteMetadataManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_siteMetadataManager);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_displayableRecentItems, 0);
  objc_storeStrong((id *)&self->_recentItemsToMetadataTokens, 0);
  objc_storeStrong((id *)&self->_recentItemsByProviderIndex, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end