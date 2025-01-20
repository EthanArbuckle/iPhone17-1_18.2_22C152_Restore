@interface ATXUniversalBlendingLayerServer
- (ATXClientModelCacheManagerProtocol)clientModelCacheManager;
- (ATXUniversalBlendingLayer)blendingLayer;
- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 clientModelCacheManager:(id)a6 clientModelNotificationManager:(id)a7 serverDelegate:(id)a8 pendingRefreshTracker:(id)a9;
- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 serverDelegate:(id)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)willForceRefreshOfAllUIs;
- (id)clientModelsThatUpdatedSuggestionsRecently;
- (id)consumerSubTypesToRefreshGivenUpdatesFromClientModels:(id)a3;
- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4;
- (id)selectedLayoutForSuggestionRequest:(id)a3;
- (void)clientModelUpdatedNotificationId:(id)a3 clientModelId:(id)a4 completion:(id)a5;
- (void)clientModelUpdatedSuggestions:(id)a3 feedbackMetadata:(id)a4 clientModelId:(id)a5 completion:(id)a6;
- (void)coalescedBlendingLayerRefresh;
- (void)dealloc;
- (void)generateLayoutForRequest:(id)a3 reply:(id)a4;
- (void)generateRankedSuggestionsForRequest:(id)a3 limit:(id)a4 reply:(id)a5;
- (void)refreshBlendingLayer;
- (void)refreshBlendingLayerIfNeededForNewSuggestions:(id)a3 previousCacheUpdate:(id)a4 clientModelId:(id)a5;
- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4;
- (void)retrieveSuggestionsForClientModelId:(id)a3 reply:(id)a4;
- (void)setupXPCListener;
- (void)start;
- (void)updateClientModelCacheWithCacheUpdate:(id)a3 previousCacheUpdate:(id)a4 completion:(id)a5;
@end

@implementation ATXUniversalBlendingLayerServer

- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 serverDelegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = objc_opt_new();
  v17 = [(ATXUniversalBlendingLayerServer *)self initWithBlendingLayer:v13 engagementRecordsManager:v12 hyperParameters:v11 clientModelCacheManager:v14 clientModelNotificationManager:v15 serverDelegate:v10 pendingRefreshTracker:v16];

  return v17;
}

- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 clientModelCacheManager:(id)a6 clientModelNotificationManager:(id)a7 serverDelegate:(id)a8 pendingRefreshTracker:(id)a9
{
  id v16 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v17 = a8;
  id v18 = a9;
  v42.receiver = self;
  v42.super_class = (Class)ATXUniversalBlendingLayerServer;
  v19 = [(ATXUniversalBlendingLayerServer *)&v42 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_blendingLayer, a3);
    objc_storeStrong((id *)&v20->_clientModelCacheManager, a6);
    objc_storeStrong((id *)&v20->_clientModelNotificationManager, a7);
    objc_storeWeak((id *)&v20->_serverDelegate, v17);
    objc_storeStrong((id *)&v20->_engagementRecordsManager, a4);
    objc_storeStrong((id *)&v20->_hyperParameters, a5);
    uint64_t v21 = objc_msgSend(v16, "feedbackWriter", v35, v36, v37, v38);
    feedbackWriter = v20->_feedbackWriter;
    v20->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v21;

    objc_initWeak(&location, v20);
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("ATXClientModelSuggestionReceiver", v23);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v18];
    pendingRefreshTrackerLock = v20->_pendingRefreshTrackerLock;
    v20->_pendingRefreshTrackerLock = (_PASLock *)v26;

    v28 = [[ATXUniversalRealTimeSuggestionRequestCoordinator alloc] initWithBlendingLayer:v20->_blendingLayer hyperParameters:v20->_hyperParameters pendingRefreshTracker:v20->_pendingRefreshTrackerLock server:v20];
    realTimeSuggestionRequestCoordinator = v20->_realTimeSuggestionRequestCoordinator;
    v20->_realTimeSuggestionRequestCoordinator = v28;

    id v30 = objc_alloc(MEMORY[0x1E4F93B98]);
    v31 = v20->_queue;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke;
    v39[3] = &unk_1E5F00C68;
    objc_copyWeak(&v40, &location);
    uint64_t v32 = [v30 initWithQueue:v31 operation:v39];
    coalescedBlendingLayerRefreshOperation = v20->_coalescedBlendingLayerRefreshOperation;
    v20->_coalescedBlendingLayerRefreshOperation = (_PASSimpleCoalescingTimer *)v32;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v20;
}

void __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained coalescedBlendingLayerRefresh];
  }
  else
  {
    v3 = __atxlog_handle_blending();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke_cold_1(v3);
    }
  }
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = (const char *)[@"com.apple.duetexpertd.clientModelRefreshBlendingLayer" UTF8String];
  v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __40__ATXUniversalBlendingLayerServer_start__block_invoke;
  id v10 = &unk_1E5F00C90;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_blendingDarwinNotificationObserver, v4, &v7);

  [(ATXUniversalBlendingLayerServer *)self setupXPCListener];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_refreshBlendingLayer name:@"com.apple.duetexpertd.clientModelRefreshBlendingLayer" object:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __40__ATXUniversalBlendingLayerServer_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshBlendingLayer];
}

- (void)dealloc
{
  int blendingDarwinNotificationObserver = self->_blendingDarwinNotificationObserver;
  if (blendingDarwinNotificationObserver)
  {
    notify_cancel(blendingDarwinNotificationObserver);
    self->_int blendingDarwinNotificationObserver = 0;
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  v4.receiver = self;
  v4.super_class = (Class)ATXUniversalBlendingLayerServer;
  [(ATXUniversalBlendingLayerServer *)&v4 dealloc];
}

- (void)setupXPCListener
{
  v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.ProactiveSuggestionClientModel.xpc"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  id v5 = self->_xpcListener;
  [(NSXPCListener *)v5 resume];
}

- (void)clientModelUpdatedSuggestions:(id)a3 feedbackMetadata:(id)a4 clientModelId:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = __atxlog_handle_xpc();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  id v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "updateSuggestionsFromClientModel", " enableTelemetry=YES ", buf, 2u);
  }

  id v18 = __atxlog_handle_blending();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v10 count];
    *(_DWORD *)buf = 138543618;
    id v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    _os_log_impl(&dword_1AE67F000, v18, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model produced %lu new suggestions. Updating the internal cache.", buf, 0x16u);
  }

  v20 = (void *)[[NSString alloc] initWithFormat:@"Received the following suggestions for client model %@: \n%@", v12, v10];
  uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p> ", self);
  +[ATXUniversalBlendingLayer logLongDescriptionForBlendingLayerString:v20 prefix:v21 shouldUseDefaultLogLevel:1 limit:20];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  LOBYTE(v21) = [WeakRetained rerouteSuggestions:v10 clientModelId:v12 completion:v13];

  if ((v21 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1B3E6F520]();
    id v24 = objc_loadWeakRetained((id *)&self->_serverDelegate);
    objc_msgSend(v24, "willCreateCacheUpdateWithFeedbackMetadataLength:forClientModelId:", objc_msgSend(v11, "length"), v12);

    v25 = [(ATXClientModelCacheManagerProtocol *)self->_clientModelCacheManager cachedSuggestionsForClientModel:v12];
    uint64_t v26 = [[ATXClientModelCacheUpdate alloc] initWithClientModelId:v12 suggestions:v10 feedbackMetadata:v11 responseForRealTimeRequest:0];
    [(ATXUniversalBlendingLayerServer *)self updateClientModelCacheWithCacheUpdate:v26 previousCacheUpdate:v25 completion:v13];
    [(ATXUniversalBlendingLayerServer *)self refreshBlendingLayerIfNeededForNewSuggestions:v10 previousCacheUpdate:v25 clientModelId:v12];
  }
  if (v10) {
    id v27 = v10;
  }
  else {
    id v27 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(ATXEngagementRecordManagerProtocol *)self->_engagementRecordsManager updateForClientModelCacheUpdate:v27 clientModelId:v12];
  v28 = __atxlog_handle_xpc();
  v29 = v28;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v29, OS_SIGNPOST_INTERVAL_END, v15, "updateSuggestionsFromClientModel", " enableTelemetry=YES ", buf, 2u);
  }
}

- (void)updateClientModelCacheWithCacheUpdate:(id)a3 previousCacheUpdate:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__ATXUniversalBlendingLayerServer_updateClientModelCacheWithCacheUpdate_previousCacheUpdate_completion___block_invoke;
  block[3] = &unk_1E5F00CB8;
  block[4] = self;
  id v11 = v8;
  id v18 = v11;
  id v19 = v9;
  id v12 = v9;
  id v13 = (void (**)(id, void))a5;
  dispatch_sync(queue, block);
  v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v15 = [v11 clientModelId];
    id v16 = [v11 uuid];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1AE67F000, v14, OS_LOG_TYPE_DEFAULT, "Blending: Updated cached client suggestions for client model: %{public}@ with client cache update UUID: %@", buf, 0x16u);
  }
  v13[2](v13, 0);
}

uint64_t __104__ATXUniversalBlendingLayerServer_updateClientModelCacheWithCacheUpdate_previousCacheUpdate_completion___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 56) sendEventToBiomeIfNeededForClientModelCacheUpdate:a1[5] previousUpdate:a1[6]];
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 104);
  return [v3 updateCachedSuggestions:v2];
}

- (void)refreshBlendingLayerIfNeededForNewSuggestions:(id)a3 previousCacheUpdate:(id)a4 clientModelId:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 suggestions];
  BOOL v11 = +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:v10 newSuggestions:v9];

  id v12 = __atxlog_handle_blending();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v8;
      _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Executing Blending Layer refresh based on suggestion update for %{public}@", buf, 0xCu);
    }

    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __115__ATXUniversalBlendingLayerServer_refreshBlendingLayerIfNeededForNewSuggestions_previousCacheUpdate_clientModelId___block_invoke;
    v20[3] = &unk_1E5F00CE0;
    os_signpost_id_t v15 = v8;
    uint64_t v21 = v15;
    [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v20];
    int64_t v16 = +[ATXProactiveSuggestionClientModel clientModelTypeFromClientModelId:v15];
    if (v16 == 1 || v16 == 46 || v16 == 24)
    {
      coalescedBlendingLayerRefreshOperation = self->_coalescedBlendingLayerRefreshOperation;
      double v18 = 1.0;
      uint64_t v19 = 0;
    }
    else
    {
      coalescedBlendingLayerRefreshOperation = self->_coalescedBlendingLayerRefreshOperation;
      double v18 = 3.0;
      uint64_t v19 = 1;
    }
    [(_PASSimpleCoalescingTimer *)coalescedBlendingLayerRefreshOperation runAfterDelaySeconds:v19 coalescingBehavior:v18];
    id v12 = v21;
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Skipping Blending Layer refresh based on suggestion update for %{public}@", buf, 0xCu);
  }
}

void __115__ATXUniversalBlendingLayerServer_refreshBlendingLayerIfNeededForNewSuggestions_previousCacheUpdate_clientModelId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [v3 clientModelsThatUpdatedSuggestions];
  [v4 addObject:*(void *)(a1 + 32)];

  id v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v3 clientModelsThatUpdatedSuggestions];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1AE67F000, v5, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Updated pendingRefreshTracker. Client Models that updated recently: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)refreshBlendingLayer
{
  [(_PASLock *)self->_pendingRefreshTrackerLock runWithLockAcquired:&__block_literal_global_4];
  coalescedBlendingLayerRefreshOperation = self->_coalescedBlendingLayerRefreshOperation;
  [(_PASSimpleCoalescingTimer *)coalescedBlendingLayerRefreshOperation runAfterDelaySeconds:1 coalescingBehavior:3.0];
}

uint64_t __55__ATXUniversalBlendingLayerServer_refreshBlendingLayer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldForceRefreshForAllUIs:1];
}

- (void)coalescedBlendingLayerRefresh
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_DEBUG, "BlendingRefresh: The Blending Layer has the following suggestions: %@", (uint8_t *)&v2, 0xCu);
}

void __64__ATXUniversalBlendingLayerServer_coalescedBlendingLayerRefresh__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 clientModelsThatUpdatedSuggestions];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 shouldForceRefreshForAllUIs];
  int v7 = objc_opt_new();
  [v8 setClientModelsThatUpdatedSuggestions:v7];

  [v8 setShouldForceRefreshForAllUIs:0];
}

uint64_t __64__ATXUniversalBlendingLayerServer_coalescedBlendingLayerRefresh__block_invoke_31(uint64_t a1, void *a2)
{
  int v2 = (void *)MEMORY[0x1E4F4B680];
  uint64_t v3 = [a2 unsignedIntValue];
  return [v2 stringForConsumerSubtype:v3];
}

- (id)consumerSubTypesToRefreshGivenUpdatesFromClientModels:(id)a3
{
  return (id)[(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_hyperParameters consumerSubTypesToConsiderForClientModelIds:a3];
}

- (void)clientModelUpdatedNotificationId:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  BOOL v11 = __atxlog_handle_xpc();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  BOOL v13 = __atxlog_handle_xpc();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "updateNotificationIdFromClientModel", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  os_signpost_id_t v15 = __atxlog_handle_blending();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1AE67F000, v15, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model updated its notification id. New notification id: %@", (uint8_t *)&v18, 0x16u);
  }

  [(ATXClientModelNotificationManager *)self->_clientModelNotificationManager updateNotificationId:v8 clientModel:v9];
  v10[2](v10, 0);

  int64_t v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v17, OS_SIGNPOST_INTERVAL_END, v12, "updateNotificationIdFromClientModel", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }
}

- (void)retrieveSuggestionsForClientModelId:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void *, void))a4;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  BOOL v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "retrieveSuggestionsForClientModelId", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  os_signpost_id_t v12 = __atxlog_handle_blending();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model retrieves suggestions.", (uint8_t *)&v18, 0xCu);
  }

  BOOL v13 = [(ATXClientModelCacheManagerProtocol *)self->_clientModelCacheManager cachedSuggestionsForClientModel:v6];
  v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ATXUniversalBlendingLayerServer retrieveSuggestionsForClientModelId:reply:]((uint64_t)v6, v13, v14);
  }

  os_signpost_id_t v15 = [v13 suggestions];
  v7[2](v7, v15, 0);

  int64_t v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v17, OS_SIGNPOST_INTERVAL_END, v9, "retrieveSuggestionsForClientModelId", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }
}

- (void)generateLayoutForRequest:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  BOOL v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "generateLayoutForRequest", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v12 = [(ATXUniversalBlendingLayerServer *)self selectedLayoutForSuggestionRequest:v7];

  v6[2](v6, v12);
  BOOL v13 = __atxlog_handle_xpc();
  v14 = v13;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)os_signpost_id_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v14, OS_SIGNPOST_INTERVAL_END, v9, "generateLayoutForRequest", " enableTelemetry=YES ", v15, 2u);
  }
}

- (id)selectedLayoutForSuggestionRequest:(id)a3
{
  return [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self->_realTimeSuggestionRequestCoordinator selectedLayoutForSuggestionRequest:a3];
}

- (void)generateRankedSuggestionsForRequest:(id)a3 limit:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = __atxlog_handle_xpc();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  BOOL v13 = __atxlog_handle_xpc();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "generateSuggestionsForRequest", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v15 = [(ATXUniversalBlendingLayerServer *)self generatedRankedSuggestionsForSuggestionRequest:v10 limit:v9];

  v8[2](v8, v15);
  int64_t v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)int v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE67F000, v17, OS_SIGNPOST_INTERVAL_END, v12, "generateSuggestionsForRequest", " enableTelemetry=YES ", v18, 2u);
  }
}

- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4
{
  return [(ATXUniversalRealTimeSuggestionRequestCoordinator *)self->_realTimeSuggestionRequestCoordinator generatedRankedSuggestionsForSuggestionRequest:a3 limit:a4];
}

- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.proactive.ProactiveSuggestionClientModel.xpc"];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && ([v6 BOOLValue] & 1) != 0)
  {
    id v7 = ATXCreateProactiveSuggestionClientModelXPCInterface();
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_39];
    [v5 setInvalidationHandler:&__block_literal_global_42];
    [v5 resume];
    BOOL v8 = 1;
  }
  else
  {
    id v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXUniversalBlendingLayerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, @"com.apple.proactive.ProactiveSuggestionClientModel.xpc", v9);
    }

    BOOL v8 = 0;
  }

  return v8;
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_40()
{
  v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_40_cold_1(v0);
  }
}

- (id)clientModelsThatUpdatedSuggestionsRecently
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__2;
  os_signpost_id_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__ATXUniversalBlendingLayerServer_clientModelsThatUpdatedSuggestionsRecently__block_invoke;
  v5[3] = &unk_1E5F00D28;
  v5[4] = &v8;
  v5[5] = v6;
  [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __77__ATXUniversalBlendingLayerServer_clientModelsThatUpdatedSuggestionsRecently__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 clientModelsThatUpdatedSuggestions];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  LOBYTE(v4) = [v3 shouldForceRefreshForAllUIs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (BOOL)willForceRefreshOfAllUIs
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  id v11 = 0;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ATXUniversalBlendingLayerServer_willForceRefreshOfAllUIs__block_invoke;
  v5[3] = &unk_1E5F00D28;
  v5[4] = v10;
  v5[5] = &v6;
  [(_PASLock *)pendingRefreshTrackerLock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);

  return v3;
}

void __59__ATXUniversalBlendingLayerServer_willForceRefreshOfAllUIs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 clientModelsThatUpdatedSuggestions];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  LOBYTE(v4) = [v3 shouldForceRefreshForAllUIs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (ATXUniversalBlendingLayer)blendingLayer
{
  return self->_blendingLayer;
}

- (ATXClientModelCacheManagerProtocol)clientModelCacheManager
{
  return self->_clientModelCacheManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelCacheManager, 0);
  objc_storeStrong((id *)&self->_blendingLayer, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_coalescedBlendingLayerRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_storeStrong((id *)&self->_realTimeSuggestionRequestCoordinator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_engagementRecordsManager, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong((id *)&self->_clientModelNotificationManager, 0);
  objc_storeStrong((id *)&self->_pendingRefreshTrackerLock, 0);
}

void __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "ATXClientModelSuggestionReceiver: couldn't perform refresh operation because swelf is nil", v1, 2u);
}

- (void)retrieveSuggestionsForClientModelId:(NSObject *)a3 reply:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 suggestions];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  char v9 = v5;
  _os_log_debug_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_DEBUG, "Blending: client model <<%{public}@>> has the following suggestions: %@", (uint8_t *)&v6, 0x16u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "Blending: Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE67F000, log, OS_LOG_TYPE_DEBUG, "Blending: Unexpected interruption on Proactive Suggestion Client Model XPC interface", v1, 2u);
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_40_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE67F000, log, OS_LOG_TYPE_DEBUG, "Blending: Connection invalidated on Proactive Suggestion Client Model XPC interface. Client went away.", v1, 2u);
}

@end