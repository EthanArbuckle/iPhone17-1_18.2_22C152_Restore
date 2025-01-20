@interface PUOneUpVisualImageAnalyzingController
+ (BOOL)canPerformAnalysisWithEnabled:(BOOL)a3 browsingViewModel:(id)a4 assetViewModel:(id)a5;
+ (void)_clearImageAnalysisFromAssetViewModel:(id)a3;
+ (void)_setVisualImageAnalysis:(id)a3 forAssetViewModel:(id)a4;
- (BOOL)canPerformAnalysis;
- (BOOL)isEnabled;
- (OS_dispatch_queue)loadVideoFrameQueue;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PUOneUpVisualImageAnalyzingController)init;
- (PUOneUpVisualImageAnalyzingController)initWithBrowsingViewModel:(id)a3;
- (PXUpdater)updater;
- (PXVisualIntelligenceManager)visualImageManager;
- (int)currentAnalysisRequestID;
- (int64_t)videoFrameRequestID;
- (void)_cancelCurrentAnalysis;
- (void)_cancelVKImageAnalysisForAssetViewModel:(id)a3;
- (void)_discardCurrentAnalysis;
- (void)_handleAnalysisResult:(id)a3 error:(id)a4 forAssetViewModel:(id)a5 requestID:(int)a6;
- (void)_handleAssetViewModelChange:(id)a3;
- (void)_handleBrowsingViewModelChange:(id)a3;
- (void)_handleVideoFrameImage:(id)a3 pixelBufferRef:(__CVBuffer *)a4 preferredTransform:(CGAffineTransform *)a5 forAssetViewModel:(id)a6 requestID:(int64_t)a7;
- (void)_invalidateAnalysisSuspended;
- (void)_invalidateAssetViewModel;
- (void)_invalidateCanPerformAnalysis;
- (void)_invalidateCurrentAnalysis;
- (void)_requestAnalysisForVideoFrameOfAssetViewModel:(id)a3 asset:(id)a4 playerLayer:(id)a5 preferredTransform:(CGAffineTransform *)a6;
- (void)_requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:(id)a3;
- (void)_requestVKImageAnalysisForAssetViewModel:(id)a3;
- (void)_setNeedsUpdate;
- (void)_updateAnalysisSuspended;
- (void)_updateAssetViewModel;
- (void)_updateCanPerformAnalysis;
- (void)_updateCurrentAnalysis;
- (void)setAssetViewModel:(id)a3;
- (void)setCanPerformAnalysis:(BOOL)a3;
- (void)setCurrentAnalysisRequestID:(int)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setVideoFrameRequestID:(int64_t)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpVisualImageAnalyzingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadVideoFrameQueue, 0);
  objc_storeStrong((id *)&self->_visualImageManager, 0);

  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)setVideoFrameRequestID:(int64_t)a3
{
  self->_videoFrameRequestID = a3;
}

- (int64_t)videoFrameRequestID
{
  return self->_videoFrameRequestID;
}

- (void)setCurrentAnalysisRequestID:(int)a3
{
  self->_currentAnalysisRequestID = a3;
}

- (int)currentAnalysisRequestID
{
  return self->_currentAnalysisRequestID;
}

- (BOOL)canPerformAnalysis
{
  return self->_canPerformAnalysis;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (OS_dispatch_queue)loadVideoFrameQueue
{
  return self->_loadVideoFrameQueue;
}

- (PXVisualIntelligenceManager)visualImageManager
{
  return self->_visualImageManager;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)_cancelVKImageAnalysisForAssetViewModel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 visualIntelligenceAnalyzeRequestID])
  {
    v6 = [(PUOneUpVisualImageAnalyzingController *)self visualImageManager];
    objc_msgSend(v6, "cancelRequestByID:", objc_msgSend(v5, "visualIntelligenceAnalyzeRequestID"));

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__PUOneUpVisualImageAnalyzingController__cancelVKImageAnalysisForAssetViewModel___block_invoke;
    v7[3] = &unk_1E5F2ED10;
    id v8 = v5;
    [v8 performChanges:v7];
  }
}

uint64_t __81__PUOneUpVisualImageAnalyzingController__cancelVKImageAnalysisForAssetViewModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisualIntelligenceAnalyzeRequestID:0];
}

- (void)_handleAnalysisResult:(id)a3 error:(id)a4 forAssetViewModel:(id)a5 requestID:(int)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    id v12 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
    if (v12 == v11)
    {
      int v13 = [(PUOneUpVisualImageAnalyzingController *)self currentAnalysisRequestID];

      if (v13 == a6) {
        +[PUOneUpVisualImageAnalyzingController _setVisualImageAnalysis:v14 forAssetViewModel:v11];
      }
    }
    else
    {
    }
  }
}

- (void)_handleVideoFrameImage:(id)a3 pixelBufferRef:(__CVBuffer *)a4 preferredTransform:(CGAffineTransform *)a5 forAssetViewModel:(id)a6 requestID:(int64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
  if (v14 == v13)
  {
    int64_t v15 = [(PUOneUpVisualImageAnalyzingController *)self videoFrameRequestID];

    if (v15 == a7)
    {
      objc_initWeak(&location, v13);
      objc_initWeak(&from, self);
      v16 = [v13 asset];
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      int v34 = 0;
      v17 = [(PUOneUpVisualImageAnalyzingController *)self visualImageManager];
      long long v18 = *(_OWORD *)&a5->c;
      long long v28 = *(_OWORD *)&a5->a;
      long long v29 = v18;
      long long v30 = *(_OWORD *)&a5->tx;
      uint64_t v19 = PXVKImageOrientationFromPreferredTransform();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke;
      v25[3] = &unk_1E5F221C0;
      objc_copyWeak(&v26, &from);
      objc_copyWeak(&v27, &location);
      int v20 = [v17 requestVKImageAnalysisForAsset:v16 pixelBuffer:a4 orientation:v19 resultHandler:v25];

      int v34 = v20;
      [(PUOneUpVisualImageAnalyzingController *)self setCurrentAnalysisRequestID:*((unsigned int *)v32 + 6)];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_3;
      v21[3] = &unk_1E5F2E0D0;
      id v22 = v13;
      v24 = &v31;
      id v23 = v12;
      [v22 performChanges:v21];

      _Block_object_dispose(&v31, 8);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v9 = v7;
  id v10 = v8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  int v13 = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v11);
}

uint64_t __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisualIntelligenceAnalyzeRequestID:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setBestImage:v3];
}

void __126__PUOneUpVisualImageAnalyzingController__handleVideoFrameImage_pixelBufferRef_preferredTransform_forAssetViewModel_requestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAnalysisResult:v2 error:v3 forAssetViewModel:v4 requestID:*(unsigned int *)(a1 + 64)];
}

- (void)_requestAnalysisForVideoFrameOfAssetViewModel:(id)a3 asset:(id)a4 playerLayer:(id)a5 preferredTransform:(CGAffineTransform *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10 && v11)
  {
    [(PUOneUpVisualImageAnalyzingController *)self setVideoFrameRequestID:[(PUOneUpVisualImageAnalyzingController *)self videoFrameRequestID] + 1];
    int64_t v13 = [(PUOneUpVisualImageAnalyzingController *)self videoFrameRequestID];
    if (v12 && (int64_t v14 = v13, (v15 = (__CVBuffer *)[v12 copyDisplayedPixelBuffer]) != 0))
    {
      v16 = v15;
      CGImageRef imageOut = 0;
      VTCreateCGImageFromCVPixelBuffer(v15, 0, &imageOut);
      if (imageOut)
      {
        long long v17 = *(_OWORD *)&a6->c;
        *(_OWORD *)buf = *(_OWORD *)&a6->a;
        *(_OWORD *)&buf[16] = v17;
        long long v29 = *(_OWORD *)&a6->tx;
        long long v18 = [MEMORY[0x1E4FB1818] imageWithCGImage:imageOut scale:PXVKImageOrientationFromPreferredTransform() orientation:1.0];
        CGImageRelease(imageOut);
        CGImageRef imageOut = 0;
      }
      else
      {
        long long v18 = 0;
      }
      objc_initWeak((id *)buf, self);
      objc_copyWeak(v22, (id *)buf);
      uint64_t v19 = v18;
      v22[1] = v16;
      long long v20 = *(_OWORD *)&a6->c;
      long long v23 = *(_OWORD *)&a6->a;
      long long v24 = v20;
      long long v25 = *(_OWORD *)&a6->tx;
      id v21 = v10;
      int64_t v26 = v14;
      px_dispatch_on_main_queue();

      objc_destroyWeak(v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v19 = PLVisualIntelligenceGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Unable to produce analysis for video frame of asset: %@, playerLayer: %@", buf, 0x16u);
      }
    }
  }
}

void __124__PUOneUpVisualImageAnalyzingController__requestAnalysisForVideoFrameOfAssetViewModel_asset_playerLayer_preferredTransform___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 112);
  long long v7 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 96);
  [WeakRetained _handleVideoFrameImage:v4 pixelBufferRef:v3 preferredTransform:v8 forAssetViewModel:v5 requestID:v6];

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
}

- (void)_requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUOneUpVisualImageAnalyzingController.m", 287, @"Invalid parameter not satisfying: %@", @"assetViewModel != nil" object file lineNumber description];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 videoPlayer];
  long long v7 = [v6 videoSession];
  id v8 = v7;
  if (v7)
  {
    [v7 preferredTransform];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }

  id v9 = [v5 primaryVideoLayerSource];
  id v10 = [v9 playerLayer];

  id v11 = [v5 asset];
  [(id)objc_opt_class() _clearImageAnalysisFromAssetViewModel:v5];
  objc_initWeak(&location, v5);
  objc_initWeak(&from, self);
  id v12 = [(PUOneUpVisualImageAnalyzingController *)self loadVideoFrameQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel___block_invoke;
  block[3] = &unk_1E5F22148;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  id v17 = v11;
  id v18 = v10;
  long long v21 = v26;
  long long v22 = v27;
  long long v23 = v28;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __101__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a1 + 96);
  [WeakRetained _requestAnalysisForVideoFrameOfAssetViewModel:v3 asset:v4 playerLayer:v5 preferredTransform:v7];
}

- (void)_requestVKImageAnalysisForAssetViewModel:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUOneUpVisualImageAnalyzingController.m", 250, @"Invalid parameter not satisfying: %@", @"assetViewModel != nil" object file lineNumber description];
  }
  long long v6 = [v5 visualImageAnalysis];

  if (!v6)
  {
    long long v7 = [v5 asset];
    uint64_t v8 = [v7 playbackStyle];

    if (v8 == 4)
    {
      [(PUOneUpVisualImageAnalyzingController *)self _requestVKImageAnalysisByCurrentVideoFrameForAssetViewModel:v5];
    }
    else
    {
      objc_initWeak(&location, v5);
      id v9 = [(PUOneUpVisualImageAnalyzingController *)self visualImageManager];
      id v10 = [v5 asset];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke;
      v16[3] = &unk_1E5F22120;
      objc_copyWeak(&v17, &location);
      int v11 = [v9 requestVKImageAnalysisForAsset:v10 resultHandler:v16];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_4;
      v13[3] = &unk_1E5F244A0;
      id v14 = v5;
      int v15 = v11;
      [v14 performChanges:v13];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  int v11 = a2;
  id v9 = v7;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

uint64_t __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisualIntelligenceAnalyzeRequestID:*(unsigned int *)(a1 + 40)];
}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained visualIntelligenceAnalyzeRequestID];
  int v5 = *(_DWORD *)(a1 + 48);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_3;
    _OWORD v7[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 performChanges:v7];

    objc_destroyWeak(&v9);
  }
}

void __82__PUOneUpVisualImageAnalyzingController__requestVKImageAnalysisForAssetViewModel___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setVisualImageAnalysis:v2];

  BOOL v5 = *(void *)(a1 + 32) == 0;
  id v6 = objc_loadWeakRetained(v3);
  [v6 setHasVisualAnalysisFailed:v5];

  id v7 = objc_loadWeakRetained(v3);
  [v7 setVisualIntelligenceAnalyzeRequestID:0];
}

- (void)_handleAssetViewModelChange:(id)a3
{
  id v11 = a3;
  if ([v11 assetContentChanged]) {
    [(PUOneUpVisualImageAnalyzingController *)self _discardCurrentAnalysis];
  }
  if (([v11 focusValueChanged] & 1) != 0
    || ([v11 videoPlayerDidChange] & 1) != 0
    || ([v11 assetChanged] & 1) != 0
    || [v11 visualImageAnalysisChanged])
  {
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCanPerformAnalysis];
  }
  else
  {
    int v4 = [v11 videoPlayerChange];

    if (v4)
    {
      BOOL v5 = [v11 videoPlayerChange];
      if ([v5 desiredPlayStateDidChange])
      {
        [(PUOneUpVisualImageAnalyzingController *)self _invalidateCanPerformAnalysis];
        id v6 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
        id v7 = [v6 videoPlayer];
        int v8 = [v7 isPlaybackDesired];

        if (v8)
        {
          id v9 = objc_opt_class();
          id v10 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
          [v9 _clearImageAnalysisFromAssetViewModel:v10];
        }
      }
    }
  }
}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  id v8 = a3;
  if (([v8 isScrollingDidChange] & 1) != 0
    || ([v8 isScrubbingDidChange] & 1) != 0
    || [v8 livePhotoShouldPlayDidChange])
  {
    goto LABEL_7;
  }
  if (![v8 isInteractingWithVideoScrubberDidChange]) {
    goto LABEL_8;
  }
  int v4 = [(PUOneUpVisualImageAnalyzingController *)self browsingViewModel];
  int v5 = [v4 isInteractingWithVideoScrubber];

  if (!v5)
  {
LABEL_7:
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCanPerformAnalysis];
  }
  else
  {
    id v6 = objc_opt_class();
    id v7 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
    [v6 _clearImageAnalysisFromAssetViewModel:v7];
  }
LABEL_8:
  if ([v8 currentAssetDidChange]) {
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateAssetViewModel];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUOneUpVisualImageAnalyzingController *)self browsingViewModel];

  if (v7 == v9)
  {
    [(PUOneUpVisualImageAnalyzingController *)self _handleBrowsingViewModelChange:v6];
  }
  else
  {
    id v8 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];

    if (v8 == v9) {
      [(PUOneUpVisualImageAnalyzingController *)self _handleAssetViewModelChange:v6];
    }
  }
}

- (void)_updateAnalysisSuspended
{
  id v5 = [(PUOneUpVisualImageAnalyzingController *)self browsingViewModel];
  if (([v5 isScrubbing] & 1) != 0
    || ([v5 livePhotoShouldPlay] & 1) != 0
    || ([v5 isScrolling] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [(PUOneUpVisualImageAnalyzingController *)self isEnabled] ^ 1;
  }
  int v4 = [(PUOneUpVisualImageAnalyzingController *)self visualImageManager];
  [v4 setAnalysisSuspended:v3];
}

- (void)_invalidateAnalysisSuspended
{
  id v2 = [(PUOneUpVisualImageAnalyzingController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAnalysisSuspended];
}

- (void)_updateCurrentAnalysis
{
  if ([(PUOneUpVisualImageAnalyzingController *)self canPerformAnalysis]
    && ![(PUOneUpVisualImageAnalyzingController *)self currentAnalysisRequestID])
  {
    id v3 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
    [(PUOneUpVisualImageAnalyzingController *)self _requestVKImageAnalysisForAssetViewModel:v3];
  }
}

- (void)_discardCurrentAnalysis
{
  id v3 = objc_opt_class();
  int v4 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
  [v3 _clearImageAnalysisFromAssetViewModel:v4];

  [(PUOneUpVisualImageAnalyzingController *)self _invalidateCurrentAnalysis];
}

- (void)_invalidateCurrentAnalysis
{
  [(PUOneUpVisualImageAnalyzingController *)self setCurrentAnalysisRequestID:0];
  id v3 = [(PUOneUpVisualImageAnalyzingController *)self updater];
  [v3 setNeedsUpdateOf:sel__updateCurrentAnalysis];
}

- (void)_updateCanPerformAnalysis
{
  id v3 = objc_opt_class();
  BOOL v4 = [(PUOneUpVisualImageAnalyzingController *)self isEnabled];
  id v6 = [(PUOneUpVisualImageAnalyzingController *)self browsingViewModel];
  id v5 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
  -[PUOneUpVisualImageAnalyzingController setCanPerformAnalysis:](self, "setCanPerformAnalysis:", [v3 canPerformAnalysisWithEnabled:v4 browsingViewModel:v6 assetViewModel:v5]);
}

- (void)_invalidateCanPerformAnalysis
{
  id v2 = [(PUOneUpVisualImageAnalyzingController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanPerformAnalysis];
}

- (void)_updateAssetViewModel
{
  id v4 = [(PUOneUpVisualImageAnalyzingController *)self browsingViewModel];
  id v3 = [v4 assetViewModelForCurrentAssetReference];
  [(PUOneUpVisualImageAnalyzingController *)self setAssetViewModel:v3];
}

- (void)_invalidateAssetViewModel
{
  id v2 = [(PUOneUpVisualImageAnalyzingController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetViewModel];
}

- (void)_cancelCurrentAnalysis
{
  id v3 = [(PUOneUpVisualImageAnalyzingController *)self assetViewModel];
  [(PUOneUpVisualImageAnalyzingController *)self _cancelVKImageAnalysisForAssetViewModel:v3];
}

- (void)_setNeedsUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUOneUpVisualImageAnalyzingController__setNeedsUpdate__block_invoke;
  block[3] = &unk_1E5F2ED10;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PUOneUpVisualImageAnalyzingController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 updateIfNeeded];
}

- (void)setCanPerformAnalysis:(BOOL)a3
{
  if (self->_canPerformAnalysis != a3)
  {
    self->_canPerformAnalysis = a3;
    if (!a3) {
      [(PUOneUpVisualImageAnalyzingController *)self _cancelCurrentAnalysis];
    }
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCurrentAnalysis];
  }
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  if (self->_assetViewModel != v5)
  {
    id v6 = v5;
    [(PUOneUpVisualImageAnalyzingController *)self _cancelCurrentAnalysis];
    [(PUAssetViewModel *)self->_assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCanPerformAnalysis];
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCurrentAnalysis];
    id v5 = v6;
  }
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateCanPerformAnalysis];
    [(PUOneUpVisualImageAnalyzingController *)self _invalidateAnalysisSuspended];
  }
}

- (PUOneUpVisualImageAnalyzingController)initWithBrowsingViewModel:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUOneUpVisualImageAnalyzingController.m", 44, @"Invalid parameter not satisfying: %@", @"browsingViewModel != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpVisualImageAnalyzingController;
  id v7 = [(PUOneUpVisualImageAnalyzingController *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateAssetViewModel needsUpdate:1];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateAnalysisSuspended needsUpdate:1];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateCanPerformAnalysis needsUpdate:1];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateCurrentAnalysis needsUpdate:1];
    v7->_isEnabled = 0;
    objc_storeStrong((id *)&v7->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)v7->_browsingViewModel registerChangeObserver:v7];
    uint64_t v10 = [MEMORY[0x1E4F908E8] sharedManager];
    visualImageManager = v7->_visualImageManager;
    v7->_visualImageManager = (PXVisualIntelligenceManager *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.1UpVisualImageAnalyzing.loadCurrentVideoFrame", v12);
    loadVideoFrameQueue = v7->_loadVideoFrameQueue;
    v7->_loadVideoFrameQueue = (OS_dispatch_queue *)v13;

    PXVKSetUpResourcePurgingWhenApplicationIsHidden();
  }

  return v7;
}

- (PUOneUpVisualImageAnalyzingController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpVisualImageAnalyzingController.m", 40, @"%s is not available as initializer", "-[PUOneUpVisualImageAnalyzingController init]");

  abort();
}

+ (void)_setVisualImageAnalysis:(id)a3 forAssetViewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUOneUpVisualImageAnalyzingController.m", 370, @"%s must be called on the main thread", "+[PUOneUpVisualImageAnalyzingController _setVisualImageAnalysis:forAssetViewModel:]");
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PUOneUpVisualImageAnalyzingController__setVisualImageAnalysis_forAssetViewModel___block_invoke;
  v12[3] = &unk_1E5F2ECC8;
  id v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  [v10 performChanges:v12];
}

uint64_t __83__PUOneUpVisualImageAnalyzingController__setVisualImageAnalysis_forAssetViewModel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasVisualAnalysisFailed:*(void *)(a1 + 40) == 0];
  [*(id *)(a1 + 32) setVisualImageAnalysis:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setVisualIntelligenceAnalyzeRequestID:0];
}

+ (void)_clearImageAnalysisFromAssetViewModel:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PUOneUpVisualImageAnalyzingController__clearImageAnalysisFromAssetViewModel___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __79__PUOneUpVisualImageAnalyzingController__clearImageAnalysisFromAssetViewModel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisualImageAnalysis:0];
  [*(id *)(a1 + 32) setHasVisualAnalysisFailed:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setVisualIntelligenceAnalyzeRequestID:0];
}

+ (BOOL)canPerformAnalysisWithEnabled:(BOOL)a3 browsingViewModel:(id)a4 assetViewModel:(id)a5
{
  int v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v6)
  {
    if ([v7 isScrolling])
    {
LABEL_3:
      LOBYTE(v6) = 0;
      goto LABEL_4;
    }
    char v10 = [v7 isScrubbing];
    LOBYTE(v6) = 0;
    if (v8 && (v10 & 1) == 0)
    {
      id v11 = [v8 asset];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_3;
      }
      [v8 focusValue];
      if (fabs(v13) > 1.0) {
        goto LABEL_3;
      }
      id v14 = [v8 visualImageAnalysis];

      if (v14) {
        goto LABEL_3;
      }
      int v15 = [v8 asset];
      uint64_t v16 = [v15 playbackStyle];

      if (v16 == 4)
      {
        objc_super v17 = [v8 videoPlayer];
        char v18 = [v17 isPlaybackDesired];

        if ((v18 & 1) != 0
          || ![v8 isFullyInFocus]
          || ([v7 isInteractingWithVideoScrubber] & 1) != 0)
        {
          goto LABEL_3;
        }
      }
      else
      {
        id v19 = (void *)MEMORY[0x1E4F908E8];
        id v20 = [v8 asset];
        int v6 = [v19 canRequestVKImageAnalysisForAsset:v20];

        if (!v6) {
          goto LABEL_4;
        }
      }
      LOBYTE(v6) = 1;
    }
  }
LABEL_4:

  return v6;
}

@end