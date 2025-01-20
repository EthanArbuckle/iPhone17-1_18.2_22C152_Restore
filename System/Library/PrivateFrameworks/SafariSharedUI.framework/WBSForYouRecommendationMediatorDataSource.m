@interface WBSForYouRecommendationMediatorDataSource
- (void)emitStartRetrievingRecommendationsPerformanceMarker;
- (void)notifyContentsDidChangeFromSource:(unint64_t)a3;
- (void)notifyImageWasUpdatedForRecommendation:(id)a3;
- (void)recommendationsWithTopics:(id)a3 withCompletionHandler:(id)a4;
- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation WBSForYouRecommendationMediatorDataSource

- (void)recommendationsWithTopics:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v16 = a4;
  v7 = dispatch_group_create();
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        dispatch_group_enter(v7);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke;
        v21[3] = &unk_1E5E42CD0;
        id v22 = v8;
        v23 = self;
        v24 = v7;
        [(WBSForYouRecommendationMediatorDataSource *)self retrieveRecommendationsMatchingTopic:v13 withCompletionHandler:v21];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke_1;
  block[3] = &unk_1E5E420C8;
  id v19 = v8;
  id v20 = v16;
  id v14 = v16;
  id v15 = v8;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
}

void __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v9 = *(void **)(a1 + 32);
          uint64_t v10 = [v8 pageURL];
          uint64_t v11 = [v9 objectForKeyedSubscript:v10];

          if (v11)
          {
            uint64_t v12 = [v8 originalQueries];
            [v11 addOriginalQueries:v12];
          }
          else
          {
            uint64_t v13 = *(void **)(a1 + 32);
            uint64_t v12 = [v8 pageURL];
            [v13 setObject:v8 forKeyedSubscript:v12];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }

    objc_sync_exit(obj);
  }
  id v14 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 40));
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1ABB70000, v14, OS_SIGNPOST_INTERVAL_END, v16, "RetrieveRecommendations", " enableTelemetry=YES ", buf, 2u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke_1(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) allValues];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  objc_sync_exit(obj);
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)notifyContentsDidChangeFromSource:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F985D8];
  uint64_t v9 = *MEMORY[0x1E4F985E0];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 postNotificationName:v6 object:self userInfo:v8];
}

- (void)notifyImageWasUpdatedForRecommendation:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  uint64_t v7 = *MEMORY[0x1E4F985E8];
  uint64_t v9 = *MEMORY[0x1E4F985F0];
  v10[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v6 postNotificationName:v7 object:self userInfo:v8];
}

- (void)emitStartRetrievingRecommendationsPerformanceMarker
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_1ABB70000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RetrieveRecommendations", "%@", (uint8_t *)&v8, 0xCu);
    }
  }
}

@end