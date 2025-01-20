@interface WBSForYouRecommendationMediator
+ (double)scoreForRecommendation:(id)a3 weightManager:(id)a4 simplifiedURLStringToLastVisitedDateMap:(id)a5;
+ (id)_adjustedTopicsWithTopics:(id)a3;
+ (id)_titleForRecommendationSource:(unint64_t)a3;
+ (id)_titleForRecommendationTopicSource:(unint64_t)a3;
+ (void)_rankRecommendationsInPlace:(id)a3 history:(id)a4 weightManager:(id)a5 suppressHistoryDeduplication:(BOOL)a6;
- (BOOL)ignoreMinimumNumberOfRecommendationsPerTopic;
- (BOOL)suppressHistoryDeduplication;
- (NSArray)dataSources;
- (WBSForYouRecommendationMediator)initWithContextClient:(id)a3 historyProvider:(id)a4;
- (id)_dataSourceWeightManager;
- (id)analyticsMetadataForRecommendation:(id)a3;
- (id)recommendationFromDictionary:(id)a3;
- (void)_beginListeningForHandoffActivity;
- (void)_createAppSuggestionsManagerIfNecessary;
- (void)_createPreferenceManagerIfNecessary;
- (void)_didUpdateFoundInSuggestions:(id)a3;
- (void)_endListeningForHandoffActivity;
- (void)_fetchImagesForRecommendations:(id)a3 recommendationsDispatchGroup:(id)a4;
- (void)_retrieveFoundInRecommendationsWithCompletionHandler:(id)a3;
- (void)banURLsOfSameDomainAsURL:(id)a3;
- (void)banURLsOfSameDomainAsURL:(id)a3 postingChangeNotificationWhenDone:(BOOL)a4;
- (void)beginListeningForURLSuggestionChanges;
- (void)bestAppSuggestionChanged:(id)a3;
- (void)clearDataSourceWeights;
- (void)dealloc;
- (void)downvoteSource:(unint64_t)a3;
- (void)downvoteSource:(unint64_t)a3 postingChangeNotificationWhenDone:(BOOL)a4;
- (void)obtainMessagesImagesWherePossibleForRecommendations:(id)a3 completionHandler:(id)a4;
- (void)retrieveHandoffRecommendationWithCompletionHandler:(id)a3;
- (void)setIgnoreMinimumNumberOfRecommendationsPerTopic:(BOOL)a3;
- (void)setSuppressHistoryDeduplication:(BOOL)a3;
- (void)stopListeningForURLSuggestionChanges;
- (void)updatedRecommendationsForTopics:(id)a3 withCompletionHandler:(id)a4;
- (void)updatedTopicsWithCompletionHandler:(id)a3;
@end

@implementation WBSForYouRecommendationMediator

- (WBSForYouRecommendationMediator)initWithContextClient:(id)a3 historyProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSForYouRecommendationMediator;
  v9 = [(WBSForYouRecommendationMediator *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextClient, a3);
    uint64_t v11 = MEMORY[0x1AD115160](v8);
    id historyProvider = v10->_historyProvider;
    v10->_id historyProvider = (id)v11;

    id v13 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSForYouRecommendationMediator.%@.%p.internalQueue", objc_opt_class(), v10];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    messagesMetadataCache = v10->_messagesMetadataCache;
    v10->_messagesMetadataCache = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    requestsInProgressBySourceID = v10->_requestsInProgressBySourceID;
    v10->_requestsInProgressBySourceID = (NSMutableSet *)v18;

    v20 = objc_alloc_init(WBSFoundInRecommendationManager);
    foundInManager = v10->_foundInManager;
    v10->_foundInManager = v20;

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v10 selector:sel__didUpdateFoundInSuggestions_ name:@"WBSFoundInRecommendationManagerDidUpdateSuggestionsNotification" object:v10->_foundInManager];

    [(WBSForYouRecommendationMediator *)v10 _beginListeningForHandoffActivity];
    v23 = v10;
  }

  return v10;
}

- (void)dealloc
{
  [(WBSForYouRecommendationMediator *)self _endListeningForHandoffActivity];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSForYouRecommendationMediator;
  [(WBSForYouRecommendationMediator *)&v4 dealloc];
}

- (void)_didUpdateFoundInSuggestions:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:*MEMORY[0x1E4F985D8] object:self];
}

- (void)updatedTopicsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F983E8] areLocalSiriSuggestionsEnabled])
  {
    if (!self->_topicManager)
    {
      v5 = [WBSForYouTopicManager alloc];
      v6 = (*((void (**)(void))self->_historyProvider + 2))();
      id v7 = [(WBSForYouTopicManager *)v5 initWithHistory:v6 contextClient:self->_contextClient];
      topicManager = self->_topicManager;
      self->_topicManager = v7;
    }
    v9 = dispatch_group_create();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__8;
    v32[4] = __Block_byref_object_dispose__8;
    id v33 = [MEMORY[0x1E4F1CA48] array];
    dispatch_group_enter(v9);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    char v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    v10 = self->_topicManager;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E5E429B8;
    objc_super v25 = v30;
    v26 = v32;
    v27 = v28;
    uint64_t v11 = v9;
    v24 = v11;
    [(WBSForYouTopicManager *)v10 contextKitTopicsWithCompletionHandler:v23];
    dispatch_group_enter(v11);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    v12 = self->_topicManager;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16;
    v16[3] = &unk_1E5E429B8;
    uint64_t v18 = v21;
    v19 = v32;
    v20 = v28;
    id v13 = v11;
    v17 = v13;
    [(WBSForYouTopicManager *)v12 portraitNamedEntitiesWithCompletionHandler:v16];
    id v14 = MEMORY[0x1E4F14428];
    id v15 = v4;
    WBSDispatchGroupNotifyWithTimeout();

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0]);
  }
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if ([v3 count])
  {
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v4);
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v3];
    }
    objc_sync_exit(v4);
  }
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Obtained %ld ContextKit topics.", (uint8_t *)&v8, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if ([v3 count])
  {
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v4);
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v3];
    }
    objc_sync_exit(v4);
  }
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Obtained %ld Portrait topics.", (uint8_t *)&v8, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_17(void *a1, uint64_t a2)
{
  id v4 = *(id *)(*(void *)(a1[5] + 8) + 40);
  objc_sync_enter(v4);
  if (a1[4])
  {
    if (a2 == 1)
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
      if ((v5 & 1) == 0)
      {
        v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_17_cold_2();
        }
      }
      unsigned __int8 v7 = atomic_load((unsigned __int8 *)(*(void *)(a1[7] + 8) + 24));
      if ((v7 & 1) == 0)
      {
        int v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_17_cold_1();
        }
      }
      atomic_store(1u, (unsigned __int8 *)(*(void *)(a1[8] + 8) + 24));
    }
    uint64_t v9 = +[WBSForYouRecommendationMediator _adjustedTopicsWithTopics:*(void *)(*(void *)(a1[5] + 8) + 40)];
    uint64_t v10 = (void *)[v9 copy];

    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_sync_exit(v4);
}

- (void)banURLsOfSameDomainAsURL:(id)a3
{
}

- (void)banURLsOfSameDomainAsURL:(id)a3 postingChangeNotificationWhenDone:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke;
  block[3] = &unk_1E5E40D88;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createPreferenceManagerIfNecessary];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_2;
  v5[3] = &__block_descriptor_33_e8_v12__0B8l;
  char v6 = *(unsigned char *)(a1 + 48);
  return [v3 setPreferenceValue:1 forURL:v2 completionHandler:v5];
}

void __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 32)) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_14);
    }
  }
}

void __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F985D8] object:0];
}

- (void)_createPreferenceManagerIfNecessary
{
  if (!self->_perSitePreferenceManager)
  {
    id v3 = [WBSForYouPerSitePreferenceManager alloc];
    id v6 = [MEMORY[0x1E4F98380] sharedStore];
    id v4 = [(WBSForYouPerSitePreferenceManager *)v3 initWithPerSitePreferencesStore:v6];
    perSitePreferenceManager = self->_perSitePreferenceManager;
    self->_perSitePreferenceManager = v4;
  }
}

- (void)updatedRecommendationsForTopics:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v17 = a4;
  uint64_t v18 = self;
  objc_initWeak(&location, self);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  unsigned __int8 v7 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = [(WBSForYouRecommendationMediator *)self dataSources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke;
        v32[3] = &unk_1E5E42A28;
        id v13 = v6;
        v36 = v42;
        id v33 = v13;
        v34 = v12;
        objc_copyWeak(&v37, &location);
        v35 = v7;
        [v12 recommendationsWithTopics:v19 withCompletionHandler:v32];

        objc_destroyWeak(&v37);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v9);
  }

  dispatch_group_enter(v7);
  id v14 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RetrieveRecommendations", "WBSFoundInRecommendationManager", buf, 2u);
  }
  *(void *)buf = 0;
  char v29 = buf;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24;
  v22[3] = &unk_1E5E42A50;
  objc_super v25 = buf;
  id v15 = v6;
  id v23 = v15;
  v26 = v42;
  objc_copyWeak(&v27, &location);
  v16 = v7;
  v24 = v16;
  [(WBSForYouRecommendationMediator *)v18 _retrieveFoundInRecommendationsWithCompletionHandler:v22];
  id v20 = v15;
  id v21 = v17;
  WBSDispatchGroupNotifyWithTimeout();

  objc_destroyWeak(&v27);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v42, 8);

  objc_destroyWeak(&location);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) addObjectsFromArray:v3];
    }
    objc_sync_exit(v4);
  }
  id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = [v3 count];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v12 = 134218242;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Retrieved %ld link recommendations from %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _fetchImagesForRecommendations:v3 recommendationsDispatchGroup:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
  objc_sync_exit(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _fetchImagesForRecommendations:v3 recommendationsDispatchGroup:*(void *)(a1 + 40)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  unsigned __int8 v7 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1ABB70000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RetrieveRecommendations", " enableTelemetry=YES ", v8, 2u);
  }
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (*(void *)(a1 + 48))
  {
    if (a2 == 1)
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      if (v5)
      {
        unsigned __int8 v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25_cold_2();
        }
      }
      else
      {
        id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25_cold_1();
        }
      }
      atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    if ([*(id *)(a1 + 32) count])
    {
      [*(id *)(a1 + 40) _createPreferenceManagerIfNecessary];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v10 = *(void **)(v8 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_26;
      v11[3] = &unk_1E5E422D0;
      v11[4] = v8;
      id v12 = *(id *)(a1 + 48);
      [v10 allowedForYouRecommendationsFromRecommendations:v9 completionHandler:v11];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  objc_sync_exit(v4);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned __int8 v5 = *(NSObject **)(v4 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E40940;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_2(id *a1)
{
  uint64_t v2 = (void *)[a1[4] mutableCopy];
  id v3 = (*(void (**)(void))(*((void *)a1[5] + 11) + 16))();
  uint64_t v4 = [a1[5] _dataSourceWeightManager];
  +[WBSForYouRecommendationMediator _rankRecommendationsInPlace:v2 history:v3 weightManager:v4 suppressHistoryDeduplication:*((unsigned __int8 *)a1[5] + 97)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5E420C8;
  id v8 = v2;
  id v5 = a1[5];
  id v9 = a1[6];
  id v6 = v2;
  [v5 obtainMessagesImagesWherePossibleForRecommendations:v6 completionHandler:v7];
}

uint64_t __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  removeLinkRecommendationsPassingTestWithReductionReason(*(void **)(a1 + 32), @"items with an empty title", &__block_literal_global_32);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

BOOL __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 title];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (void)obtainMessagesImagesWherePossibleForRecommendations:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  unsigned __int8 v7 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    unint64_t v12 = 0x1E5E3F000uLL;
    uint64_t v34 = *(void *)v41;
    do
    {
      uint64_t v13 = 0;
      uint64_t v35 = v10;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        id v15 = *(void **)(v12 + 2768);
        uint64_t v16 = [v14 bundleIdentifier];
        LODWORD(v15) = [v15 isBundleIdentifierFromMessages:v16];

        if (v15)
        {
          id v17 = [v14 sourceID];

          if (v17)
          {
            uint64_t v18 = [v14 sourceID];
            id v19 = (void *)[v18 copy];

            id v20 = [(NSCache *)self->_messagesMetadataCache objectForKey:v19];
            id v21 = v20;
            if (v20)
            {
              char v22 = self;
              id v23 = v8;
              v24 = v7;
              objc_super v25 = [v20 first];
              v26 = [v14 title];
              uint64_t v27 = [v26 length];

              if (!v27 && v25) {
                [v14 setTitle:v25];
              }
              v28 = [v21 second];
              char v29 = imageValidForPresentation(v28);

              if (v29) {
                [v14 setImage:v29];
              }

              unsigned __int8 v7 = v24;
              id v8 = v23;
              self = v22;
              uint64_t v11 = v34;
              uint64_t v10 = v35;
              unint64_t v12 = 0x1E5E3F000;
            }
            else
            {
              dispatch_group_enter(v7);
              if ([(NSMutableSet *)self->_requestsInProgressBySourceID containsObject:v19])
              {
                dispatch_group_leave(v7);
              }
              else
              {
                [(NSMutableSet *)self->_requestsInProgressBySourceID addObject:v19];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke;
                v36[3] = &unk_1E5E42AC0;
                v36[4] = self;
                id v30 = v19;
                id v37 = v30;
                long long v38 = v7;
                long long v39 = v14;
                id v31 = v30;
                unint64_t v12 = 0x1E5E3F000;
                [(WBSForYouRecommendationMediator *)self loadLinkPresentationMetadataForMessageWithGUID:v31 completionHandler:v36];
              }
            }
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  id v32 = v33;
  WBSDispatchGroupNotifyWithTimeout();
}

void __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v10 = a2;
  unint64_t v5 = a3;
  if (v10 | v5)
  {
    id v6 = imageValidForPresentation((void *)v5);
    if (v6) {
      [*(id *)(a1 + 56) setImage:v6];
    }
    unsigned __int8 v7 = [*(id *)(a1 + 56) title];
    uint64_t v8 = [v7 length];

    if (v10 && !v8) {
      [*(id *)(a1 + 56) setTitle:v10];
    }
    if (v10 && v5)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F98360]) initWithFirst:v10 second:v5];
      [*(id *)(*(void *)(a1 + 32) + 64) setObject:v9 forKey:*(void *)(a1 + 40)];
    }
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

uint64_t __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    BOOL v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchImagesForRecommendations:(id)a3 recommendationsDispatchGroup:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 contact];
        if (v13)
        {

LABEL_8:
          dispatch_group_enter(v7);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __95__WBSForYouRecommendationMediator__fetchImagesForRecommendations_recommendationsDispatchGroup___block_invoke;
          v15[3] = &unk_1E5E40968;
          uint64_t v16 = v7;
          [(WBSForYouRecommendationMediator *)self fetchImageForRecommendation:v12 completionHandler:v15];

          continue;
        }
        __int16 v14 = [v12 image];

        if (!v14) {
          goto LABEL_8;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

void __95__WBSForYouRecommendationMediator__fetchImagesForRecommendations_recommendationsDispatchGroup___block_invoke(uint64_t a1)
{
}

- (void)_retrieveFoundInRecommendationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  foundInManager = self->_foundInManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__WBSForYouRecommendationMediator__retrieveFoundInRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E42B10;
  id v8 = v4;
  id v6 = v4;
  [(WBSFoundInRecommendationManager *)foundInManager recentRecommendationsWithCompletionHandler:v7];
}

uint64_t __88__WBSForYouRecommendationMediator__retrieveFoundInRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retrieveHandoffRecommendationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4FB36D0] userActivityContinuationSupported])
  {
    [(WBSForYouRecommendationMediator *)self _createAppSuggestionsManagerIfNecessary];
    unint64_t v5 = [(UABestAppSuggestion *)self->_currentAppSuggestion uniqueIdentifier];
    if (v5)
    {
      id v6 = [(UABestAppSuggestion *)self->_currentAppSuggestion originatingDeviceName];
      unsigned __int8 v7 = (void *)MEMORY[0x1E4FB36C8];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E5E42B38;
      id v11 = v6;
      id v12 = v4;
      v10[4] = self;
      id v8 = v6;
      id v9 = (id)[v7 fetchUserActivityWithUUID:v5 intervalToWaitForDocumentSynchronizationToComplete:v10 completionHandler:5.0];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = [v5 webpageURL];
  id v8 = v7;
  if (!v7)
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v11) {
        __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_2(v10, v6);
      }
    }
    else if (v11)
    {
      __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "safari_isHTTPFamilyURL") & 1) == 0)
  {
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_18;
  }
  id v9 = [v5 title];
  if ([v9 length]) {
    [v5 title];
  }
  else {
  id v12 = [v8 host];
  }

  if ([v12 length])
  {
    uint64_t v13 = [WBSForYouLinkRecommendation alloc];
    __int16 v14 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v15 = [(WBSForYouLinkRecommendation *)v13 initWithTitle:v12 url:v8 lastSeenDate:v14 source:3 topicSource:0];

    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 48) originatingDeviceType];
    [(WBSForYouLinkRecommendation *)v15 setSecondarySourceIdentifier:v16];

    id v17 = *(id *)(a1 + 40);
    if ([v17 length])
    {
      long long v18 = NSString;
      long long v19 = _WBSLocalizedString();
      long long v20 = objc_msgSend(v18, "stringWithFormat:", v19, v17);
      [(WBSForYouLinkRecommendation *)v15 setFootnote:v20];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_18:
}

- (void)_createAppSuggestionsManagerIfNecessary
{
  if ([MEMORY[0x1E4FB36D0] userActivityContinuationSupported]
    && !self->_appSuggestionManager)
  {
    BOOL v3 = (UABestAppSuggestionManager *)objc_alloc_init(MEMORY[0x1E4FB36C0]);
    appSuggestionManager = self->_appSuggestionManager;
    self->_appSuggestionManager = v3;
  }
}

- (void)_beginListeningForHandoffActivity
{
  [(WBSForYouRecommendationMediator *)self _createAppSuggestionsManagerIfNecessary];
  [(UABestAppSuggestionManager *)self->_appSuggestionManager setDelegate:self];
  appSuggestionManager = self->_appSuggestionManager;
  [(UABestAppSuggestionManager *)appSuggestionManager startListeningForBestAppSuggestions];
}

- (void)_endListeningForHandoffActivity
{
  [(UABestAppSuggestionManager *)self->_appSuggestionManager setDelegate:0];
  [(UABestAppSuggestionManager *)self->_appSuggestionManager stopListeningForBestAppSuggestions];
  appSuggestionManager = self->_appSuggestionManager;
  [(UABestAppSuggestionManager *)appSuggestionManager invalidate];
}

- (void)beginListeningForURLSuggestionChanges
{
}

- (void)stopListeningForURLSuggestionChanges
{
}

- (void)downvoteSource:(unint64_t)a3
{
}

- (void)downvoteSource:(unint64_t)a3 postingChangeNotificationWhenDone:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v7 = [(WBSForYouRecommendationMediator *)self _dataSourceWeightManager];
  [v7 downvoteSource:a3];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:*MEMORY[0x1E4F985D8] object:self];
  }
}

- (void)clearDataSourceWeights
{
  BOOL v3 = [(WBSForYouRecommendationMediator *)self _dataSourceWeightManager];
  [v3 clear];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F985D8] object:self];
}

- (id)_dataSourceWeightManager
{
  dataSourceWeightManager = self->_dataSourceWeightManager;
  if (!dataSourceWeightManager)
  {
    id v4 = [WBSForYouDataSourceWeightManager alloc];
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v6 = [(WBSForYouDataSourceWeightManager *)v4 initWithKeyValueStore:v5];
    unsigned __int8 v7 = self->_dataSourceWeightManager;
    self->_dataSourceWeightManager = v6;

    dataSourceWeightManager = self->_dataSourceWeightManager;
  }
  id v8 = dataSourceWeightManager;
  return v8;
}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__WBSForYouRecommendationMediator_bestAppSuggestionChanged___block_invoke;
    v5[3] = &unk_1E5E40D38;
    void v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __60__WBSForYouRecommendationMediator_bestAppSuggestionChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) activityType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F28AC0]]) {
    BOOL v3 = *(void **)(a1 + 40);
  }
  else {
    BOOL v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v3);

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"WBSForYouRecommendationMediatorDidUpdateHandoffApplicationNotification" object:*(void *)(a1 + 32)];
}

- (NSArray)dataSources
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)analyticsMetadataForRecommendation:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_msgSend((id)objc_opt_class(), "_titleForRecommendationSource:", objc_msgSend(v3, "source"));
  [v4 setObject:v5 forKeyedSubscript:@"source"];

  id v6 = [v3 cachedScore];
  [v4 setObject:v6 forKeyedSubscript:@"recommendationScore"];

  unsigned __int8 v7 = NSNumber;
  id v8 = [v3 lastSeenDate];
  [v8 timeIntervalSinceNow];
  uint64_t v10 = [v7 numberWithDouble:-v9];
  [v4 setObject:v10 forKeyedSubscript:@"recency"];

  BOOL v11 = [v3 bundleIdentifier];
  if ([v11 length])
  {
    id v12 = [v3 bundleIdentifier];
    [v4 setObject:v12 forKeyedSubscript:@"sourceBundleIdentifier"];
  }
  else
  {
    [v4 setObject:@"unspecified" forKeyedSubscript:@"sourceBundleIdentifier"];
  }

  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "_titleForRecommendationTopicSource:", objc_msgSend(v3, "topicSource"));
  [v4 setObject:v13 forKeyedSubscript:@"topicSource"];

  return v4;
}

+ (id)_titleForRecommendationSource:(unint64_t)a3
{
  if (a3 > 7) {
    return @"unspecified";
  }
  else {
    return off_1E5E42C60[a3];
  }
}

+ (id)_titleForRecommendationTopicSource:(unint64_t)a3
{
  if (a3 > 4) {
    return @"unspecified";
  }
  else {
    return off_1E5E42CA0[a3];
  }
}

+ (double)scoreForRecommendation:(id)a3 weightManager:(id)a4 simplifiedURLStringToLastVisitedDateMap:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v8, "weightForSource:", objc_msgSend(v9, "source"));
  double v11 = v10;

  id v12 = [v9 lastSeenDate];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v14 = v13;
  [v12 timeIntervalSinceReferenceDate];
  double v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v18 = [v12 isEqualToDate:v17];

  long long v19 = [v9 pageURL];
  int v20 = objc_msgSend(v19, "safari_isTopLevelURL");

  if (v20) {
    double v21 = 0.75;
  }
  else {
    double v21 = 1.0;
  }
  uint64_t v22 = [v9 originalQueries];
  unint64_t v23 = [v22 count];

  if (v23 >= 2) {
    double v21 = v21 * pow(1.1, (double)(v23 - 1));
  }
  v24 = [v9 simplifiedURLString];

  if ([v24 length])
  {
    objc_super v25 = [v7 objectForKeyedSubscript:v24];
    v26 = v25;
    if (v25)
    {
      [v25 timeIntervalSinceReferenceDate];
      if (v27 != 0.0)
      {
        double v28 = v27;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        if (v29 - v28 < 15552000.0) {
          double v21 = v21 * 1.1;
        }
      }
    }
  }
  double v30 = ((v14 - v16) / 3600.0 + -2160.0) / -432.0;
  if (v18) {
    double v30 = -5.0;
  }
  double v31 = fmin(v11 * (1.0 - 1.0 / (exp(v30) + 1.0)) * v21, 1.0);

  return v31;
}

+ (void)_rankRecommendationsInPlace:(id)a3 history:(id)a4 weightManager:(id)a5 suppressHistoryDeduplication:(BOOL)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v37 = a4;
  id v11 = a5;
  long long v38 = v10;
  if ([v10 count])
  {
    id v35 = a1;
    v36 = v11;
    long long v40 = [MEMORY[0x1E4F1CA60] dictionary];
    if (!a6)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v61 != v14) {
              objc_enumerationMutation(v12);
            }
            double v16 = [*(id *)(*((void *)&v60 + 1) + 8 * i) simplifiedURLString];
            if ([v16 length])
            {
              id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
              [v40 setObject:v17 forKey:v16];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v13);
      }

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke;
      v58[3] = &unk_1E5E42B60;
      id v18 = v40;
      id v59 = v18;
      [v37 enumerateItemsUsingBlock:v58];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v20 = v19;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_2;
      v55[3] = &unk_1E5E42B88;
      id v56 = v18;
      uint64_t v57 = v20;
      removeLinkRecommendationsPassingTestWithReductionReason(v12, @"recently visited items", v55);
    }
    if ((unint64_t)[v38 count] >= 2)
    {
      double v21 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      obuint64_t j = v38;
      uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(obj);
            }
            objc_super v25 = *(void **)(*((void *)&v51 + 1) + 8 * j);
            v26 = [v25 pageURL];
            double v27 = [v21 objectForKeyedSubscript:v26];
            if (!v27
              || ([v25 lastSeenDate],
                  double v28 = objc_claimAutoreleasedReturnValue(),
                  [v27 lastSeenDate],
                  double v29 = objc_claimAutoreleasedReturnValue(),
                  BOOL v30 = [v28 compare:v29] == 1,
                  v29,
                  v28,
                  v30))
            {
              [v21 setObject:v25 forKeyedSubscript:v26];
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v68 count:16];
        }
        while (v22);
      }

      double v31 = [v21 allValues];
      [obj setArray:v31];

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_3;
      v46[3] = &unk_1E5E42BB0;
      id v49 = v35;
      id v47 = v36;
      id v48 = v40;
      uint64_t v50 = 0x3F7BB0247985D58DLL;
      removeLinkRecommendationsPassingTestWithReductionReason(obj, @"old items", v46);
      [obj sortUsingComparator:&__block_literal_global_117];
      uint64_t v42 = 0;
      long long v43 = &v42;
      uint64_t v44 = 0x2020000000;
      uint64_t v45 = 0;
      uint64_t v45 = malloc_type_calloc(8uLL, 8uLL, 0x100004000313F17uLL);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_5;
      v41[3] = &unk_1E5E42BF8;
      v41[4] = &v42;
      removeLinkRecommendationsPassingTestWithReductionReason(obj, @"less relevant items for each data source", v41);
      free((void *)v43[3]);
      v43[3] = 0;
      if ((unint64_t)[obj count] <= 0xA) {
        uint64_t v32 = [obj count];
      }
      else {
        uint64_t v32 = 10;
      }
      if (v32 != [obj count])
      {
        id v33 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [obj count];
          *(_DWORD *)buf = 134218240;
          uint64_t v65 = v34;
          __int16 v66 = 2048;
          uint64_t v67 = 10;
          _os_log_impl(&dword_1ABB70000, v33, OS_LOG_TYPE_INFO, "End up having %ld recommendations. Keep the top %ld", buf, 0x16u);
        }

        objc_msgSend(obj, "removeObjectsInRange:", v32, objc_msgSend(obj, "count") - v32);
      }
      _Block_object_dispose(&v42, 8);
    }
    id v11 = v36;
  }
}

void __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 lastVisitedDate];
  uint64_t v4 = [v3 timeIntervalSinceReferenceDate];
  if (v5 != 0.0)
  {
    id v6 = (void *)MEMORY[0x1AD114F10](v4);
    id v7 = [v10 url];
    id v8 = objc_msgSend(v7, "safari_simplifiedURLStringForDeduping");

    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

    if (v9) {
      [*(id *)(a1 + 32) setObject:v3 forKey:v8];
    }
  }
}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 simplifiedURLString];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    double v5 = v4;
    if (v4)
    {
      double v6 = *(double *)(a1 + 40);
      [v4 timeIntervalSinceReferenceDate];
      BOOL v8 = v6 - v7 < *MEMORY[0x1E4F985F8];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 48) scoreForRecommendation:v3 weightManager:*(void *)(a1 + 32) simplifiedURLStringToLastVisitedDateMap:*(void *)(a1 + 40)];
  double v5 = v4;
  double v6 = *(double *)(a1 + 56);
  if (v4 >= v6)
  {
    double v7 = [NSNumber numberWithDouble:v4];
    [v3 setCachedScore:v7];
  }
  return v5 < v6;
}

uint64_t __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 cachedScore];
  [v5 doubleValue];
  double v7 = v6;

  BOOL v8 = [v4 cachedScore];

  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = -1;
  if (v7 < v10) {
    uint64_t v11 = 1;
  }
  if (v7 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v3 = [a2 source];
  unint64_t v4 = *(void *)(v2 + 8 * v3) + 1;
  *(void *)(v2 + 8 * v3) = v4;
  return v4 > 3;
}

+ (id)_adjustedTopicsWithTopics:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    double v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v3;
    obuint64_t j = v3;
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "title", v20);
        id v12 = [v5 objectForKeyedSubscript:v11];
        if (v12)
        {
          uint64_t v13 = [v10 relevancyDate];
          uint64_t v14 = [v12 relevancyDate];
          uint64_t v15 = [v13 compare:v14];

          if (v15 != 1) {
            goto LABEL_12;
          }
          [v10 setSource:4];
        }
        [v5 setObject:v10 forKeyedSubscript:v11];
LABEL_12:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v7)
      {
LABEL_14:

        double v16 = [v5 allValues];
        id v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_123];

        if ((unint64_t)[v17 count] <= 3) {
          uint64_t v18 = [v17 count];
        }
        else {
          uint64_t v18 = 3;
        }
        objc_msgSend(v17, "subarrayWithRange:", 0, v18, v20);
        id v4 = (id)objc_claimAutoreleasedReturnValue();

        id v3 = v21;
        goto LABEL_18;
      }
    }
  }
  id v4 = v3;
LABEL_18:

  return v4;
}

uint64_t __61__WBSForYouRecommendationMediator__adjustedTopicsWithTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  double v5 = [a3 relevancyDate];
  uint64_t v6 = [v4 relevancyDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)recommendationFromDictionary:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(v4, "safari_stringForKey:", @"title");
  if ([v5 length])
  {
    uint64_t v6 = objc_msgSend(v4, "safari_stringForKey:", @"urlString");
    if ([v6 length])
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      if (!v7) {
        goto LABEL_6;
      }
      uint64_t v8 = objc_msgSend(v4, "safari_numberForKey:", @"source");
      unint64_t v9 = [v8 integerValue];

      if (v9 > 7) {
        goto LABEL_6;
      }
      double v10 = objc_msgSend(v4, "safari_numberForKey:", @"topic");
      unint64_t v11 = [v10 integerValue];

      if (v11 <= 4)
      {
        uint64_t v14 = [WBSForYouLinkRecommendation alloc];
        uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
        id v12 = [(WBSForYouLinkRecommendation *)v14 initWithTitle:v5 url:v7 lastSeenDate:v15 source:v9 topicSource:v11];

        double v16 = objc_msgSend(v4, "safari_stringForKey:", @"secondarySourceIdentifier");
        [(WBSForYouLinkRecommendation *)v12 setSecondarySourceIdentifier:v16];

        id v17 = objc_msgSend(v4, "safari_stringForKey:", @"footnote");
        [(WBSForYouLinkRecommendation *)v12 setFootnote:v17];

        uint64_t v18 = objc_msgSend(v4, "safari_stringForKey:", @"bundleIdentifier");
        [(WBSForYouLinkRecommendation *)v12 setBundleIdentifier:v18];

        uint64_t v19 = objc_msgSend(v4, "safari_stringForKey:", @"sourceID");
        [(WBSForYouLinkRecommendation *)v12 setSourceID:v19];

        id v20 = objc_msgSend(v4, "safari_stringForKey:", @"imageURLString");
        if ([v20 length])
        {
          double v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
          if (v21)
          {
            [(WBSForYouLinkRecommendation *)v12 setImageURL:v21];
            uint64_t v22 = +[WBSImageFetchingURLSessionTaskManager sharedManager];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke;
            void v28[3] = &unk_1E5E42C40;
            double v29 = v12;
            [v22 downloadImageWithURL:v21 options:1 completionHandler:v28];
          }
        }
        long long v23 = objc_msgSend(v4, "safari_stringForKey:", @"contactHandle");
        if ([v23 length])
        {
          long long v24 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
          long long v25 = [v24 contactForHandle:v23 error:0];

          if (v25)
          {
            [(WBSForYouLinkRecommendation *)v12 setContact:v25];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_3;
            v26[3] = &unk_1E5E40968;
            double v27 = v12;
            [(WBSForYouRecommendationMediator *)self fetchImageForRecommendation:v27 completionHandler:v26];
          }
        }
      }
      else
      {
LABEL_6:
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_2;
  v5[3] = &unk_1E5E40D38;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F985E8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F985F0];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:v3 object:0 userInfo:v5];
}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_4;
  block[3] = &unk_1E5E40968;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_4(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F985E8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F985F0];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:v3 object:0 userInfo:v5];
}

- (BOOL)ignoreMinimumNumberOfRecommendationsPerTopic
{
  return self->_ignoreMinimumNumberOfRecommendationsPerTopic;
}

- (void)setIgnoreMinimumNumberOfRecommendationsPerTopic:(BOOL)a3
{
  self->_ignoreMinimumNumberOfRecommendationsPerTopic = a3;
}

- (BOOL)suppressHistoryDeduplication
{
  return self->_suppressHistoryDeduplication;
}

- (void)setSuppressHistoryDeduplication:(BOOL)a3
{
  self->_suppressHistoryDeduplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_historyProvider, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
  objc_storeStrong((id *)&self->_requestsInProgressBySourceID, 0);
  objc_storeStrong((id *)&self->_messagesMetadataCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_currentAppSuggestion, 0);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceManager, 0);
  objc_storeStrong((id *)&self->_dataSourceWeightManager, 0);
  objc_storeStrong((id *)&self->_foundInManager, 0);
  objc_storeStrong((id *)&self->_topicManager, 0);
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Timed out while obtaining Portrait topics", v2, v3, v4, v5, v6);
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_17_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Timed out while obtaining ContextKit topics", v2, v3, v4, v5, v6);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Timed out while obtaining recommendations from Found In", v2, v3, v4, v5, v6);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Timed out while obtaining recommendations", v2, v3, v4, v5, v6);
}

void __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Timed out loading metadata for Messages from Found In", v2, v3, v4, v5, v6);
}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Could not fetch user activity with unknown error", v2, v3, v4, v5, v6);
}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Could not fetch user activity with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end