@interface PXVisualIntelligenceManager
+ (BOOL)canRequestVKImageAnalysisForAsset:(id)a3;
+ (BOOL)isAppClipSupported;
+ (BOOL)isImageSegmentationSupported;
+ (BOOL)isLiveTextSupported;
+ (BOOL)isMRCSupported;
+ (BOOL)isVisualSearchSupported;
+ (CGSize)_sizeToPreheatResourcesForSubjectExtractionOfAsset:(id)a3;
+ (PXVisualIntelligenceManager)new;
+ (PXVisualIntelligenceManager)sharedManager;
+ (int)preheatResourcesForSubjectExtractionOfAsset:(id)a3;
+ (unint64_t)supportedAnalysisTypes;
- (BOOL)analysisSuspended;
- (NSMutableArray)requests;
- (OS_dispatch_queue)workingQueue;
- (PXVisualIntelligenceManager)init;
- (VKCImageAnalyzer)vkAnalyzer;
- (_PXVisualIntelligenceRequest)currentRequest;
- (id)_init;
- (int)nextRequestID;
- (int)requestVKImageAnalysisForAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 resultHandler:(id)a6;
- (int)requestVKImageAnalysisForAsset:(id)a3 image:(id)a4 resultHandler:(id)a5;
- (int)requestVKImageAnalysisForAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 resultHandler:(id)a6;
- (int)requestVKImageAnalysisForAsset:(id)a3 resultHandler:(id)a4;
- (void)_dispatchNextRequest;
- (void)_logAnalysis:(id)a3 request:(id)a4 duration:(double)a5 error:(id)a6;
- (void)_processAnalysis:(id)a3 withRequest:(id)a4 error:(id)a5;
- (void)_resetCurrentRequestAndDispatchNextRequest;
- (void)cancelRequestByID:(int)a3;
- (void)setAnalysisSuspended:(BOOL)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setNextRequestID:(int)a3;
- (void)setRequests:(id)a3;
- (void)setVkAnalyzer:(id)a3;
@end

@implementation PXVisualIntelligenceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_workingQueue, 0);
}

- (void)setVkAnalyzer:(id)a3
{
}

- (void)setCurrentRequest:(id)a3
{
}

- (_PXVisualIntelligenceRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setRequests:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setNextRequestID:(int)a3
{
  self->_nextRequestID = a3;
}

- (int)nextRequestID
{
  return self->_nextRequestID;
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (BOOL)analysisSuspended
{
  return self->_analysisSuspended;
}

- (void)_logAnalysis:(id)a3 request:(id)a4 duration:(double)a5 error:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    v12 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "requestID"));
      v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "vkRequestID"));
      v15 = [v10 asset];
      v16 = [v15 uuid];
      *(_DWORD *)buf = 138413058;
      v39 = v13;
      __int16 v40 = 2112;
      v41 = v14;
      __int16 v42 = 2112;
      double v43 = *(double *)&v16;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "VK analyzing: requestID (PX: %@, VK: %@) failed (asset_uuid = %@): %@", buf, 0x2Au);
    }
  }
  if (v9)
  {
    int v17 = [v9 hasResultsForAnalysisTypes:1];
    int v18 = [v9 hasResultsForAnalysisTypes:2];
    int v19 = [v9 hasResultsForAnalysisTypes:4];
    int v20 = [v9 hasResultsForAnalysisTypes:8];
    int v21 = [v9 hasResultsForAnalysisTypes:16];
    uint64_t v22 = [v9 countOfDataDetectorsWithTypes:-1];
    v23 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v35 = v17;
      int v36 = v18;
      objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "requestID"));
      v24 = uint64_t v37 = v22;
      v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "vkRequestID"));
      v26 = [v10 asset];
      uint64_t v27 = [v26 uuid];
      int v28 = v19;
      v29 = (void *)v27;
      *(_DWORD *)buf = 138414594;
      v30 = @"NO";
      v39 = v24;
      if (v35) {
        v31 = @"YES";
      }
      else {
        v31 = @"NO";
      }
      if (v36) {
        v32 = @"YES";
      }
      else {
        v32 = @"NO";
      }
      if (v28) {
        v33 = @"YES";
      }
      else {
        v33 = @"NO";
      }
      if (v20) {
        v34 = @"YES";
      }
      else {
        v34 = @"NO";
      }
      __int16 v40 = 2112;
      v41 = v25;
      if (v21) {
        v30 = @"YES";
      }
      __int16 v42 = 2048;
      double v43 = a5;
      __int16 v44 = 2112;
      uint64_t v45 = v27;
      __int16 v46 = 2112;
      v47 = v31;
      __int16 v48 = 2112;
      v49 = v32;
      __int16 v50 = 2112;
      v51 = v33;
      __int16 v52 = 2112;
      v53 = v34;
      __int16 v54 = 2112;
      v55 = v30;
      __int16 v56 = 2048;
      uint64_t v57 = v37;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_INFO, "VK analyzing: requestID (PX: %@, VK: %@) finished in %fs, asset_uuid = %@, (texts: %@, DD: %@, MRC: %@, AppClip: %@, VisualSearch: %@) Data Detectors: %ld", buf, 0x66u);
    }
  }
}

- (void)_resetCurrentRequestAndDispatchNextRequest
{
  [(PXVisualIntelligenceManager *)self setCurrentRequest:0];
  [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
}

- (void)_processAnalysis:(id)a3 withRequest:(id)a4 error:(id)a5
{
  if (a4)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    id v11 = [v8 resultHandler];
    uint64_t v10 = [v8 requestID];

    v11[2](v11, v10, v9, v7);
  }
}

- (void)_dispatchNextRequest
{
  if (![(PXVisualIntelligenceManager *)self analysisSuspended])
  {
    objc_initWeak(&location, self);
    v3 = [(PXVisualIntelligenceManager *)self workingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained currentRequest];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    v6 = [v5 requests];
    id v7 = [v6 lastObject];

    if (v7)
    {
      id v8 = objc_loadWeakRetained(v2);
      [v8 setCurrentRequest:v7];

      id v9 = objc_loadWeakRetained(v2);
      uint64_t v10 = [v9 requests];
      [v10 removeObject:v7];

      id v11 = [v7 vkImageRequest];
      if (v11)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        v13 = (void *)[MEMORY[0x1E4F56658] startSignpost];
        v14 = [*(id *)(a1 + 32) vkAnalyzer];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke_2;
        v22[3] = &unk_1E5DC0BB8;
        v25[1] = *(id *)&Current;
        id v15 = v7;
        v25[2] = v13;
        uint64_t v16 = *(void *)(a1 + 32);
        id v23 = v15;
        uint64_t v24 = v16;
        objc_copyWeak(v25, v2);
        objc_msgSend(v15, "setVkRequestID:", objc_msgSend(v14, "processRequest:progressHandler:completionHandler:", v11, 0, v22));

        int v17 = PLVisualIntelligenceGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "requestID"));
          int v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "vkRequestID"));
          *(_DWORD *)buf = 138412546;
          uint64_t v27 = v18;
          __int16 v28 = 2112;
          v29 = v19;
          _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_INFO, "VK analyzing: request sent to VKC, requestID (PX: %@, VK: %@)", buf, 0x16u);
        }
        objc_destroyWeak(v25);
        id v20 = v23;
      }
      else
      {
        int v21 = PLVisualIntelligenceGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "VK analyzing: Failed to generate VK image analyze request", buf, 2u);
        }

        id v20 = objc_loadWeakRetained(v2);
        [v20 _resetCurrentRequestAndDispatchNextRequest];
      }
    }
  }
}

void __51__PXVisualIntelligenceManager__dispatchNextRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  [v8 setObject:@"com.apple.photos.CPAnalytics.visualIntelligenceAnalysisRequested" forKeyedSubscript:*MEMORY[0x1E4F56580]];
  id v9 = [*(id *)(a1 + 32) asset];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F56558]];

  [MEMORY[0x1E4F56658] endSignpost:*(void *)(a1 + 64) forEventName:*MEMORY[0x1E4F56440] withPayload:v8];
  [*(id *)(a1 + 40) _logAnalysis:v5 request:*(void *)(a1 + 32) duration:v6 error:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = [WeakRetained currentRequest];
  int v12 = [v11 requestID];
  int v13 = [*(id *)(a1 + 32) requestID];

  if (v12 == v13)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 48));
    [v14 _processAnalysis:v5 withRequest:*(void *)(a1 + 32) error:v6];

    id v15 = objc_loadWeakRetained((id *)(a1 + 48));
    [v15 _resetCurrentRequestAndDispatchNextRequest];
  }
  else if (!v6)
  {
    uint64_t v16 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
      int v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "vkRequestID"));
      int v19 = 138412546;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "VK analyzing: requestID (PX: %@, VK: %@), VKC delivers analysis without cancel or error, but no longer needed. Needs to check cancelling or dispatching system", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)setAnalysisSuspended:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_analysisSuspended != a3)
  {
    BOOL v3 = a3;
    self->_analysisSuspended = a3;
    id v5 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "VK analyzing: analyzing suspend (%@)", buf, 0xCu);
    }

    if (v3)
    {
      CFAbsoluteTime v7 = [(PXVisualIntelligenceManager *)self currentRequest];
      id v8 = v7;
      if (v7)
      {
        -[PXVisualIntelligenceManager cancelRequestByID:](self, "cancelRequestByID:", [v7 requestID]);
        objc_initWeak((id *)buf, self);
        id v9 = [(PXVisualIntelligenceManager *)self workingQueue];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __52__PXVisualIntelligenceManager_setAnalysisSuspended___block_invoke;
        v10[3] = &unk_1E5DD20C8;
        objc_copyWeak(&v12, (id *)buf);
        id v11 = v8;
        dispatch_async(v9, v10);

        objc_destroyWeak(&v12);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
    }
  }
}

void __52__PXVisualIntelligenceManager_setAnalysisSuspended___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained requests];
  [v2 addObject:*(void *)(a1 + 32)];
}

- (void)cancelRequestByID:(int)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    id v5 = [(PXVisualIntelligenceManager *)self workingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PXVisualIntelligenceManager_cancelRequestByID___block_invoke;
    block[3] = &unk_1E5DC0B68;
    objc_copyWeak(&v7, &location);
    int v8 = a3;
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__PXVisualIntelligenceManager_cancelRequestByID___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "requests", 0);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 requestID] == *(_DWORD *)(a1 + 40))
        {
          id v10 = objc_loadWeakRetained(v2);
          id v11 = [v10 requests];
          [v11 removeObject:v9];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = objc_loadWeakRetained(v2);
  int v13 = [v12 currentRequest];

  if ([v13 requestID] == *(_DWORD *)(a1 + 40))
  {
    id v14 = objc_loadWeakRetained(v2);
    uint64_t v15 = [v14 vkAnalyzer];
    objc_msgSend(v15, "cancelRequestID:", objc_msgSend(v13, "vkRequestID"));

    id v16 = objc_loadWeakRetained(v2);
    [v16 _resetCurrentRequestAndDispatchNextRequest];

    int v17 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
      int v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "vkRequestID"));
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_INFO, "VK analyzing: executing in VKC, cancelRequestID(PX: %@, VK: %@)", buf, 0x16u);
    }
  }
}

- (int)requestVKImageAnalysisForAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 resultHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__162613;
  v27[4] = __Block_byref_object_dispose__162614;
  id v28 = 0;
  CGImageRetain(a4);
  id v12 = [(PXVisualIntelligenceManager *)self workingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_cgImage_orientation_resultHandler___block_invoke;
  block[3] = &unk_1E5DC0B40;
  long long v23 = &v29;
  void block[4] = self;
  uint64_t v24 = v27;
  id v13 = v10;
  id v21 = v13;
  v25 = a4;
  int64_t v26 = a5;
  id v14 = v11;
  id v22 = v14;
  dispatch_sync(v12, block);

  CGImageRelease(a4);
  uint64_t v15 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [v13 uuid];
    int v17 = [NSNumber numberWithInt:*((unsigned int *)v30 + 6)];
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    __int16 v35 = 2112;
    int v36 = v17;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);
  }
  [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
  int v18 = *((_DWORD *)v30 + 6);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __96__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_cgImage_orientation_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [v2 nextRequestID];
  [v2 setNextRequestID:(v3 + 1)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  v4 = [[_PXVisualIntelligenceRequest alloc] initWithAsset:*(void *)(a1 + 40) cgImage:*(void *)(a1 + 72) orientation:*(void *)(a1 + 80) requestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) resultHandler:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) requests];
  [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (int)requestVKImageAnalysisForAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 resultHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__162613;
  v27[4] = __Block_byref_object_dispose__162614;
  id v28 = 0;
  CVPixelBufferRetain(a4);
  id v12 = [(PXVisualIntelligenceManager *)self workingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_pixelBuffer_orientation_resultHandler___block_invoke;
  block[3] = &unk_1E5DC0B40;
  long long v23 = &v29;
  void block[4] = self;
  uint64_t v24 = v27;
  id v13 = v10;
  id v21 = v13;
  v25 = a4;
  int64_t v26 = a5;
  id v14 = v11;
  id v22 = v14;
  dispatch_sync(v12, block);

  CVPixelBufferRelease(a4);
  uint64_t v15 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [v13 uuid];
    int v17 = [NSNumber numberWithInt:*((unsigned int *)v30 + 6)];
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    __int16 v35 = 2112;
    int v36 = v17;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);
  }
  [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
  int v18 = *((_DWORD *)v30 + 6);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __100__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_pixelBuffer_orientation_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [v2 nextRequestID];
  [v2 setNextRequestID:(v3 + 1)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  v4 = [[_PXVisualIntelligenceRequest alloc] initWithAsset:*(void *)(a1 + 40) pixelBuffer:*(void *)(a1 + 72) orientation:*(void *)(a1 + 80) requestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) resultHandler:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) requests];
  [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (int)requestVKImageAnalysisForAsset:(id)a3 image:(id)a4 resultHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__162613;
  v30[4] = __Block_byref_object_dispose__162614;
  id v31 = 0;
  id v11 = [(PXVisualIntelligenceManager *)self workingQueue];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __82__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_image_resultHandler___block_invoke;
  long long v23 = &unk_1E5DC0B18;
  id v28 = &v32;
  uint64_t v29 = v30;
  uint64_t v24 = self;
  id v12 = v8;
  id v25 = v12;
  id v13 = v9;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  dispatch_sync(v11, &v20);

  uint64_t v15 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = objc_msgSend(v12, "uuid", v20, v21, v22, v23, v24, v25, v26);
    int v17 = [NSNumber numberWithInt:*((unsigned int *)v33 + 6)];
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v16;
    __int16 v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);
  }
  [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
  int v18 = *((_DWORD *)v33 + 6);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __82__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_image_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [v2 nextRequestID];
  [v2 setNextRequestID:(v3 + 1)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  v4 = [[_PXVisualIntelligenceRequest alloc] initWithAsset:*(void *)(a1 + 40) image:*(void *)(a1 + 48) requestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) resultHandler:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) requests];
  [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

- (int)requestVKImageAnalysisForAsset:(id)a3 resultHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__162613;
  v21[4] = __Block_byref_object_dispose__162614;
  id v22 = 0;
  id v8 = [(PXVisualIntelligenceManager *)self workingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_resultHandler___block_invoke;
  block[3] = &unk_1E5DC0AF0;
  int v19 = &v23;
  uint64_t v20 = v21;
  void block[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  dispatch_sync(v8, block);

  id v11 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v9 uuid];
    id v13 = [NSNumber numberWithInt:*((unsigned int *)v24 + 6)];
    *(_DWORD *)buf = 138412546;
    id v28 = v12;
    __int16 v29 = 2112;
    uint64_t v30 = v13;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "VK analyzing: requested and request added in queue, NOT sent to VKC yet, (asset_uuid = %@), requestID: %@", buf, 0x16u);
  }
  [(PXVisualIntelligenceManager *)self _dispatchNextRequest];
  int v14 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

void __76__PXVisualIntelligenceManager_requestVKImageAnalysisForAsset_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [v2 nextRequestID];
  [v2 setNextRequestID:(v3 + 1)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  v4 = [[_PXVisualIntelligenceRequest alloc] initWithAsset:*(void *)(a1 + 40) requestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) resultHandler:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) requests];
  [v7 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

- (VKCImageAnalyzer)vkAnalyzer
{
  vkAnalyzer = self->_vkAnalyzer;
  if (!vkAnalyzer)
  {
    v4 = (VKCImageAnalyzer *)objc_alloc_init(MEMORY[0x1E4FB3FE0]);
    uint64_t v5 = self->_vkAnalyzer;
    self->_vkAnalyzer = v4;

    id v6 = [(PXVisualIntelligenceManager *)self workingQueue];
    [(VKCImageAnalyzer *)self->_vkAnalyzer setCallbackQueue:v6];

    vkAnalyzer = self->_vkAnalyzer;
  }
  return vkAnalyzer;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)PXVisualIntelligenceManager;
  v2 = [(PXVisualIntelligenceManager *)&v9 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.vi_workingQueue", v3);
    workingQueue = v2->_workingQueue;
    v2->_workingQueue = (OS_dispatch_queue *)v4;

    v2->_nextRequestID = 1;
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requests = v2->_requests;
    v2->_requests = v6;
  }
  return v2;
}

- (PXVisualIntelligenceManager)init
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVisualIntelligenceManager.m", 303, @"%s is not available as initializer", "-[PXVisualIntelligenceManager init]");

  abort();
}

+ (CGSize)_sizeToPreheatResourcesForSubjectExtractionOfAsset:(id)a3
{
  id v3 = a3;
  double v4 = (double)(unint64_t)[v3 pixelWidth];
  unint64_t v5 = [v3 pixelHeight];

  double v6 = (double)v5;
  if (1.0 - (double)v5 <= 0.00000011920929 && 1.0 - v4 <= 0.00000011920929)
  {
    double v8 = v4 * v6;
    float v9 = 11500000.0 / (v4 * v6);
    float v10 = sqrtf(v9);
    if (v10 < 1.0)
    {
      double v11 = v10;
      double v4 = floor(v4 * v11);
      double v6 = floor(v6 * v11);
      double v8 = v6 * v4;
    }
    if (v8 > 11500000.0) {
      PXAssertGetLog();
    }
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v12 = v4;
  double v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (int)preheatResourcesForSubjectExtractionOfAsset:(id)a3
{
  id v4 = a3;
  if (![a1 canRequestVKImageAnalysisForAsset:v4]) {
    goto LABEL_5;
  }
  if (preheatResourcesForSubjectExtractionOfAsset__onceToken != -1) {
    dispatch_once(&preheatResourcesForSubjectExtractionOfAsset__onceToken, &__block_literal_global_124);
  }
  unint64_t v5 = [v4 uuid];
  char v6 = [v5 isEqualToString:preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID];

  if ((v6 & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F390D0] defaultManager];
    float v9 = v8;
    if (preheatResourcesForSubjectExtractionOfAsset__lastRequestID) {
      objc_msgSend(v8, "cancelImageRequest:");
    }
    [a1 _sizeToPreheatResourcesForSubjectExtractionOfAsset:v4];
    double v11 = v10;
    double v13 = v12;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v15 = preheatResourcesForSubjectExtractionOfAsset__options;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke_2;
    uint64_t v23 = &unk_1E5DC0B90;
    id v16 = v4;
    id v24 = v16;
    double v25 = v11;
    double v26 = v13;
    CFAbsoluteTime v27 = Current;
    int v7 = objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v16, 0, v15, &v20, v11, v13);
    preheatResourcesForSubjectExtractionOfAsset__lastRequestID = v7;
    uint64_t v17 = objc_msgSend(v16, "uuid", v20, v21, v22, v23);
    id v18 = (void *)preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID;
    preheatResourcesForSubjectExtractionOfAsset__lastRequestedAssetUUID = v17;
  }
  else
  {
LABEL_5:
    int v7 = 0;
  }

  return v7;
}

void __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  preheatResourcesForSubjectExtractionOfAsset__lastRequestID = 0;
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F396C8]];
  unint64_t v5 = PLVisualIntelligenceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [*(id *)(a1 + 32) uuid];
    int v7 = NSStringFromCGSize(*(CGSize *)(a1 + 40));
    CGFloat v8 = (double)(unint64_t)[*(id *)(a1 + 32) pixelWidth];
    v23.height = (double)(unint64_t)[*(id *)(a1 + 32) pixelHeight];
    v23.width = v8;
    float v9 = NSStringFromCGSize(v23);
    CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    double v11 = [v4 path];
    int v12 = 138544387;
    double v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2050;
    CFAbsoluteTime v19 = v10;
    __int16 v20 = 2113;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "VK analyzing: got preheat higher res image for asset_uuid (%{public}@), targetSize: %{public}@, originalSize: %{public}@, return in %{public}.3fs, fileURL: %{private}@", (uint8_t *)&v12, 0x34u);
  }
}

uint64_t __75__PXVisualIntelligenceManager_preheatResourcesForSubjectExtractionOfAsset___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  v1 = (void *)preheatResourcesForSubjectExtractionOfAsset__options;
  preheatResourcesForSubjectExtractionOfAsset__options = (uint64_t)v0;

  [(id)preheatResourcesForSubjectExtractionOfAsset__options setLoadingMode:0x10000];
  [(id)preheatResourcesForSubjectExtractionOfAsset__options setDeliveryMode:1];
  v2 = (void *)preheatResourcesForSubjectExtractionOfAsset__options;
  return [v2 setNetworkAccessAllowed:1];
}

+ (BOOL)canRequestVKImageAnalysisForAsset:(id)a3
{
  id v4 = a3;
  if ([a1 supportedAnalysisTypes]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v4 mediaType] == 1)
  {
    uint64_t v5 = [v4 playbackStyle];
    uint64_t v6 = [v4 playbackStyle];
    [v4 deferredProcessingNeeded];
    char v7 = PHAssetDeferredProcessingInvalidatesContentWhenCompleted();
    if (v5 == 2 || v6 == 5) {
      char v9 = 0;
    }
    else {
      char v9 = v7 ^ 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isImageSegmentationSupported
{
  return ((unint64_t)[a1 supportedAnalysisTypes] >> 5) & 1;
}

+ (BOOL)isVisualSearchSupported
{
  return ((unint64_t)[a1 supportedAnalysisTypes] >> 4) & 1;
}

+ (BOOL)isMRCSupported
{
  return ((unint64_t)[a1 supportedAnalysisTypes] >> 2) & 1;
}

+ (BOOL)isAppClipSupported
{
  return ((unint64_t)[a1 supportedAnalysisTypes] >> 3) & 1;
}

+ (BOOL)isLiveTextSupported
{
  return [a1 supportedAnalysisTypes] & 1;
}

+ (unint64_t)supportedAnalysisTypes
{
  if (supportedAnalysisTypes_onceToken != -1) {
    dispatch_once(&supportedAnalysisTypes_onceToken, &__block_literal_global_162663);
  }
  return supportedAnalysisTypes_supportedAnalysisTypes;
}

uint64_t __53__PXVisualIntelligenceManager_supportedAnalysisTypes__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB3FE0] supportedAnalysisTypes];
  supportedAnalysisTypes_supportedAnalysisTypes = result;
  return result;
}

+ (PXVisualIntelligenceManager)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXVisualIntelligenceManager.m", 307, @"%s is not available as initializer", "+[PXVisualIntelligenceManager new]");

  abort();
}

+ (PXVisualIntelligenceManager)sharedManager
{
  os_unfair_lock_lock((os_unfair_lock_t)&sharedManager_lock);
  id WeakRetained = objc_loadWeakRetained(&sharedManager_weakManager);
  if (!WeakRetained)
  {
    id WeakRetained = [[PXVisualIntelligenceManager alloc] _init];
    objc_storeWeak(&sharedManager_weakManager, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedManager_lock);
  return (PXVisualIntelligenceManager *)WeakRetained;
}

@end