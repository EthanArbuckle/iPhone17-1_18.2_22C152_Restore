@interface PXStoryDisplayAssetResourcePreloadingOperation
- (NSError)error;
- (PXDisplayAsset)displayAsset;
- (PXMediaProvider)mediaProvider;
- (PXStoryDisplayAssetResourcePreloadingOperation)init;
- (PXStoryDisplayAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4;
- (PXStoryResource)resource;
- (double)startTime;
- (id)progressHandler;
- (void)px_finishIfPossible;
- (void)px_start;
- (void)setError:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation PXStoryDisplayAssetResourcePreloadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- (void)px_finishIfPossible
{
  v3 = +[PXStorySettings sharedInstance];
  double v4 = 0.0;
  if ([v3 simulateSlowResourcesBuffering]
    && ([(PXStoryDisplayAssetResourcePreloadingOperation *)self isCancelled] & 1) == 0)
  {
    [v3 simulatedSlowResourcesBufferingDelay];
    double v4 = v5;
  }
  if ([v3 exaggerateResourceDownloadTimes])
  {
    [(PXStoryDisplayAssetResourcePreloadingOperation *)self startTime];
    if (v6 > 0.0 && ([(PXStoryDisplayAssetResourcePreloadingOperation *)self isCancelled] & 1) == 0)
    {
      mach_absolute_time();
      [(PXStoryDisplayAssetResourcePreloadingOperation *)self startTime];
      PXTimebaseConversionFactor();
    }
  }
  if (v4 <= 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
    [(PXAsyncOperation *)&v8 px_finishIfPossible];
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PXStoryDisplayAssetResourcePreloadingOperation_px_finishIfPossible__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

id __69__PXStoryDisplayAssetResourcePreloadingOperation_px_finishIfPossible__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
  return objc_msgSendSuper2(&v2, sel_px_finishIfPossible);
}

- (void)px_start
{
  double v3 = (double)mach_absolute_time();
  [(PXStoryDisplayAssetResourcePreloadingOperation *)self setStartTime:v3];
}

- (PXStoryDisplayAssetResourcePreloadingOperation)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDisplayAssetResourcePreloadingOperation.m", 40, @"%s is not available as initializer", "-[PXStoryDisplayAssetResourcePreloadingOperation init]");

  abort();
}

- (PXStoryDisplayAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryDisplayAssetResourcePreloadingOperation;
  v10 = [(PXAsyncOperation *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resource, a3);
    objc_storeStrong((id *)&v11->_mediaProvider, a4);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v11, @"PXStoryDisplayAssetResourcePreloadingOperation.m", 33, @"Only resources that have px_storyResourceDisplayAsset property (like PXStoryDisplayAssetResource, PXStoryFrameFillingEffectResource) are supported" object file lineNumber description];

      abort();
    }
    uint64_t v12 = objc_msgSend(v8, "px_storyResourceDisplayAsset");
    displayAsset = v11->_displayAsset;
    v11->_displayAsset = (PXDisplayAsset *)v12;
  }
  return v11;
}

@end