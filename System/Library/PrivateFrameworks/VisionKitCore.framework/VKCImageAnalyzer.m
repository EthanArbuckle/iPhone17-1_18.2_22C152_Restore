@interface VKCImageAnalyzer
+ (NSArray)supportedRecognitionLanguages;
+ (unint64_t)supportedAnalysisTypes;
- (BOOL)_isPublicAPI;
- (BOOL)createFeedbackProviders;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)realCallbackQueue;
- (VKAnalyticsProcessor)analyticsProcessor;
- (VKAnalyzerAnalyticsDelegate)_analyticsDelegate;
- (VKCImageAnalyzer)init;
- (VKImageAnalyzerMadInterface)mad;
- (id)processRequest:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5;
- (int)_processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (unint64_t)statusForRequestID:(int)a3;
- (void)_forceInProcessAnalysis;
- (void)cancelAllRequests;
- (void)cancelRequestID:(int)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnalyticsProcessor:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCreateFeedbackProviders:(BOOL)a3;
- (void)setMad:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)set_analyticsDelegate:(id)a3;
- (void)set_isPublicAPI:(BOOL)a3;
- (void)updateForLiveTextSupport;
@end

@implementation VKCImageAnalyzer

+ (NSArray)supportedRecognitionLanguages
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F45908]);
  id v6 = 0;
  v3 = [v2 supportedRecognitionLanguagesAndReturnError:&v6];
  id v4 = v6;
  if (v4) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKCImageAnalyzer supportedRecognitionLanguages]", 0, 0, @"Error retrieving supportedRecognitionLanguages: %@", v4);
  }

  return (NSArray *)v3;
}

+ (unint64_t)supportedAnalysisTypes
{
  if (supportedAnalysisTypes_onceToken != -1) {
    dispatch_once(&supportedAnalysisTypes_onceToken, &__block_literal_global);
  }
  return supportedAnalysisTypes_types;
}

void __42__VKCImageAnalyzer_supportedAnalysisTypes__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (vk_deviceSupportsVisualSearch()) {
    supportedAnalysisTypes_types |= 0x10uLL;
  }
  if (vk_deviceSupportsImageAnalysis())
  {
    supportedAnalysisTypes_types |= 1uLL;
    if (vk_isiOS()) {
      supportedAnalysisTypes_types |= 0xCuLL;
    }
  }
  if ((vk_deviceHasNeuralEngine() & 1) != 0 || vk_isSeedBuild()) {
    supportedAnalysisTypes_types |= 0x20uLL;
  }
  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = VKMUIStringForAnalysisTypes(supportedAnalysisTypes_types);
    int v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1DB266000, v0, OS_LOG_TYPE_DEFAULT, "Supported Analysis types: %@", (uint8_t *)&v2, 0xCu);
  }
}

- (VKCImageAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)VKCImageAnalyzer;
  int v2 = [(VKCImageAnalyzer *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 addObserver:v2 forKeyPath:@"AppleLiveTextEnabled" options:1 context:VKImageAnalyzerContext];

    [(VKCImageAnalyzer *)v2 updateForLiveTextSupport];
  }
  return v2;
}

- (void)updateForLiveTextSupport
{
  if (([(id)objc_opt_class() deviceSupportsImageAnalysis] & 1) != 0
    || vk_deviceSupportsVisualSearch())
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("VKImageAnalyzer", 0);
    processingQueue = self->_processingQueue;
    self->_processingQueue = v3;

    objc_super v5 = objc_alloc_init(VKAnalyticsProcessor);
    analyticsProcessor = self->_analyticsProcessor;
    self->_analyticsProcessor = v5;

    [(VKAnalyticsProcessor *)self->_analyticsProcessor setIsPublicAPI:[(VKCImageAnalyzer *)self _isPublicAPI]];
    v7 = +[VKImageAnalyzerMadInterface sharedInterface];
    mad = self->_mad;
    self->_mad = v7;

    if (vk_isInternalBuild()) {
      self->_createFeedbackProviders = 1;
    }
  }
  else
  {
    [(VKCImageAnalyzer *)self cancelAllRequests];
    v9 = self->_processingQueue;
    self->_processingQueue = 0;

    v10 = self->_analyticsProcessor;
    self->_analyticsProcessor = 0;

    v11 = self->_mad;
    self->_mad = 0;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"AppleLiveTextEnabled" context:VKImageAnalyzerContext];

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalyzer;
  [(VKCImageAnalyzer *)&v4 dealloc];
}

- (void)set_isPublicAPI:(BOOL)a3
{
  BOOL v3 = a3;
  self->__isPublicAPI = a3;
  id v4 = [(VKCImageAnalyzer *)self analyticsProcessor];
  [v4 setIsPublicAPI:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)VKImageAnalyzerContext == a6)
  {
    [(VKCImageAnalyzer *)self updateForLiveTextSupport];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKCImageAnalyzer;
    -[VKCImageAnalyzer observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (OS_dispatch_queue)realCallbackQueue
{
  int v2 = [(VKCImageAnalyzer *)self callbackQueue];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }

  return (OS_dispatch_queue *)v4;
}

- (unint64_t)statusForRequestID:(int)a3
{
  return 3;
}

- (void)cancelRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(VKCImageAnalyzer *)self mad];
  [v4 cancelRequestID:v3];
}

- (void)cancelAllRequests
{
  id v2 = [(VKCImageAnalyzer *)self mad];
  [v2 cancelAllRequests];
}

- (int)processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 analysisTypes])
  {
    v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_INFO, "Attempting to analyze an image with no analysis types set.", buf, 2u);
    }
  }
  [v8 imageSize];
  double v14 = v12;
  double v15 = v13;
  if (v12 >= v13) {
    double v16 = v12;
  }
  else {
    double v16 = v13;
  }
  int v17 = [v8 isPhotosAssetRequest];
  if (v16 < 8192.0) {
    int v18 = 1;
  }
  else {
    int v18 = v17;
  }
  int v19 = [(id)objc_opt_class() deviceSupportsImageAnalysis];
  int v20 = vk_deviceSupportsVisualSearch();
  char v21 = [v8 analysisTypes];
  if (!v8 || (v18 ? (BOOL v22 = (v19 | v20) == 0) : (BOOL v22 = 1), v22))
  {
    v23 = [(VKCImageAnalyzer *)self realCallbackQueue];
    if (v8)
    {
      if (v18)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_64;
        block[3] = &unk_1E6BF0B10;
        id v29 = v10;
        dispatch_async(v23, block);

        v24 = v29;
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_59;
        v30[3] = &unk_1E6BF0B38;
        double v32 = v14;
        double v33 = v15;
        id v31 = v10;
        dispatch_async(v23, v30);

        v24 = v31;
      }
    }
    else
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke;
      v34[3] = &unk_1E6BF0B10;
      id v35 = v10;
      dispatch_async(v23, v34);

      v24 = v35;
    }

    int v26 = 0;
  }
  else
  {
    if (v19)
    {
      objc_msgSend(v8, "setProcessedAnalysisTypes:", objc_msgSend(v8, "analysisTypes"));
    }
    else if ((v20 & ((v21 & 0x10) != 0)) == 1)
    {
      [v8 setProcessedAnalysisTypes:16];
      v25 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB266000, v25, OS_LOG_TYPE_INFO, "Device does not support image analysis, but does support Visual Search, limiting to just Visual Search.", buf, 2u);
      }
    }
    int v26 = [(VKCImageAnalyzer *)self _processRequest:v8 progressHandler:v9 completionHandler:v10];
  }

  return v26;
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Analyzer request must not be nil";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-7 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);

  id v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_59(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  uint64_t v3 = VKMUIStringForSize(*(double *)(a1 + 40), *(double *)(a1 + 48));
  id v4 = [v2 stringWithFormat:@"ImageSize %@ is invalid for analysis. Max supported dimension is %ld", v3, 0x2000];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [v6 errorWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-10 userInfo:v7];
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);

  uint64_t v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_59_cold_1((uint64_t)v4, v9);
  }
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_64(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Device Not Supported";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-4 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);

  if (VKCMaxPixelDimension_block_invoke_onceToken != -1) {
    dispatch_once(&VKCMaxPixelDimension_block_invoke_onceToken, &__block_literal_global_69);
  }
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2()
{
  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (id)processRequest:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() deviceSupportsImageAnalysis])
  {
    [v8 setIsMultiPartAnalysis:1];
    uint64_t v11 = [VKCImageAnalysis alloc];
    uint64_t v12 = [VKCImageAnalysisResult alloc];
    [v8 imageSize];
    uint64_t v13 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:](v12, "initWithDocumentObservation:mrcDataDetectors:imageSize:", 0, 0);
    double v14 = [(VKImageAnalysis *)v11 initWithAnalysisResult:v13];
    [v8 setInProcessAnalysis:v14];

    objc_msgSend(v8, "setRequestID:", -[VKCImageAnalyzer _processRequest:progressHandler:completionHandler:](self, "_processRequest:progressHandler:completionHandler:", v8, 0, v10));
    [v8 setUpdateHandler:v9];
    double v15 = [v8 inProcessAnalysis];
  }
  else
  {
    double v16 = [(VKCImageAnalyzer *)self realCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke;
    block[3] = &unk_1E6BF0B10;
    id v19 = v10;
    dispatch_async(v16, block);

    double v15 = 0;
  }

  return v15;
}

void __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Device Not Supported";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.VisionKit.ImageAnalyzer" code:-4 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);

  if (VKCMaxPixelDimension_block_invoke_2_onceToken != -1) {
    dispatch_once(&VKCMaxPixelDimension_block_invoke_2_onceToken, &__block_literal_global_73);
  }
}

void __67__VKCImageAnalyzer_processRequest_updateHandler_completionHandler___block_invoke_2()
{
  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (int)_processRequest:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  uint64_t v12 = _VKSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VKImageAnalyzerProcessRequestEvent", (const char *)&unk_1DB3491BE, buf, 2u);
  }

  uint64_t v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB266000, v13, OS_LOG_TYPE_INFO, "Signpost Begin: \"VKImageAnalyzerProcessRequestEvent\"", buf, 2u);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke;
  v29[3] = &unk_1E6BF0BB0;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, &from);
  id v14 = v11;
  id v30 = v14;
  id v15 = v10;
  id v31 = v15;
  [v8 setCompletionHandler:v29];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_79;
  v25[3] = &unk_1E6BF0C00;
  objc_copyWeak(&v27, &location);
  objc_copyWeak(&v28, &from);
  id v16 = v9;
  id v26 = v16;
  [v8 setProgressHandler:v25];
  int v17 = [(VKCImageAnalyzer *)self mad];
  int v18 = [(VKCImageAnalyzer *)self realCallbackQueue];
  int v24 = [v17 processRequest:v8 callbackQueue:v18];

  id v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v14];
  uint64_t v21 = v20;

  BOOL v22 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_1DB266000, v22, OS_LOG_TYPE_INFO, "Added request to Mad Interface with total method return time: %f request: %@", buf, 0x16u);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v24;
}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v11 = objc_loadWeakRetained(a1 + 7);
  uint64_t v12 = [v11 requestIDValue];
  if (WeakRetained)
  {
    if ([WeakRetained createFeedbackProviders])
    {
      uint64_t v13 = objc_alloc_init(VKFeedbackProvider);
      [(VKFeedbackProvider *)v13 setAssetsProvider:v11];
      [(VKFeedbackProvider *)v13 setError:v9];
      [v7 setFeedbackProvider:v13];
    }
    id v14 = [WeakRetained _analyticsDelegate];
    id v15 = [WeakRetained realCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E6BF0B88;
    id v19 = v7;
    id v20 = a1[4];
    objc_copyWeak(&v28, a1 + 7);
    id v21 = v9;
    id v22 = v12;
    id v23 = v15;
    id v27 = a1[5];
    id v24 = v14;
    id v25 = v8;
    id v26 = WeakRetained;
    id v16 = v14;
    int v17 = v15;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
  }
}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) imageAnalysisResult];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v5 = v4;

  uint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    int v34 = [WeakRetained requestID];
    __int16 v38 = [*(id *)(a1 + 32) imageAnalysisResult];
    id v7 = VKMUIStringForBool(v38 != 0);
    uint64_t v37 = [v2 text];
    int v33 = [v37 length];
    v36 = [v2 textDataDetectorElements];
    int v32 = [v36 count];
    id v35 = [v2 mrcDataDetectorElements];
    int v8 = [v35 count];
    id v9 = [v2 visualSearchResult];
    [v9 searchResult];
    id v10 = v40 = v2;
    id v11 = [v10 resultItems];
    int v12 = [v11 count];
    id v13 = objc_loadWeakRetained((id *)(a1 + 104));
    id v14 = [v13 shortLoggingDescription];
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)v52 = v34;
    *(_WORD *)&v52[4] = 2048;
    *(double *)&v52[6] = v5 * 1000.0;
    *(_WORD *)&v52[14] = 2112;
    *(void *)&v52[16] = v7;
    __int16 v53 = 1024;
    int v54 = v33;
    __int16 v55 = 1024;
    int v56 = v32;
    __int16 v57 = 1024;
    int v58 = v8;
    __int16 v59 = 1024;
    int v60 = v12;
    __int16 v61 = 2112;
    v62 = v14;
    __int16 v63 = 2112;
    uint64_t v64 = v15;
    _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Calling completion handler id: %d\nTotal Processing Time %.02fms\nHas Analysis: %@\nTextLength: %d DD: %d, MRC: %d, VS:%d \nrequest: %@\nError: %@", buf, 0x48u);

    uint64_t v2 = v40;
  }

  if (+[VKCInternalSettings addRandomArtificalAnalysisDelay]&& vk_isInternalBuild())
  {
    id v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      *(void *)v52 = v17;
      _os_log_impl(&dword_1DB266000, v16, OS_LOG_TYPE_DEFAULT, "Internal setting is set, and now beginning random delay logic for request: %@", buf, 0xCu);
    }

    +[VKCInternalSettings randomDelayStartValue];
    double v19 = v18;
    +[VKCInternalSettings randomDelayEndValue];
    double v21 = v20;
    if (v19 > v20)
    {
      id v22 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v52 = v19;
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = v21;
        _os_log_impl(&dword_1DB266000, v22, OS_LOG_TYPE_DEFAULT, "Random delay minValue (%f) > endValue (%f), swapping", buf, 0x16u);
      }
    }
    double v23 = VKMRandomBetween(v19, v21);
    id v24 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218242;
      *(double *)v52 = v23;
      *(_WORD *)&v52[8] = 2112;
      *(void *)&v52[10] = v25;
      _os_log_impl(&dword_1DB266000, v24, OS_LOG_TYPE_DEFAULT, "Adding random delay of %f for request: %@", buf, 0x16u);
    }

    dispatch_time_t v26 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    id v27 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_77;
    block[3] = &unk_1E6BF0B60;
    id v42 = *(id *)(a1 + 40);
    double v47 = v23;
    double v48 = v19;
    double v49 = v21;
    id v43 = *(id *)(a1 + 56);
    double v50 = v5;
    id v46 = *(id *)(a1 + 96);
    id v44 = *(id *)(a1 + 32);
    id v45 = *(id *)(a1 + 48);
    dispatch_after(v26, v27, block);
  }
  else
  {
    uint64_t v28 = *(void *)(a1 + 96);
    if (v28) {
      (*(void (**)(uint64_t, void, void))(v28 + 16))(v28, *(void *)(a1 + 32), *(void *)(a1 + 48));
    }
  }
  id v29 = *(void **)(a1 + 72);
  if (v29)
  {
    uint64_t v30 = *(void *)(a1 + 80);
    if (v30) {
      [v29 _visionKitAnalyticsEventDidOccur:v30 imageAnalyzer:*(void *)(a1 + 88)];
    }
  }
  if (*(void *)(a1 + 80))
  {
    id v31 = [*(id *)(a1 + 88) analyticsProcessor];
    [v31 processAndSendEvent:*(void *)(a1 + 80)];
  }
}

uint64_t __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_77(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSinceDate:a1[4]];
  uint64_t v4 = v3;

  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[9];
    uint64_t v7 = a1[10];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[11];
    uint64_t v10 = a1[12];
    int v12 = 134219266;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v4;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Per internal settings toggle, added random delay of %f, with min of %f, and max of %f for request completion callback for request: %@. \nUndelayed Analysis duration: %f.\nTotal duration: %f", (uint8_t *)&v12, 0x3Eu);
  }

  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], a1[7]);
  }
  return result;
}

void __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_79(id *a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained realCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2_80;
    block[3] = &unk_1E6BF0BD8;
    v9[1] = *(id *)&a2;
    objc_copyWeak(v9, a1 + 6);
    id v8 = a1[4];
    dispatch_async(v6, block);

    objc_destroyWeak(v9);
  }
}

uint64_t __70__VKCImageAnalyzer__processRequest_progressHandler_completionHandler___block_invoke_2_80(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = [WeakRetained requestID];
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_INFO, "Reporting progress: %f for Request id: %d", (uint8_t *)&v6, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(*(double *)(a1 + 48));
  }
  return result;
}

- (void)_forceInProcessAnalysis
{
  [(VKCImageAnalyzer *)self cancelAllRequests];
  uint64_t v3 = +[VKImageAnalyzerInProcessMadInterface sharedInterface];
  mad = self->_mad;
  self->_mad = v3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BOOL)createFeedbackProviders
{
  return self->_createFeedbackProviders;
}

- (void)setCreateFeedbackProviders:(BOOL)a3
{
  self->_createFeedbackProviders = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (VKImageAnalyzerMadInterface)mad
{
  return self->_mad;
}

- (void)setMad:(id)a3
{
}

- (VKAnalyzerAnalyticsDelegate)_analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__analyticsDelegate);
  return (VKAnalyzerAnalyticsDelegate *)WeakRetained;
}

- (void)set_analyticsDelegate:(id)a3
{
}

- (VKAnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
}

- (BOOL)_isPublicAPI
{
  return self->__isPublicAPI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_destroyWeak((id *)&self->__analyticsDelegate);
  objc_storeStrong((id *)&self->_mad, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_59_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end