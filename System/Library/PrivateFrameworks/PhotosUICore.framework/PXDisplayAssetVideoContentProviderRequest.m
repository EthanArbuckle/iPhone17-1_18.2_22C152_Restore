@interface PXDisplayAssetVideoContentProviderRequest
+ (id)startRequestWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9;
- (BOOL)_isTransientError:(id)a3;
- (BOOL)requestURLOnly;
- (NSArray)strategies;
- (OS_dispatch_queue)loadingQueue;
- (PXDisplayAsset)asset;
- (PXDisplayAssetVideoContentProviderRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9;
- (PXDisplayAssetVideoContentProviderRequestDelegate)delegate;
- (PXMediaProvider)mediaProvider;
- (double)loadingProgress;
- (int64_t)priority;
- (void)_handleLoadedPlayerItem:(id)a3 videoURL:(id)a4 info:(id)a5 strategyAtIndex:(int64_t)a6;
- (void)_handleLoadingProgress:(double)a3;
- (void)_loadMediaWithStrategyAtIndex:(int64_t)a3;
- (void)_start;
- (void)cancel;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation PXDisplayAssetVideoContentProviderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)setDelegate:(id)a3
{
}

- (PXDisplayAssetVideoContentProviderRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXDisplayAssetVideoContentProviderRequestDelegate *)WeakRetained;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (BOOL)requestURLOnly
{
  return self->_requestURLOnly;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSArray)strategies
{
  return self->_strategies;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (BOOL)_isTransientError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v6 && ([v4 code] == 4097 || objc_msgSend(v4, "code") == 4099))
  {
    BOOL v7 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = objc_msgSend(v4, "underlyingErrors", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([(PXDisplayAssetVideoContentProviderRequest *)self _isTransientError:*(void *)(*((void *)&v14 + 1) + 8 * i)])
          {
            BOOL v7 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 0;
LABEL_15:
  }
  return v7;
}

- (void)dealloc
{
  [(PXMediaProvider *)self->_mediaProvider cancelImageRequest:self->_requestID];
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetVideoContentProviderRequest;
  [(PXDisplayAssetVideoContentProviderRequest *)&v3 dealloc];
}

- (void)_handleLoadedPlayerItem:(id)a3 videoURL:(id)a4 info:(id)a5 strategyAtIndex:(int64_t)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  uint64_t v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = [(PXDisplayAssetVideoContentProviderRequest *)self strategies];
  long long v14 = [v13 objectAtIndexedSubscript:a6];

  if ([(PXDisplayAssetVideoContentProviderRequest *)self requestURLOnly]) {
    long long v15 = v11;
  }
  else {
    long long v15 = v10;
  }
  if (v15) {
    goto LABEL_5;
  }
  v22 = [(__CFString *)v12 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  if (![(PXDisplayAssetVideoContentProviderRequest *)self _isTransientError:v22]
    || self->_retriesAfterTransientErrorCount > 0)
  {
    unint64_t v23 = a6 + 1;

    v24 = [(PXDisplayAssetVideoContentProviderRequest *)self strategies];
    unint64_t v25 = [v24 count];

    if (v23 < v25)
    {
      v26 = PLVideoPlaybackGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v27 = [(PXDisplayAssetVideoContentProviderRequest *)self priority];
        if (v27 > 6) {
          v28 = @"??";
        }
        else {
          v28 = off_1E5DC9228[v27];
        }
        v36 = v28;
        v37 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
        v38 = [v37 uuid];
        *(_DWORD *)buf = 138544130;
        v48 = v12;
        __int16 v49 = 2114;
        v50 = v36;
        __int16 v51 = 2114;
        v52 = v14;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v38;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEFAULT, "VideoContentProvider failed to load. info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@", buf, 0x2Au);
      }
      v32 = [(PXDisplayAssetVideoContentProviderRequest *)self loadingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_369;
      block[3] = &unk_1E5DD08D8;
      block[4] = self;
      block[5] = v23;
      dispatch_async(v32, block);
      goto LABEL_26;
    }
LABEL_5:
    char v16 = [(__CFString *)v14 isAudioAllowed];
    if (v10 && (v16 & 1) == 0)
    {
      long long v17 = [(__CFString *)v10 tracks];
      [v17 enumerateObjectsUsingBlock:&__block_literal_global_372];
    }
    v18 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = v11;
      }
      unint64_t v20 = [(PXDisplayAssetVideoContentProviderRequest *)self priority];
      if (v20 > 6) {
        v21 = @"??";
      }
      else {
        v21 = off_1E5DC9228[v20];
      }
      v29 = v21;
      v30 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
      v31 = [v30 uuid];
      *(_DWORD *)buf = 138544386;
      v48 = v19;
      __int16 v49 = 2114;
      v50 = v12;
      __int16 v51 = 2114;
      v52 = v29;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v14;
      __int16 v55 = 2114;
      v56 = v31;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "VideoContentProvider received result:%{public}@, info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@", buf, 0x34u);
    }
    v32 = [(PXDisplayAssetVideoContentProviderRequest *)self delegate];
    if (v14) {
      [(__CFString *)v14 segmentTimeRange];
    }
    else {
      memset(v44, 0, sizeof(v44));
    }
    [v32 request:self didFinishWithPlayerItem:v10 videoURL:v11 downloadedTimeRange:v44 info:v12];
LABEL_26:

    goto LABEL_27;
  }
  v33 = PLVideoPlaybackGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v34 = [(PXDisplayAssetVideoContentProviderRequest *)self priority];
    if (v34 > 6) {
      v35 = @"??";
    }
    else {
      v35 = off_1E5DC9228[v34];
    }
    v42 = v35;
    v43 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
    [v43 uuid];
    *(_DWORD *)buf = 138544386;
    v48 = v12;
    __int16 v49 = 2114;
    v50 = v42;
    __int16 v51 = 2114;
    v52 = v14;
    v54 = __int16 v53 = 2114;
    v39 = (void *)v54;
    __int16 v55 = 2114;
    v56 = v22;
    _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEFAULT, "VideoContentProvider failed to load but trying same strategy again. info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@ error:%{public}@", buf, 0x34u);
  }
  ++self->_retriesAfterTransientErrorCount;
  dispatch_time_t v40 = dispatch_time(0, 200000000);
  v41 = [(PXDisplayAssetVideoContentProviderRequest *)self loadingQueue];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke;
  v46[3] = &unk_1E5DD08D8;
  v46[4] = self;
  v46[5] = a6;
  dispatch_after(v40, v41, v46);

LABEL_27:
}

uint64_t __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_369(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadMediaWithStrategyAtIndex:*(void *)(a1 + 40)];
}

uint64_t __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadMediaWithStrategyAtIndex:*(void *)(a1 + 40)];
}

void __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [v2 assetTrack];
  objc_super v3 = [v6 mediaType];
  id v4 = v3;
  if (v3 == (void *)*MEMORY[0x1E4F15BA8]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "isEqualToString:") ^ 1;
  }
  [v2 setEnabled:v5];
}

- (void)_handleLoadingProgress:(double)a3
{
  self->_loadingProgress = a3;
  id v4 = [(PXDisplayAssetVideoContentProviderRequest *)self delegate];
  [v4 requestLoadingProgressDidChange:self];
}

- (void)_loadMediaWithStrategyAtIndex:(int64_t)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PXDisplayAssetVideoContentProviderRequest *)self strategies];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  if (self->_isCancelled)
  {
    uint64_t v41 = *MEMORY[0x1E4F39690];
    v42[0] = MEMORY[0x1E4F1CC38];
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    [(PXDisplayAssetVideoContentProviderRequest *)self _handleLoadedPlayerItem:0 videoURL:0 info:v7 strategyAtIndex:a3];
    goto LABEL_27;
  }
  BOOL v7 = objc_alloc_init(PXVideoRequestOptions);
  -[PXVideoRequestOptions setNetworkAccessAllowed:](v7, "setNetworkAccessAllowed:", [v6 isNetworkAccessAllowed]);
  [v6 targetSize];
  -[PXVideoRequestOptions setTargetSize:](v7, "setTargetSize:");
  [(PXVideoRequestOptions *)v7 setIncludeTimeRangeMapper:1];
  [(PXVideoRequestOptions *)v7 setRestrictToPlayableOnCurrentDevice:1];
  PXSetupPXVideoRequestOptionsForDeliveryQuality(v7, [v6 quality]);
  if (v6)
  {
    [v6 segmentTimeRange];
    if ((BYTE12(v38) & 1) == 0
      || ([v6 segmentTimeRange], (v37 & 1) == 0)
      || ([v6 segmentTimeRange], v36)
      || ([v6 segmentTimeRange], v35 < 0))
    {
      int v8 = 0;
    }
    else
    {
      unint64_t v20 = +[PXVideoPlaybackSettings sharedInstance];
      int v8 = [v20 isDownloadingVideoSegmentsEnabled];
    }
  }
  else
  {
    int v8 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
  }
  uint64_t v9 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
  uint64_t v10 = [v9 playbackStyle];

  int v11 = [v6 isStreamingAllowed] ^ 1;
  if (v10 != 4) {
    int v11 = 1;
  }
  if (((v11 | v8) & 1) == 0)
  {
    [(PXVideoRequestOptions *)v7 setStreamingAllowed:1];
    int64_t v12 = [(PXDisplayAssetVideoContentProviderRequest *)self priority];
    uint64_t v13 = 2;
    switch(v12)
    {
      case 0:
      case 5:
      case 6:
        break;
      case 1:
        PXAssertGetLog();
      case 2:
        uint64_t v13 = 3;
        break;
      case 3:
      case 4:
        uint64_t v13 = 1;
        break;
      default:
        v21 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 2);
        v22 = [NSString stringWithUTF8String:"PXVideoRequestOptionsStreamingVideoIntent _streamingVideoIntentForPriority(PXVideoLoadingPriority)"];
        [v21 handleFailureInFunction:v22 file:@"PXDisplayAssetVideoContentProvider.m" lineNumber:635 description:@"Code which should be unreachable has been reached"];

        abort();
    }
    [(PXVideoRequestOptions *)v7 setStreamingVideoIntent:v13];
    [(PXVideoRequestOptions *)v7 setDownloadIntent:_downloadIntentForPriority([(PXDisplayAssetVideoContentProviderRequest *)self priority])];
    [(PXVideoRequestOptions *)v7 setDownloadPriority:_downloadPriorityForPriority([(PXDisplayAssetVideoContentProviderRequest *)self priority])];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v34[0] = *MEMORY[0x1E4F1FA20];
    v34[1] = v15;
    v34[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    long long v14 = v34;
    goto LABEL_22;
  }
  [(PXVideoRequestOptions *)v7 setStreamingAllowed:0];
  [(PXVideoRequestOptions *)v7 setDownloadIntent:_downloadIntentForPriority([(PXDisplayAssetVideoContentProviderRequest *)self priority])];
  [(PXVideoRequestOptions *)v7 setDownloadPriority:_downloadPriorityForPriority([(PXDisplayAssetVideoContentProviderRequest *)self priority])];
  if (v8)
  {
    if (v6)
    {
      [v6 segmentTimeRange];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
    }
    v30[0] = v31;
    v30[1] = v32;
    v30[2] = v33;
    long long v14 = v30;
LABEL_22:
    [(PXVideoRequestOptions *)v7 setTimeRange:v14];
  }
  objc_initWeak(location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke;
  v27[3] = &unk_1E5DD1230;
  objc_copyWeak(&v28, location);
  [(PXVideoRequestOptions *)v7 setProgressHandler:v27];
  if ([(PXDisplayAssetVideoContentProviderRequest *)self requestURLOnly])
  {
    char v16 = [(PXDisplayAssetVideoContentProviderRequest *)self mediaProvider];
    long long v17 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_2;
    v25[3] = &unk_1E5DADEC8;
    v18 = v26;
    objc_copyWeak(v26, location);
    v26[1] = (id)a3;
    int64_t v19 = [v16 requestURLForVideo:v17 options:v7 resultHandler:v25];
  }
  else
  {
    char v16 = [(PXDisplayAssetVideoContentProviderRequest *)self mediaProvider];
    long long v17 = [(PXDisplayAssetVideoContentProviderRequest *)self asset];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_3;
    v23[3] = &unk_1E5DADEF0;
    v18 = v24;
    objc_copyWeak(v24, location);
    v24[1] = (id)a3;
    int64_t v19 = [v16 requestPlayerItemForVideo:v17 options:v7 resultHandler:v23];
  }
  self->_requestID = v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(&v28);
  objc_destroyWeak(location);
LABEL_27:
}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLoadingProgress:a2];
}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleLoadedPlayerItem:0 videoURL:v7 info:v6 strategyAtIndex:*(void *)(a1 + 40)];
}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleLoadedPlayerItem:v7 videoURL:0 info:v6 strategyAtIndex:*(void *)(a1 + 40)];
}

- (void)_start
{
  if ([(PXDisplayAssetVideoContentProviderRequest *)self priority] < 0)
  {
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXDisplayAssetVideoContentProviderRequest__start__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(PXDisplayAssetVideoContentProviderRequest *)self _loadMediaWithStrategyAtIndex:0];
  }
}

void __51__PXDisplayAssetVideoContentProviderRequest__start__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Simulating CPLErrorFeatureIsThrottled");
  dispatch_time_t v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = *MEMORY[0x1E4F39698];
  v9[0] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v7[0] = *MEMORY[0x1E4F1FA20];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  [v3 request:v4 didFinishWithPlayerItem:0 videoURL:0 downloadedTimeRange:v7 info:v5];
}

- (void)cancel
{
  dispatch_time_t v3 = [(PXDisplayAssetVideoContentProviderRequest *)self mediaProvider];
  [v3 cancelImageRequest:self->_requestID];

  self->_isCancelled = 1;
}

- (PXDisplayAssetVideoContentProviderRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PXDisplayAssetVideoContentProviderRequest;
  int64_t v19 = [(PXDisplayAssetVideoContentProviderRequest *)&v24 init];
  unint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_asset, a3);
    objc_storeStrong((id *)&v20->_mediaProvider, a4);
    objc_storeStrong((id *)&v20->_strategies, a5);
    v20->_priority = a6;
    v20->_requestURLOnly = a7;
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_loadingQueue, a9);
  }

  return v20;
}

+ (id)startRequestWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  unint64_t v20 = [[PXDisplayAssetVideoContentProviderRequest alloc] initWithAsset:v19 mediaProvider:v18 strategies:v17 priority:a6 requestURLOnly:v10 delegate:v16 loadingQueue:v15];

  [(PXDisplayAssetVideoContentProviderRequest *)v20 _start];
  return v20;
}

@end