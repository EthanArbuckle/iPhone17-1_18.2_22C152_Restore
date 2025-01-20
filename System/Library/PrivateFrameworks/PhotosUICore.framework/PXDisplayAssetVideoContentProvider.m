@interface PXDisplayAssetVideoContentProvider
- (BOOL)_loadingQueue_needsNewRequestForPriority:(int64_t)a3;
- (BOOL)mayContainAudio;
- (BOOL)needsPostprocessing;
- (NSString)description;
- (PXAVResourceReclamationController)resourceReclamationController;
- (PXDisplayAsset)asset;
- (PXDisplayAssetVideoContentProvider)init;
- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7;
- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8;
- (PXMediaProvider)mediaProvider;
- (id)analyticsPayload;
- (id)audioSession;
- (id)contentIdentifier;
- (id)videoAspectRatio;
- (void)_handlePostprocessedPlayerItem:(id)a3 priority:(int64_t)a4 description:(id)a5;
- (void)_loadingQueueBeginLoadingWithPriority:(int64_t)a3;
- (void)_loadingQueue_beginRequestForPriorityIfNeeded:(int64_t)a3;
- (void)_loadingQueue_cancelAllRequests;
- (void)_loadingQueue_reloadContent;
- (void)_loadingQueue_setAsset:(id)a3;
- (void)_postprocessingQueue_performPostprocessingOfItem:(id)a3 info:(id)a4 priority:(int64_t)a5;
- (void)_reloadAVObjects;
- (void)beginLoadingWithPriority:(int64_t)a3;
- (void)cancelLoading;
- (void)makeUniqueContentIdentifier;
- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4;
- (void)reloadContent;
- (void)request:(id)a3 didFinishWithPlayerItem:(id)a4 videoURL:(id)a5 downloadedTimeRange:(id *)a6 info:(id)a7;
- (void)requestLoadingProgressDidChange:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation PXDisplayAssetVideoContentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_loadingQueue_asset, 0);
  objc_storeStrong((id *)&self->_loadingQueue_requestsByPriority, 0);
  objc_storeStrong((id *)&self->_postprocessingQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)audioSession
{
  return self->_audioSession;
}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)request:(id)a3 didFinishWithPlayerItem:(id)a4 videoURL:(id)a5 downloadedTimeRange:(id *)a6 info:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  loadingQueue = self->_loadingQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke;
  v23[3] = &unk_1E5DADEA0;
  id v24 = v16;
  v25 = self;
  id v26 = v13;
  id v27 = v14;
  long long v18 = *(_OWORD *)&a6->var0.var3;
  long long v30 = *(_OWORD *)&a6->var0.var0;
  long long v31 = v18;
  long long v32 = *(_OWORD *)&a6->var1.var1;
  id v28 = v15;
  SEL v29 = a2;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v16;
  dispatch_async(loadingQueue, v23);
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(*(void *)(a1 + 40) + 160);
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "priority"));
    [v4 removeObjectForKey:v5];
  }
  if (*(void *)(a1 + 56) || *(void *)(a1 + 64))
  {
    if ([*(id *)(a1 + 40) needsPostprocessing])
    {
      if ((*(unsigned char *)(a1 + 92) & 1) != 0
        && (*(unsigned char *)(a1 + 116) & 1) != 0
        && !*(void *)(a1 + 120)
        && (*(void *)(a1 + 104) & 0x8000000000000000) == 0)
      {
        PXAssertGetLog();
      }
      v6 = *(unsigned char **)(a1 + 40);
      if (v6[200]) {
        PXAssertGetLog();
      }
      objc_initWeak(location, v6);
      v7 = *(NSObject **)(*(void *)(a1 + 40) + 152);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_231;
      block[3] = &unk_1E5DCEA88;
      objc_copyWeak(&v32, location);
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 32);
      id v31 = *(id *)(a1 + 48);
      dispatch_async(v7, block);

      objc_destroyWeak(&v32);
      objc_destroyWeak(location);
      if (v3) {
        return;
      }
    }
    else
    {
      v8 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_2;
      v20[3] = &unk_1E5DADE78;
      v20[4] = v8;
      id v21 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 64);
      long long v9 = *(_OWORD *)(a1 + 96);
      long long v25 = *(_OWORD *)(a1 + 80);
      long long v26 = v9;
      long long v27 = *(_OWORD *)(a1 + 112);
      id v23 = *(id *)(a1 + 32);
      id v24 = *(id *)(a1 + 48);
      [v8 performChanges:v20];

      if (v3) {
        return;
      }
    }
    [*(id *)(a1 + 40) cancelLoading];
    return;
  }
  if (![*(id *)(*(void *)(a1 + 40) + 160) count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:@"Video Player Item loading failed." forKeyedSubscript:*MEMORY[0x1E4F28228]];
    uint64_t v11 = *MEMORY[0x1E4F39698];
    v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
      [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXVideoContentProviderErrorDomain" code:1 userInfo:v10];
    id v15 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_3;
    v17[3] = &unk_1E5DD11E8;
    v17[4] = v15;
    id v18 = v14;
    id v19 = *(id *)(a1 + 48);
    id v16 = v14;
    [v15 performChanges:v17];
  }
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_231(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_postprocessingQueue_performPostprocessingOfItem:info:priority:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "priority"));
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_2(uint64_t a1)
{
  v2 = [PXVideoContentProviderLoadingResult alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:*MEMORY[0x1E4F39720]];
  uint64_t v6 = [*(id *)(a1 + 64) priority];
  long long v7 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v7;
  v9[2] = *(_OWORD *)(a1 + 104);
  v8 = [(PXVideoContentProviderLoadingResult *)v2 initWithPlayerItem:v3 url:v4 timeRange:v9 timeRangeMapper:v5 error:0 priority:v6 description:@"Loaded from Media Provider"];
  [*(id *)(a1 + 32) setLoadingResult:v8];
}

void __104__PXDisplayAssetVideoContentProvider_request_didFinishWithPlayerItem_videoURL_downloadedTimeRange_info___block_invoke_3(uint64_t a1)
{
  v2 = [PXVideoContentProviderLoadingResult alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) priority];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v7[0] = *MEMORY[0x1E4F1FA20];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  uint64_t v6 = [(PXVideoContentProviderLoadingResult *)v2 initWithPlayerItem:0 url:0 timeRange:v7 timeRangeMapper:0 error:v3 priority:v4 description:@"Loading Failed"];
  [*(id *)(a1 + 32) setLoadingResult:v6];
}

- (void)requestLoadingProgressDidChange:(id)a3
{
  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(loadingQueue, block);
}

void __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_2;
  v5[3] = &unk_1E5DADE50;
  v5[4] = v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_3;
  v4[3] = &unk_1E5DCCC00;
  v4[4] = v3;
  v4[5] = v6;
  [v3 performChanges:v4];
  _Block_object_dispose(v6, 8);
}

uint64_t __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a3 loadingProgress];
  if (v4 >= v6) {
    double v6 = v4;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

uint64_t __70__PXDisplayAssetVideoContentProvider_requestLoadingProgressDidChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLoadingProgress:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_reloadAVObjects
{
  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXDisplayAssetVideoContentProvider__reloadAVObjects__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(loadingQueue, block);
}

uint64_t __54__PXDisplayAssetVideoContentProvider__reloadAVObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_reloadContent");
}

- (void)_loadingQueue_reloadContent
{
  [(PXDisplayAssetVideoContentProvider *)self _loadingQueue_cancelAllRequests];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXDisplayAssetVideoContentProvider__loadingQueue_reloadContent__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXDisplayAssetVideoContentProvider *)self performChanges:v3];
}

uint64_t __65__PXDisplayAssetVideoContentProvider__loadingQueue_reloadContent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoadingResult:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[21];
  return objc_msgSend(v2, "_loadingQueue_beginRequestForPriorityIfNeeded:", v3);
}

- (void)_handlePostprocessedPlayerItem:(id)a3 priority:(int64_t)a4 description:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"Unable to produce a post-processed player item for this video.";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v10 = [v11 errorWithDomain:@"PXVideoContentProviderErrorDomain" code:2 userInfo:v12];
  }
  loadingQueue = self->_loadingQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke;
  v17[3] = &unk_1E5DCE038;
  v17[4] = self;
  id v18 = v8;
  id v20 = v9;
  int64_t v21 = a4;
  id v19 = v10;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(loadingQueue, v17);
}

void __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke_2;
  v6[3] = &unk_1E5DADE28;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  long long v5 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v10 = v4;
  id v9 = v5;
  [v2 performChanges:v6];
}

void __90__PXDisplayAssetVideoContentProvider__handlePostprocessedPlayerItem_priority_description___block_invoke_2(uint64_t a1)
{
  v2 = [PXVideoContentProviderLoadingResult alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v9[0] = *MEMORY[0x1E4F1FA20];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  id v8 = [(PXVideoContentProviderLoadingResult *)v2 initWithPlayerItem:v3 url:0 timeRange:v9 timeRangeMapper:0 error:v4 priority:v5 description:v6];
  [*(id *)(a1 + 32) setLoadingResult:v8];
}

- (void)_postprocessingQueue_performPostprocessingOfItem:(id)a3 info:(id)a4 priority:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PXDisplayAssetVideoContentProvider__postprocessingQueue_performPostprocessingOfItem_info_priority___block_invoke;
  v10[3] = &unk_1E5DADE00;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  [(PXDisplayAssetVideoContentProvider *)self postprocessPlayerItem:v8 completionHandler:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __101__PXDisplayAssetVideoContentProvider__postprocessingQueue_performPostprocessingOfItem_info_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePostprocessedPlayerItem:v7 priority:*(void *)(a1 + 40) description:v6];
}

- (BOOL)_loadingQueue_needsNewRequestForPriority:(int64_t)a3
{
  uint64_t v5 = [(PXVideoContentProvider *)self loadingResult];
  id v6 = [v5 playerItem];
  if (v6)
  {
  }
  else
  {
    loadingQueue_requestsByPriority = self->_loadingQueue_requestsByPriority;
    id v8 = [NSNumber numberWithInteger:a3];
    id v9 = [(NSMutableDictionary *)loadingQueue_requestsByPriority objectForKeyedSubscript:v8];

    if (!v9) {
      PXExists();
    }
  }
  return 0;
}

BOOL __79__PXDisplayAssetVideoContentProvider__loadingQueue_needsNewRequestForPriority___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] > *(void *)(a1 + 32);
}

- (void)_loadingQueue_beginRequestForPriorityIfNeeded:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_loadingQueue_asset;
  if ((unint64_t)[(PXDisplayAsset *)v5 playbackStyle] <= 2)
  {
    uint64_t v10 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      PXDisplayAssetPlaybackStyleDescription();
    }
  }
  else if (v5 {
         && [(PXDisplayAssetVideoContentProvider *)self _loadingQueue_needsNewRequestForPriority:a3])
  }
  {
    self->_loadingQueue_lastRequestedPriority = a3;
    id v6 = [(PXDisplayAssetVideoContentProvider *)self mediaProvider];
    id v7 = +[PXDisplayAssetVideoContentProviderRequest startRequestWithAsset:v5 mediaProvider:v6 strategies:self->_strategies priority:a3 requestURLOnly:self->_requestURLOnly delegate:self loadingQueue:self->_loadingQueue];

    loadingQueue_requestsByPriority = self->_loadingQueue_requestsByPriority;
    id v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)loadingQueue_requestsByPriority setObject:v7 forKeyedSubscript:v9];
  }
}

- (void)_loadingQueue_cancelAllRequests
{
  [(NSMutableDictionary *)self->_loadingQueue_requestsByPriority enumerateKeysAndObjectsUsingBlock:&__block_literal_global_222];
  loadingQueue_requestsByPriority = self->_loadingQueue_requestsByPriority;
  [(NSMutableDictionary *)loadingQueue_requestsByPriority removeAllObjects];
}

uint64_t __69__PXDisplayAssetVideoContentProvider__loadingQueue_cancelAllRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)_loadingQueueBeginLoadingWithPriority:(int64_t)a3
{
  loadingQueue_asset = self->_loadingQueue_asset;
  if (loadingQueue_asset)
  {
    id v6 = loadingQueue_asset;
    [(PXDisplayAssetVideoContentProvider *)self _loadingQueue_beginRequestForPriorityIfNeeded:a3];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PXDisplayAssetVideoContentProvider__loadingQueueBeginLoadingWithPriority___block_invoke;
    _OWORD v7[3] = &unk_1E5DD0FA8;
    v7[4] = self;
    [(PXDisplayAssetVideoContentProvider *)self performChanges:v7];
  }
}

uint64_t __76__PXDisplayAssetVideoContentProvider__loadingQueueBeginLoadingWithPriority___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLoadingResult:0];
}

- (void)_loadingQueue_setAsset:(id)a3
{
  uint64_t v5 = (PXDisplayAsset *)a3;
  loadingQueue_asset = self->_loadingQueue_asset;
  if (loadingQueue_asset != v5)
  {
    id v13 = v5;
    id v7 = loadingQueue_asset;
    objc_storeStrong((id *)&self->_loadingQueue_asset, a3);
    if (v7)
    {
      uint64_t v8 = [(PXDisplayAsset *)v7 playbackStyle];
      if (v8 == [(PXDisplayAsset *)v13 playbackStyle])
      {
        id v9 = v13;
        uint64_t v10 = v7;
        uint64_t v11 = v10;
        if (v9)
        {
          uint64_t v12 = [(PXDisplayAsset *)v9 isContentEqualTo:v10];
          if (!v12) {
            uint64_t v12 = [(PXDisplayAsset *)v11 isContentEqualTo:v9];
          }

          if (v12 == 2) {
            goto LABEL_12;
          }
        }
        else
        {
        }
        if ((unint64_t)[(PXDisplayAsset *)v9 playbackStyle] >= 3) {
          [(PXDisplayAssetVideoContentProvider *)self _loadingQueue_reloadContent];
        }
      }
    }
LABEL_12:

    uint64_t v5 = v13;
  }
}

- (void)makeUniqueContentIdentifier
{
  id v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = [v5 UUIDString];
  contentIdentifier = self->_contentIdentifier;
  self->_contentIdentifier = v3;
}

- (void)cancelLoading
{
  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXDisplayAssetVideoContentProvider_cancelLoading__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(loadingQueue, block);
}

uint64_t __51__PXDisplayAssetVideoContentProvider_cancelLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_cancelAllRequests");
}

- (PXDisplayAsset)asset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  loadingQueue = self->_loadingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PXDisplayAssetVideoContentProvider_asset__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(loadingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PXDisplayAsset *)v3;
}

void __43__PXDisplayAssetVideoContentProvider_asset__block_invoke(uint64_t a1)
{
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXDisplayAssetVideoContentProvider_setAsset___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(loadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__PXDisplayAssetVideoContentProvider_setAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadingQueue_setAsset:", *(void *)(a1 + 32));
}

- (void)reloadContent
{
  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PXDisplayAssetVideoContentProvider_reloadContent__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(loadingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__PXDisplayAssetVideoContentProvider_reloadContent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadingQueue_reloadContent");
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PXDisplayAssetVideoContentProvider;
  id v4 = [(PXDisplayAssetVideoContentProvider *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@, Asset %@, Media Provider: %@", v4, self->_loadingQueue_asset, self->_mediaProvider];

  return (NSString *)v5;
}

- (void)postprocessPlayerItem:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)needsPostprocessing
{
  return 0;
}

- (id)videoAspectRatio
{
  return (id)[NSNumber numberWithDouble:self->_videoAspectRatio];
}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  id v5 = [(PXVideoContentProvider *)self loadingResult];
  if ([v5 priority] >= a3)
  {
  }
  else
  {
    id v6 = [(PXVideoContentProvider *)self loadingResult];
    objc_super v7 = [v6 playerItem];

    if (!v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke;
      v12[3] = &unk_1E5DD0FA8;
      v12[4] = self;
      [(PXDisplayAssetVideoContentProvider *)self performChanges:v12];
    }
  }
  objc_initWeak(&location, self);
  loadingQueue = self->_loadingQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke_2;
  _OWORD v9[3] = &unk_1E5DD0260;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  dispatch_async(loadingQueue, v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

uint64_t __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLoadingResult:0];
}

void __63__PXDisplayAssetVideoContentProvider_beginLoadingWithPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadingQueueBeginLoadingWithPriority:*(void *)(a1 + 40)];
}

- (id)analyticsPayload
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PXDisplayAssetVideoContentProvider *)self asset];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = *MEMORY[0x1E4F56558];
    v7[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (BOOL)mayContainAudio
{
  return self->_mayContainAudio;
}

- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v27 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PXDisplayAssetVideoContentProvider;
  id v19 = [(PXDisplayAssetVideoContentProvider *)&v28 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_audioSession, a6);
    objc_storeStrong((id *)&v20->_loadingQueue_asset, a3);
    objc_storeStrong((id *)&v20->_mediaProvider, a4);
    uint64_t v21 = [v16 copy];
    strategies = v20->_strategies;
    v20->_strategies = (NSArray *)v21;

    v20->_requestURLOnly = a7;
    if (![(NSArray *)v20->_strategies count])
    {
      id v23 = +[PXDisplayAssetVideoContentDeliveryStrategy defaultStreamingMediumQualityStrategy];
      v29[0] = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      long long v25 = v20->_strategies;
      v20->_strategies = (NSArray *)v24;
    }
    PXExists();
  }

  return 0;
}

uint64_t __143__PXDisplayAssetVideoContentProvider_initWithAsset_mediaProvider_deliveryStrategies_audioSession_requestURLOnly_resourceReclamationController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAudioAllowed];
}

- (PXDisplayAssetVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F8EB70];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  id v18 = [(PXDisplayAssetVideoContentProvider *)self initWithAsset:v16 mediaProvider:v15 deliveryStrategies:v14 audioSession:v13 requestURLOnly:v7 resourceReclamationController:v17];

  return v18;
}

- (PXDisplayAssetVideoContentProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDisplayAssetVideoContentProvider.m", 94, @"%s is not available as initializer", "-[PXDisplayAssetVideoContentProvider init]");

  abort();
}

@end