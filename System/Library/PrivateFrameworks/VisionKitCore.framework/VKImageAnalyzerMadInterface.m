@interface VKImageAnalyzerMadInterface
+ (VKImageAnalyzerMadInterface)sharedInterface;
+ (id)analyzerDeallocedError;
- (BOOL)hasAnyRequests;
- (MADService)_serviceDontUseThisOneDirectly;
- (MADService)madService;
- (MADService)service;
- (NSMutableDictionary)idsToRequests;
- (NSMutableDictionary)vkToMadIDs;
- (NSMutableOrderedSet)requestQueueProcessing;
- (NSMutableSet)requestQueueCancelling;
- (OS_dispatch_queue)housekeepingQueue;
- (OS_dispatch_queue)processingQueue;
- (VKImageAnalyzerMadInterface)init;
- (id)VNRequestHandlerForRequest:(id)a3;
- (id)analysisResultFromMadRequests:(id)a3 imageSize:(CGSize)a4 durations:(id)a5;
- (id)cancelledError;
- (id)documentObservationFromRequests:(id)a3 durations:(id)a4;
- (id)madSuggestionTypeFromItems:(id)a3;
- (id)mrcDDElementsFromRequests:(id)a3 didParse:(BOOL *)a4 durations:(id)a5;
- (id)rectangleObservationsFromRequests:(id)a3 durations:(id)a4;
- (id)requestForRequestID:(int)a3;
- (id)visualSearchResultFromRequests:(id)a3 durations:(id)a4;
- (int)_performMADRequest:(id)a3 forRequest:(id)a4 pixelBuffer:(__CVBuffer *)a5 cgImage:(CGImage *)a6 useCGForMad:(BOOL)a7 withCompletion:(id)a8;
- (int)processRequest:(id)a3 callbackQueue:(id)a4;
- (int)requestIDIndex;
- (unint64_t)_statusForRequestID:(int)a3;
- (unint64_t)sfViewAppearEventFromInvocationType:(int64_t)a3 request:(id)a4;
- (unint64_t)statusForRequestID:(int)a3;
- (unint64_t)timeoutIndex;
- (void)_cancelRequest:(id)a3;
- (void)_cancelRequestID:(int)a3;
- (void)_processRequest:(id)a3 callbackQueue:(id)a4;
- (void)cancelAllRequests;
- (void)cancelRequestID:(int)a3;
- (void)clearCompletedRequest:(id)a3;
- (void)createNewIdleTimerIfNecessary;
- (void)didFinishRequest:(id)a3 withAnalysis:(id)a4 analyticsEvent:(id)a5 error:(id)a6;
- (void)didLeaveVisualSearchHints;
- (void)didShowVisualSearchCachedResultsForQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 item:(id)a5;
- (void)didShowVisualSearchHintsForRequest:(id)a3 invocationType:(int64_t)a4;
- (void)generateTextualVisualSearchResultForAnalysis:(id)a3 queryInfo:(id)a4 completionHandler:(id)a5;
- (void)generateVisualSearchResultForRequest:(id)a3 analysis:(id)a4 items:(id)a5 payload:(id)a6 queryID:(unint64_t)a7 completionHandler:(id)a8;
- (void)handleCompletionForMultiPartRequest:(id)a3 madRequests:(id)a4 callbackQueue:(id)a5 error:(id)a6;
- (void)performMADRequest:(id)a3 forRequest:(id)a4 withCompletion:(id)a5;
- (void)removeAndNotifyOfCancelledRequest:(id)a3 completion:(id)a4;
- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 analysisEvent:(id)a5 error:(id)a6;
- (void)setHousekeepingQueue:(id)a3;
- (void)setIdsToRequests:(id)a3;
- (void)setMadService:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setRequest:(id)a3 forRequestID:(int)a4;
- (void)setRequestIDIndex:(int)a3;
- (void)setRequestQueueCancelling:(id)a3;
- (void)setRequestQueueProcessing:(id)a3;
- (void)setTimeoutIndex:(unint64_t)a3;
- (void)setVkToMadIDs:(id)a3;
- (void)set_serviceDontUseThisOneDirectly:(id)a3;
- (void)submitVisualIntelligenceUserFeedbackForRequest:(id)a3 reportIdentifier:(id)a4 userFeedbackPayload:(id)a5 sfReportData:(id)a6;
@end

@implementation VKImageAnalyzerMadInterface

+ (VKImageAnalyzerMadInterface)sharedInterface
{
  if (sharedInterface_onceToken != -1) {
    dispatch_once(&sharedInterface_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedInterface_sInterface;
  return (VKImageAnalyzerMadInterface *)v2;
}

void __46__VKImageAnalyzerMadInterface_sharedInterface__block_invoke()
{
  v0 = objc_alloc_init(VKImageAnalyzerMadInterface);
  v1 = (void *)sharedInterface_sInterface;
  sharedInterface_sInterface = (uint64_t)v0;
}

- (VKImageAnalyzerMadInterface)init
{
  v20.receiver = self;
  v20.super_class = (Class)VKImageAnalyzerMadInterface;
  v2 = [(VKImageAnalyzerMadInterface *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74680] service];
    madService = v2->_madService;
    v2->_madService = (MADService *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("VKImageAnalyzerHouseKeeping", v5);
    housekeepingQueue = v2->_housekeepingQueue;
    v2->_housekeepingQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("VKImageAnalyzerProcessing", v6);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    requestQueueProcessing = v2->_requestQueueProcessing;
    v2->_requestQueueProcessing = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requestQueueCancelling = v2->_requestQueueCancelling;
    v2->_requestQueueCancelling = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    idsToRequests = v2->_idsToRequests;
    v2->_idsToRequests = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    vkToMadIDs = v2->_vkToMadIDs;
    v2->_vkToMadIDs = v17;

    v2->_requestIDIndex = 0;
  }
  return v2;
}

- (int)processRequest:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(VKImageAnalyzerMadInterface *)v8 requestIDIndex] + 1;
  [(VKImageAnalyzerMadInterface *)v8 setRequestIDIndex:v9];
  [v6 setRequestID:v9];
  -[VKImageAnalyzerMadInterface setRequest:forRequestID:](v8, "setRequest:forRequestID:", v6, [v6 requestID]);
  objc_sync_exit(v8);

  v10 = [(VKImageAnalyzerMadInterface *)v8 housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VKImageAnalyzerMadInterface_processRequest_callbackQueue___block_invoke;
  block[3] = &unk_1E6BF1268;
  block[4] = v8;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);

  return v9;
}

uint64_t __60__VKImageAnalyzerMadInterface_processRequest_callbackQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processRequest:*(void *)(a1 + 40) callbackQueue:*(void *)(a1 + 48)];
}

- (NSMutableDictionary)vkToMadIDs
{
  uint64_t v3 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v3);

  vkToMadIDs = self->_vkToMadIDs;
  return vkToMadIDs;
}

- (unint64_t)statusForRequestID:(int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 3;
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VKImageAnalyzerMadInterface_statusForRequestID___block_invoke;
  block[3] = &unk_1E6BF2CE0;
  block[4] = self;
  void block[5] = &v10;
  int v9 = a3;
  dispatch_sync(v5, block);

  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __50__VKImageAnalyzerMadInterface_statusForRequestID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _statusForRequestID:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancelRequestID:(int)a3
{
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__VKImageAnalyzerMadInterface_cancelRequestID___block_invoke;
  v6[3] = &unk_1E6BF2D08;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __47__VKImageAnalyzerMadInterface_cancelRequestID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelRequestID:*(unsigned int *)(a1 + 40)];
}

- (void)cancelAllRequests
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(VKImageAnalyzerMadInterface *)v2 idsToRequests];
  v4 = [v3 allKeys];

  objc_sync_exit(v2);
  objc_initWeak(&location, v2);
  v5 = [(VKImageAnalyzerMadInterface *)v2 housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6BF2D58;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling all requests: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke_49;
    v6[3] = &unk_1E6BF2D30;
    v6[4] = WeakRetained;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke_49(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 _cancelRequestID:v3];
}

- (void)_cancelRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(VKImageAnalyzerMadInterface *)self requestForRequestID:v3];
  int v7 = v6;
  if (v6)
  {
    if (([v6 cancelled] & 1) == 0) {
      [(VKImageAnalyzerMadInterface *)self _cancelRequest:v7];
    }
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to cancel completed or unknown requestID: %d", (uint8_t *)v9, 8u);
    }
  }
}

- (BOOL)hasAnyRequests
{
  uint64_t v3 = [(VKImageAnalyzerMadInterface *)self requestQueueCancelling];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(VKImageAnalyzerMadInterface *)self requestQueueProcessing];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (MADService)service
{
  serviceDontUseThisOneDirectly = self->__serviceDontUseThisOneDirectly;
  if (!serviceDontUseThisOneDirectly)
  {
    BOOL v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_INFO, "Retaining MADService", v8, 2u);
    }

    v5 = [MEMORY[0x1E4F74680] service];
    id v6 = self->__serviceDontUseThisOneDirectly;
    self->__serviceDontUseThisOneDirectly = v5;

    serviceDontUseThisOneDirectly = self->__serviceDontUseThisOneDirectly;
  }
  return serviceDontUseThisOneDirectly;
}

- (id)requestForRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  v5 = [(VKImageAnalyzerMadInterface *)v4 idsToRequests];
  id v6 = [NSNumber numberWithInt:v3];
  int v7 = [v5 objectForKeyedSubscript:v6];

  objc_sync_exit(v4);
  return v7;
}

- (void)setRequest:(id)a3 forRequestID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  int v7 = [(VKImageAnalyzerMadInterface *)v6 idsToRequests];
  uint64_t v8 = [NSNumber numberWithInt:v4];
  [v7 setObject:v9 forKeyedSubscript:v8];

  objc_sync_exit(v6);
}

- (void)_cancelRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v5);

  [v4 setCancelled:1];
  unint64_t v6 = -[VKImageAnalyzerMadInterface _statusForRequestID:](self, "_statusForRequestID:", [v4 requestID]);
  int v7 = [(VKImageAnalyzerMadInterface *)self vkToMadIDs];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "requestID"));
  id v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 intValue];

  id v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v4 shortLoggingDescription];
    int v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling Request: %@", (uint8_t *)&v16, 0xCu);
  }
  if (!v6)
  {
    uint64_t v13 = [(VKImageAnalyzerMadInterface *)self service];
    [v13 cancelRequestID:v10];

    v14 = [(VKImageAnalyzerMadInterface *)self requestQueueCancelling];
    id v15 = [v4 requestIDValue];
    [v14 addObject:v15];
  }
}

- (void)removeAndNotifyOfCancelledRequest:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void *))a4;
  uint64_t v8 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 shortLoggingDescription];
    int v12 = 138412290;
    uint64_t v13 = v10;
    _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "Removing and notifying of cancelled request not yet submitted to MAD: %@", (uint8_t *)&v12, 0xCu);
  }
  [(VKImageAnalyzerMadInterface *)self clearCompletedRequest:v6];
  id v11 = [(VKImageAnalyzerMadInterface *)self cancelledError];
  v7[2](v7, [v6 madRequestID], v11);
}

- (unint64_t)_statusForRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [NSNumber numberWithInt:v3];
  int v7 = [(VKImageAnalyzerMadInterface *)self requestForRequestID:v3];
  uint64_t v8 = [(VKImageAnalyzerMadInterface *)self vkToMadIDs];
  id v9 = [v8 objectForKeyedSubscript:v6];
  int v10 = [v9 integerValue];

  if (v7)
  {
    id v11 = [(VKImageAnalyzerMadInterface *)self requestQueueProcessing];
    char v12 = [v11 containsObject:v6];

    if (v12)
    {
      unint64_t v13 = 0;
    }
    else
    {
      uint64_t v14 = [(VKImageAnalyzerMadInterface *)self requestQueueCancelling];
      char v15 = [v14 containsObject:v6];

      uint64_t v16 = 3;
      if (v10 == -1) {
        uint64_t v16 = 1;
      }
      if (v15) {
        unint64_t v13 = 2;
      }
      else {
        unint64_t v13 = v16;
      }
    }
  }
  else
  {
    unint64_t v13 = 3;
  }

  return v13;
}

- (void)clearCompletedRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 requestIDValue];
  if (v6)
  {
    int v7 = [(VKImageAnalyzerMadInterface *)self requestQueueProcessing];
    [v7 containsObject:v6];

    uint64_t v8 = [(VKImageAnalyzerMadInterface *)self requestQueueCancelling];
    [v8 containsObject:v6];

    id v9 = [(VKImageAnalyzerMadInterface *)self requestQueueProcessing];
    [v9 removeObject:v6];

    int v10 = [(VKImageAnalyzerMadInterface *)self requestQueueCancelling];
    objc_msgSend(v10, "vk_removeNonNilObject:", v6);

    id v11 = [(VKImageAnalyzerMadInterface *)self vkToMadIDs];
    [v11 removeObjectForKey:v6];

    -[VKImageAnalyzerMadInterface setRequest:forRequestID:](self, "setRequest:forRequestID:", 0, [v4 requestID]);
    [(VKImageAnalyzerMadInterface *)self createNewIdleTimerIfNecessary];
    [(VKImageAnalyzerMadInterface *)self logCollectionsIfNecessary];
  }
  else
  {
    char v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VKImageAnalyzerMadInterface clearCompletedRequest:]((uint64_t)v4, v12);
    }
  }
}

- (id)cancelledError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Request Cancelled";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-2 userInfo:v3];

  return v4;
}

+ (id)analyzerDeallocedError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Analzyer was dealloced";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-6 userInfo:v3];

  return v4;
}

- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 analysisEvent:(id)a5 error:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v14);

  char v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v10 shortLoggingDescription];
    int v19 = 138412290;
    objc_super v20 = v16;
    _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, "Request completed: %@", (uint8_t *)&v19, 0xCu);
  }
  [(VKImageAnalyzerMadInterface *)self clearCompletedRequest:v10];
  v17 = [v10 completionHandler];

  if (v17)
  {
    uint64_t v18 = [v10 completionHandler];
    ((void (**)(void, id, id, id))v18)[2](v18, v11, v12, v13);
  }
}

- (void)_processRequest:(id)a3 callbackQueue:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 requestID];
  id v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v9;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEFAULT, "Processing Request: %d - %@", (uint8_t *)&buf, 0x12u);
  }

  id v11 = _VKSignpostLog();
  id v12 = _VKSignpostLog();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VisionKit MAD Parse Request", (const char *)&unk_1DB3491BE, (uint8_t *)&buf, 2u);
  }

  uint64_t v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD Parse Request\"", (uint8_t *)&buf, 2u);
  }

  char v15 = [(VKImageAnalyzerMadInterface *)self vkToMadIDs];
  uint64_t v16 = [NSNumber numberWithInt:v9];
  [v15 setObject:&unk_1F357DBA8 forKeyedSubscript:v16];

  v17 = [v6 madRequests];
  if (v17)
  {
    [v6 imageSize];
    int v19 = v18;
    uint64_t v21 = v20;
    objc_initWeak(&buf, self);
    if ([v6 isMultiPartAnalysis])
    {
      v22 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke;
      v37[3] = &unk_1E6BF2D80;
      v23 = &v40;
      objc_copyWeak(&v40, &buf);
      v37[4] = v6;
      id v38 = v17;
      id v39 = v7;
      v24 = (void (**)(void, void, void))MEMORY[0x1E018E600](v37);
    }
    else
    {
      v22 = v34;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2;
      v34[3] = &unk_1E6BF2DA8;
      v23 = v36;
      objc_copyWeak(v36, &buf);
      v34[4] = v6;
      v34[5] = self;
      id v35 = v17;
      v36[1] = v19;
      v36[2] = v21;
      v24 = (void (**)(void, void, void))MEMORY[0x1E018E600](v34);
    }
    objc_destroyWeak(v23);
    if ([v17 count])
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_79;
      v32[3] = &unk_1E6BF2DD0;
      v32[4] = self;
      v33 = v24;
      [(VKImageAnalyzerMadInterface *)self performMADRequest:v17 forRequest:v6 withCompletion:v32];
    }
    else
    {
      [v6 setMadRequestID:420420420];
      v31 = [MEMORY[0x1E4F1C9C8] date];
      [v6 setProcessDate:v31];

      v24[2](v24, 420420420, 0);
    }

    objc_destroyWeak(&buf);
  }
  else
  {
    v25 = [v6 shortLoggingDescription];
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKImageAnalyzerMadInterface _processRequest:callbackQueue:]", 0, 0, @"unable to create madRequests for request %@", v25);

    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v41 = *MEMORY[0x1E4F1D140];
    v42 = @"Unable to create madRequests for request";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v28 = (void *)[v26 initWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-3 userInfo:v27];

    v29 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[VKImageAnalyzerMadInterface _processRequest:callbackQueue:](v6, (uint64_t)v28, v29);
    }

    v30 = [[VKAnalyticsAnalyzerEvent alloc] initWithExecutionDurations:0 request:v6 analysis:0 customIdentifier:0 error:v28];
    [(VKImageAnalyzerMadInterface *)self didFinishRequest:v6 withAnalysis:0 analyticsEvent:v30 error:v28];
  }
  [(VKImageAnalyzerMadInterface *)self logCollectionsIfNecessary];
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleCompletionForMultiPartRequest:*(void *)(a1 + 32) madRequests:*(void *)(a1 + 40) callbackQueue:*(void *)(a1 + 48) error:v6];
  }
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  id v7 = (id *)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 32) processDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (WeakRetained)
  {
    id v11 = objc_alloc_init(VKAnalysisExecutionDurations);
    [(VKAnalysisExecutionDurations *)v11 setMadRoundTripAnalysisDuration:v10];
    if (v4)
    {
      id v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_cold_1((uint64_t)v4, (id *)(a1 + 32));
      }

      os_signpost_id_t v13 = [*(id *)(a1 + 40) housekeepingQueue];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_77;
      v23 = &unk_1E6BF12B8;
      id v24 = WeakRetained;
      id v25 = *(id *)(a1 + 32);
      dispatch_async(v13, &v20);

      uint64_t v14 = 0;
      char v15 = 0;
    }
    else
    {
      uint64_t v14 = objc_msgSend(WeakRetained, "analysisResultFromMadRequests:imageSize:durations:", *(void *)(a1 + 48), v11, *(double *)(a1 + 64), *(double *)(a1 + 72));
      [v14 setRequest:*(void *)(a1 + 32)];
      objc_msgSend(v14, "setImageSource:", objc_msgSend(*(id *)(a1 + 32), "imageSource"));
      objc_msgSend(v14, "setAnalysisRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
      char v15 = [(VKImageAnalysis *)[VKCImageAnalysis alloc] initWithAnalysisResult:v14];
    }
    uint64_t v16 = [[VKAnalyticsAnalyzerEvent alloc] initWithExecutionDurations:v11 request:*v7 analysis:v15 customIdentifier:0 error:v4];
    if (([*v7 cancelled] & 1) == 0 && v14)
    {
      [v14 setRequest:*v7];
      objc_msgSend(v14, "setImageSource:", objc_msgSend(*v7, "imageSource"));
      v17 = [(VKImageAnalysis *)[VKCImageAnalysis alloc] initWithAnalysisResult:v14];

      uint64_t v18 = [(VKImageAnalysis *)v17 imageAnalysisResult];
      int v19 = [v18 visualSearchResult];
      [v19 setAnalysis:v17];

      char v15 = v17;
    }
    objc_msgSend(WeakRetained, "didFinishRequest:withAnalysis:analyticsEvent:error:", *v7, v15, v16, v4, v20, v21, v22, v23, v24);
  }
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_77(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vkToMadIDs];
  id v2 = [*(id *)(a1 + 40) requestIDValue];
  [v3 removeObjectForKey:v2];
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_79(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) requestQueueProcessing];
  unint64_t v3 = [v2 count];

  if (v3 >= 0xB)
  {
    id v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_79_cold_1(v4);
    }
  }
  v5 = _VKSignpostLog();
  id v6 = _VKSignpostLog();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v5, OS_SIGNPOST_INTERVAL_END, v7, "VisionKit MAD Parse Request", (const char *)&unk_1DB3491BE, buf, 2u);
  }

  uint64_t v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD Parse Request\"", v9, 2u);
  }
}

- (void)handleCompletionForMultiPartRequest:(id)a3 madRequests:(id)a4 callbackQueue:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_alloc_init(VKAnalysisExecutionDurations);
  char v15 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v16 = [v10 processDate];
  [v15 timeIntervalSinceDate:v16];
  double v18 = v17;

  [(VKAnalysisExecutionDurations *)v14 setMadRoundTripAnalysisDuration:v18];
  if (v13)
  {
    int v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VKImageAnalyzerMadInterface handleCompletionForMultiPartRequest:madRequests:callbackQueue:error:]((uint64_t)v13, v10);
    }

    uint64_t v20 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke;
    block[3] = &unk_1E6BF12B8;
    void block[4] = self;
    id v54 = v10;
    id v21 = v10;
    dispatch_async(v20, block);
  }
  else
  {
    v37 = [v10 inProcessAnalysis];
    v22 = [v10 inProcessAnalysis];
    v36 = [v22 imageAnalysisResult];

    id v35 = [(VKImageAnalyzerMadInterface *)self documentObservationFromRequests:v11 durations:v14];
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    char v52 = 0;
    id v24 = [(VKImageAnalyzerMadInterface *)self mrcDDElementsFromRequests:v11 didParse:&v52 durations:v14];
    if (v52)
    {
      id v25 = [MEMORY[0x1E4F1C9C8] now];
      [v25 timeIntervalSinceDate:v23];
      -[VKAnalysisExecutionDurations setMrcParseDuration:](v14, "setMrcParseDuration:");
    }
    else
    {
      [(VKAnalysisExecutionDurations *)v14 setMrcParseDuration:0.0];
    }
    id v38 = (void *)v23;
    id v39 = v11;
    id v26 = [(VKImageAnalyzerMadInterface *)self visualSearchResultFromRequests:v11 durations:v14];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0x4000000000000000;
    dispatch_time_t when = dispatch_time(0, 2000000000);
    v27 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_2;
    v40[3] = &unk_1E6BF2E70;
    id v41 = v35;
    id v42 = v12;
    id v43 = v10;
    id v44 = v37;
    id v45 = v36;
    id v49 = 0;
    v50 = v51;
    uint64_t v46 = self;
    id v47 = v24;
    id v48 = v26;
    id v28 = v10;
    id v29 = v26;
    id v30 = v24;
    id v21 = v36;
    id v31 = v12;
    id v32 = v37;
    id v33 = v35;
    dispatch_after(when, v27, v40);

    id v12 = v31;
    _Block_object_dispose(v51, 8);

    id v11 = v39;
  }
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vkToMadIDs];
  id v2 = [*(id *)(a1 + 40) requestIDValue];
  [v3 removeObjectForKey:v2];
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_3;
    block[3] = &unk_1E6BF2DF8;
    id v2 = *(NSObject **)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    id v22 = *(id *)(a1 + 32);
    dispatch_sync(v2, block);
  }
  objc_initWeak(&location, *(id *)(a1 + 72));
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) * 1000000000.0));
  id v4 = [*(id *)(a1 + 72) housekeepingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_5;
  v7[3] = &unk_1E6BF2E48;
  objc_copyWeak(&v16, &location);
  id v8 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 104);
  id v12 = v5;
  uint64_t v15 = v6;
  id v13 = *(id *)(a1 + 88);
  id v14 = *(id *)(a1 + 96);
  dispatch_after(v3, v4, v7);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateHandler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_4;
  v4[3] = &unk_1E6BF12B8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  ((void (**)(void, uint64_t, uint64_t, void *))v2)[2](v2, v3, 1, v4);
}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVNDocumentObservation:*(void *)(a1 + 40)];
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_5(uint64_t a1)
{
  id v2 = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && (vk_isSeedBuild() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_6;
      block[3] = &unk_1E6BF2DF8;
      id v4 = *(NSObject **)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      id v18 = *(id *)(a1 + 56);
      id v19 = *(id *)(a1 + 64);
      id v20 = *(id *)(a1 + 32);
      dispatch_sync(v4, block);
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    }
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) * 1000000000.0));
    id v6 = [WeakRetained housekeepingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_8;
    v7[3] = &unk_1E6BF2E20;
    objc_copyWeak(&v15, v2);
    id v8 = *(id *)(a1 + 72);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = WeakRetained;
    id v14 = *(id *)(a1 + 80);
    dispatch_after(v5, v6, v7);

    objc_destroyWeak(&v15);
  }
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateHandler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_7;
  v4[3] = &unk_1E6BF12B8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  ((void (**)(void, uint64_t, uint64_t, void *))v2)[2](v2, v3, 4, v4);
}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMRCDataDetectors:*(void *)(a1 + 40)];
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = MEMORY[0x1E4F143A8];
      uint64_t v5 = 3221225472;
      id v6 = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_9;
      os_signpost_id_t v7 = &unk_1E6BF2DF8;
      uint64_t v3 = *(NSObject **)(a1 + 40);
      id v8 = *(id *)(a1 + 48);
      id v9 = *(id *)(a1 + 56);
      id v10 = *(id *)(a1 + 64);
      id v11 = *(id *)(a1 + 32);
      dispatch_sync(v3, &v4);
    }
    objc_msgSend(*(id *)(a1 + 72), "didFinishRequest:withAnalysis:analyticsEvent:error:", *(void *)(a1 + 48), *(void *)(a1 + 56), 0, *(void *)(a1 + 80), v4, v5, v6, v7);
  }
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateHandler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_10;
  v4[3] = &unk_1E6BF1268;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  ((void (**)(void, uint64_t, uint64_t, void *))v2)[2](v2, v3, 16, v4);
}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setRequest:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "setImageSource:", objc_msgSend(*(id *)(a1 + 40), "imageSource"));
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setVisualSearchResult:v2];
}

- (void)performMADRequest:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[VKCInternalSettings isCGImageForMadEnabled];
  objc_initWeak(&location, self);
  id v12 = [(VKImageAnalyzerMadInterface *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke;
  block[3] = &unk_1E6BF2EC0;
  BOOL v22 = v11;
  id v17 = v9;
  id v18 = self;
  id v13 = v9;
  objc_copyWeak(&v21, &location);
  id v19 = v8;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v12, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch([*(id *)(a1 + 32) requestType])
  {
    case 0:
      uint64_t v4 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 72))
      {
        id v5 = [v4 image];
        uint64_t v2 = objc_msgSend(v5, "vk_cgImageGeneratingIfNecessary");

        CGImageRetain((CGImageRef)v2);
        uint64_t v3 = 0;
      }
      else
      {
        uint64_t v3 = [v4 tempPixelBufferRef];
        uint64_t v2 = 0;
      }
      if (!(v2 | v3))
      {
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(cgImage != ((void *)0) || pixelBuffer != ((void *)0))", "-[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:]_block_invoke", 0, 0, @"Unable to create pixel buffer or CGImage from image for request: %@", *(void *)(a1 + 40));
        uint64_t v2 = 0;
        goto LABEL_15;
      }
      break;
    case 1:
      id v6 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 72)) {
        goto LABEL_8;
      }
      uint64_t v7 = [v6 tempPixelBufferRef];
      goto LABEL_10;
    case 3:
      uint64_t v3 = [*(id *)(a1 + 32) pixelBuffer];
      CVPixelBufferRetain((CVPixelBufferRef)v3);
      goto LABEL_11;
    case 6:
      id v6 = *(void **)(a1 + 32);
LABEL_8:
      uint64_t v2 = [v6 cgImageRef];
      CGImageRetain((CGImageRef)v2);
LABEL_15:
      uint64_t v3 = 0;
      break;
    case 7:
      uint64_t v7 = [*(id *)(a1 + 32) pixelBuffer];
LABEL_10:
      uint64_t v3 = v7;
LABEL_11:
      uint64_t v2 = 0;
      break;
    default:
      break;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained housekeepingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke_2;
    block[3] = &unk_1E6BF2E98;
    objc_copyWeak(v17, (id *)(a1 + 64));
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    v17[1] = (id)v3;
    v17[2] = (id)v2;
    char v18 = *(unsigned char *)(a1 + 72);
    id v16 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

    objc_destroyWeak(v17);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = +[VKImageAnalyzerMadInterface analyzerDeallocedError];
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 0xFFFFFFFFLL, v12);

    CVPixelBufferRelease((CVPixelBufferRef)v3);
    CGImageRelease((CGImageRef)v2);
  }
}

void __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = +[VKImageAnalyzerMadInterface analyzerDeallocedError];
    (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 0xFFFFFFFFLL, v16);

    goto LABEL_10;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  char v4 = [v3 cancelled];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
LABEL_9:
    [WeakRetained removeAndNotifyOfCancelledRequest:v5 completion:*(void *)(a1 + 48)];
    goto LABEL_10;
  }
  uint64_t v6 = [WeakRetained _performMADRequest:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 32) pixelBuffer:*(void *)(a1 + 64) cgImage:*(void *)(a1 + 72) useCGForMad:*(unsigned __int8 *)(a1 + 80) withCompletion:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setMadRequestID:v6];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setProcessDate:v7];

  id v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [*(id *)(a1 + 32) requestID];
    v17[0] = 67109376;
    v17[1] = v6;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "Assigned madId: %d to vkId: %d", (uint8_t *)v17, 0xEu);
  }

  id v10 = [NSNumber numberWithInt:v6];
  uint64_t v11 = [WeakRetained vkToMadIDs];
  id v12 = [*(id *)(a1 + 32) requestIDValue];
  [v11 setObject:v10 forKeyedSubscript:v12];

  id v13 = [WeakRetained requestQueueProcessing];
  id v14 = [*(id *)(a1 + 32) requestIDValue];
  [v13 addObject:v14];

  [WeakRetained logCollectionsIfNecessary];
LABEL_10:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
  CGImageRelease(*(CGImageRef *)(a1 + 72));
}

- (int)_performMADRequest:(id)a3 forRequest:(id)a4 pixelBuffer:(__CVBuffer *)a5 cgImage:(CGImage *)a6 useCGForMad:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = [(VKImageAnalyzerMadInterface *)self service];
  __int16 v18 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  dispatch_assert_queue_V2(v18);

  uint64_t v19 = vk_cgImagePropertyOrientationFromVKOrientation([v15 imageOrientation]);
  switch([v15 requestType])
  {
    case 0:
    case 1:
      if (!v9) {
        goto LABEL_4;
      }
      int v20 = [v17 performRequests:v14 onCGImage:a6 withOrientation:v19 andIdentifier:0 completionHandler:v16];
      goto LABEL_5;
    case 2:
      BOOL v22 = [v15 ciImage];
      int v23 = [v17 performRequests:v14 onCIImage:v22 withOrientation:v19 andIdentifier:0 completionHandler:v16];
      goto LABEL_9;
    case 3:
LABEL_4:
      int v20 = [v17 performRequests:v14 onPixelBuffer:a5 withOrientation:v19 andIdentifier:0 completionHandler:v16];
LABEL_5:
      int v21 = v20;
      break;
    case 4:
      BOOL v22 = [v15 URL];
      int v23 = [v17 performRequests:v14 onImageURL:v22 withIdentifier:0 completionHandler:v16];
LABEL_9:
      int v21 = v23;
      goto LABEL_13;
    case 5:
      BOOL v22 = [v15 localIdentifier];
      id v24 = [v15 URL];
      int v21 = [v17 performRequests:v14 onAssetWithLocalIdentifier:v22 fromPhotoLibraryWithURL:v24 completionHandler:v16];

      goto LABEL_13;
    case 6:
      id v25 = [v15 localIdentifier];
      id v26 = [v15 URL];
      int v21 = [v17 performRequests:v14 onCGImage:a6 withOrientation:v19 assetLocalIdentifier:v25 photoLibraryURL:v26 completionHandler:v16];

      break;
    case 7:
      BOOL v22 = [v15 localIdentifier];
      v27 = [v15 URL];
      int v21 = [v17 performRequests:v14 onPixelBuffer:a5 withOrientation:v19 assetLocalIdentifier:v22 photoLibraryURL:v27 completionHandler:v16];

LABEL_13:
      break;
    default:
      int v21 = 0;
      break;
  }
  id v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = [v15 shortLoggingDescription];
    int v31 = 138412290;
    id v32 = v29;
    _os_log_impl(&dword_1DB266000, v28, OS_LOG_TYPE_INFO, "Request Submitted to MAD: %@", (uint8_t *)&v31, 0xCu);
  }
  [(VKImageAnalyzerMadInterface *)self logCollectionsIfNecessary];

  return v21;
}

- (id)analysisResultFromMadRequests:(id)a3 imageSize:(CGSize)a4 durations:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(VKImageAnalyzerMadInterface *)self documentObservationFromRequests:v9 durations:v10];
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  char v19 = 0;
  id v13 = [(VKImageAnalyzerMadInterface *)self mrcDDElementsFromRequests:v9 didParse:&v19 durations:v10];
  if (v19)
  {
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    objc_msgSend(v10, "setMrcParseDuration:");
  }
  else
  {
    [v10 setMrcParseDuration:0.0];
  }
  id v15 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v11, v13, width, height);
  id v16 = [(VKImageAnalyzerMadInterface *)self visualSearchResultFromRequests:v9 durations:v10];
  [(VKCImageAnalysisResult *)v15 setVisualSearchResult:v16];
  id v17 = [(VKImageAnalyzerMadInterface *)self rectangleObservationsFromRequests:v9 durations:v10];
  [(VKCTextRecognitionResult *)v15 setRectangleObservations:v17];

  return v15;
}

- (id)documentObservationFromRequests:(id)a3 durations:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_88);
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [v6 results];
    id v9 = [v8 firstObject];
    id v10 = VKCheckedDynamicCast(v7, (uint64_t)v9);

    if (v10)
    {
      uint64_t v11 = [v10 observations];
      id v12 = [v11 firstObject];

      [v10 executionTimeInterval];
      objc_msgSend(v5, "setMadDocumentDuration:");
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

uint64_t __73__VKImageAnalyzerMadInterface_documentObservationFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)rectangleObservationsFromRequests:(id)a3 durations:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_92);
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [v6 results];
    id v9 = [v8 firstObject];
    id v10 = VKDynamicCast(v7, (uint64_t)v9);

    uint64_t v11 = [v10 observations];
    [v10 executionTimeInterval];
    objc_msgSend(v5, "setMadRectangleDuration:");
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __75__VKImageAnalyzerMadInterface_rectangleObservationsFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)visualSearchResultFromRequests:(id)a3 durations:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_96);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 error];

    if (v8)
    {
      id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VKImageAnalyzerMadInterface visualSearchResultFromRequests:durations:](v7, v9);
      }
    }
    else
    {
      id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "VSGating Request completed: %@", (uint8_t *)&v14, 0xCu);
      }
    }

    uint64_t v11 = [v7 results];
    id v12 = [v11 firstObject];
    id v10 = [[VKCVisualSearchResult alloc] initWithGatingResult:v12];
    [v12 executionTimeInterval];
    objc_msgSend(v5, "setMadVisualSearchDuration:");
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __72__VKImageAnalyzerMadInterface_visualSearchResultFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)mrcDDElementsFromRequests:(id)a3 didParse:(BOOL *)a4 durations:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v10 = objc_msgSend(v7, "vk_objectPassingTest:", &__block_literal_global_101);
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = [v10 results];
    id v13 = [v12 firstObject];
    int v14 = VKCheckedDynamicCast(v11, (uint64_t)v13);

    if (v14)
    {
      id v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v14 observations];
        uint64_t v17 = [v16 count];
        *(_DWORD *)id buf = 134217984;
        uint64_t v33 = v17;
        _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing with %lu elements", buf, 0xCu);
      }
      [v14 executionTimeInterval];
      objc_msgSend(v8, "setMadMRCDuration:");
      __int16 v18 = [v14 observations];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke_104;
      v27[3] = &unk_1E6BF2F08;
      v27[4] = &v28;
      char v19 = objc_msgSend(v18, "vk_compactMap:", v27);
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }
  int v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v19 count];
    BOOL v22 = [MEMORY[0x1E4F1C9C8] date];
    [v22 timeIntervalSinceDate:v9];
    *(_DWORD *)id buf = 134218240;
    uint64_t v33 = v21;
    __int16 v34 = 2048;
    uint64_t v35 = v23;
    _os_log_impl(&dword_1DB266000, v20, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of %lu elements in %f seconds.", buf, 0x16u);
  }
  id v24 = (void *)MEMORY[0x1E4F1CBF0];
  if (v19) {
    id v24 = v19;
  }
  id v25 = v24;

  *a4 = *((unsigned char *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return v25;
}

uint64_t __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke_104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:a2 loggingIndex:a3];
}

- (void)didFinishRequest:(id)a3 withAnalysis:(id)a4 analyticsEvent:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__10;
  v23[4] = __Block_byref_object_dispose__10;
  id v13 = a6;
  id v24 = v13;
  int v14 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__VKImageAnalyzerMadInterface_didFinishRequest_withAnalysis_analyticsEvent_error___block_invoke;
  block[3] = &unk_1E6BF2F30;
  void block[4] = self;
  id v19 = v10;
  id v21 = v12;
  BOOL v22 = v23;
  id v20 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);

  _Block_object_dispose(v23, 8);
}

void __82__VKImageAnalyzerMadInterface_didFinishRequest_withAnalysis_analyticsEvent_error___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) requestQueueCancelling];
  id v2 = [*(id *)(a1 + 40) requestIDValue];
  int v3 = [v8 containsObject:v2];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 40) requestIDValue];
    [v8 removeObject:v4];

    uint64_t v5 = [*(id *)(a1 + 32) cancelledError];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [*(id *)(a1 + 32) clearCompletedRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) request:*(void *)(a1 + 40) didCompleteWithAnalysis:*(void *)(a1 + 48) analysisEvent:*(void *)(a1 + 56) error:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (id)VNRequestHandlerForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = vk_cgImagePropertyOrientationFromVKOrientation([v3 imageOrientation]);
  switch([v3 requestType])
  {
    case 0:
    case 1:
      uint64_t v5 = [v3 image];
      uint64_t v6 = objc_msgSend(v5, "vk_cgImage");

      id v7 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v8 = [v7 initWithCGImage:v6 orientation:v4 options:MEMORY[0x1E4F1CC08]];
      goto LABEL_6;
    case 2:
      id v10 = objc_alloc(MEMORY[0x1E4F45890]);
      id v11 = [v3 ciImage];
      id v9 = (void *)[v10 initWithCIImage:v11 orientation:v4 options:MEMORY[0x1E4F1CC08]];

      break;
    case 3:
      id v12 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v13 = [v3 pixelBuffer];
      uint64_t v8 = [v12 initWithCVPixelBuffer:v13 orientation:v4 options:MEMORY[0x1E4F1CC08]];
LABEL_6:
      id v9 = (void *)v8;
      break;
    case 4:
      id v14 = objc_alloc(MEMORY[0x1E4F45890]);
      id v15 = [v3 URL];
      id v9 = (void *)[v14 initWithURL:v15 options:MEMORY[0x1E4F1CC08]];

      break;
    default:
      id v9 = 0;
      break;
  }

  return v9;
}

- (void)generateVisualSearchResultForRequest:(id)a3 analysis:(id)a4 items:(id)a5 payload:(id)a6 queryID:(unint64_t)a7 completionHandler:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v43 = a8;
  id v17 = (void *)MEMORY[0x1E4F1C9C8];
  id v18 = a6;
  id v44 = [v17 date];
  id v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134218240;
    unint64_t v56 = a7;
    __int16 v57 = 1024;
    int v58 = [v15 analysisRequestID];
    _os_log_impl(&dword_1DB266000, v19, OS_LOG_TYPE_DEFAULT, "VS Request complete began with queryID: %llu, id: %d", buf, 0x12u);
  }

  uint64_t v20 = objc_msgSend(v16, "vk_compactMap:", &__block_literal_global_110);
  if (objc_msgSend(v16, "vk_containsObjectPassingTest:", &__block_literal_global_115))
  {
    id v21 = [v15 imageAnalysisResult];
    BOOL v22 = [v21 sourceVNDocument];

    if (v22)
    {
      id v54 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((vnObservation) != nil)", "-[VKImageAnalyzerMadInterface generateVisualSearchResultForRequest:analysis:items:payload:queryID:completionHandler:]", 0, 0, @"Expected non-nil value for '%s'", "vnObservation");
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v42 = (void *)v20;
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F74740]) initWithGatingResultItems:v20 payload:v18 documentObservations:v23];

  id v25 = [(VKImageAnalyzerMadInterface *)self madSuggestionTypeFromItems:v16];
  unint64_t v45 = a7;
  id v26 = [NSNumber numberWithUnsignedLongLong:a7];
  [v24 setQueryID:v26];

  v27 = NSNumber;
  [v14 screenScale];
  uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
  [v24 setUiScale:v28];

  id v29 = [v14 location];
  [v24 setLocation:v29];

  uint64_t v30 = [v14 imageURL];
  [v24 setImageURL:v30];

  char v31 = [v14 pageURL];
  [v24 setReferralURL:v31];

  id v32 = [v14 viImageType];
  [v24 setImageType:v32];

  [v24 setEngagementSuggestionType:v25];
  uint64_t v33 = _VKSignpostLog();
  __int16 v34 = _VKSignpostLog();
  os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v34, self);

  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VisionKit MAD VisualSearch Request", (const char *)&unk_1DB3491BE, buf, 2u);
  }

  uint64_t v36 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1DB266000, v36, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Request\"", buf, 2u);
  }

  v53 = v24;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_122;
  v46[3] = &unk_1E6BF2F58;
  id v47 = v44;
  id v48 = v15;
  id v49 = v24;
  v50 = self;
  id v51 = v43;
  unint64_t v52 = v45;
  id v38 = v43;
  id v39 = v24;
  id v40 = v15;
  id v41 = v44;
  [(VKImageAnalyzerMadInterface *)self performMADRequest:v37 forRequest:v14 withCompletion:v46];
}

id __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)MEMORY[0x1E4F74730];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 resultItem];
  [v5 normalizedBoundingBox];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v3 domainInfo];

  v18[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v16 = objc_msgSend(v4, "initWithNormalizedBoundingBox:andDomains:", v15, v7, v9, v11, v13);

  return v16;
}

uint64_t __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_2()
{
  return 1;
}

void __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_122(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 timeIntervalSinceNow];
  double v7 = v6;
  double v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 72);
    int v10 = [*(id *)(a1 + 40) analysisRequestID];
    int v17 = 134218496;
    double v18 = -v7;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "VS Request complete with duration: %f, queryID: %llu, id: %d", (uint8_t *)&v17, 0x1Cu);
  }

  double v11 = [*(id *)(a1 + 48) results];
  double v12 = [v11 firstObject];
  double v13 = _VKSignpostLog();
  id v14 = _VKSignpostLog();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 56));

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v13, OS_SIGNPOST_INTERVAL_END, v15, "VisionKit MAD VisualSearch Request", (const char *)&unk_1DB3491BE, (uint8_t *)&v17, 2u);
  }

  id v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1DB266000, v16, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Request\"", (uint8_t *)&v17, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)generateTextualVisualSearchResultForAnalysis:(id)a3 queryInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a4;
  id v40 = [v10 date];
  double v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v49 = [v8 analysisRequestID];
    _os_log_impl(&dword_1DB266000, v12, OS_LOG_TYPE_DEFAULT, "VisualSearch Text Request begin, id: %d", buf, 8u);
  }

  double v13 = [v8 imageAnalysisResult];
  id v14 = [v13 request];

  id v15 = objc_alloc(MEMORY[0x1E4F746F8]);
  id v16 = [v11 queryString];
  int v17 = (void *)[v15 initWithQueryTerm:v16];

  double v18 = [v8 imageAnalysisResult];
  __int16 v19 = [v18 text];
  [v17 setSurroundingText:v19];

  uint64_t v20 = [v8 imageAnalysisResult];
  __int16 v21 = [v20 allLineQuads];
  int v22 = objc_msgSend(v21, "vk_compactMap:", &__block_literal_global_127);

  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v17 setNormalizedBoundingBoxes:v23];
  id v24 = NSNumber;
  uint64_t v25 = [v11 queryID];

  id v26 = [v24 numberWithInteger:v25];
  [v17 setQueryID:v26];

  v27 = NSNumber;
  [v14 screenScale];
  uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
  [v17 setUiScale:v28];

  id v29 = _VKSignpostLog();
  uint64_t v30 = _VKSignpostLog();
  os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, self);

  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VisionKit MAD VisualSearch Text Request", (const char *)&unk_1DB3491BE, buf, 2u);
  }

  id v32 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1DB266000, v32, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Text Request\"", buf, 2u);
  }

  id v47 = v17;
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  __int16 v34 = [v8 imageAnalysisResult];
  os_signpost_id_t v35 = [v34 request];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke_129;
  v41[3] = &unk_1E6BF2F80;
  id v42 = v40;
  id v43 = v8;
  id v44 = v17;
  unint64_t v45 = self;
  id v46 = v9;
  id v36 = v9;
  id v37 = v17;
  id v38 = v8;
  id v39 = v40;
  [(VKImageAnalyzerMadInterface *)self performMADRequest:v33 forRequest:v35 withCompletion:v41];
}

uint64_t __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  [a2 boundingBox];
  return objc_msgSend(v2, "vk_valueWithRect:");
}

void __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke_129(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  uint64_t v7 = v6;
  id v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = [*(id *)(a1 + 40) analysisRequestID];
      id v11 = [v5 localizedDescription];
      int v21 = 134218754;
      uint64_t v22 = v7;
      __int16 v23 = 1024;
      int v24 = a2;
      __int16 v25 = 1024;
      int v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      _os_log_error_impl(&dword_1DB266000, v9, OS_LOG_TYPE_ERROR, "VisualSearch Text Request completed: duration: %f, requestID %d, id: %d, error %@", (uint8_t *)&v21, 0x22u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [*(id *)(a1 + 40) analysisRequestID];
    int v21 = 134218496;
    uint64_t v22 = v7;
    __int16 v23 = 1024;
    int v24 = a2;
    __int16 v25 = 1024;
    int v26 = v12;
    _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "VisualSearch Text Request completed: duration: %f, requestID %d, id: %d", (uint8_t *)&v21, 0x18u);
  }

  double v13 = [*(id *)(a1 + 48) results];
  uint64_t v14 = objc_opt_class();
  id v15 = [v13 firstObject];
  id v16 = VKDynamicCast(v14, (uint64_t)v15);

  int v17 = _VKSignpostLog();
  double v18 = _VKSignpostLog();
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 56));

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v17, OS_SIGNPOST_INTERVAL_END, v19, "VisionKit MAD VisualSearch Text Request", (const char *)&unk_1DB3491BE, (uint8_t *)&v21, 2u);
  }

  uint64_t v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1DB266000, v20, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Text Request\"", (uint8_t *)&v21, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)submitVisualIntelligenceUserFeedbackForRequest:(id)a3 reportIdentifier:(id)a4 userFeedbackPayload:(id)a5 sfReportData:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = (objc_class *)MEMORY[0x1E4F74708];
  id v13 = a6;
  id v14 = a5;
  id v15 = (void *)[[v12 alloc] initWithUserFeedbackPayload:v14 sfReportData:v13 reportIdentifier:v11];

  v22[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __128__VKImageAnalyzerMadInterface_submitVisualIntelligenceUserFeedbackForRequest_reportIdentifier_userFeedbackPayload_sfReportData___block_invoke;
  v19[3] = &unk_1E6BF2FA8;
  id v20 = v11;
  id v21 = v10;
  id v17 = v10;
  id v18 = v11;
  [(VKImageAnalyzerMadInterface *)self performMADRequest:v16 forRequest:v17 withCompletion:v19];
}

void __128__VKImageAnalyzerMadInterface_submitVisualIntelligenceUserFeedbackForRequest_reportIdentifier_userFeedbackPayload_sfReportData___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) requestID];
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "VisualIntelligence VisualSearch submit user report completed: %@, id: %d ", (uint8_t *)&v5, 0x12u);
  }
}

- (void)didShowVisualSearchHintsForRequest:(id)a3 invocationType:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(VKImageAnalyzerMadInterface *)self sfViewAppearEventFromInvocationType:a4 request:v6];
  int v8 = [(VKImageAnalyzerMadInterface *)self service];
  objc_msgSend(v8, "startEntryPointWithQueryID:andEvent:", objc_msgSend(v6, "queryID"), v7);

  uint64_t v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = VKMUIStringForVKCVSInvocationType(a4);
    int v11 = 138412546;
    int v12 = v10;
    __int16 v13 = 1024;
    int v14 = [v6 requestID];
    _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_INFO, "DidShowVisualSearchHints with invocationType: %@, id: %d", (uint8_t *)&v11, 0x12u);
  }
}

- (void)didShowVisualSearchCachedResultsForQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 item:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v18[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v10 = [(VKImageAnalyzerMadInterface *)self madSuggestionTypeFromItems:v9];

  int v11 = [(VKImageAnalyzerMadInterface *)self service];
  [v11 cacheHitWithQueryID:a3 cachedResultQueryID:a4 engagementSuggestionType:v10];

  int v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = [v8 analysis];
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = [v13 analysisRequestID];
    _os_log_impl(&dword_1DB266000, v12, OS_LOG_TYPE_INFO, "didShowVisualSearchCachedResultsForQueryID suggestionType: %@, id: %d", (uint8_t *)&v14, 0x12u);
  }
}

- (void)didLeaveVisualSearchHints
{
  id v2 = [(VKImageAnalyzerMadInterface *)self service];
  [v2 endEntryPoint];
}

- (void)createNewIdleTimerIfNecessary
{
  if (![(VKImageAnalyzerMadInterface *)self hasAnyRequests])
  {
    uint64_t v3 = (void *)([(VKImageAnalyzerMadInterface *)self timeoutIndex] + 1);
    [(VKImageAnalyzerMadInterface *)self setTimeoutIndex:v3];
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 60000000000);
    int v5 = [(VKImageAnalyzerMadInterface *)self housekeepingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__VKImageAnalyzerMadInterface_createNewIdleTimerIfNecessary__block_invoke;
    block[3] = &unk_1E6BF21B8;
    objc_copyWeak(v7, &location);
    v7[1] = v3;
    dispatch_after(v4, v5, block);

    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __60__VKImageAnalyzerMadInterface_createNewIdleTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && [WeakRetained timeoutIndex] == *(void *)(a1 + 40))
  {
    dispatch_time_t v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      uint64_t v6 = 0x404E000000000000;
      _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_INFO, "Releasing MADService after timeout: %f", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "set_serviceDontUseThisOneDirectly:", 0);
  }
}

- (id)madSuggestionTypeFromItems:(id)a3
{
  uint64_t v3 = [a3 firstObject];
  uint64_t v4 = [v3 currentInvocationType];

  int v5 = 0;
  switch(v4)
  {
    case 1:
      uint64_t v6 = (id *)MEMORY[0x1E4F745A0];
      goto LABEL_6;
    case 2:
      int v5 = @"highlightedSubject";
      break;
    case 4:
      int v5 = @"automatic";
      break;
    case 5:
      uint64_t v6 = (id *)MEMORY[0x1E4F745A8];
LABEL_6:
      int v5 = (__CFString *)*v6;
      break;
    default:
      break;
  }
  return v5;
}

- (unint64_t)sfViewAppearEventFromInvocationType:(int64_t)a3 request:(id)a4
{
  uint64_t v5 = [a4 imageSource];
  switch(a3)
  {
    case 1:
    case 4:
      if (v5 == 2) {
        unint64_t result = 31;
      }
      else {
        unint64_t result = 34;
      }
      break;
    case 2:
      if (v5 == 2) {
        unint64_t result = 33;
      }
      else {
        unint64_t result = 32;
      }
      break;
    case 3:
      unint64_t result = 28;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (OS_dispatch_queue)housekeepingQueue
{
  return self->_housekeepingQueue;
}

- (void)setHousekeepingQueue:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (NSMutableOrderedSet)requestQueueProcessing
{
  return self->_requestQueueProcessing;
}

- (void)setRequestQueueProcessing:(id)a3
{
}

- (NSMutableSet)requestQueueCancelling
{
  return self->_requestQueueCancelling;
}

- (void)setRequestQueueCancelling:(id)a3
{
}

- (void)setVkToMadIDs:(id)a3
{
}

- (NSMutableDictionary)idsToRequests
{
  return self->_idsToRequests;
}

- (void)setIdsToRequests:(id)a3
{
}

- (int)requestIDIndex
{
  return self->_requestIDIndex;
}

- (void)setRequestIDIndex:(int)a3
{
  self->_requestIDIndex = a3;
}

- (MADService)_serviceDontUseThisOneDirectly
{
  return self->__serviceDontUseThisOneDirectly;
}

- (void)set_serviceDontUseThisOneDirectly:(id)a3
{
}

- (unint64_t)timeoutIndex
{
  return self->_timeoutIndex;
}

- (void)setTimeoutIndex:(unint64_t)a3
{
  self->_timeoutIndex = a3;
}

- (MADService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
  objc_storeStrong((id *)&self->__serviceDontUseThisOneDirectly, 0);
  objc_storeStrong((id *)&self->_idsToRequests, 0);
  objc_storeStrong((id *)&self->_vkToMadIDs, 0);
  objc_storeStrong((id *)&self->_requestQueueCancelling, 0);
  objc_storeStrong((id *)&self->_requestQueueProcessing, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_housekeepingQueue, 0);
}

- (void)clearCompletedRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Trying to clear nil completed requestID for request: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_processRequest:(NSObject *)a3 callbackQueue:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 requestID];
  uint64_t v7 = [a1 shortLoggingDescription];
  v8[0] = 67109634;
  v8[1] = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  int v12 = v7;
  _os_log_error_impl(&dword_1DB266000, a3, OS_LOG_TYPE_ERROR, "Error processing id: %d from MAD on result: %@ request: %@", (uint8_t *)v8, 0x1Cu);
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  id v8 = [*a2 shortLoggingDescription];
  OUTLINED_FUNCTION_0_2(&dword_1DB266000, v2, v3, "Error processing request from MAD on result: %@ request: %@", v4, v5, v6, v7, 2u);
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_79_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB266000, log, OS_LOG_TYPE_FAULT, "There are more than 10 requests in the processing queue. VisionKit clients should cancel requests if the image is no longer present", v1, 2u);
}

- (void)handleCompletionForMultiPartRequest:(uint64_t)a1 madRequests:(void *)a2 callbackQueue:error:.cold.1(uint64_t a1, void *a2)
{
  id v8 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_0_2(&dword_1DB266000, v2, v3, "Error processing request from MAD on result: %@ request: %@", v4, v5, v6, v7, 2u);
}

- (void)visualSearchResultFromRequests:(void *)a1 durations:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "VSGating: Could not get visual search result from MADService with %@", (uint8_t *)&v4, 0xCu);
}

@end