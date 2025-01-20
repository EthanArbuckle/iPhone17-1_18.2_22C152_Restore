@interface PXGridInlineVideoSessionAssetPlaybackRecord
+ (OS_dispatch_queue)videoSessionQueue;
- (BOOL)discardVideoOnPause;
- (BOOL)isPlaying;
- (CGAffineTransform)preferredTransform;
- (NSString)videoStatusDescription;
- (PXGridInlineVideoSessionAssetPlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5 playLivePhotosWithSettlingEffectIfPossible:(BOOL)a6;
- (PXVideoSession)videoSession;
- (__CVBuffer)currentPixelBuffer;
- (id)pixelBufferDidChangeHandler;
- (id)providePlaceholderHandler;
- (int64_t)desiredPlayState;
- (void)_configureVideoSession:(id)a3;
- (void)_setCurrentPixelBuffer:(__CVBuffer *)a3;
- (void)_videoQueue_ensureVideoSessionWithDesiredPlayState:(int64_t)a3;
- (void)_videoQueue_relinquishVideoSession;
- (void)_videoQueue_updateCurrentPixelBuffer;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForInvisible;
- (void)prepareForVisible;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDiscardVideoOnPause:(BOOL)a3;
- (void)setPixelBufferDidChangeHandler:(id)a3;
- (void)setProvidePlaceholderHandler:(id)a3;
- (void)setVideoSession:(id)a3;
@end

@implementation PXGridInlineVideoSessionAssetPlaybackRecord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providePlaceholderHandler, 0);
  objc_storeStrong(&self->_pixelBufferDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_bufferRequestIdentifier, 0);
}

- (void)setDiscardVideoOnPause:(BOOL)a3
{
  self->_discardVideoOnPause = a3;
}

- (BOOL)discardVideoOnPause
{
  return self->_discardVideoOnPause;
}

- (void)setProvidePlaceholderHandler:(id)a3
{
}

- (id)providePlaceholderHandler
{
  return self->_providePlaceholderHandler;
}

- (void)setPixelBufferDidChangeHandler:(id)a3
{
}

- (id)pixelBufferDidChangeHandler
{
  return self->_pixelBufferDidChangeHandler;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (CGAffineTransform)preferredTransform
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  videoSession = self->_videoSession;
  if (videoSession) {
    [(PXVideoSession *)videoSession preferredTransform];
  }
  os_unfair_lock_unlock(p_ivarLock);
  return result;
}

- (__CVBuffer)currentPixelBuffer
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  os_unfair_lock_unlock(p_ivarLock);
  return currentPixelBuffer;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXGridInlineVideoSessionAssetPlaybackRecordVideoSessionObservableContext != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXGridInlineVideoSessionAssetPlaybackRecord.m" lineNumber:255 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if ((v6 & 0x400) != 0)
  {
    objc_initWeak(&location, self);
    v11 = [(id)objc_opt_class() videoSessionQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__PXGridInlineVideoSessionAssetPlaybackRecord_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v14, &location);
    dispatch_async(v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __76__PXGridInlineVideoSessionAssetPlaybackRecord_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_videoQueue_updateCurrentPixelBuffer");
}

- (void)setVideoSession:(id)a3
{
  v4 = (PXVideoSession *)a3;
  os_unfair_lock_lock(&self->_ivarLock);
  videoSession = self->_videoSession;
  self->_videoSession = v4;

  os_unfair_lock_unlock(&self->_ivarLock);
}

- (PXVideoSession)videoSession
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = self->_videoSession;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (void)_setCurrentPixelBuffer:(__CVBuffer *)a3
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  if (currentPixelBuffer == a3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    CVPixelBufferRelease(currentPixelBuffer);
    self->_currentPixelBuffer = CVPixelBufferRetain(a3);
    os_unfair_lock_unlock(p_ivarLock);
    v7 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self pixelBufferDidChangeHandler];

    if (v7)
    {
      v8 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self pixelBufferDidChangeHandler];
      v8[2]();
    }
  }
}

- (void)_videoQueue_updateCurrentPixelBuffer
{
  v3 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self videoSession];
  uint64_t v4 = [v3 currentPixelBuffer];

  [(PXGridInlineVideoSessionAssetPlaybackRecord *)self _setCurrentPixelBuffer:v4];
}

- (void)_configureVideoSession:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 setVolume:1 withFade:0.0];
    [v5 setPreventsSleepDuringVideoPlayback:0];
    [v5 setAllowsExternalPlayback:0];
    __int16 v6 = [(PXGridInlinePlaybackRecord *)self displayAsset];
    uint64_t v7 = [v6 playbackStyle];

    if (v7 == 5 || v7 == 3)
    {
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      v10[0] = *MEMORY[0x1E4F1FA20];
      v10[1] = v8;
      v10[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      [v5 setPlaybackTimeRange:v10];
      [v5 setLoopingEnabled:1];
    }
    else
    {
      [(PXGridInlinePlaybackRecord *)self bestVideoTimeRange];
      v9[0] = v9[3];
      v9[1] = v9[4];
      v9[2] = v9[5];
      [v5 setPlaybackTimeRange:v9];
      [v5 setSeekToBeginningAtEnd:1];
    }
  }
}

- (void)_videoQueue_relinquishVideoSession
{
  id v4 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self videoSession];
  [v4 cancelPixelBufferOutputWithRequestIdentifier:self->_bufferRequestIdentifier];
  v3 = +[PXVideoSessionManager sharedInstance];
  [v3 checkInVideoSession:v4];

  [(PXGridInlineVideoSessionAssetPlaybackRecord *)self setVideoSession:0];
  [(PXGridInlineVideoSessionAssetPlaybackRecord *)self _setCurrentPixelBuffer:0];
}

- (void)_videoQueue_ensureVideoSessionWithDesiredPlayState:(int64_t)a3
{
  v5 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self videoSession];
  if (!v5)
  {
    __int16 v6 = [(PXGridInlinePlaybackRecord *)self displayAsset];
    uint64_t v7 = [v6 playbackStyle];
    long long v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setShouldPlayLivePhotosWithSettlingEffectIfPossible:self->_playLivePhotosWithSettlingEffectIfPossible];
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setShouldStabilizeLivePhotosIfPossible:1];
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setIsAudioAllowed:v7 != 3];
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setShouldCrossfadeLivePhotosWhenLooping:1];
    [(PXGridInlinePlaybackRecord *)self bestVideoTimeRange];
    v14[0] = v14[3];
    v14[1] = v14[4];
    v14[2] = v14[5];
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setLivePhotoLoopTimeRange:v14];
    if (v7 == 5) {
      [MEMORY[0x1E4F8EBC8] sharedAmbientInstance];
    }
    else {
    id v9 = [MEMORY[0x1E4F8EBC8] sharedVideoPlaybackInstance];
    }
    [(PXVideoSessionManagerDisplayAssetOptions *)v8 setAudioSession:v9];

    v10 = +[PXVideoSessionManager sharedInstance];
    v11 = [(PXGridInlinePlaybackRecord *)self displayAsset];
    v12 = [(PXGridInlinePlaybackRecord *)self mediaProvider];
    v5 = [v10 videoSessionForAsset:v11 withOptions:v8 mediaProvider:v12];

    if ([v6 playbackStyle] != 3) {
      [v5 prewarmVideoView];
    }
    [v5 loadIfNeededWithPriority:0];
    [v5 registerChangeObserver:self context:PXGridInlineVideoSessionAssetPlaybackRecordVideoSessionObservableContext];
    objc_msgSend(v5, "requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:", self->_bufferRequestIdentifier, 1920.0, 1080.0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__PXGridInlineVideoSessionAssetPlaybackRecord__videoQueue_ensureVideoSessionWithDesiredPlayState___block_invoke;
    v13[3] = &unk_1E5DB4178;
    void v13[4] = self;
    v13[5] = a3;
    [v5 performChanges:v13 withPresentationContext:0 presenter:0];
    [(PXGridInlineVideoSessionAssetPlaybackRecord *)self setVideoSession:v5];
  }
}

void __98__PXGridInlineVideoSessionAssetPlaybackRecord__videoQueue_ensureVideoSessionWithDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setDesiredPlayState:v3];
  [*(id *)(a1 + 32) _configureVideoSession:v4];
}

- (void)prepareForInvisible
{
  uint64_t v3 = [(id)objc_opt_class() videoSessionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForInvisible__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __66__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForInvisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoQueue_relinquishVideoSession");
}

- (void)prepareForVisible
{
  if (!self->_playLivePhotosWithSettlingEffectIfPossible)
  {
    int64_t v3 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self desiredPlayState];
    id v4 = [(id)objc_opt_class() videoSessionQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForVisible__block_invoke;
    v5[3] = &unk_1E5DD08D8;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __64__PXGridInlineVideoSessionAssetPlaybackRecord_prepareForVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoQueue_ensureVideoSessionWithDesiredPlayState:", *(void *)(a1 + 40));
}

- (BOOL)isPlaying
{
  return [(PXGridInlineVideoSessionAssetPlaybackRecord *)self currentPixelBuffer] != 0;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
  v5 = [(id)objc_opt_class() videoSessionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke;
  v6[3] = &unk_1E5DD08D8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) == 1)
  {
    objc_msgSend(v2, "_videoQueue_ensureVideoSessionWithDesiredPlayState:", 1);
  }
  else if ([v2 discardVideoOnPause])
  {
    objc_msgSend(*(id *)(a1 + 32), "_videoQueue_relinquishVideoSession");
  }
  id v4 = [*(id *)(a1 + 32) videoSession];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke_2;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableVideoSession__8l;
  v5[4] = *(void *)(a1 + 40);
  [v4 performChanges:v5 withPresentationContext:0 presenter:0];
}

uint64_t __67__PXGridInlineVideoSessionAssetPlaybackRecord_setDesiredPlayState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:*(void *)(a1 + 32)];
}

- (NSString)videoStatusDescription
{
  v2 = [(PXGridInlineVideoSessionAssetPlaybackRecord *)self videoSession];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 statusDescription];
  }
  else
  {
    id v4 = @"Video Not Loaded";
  }

  return (NSString *)v4;
}

- (void)dealloc
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  currentPixelBuffer = self->_currentPixelBuffer;
  v5 = self->_videoSession;
  os_unfair_lock_unlock(p_ivarLock);
  CVPixelBufferRelease(currentPixelBuffer);
  [(PXVideoSession *)v5 cancelPixelBufferOutputWithRequestIdentifier:self->_bufferRequestIdentifier];
  __int16 v6 = +[PXVideoSessionManager sharedInstance];
  [v6 checkInVideoSession:v5];

  v7.receiver = self;
  v7.super_class = (Class)PXGridInlineVideoSessionAssetPlaybackRecord;
  [(PXGridInlineVideoSessionAssetPlaybackRecord *)&v7 dealloc];
}

- (PXGridInlineVideoSessionAssetPlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5 playLivePhotosWithSettlingEffectIfPossible:(BOOL)a6
{
  v20.receiver = self;
  v20.super_class = (Class)PXGridInlineVideoSessionAssetPlaybackRecord;
  objc_super v7 = [(PXGridInlinePlaybackRecord *)&v20 initWithDisplayAsset:a3 mediaProvider:a4 geometryReference:a5];
  long long v8 = v7;
  if (v7)
  {
    v7->_ivarLock._os_unfair_lock_opaque = 0;
    v7->_playLivePhotosWithSettlingEffectIfPossible = a6;
    id v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = [v12 UUIDString];
    id v14 = [v9 stringWithFormat:@"%@-%@", v11, v13];

    if (v8->_playLivePhotosWithSettlingEffectIfPossible)
    {
      uint64_t v15 = [v14 stringByAppendingString:@"-FRCWallpaper"];

      id v14 = (void *)v15;
    }
    bufferRequestIdentifier = v8->_bufferRequestIdentifier;
    v8->_bufferRequestIdentifier = (NSString *)v14;

    if (v8->_playLivePhotosWithSettlingEffectIfPossible)
    {
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      v19[0] = *MEMORY[0x1E4F1FA20];
      v19[1] = v17;
      v19[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      [(PXGridInlinePlaybackRecord *)v8 setBestVideoTimeRange:v19];
    }
  }
  return v8;
}

+ (OS_dispatch_queue)videoSessionQueue
{
  if (videoSessionQueue_onceToken != -1) {
    dispatch_once(&videoSessionQueue_onceToken, &__block_literal_global_51870);
  }
  v2 = (void *)videoSessionQueue_videoSessionQueue;
  return (OS_dispatch_queue *)v2;
}

void __64__PXGridInlineVideoSessionAssetPlaybackRecord_videoSessionQueue__block_invoke()
{
}

@end