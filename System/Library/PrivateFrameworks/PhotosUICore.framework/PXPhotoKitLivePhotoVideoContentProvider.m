@interface PXPhotoKitLivePhotoVideoContentProvider
+ (NSOperationQueue)postProcessingOperationQueue;
- (BOOL)needsPostprocessing;
- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7;
- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8;
- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 spec:(id)a7 resourceReclamationController:(id)a8;
- (void)_handleStabilizeOperationFinishedWithProcessingCompletionHandler:(id)a3;
- (void)cancelLoading;
- (void)dealloc;
- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXPhotoKitLivePhotoVideoContentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilizeOperation, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)cancelLoading
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  [(PXDisplayAssetVideoContentProvider *)&v3 cancelLoading];
  [(PXVideoStabilizeOperation *)self->_stabilizeOperation cancel];
}

- (void)dealloc
{
  [(PXVideoStabilizeOperation *)self->_stabilizeOperation cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  [(PXPhotoKitLivePhotoVideoContentProvider *)&v3 dealloc];
}

- (void)_handleStabilizeOperationFinishedWithProcessingCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  if ([(PXVideoStabilizeOperation *)self->_stabilizeOperation isFinished])
  {
    v5 = [(PXVideoProcessingOperation *)self->_stabilizeOperation result];
    v6 = [v5 outputVideoAsset];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F16620]);
      v8 = [v5 outputVideoAsset];
      v9 = (void *)[v7 initWithAsset:v8];

      v10 = [v5 outputVideoComposition];
      [v9 setVideoComposition:v10];

      v11 = [v5 outputAudioMix];
      [v9 setAudioMix:v11];

      v12 = NSString;
      v13 = PXVideoStabilizeAnalysisTypeDescription([v5 analysisType]);
      v14 = [v12 stringWithFormat:@"Processed: [%@]", v13];

      v4[2](v4, v9, v14);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v19 = [(PXVideoProcessingOperation *)self->_stabilizeOperation result];
        v20 = [v19 error];
        *(_DWORD *)buf = 138412546;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v20;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ failed to create stabilized video player item with error %@", buf, 0x16u);
      }
      v15 = (void *)MEMORY[0x1E4F166C8];
      v16 = [(PXVideoProcessingOperation *)self->_stabilizeOperation spec];
      v17 = [v16 inputVideoURL];
      v9 = [v15 assetWithURL:v17];

      v14 = (void *)[objc_alloc(MEMORY[0x1E4F16620]) initWithAsset:v9];
      v4[2](v4, v14, @"Processed: Unstabilized Loop");
    }
  }
  stabilizeOperation = self->_stabilizeOperation;
  self->_stabilizeOperation = 0;
}

- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v30 = [(PXDisplayAssetVideoContentProvider *)self asset];
    v10 = [v6 asset];
    v11 = [v10 URL];

    v12 = +[PXInlineVideoStabilizationSettings sharedInstance];
    int v13 = [v12 useMediaAnalysisRecipe];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F8CC38];
      v15 = [v6 asset];
      v16 = [v14 tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v15];
      v17 = [v16 firstObject];
      [v17 naturalSize];
      double v19 = v18;
      double v21 = v20;

      v22 = -[PXMediaAnalysisVideoStabilizationRecipeSource initWithAsset:videoDimensions:]([PXMediaAnalysisVideoStabilizationRecipeSource alloc], "initWithAsset:videoDimensions:", v30, v19, v21);
    }
    else
    {
      v22 = [[PXURLVideoStabilizationRecipeSource alloc] initWithVideoURL:v11];
    }
    __int16 v23 = v22;
    v24 = self->_spec;
    uint64_t v25 = objc_alloc_init(PXVideoStabilizeOperationSpec);
    [(PXVideoProcessingOperationSpec *)v25 setInputVideoURL:v11];
    if (v24)
    {
      [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v24 loopStartTime];
      long long v44 = v46;
      uint64_t v45 = v47;
      [(PXVideoStabilizeOperationSpec *)v25 setStartTime:&v44];
      [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v24 loopTimeRange];
      long long v38 = v41;
      long long v39 = v42;
      long long v40 = v43;
      [(PXVideoStabilizeOperationSpec *)v25 setTimeRange:&v38];
      [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v24 crossfadeDuration];
    }
    else
    {
      long long v46 = 0uLL;
      uint64_t v47 = 0;
      uint64_t v45 = 0;
      long long v44 = 0uLL;
      [(PXVideoStabilizeOperationSpec *)v25 setStartTime:&v44];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      [(PXVideoStabilizeOperationSpec *)v25 setTimeRange:&v38];
      long long v36 = 0uLL;
      uint64_t v37 = 0;
    }
    long long v34 = v36;
    uint64_t v35 = v37;
    [(PXVideoStabilizeOperationSpec *)v25 setCrossfadeDuration:&v34];
    [(PXVideoStabilizeOperationSpec *)v25 setRecipeSource:v23];
    [(PXVideoStabilizeOperationSpec *)v25 setPerformStabilization:[(PXPhotoKitLivePhotoVideoContentProviderSpec *)v24 stabilizeIfPossible]];
    [(PXVideoStabilizeOperationSpec *)v25 setWantsAudio:[(PXPhotoKitLivePhotoVideoContentProviderSpec *)v24 wantsAudio]];
    v26 = [[PXVideoStabilizeOperation alloc] initWithSpec:v25];
    stabilizeOperation = self->_stabilizeOperation;
    self->_stabilizeOperation = v26;

    objc_initWeak((id *)location, self);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __83__PXPhotoKitLivePhotoVideoContentProvider_postprocessPlayerItem_completionHandler___block_invoke;
    v31[3] = &unk_1E5DD1848;
    objc_copyWeak(&v33, (id *)location);
    id v32 = v7;
    [(PXVideoStabilizeOperation *)self->_stabilizeOperation setCompletionBlock:v31];
    v28 = [(id)objc_opt_class() postProcessingOperationQueue];
    [v28 addOperation:self->_stabilizeOperation];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v29 = [v6 asset];
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = self;
      __int16 v49 = 2112;
      v50 = v29;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Unable to post process Live Photo asset %@", location, 0x16u);
    }
    (*((void (**)(id, id, __CFString *))v7 + 2))(v7, v6, @"Processed: Unstabilized Loop");
  }
}

void __83__PXPhotoKitLivePhotoVideoContentProvider_postprocessPlayerItem_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleStabilizeOperationFinishedWithProcessingCompletionHandler:*(void *)(a1 + 32)];
}

- (BOOL)needsPostprocessing
{
  return self->_assetPlaybackStyle > 5uLL || (self->_assetPlaybackStyle & 0x3F) == 3;
}

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  double v19 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitVideoContentProvider.m", 133, @"%s is not available as initializer", "-[PXPhotoKitLivePhotoVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:]");

  abort();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = +[PXCuratedLibrarySettings sharedInstance];
  if (v7 == v9)
  {
    int v8 = [v6 isEqualToString:@"stabilizeLivePhotos"];

    if (v8) {
      [(PXDisplayAssetVideoContentProvider *)self reloadContent];
    }
  }
  else
  {
  }
}

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 spec:(id)a7 resourceReclamationController:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PXPhotoKitLivePhotoVideoContentProvider;
  id v16 = [(PXPhotoKitVideoContentProvider *)&v19 initWithAsset:v14 mediaProvider:a4 deliveryStrategies:a5 audioSession:a6 requestURLOnly:0 resourceReclamationController:a8];
  if (v16)
  {
    v16->_assetPlaybackStyle = [v14 playbackStyle];
    objc_storeStrong((id *)&v16->_spec, a7);
    id v17 = +[PXCuratedLibrarySettings sharedInstance];
    [v17 addDeferredKeyObserver:v16];
  }
  return v16;
}

- (PXPhotoKitLivePhotoVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = (objc_class *)MEMORY[0x1E4F8EB70];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  id v18 = [(PXPhotoKitLivePhotoVideoContentProvider *)self initWithAsset:v16 mediaProvider:v15 deliveryStrategies:v14 audioSession:v13 requestURLOnly:v7 resourceReclamationController:v17];

  return v18;
}

+ (NSOperationQueue)postProcessingOperationQueue
{
  if (postProcessingOperationQueue_onceToken != -1) {
    dispatch_once(&postProcessingOperationQueue_onceToken, &__block_literal_global_292369);
  }
  v2 = (void *)postProcessingOperationQueue_queue;
  return (NSOperationQueue *)v2;
}

uint64_t __71__PXPhotoKitLivePhotoVideoContentProvider_postProcessingOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)postProcessingOperationQueue_queue;
  postProcessingOperationQueue_queue = (uint64_t)v0;

  [(id)postProcessingOperationQueue_queue setQualityOfService:25];
  v2 = (void *)postProcessingOperationQueue_queue;
  return [v2 setMaxConcurrentOperationCount:1];
}

@end