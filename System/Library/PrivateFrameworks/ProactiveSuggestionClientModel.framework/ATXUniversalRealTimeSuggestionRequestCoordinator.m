@interface ATXUniversalRealTimeSuggestionRequestCoordinator
- (ATXUniversalRealTimeSuggestionRequestCoordinator)initWithBlendingLayer:(id)a3 hyperParameters:(id)a4 pendingRefreshTracker:(id)a5 server:(id)a6;
- (id)cacheUpdateDictionaryFromCacheUpdatesArray:(id)a3;
- (id)clientModelUpdatesForSuggestionRequest:(id)a3;
- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4;
- (id)selectedLayoutForSuggestionRequest:(id)a3;
- (void)delegateUpdatedSuggestionsForClientModelId:(id)a3 suggestionRequest:(id)a4 response:(id)a5 clientModelsPendingUpdate:(id)a6;
- (void)realTimeProviderDelegateForClientModelId:(id)a3 completion:(id)a4;
- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4;
- (void)remoteAsyncDelegateForClientModel:(id)a3 completion:(id)a4;
- (void)respondToRequestWithPreviouslyCachedPredictionsForClientModelId:(id)a3 suggestionRequest:(id)a4;
- (void)updateSuggestionsFromDelegate:(id)a3 clientModelId:(id)a4 clientModelsPendingUpdate:(id)a5 dispatchGroup:(id)a6 suggestionRequest:(id)a7;
@end

@implementation ATXUniversalRealTimeSuggestionRequestCoordinator

- (ATXUniversalRealTimeSuggestionRequestCoordinator)initWithBlendingLayer:(id)a3 hyperParameters:(id)a4 pendingRefreshTracker:(id)a5 server:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXUniversalRealTimeSuggestionRequestCoordinator;
  v15 = [(ATXUniversalRealTimeSuggestionRequestCoordinator *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_blendingLayer, a3);
    objc_storeStrong((id *)&v16->_hyperParameters, a4);
    objc_storeStrong((id *)&v16->_pendingRefreshTrackerLock, a5);
    objc_storeWeak((id *)&v16->_server, v14);
    uint64_t v17 = [v11 feedbackWriter];
    feedbackWriter = v16->_feedbackWriter;
    v16->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v17;
  }
  return v16;
}

- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "RealTimeRequestCoordinator registering a delegate for clientModelId: %{public}@...", buf, 0xCu);
  }

  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__ATXUniversalRealTimeSuggestionRequestCoordinator_registerRealTimeSuggestionProviderDelegate_clientModelId___block_invoke;
  v12[3] = &unk_1E5F01668;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v12];
}

void __109__ATXUniversalRealTimeSuggestionRequestCoordinator_registerRealTimeSuggestionProviderDelegate_clientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [a2 registeredDelegatesForClientModels];
  [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "RealTimeRequestCoordinator done registering a delegate for clientModelId: %{public}@.", (uint8_t *)&v6, 0xCu);
  }
}

- (id)clientModelUpdatesForSuggestionRequest:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  sel_getName(a2);
  v31 = (void *)os_transaction_create();
  v4 = __atxlog_handle_blending();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  uint64_t v5 = __atxlog_handle_blending();
  int v6 = v5;
  unint64_t v32 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v7 = objc_msgSend(v34, "originatorId", v31);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "RealTimeSuggestionRequest", "originatorId=%{signpost.telemetry:string1, public}@ enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v34;
    _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Received suggestion request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke;
    v52[3] = &unk_1E5F00CE0;
    v36 = v34;
    v53 = v36;
    [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v52];
    id v10 = [(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_hyperParameters clientModelsToConsiderForConsumerSubType:[v36 consumerSubType]];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v10];
    id v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Communicating with client models for request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v13 = dispatch_group_create();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v10;
    uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          dispatch_group_enter(v13);
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_9;
          v44[3] = &unk_1E5F01690;
          v44[4] = self;
          v44[5] = v17;
          id v45 = v11;
          v46 = v13;
          v47 = v36;
          [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self realTimeProviderDelegateForClientModelId:v17 completion:v44];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v14);
    }

    v18 = (void *)MEMORY[0x1E4F93B18];
    [v36 timeout];
    double v20 = v19;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13;
    v41[3] = &unk_1E5F016B8;
    v21 = v36;
    v42 = v21;
    id v22 = v11;
    id v43 = v22;
    [v18 waitForGroup:v13 timeoutSeconds:&__block_literal_global_15 onGroupComplete:v41 onTimeout:v20];
    v23 = __atxlog_handle_blending();
    v24 = v23;
    if (v32 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE67F000, v24, OS_SIGNPOST_INTERVAL_END, spid, "RealTimeSuggestionRequest", (const char *)&unk_1AE6FD572, (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__7;
    v57 = __Block_byref_object_dispose__7;
    id v58 = 0;
    v25 = self->_pendingRefreshTrackerLock;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_14;
    v38[3] = &unk_1E5F016E0;
    p_long long buf = &buf;
    v39 = v21;
    [(_PASLock *)v25 runWithLockAcquired:v38];
    v26 = [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self cacheUpdateDictionaryFromCacheUpdatesArray:*(void *)(*((void *)&buf + 1) + 40)];

    _Block_object_dispose(&buf, 8);
    v27 = v53;
  }
  else
  {
    v29 = __atxlog_handle_blending();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[ATXUniversalRealTimeSuggestionRequestCoordinator clientModelUpdatesForSuggestionRequest:]();
    }

    v30 = __atxlog_handle_blending();
    v27 = v30;
    if (v32 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE67F000, v27, OS_SIGNPOST_INTERVAL_END, spid, "RealTimeSuggestionRequest", (const char *)&unk_1AE6FD572, (uint8_t *)&buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_opt_new();
  v4 = [v3 requestUUIDToClientModelCaches];

  uint64_t v5 = [*(id *)(a1 + 32) requestUUID];
  int v6 = [v5 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:v6];
}

uint64_t __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateSuggestionsFromDelegate:a2 clientModelId:*(void *)(a1 + 40) clientModelsPendingUpdate:*(void *)(a1 + 48) dispatchGroup:*(void *)(a1 + 56) suggestionRequest:*(void *)(a1 + 64)];
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2()
{
  v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2_cold_1(v0);
  }
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13(uint64_t a1)
{
  v2 = __atxlog_handle_blending();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13_cold_1(a1);
  }
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 requestUUIDToClientModelCaches];
  uint64_t v5 = [*(id *)(a1 + 32) requestUUID];
  int v6 = [v5 UUIDString];
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v12 = [v3 requestUUIDToClientModelCaches];

  id v10 = [*(id *)(a1 + 32) requestUUID];
  id v11 = [v10 UUIDString];
  [v12 removeObjectForKey:v11];
}

- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self clientModelUpdatesForSuggestionRequest:a3];
  uint64_t v8 = [(ATXUniversalBlendingLayer *)self->_blendingLayer rerankedValidSuggestionsFromClientModelSuggestions:v7];
  v9 = v8;
  if (v6)
  {
    unint64_t v10 = [v6 unsignedIntegerValue];
    unint64_t v11 = [v9 count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    objc_msgSend(v9, "subarrayWithRange:", 0, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v8;
  }
  uint64_t v14 = v13;

  return v14;
}

- (id)selectedLayoutForSuggestionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self clientModelUpdatesForSuggestionRequest:v4];
  id v6 = [(ATXUniversalBlendingLayer *)self->_blendingLayer rerankedValidSuggestionsFromClientModelSuggestions:v5];
  uint64_t v7 = -[ATXUniversalBlendingLayer selectedLayoutForUIConsumer:rankedSuggestions:](self->_blendingLayer, "selectedLayoutForUIConsumer:rankedSuggestions:", [v4 consumerSubType], v6);
  uint64_t v8 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdates:]([ATXBlendingModelUICacheUpdate alloc], "initWithUICache:consumerSubType:clientModelCacheUpdates:", v7, [v4 consumerSubType], v5);
  feedbackWriter = self->_feedbackWriter;
  uint64_t v10 = [v4 consumerSubType];

  [(ATXUniversalBlendingFeedbackWriter *)feedbackWriter donateBlendingModelUICacheUpdate:v8 uiConsumer:v10];
  return v7;
}

- (void)updateSuggestionsFromDelegate:(id)a3 clientModelId:(id)a4 clientModelsPendingUpdate:(id)a5 dispatchGroup:(id)a6 suggestionRequest:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = a6;
  id v16 = a7;
  uint64_t v17 = __atxlog_handle_blending();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  double v19 = __atxlog_handle_blending();
  double v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)long long buf = 138543362;
    id v41 = v13;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RequestSuggestionsFromRealTimeProviderDelegate", "clientModelId=%{signpost.telemetry:string1, public}@ enableTelemetry=YES ", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = __atxlog_handle_blending();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[ATXUniversalRealTimeSuggestionRequestCoordinator updateSuggestionsFromDelegate:clientModelId:clientModelsPendingUpdate:dispatchGroup:suggestionRequest:]();
        }

        goto LABEL_21;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v24 = __atxlog_handle_blending();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)long long buf = 138543618;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v26;
      _os_log_impl(&dword_1AE67F000, v24, OS_LOG_TYPE_DEFAULT, "Blending: %{public}@ may not have a real-time request delegate that supports %{public}@ requests. Falling back to cache.", buf, 0x16u);
    }
    [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self respondToRequestWithPreviouslyCachedPredictionsForClientModelId:v13 suggestionRequest:v16];
    [v14 removeObject:v13];
    v27 = __atxlog_handle_blending();
    v28 = v27;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE67F000, v28, OS_SIGNPOST_INTERVAL_END, v18, "RequestSuggestionsFromRealTimeProviderDelegate", (const char *)&unk_1AE6FD572, buf, 2u);
    }

LABEL_21:
    dispatch_group_leave(v15);
    goto LABEL_25;
  }
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  unint64_t v32 = __154__ATXUniversalRealTimeSuggestionRequestCoordinator_updateSuggestionsFromDelegate_clientModelId_clientModelsPendingUpdate_dispatchGroup_suggestionRequest___block_invoke;
  v33 = &unk_1E5F01708;
  id v34 = self;
  id v21 = v13;
  id v35 = v21;
  id v22 = v16;
  id v36 = v22;
  id v37 = v14;
  os_signpost_id_t v39 = v18;
  v38 = v15;
  v23 = (void *)MEMORY[0x1B3E6F730](&v30);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v12, "suggestionsForInteractionSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v12, "suggestionsForContextualActionSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v12, "suggestionsForIntentSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
  }

LABEL_25:
}

void __154__ATXUniversalRealTimeSuggestionRequestCoordinator_updateSuggestionsFromDelegate_clientModelId_clientModelsPendingUpdate_dispatchGroup_suggestionRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) delegateUpdatedSuggestionsForClientModelId:*(void *)(a1 + 40) suggestionRequest:*(void *)(a1 + 48) response:a2 clientModelsPendingUpdate:*(void *)(a1 + 56)];
  id v3 = __atxlog_handle_blending();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RequestSuggestionsFromRealTimeProviderDelegate", (const char *)&unk_1AE6FD572, v6, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)delegateUpdatedSuggestionsForClientModelId:(id)a3 suggestionRequest:(id)a4 response:(id)a5 clientModelsPendingUpdate:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    *(_DWORD *)long long buf = 138543874;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v16;
    __int16 v37 = 1024;
    int v38 = [v12 responseCode];
    _os_log_impl(&dword_1AE67F000, v14, OS_LOG_TYPE_DEFAULT, "Blending: %{public}@ real-time delegate provided response to %{public}@. Response code: %d", buf, 0x1Cu);
  }
  if ([v12 responseCode] == 1)
  {
    [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self respondToRequestWithPreviouslyCachedPredictionsForClientModelId:v10 suggestionRequest:v11];
  }
  else if ([v12 responseCode] == 3 {
         || ![v12 responseCode]
  }
         || [v12 responseCode] == 5)
  {
    uint64_t v17 = __atxlog_handle_blending();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXUniversalRealTimeSuggestionRequestCoordinator delegateUpdatedSuggestionsForClientModelId:suggestionRequest:response:clientModelsPendingUpdate:]((uint64_t)v10, v12);
    }
  }
  else if ([v12 responseCode] == 2 || objc_msgSend(v12, "responseCode") == 4)
  {
    os_signpost_id_t v18 = [ATXClientModelCacheUpdate alloc];
    double v19 = [v12 suggestions];
    double v20 = [v12 feedbackMetadata];
    id v21 = [(ATXClientModelCacheUpdate *)v18 initWithClientModelId:v10 suggestions:v19 feedbackMetadata:v20 responseForRealTimeRequest:v12];

    [(ATXUniversalBlendingFeedbackWriter *)self->_feedbackWriter sendEventToBiomeIfNeededForClientModelCacheUpdate:v21 previousUpdate:0];
    if ([v12 responseCode] == 4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      v23 = [v12 suggestions];
      v24 = [v12 feedbackMetadata];
      [WeakRetained clientModelUpdatedSuggestions:v23 feedbackMetadata:v24 clientModelId:v10 completion:&__block_literal_global_26_0];
    }
    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_27;
    uint64_t v30 = &unk_1E5F01668;
    id v31 = v11;
    unint64_t v32 = v21;
    v26 = v21;
    [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:&v27];
  }
  objc_msgSend(v13, "removeObject:", v10, v27, v28, v29, v30);
}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = [a2 requestUUIDToClientModelCaches];
  id v4 = [*(id *)(a1 + 32) requestUUID];
  os_signpost_id_t v5 = [v4 UUIDString];
  id v6 = [v3 objectForKeyedSubscript:v5];

  [v6 addObject:*(void *)(a1 + 40)];
}

- (void)respondToRequestWithPreviouslyCachedPredictionsForClientModelId:(id)a3 suggestionRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v9 = [WeakRetained clientModelCacheManager];
  id v10 = [v9 cachedSuggestionsForClientModel:v7];

  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __134__ATXUniversalRealTimeSuggestionRequestCoordinator_respondToRequestWithPreviouslyCachedPredictionsForClientModelId_suggestionRequest___block_invoke;
  v14[3] = &unk_1E5F01668;
  id v15 = v6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v6;
  [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v14];
}

void __134__ATXUniversalRealTimeSuggestionRequestCoordinator_respondToRequestWithPreviouslyCachedPredictionsForClientModelId_suggestionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 requestUUIDToClientModelCaches];
  id v4 = [*(id *)(a1 + 32) requestUUID];
  os_signpost_id_t v5 = [v4 UUIDString];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (*(void *)(a1 + 40)) {
    objc_msgSend(v6, "addObject:");
  }
}

- (id)cacheUpdateDictionaryFromCacheUpdatesArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "clientModelId", (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)realTimeProviderDelegateForClientModelId:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Fetching delegate for client model %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __104__ATXUniversalRealTimeSuggestionRequestCoordinator_realTimeProviderDelegateForClientModelId_completion___block_invoke;
  long long v16 = &unk_1E5F016E0;
  p_long long buf = &buf;
  id v10 = v6;
  id v17 = v10;
  [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:&v13];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v11 = __atxlog_handle_blending();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_1AE67F000, v11, OS_LOG_TYPE_DEFAULT, "Found a cached delegate for clientModelId: %{public}@", v19, 0xCu);
    }

    v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));
  }
  else
  {
    id v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Didn't find a cached delegate for client model %{public}@. Trying the XPC route.", v19, 0xCu);
    }

    -[ATXUniversalRealTimeSuggestionRequestCoordinator remoteAsyncDelegateForClientModel:completion:](self, "remoteAsyncDelegateForClientModel:completion:", v10, v7, v13, v14, v15, v16);
  }

  _Block_object_dispose(&buf, 8);
}

void __104__ATXUniversalRealTimeSuggestionRequestCoordinator_realTimeProviderDelegateForClientModelId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 registeredDelegatesForClientModels];
  uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)remoteAsyncDelegateForClientModel:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to clientModelId: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)[[NSString alloc] initWithFormat:@"com.apple.proactive.SuggestionRequest.%@", v6];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v9 options:0];
  id v11 = ATXProactiveSuggestionRealTimeProviderXPCInterface();
  [v10 setRemoteObjectInterface:v11];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke;
  v22[3] = &unk_1E5F016B8;
  id v12 = v6;
  id v23 = v12;
  v24 = self;
  [v10 setInterruptionHandler:v22];
  uint64_t v13 = [v10 interruptionHandler];
  [v10 setInvalidationHandler:v13];

  [v10 resume];
  if (v10)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__7;
    uint64_t v28 = __Block_byref_object_dispose__7;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_2;
    v20[3] = &unk_1E5F00980;
    id v14 = v7;
    id v21 = v14;
    id v29 = [v10 remoteObjectProxyWithErrorHandler:v20];
    long long v15 = *(void **)(*((void *)&buf + 1) + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_3;
    v16[3] = &unk_1E5F01730;
    v16[4] = self;
    p_long long buf = &buf;
    id v17 = v12;
    id v18 = v14;
    [v15 pingWithCompletion:v16];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_blending();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_34;
  v4[3] = &unk_1E5F00CE0;
  id v5 = *(id *)(a1 + 32);
  [v3 runWithLockAcquired:v4];
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = [a2 registeredDelegatesForClientModels];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_4;
    v7[3] = &unk_1E5F016E0;
    uint64_t v9 = *(void *)(a1 + 56);
    id v8 = *(id *)(a1 + 40);
    [v3 runWithLockAcquired:v7];
    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4, v5);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 registeredDelegatesForClientModels];
  [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_blendingLayer, 0);
  objc_storeStrong((id *)&self->_pendingRefreshTrackerLock, 0);
}

- (void)clientModelUpdatesForSuggestionRequest:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Received a real-time suggestion request of an unexpected type: %{public}@. Returning nil.", v4, v5, v6, v7, 2u);
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE67F000, log, OS_LOG_TYPE_DEBUG, "Success", v1, 2u);
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) timeout];
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v1, v2, "Dispatch group timed out when responding to real time request. Request timeout: %.2f seconds. Pending updates from: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)updateSuggestionsFromDelegate:clientModelId:clientModelsPendingUpdate:dispatchGroup:suggestionRequest:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_7(&dword_1AE67F000, v2, v3, "Received a real-time suggestion request of an unexpected type: %{public}@. Returning.", v4, v5, v6, v7, 2u);
}

- (void)delegateUpdatedSuggestionsForClientModelId:(uint64_t)a1 suggestionRequest:(void *)a2 response:clientModelsPendingUpdate:.cold.1(uint64_t a1, void *a2)
{
  id v8 = [a2 error];
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v2, v3, "Encountered error when fetching requesting real-time suggestions from client model: %{public}@. Error: %{public}@", v4, v5, v6, v7, 2u);
}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Error when updating suggestions in Real Time Request Coordinator. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Blending: Connection to Client Model %{public}@ interrupted in 2-way communication server.", (uint8_t *)&v3, 0xCu);
}

@end