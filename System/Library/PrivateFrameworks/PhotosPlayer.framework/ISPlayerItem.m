@interface ISPlayerItem
+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4;
+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5;
+ (int64_t)currentClientVersion;
- (AVVideoComposition)videoComposition;
- (BOOL)_blendsVideoFramesForVideoPlayerItem:(id)a3;
- (BOOL)_isContentSupportsVitalityValid;
- (BOOL)_isLoadingCancelled;
- (BOOL)_isMinimumClientVersionValid;
- (BOOL)_isOnIvarQueue;
- (BOOL)_isOnWorkQueue;
- (BOOL)_isPlaybackStyleIdentifierValid;
- (BOOL)_isPlayerContentValid;
- (BOOL)_isStatusVaild;
- (BOOL)_isVideoPlayerItemValid;
- (BOOL)_needsUpdate;
- (BOOL)aggressivelyCacheVideoFrames;
- (BOOL)contentSupportsVitality;
- (BOOL)decodesAllFramesDuringOrdinaryPlayback;
- (BOOL)reversesMoreVideoFramesInMemory;
- (CGSize)targetSize;
- (ISAsset)asset;
- (ISPlayerContent)playerContent;
- (ISPlayerItem)init;
- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4;
- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5;
- (NSError)error;
- (NSNumber)_variationIdentifier;
- (NSNumber)contentAspectRatio;
- (NSString)_minimumClientVersion;
- (id)_videoPlayerItem;
- (int64_t)_videoPlayerItemRequestID;
- (int64_t)loadingTarget;
- (int64_t)status;
- (void)_cancelLoading;
- (void)_dimFlashingLightsDidChangeValue:(id)a3;
- (void)_handleVideoPlayerItemLoadResultWithSuccess:(BOOL)a3 playerItem:(id)a4 videoDuration:(id *)a5 error:(id)a6;
- (void)_invalidateContentSupportsVitality;
- (void)_invalidateMinimumClientVersion;
- (void)_invalidatePlaybackStyleIdentifier;
- (void)_invalidatePlayerContent;
- (void)_invalidateStatus;
- (void)_invalidateVideoPlayerItem;
- (void)_performIvarRead:(id)a3;
- (void)_performIvarWrite:(id)a3;
- (void)_performWork:(id)a3;
- (void)_performWork:(id)a3 sync:(BOOL)a4;
- (void)_reloadAllContent;
- (void)_setError:(id)a3;
- (void)_setLoadingCancelled:(BOOL)a3;
- (void)_setMinimumClientVersion:(id)a3;
- (void)_setPlayerContent:(id)a3;
- (void)_setStatus:(int64_t)a3;
- (void)_setVariationIdentifier:(id)a3;
- (void)_setVideoPlayerItem:(id)a3 videoDuration:(id *)a4;
- (void)_setVideoPlayerItemRequestID:(int64_t)a3;
- (void)_updateContentSupportsVitalityIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateMinimumClientVersionIfNeeded;
- (void)_updatePlaybackStyleIdentifierIfNeeded;
- (void)_updatePlayerContentIfNeeded;
- (void)_updateStatusIfNeeded;
- (void)_updateVideoPlayerItemIfNeeded;
- (void)cancelLoading;
- (void)dealloc;
- (void)didPerformChanges;
- (void)discardContentBelowLoadingTarget;
- (void)performChanges:(id)a3;
- (void)resetAVObjects;
- (void)setAggressivelyCacheVideoFrames:(BOOL)a3;
- (void)setContentSupportsVitality:(BOOL)a3;
- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3;
- (void)setLoadingTarget:(int64_t)a3;
- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3;
- (void)setVideoComposition:(id)a3;
@end

@implementation ISPlayerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAspectRatio, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_workQueue_imageGenerator, 0);
  objc_storeStrong((id *)&self->_ivarQueue_error, 0);
  objc_storeStrong((id *)&self->_ivarQueue_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_ivarQueue_variationIdentifier, 0);
  objc_storeStrong((id *)&self->_ivarQueue_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_ivarQueue_playerContent, 0);
  objc_storeStrong((id *)&self->_ivarQueue_videoComposition, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

- (void)_setLoadingCancelled:(BOOL)a3
{
  self->__loadingCancelled = a3;
}

- (BOOL)_isLoadingCancelled
{
  return self->__loadingCancelled;
}

- (NSNumber)contentAspectRatio
{
  return self->_contentAspectRatio;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ISAsset)asset
{
  return self->_asset;
}

- (BOOL)_isOnWorkQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_workQueueIdentifier;
}

- (BOOL)_isOnIvarQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_ivarQueueIdentifier;
}

- (void)_performIvarWrite:(id)a3
{
  ivarQueue = self->_ivarQueue;
  if (ivarQueue) {
    dispatch_barrier_sync(ivarQueue, a3);
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_performIvarRead:(id)a3
{
  id v4 = a3;
  dispatch_block_t block = v4;
  if (self->_ivarQueue && (v5 = [(ISPlayerItem *)self _isOnIvarQueue], id v4 = block, !v5)) {
    dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
  }
  else {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)_performWork:(id)a3
{
}

- (void)_performWork:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(id, ISPlayerItem *))a3;
  if (v4)
  {
    if ([(ISPlayerItem *)self _isOnWorkQueue])
    {
      v6[2](v6, self);
    }
    else
    {
      workQueue = self->_workQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __34__ISPlayerItem__performWork_sync___block_invoke;
      v13[3] = &unk_1E6BECA80;
      v13[4] = self;
      v14 = v6;
      dispatch_sync(workQueue, v13);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__ISPlayerItem__performWork_sync___block_invoke_2;
    block[3] = &unk_1E6BECD58;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __34__ISPlayerItem__performWork_sync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __34__ISPlayerItem__performWork_sync___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)_updateStatusIfNeeded
{
  if (![(ISPlayerItem *)self _isStatusVaild])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37__ISPlayerItem__updateStatusIfNeeded__block_invoke;
    v3[3] = &unk_1E6BEC940;
    v3[4] = self;
    [(ISPlayerItem *)self _performWork:v3];
  }
}

void __37__ISPlayerItem__updateStatusIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ISPlayerItem__updateStatusIfNeeded__block_invoke_2;
  v8[3] = &unk_1E6BECD80;
  v8[4] = *(void *)(a1 + 32);
  [v3 _performIvarWrite:v8];
  BOOL v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [v3 playerContent];
    v7 = [v6 videoPlayerItem];

    if (v7) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  [v3 _setStatus:v5];
}

uint64_t __37__ISPlayerItem__updateStatusIfNeeded__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 249) = 1;
  return result;
}

- (BOOL)_isStatusVaild
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__ISPlayerItem__isStatusVaild__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__ISPlayerItem__isStatusVaild__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 249);
  return result;
}

- (void)_invalidateStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__ISPlayerItem__invalidateStatus__block_invoke;
  v2[3] = &unk_1E6BECD80;
  v2[4] = self;
  [(ISPlayerItem *)self _performIvarWrite:v2];
}

uint64_t __33__ISPlayerItem__invalidateStatus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 249) = 0;
  return result;
}

- (void)_updatePlayerContentIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

void __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 _isPlayerContentValid] & 1) == 0)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_2;
    v40[3] = &unk_1E6BECD80;
    v40[4] = *(void *)(a1 + 32);
    [v3 _performIvarWrite:v40];
    BOOL v4 = [v3 asset];
    uint64_t v5 = v4;
    long long v38 = 0uLL;
    uint64_t v39 = 0;
    if (v4) {
      [v4 photoCMTime];
    }
    uint64_t v6 = [v5 photo];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__1896;
    v36 = __Block_byref_object_dispose__1897;
    id v37 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1896;
    v26 = __Block_byref_object_dispose__1897;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_3;
    v21[3] = &unk_1E6BECA58;
    v21[4] = *(void *)(a1 + 32);
    v21[5] = &v32;
    v21[6] = &v28;
    v21[7] = &v22;
    [v3 _performIvarRead:v21];
    uint64_t v7 = [v5 photoEXIFOrientation];
    uint64_t v8 = [v5 hasColorAdjustments];
    v9 = [ISPlayerContent alloc];
    uint64_t v10 = *(void *)(a1 + 32) + 172;
    uint64_t v11 = v33[5];
    uint64_t v12 = v23[5];
    char v13 = *((unsigned char *)v29 + 24);
    long long v19 = v38;
    uint64_t v20 = v39;
    long long v14 = *(_OWORD *)v10;
    uint64_t v18 = *(void *)(v10 + 16);
    long long v17 = v14;
    LOBYTE(v16) = v13;
    v15 = [(ISPlayerContent *)v9 initWithPhoto:v6 photoIsOriginal:1 photoEXIFOrientation:v7 photoTime:&v19 videoDuration:&v17 photoHasColorAdjustments:v8 videoPlayerItem:v11 variationIdentifier:v12 supportsVitality:v16];
    [v3 _setPlayerContent:v15];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
}

uint64_t __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 250) = 1;
  return result;
}

void __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_3(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 216));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 147);
  char v2 = *(void **)(a1[4] + 224);
  id v3 = (id *)(*(void *)(a1[7] + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (BOOL)_isPlayerContentValid
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ISPlayerItem__isPlayerContentValid__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__ISPlayerItem__isPlayerContentValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 250);
  return result;
}

- (void)_invalidatePlayerContent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__ISPlayerItem__invalidatePlayerContent__block_invoke;
  v2[3] = &unk_1E6BECD80;
  v2[4] = self;
  [(ISPlayerItem *)self _performIvarWrite:v2];
}

uint64_t __40__ISPlayerItem__invalidatePlayerContent__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 250) = 0;
  return result;
}

- (void)_dimFlashingLightsDidChangeValue:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke;
  v3[3] = &unk_1E6BED038;
  v3[4] = self;
  [(ISPlayerItem *)self performChanges:v3];
}

uint64_t __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke_2;
  v3[3] = &unk_1E6BECD80;
  v3[4] = v1;
  return [v1 _performIvarWrite:v3];
}

uint64_t __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _blendsVideoFramesForVideoPlayerItem:*(void *)(*(void *)(a1 + 32) + 216)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 216);

  return [v3 setBlendsVideoFrames:v2];
}

- (BOOL)_blendsVideoFramesForVideoPlayerItem:(id)a3
{
  if (objc_msgSend(a3, "is_isHighFramerate")) {
    return 0;
  }
  id v3 = +[ISPlayerSettings sharedInstance];
  int v4 = [v3 allowFrameBlending];

  return v4 && !MADimFlashingLightsEnabled();
}

- (id)_videoPlayerItem
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1896;
  v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__ISPlayerItem__videoPlayerItem__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__ISPlayerItem__videoPlayerItem__block_invoke(uint64_t a1)
{
}

- (void)_setVideoPlayerItem:(id)a3 videoDuration:(id *)a4
{
  id v6 = a3;
  id v7 = [(ISPlayerItem *)self _videoPlayerItem];

  if (v7 != v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke;
    v8[3] = &unk_1E6BECA30;
    v8[4] = self;
    id v9 = v6;
    long long v10 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(ISPlayerItem *)self performChanges:v8];
  }
}

void __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke_2;
  v3[3] = &unk_1E6BECA08;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  [v2 _performIvarWrite:v3];
  [*(id *)(a1 + 32) _invalidatePlayerContent];
}

__n128 __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 216) setAggressivelyCachesVideoFrames:*(unsigned __int8 *)(*(void *)(a1 + 32) + 144)];
  [*(id *)(*(void *)(a1 + 32) + 216) setReversesMoreVideoFramesInMemory:*(unsigned __int8 *)(*(void *)(a1 + 32) + 145)];
  [*(id *)(*(void *)(a1 + 32) + 216) setDecodesAllFramesDuringOrdinaryPlayback:*(unsigned __int8 *)(*(void *)(a1 + 32) + 146)];
  [*(id *)(*(void *)(a1 + 32) + 216) setVideoComposition:*(void *)(*(void *)(a1 + 32) + 128)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 216);
  if (v2)
  {
    [v2 duration];
    id v2 = *(void **)(*(void *)(a1 + 32) + 216);
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  long long v6 = v8;
  uint64_t v7 = v9;
  [v2 setForwardPlaybackEndTime:&v6];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "setBlendsVideoFrames:", objc_msgSend(*(id *)(a1 + 32), "_blendsVideoFramesForVideoPlayerItem:", *(void *)(*(void *)(a1 + 32) + 216)));
  [*(id *)(*(void *)(a1 + 32) + 216) setSeekingWaitsForVideoCompositionRendering:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "is_enableColorMatching");
  id v3 = (__n128 *)(*(void *)(a1 + 32) + 172);
  unint64_t v4 = *(void *)(a1 + 64);
  __n128 result = *(__n128 *)(a1 + 48);
  *id v3 = result;
  v3[1].n128_u64[0] = v4;
  return result;
}

- (void)_handleVideoPlayerItemLoadResultWithSuccess:(BOOL)a3 playerItem:(id)a4 videoDuration:(id *)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__ISPlayerItem__handleVideoPlayerItemLoadResultWithSuccess_playerItem_videoDuration_error___block_invoke;
  v14[3] = &unk_1E6BEC9E0;
  BOOL v18 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a5;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ISPlayerItem *)self _performWork:v14];
}

void __91__ISPlayerItem__handleVideoPlayerItemLoadResultWithSuccess_playerItem_videoDuration_error___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    id v4 = a2;
    [v4 _setVideoPlayerItem:v3 videoDuration:&v9];
  }
  else
  {
    id v5 = a2;
    [v5 _invalidateVideoPlayerItem];
    long long v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      v12[0] = v7;
      long long v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v4 = [v6 errorWithDomain:@"com.apple.photosplayer" code:102 userInfo:v8];
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photosplayer" code:102 userInfo:0];
    }
    [v5 _setError:v4];
  }
}

- (void)_updateVideoPlayerItemIfNeeded
{
  if (![(ISPlayerItem *)self _isVideoPlayerItemValid])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke;
    v4[3] = &unk_1E6BECD80;
    v4[4] = self;
    [(ISPlayerItem *)self _performIvarWrite:v4];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_2;
    v3[3] = &unk_1E6BEC940;
    v3[4] = self;
    [(ISPlayerItem *)self _performWork:v3];
  }
}

uint64_t __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 248) = 1;
  return result;
}

void __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 asset];
  id v5 = [v4 videoAsset];
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  if (v4) {
    [v4 photoCMTime];
  }
  if (v5 && [*(id *)(a1 + 32) loadingTarget] >= 1 && objc_msgSend(v3, "status") != 1)
  {
    objc_initWeak(&location, v3);
    long long v6 = +[ISPlayerItemChef defaultChef];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_3;
    v12[3] = &unk_1E6BEC9B8;
    objc_copyWeak(&v13, &location);
    long long v10 = v15;
    uint64_t v11 = v16;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v9[0] = *MEMORY[0x1E4F1FA20];
    v9[1] = v7;
    v9[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    uint64_t v8 = [v6 prepareIrisVideoWithAsset:v5 photoTime:&v10 trimmedTimeRange:v9 completion:v12];

    [v3 _setVideoPlayerItemRequestID:v8];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, long long *a4, void *a5)
{
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained(v8);
  long long v12 = *a4;
  uint64_t v13 = *((void *)a4 + 2);
  [WeakRetained _handleVideoPlayerItemLoadResultWithSuccess:a2 playerItem:v10 videoDuration:&v12 error:v9];
}

- (BOOL)_isVideoPlayerItemValid
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ISPlayerItem__isVideoPlayerItemValid__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__ISPlayerItem__isVideoPlayerItemValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 248);
  return result;
}

- (void)_invalidateVideoPlayerItem
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

void __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke_2;
  v4[3] = &unk_1E6BECD80;
  v4[4] = v2;
  [v2 _performIvarWrite:v4];
  id v3 = +[ISPlayerItemChef defaultChef];
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "_videoPlayerItemRequestID"));
}

uint64_t __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 248) = 0;
  return result;
}

- (BOOL)contentSupportsVitality
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ISPlayerItem_contentSupportsVitality__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__ISPlayerItem_contentSupportsVitality__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 147);
  return result;
}

- (void)setContentSupportsVitality:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__ISPlayerItem_setContentSupportsVitality___block_invoke;
  v3[3] = &unk_1E6BEC990;
  v3[4] = self;
  BOOL v4 = a3;
  [(ISPlayerItem *)self performChanges:v3];
}

void __43__ISPlayerItem_setContentSupportsVitality___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ISPlayerItem_setContentSupportsVitality___block_invoke_2;
  v5[3] = &unk_1E6BEC968;
  char v6 = *(unsigned char *)(a1 + 40);
  v5[4] = v4;
  v5[5] = &v7;
  [v4 _performIvarWrite:v5];
  if (*((unsigned char *)v8 + 24)) {
    [*(id *)(a1 + 32) _invalidatePlayerContent];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __43__ISPlayerItem_setContentSupportsVitality___block_invoke_2(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 48);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 147))
  {
    *(unsigned char *)(v2 + 147) = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateContentSupportsVitalityIfNeeded
{
  if (![(ISPlayerItem *)self _isContentSupportsVitalityValid])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke;
    v4[3] = &unk_1E6BECD80;
    v4[4] = self;
    [(ISPlayerItem *)self _performIvarWrite:v4];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke_2;
    v3[3] = &unk_1E6BEC940;
    v3[4] = self;
    [(ISPlayerItem *)self _performWork:v3 sync:0];
  }
}

uint64_t __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 253) = 1;
  return result;
}

void __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 asset];
  double v5 = [v4 videoAsset];
  if (v5 != 0.0)
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:*(void *)&v5 timeZoneLookup:0];
    uint64_t v7 = v6;
    if (v6)
    {
      if (([v6 hasVitality] & 1) == 0)
      {
        char v8 = ISGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          double v9 = *(double *)(a1 + 32);
          int v23 = 138412290;
          double v24 = v9;
          _os_log_impl(&dword_1DB21E000, v8, OS_LOG_TYPE_INFO, "Disabling vitality for Live Photo because of PFMetadataIdentifier.quickTimeMetadataLivePhotoVitalityDisabled: %@", (uint8_t *)&v23, 0xCu);
        }
        int v10 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      long long v12 = ISGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412290;
        double v24 = v5;
        _os_log_error_impl(&dword_1DB21E000, v12, OS_LOG_TYPE_ERROR, "Unable to read vitality disabled flag from asset: %@.", (uint8_t *)&v23, 0xCu);
      }
    }
    uint64_t v13 = +[ISVitalitySettings sharedInstance];
    [v13 vitalityTransitionScoreMinimumValueForPlayback];
    float v15 = v14;

    if (v15 <= 0.0)
    {
      int v10 = 1;
LABEL_24:

      BOOL v11 = v10 != 0;
      goto LABEL_25;
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:*(void *)&v5 timeZoneLookup:0];
    char v8 = v16;
    if (v16)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = [v16 livePhotoVitalityTransitionScore];
      BOOL v18 = v17;
      if (v17)
      {
        [v17 floatValue];
        if (v19 < v15)
        {
          uint64_t v20 = ISGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            [v18 floatValue];
            uint64_t v21 = *(void *)(a1 + 32);
            int v23 = 134218498;
            double v24 = v22;
            __int16 v25 = 2048;
            double v26 = v15;
            __int16 v27 = 2112;
            uint64_t v28 = v21;
            _os_log_impl(&dword_1DB21E000, v20, OS_LOG_TYPE_INFO, "Disabling vitality for Live Photo because of PFMetadataIdentifier.quickTimeMetadataVitalityTransitionScore %f < %f: %@", (uint8_t *)&v23, 0x20u);
          }

          int v10 = 0;
          goto LABEL_22;
        }
      }
    }
    else
    {
      BOOL v18 = ISGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412290;
        double v24 = v5;
        _os_log_error_impl(&dword_1DB21E000, v18, OS_LOG_TYPE_ERROR, "Unable to read vitality transition score from asset: %@.", (uint8_t *)&v23, 0xCu);
      }
    }
    int v10 = 1;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  BOOL v11 = 1;
LABEL_25:
  [v3 setContentSupportsVitality:v11];
}

- (void)_invalidateContentSupportsVitality
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

uint64_t __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke_2;
  v3[3] = &unk_1E6BECD80;
  v3[4] = v1;
  return [v1 _performIvarWrite:v3];
}

uint64_t __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 253) = 0;
  return result;
}

- (BOOL)_isContentSupportsVitalityValid
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ISPlayerItem__isContentSupportsVitalityValid__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__ISPlayerItem__isContentSupportsVitalityValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 253);
  return result;
}

- (NSNumber)_variationIdentifier
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1896;
  double v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__ISPlayerItem__variationIdentifier__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __36__ISPlayerItem__variationIdentifier__block_invoke(uint64_t a1)
{
}

- (void)_setVariationIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ISPlayerItem__setVariationIdentifier___block_invoke;
  v6[3] = &unk_1E6BECF98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ISPlayerItem *)self performChanges:v6];
}

void __40__ISPlayerItem__setVariationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ISPlayerItem__setVariationIdentifier___block_invoke_2;
  v7[3] = &unk_1E6BECF20;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = &v11;
  [v4 _performIvarWrite:v7];
  if (*((unsigned char *)v12 + 24)) {
    [*(id *)(a1 + 32) _invalidatePlayerContent];
  }

  _Block_object_dispose(&v11, 8);
}

void __40__ISPlayerItem__setVariationIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3 != (void *)v2[28])
  {
    id v4 = [v2 _variationIdentifier];
    char v5 = [v3 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 224), *(id *)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)_updatePlaybackStyleIdentifierIfNeeded
{
  if (![(ISPlayerItem *)self _isPlaybackStyleIdentifierValid])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke;
    v3[3] = &unk_1E6BECD80;
    v3[4] = self;
    [(ISPlayerItem *)self _performIvarWrite:v3];
    [(ISPlayerItem *)self _performWork:&__block_literal_global_35 sync:0];
  }
}

uint64_t __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 252) = 1;
  return result;
}

void __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 asset];
  id v4 = [v3 videoAsset];
  if (!v4)
  {
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v4 timeZoneLookup:0];
  if (!v5)
  {
    uint64_t v6 = ISGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_error_impl(&dword_1DB21E000, v6, OS_LOG_TYPE_ERROR, "Unable to read playback style identifier from asset: %@.", (uint8_t *)&v8, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  id v7 = [v5 playbackVariation];
  [v2 _setVariationIdentifier:v7];
}

- (BOOL)_isPlaybackStyleIdentifierValid
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ISPlayerItem__isPlaybackStyleIdentifierValid__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__ISPlayerItem__isPlaybackStyleIdentifierValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 252);
  return result;
}

- (void)_invalidatePlaybackStyleIdentifier
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

uint64_t __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke_2;
  v3[3] = &unk_1E6BECD80;
  v3[4] = v1;
  return [v1 _performIvarWrite:v3];
}

uint64_t __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 252) = 0;
  return result;
}

- (NSString)_minimumClientVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1896;
  uint64_t v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ISPlayerItem__minimumClientVersion__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __37__ISPlayerItem__minimumClientVersion__block_invoke(uint64_t a1)
{
}

- (void)_setMinimumClientVersion:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ISPlayerItem *)self _minimumClientVersion];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __41__ISPlayerItem__setMinimumClientVersion___block_invoke;
    float v15 = &unk_1E6BECF48;
    uint64_t v16 = self;
    id v7 = v4;
    id v17 = v7;
    [(ISPlayerItem *)self _performIvarWrite:&v12];
    if ([v7 integerValue] >= 1)
    {
      char v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v9 = [NSString stringWithFormat:@"The current client version of PhotosPlayer is %d, but the media in %@ requires version >= %@", 0, self->_asset, v7, v12, v13, v14, v15, v16];
      v19[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v11 = [v8 errorWithDomain:@"com.apple.photosplayer" code:104 userInfo:v10];

      [(ISPlayerItem *)self _setError:v11];
    }
  }
}

uint64_t __41__ISPlayerItem__setMinimumClientVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 232);
  *(void *)(v3 + 232) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_updateMinimumClientVersionIfNeeded
{
  if (![(ISPlayerItem *)self _isMinimumClientVersionValid])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke;
    v3[3] = &unk_1E6BECD80;
    v3[4] = self;
    [(ISPlayerItem *)self _performIvarWrite:v3];
    [(ISPlayerItem *)self _performWork:&__block_literal_global_26 sync:0];
  }
}

uint64_t __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 251) = 1;
  return result;
}

void __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 asset];
  uint64_t v4 = [v3 videoAsset];
  if (!v4)
  {
LABEL_6:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v4 timeZoneLookup:0];
  if (!v5)
  {
    char v6 = ISGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_debug_impl(&dword_1DB21E000, v6, OS_LOG_TYPE_DEBUG, "Unable to read minimum client version from source video: %@.", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  id v7 = [v5 livePhotoMinimumClientVersion];
  char v8 = [v7 stringValue];
  [v2 _setMinimumClientVersion:v8];
}

- (BOOL)_isMinimumClientVersionValid
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ISPlayerItem__isMinimumClientVersionValid__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__ISPlayerItem__isMinimumClientVersionValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 251);
  return result;
}

- (void)_invalidateMinimumClientVersion
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

uint64_t __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke_2;
  v3[3] = &unk_1E6BECD80;
  v3[4] = v1;
  return [v1 _performIvarWrite:v3];
}

uint64_t __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 251) = 0;
  return result;
}

- (BOOL)_needsUpdate
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__ISPlayerItem__needsUpdate__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __28__ISPlayerItem__needsUpdate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 250) ^ 1;
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(unsigned char *)(*(void *)(result + 32) + 249) == 0;
  }
  *(unsigned char *)(v1 + 24) = v2;
  uint64_t v3 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = *(unsigned char *)(*(void *)(result + 32) + 248) == 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned char *)(*(void *)(result + 32) + 251) == 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(unsigned char *)(*(void *)(result + 32) + 252) == 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  uint64_t v9 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v9 + 24)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *(unsigned char *)(*(void *)(result + 32) + 253) == 0;
  }
  *(unsigned char *)(v9 + 24) = v10;
  return result;
}

- (void)_updateIfNeeded
{
}

void __31__ISPlayerItem__updateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateMinimumClientVersionIfNeeded];
  [v2 _updatePlaybackStyleIdentifierIfNeeded];
  [v2 _updateContentSupportsVitalityIfNeeded];
  [v2 _updateVideoPlayerItemIfNeeded];
  [v2 _updatePlayerContentIfNeeded];
  [v2 _updateStatusIfNeeded];
}

- (int64_t)status
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__ISPlayerItem_status__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __22__ISPlayerItem_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 208);
  return result;
}

- (ISPlayerContent)playerContent
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1896;
  uint64_t v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__ISPlayerItem_playerContent__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ISPlayerContent *)v2;
}

void __29__ISPlayerItem_playerContent__block_invoke(uint64_t a1)
{
}

- (void)_setStatus:(int64_t)a3
{
  if ([(ISPlayerItem *)self status] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __27__ISPlayerItem__setStatus___block_invoke;
    v5[3] = &unk_1E6BECFE8;
    v5[4] = self;
    v5[5] = a3;
    [(ISPlayerItem *)self performChanges:v5];
  }
}

uint64_t __27__ISPlayerItem__setStatus___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__ISPlayerItem__setStatus___block_invoke_2;
  v5[3] = &unk_1E6BECFC0;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = v2;
  v5[5] = v3;
  [v2 _performIvarWrite:v5];
  if (*(void *)(a1 + 40) == 1) {
    [*(id *)(a1 + 32) _cancelLoading];
  }
  return [*(id *)(a1 + 32) signalChange:1];
}

uint64_t __27__ISPlayerItem__setStatus___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 208) = *(void *)(result + 40);
  return result;
}

- (void)_setPlayerContent:(id)a3
{
  id v4 = a3;
  id v5 = [(ISPlayerItem *)self playerContent];
  if (v5 != v4 && ([v4 isEqual:v5] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__ISPlayerItem__setPlayerContent___block_invoke;
    v6[3] = &unk_1E6BECF98;
    v6[4] = self;
    id v7 = v4;
    [(ISPlayerItem *)self performChanges:v6];
  }
}

void __34__ISPlayerItem__setPlayerContent___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __34__ISPlayerItem__setPlayerContent___block_invoke_2;
  BOOL v6 = &unk_1E6BECF48;
  id v7 = v2;
  id v8 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v3];
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2, v3, v4, v5, v6, v7);
  [*(id *)(a1 + 32) _invalidateStatus];
}

void __34__ISPlayerItem__setPlayerContent___block_invoke_2(uint64_t a1)
{
}

- (NSError)error
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__1896;
  uint64_t v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__ISPlayerItem_error__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

void __21__ISPlayerItem_error__block_invoke(uint64_t a1)
{
}

- (void)_setError:(id)a3
{
  id v4 = a3;
  id v5 = [(ISPlayerItem *)self error];

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__ISPlayerItem__setError___block_invoke;
    v6[3] = &unk_1E6BECF98;
    v6[4] = self;
    id v7 = v4;
    [(ISPlayerItem *)self performChanges:v6];
  }
}

void __26__ISPlayerItem__setError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __26__ISPlayerItem__setError___block_invoke_2;
  uint64_t v9 = &unk_1E6BECF48;
  id v10 = v2;
  id v11 = *(id *)(a1 + 40);
  [v2 _performIvarWrite:&v6];
  uint64_t v3 = ISGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_error_impl(&dword_1DB21E000, v3, OS_LOG_TYPE_ERROR, "%@ did receive error: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus", v6, v7, v8, v9, v10);
}

void __26__ISPlayerItem__setError___block_invoke_2(uint64_t a1)
{
}

- (BOOL)decodesAllFramesDuringOrdinaryPlayback
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__ISPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __54__ISPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 146);
  return result;
}

- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3
{
  if ([(ISPlayerItem *)self decodesAllFramesDuringOrdinaryPlayback] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__ISPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke;
    v5[3] = &unk_1E6BED088;
    v5[4] = self;
    BOOL v6 = a3;
    [(ISPlayerItem *)self _performIvarWrite:v5];
  }
}

uint64_t __58__ISPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 146) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 216) setDecodesAllFramesDuringOrdinaryPlayback:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)reversesMoreVideoFramesInMemory
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ISPlayerItem_reversesMoreVideoFramesInMemory__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __47__ISPlayerItem_reversesMoreVideoFramesInMemory__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 145);
  return result;
}

- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3
{
  if ([(ISPlayerItem *)self reversesMoreVideoFramesInMemory] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__ISPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke;
    v5[3] = &unk_1E6BED088;
    v5[4] = self;
    BOOL v6 = a3;
    [(ISPlayerItem *)self _performIvarWrite:v5];
  }
}

uint64_t __51__ISPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 216) setReversesMoreVideoFramesInMemory:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)aggressivelyCacheVideoFrames
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ISPlayerItem_aggressivelyCacheVideoFrames__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__ISPlayerItem_aggressivelyCacheVideoFrames__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 144);
  return result;
}

- (void)setAggressivelyCacheVideoFrames:(BOOL)a3
{
  if ([(ISPlayerItem *)self aggressivelyCacheVideoFrames] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__ISPlayerItem_setAggressivelyCacheVideoFrames___block_invoke;
    v5[3] = &unk_1E6BED088;
    v5[4] = self;
    BOOL v6 = a3;
    [(ISPlayerItem *)self _performIvarWrite:v5];
  }
}

uint64_t __48__ISPlayerItem_setAggressivelyCacheVideoFrames___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 216) setAggressivelyCachesVideoFrames:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_reloadAllContent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__ISPlayerItem__reloadAllContent__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2];
}

uint64_t __33__ISPlayerItem__reloadAllContent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelLoading];
  char v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ISPlayerItem__reloadAllContent__block_invoke_2;
  v4[3] = &unk_1E6BED038;
  v4[4] = v2;
  return [v2 performChanges:v4];
}

uint64_t __33__ISPlayerItem__reloadAllContent__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateVideoPlayerItem];
  char v2 = *(void **)(a1 + 32);
  long long v4 = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [v2 _setVideoPlayerItem:0 videoDuration:&v4];
}

- (void)resetAVObjects
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1896;
  v5[4] = __Block_byref_object_dispose__1897;
  id v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__ISPlayerItem_resetAVObjects__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = v5;
  [(ISPlayerItem *)self _performIvarWrite:v4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__ISPlayerItem_resetAVObjects__block_invoke_2;
  v3[3] = &unk_1E6BEC940;
  v3[4] = self;
  [(ISPlayerItem *)self _performWork:v3 sync:0];
  _Block_object_dispose(v5, 8);
}

void __30__ISPlayerItem_resetAVObjects__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 216));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 216);
  *(void *)(v2 + 216) = 0;

  *(void *)(*(void *)(a1 + 32) + 208) = 0;
  long long v4 = [ISPlayerContent alloc];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 200) photo];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) photoIsOriginal];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 200) photoEXIFOrientation];
  long long v14 = *MEMORY[0x1E4F1F9F8];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v12 = v14;
  uint64_t v13 = v15;
  LOBYTE(v11) = 0;
  uint64_t v8 = [(ISPlayerContent *)v4 initWithPhoto:v5 photoIsOriginal:v6 photoEXIFOrientation:v7 photoTime:&v14 videoDuration:&v12 photoHasColorAdjustments:0 videoPlayerItem:0 variationIdentifier:0 supportsVitality:v11];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 200);
  *(void *)(v9 + 200) = v8;
}

void __30__ISPlayerItem_resetAVObjects__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 272) resetAVObjects];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ISPlayerItem_resetAVObjects__block_invoke_3;
  block[3] = &unk_1E6BECD80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __30__ISPlayerItem_resetAVObjects__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAllContent];
}

- (void)cancelLoading
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__ISPlayerItem_cancelLoading__block_invoke;
  v2[3] = &unk_1E6BEC940;
  v2[4] = self;
  [(ISPlayerItem *)self _performWork:v2 sync:0];
}

void __29__ISPlayerItem_cancelLoading__block_invoke(uint64_t a1)
{
  id v2 = +[ISPlayerItemChef defaultChef];
  objc_msgSend(v2, "cancelPreparationOfIrisAssetWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "_videoPlayerItemRequestID"));
}

- (void)discardContentBelowLoadingTarget
{
}

void __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 loadingTarget];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke_2;
  v5[3] = &unk_1E6BECFE8;
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  [v4 performChanges:v5];
}

uint64_t __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke_2(uint64_t result)
{
  if (*(uint64_t *)(result + 40) <= 0)
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 32);
    long long v3 = *MEMORY[0x1E4F1F9F8];
    uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v2 _setVideoPlayerItem:0 videoDuration:&v3];
    return [*(id *)(v1 + 32) _invalidateVideoPlayerItem];
  }
  return result;
}

- (void)_setVideoPlayerItemRequestID:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ISPlayerItem__setVideoPlayerItemRequestID___block_invoke;
  v3[3] = &unk_1E6BECFC0;
  v3[4] = self;
  void v3[5] = a3;
  [(ISPlayerItem *)self _performIvarWrite:v3];
}

uint64_t __45__ISPlayerItem__setVideoPlayerItemRequestID___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 136) = *(void *)(result + 40);
  return result;
}

- (int64_t)_videoPlayerItemRequestID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__ISPlayerItem__videoPlayerItemRequestID__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__ISPlayerItem__videoPlayerItemRequestID__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136);
  return result;
}

- (void)_cancelLoading
{
  id v3 = +[ISPlayerItemChef defaultChef];
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", -[ISPlayerItem _videoPlayerItemRequestID](self, "_videoPlayerItemRequestID"));
}

- (void)setVideoComposition:(id)a3
{
  id v4 = a3;
  id v5 = [(ISPlayerItem *)self videoComposition];

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__ISPlayerItem_setVideoComposition___block_invoke;
    v6[3] = &unk_1E6BECF98;
    v6[4] = self;
    id v7 = v4;
    [(ISPlayerItem *)self performChanges:v6];
  }
}

void __36__ISPlayerItem_setVideoComposition___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__ISPlayerItem_setVideoComposition___block_invoke_2;
  v2[3] = &unk_1E6BECF48;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performIvarWrite:v2];
}

uint64_t __36__ISPlayerItem_setVideoComposition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 216);

  return [v6 setVideoComposition:v5];
}

- (AVVideoComposition)videoComposition
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1896;
  uint64_t v9 = __Block_byref_object_dispose__1897;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__ISPlayerItem_videoComposition__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AVVideoComposition *)v2;
}

void __32__ISPlayerItem_videoComposition__block_invoke(uint64_t a1)
{
}

- (void)setLoadingTarget:(int64_t)a3
{
  int64_t v5 = [(ISPlayerItem *)self loadingTarget];
  if (v5 != a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__ISPlayerItem_setLoadingTarget___block_invoke;
    v6[3] = &unk_1E6BEC8F8;
    v6[4] = self;
    void v6[5] = a3;
    v6[6] = v5;
    [(ISPlayerItem *)self performChanges:v6];
  }
}

uint64_t __33__ISPlayerItem_setLoadingTarget___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__ISPlayerItem_setLoadingTarget___block_invoke_2;
  v5[3] = &unk_1E6BECFC0;
  uint64_t v3 = *(void *)(a1 + 40);
  void v5[4] = v2;
  void v5[5] = v3;
  uint64_t result = [v2 _performIvarWrite:v5];
  if (!*(void *)(a1 + 40)) {
    uint64_t result = [*(id *)(a1 + 32) _cancelLoading];
  }
  if (*(uint64_t *)(a1 + 48) <= 0 && *(uint64_t *)(a1 + 40) >= 1) {
    return [*(id *)(a1 + 32) _invalidateVideoPlayerItem];
  }
  return result;
}

uint64_t __33__ISPlayerItem_setLoadingTarget___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = *(void *)(result + 40);
  return result;
}

- (int64_t)loadingTarget
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__ISPlayerItem_loadingTarget__block_invoke;
  v4[3] = &unk_1E6BED060;
  v4[4] = self;
  void v4[5] = &v5;
  [(ISPlayerItem *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__ISPlayerItem_loadingTarget__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__ISPlayerItem_performChanges___block_invoke;
  v6[3] = &unk_1E6BEC8D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ISPlayerItem *)self _performWork:v6 sync:0];
}

id __31__ISPlayerItem_performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ISPlayerItem;
  return objc_msgSendSuper2(&v3, sel_performChanges_, v1);
}

- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)ISPlayerItem;
  id v12 = [(ISObservable *)&v34 init];
  if (v12)
  {
    uint64_t v13 = NSNumber;
    atomic_fetch_add(initWithAsset_targetSize_contentAspectRatio__ivarQueueCounter, 1u);
    *((void *)v12 + 11) = objc_msgSend(v13, "numberWithInt:");
    long long v14 = NSNumber;
    atomic_fetch_add(&initWithAsset_targetSize_contentAspectRatio__workQueueCounter, 1u);
    *((void *)v12 + 12) = objc_msgSend(v14, "numberWithInt:");
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.ISPlayerItem.state", v15);
    id v17 = (void *)*((void *)v12 + 13);
    *((void *)v12 + 13) = v16;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v12 + 13), (const void *)QueueIdentifierContext, *((void **)v12 + 11), 0);
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.ISPlayerItem.work", v18);
    uint64_t v20 = (void *)*((void *)v12 + 14);
    *((void *)v12 + 14) = v19;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v12 + 14), (const void *)QueueIdentifierContext, *((void **)v12 + 12), 0);
    objc_storeStrong((id *)v12 + 34, a3);
    *((CGFloat *)v12 + 36) = width;
    *((CGFloat *)v12 + 37) = height;
    *((void *)v12 + 26) = 0;
    objc_storeStrong((id *)v12 + 35, a5);
    uint64_t v21 = [ISPlayerContent alloc];
    uint64_t v22 = [v10 photo];
    uint64_t v23 = [v10 photoEXIFOrientation];
    if (v10) {
      [v10 photoCMTime];
    }
    else {
      memset(v33, 0, sizeof(v33));
    }
    uint64_t v24 = [v10 hasColorAdjustments];
    long long v31 = *MEMORY[0x1E4F1F9F8];
    uint64_t v32 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    LOBYTE(v30) = 0;
    __int16 v25 = [(ISPlayerContent *)v21 initWithPhoto:v22 photoIsOriginal:1 photoEXIFOrientation:v23 photoTime:v33 videoDuration:&v31 photoHasColorAdjustments:v24 videoPlayerItem:0 variationIdentifier:0 supportsVitality:v30];
    double v26 = (void *)*((void *)v12 + 25);
    *((void *)v12 + 25) = v25;
    __int16 v27 = v25;

    *((unsigned char *)v12 + 146) = 1;
    uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v12 selector:sel__dimFlashingLightsDidChangeValue_ name:*MEMORY[0x1E4F31220] object:0];

    [v12 _updateIfNeeded];
  }

  return (ISPlayerItem *)v12;
}

- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4
{
  return -[ISPlayerItem initWithAsset:targetSize:contentAspectRatio:](self, "initWithAsset:targetSize:contentAspectRatio:", a3, 0, a4.width, a4.height);
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)ISPlayerItem;
  [(ISObservable *)&v3 didPerformChanges];
  [(ISPlayerItem *)self _updateIfNeeded];
}

- (void)dealloc
{
  objc_super v3 = +[ISPlayerItemChef defaultChef];
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", -[ISPlayerItem _videoPlayerItemRequestID](self, "_videoPlayerItemRequestID"));

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ISPlayerItem;
  [(ISPlayerItem *)&v5 dealloc];
}

- (ISPlayerItem)init
{
  return -[ISPlayerItem initWithAsset:targetSize:](self, "initWithAsset:targetSize:", 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(objc_alloc((Class)a1), "initWithAsset:targetSize:contentAspectRatio:", v10, v9, width, height);

  return (ISPlayerItem *)v11;
}

+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(objc_alloc((Class)a1), "initWithAsset:targetSize:", v7, width, height);

  return (ISPlayerItem *)v8;
}

+ (int64_t)currentClientVersion
{
  return 0;
}

@end