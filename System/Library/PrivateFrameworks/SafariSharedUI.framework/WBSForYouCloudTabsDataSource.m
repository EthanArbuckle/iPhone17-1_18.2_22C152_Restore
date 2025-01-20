@interface WBSForYouCloudTabsDataSource
- (WBSForYouCloudTabsDataSource)initWithTabStore:(id)a3;
- (void)_createInternalQueueIfNecessary;
- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation WBSForYouCloudTabsDataSource

- (WBSForYouCloudTabsDataSource)initWithTabStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSForYouCloudTabsDataSource;
  v6 = [(WBSForYouCloudTabsDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WBSForYouCloudTabsDataSource;
  [(WBSForYouRecommendationMediatorDataSource *)&v11 emitStartRetrievingRecommendationsPerformanceMarker];
  if (v7)
  {
    [(WBSForYouCloudTabsDataSource *)self _createInternalQueueIfNecessary];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5E40940;
    block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) syncedCloudTabDevices];
  v3 = (void *)[v2 copy];

  v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E40940;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v28 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v2;
        v3 = *(void **)(*((void *)&v34 + 1) + 8 * v2);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v29 = v3;
        v4 = [v3 tabs];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v31 != v7) {
                objc_enumerationMutation(v4);
              }
              id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v10 = [v9 title];
              objc_super v11 = [*(id *)(a1 + 40) title];
              int v12 = [v10 localizedCaseInsensitiveContainsString:v11];

              if (v12)
              {
                v13 = [WBSForYouLinkRecommendation alloc];
                v14 = [v9 url];
                v15 = [MEMORY[0x1E4F1C9C8] distantPast];
                v16 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v13, "initWithTitle:url:lastSeenDate:source:topicSource:", v10, v14, v15, 4, [*(id *)(a1 + 40) source]);

                v17 = (void *)MEMORY[0x1E4F1CAD0];
                v18 = [*(id *)(a1 + 40) title];
                v19 = [v17 setWithObject:v18];
                [(WBSForYouLinkRecommendation *)v16 addOriginalQueries:v19];

                v20 = NSString;
                v21 = _WBSLocalizedString();
                v22 = [v29 disambiguatedName];
                v23 = objc_msgSend(v20, "stringWithFormat:", v21, v22);
                [(WBSForYouLinkRecommendation *)v16 setFootnote:v23];

                [v28 addObject:v16];
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v26);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_createInternalQueueIfNecessary
{
  if (!self->_internalQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.WBSForYouCloudTabsDataSource.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_tabsStore, 0);
}

@end