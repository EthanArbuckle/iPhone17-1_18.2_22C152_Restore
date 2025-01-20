@interface PXSearchParsecAnalyticsSession
+ (id)sharedSession;
- (OS_dispatch_queue)reportingQueue;
- (PARSession)session;
- (PXSearchParsecAnalyticsSession)init;
- (SFStartLocalSearchFeedback)currentStartSearchFeedback;
- (SFStartLocalSearchFeedback)currentStartZeroKeywordLoadFeedback;
- (int64_t)currentQueryId;
- (void)_reportFeedback:(id)a3;
- (void)_reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:(id)a3;
- (void)reportAllResultsShown:(id)a3 retrievalTypeMap:(id)a4;
- (void)reportInitialSuggestionSelected;
- (void)reportInitialSuggestions:(id)a3;
- (void)reportPhotosAppEnteredBackground;
- (void)reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:(id)a3 previousSearchTokens:(id)a4;
- (void)reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity;
- (void)reportPhotosAppQuit;
- (void)reportSearchAssetResultSelected:(id)a3 isTopResult:(BOOL)a4 retrievalType:(unint64_t)a5;
- (void)reportSearchButtonTappedWhenScoped:(BOOL)a3;
- (void)reportSearchCollectionResultSelected:(id)a3 type:(unint64_t)a4;
- (void)reportSearchFieldBackButtonSelected;
- (void)reportSearchFieldContentChanged:(id)a3 isScoped:(BOOL)a4;
- (void)reportSearchFieldContentCleared;
- (void)reportSearchQueryExecutionCompleted;
- (void)reportSearchSuggestionSelected:(id)a3;
- (void)reportSearchTabDeselected;
- (void)reportToBiomeResults:(id)a3 forSearchQuery:(id)a4;
- (void)reportTopCollectionsShown:(id)a3;
- (void)reportTopResultsShown:(id)a3 retrievalTypeMap:(id)a4;
- (void)setCurrentQueryId:(int64_t)a3;
- (void)setCurrentStartSearchFeedback:(id)a3;
- (void)setCurrentStartZeroKeywordLoadFeedback:(id)a3;
- (void)setReportingQueue:(id)a3;
@end

@implementation PXSearchParsecAnalyticsSession

- (void)reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:(id)a3 previousSearchTokens:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F9A3D0];
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)[[v6 alloc] initWithEvent:7];
  v9 = +[PXSearchParsecAnalyticsUtilities legacyDescriptionForSearchString:v8 searchTokens:v7];

  [v10 setPreexistingInput:v9];
  [(PXSearchParsecAnalyticsSession *)self _reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:v10];
}

- (void)_reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:(id)a3
{
  id v4 = a3;
  v5 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  dispatch_suspend(v5);

  objc_initWeak(&location, self);
  v6 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v8, &location);
  block[4] = v4;
  dispatch_async(v6, block);

  px_dispatch_on_main_queue_when_idle_after_delay();
}

- (OS_dispatch_queue)reportingQueue
{
  return self->_reportingQueue;
}

+ (id)sharedSession
{
  if (sharedSession_onceToken[0] != -1) {
    dispatch_once(sharedSession_onceToken, &__block_literal_global_5639);
  }
  v2 = (void *)sharedSession_sharedSession;
  return v2;
}

void __47__PXSearchParsecAnalyticsSession_sharedSession__block_invoke()
{
  v0 = objc_alloc_init(PXSearchParsecAnalyticsSession);
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = (uint64_t)v0;
}

- (PXSearchParsecAnalyticsSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXSearchParsecAnalyticsSession;
  v2 = [(PXSearchParsecAnalyticsSession *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentQueryId = 1;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.photos.search.parsec_reporting", v5);
    reportingQueue = v3->_reportingQueue;
    v3->_reportingQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingQueue, 0);
  objc_storeStrong((id *)&self->_currentStartZeroKeywordLoadFeedback, 0);
  objc_storeStrong((id *)&self->_currentStartSearchFeedback, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setReportingQueue:(id)a3
{
}

- (void)setCurrentStartZeroKeywordLoadFeedback:(id)a3
{
}

- (SFStartLocalSearchFeedback)currentStartZeroKeywordLoadFeedback
{
  return self->_currentStartZeroKeywordLoadFeedback;
}

- (void)setCurrentStartSearchFeedback:(id)a3
{
}

- (SFStartLocalSearchFeedback)currentStartSearchFeedback
{
  return self->_currentStartSearchFeedback;
}

- (void)setCurrentQueryId:(int64_t)a3
{
  self->_currentQueryId = a3;
}

- (int64_t)currentQueryId
{
  return self->_currentQueryId;
}

- (void)reportToBiomeResults:(id)a3 forSearchQuery:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 count];
  if (v7 >= 0x32) {
    uint64_t v8 = 50;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_super v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);

  id v10 = (void *)MEMORY[0x1E4F56658];
  uint64_t v11 = *MEMORY[0x1E4F565A0];
  uint64_t v12 = *MEMORY[0x1E4F565B0];
  v14[0] = *MEMORY[0x1E4F565A8];
  v14[1] = v12;
  v15[0] = v9;
  v15[1] = v5;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v10 sendEvent:v11 withPayload:v13];
}

- (void)_reportFeedback:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXSearchParsecAnalyticsSession *)self session];
  objc_msgSend(v5, "reportFeedback:queryId:", v4, -[PXSearchParsecAnalyticsSession currentQueryId](self, "currentQueryId"));

  id v6 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    int64_t v8 = [(PXSearchParsecAnalyticsSession *)self currentQueryId];
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Reporting queryID: %lld feedback: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reportFeedback:*(void *)(a1 + 32)];

  v3 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Reporting Photos app launched", v4, 2u);
  }
}

void __95__PXSearchParsecAnalyticsSession__reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback___block_invoke_30(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) reportingQueue];
  dispatch_resume(v1);
}

- (void)reportInitialSuggestionSelected
{
  id v3 = objc_initWeak(&location, self);
  id v4 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PXSearchParsecAnalyticsSession_reportInitialSuggestionSelected__block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__PXSearchParsecAnalyticsSession_reportInitialSuggestionSelected__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = +[PXSearchParsecAnalyticsUtilities SFSearchResultForInitialSuggestionWithQueryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultForInitialSuggestionWithQueryId:", [WeakRetained currentQueryId]);

  id v4 = +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:v3];
  id v5 = objc_loadWeakRetained(v1);
  [v5 _reportFeedback:v4];

  id v6 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Reporting initial suggestion selected", v7, 2u);
  }
}

- (void)reportInitialSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXSearchParsecAnalyticsSession_reportInitialSuggestions___block_invoke;
  block[3] = &unk_1E5DD20C8;
  id v9 = v4;
  id v7 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__PXSearchParsecAnalyticsSession_reportInitialSuggestions___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = +[PXSearchParsecAnalyticsUtilities sectionRankingFeedbackWithInitialSuggestions:queryId:](PXSearchParsecAnalyticsUtilities, "sectionRankingFeedbackWithInitialSuggestions:queryId:", v1, [WeakRetained currentQueryId]);

  id v5 = objc_alloc(MEMORY[0x1E4F9A318]);
  v11[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = (void *)[v5 initWithSections:v6 blendingDuration:0.0];

  id v8 = objc_loadWeakRetained(v2);
  [v8 _reportFeedback:v7];

  id v9 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Reporting number of intial suggestions in search home", v10, 2u);
  }
}

- (void)reportTopCollectionsShown:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PXSearchParsecAnalyticsSession_reportTopCollectionsShown___block_invoke;
  block[3] = &unk_1E5DD20C8;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__PXSearchParsecAnalyticsSession_reportTopCollectionsShown___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v19 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        id v4 = *(void **)(*((void *)&v27 + 1) + 8 * v3);
        unsigned int v5 = [v4 unsignedIntValue];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v6 = [*(id *)(v19 + 32) objectForKeyedSubscript:v4];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              id WeakRetained = objc_loadWeakRetained((id *)(v19 + 40));
              v13 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromCollectionIdentifier:type:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromCollectionIdentifier:type:queryId:", v11, v5, [WeakRetained currentQueryId]);

              [v2 addObject:v13];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v8);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F9A540]) initWithResults:v2 triggerEvent:1];
  id v15 = objc_loadWeakRetained((id *)(v19 + 40));
  [v15 _reportFeedback:v14];

  v16 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Reporting currently shown top collection results", buf, 2u);
  }
}

- (void)reportAllResultsShown:(id)a3 retrievalTypeMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __73__PXSearchParsecAnalyticsSession_reportAllResultsShown_retrievalTypeMap___block_invoke;
  v11[3] = &unk_1E5DD2548;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__PXSearchParsecAnalyticsSession_reportAllResultsShown_retrievalTypeMap___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1[4];
  uint64_t v1 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v20;
    uint64_t v4 = 100;
LABEL_3:
    uint64_t v5 = 0;
    uint64_t v6 = v4 & (v4 >> 63);
    while (1)
    {
      if (*(void *)v20 != v3) {
        objc_enumerationMutation(obj);
      }
      if (v6 == v4) {
        break;
      }
      uint64_t v7 = *(void *)(*((void *)&v19 + 1) + v5);
      uint64_t v8 = [a1[5] objectForKeyedSubscript:v7];
      uint64_t v9 = [v8 unsignedIntValue];

      id WeakRetained = objc_loadWeakRetained(a1 + 6);
      uint64_t v11 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:", v7, 0, v9, [WeakRetained currentQueryId]);

      [v17 addObject:v11];
      --v4;

      v5 += 8;
      if (!--v2)
      {
        uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v2) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F9A540]) initWithResults:v17 triggerEvent:1];
  id v13 = objc_loadWeakRetained(a1 + 6);
  [v13 _reportFeedback:v12];

  id v14 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Reporting currently shown All Results", buf, 2u);
  }
}

- (void)reportTopResultsShown:(id)a3 retrievalTypeMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __73__PXSearchParsecAnalyticsSession_reportTopResultsShown_retrievalTypeMap___block_invoke;
  v11[3] = &unk_1E5DD2548;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__PXSearchParsecAnalyticsSession_reportTopResultsShown_retrievalTypeMap___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a1[4];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = [a1[5] objectForKeyedSubscript:v7];
        uint64_t v9 = [v8 unsignedIntValue];

        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        uint64_t v11 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:", v7, 1, v9, [WeakRetained currentQueryId]);

        [v2 addObject:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F9A540]) initWithResults:v2 triggerEvent:1];
  id v13 = objc_loadWeakRetained(a1 + 6);
  [v13 _reportFeedback:v12];

  id v14 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Reporting currently shown Top Results", buf, 2u);
  }
}

- (void)reportSearchCollectionResultSelected:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_initWeak(&location, self);
  uint64_t v8 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXSearchParsecAnalyticsSession_reportSearchCollectionResultSelected_type___block_invoke;
  block[3] = &unk_1E5DC8380;
  v13[1] = (id)a4;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  objc_copyWeak(v13, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __76__PXSearchParsecAnalyticsSession_reportSearchCollectionResultSelected_type___block_invoke(uint64_t a1)
{
  id v2 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromCollectionIdentifier:type:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromCollectionIdentifier:type:queryId:", *(void *)(a1 + 32), *(void *)(a1 + 56), [*(id *)(a1 + 40) currentQueryId]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F99FA8]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F99EF0]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v3 cardSection:v4 result:v2 button:v5];
  [v6 setTriggerEvent:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _reportFeedback:v6];

  uint64_t v8 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Reporting search collection result was selected", v9, 2u);
  }
}

- (void)reportSearchAssetResultSelected:(id)a3 isTopResult:(BOOL)a4 retrievalType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_initWeak(&location, self);
  id v10 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PXSearchParsecAnalyticsSession_reportSearchAssetResultSelected_isTopResult_retrievalType___block_invoke;
  block[3] = &unk_1E5DC6970;
  BOOL v15 = a4;
  id v13 = v8;
  v14[1] = (id)a5;
  id v11 = v8;
  objc_copyWeak(v14, &location);
  dispatch_async(v10, block);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __92__PXSearchParsecAnalyticsSession_reportSearchAssetResultSelected_isTopResult_retrievalType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:](PXSearchParsecAnalyticsUtilities, "SFSearchResultFromAssetUUID:isTopResult:retrievalType:queryId:", v1, v2, v3, [WeakRetained currentQueryId]);

  id v7 = objc_alloc_init(MEMORY[0x1E4F99FA8]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F99EF0]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v7 cardSection:v8 result:v6 button:v9];
  [v10 setTriggerEvent:2];
  id v11 = objc_loadWeakRetained(v4);
  [v11 _reportFeedback:v10];

  id v12 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Reporting search result was selected", v13, 2u);
  }
}

- (void)reportSearchSuggestionSelected:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PXSearchParsecAnalyticsSession *)self currentQueryId];
    objc_initWeak(location, self);
    id v6 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PXSearchParsecAnalyticsSession_reportSearchSuggestionSelected___block_invoke;
    block[3] = &unk_1E5DCCBD8;
    id v9 = v4;
    v10[1] = v5;
    objc_copyWeak(v10, location);
    dispatch_async(v6, block);

    objc_destroyWeak(v10);
    objc_destroyWeak(location);
  }
  else
  {
    id v7 = PLSearchUIParsecAnalyticsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Encountered unexpected nil search suggestion when reporting token selection to parsec.", (uint8_t *)location, 2u);
    }
  }
}

void __65__PXSearchParsecAnalyticsSession_reportSearchSuggestionSelected___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PXSearchParsecAnalyticsUtilities SFSearchResultFromSearchSuggestion:*(void *)(a1 + 32) queryId:*(void *)(a1 + 48)];
  uint64_t v3 = +[PXSearchParsecAnalyticsUtilities commandFeedbackFromSFSearchResult:v2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reportFeedback:v3];

  id v5 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search suggestion selected", v6, 2u);
  }
}

- (void)reportSearchFieldBackButtonSelected
{
  id v3 = objc_initWeak(&location, self);
  id v4 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PXSearchParsecAnalyticsSession_reportSearchFieldBackButtonSelected__block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__PXSearchParsecAnalyticsSession_reportSearchFieldBackButtonSelected__block_invoke(id *a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F99F50]) initWithEvent:0];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained _reportFeedback:v2];

  id v4 = objc_loadWeakRetained(a1);
  [v4 setCurrentStartSearchFeedback:0];

  id v5 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search field cancel button selected", v6, 2u);
  }
}

- (void)reportSearchFieldContentCleared
{
  id v3 = [(PXSearchParsecAnalyticsSession *)self currentQueryId];
  id v4 = objc_initWeak(&location, self);
  id v5 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXSearchParsecAnalyticsSession_reportSearchFieldContentCleared__block_invoke;
  block[3] = &unk_1E5DD0260;
  v7[1] = v3;
  objc_copyWeak(v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __65__PXSearchParsecAnalyticsSession_reportSearchFieldContentCleared__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F99F50]) initWithEvent:0];
  [v2 setQueryId:*(void *)(a1 + 40)];
  a1 += 32;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  [WeakRetained _reportFeedback:v2];

  id v4 = objc_loadWeakRetained((id *)a1);
  [v4 setCurrentStartSearchFeedback:0];

  id v5 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Reporting search field content cleared", v6, 2u);
  }
}

- (void)reportSearchQueryExecutionCompleted
{
  objc_initWeak(&location, self);
  id v3 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXSearchParsecAnalyticsSession_reportSearchQueryExecutionCompleted__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__PXSearchParsecAnalyticsSession_reportSearchQueryExecutionCompleted__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained currentStartSearchFeedback];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F9A078]);
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 currentStartSearchFeedback];
    id v7 = [v4 initWithStartSearch:v6];

    id v8 = objc_loadWeakRetained(v1);
    [v8 _reportFeedback:v7];

    id v9 = objc_loadWeakRetained(v1);
    [v9 setCurrentStartSearchFeedback:0];

    id v10 = PLSearchUIParsecAnalyticsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Reporting search query execution completed", v11, 2u);
    }
  }
  else
  {
    id v7 = PLSearchUIParsecAnalyticsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Unexpectedly tracked query end without tracking query begin", buf, 2u);
    }
  }
}

- (void)reportSearchFieldContentChanged:(id)a3 isScoped:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged_isScoped___block_invoke;
  v9[3] = &unk_1E5DD0928;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __75__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged_isScoped___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentQueryId:", objc_msgSend(WeakRetained, "currentQueryId") + 1);

  id v4 = objc_alloc(MEMORY[0x1E4F99F60]);
  id v5 = objc_loadWeakRetained(v2);
  id v6 = objc_msgSend(v4, "initWithEvent:timeInterval:queryId:", @"com.apple.photos.query.start", 0, objc_msgSend(v5, "currentQueryId"));

  id v7 = objc_loadWeakRetained(v2);
  [v7 _reportFeedback:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 length];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged_isScoped___block_invoke_2;
  v21[3] = &unk_1E5DAF2A8;
  id v11 = v8;
  id v22 = v11;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v21);
  BOOL v12 = [*(id *)(a1 + 32) string];
  id v13 = +[PXSearchParsecAnalyticsUtilities descriptionForSearchString:v12 searchTokens:v11];

  id v14 = objc_alloc(MEMORY[0x1E4F9A450]);
  if ([*(id *)(a1 + 32) length]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 9;
  }
  id v16 = objc_loadWeakRetained(v2);
  long long v17 = objc_msgSend(v14, "initWithInput:triggerEvent:indexType:queryId:", v13, v15, 0, objc_msgSend(v16, "currentQueryId"));

  [v17 setIsPhotosScopedSearch:*(unsigned __int8 *)(a1 + 48)];
  id v18 = objc_loadWeakRetained(v2);
  [v18 setCurrentStartSearchFeedback:v17];

  id v19 = objc_loadWeakRetained(v2);
  [v19 _reportFeedback:v17];

  long long v20 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "Reporting search field contents changed with input description: %@", buf, 0xCu);
  }
}

void __75__PXSearchParsecAnalyticsSession_reportSearchFieldContentChanged_isScoped___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *MEMORY[0x1E4F39818];
  id v4 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39818]];

  id v5 = v8;
  if (v4)
  {
    id v6 = [v8 objectForKeyedSubscript:v3];
    id v7 = [v6 suggestion];
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }

    id v5 = v8;
  }
}

- (void)reportSearchTabDeselected
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PXSearchParsecAnalyticsSession_reportSearchTabDeselected__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__PXSearchParsecAnalyticsSession_reportSearchTabDeselected__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:25];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFeedback:v2];

  id v4 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Reporting search home disappeared", v5, 2u);
  }
}

- (void)reportSearchButtonTappedWhenScoped:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXSearchParsecAnalyticsSession_reportSearchButtonTappedWhenScoped___block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __69__PXSearchParsecAnalyticsSession_reportSearchButtonTappedWhenScoped___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D0]) initWithEvent:11];
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFeedback:v2];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F9A450]) initWithInput:0 triggerEvent:9 indexType:0];
  [v5 setIsPhotosScopedSearch:*(unsigned __int8 *)(a1 + 40)];
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 _reportFeedback:v5];

  id v7 = objc_loadWeakRetained(v3);
  [v7 setCurrentStartSearchFeedback:v5];

  BOOL v8 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Reporting search button tapped and search home appeared", v9, 2u);
  }
}

- (void)reportPhotosAppQuit
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PXSearchParsecAnalyticsSession_reportPhotosAppQuit__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__PXSearchParsecAnalyticsSession_reportPhotosAppQuit__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:11];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFeedback:v2];

  id v4 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Reporting Photos app quit", v5, 2u);
  }
}

- (void)reportPhotosAppEnteredBackground
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PXSearchParsecAnalyticsSession *)self reportingQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PXSearchParsecAnalyticsSession_reportPhotosAppEnteredBackground__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__PXSearchParsecAnalyticsSession_reportPhotosAppEnteredBackground__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:23];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFeedback:v2];

  id v4 = PLSearchUIParsecAnalyticsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Reporting Photos app was backgrounded", v5, 2u);
  }
}

- (void)reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F9A3D0]) initWithEvent:7];
  [v3 setOriginatingApp:@"com.apple.searchd.searchthroughsuggestions"];
  [(PXSearchParsecAnalyticsSession *)self _reportPhotosAppLaunchedOrEnteredForegroundEventWithFeedback:v3];
}

- (PARSession)session
{
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  id v3 = self;
  objc_sync_enter(v3);
  session = v3->_session;
  if (!session)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.photos" userAgent:@"Photos/1"];
    uint64_t v6 = [MEMORY[0x1E4F5CBD8] sharedPARSessionWithConfiguration:v5];
    id v7 = v3->_session;
    v3->_session = (PARSession *)v6;

    session = v3->_session;
  }
  BOOL v8 = session;
  objc_sync_exit(v3);

  return v8;
}

@end