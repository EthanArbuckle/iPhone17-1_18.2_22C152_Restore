@interface PLConstraintsDirector
- (PLConstraintsDirector)initWithPhotoLibraryURL:(id)a3;
- (void)_requestMediaAnalysisQuickFaceProcessing;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)informAssetDeferredProcessingOccurring;
- (void)informAssetsFinishedDeferredProcessing;
- (void)informPhotoCapturedThatNeedsDeferredProcessing;
- (void)informPhotoCapturedThatNeedsQuickFace;
@end

@implementation PLConstraintsDirector

- (void)cameraWatcherDidChangeState:(id)a3
{
  isolationQueue = self->_isolationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  char v6 = [v5 isCameraRunning];

  if ((v6 & 1) != 0 || self->_deferredProcessingOngoing || self->_outstandingCaptures != 1)
  {
    int64_t faceQuickClassificationRequestID = self->_faceQuickClassificationRequestID;
    int64_t v8 = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
    char v9 = v6 ^ 1;
    if (faceQuickClassificationRequestID == v8) {
      char v9 = 1;
    }
    if ((v9 & 1) == 0)
    {
      v10 = PLAssetAnalysisGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because Camera is active...", v13, 2u);
      }

      +[PLMediaAnalysisServiceRequestAdapter cancelRequest:self->_faceQuickClassificationRequestID];
      self->_int64_t faceQuickClassificationRequestID = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
      bonusTimer = self->_bonusTimer;
      if (bonusTimer)
      {
        dispatch_source_cancel(bonusTimer);
        v12 = self->_bonusTimer;
        self->_bonusTimer = 0;
      }
    }
  }
  else
  {
    [(PLConstraintsDirector *)self _requestMediaAnalysisQuickFaceProcessing];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_bonusTimer, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)informAssetDeferredProcessingOccurring
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PLConstraintsDirector_informAssetDeferredProcessingOccurring__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

int64_t __63__PLConstraintsDirector_informAssetDeferredProcessingOccurring__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  int64_t result = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
  if (v2 != result)
  {
    v4 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because deferred finalization started", v5, 2u);
    }

    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:*(void *)(*(void *)(a1 + 32) + 40)];
    int64_t result = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
    *(void *)(*(void *)(a1 + 32) + 40) = result;
  }
  return result;
}

- (void)informAssetsFinishedDeferredProcessing
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PLConstraintsDirector_informAssetsFinishedDeferredProcessing__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __63__PLConstraintsDirector_informAssetsFinishedDeferredProcessing__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 1;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isCameraRunning];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _requestMediaAnalysisQuickFaceProcessing];
  }
  return result;
}

- (void)informPhotoCapturedThatNeedsDeferredProcessing
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PLConstraintsDirector_informPhotoCapturedThatNeedsDeferredProcessing__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __71__PLConstraintsDirector_informPhotoCapturedThatNeedsDeferredProcessing__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 12) = 2;
  return result;
}

- (void)informPhotoCapturedThatNeedsQuickFace
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PLConstraintsDirector_informPhotoCapturedThatNeedsQuickFace__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __62__PLConstraintsDirector_informPhotoCapturedThatNeedsQuickFace__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_DWORD *)(v1 + 12)) {
    *(_DWORD *)(v1 + 12) = 1;
  }
  return result;
}

- (PLConstraintsDirector)initWithPhotoLibraryURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLConstraintsDirector;
  char v6 = [(PLConstraintsDirector *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = pl_dispatch_queue_create_with_fallback_qos();
    isolationQueue = v6->_isolationQueue;
    v6->_isolationQueue = (OS_dispatch_queue *)v8;

    v6->_outstandingCaptures = 0;
    objc_storeStrong((id *)&v6->_photoLibraryURL, a3);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:v6->_isolationQueue delegate:v6];
    cameraWatcher = v6->_cameraWatcher;
    v6->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v10;

    [(PFCameraViewfinderSessionWatcher *)v6->_cameraWatcher startWatching];
  }

  return v6;
}

- (void)_requestMediaAnalysisQuickFaceProcessing
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_outstandingCaptures = 0;
  if (self->_bonusTimer)
  {
    v3 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector skipping processing because timer is already set", buf, 2u);
    }
  }
  else
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    bonusTimer = self->_bonusTimer;
    self->_bonusTimer = v4;

    char v6 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector setting up bonus timer", buf, 2u);
    }

    v7 = self->_bonusTimer;
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v7, v8, 0x2540BE400uLL, 0x3B9ACA00uLL);
    char v9 = self->_bonusTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke;
    handler[3] = &unk_1E5875CE0;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    uint64_t v10 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "PLConstraintsDirector signaling mediaAnalysisService to do face quick classification...", buf, 2u);
    }

    photoLibraryURL = self->_photoLibraryURL;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_26;
    v12[3] = &unk_1E5873440;
    v12[4] = self;
    self->_int64_t faceQuickClassificationRequestID = +[PLMediaAnalysisServiceRequestAdapter requestQuickFaceIdentificationForPhotoLibraryURL:photoLibraryURL withOptions:MEMORY[0x1E4F1CC08] andCompletionHandler:v12];
    dispatch_resume((dispatch_object_t)self->_bonusTimer);
  }
}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector cancelling and nil-ing bonus timer", buf, 2u);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v5 == +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID])
  {
    char v6 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v7 = "PLConstraintsDirector detected bonus time has expired but mediaAnalysisService has already stopped face quick"
           " classification...";
      dispatch_time_t v8 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:*(void *)(*(void *)(a1 + 32) + 40)];
    *(void *)(*(void *)(a1 + 32) + 40) = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
    char v6 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      v7 = "PLConstraintsDirector cancelling mediaAnalysisService face quick classification because bonus time expired...";
      dispatch_time_t v8 = v10;
      goto LABEL_8;
    }
  }
}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_2;
  v7[3] = &unk_1E5875E18;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __65__PLConstraintsDirector__requestMediaAnalysisQuickFaceProcessing__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "PLConstraintsDirector received completion handler for quick face classification", (uint8_t *)&v8, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    id v3 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Error requesting quick face identification: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  *(void *)(*(void *)(a1 + 40) + 40) = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  if (v5)
  {
    dispatch_source_cancel(v5);
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;
  }
}

@end