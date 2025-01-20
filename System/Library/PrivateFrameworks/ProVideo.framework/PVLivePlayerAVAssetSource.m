@interface PVLivePlayerAVAssetSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3;
- (AVAsset)asset;
- (BOOL)loopPlayback;
- (BOOL)repeatFrames;
- (PVLivePlayerAVAssetSource)initWithAVAsset:(id)a3;
- (__CVBuffer)_copyPixelBufferForHostTime:(double)a3;
- (__CVBuffer)_copyPixelBufferForTime:(id *)a3;
- (id)imageBufferForHostTime:(double)a3;
- (int)status;
- (void)dealloc;
- (void)finishReading;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)outputMediaDataWillChange:(id)a3;
- (void)pause;
- (void)play;
- (void)playerItemDidPlayToEnd:(id)a3;
- (void)seekToTime:(id *)a3;
- (void)setLoopPlayback:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setRepeatFrames:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setupPlayer;
- (void)startObservers;
- (void)stopObservers;
@end

@implementation PVLivePlayerAVAssetSource

- (PVLivePlayerAVAssetSource)initWithAVAsset:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PVLivePlayerAVAssetSource;
  v6 = [(PVLivePlayerAVAssetSource *)&v21 init];
  v7 = v6;
  if (v6)
  {
    p_asset = (void **)&v6->_asset;
    objc_storeStrong((id *)&v6->_asset, a3);
    asset = v7->_asset;
    if (asset)
    {
      [asset duration];
      asset = *p_asset;
    }
    else
    {
      long long v19 = 0uLL;
      int64_t v20 = 0;
    }
    *(_OWORD *)&v7->_assetDuration.value = v19;
    v7->_assetDuration.epoch = v20;
    [asset preferredRate];
    v7->_assetRate = v10;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.ProVideo.PVLivePlayerAVAssetSource", 0);
    videoTrackDimensions = (void *)v7->_videoTrackDimensions;
    v7->_videoTrackDimensions = ($470D365275581EF16070F5A11344F73E)v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    playbackReadyCondVar = v7->_playbackReadyCondVar;
    v7->_playbackReadyCondVar = (OS_dispatch_semaphore *)v15;

    cacheImageFrameSet = v7->_cacheImageFrameSet;
    v7->_cacheImageFrameSet = 0;

    operator new();
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(AVQueuePlayer *)self->_playerQueue pause];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_playerItemOutputs;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v6++) setDelegate:0 queue:0];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  [(AVQueuePlayer *)self->_playerQueue cancelPendingPrerolls];
  [(AVPlayerLooper *)self->_playerLooper disableLooping];
  [(PVLivePlayerAVAssetSource *)self finishReading];
  [(PVLivePlayerAVAssetSource *)self stopObservers];
  cacheLock = self->_cacheLock;
  if (cacheLock) {
    (*((void (**)(HGSynchronizable *))cacheLock->var0 + 1))(cacheLock);
  }
  playerItemOutputs = self->_playerItemOutputs;
  self->_playerItemOutputs = 0;

  playerQueue = self->_playerQueue;
  self->_playerQueue = 0;

  playerLooper = self->_playerLooper;
  self->_playerLooper = 0;

  v11.receiver = self;
  v11.super_class = (Class)PVLivePlayerAVAssetSource;
  [(PVLivePlayerAVAssetSource *)&v11 dealloc];
}

- (void)play
{
  if ([(PVLivePlayerAVAssetSource *)self status] == 1) {
    return;
  }
  if ([(PVLivePlayerAVAssetSource *)self status] == 2)
  {
    [(AVQueuePlayer *)self->_playerQueue play];
    [(PVLivePlayerAVAssetSource *)self setStatus:1];
    return;
  }
  if ([(PVLivePlayerAVAssetSource *)self loopPlayback]) {
    [(AVPlayerLooper *)self->_playerLooper loopingPlayerItems];
  }
  else {
  v3 = [(AVQueuePlayer *)self->_playerQueue items];
  }
  id v6 = [v3 firstObject];

  uint64_t v4 = [v6 status];
  switch(v4)
  {
    case 0:
      if ([(AVQueuePlayer *)self->_playerQueue status] != 1) {
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_dispatchQueue, 0xFFFFFFFFFFFFFFFFLL);
      }
      goto LABEL_15;
    case 1:
LABEL_15:
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_playbackReadyCondVar, 0xFFFFFFFFFFFFFFFFLL);
      [(AVQueuePlayer *)self->_playerQueue play];
      uint64_t v5 = 1;
      goto LABEL_16;
    case 2:
      uint64_t v5 = 4;
LABEL_16:
      [(PVLivePlayerAVAssetSource *)self setStatus:v5];
      break;
  }
}

- (void)pause
{
  [(AVQueuePlayer *)self->_playerQueue pause];

  [(PVLivePlayerAVAssetSource *)self setStatus:2];
}

- (id)imageBufferForHostTime:(double)a3
{
  uint64_t v5 = -[PVLivePlayerAVAssetSource _copyPixelBufferForHostTime:](self, "_copyPixelBufferForHostTime:");
  if (v5)
  {
    id v6 = v5;
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    [(PVLivePlayerAVAssetSource *)self itemTimeForHostTime:a3];
    v7 = +[PVImageBuffer imageWithCVPixelBuffer:v6];
    long long v14 = v16;
    uint64_t v15 = v17;
    long long v12 = *(_OWORD *)&self->_videoTrackFrameRate;
    uint64_t v13 = *(void *)&self->_videoTrackFrameDelta.timescale;
    v8 = +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:v7 timestamp:&v14 frameDuration:&v12];
    v9 = [[PVFrameSet alloc] initWithColorBuffer:v8 metadata:0];
    CVPixelBufferRelease(v6);
  }
  else
  {
    v9 = 0;
  }
  if ([(PVLivePlayerAVAssetSource *)self repeatFrames])
  {
    *(void *)&long long v16 = self->_cacheLock;
    BYTE8(v16) = 0;
    HGSynchronizable::Lock((HGSynchronizable *)v16);
    p_cacheImageFrameSet = &self->_cacheImageFrameSet;
    if (v9) {
      objc_storeStrong((id *)p_cacheImageFrameSet, v9);
    }
    else {
      v9 = *p_cacheImageFrameSet;
    }
    HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&v16);
  }

  return v9;
}

- (__CVBuffer)_copyPixelBufferForHostTime:(double)a3
{
  int v5 = [(NSArray *)self->_playerItemOutputs count];
  if (v5 < 1) {
    return 0;
  }
  int v6 = 0;
  while (1)
  {
    int v7 = (v6 + self->_currentPlayerItemOutput) % v5;
    v8 = [(NSArray *)self->_playerItemOutputs objectAtIndex:v7];
    v9 = v8;
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    if (v8) {
      [v8 itemTimeForHostTime:a3];
    }
    long long v14 = v16;
    uint64_t v15 = v17;
    if ([v9 hasNewPixelBufferForItemTime:&v14]) {
      break;
    }

    if (v5 == ++v6) {
      return 0;
    }
  }
  long long v12 = v16;
  uint64_t v13 = v17;
  float v10 = (__CVBuffer *)[v9 copyPixelBufferForItemTime:&v12 itemTimeForDisplay:0];
  self->_currentPlayerItemOutput = v7;

  return v10;
}

- (void)seekToTime:(id *)a3
{
  if (self->_playerQueue)
  {
    CMTime time = *(CMTime *)a3;
    CMTimeConvertScale(&v9, &time, HIDWORD(self->_videoTrackRange.start.value), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    *(CMTime *)a3 = v9;
    if ([(PVLivePlayerAVAssetSource *)self loopPlayback])
    {
      CMTimeMake(&v9, (a3->var0 - *(void *)(&self->_assetRate + 1))% *(int64_t *)((char *)&self->_videoTrackRange.start.epoch + 4), a3->var1);
      *(CMTime *)a3 = v9;
    }
    playerQueue = self->_playerQueue;
    long long v6 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(AVQueuePlayer *)playerQueue seekToTime:&v6];
  }
}

- (__CVBuffer)_copyPixelBufferForTime:(id *)a3
{
  int v5 = [(NSArray *)self->_playerItemOutputs count];
  if (v5 < 1) {
    return 0;
  }
  int v6 = 0;
  int v7 = 0;
  while (1)
  {
    int v8 = (v6 + self->_currentPlayerItemOutput) % v5;
    CMTime v9 = [(NSArray *)self->_playerItemOutputs objectAtIndex:v8];

    long long v14 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    if ([v9 hasNewPixelBufferForItemTime:&v14]) {
      break;
    }
    ++v6;
    int v7 = v9;
    if (v5 == v6)
    {
      float v10 = 0;
      goto LABEL_8;
    }
  }
  long long v12 = *(_OWORD *)&a3->var0;
  int64_t v13 = a3->var3;
  float v10 = (__CVBuffer *)[v9 copyPixelBufferForItemTime:&v12 itemTimeForDisplay:0];
  self->_currentPlayerItemOutput = v8;
LABEL_8:

  return v10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  int v6 = [(NSArray *)self->_playerItemOutputs objectAtIndexedSubscript:self->_currentPlayerItemOutput];
  id v8 = v6;
  if (v6)
  {
    [v6 itemTimeForHostTime:a4];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (void)setMuted:(BOOL)a3
{
  playerQueue = self->_playerQueue;
  if (playerQueue) {
    [(AVQueuePlayer *)playerQueue setMuted:a3];
  }
}

- (void)setupPlayer
{
  v3 = [MEMORY[0x1E4F16620] playerItemWithAsset:self->_asset automaticallyLoadedAssetKeys:&unk_1F11EC640];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, 0);
  int v5 = [MEMORY[0x1E4F16670] queuePlayerWithItems:v4];
  playerQueue = self->_playerQueue;
  self->_playerQueue = v5;

  [(AVQueuePlayer *)self->_playerQueue setAutomaticallyWaitsToMinimizeStalling:0];
  if ([(PVLivePlayerAVAssetSource *)self loopPlayback])
  {
    int v7 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:self->_playerQueue templateItem:v3];
    playerLooper = self->_playerLooper;
    self->_playerLooper = v7;
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  asset = self->_asset;
  uint64_t v11 = *MEMORY[0x1E4F15C18];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = *(void *)"";
  v32[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke;
  v32[3] = &unk_1E6169218;
  v34 = &v35;
  long long v12 = v9;
  v33 = v12;
  [(AVAsset *)asset loadTracksWithMediaType:v11 completionHandler:v32];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v13 = [(id)v36[5] formatDescriptions];
  long long v14 = (const opaqueCMFormatDescription *)[v13 objectAtIndex:0];

  uint64_t v15 = v36;
  long long v16 = (void *)v36[5];
  if (v16)
  {
    [v16 timeRange];
    uint64_t v15 = v36;
  }
  else
  {
    long long v31 = 0u;
    memset(v30, 0, sizeof(v30));
  }
  long long v17 = *(_OWORD *)&v30[16];
  *(_OWORD *)(&self->_assetRate + 1) = *(_OWORD *)v30;
  *(_OWORD *)&self->_videoTrackRange.start.flags = v17;
  *(_OWORD *)((char *)&self->_videoTrackRange.duration.value + 4) = v31;
  [(id)v15[5] nominalFrameRate];
  HIDWORD(self->_videoTrackRange.duration.epoch) = v18;
  CMTimeMake((CMTime *)v30, 1, HIDWORD(self->_videoTrackRange.start.value));
  *(_OWORD *)&self->_videoTrackFrameRate = *(_OWORD *)v30;
  *(void *)&self->_videoTrackFrameDelta.timescale = *(void *)&v30[16];
  self->_videoTrackFrameDelta.epoch = (int64_t)CMVideoFormatDescriptionGetDimensions(v14);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v19 setObject:&unk_1F11EC658 forKey:*MEMORY[0x1E4F24D70]];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PVLivePlayerAVAssetSource *)self loopPlayback])
  {
    objc_super v21 = [(AVPlayerLooper *)self->_playerLooper loopingPlayerItems];
    v22 = v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = *(void *)"";
    v29[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_47;
    v29[3] = &unk_1E6169240;
    v29[4] = v19;
    v29[5] = v20;
    [v21 enumerateObjectsUsingBlock:v29];
  }
  else
  {
    objc_super v21 = [(AVQueuePlayer *)self->_playerQueue items];
    v22 = v28;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = *(void *)"";
    v28[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_2;
    v28[3] = &unk_1E6169240;
    v28[4] = v19;
    v28[5] = v20;
    [v21 enumerateObjectsUsingBlock:v28];
  }

  [(PVLivePlayerAVAssetSource *)self startObservers];
  v23 = (NSArray *)[v20 copy];
  playerItemOutputs = self->_playerItemOutputs;
  self->_playerItemOutputs = v23;

  v25 = self->_playerItemOutputs;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = *(void *)"";
  v27[2] = __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_3;
  v27[3] = &unk_1E6169268;
  v27[4] = self;
  [(NSArray *)v25 enumerateObjectsUsingBlock:v27];
  self->_currentPlayerItemOutput = 0;
  long long v26 = *(_OWORD *)&self->_videoTrackRange.start.flags;
  *(_OWORD *)(&self->_currentPlayerItemOutput + 1) = *(_OWORD *)(&self->_assetRate + 1);
  *(_OWORD *)&self->_currentPlayerItemRange.start.flags = v26;
  *(_OWORD *)((char *)&self->_currentPlayerItemRange.duration.value + 4) = *(_OWORD *)((char *)&self->_videoTrackRange.duration.value
                                                                                     + 4);

  _Block_object_dispose(&v35, 8);
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_47(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F16648]) initWithPixelBufferAttributes:*(void *)(a1 + 32)];
  [v4 addOutput:v3];
  [*(id *)(a1 + 40) addObject:v3];
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F16648]) initWithPixelBufferAttributes:*(void *)(a1 + 32)];
  [v4 addOutput:v3];
  [*(id *)(a1 + 40) addObject:v3];
}

void __40__PVLivePlayerAVAssetSource_setupPlayer__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 224)];
  [v3 setSuppressesPlayerRendering:1];
  [v3 requestNotificationOfMediaDataChangeWithAdvanceInterval:1.0];
}

- (void)finishReading
{
  [(PVLivePlayerAVAssetSource *)self setStatus:3];
  playbackReadyCondVar = self->_playbackReadyCondVar;

  dispatch_semaphore_signal(playbackReadyCondVar);
}

- (void)startObservers
{
  [(AVQueuePlayer *)self->_playerQueue addObserver:self forKeyPath:@"status" options:0 context:&s_PlayerQueueStatusObservationContext];
  if ([(PVLivePlayerAVAssetSource *)self loopPlayback]) {
    [(AVPlayerLooper *)self->_playerLooper loopingPlayerItems];
  }
  else {
  id v3 = [(AVQueuePlayer *)self->_playerQueue items];
  }
  id v5 = [v3 lastObject];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_playerItemDidPlayToEnd_ name:*MEMORY[0x1E4F16020] object:v5];
}

- (void)stopObservers
{
  [(AVQueuePlayer *)self->_playerQueue removeObserver:self forKeyPath:@"status" context:&s_PlayerQueueStatusObservationContext];
  if ([(PVLivePlayerAVAssetSource *)self loopPlayback]) {
    [(AVPlayerLooper *)self->_playerLooper loopingPlayerItems];
  }
  else {
  id v3 = [(AVQueuePlayer *)self->_playerQueue items];
  }
  id v5 = [v3 lastObject];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F16020] object:v5];
}

- (void)playerItemDidPlayToEnd:(id)a3
{
  if (![(PVLivePlayerAVAssetSource *)self loopPlayback])
  {
    [(PVLivePlayerAVAssetSource *)self finishReading];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v10 isEqualToString:@"status"] ^ 1;
  if (a6 != &s_PlayerQueueStatusObservationContext) {
    LOBYTE(v13) = 1;
  }
  if (v13)
  {
    v14.receiver = self;
    v14.super_class = (Class)PVLivePlayerAVAssetSource;
    [(PVLivePlayerAVAssetSource *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
  else if ([v11 status] == 1)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dispatchQueue);
  }
}

- (void)outputMediaDataWillChange:(id)a3
{
}

- (int)status
{
  return HIDWORD(self->_outputReadyCondVar);
}

- (void)setStatus:(int)a3
{
  HIDWORD(self->_outputReadyCondVar) = a3;
}

- (BOOL)loopPlayback
{
  return (BOOL)self->_outputReadyCondVar;
}

- (void)setLoopPlayback:(BOOL)a3
{
  LOBYTE(self->_outputReadyCondVar) = a3;
}

- (BOOL)repeatFrames
{
  return BYTE1(self->_outputReadyCondVar);
}

- (void)setRepeatFrames:(BOOL)a3
{
  BYTE1(self->_outputReadyCondVar) = a3;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackReadyCondVar, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_videoTrackDimensions, 0);
  objc_storeStrong((id *)&self->_cacheImageFrameSet, 0);
  objc_storeStrong((id *)&self->_playerItemOutputs, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerQueue, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end