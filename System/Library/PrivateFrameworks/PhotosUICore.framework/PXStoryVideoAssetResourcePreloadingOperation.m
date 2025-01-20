@interface PXStoryVideoAssetResourcePreloadingOperation
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)downloadTimeRange;
- (BOOL)isExporting;
- (BOOL)isInline;
- (PXStoryVideoAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4;
- (PXStoryVideoAssetResourcePreloadingOperation)initWithVideoAssetResource:(id)a3 mediaProvider:(id)a4 downloadTimeRange:(id *)a5 videoSessionManager:(id)a6 isExporting:(BOOL)a7 isInline:(BOOL)a8;
- (PXVideoContentProvider)videoContentProvider;
- (PXVideoSessionManager)videoSessionManager;
- (id)diagnosticDescription;
- (void)cancel;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)px_start;
- (void)setVideoContentProvider:(id)a3;
@end

@implementation PXStoryVideoAssetResourcePreloadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContentProvider, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (void)setVideoContentProvider:(id)a3
{
}

- (PXVideoContentProvider)videoContentProvider
{
  return (PXVideoContentProvider *)objc_getProperty(self, a2, 320, 1);
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)downloadTimeRange
{
  long long v3 = *(_OWORD *)&self[7].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var1.var0;
  return self;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)VideoContentProviderObservationContext == a5)
  {
    id v14 = v8;
    if ((v6 & 2) != 0)
    {
      v9 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self progressHandler];
      if (v9)
      {
        v10 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoContentProvider];
        [v10 loadingProgress];
        v9[2](v9, 0);
      }
      id v8 = v14;
    }
    if (v6)
    {
      v11 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoContentProvider];
      v12 = [v11 loadingResult];

      if (v12)
      {
        v13 = [v12 error];
        [(PXStoryDisplayAssetResourcePreloadingOperation *)self setError:v13];

        [(PXStoryDisplayAssetResourcePreloadingOperation *)self px_finishIfPossible];
      }

      id v8 = v14;
    }
  }
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  [(PXAsyncOperation *)&v5 cancel];
  long long v3 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoContentProvider];
  [v3 unregisterChangeObserver:self context:VideoContentProviderObservationContext];

  v4 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoContentProvider];
  [v4 cancelLoading];
}

- (void)px_start
{
  v28.receiver = self;
  v28.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  [(PXStoryDisplayAssetResourcePreloadingOperation *)&v28 px_start];
  long long v3 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  if ([(PXStoryVideoAssetResourcePreloadingOperation *)self isExporting])
  {
    v4 = +[PXStorySettings sharedInstance];
    uint64_t v5 = [v4 exportVideoQuality];

    [(PXStoryVideoAssetResourcePreloadingOperation *)self downloadTimeRange];
    [(PXVideoSessionManagerDisplayAssetOptions *)v3 addContentDeliveryStrategyWithDeliveryQuality:v5 segmentTimeRange:v27 streamingAllowed:0];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v24 = *MEMORY[0x1E4F1FA20];
    long long v25 = v6;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    v7 = v3;
    uint64_t v8 = v5;
  }
  else
  {
    [(PXStoryVideoAssetResourcePreloadingOperation *)self downloadTimeRange];
    [(PXVideoSessionManagerDisplayAssetOptions *)v3 addContentDeliveryStrategyWithDeliveryQuality:2 segmentTimeRange:v23 streamingAllowed:0 networkAccessAllowed:0];
    v9 = +[PXStorySettings sharedInstance];
    uint64_t v10 = [v9 videoQuality];

    [(PXStoryVideoAssetResourcePreloadingOperation *)self downloadTimeRange];
    [(PXVideoSessionManagerDisplayAssetOptions *)v3 addContentDeliveryStrategyWithDeliveryQuality:v10 segmentTimeRange:&v22 streamingAllowed:0];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v24 = *MEMORY[0x1E4F1FA20];
    long long v25 = v11;
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    v7 = v3;
    uint64_t v8 = 3;
  }
  [(PXVideoSessionManagerDisplayAssetOptions *)v7 addContentDeliveryStrategyWithDeliveryQuality:v8 segmentTimeRange:&v24 streamingAllowed:0];
  v12 = +[PXStorySettings sharedInstance];
  int v13 = [v12 videoInlineStabilization];

  if (v13
    && ([(PXStoryDisplayAssetResourcePreloadingOperation *)self displayAsset],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 playbackStyle],
        v14,
        v15 == 3))
  {
    [(PXVideoSessionManagerDisplayAssetOptions *)v3 setShouldStabilizeLivePhotosIfPossible:1];
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 1;
  }
  v17 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoSessionManager];
  v18 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self displayAsset];
  v19 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self mediaProvider];
  v20 = [v17 contentProviderForAsset:v18 withOptions:v3 mediaProvider:v19 requestURLOnly:v16];

  [(PXStoryVideoAssetResourcePreloadingOperation *)self setVideoContentProvider:v20];
  [v20 registerChangeObserver:self context:VideoContentProviderObservationContext];
  if ([(PXStoryVideoAssetResourcePreloadingOperation *)self isInline]) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 1;
  }
  [v20 beginLoadingWithPriority:v21];
}

- (id)diagnosticDescription
{
  long long v3 = NSString;
  v4 = [(PXStoryDisplayAssetResourcePreloadingOperation *)self displayAsset];
  uint64_t v5 = [v4 uuid];
  [(PXStoryVideoAssetResourcePreloadingOperation *)self downloadTimeRange];
  long long v6 = PXCMTimeRangeDescription((uint64_t)v11);
  v7 = [(PXStoryVideoAssetResourcePreloadingOperation *)self videoContentProvider];
  [v7 loadingProgress];
  v9 = [v3 stringWithFormat:@"Video %@, time range %@ – %.0f%%", v5, v6, v8 * 100.0];

  return v9;
}

- (PXStoryVideoAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryVideoAssetResourcePreloadingOperation.m", 46, @"%s is not available as initializer", "-[PXStoryVideoAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:]");

  abort();
}

- (PXStoryVideoAssetResourcePreloadingOperation)initWithVideoAssetResource:(id)a3 mediaProvider:(id)a4 downloadTimeRange:(id *)a5 videoSessionManager:(id)a6 isExporting:(BOOL)a7 isInline:(BOOL)a8
{
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  uint64_t v16 = [(PXStoryDisplayAssetResourcePreloadingOperation *)&v21 initWithDisplayAssetResource:a3 mediaProvider:a4];
  v17 = (PXStoryVideoAssetResourcePreloadingOperation *)v16;
  if (v16)
  {
    long long v19 = *(_OWORD *)&a5->var0.var3;
    long long v18 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)(v16 + 328) = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)(v16 + 344) = v19;
    *(_OWORD *)(v16 + 360) = v18;
    objc_storeStrong((id *)v16 + 39, a6);
    v17->_isExporting = a7;
    v17->_isInline = a8;
  }

  return v17;
}

@end