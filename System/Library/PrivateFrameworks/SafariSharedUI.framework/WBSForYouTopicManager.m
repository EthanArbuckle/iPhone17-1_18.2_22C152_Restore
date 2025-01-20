@interface WBSForYouTopicManager
- (WBSForYouTopicManager)initWithHistory:(id)a3 contextClient:(id)a4;
- (void)_createInternalQueueIfNecessary;
- (void)contextKitTopicsWithCompletionHandler:(id)a3;
- (void)portraitNamedEntitiesWithCompletionHandler:(id)a3;
@end

@implementation WBSForYouTopicManager

- (WBSForYouTopicManager)initWithHistory:(id)a3 contextClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSForYouTopicManager;
  v9 = [(WBSForYouTopicManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_history, a3);
    objc_storeStrong((id *)&v10->_contextClient, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastContextKitRequestDate = v10->_lastContextKitRequestDate;
    v10->_lastContextKitRequestDate = (NSDate *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)contextKitTopicsWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, NSArray *))a3;
  [(NSDate *)self->_lastContextKitRequestDate timeIntervalSinceNow];
  double v6 = v5;
  if (v5 >= -20.0)
  {
    v4[2](v4, self->_mostRecentUserVisibleTopics);
    v12 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v16 = v6 + 20.0;
      _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_INFO, "Using cached ContextKit topics (and will for +%fs)", buf, 0xCu);
    }
  }
  else
  {
    if (!self->_historyTopicTagController)
    {
      id v7 = [[WBSRecentHistoryTopicTagController alloc] initWithHistory:self->_history];
      historyTopicTagController = self->_historyTopicTagController;
      self->_historyTopicTagController = v7;

      [(WBSRecentHistoryTopicTagController *)self->_historyTopicTagController setMaximumNumberOfTopics:10];
    }
    v9 = [MEMORY[0x1E4F1C9C8] date];
    lastContextKitRequestDate = self->_lastContextKitRequestDate;
    self->_lastContextKitRequestDate = v9;

    uint64_t v11 = self->_historyTopicTagController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E5E42CF8;
    v13[4] = self;
    v14 = v4;
    [(WBSRecentHistoryTopicTagController *)v11 loadTopicsWithCompletionHandler:v13];
  }
}

void __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v25 = a3;
  v26 = v6;
  if ([v6 count])
  {
    uint64_t v24 = a1;
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v12 = [v11 historyItems];
          v13 = [v12 firstObject];

          v14 = [WBSForYouTopic alloc];
          objc_super v15 = [v11 title];
          double v16 = [v11 identifier];
          uint64_t v17 = [v13 lastVisitedDate];
          v18 = v17;
          if (!v17)
          {
            v3 = [MEMORY[0x1E4F1C9C8] distantPast];
            v18 = v3;
          }
          v19 = [(WBSForYouTopic *)v14 initWithTitle:v15 identifier:v16 relevancyDate:v18 source:1];
          if (!v17) {

          }
          [v7 addObject:v19];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5E41018;
    v20 = *(void **)(v24 + 40);
    block[4] = *(void *)(v24 + 32);
    id v29 = v7;
    id v30 = v20;
    id v21 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v25)
    {
      v22 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v25, "safari_privacyPreservingDescription");
        __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_cold_1(v23, buf, v22);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  double v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

- (void)portraitNamedEntitiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(WBSForYouTopicManager *)self _createInternalQueueIfNecessary];
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F89EA0]);
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-5400.0];
  [v5 setFromDate:v6];

  [v5 setLimit:3];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0341AE0];
  [v5 setMatchingCategories:v7];

  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  id v16 = 0;
  uint64_t v9 = [v8 rankedNamedEntitiesWithQuery:v5 error:&v16];
  id v10 = v16;
  if (v10)
  {
    uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v10, "safari_privacyPreservingDescription");
      __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_cold_1(v12, buf, v11);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
  else
  {
    v14 = objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_15);
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v14);
    }
  }
}

WBSForYouTopic *__68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 item];
  uint64_t v3 = [v2 name];

  if ((unint64_t)[v3 length] >= 5)
  {
    id v5 = [WBSForYouTopic alloc];
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v4 = [(WBSForYouTopic *)v5 initWithTitle:v3 identifier:v3 relevancyDate:v6 source:3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_createInternalQueueIfNecessary
{
  if (!self->_internalQueue)
  {
    uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.ForYouTopicManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentUserVisibleTopics, 0);
  objc_storeStrong((id *)&self->_lastContextKitRequestDate, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_historyTopicTagController, 0);
}

void __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Could not load ContextKit topics with error: %{public}@", buf, 0xCu);
}

void __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to get Portrait named entities: %{public}@", buf, 0xCu);
}

@end