@interface VKImageAnalyzerInProcessMadInterface
+ (id)sharedInterface;
- (NSMutableDictionary)idsToRequests;
- (NSMutableOrderedSet)tempMadRequestQueueProcessing;
- (NSMutableOrderedSet)tempMadRequestQueueWaiting;
- (NSMutableSet)tempMadRequestQueueCancelling;
- (NSString)errorDomain;
- (OS_dispatch_queue)housekeepingQueue;
- (OS_dispatch_queue)tempMadProcessingQueue;
- (VKImageAnalyzerInProcessMadInterface)init;
- (id)cancelledError;
- (id)mrcElementsFromImage:(CGImage *)a3 symbologies:(id)a4;
- (int)nextRequestID;
- (int)processRequest:(id)a3;
- (int)queueRequestID;
- (unint64_t)_statusForRequestID:(int)a3;
- (unint64_t)statusForRequestID:(int)a3;
- (void)_cancelRequest:(id)a3;
- (void)_processRequest:(id)a3;
- (void)addRequestForProcessing:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequestID:(int)a3;
- (void)clearCompletedRequest:(id)a3;
- (void)didFinishRequest:(id)a3 withAnalysisResult:(id)a4 error:(id)a5;
- (void)processNextItemIfNecessary;
- (void)removeAndNotifyOfCancelledRequest:(id)a3;
- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 error:(id)a5;
- (void)setHousekeepingQueue:(id)a3;
- (void)setIdsToRequests:(id)a3;
- (void)setQueueRequestID:(int)a3;
- (void)setTempMadProcessingQueue:(id)a3;
- (void)setTempMadRequestQueueCancelling:(id)a3;
- (void)setTempMadRequestQueueProcessing:(id)a3;
- (void)setTempMadRequestQueueWaiting:(id)a3;
@end

@implementation VKImageAnalyzerInProcessMadInterface

+ (id)sharedInterface
{
  if (sharedInterface_onceToken_0 != -1) {
    dispatch_once(&sharedInterface_onceToken_0, &__block_literal_global_36);
  }
  v2 = (void *)sharedInterface_sInterface_0;
  return v2;
}

void __55__VKImageAnalyzerInProcessMadInterface_sharedInterface__block_invoke()
{
  v0 = objc_alloc_init(VKImageAnalyzerInProcessMadInterface);
  v1 = (void *)sharedInterface_sInterface_0;
  sharedInterface_sInterface_0 = (uint64_t)v0;
}

- (VKImageAnalyzerInProcessMadInterface)init
{
  v16.receiver = self;
  v16.super_class = (Class)VKImageAnalyzerInProcessMadInterface;
  v2 = [(VKImageAnalyzerMadInterface *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VKImageAnalyzer", 0);
    housekeepingQueue = v2->_housekeepingQueue;
    v2->_housekeepingQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("tempMADProcessingQueue", 0);
    tempMadProcessingQueue = v2->_tempMadProcessingQueue;
    v2->_tempMadProcessingQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    tempMadRequestQueueWaiting = v2->_tempMadRequestQueueWaiting;
    v2->_tempMadRequestQueueWaiting = v7;

    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    tempMadRequestQueueProcessing = v2->_tempMadRequestQueueProcessing;
    v2->_tempMadRequestQueueProcessing = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    tempMadRequestQueueCancelling = v2->_tempMadRequestQueueCancelling;
    v2->_tempMadRequestQueueCancelling = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    idsToRequests = v2->_idsToRequests;
    v2->_idsToRequests = v13;
  }
  return v2;
}

- (NSString)errorDomain
{
  return (NSString *)@"com.apple.VisionKit.ImageAnalyzer";
}

- (int)processRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(VKImageAnalyzerInProcessMadInterface *)self nextRequestID];
  v6 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VKImageAnalyzerInProcessMadInterface_processRequest___block_invoke;
  block[3] = &unk_1E6BF3DB0;
  int v12 = v5;
  id v10 = v4;
  v11 = self;
  id v7 = v4;
  dispatch_async(v6, block);

  return v5;
}

uint64_t __55__VKImageAnalyzerInProcessMadInterface_processRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRequestID:*(unsigned int *)(a1 + 48)];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setProcessDate:v2];

  dispatch_queue_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 1024;
    int v9 = [v4 requestID];
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Queuing request: %@  requestID: %d", (uint8_t *)&v6, 0x12u);
  }

  return [*(id *)(a1 + 40) addRequestForProcessing:*(void *)(a1 + 32)];
}

- (int)nextRequestID
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  dispatch_queue_t v3 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VKImageAnalyzerInProcessMadInterface_nextRequestID__block_invoke;
  v5[3] = &unk_1E6BF3DD8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __53__VKImageAnalyzerInProcessMadInterface_nextRequestID__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 88);
  if (!v2)
  {
    *(_DWORD *)(v1 + 88) = 1;
    uint64_t v1 = *(void *)(result + 32);
    int v2 = *(_DWORD *)(v1 + 88);
  }
  *(_DWORD *)(v1 + 88) = v2 + 1;
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)processNextItemIfNecessary
{
  dispatch_queue_t v3 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueProcessing];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    int v5 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [(VKImageAnalyzerInProcessMadInterface *)self idsToRequests];
      uint64_t v8 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
      int v9 = [v8 firstObject];
      id v11 = [v7 objectForKeyedSubscript:v9];

      id v10 = v11;
      if (!v11)
      {
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((request) != nil)", "-[VKImageAnalyzerInProcessMadInterface processNextItemIfNecessary]", 0, 0, @"Expected non-nil value for '%s'", "request");
        id v10 = 0;
      }
      [(VKImageAnalyzerInProcessMadInterface *)self _processRequest:v10];
    }
  }
}

- (unint64_t)statusForRequestID:(int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 3;
  int v5 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VKImageAnalyzerInProcessMadInterface_statusForRequestID___block_invoke;
  block[3] = &unk_1E6BF2CE0;
  void block[4] = self;
  block[5] = &v10;
  int v9 = a3;
  dispatch_sync(v5, block);

  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __59__VKImageAnalyzerInProcessMadInterface_statusForRequestID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _statusForRequestID:*(unsigned int *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancelRequestID:(int)a3
{
  int v5 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__VKImageAnalyzerInProcessMadInterface_cancelRequestID___block_invoke;
  v6[3] = &unk_1E6BF2D08;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __56__VKImageAnalyzerInProcessMadInterface_cancelRequestID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) idsToRequests];
  dispatch_queue_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  id v5 = [v2 objectForKeyedSubscript:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) _cancelRequest:v5];
    uint64_t v4 = v5;
  }
}

- (void)cancelAllRequests
{
  dispatch_queue_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all requests", buf, 2u);
  }

  uint64_t v4 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6BF0D18;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) tempMadRequestQueueWaiting];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_2;
  v5[3] = &unk_1E6BF2D30;
  v5[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v5];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) tempMadRequestQueueProcessing];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_3;
  v4[3] = &unk_1E6BF2D30;
  v4[4] = *(void *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntValue];
  return [v2 cancelRequestID:v3];
}

uint64_t __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntValue];
  return [v2 cancelRequestID:v3];
}

- (void)_cancelRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setCancelled:1];
  unint64_t v5 = -[VKImageAnalyzerInProcessMadInterface _statusForRequestID:](self, "_statusForRequestID:", [v4 requestID]);
  unint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling Request: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    if (v5 == 1)
    {
      [v4 setCancelled:1];
      [(VKImageAnalyzerInProcessMadInterface *)self removeAndNotifyOfCancelledRequest:v4];
    }
  }
  else
  {
    int v7 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueCancelling];
    uint64_t v8 = [v4 requestIDValue];
    [v7 addObject:v8];
  }
}

- (void)removeAndNotifyOfCancelledRequest:(id)a3
{
  id v7 = a3;
  [(VKImageAnalyzerInProcessMadInterface *)self clearCompletedRequest:v7];
  id v4 = [v7 completionHandler];

  if (v4)
  {
    unint64_t v5 = [v7 completionHandler];
    unint64_t v6 = [(VKImageAnalyzerInProcessMadInterface *)self cancelledError];
    ((void (**)(void, void, void, void *))v5)[2](v5, 0, 0, v6);
  }
}

- (unint64_t)_statusForRequestID:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  unint64_t v5 = [(VKImageAnalyzerInProcessMadInterface *)self idsToRequests];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueProcessing];
    char v8 = [v7 containsObject:v4];

    if (v8)
    {
      unint64_t v9 = 0;
    }
    else
    {
      id v10 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
      char v11 = [v10 containsObject:v4];

      if (v11)
      {
        unint64_t v9 = 1;
      }
      else
      {
        uint64_t v12 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueCancelling];
        int v13 = [v12 containsObject:v4];

        if (v13) {
          unint64_t v9 = 2;
        }
        else {
          unint64_t v9 = 3;
        }
      }
    }
  }
  else
  {
    unint64_t v9 = 3;
  }

  return v9;
}

- (void)clearCompletedRequest:(id)a3
{
  id v11 = [a3 requestIDValue];
  id v4 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueProcessing];
  [v4 containsObject:v11];

  unint64_t v5 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
  [v5 containsObject:v11];

  unint64_t v6 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueCancelling];
  [v6 containsObject:v11];

  id v7 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueProcessing];
  [v7 removeObject:v11];

  char v8 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueCancelling];
  [v8 removeObject:v11];

  unint64_t v9 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
  [v9 removeObject:v11];

  id v10 = [(VKImageAnalyzerInProcessMadInterface *)self idsToRequests];
  [v10 removeObjectForKey:v11];
}

- (id)cancelledError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = [(VKImageAnalyzerInProcessMadInterface *)self errorDomain];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Request Cancelled";
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unint64_t v6 = (void *)[v3 initWithDomain:v4 code:-2 userInfo:v5];

  return v6;
}

- (void)addRequestForProcessing:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VKImageAnalyzerInProcessMadInterface *)self idsToRequests];
  unint64_t v6 = [v4 requestIDValue];
  [v5 setObject:v4 forKeyedSubscript:v6];

  id v7 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
  uint64_t v8 = [v4 requestIDValue];

  [v7 addObject:v8];
  [(VKImageAnalyzerInProcessMadInterface *)self processNextItemIfNecessary];
}

- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v8;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "Request completed: %@", (uint8_t *)&v14, 0xCu);
  }

  [(VKImageAnalyzerInProcessMadInterface *)self clearCompletedRequest:v8];
  uint64_t v12 = [v8 completionHandler];

  if (v12)
  {
    int v13 = [v8 completionHandler];
    ((void (**)(void, id, void, id))v13)[2](v13, v9, 0, v10);
  }
  [(VKImageAnalyzerInProcessMadInterface *)self processNextItemIfNecessary];
}

- (void)_processRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 requestIDValue];
  unint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Processing Request: %@", buf, 0xCu);
  }

  id v7 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueWaiting];
  [v7 removeObject:v5];

  id v8 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadRequestQueueProcessing];
  [v8 addObject:v5];

  id v9 = [(VKImageAnalyzerInProcessMadInterface *)self tempMadProcessingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke;
  v11[3] = &unk_1E6BF12B8;
  id v12 = v4;
  int v13 = self;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  int v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) imageSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F45908]);
  id v8 = [*v2 locales];
  if ([v8 count]) {
    [*v2 locales];
  }
  else {
  id v9 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  }

  [v7 setRecognitionLanguages:v9];
  [v7 setMaximumCandidateCount:3];
  [v7 setUsesLanguageDetection:1];
  id v10 = [*v2 createVNRequestHandler];
  if (!v10)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKImageAnalyzerInProcessMadInterface _processRequest:]_block_invoke", 0, 0, @"Unable to create handler from request %@", *(void *)(a1 + 32));
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = [*(id *)(a1 + 40) errorDomain];
    uint64_t v27 = *MEMORY[0x1E4F1D140];
    v28[0] = @"Unable to create request handler";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v17 = (void *)[v18 initWithDomain:v15 code:-3 userInfo:v16];
LABEL_10:
    v19 = 0;
    goto LABEL_16;
  }
  id v26 = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  id v25 = 0;
  [v10 performRequests:v11 error:&v25];
  id v12 = v25;

  if (v12)
  {
    int v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke_cold_1((uint64_t)v12, (uint64_t *)v2, v13);
    }

    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v15 = [*(id *)(a1 + 40) errorDomain];
    uint64_t v16 = [v12 userInfo];
    v17 = (void *)[v14 initWithDomain:v15 code:2 userInfo:v16];

    goto LABEL_10;
  }
  if (([*v2 analysisTypes] & 4) != 0 || (objc_msgSend(*v2, "analysisTypes") & 8) != 0)
  {
    v20 = [*(id *)(a1 + 32) image];
    v21 = *(void **)(a1 + 40);
    uint64_t v22 = objc_msgSend(v20, "vk_cgImage");
    v23 = [*(id *)(a1 + 32) processedBarcodeSymbologies];
    id v15 = [v21 mrcElementsFromImage:v22 symbologies:v23];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v24 = [v7 results];
  uint64_t v16 = [v24 firstObject];

  v19 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v16, v15, v4, v6);
  v17 = 0;
LABEL_16:

  [(VKCImageAnalysisResult *)v19 setRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) didFinishRequest:*(void *)(a1 + 32) withAnalysisResult:v19 error:v17];
}

- (void)didFinishRequest:(id)a3 withAnalysisResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__19;
  v21[4] = __Block_byref_object_dispose__19;
  id v10 = a5;
  id v22 = v10;
  if (v9) {
    id v11 = [(VKImageAnalysis *)[VKCImageAnalysis alloc] initWithAnalysisResult:v9];
  }
  else {
    id v11 = 0;
  }
  id v12 = [(VKImageAnalyzerInProcessMadInterface *)self housekeepingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__VKImageAnalyzerInProcessMadInterface_didFinishRequest_withAnalysisResult_error___block_invoke;
  block[3] = &unk_1E6BF2F30;
  void block[4] = self;
  id v17 = v8;
  id v19 = v10;
  v20 = v21;
  id v18 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(v12, block);

  _Block_object_dispose(v21, 8);
}

void __82__VKImageAnalyzerInProcessMadInterface_didFinishRequest_withAnalysisResult_error___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) tempMadRequestQueueCancelling];
  int v2 = [*(id *)(a1 + 40) requestIDValue];
  int v3 = [v8 containsObject:v2];

  if (v3)
  {
    double v4 = [*(id *)(a1 + 40) requestIDValue];
    [v8 removeObject:v4];

    uint64_t v5 = [*(id *)(a1 + 32) cancelledError];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  [*(id *)(a1 + 32) clearCompletedRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) request:*(void *)(a1 + 40) didCompleteWithAnalysis:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (id)mrcElementsFromImage:(CGImage *)a3 symbologies:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F45768];
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithCompletionHandler:0];
  [v7 setSymbologies:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F45890]);
  id v9 = (void *)[v8 initWithCGImage:a3 options:MEMORY[0x1E4F1CC08]];
  v24[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v9 performRequests:v10 error:0];

  id v11 = [v7 results];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    id v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = [v11 count];
      _os_log_impl(&dword_1DB266000, v13, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing with %lu elements", (uint8_t *)&v20, 0xCu);
    }

    id v14 = objc_msgSend(v11, "vk_compactMap:", &__block_literal_global_79_0);
    id v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:v12];
      int v20 = 134218240;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v18;
      _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of %lu elements in %f seconds.", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

id __73__VKImageAnalyzerInProcessMadInterface_mrcElementsFromImage_symbologies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:a2 loggingIndex:a3];
}

- (OS_dispatch_queue)housekeepingQueue
{
  return self->_housekeepingQueue;
}

- (void)setHousekeepingQueue:(id)a3
{
}

- (OS_dispatch_queue)tempMadProcessingQueue
{
  return self->_tempMadProcessingQueue;
}

- (void)setTempMadProcessingQueue:(id)a3
{
}

- (NSMutableOrderedSet)tempMadRequestQueueWaiting
{
  return self->_tempMadRequestQueueWaiting;
}

- (void)setTempMadRequestQueueWaiting:(id)a3
{
}

- (NSMutableOrderedSet)tempMadRequestQueueProcessing
{
  return self->_tempMadRequestQueueProcessing;
}

- (void)setTempMadRequestQueueProcessing:(id)a3
{
}

- (NSMutableSet)tempMadRequestQueueCancelling
{
  return self->_tempMadRequestQueueCancelling;
}

- (void)setTempMadRequestQueueCancelling:(id)a3
{
}

- (NSMutableDictionary)idsToRequests
{
  return self->_idsToRequests;
}

- (void)setIdsToRequests:(id)a3
{
}

- (int)queueRequestID
{
  return self->_queueRequestID;
}

- (void)setQueueRequestID:(int)a3
{
  self->_queueRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsToRequests, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueCancelling, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueProcessing, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueWaiting, 0);
  objc_storeStrong((id *)&self->_tempMadProcessingQueue, 0);
  objc_storeStrong((id *)&self->_housekeepingQueue, 0);
}

void __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Error processing text result image: %@ request: %@", (uint8_t *)&v4, 0x16u);
}

@end