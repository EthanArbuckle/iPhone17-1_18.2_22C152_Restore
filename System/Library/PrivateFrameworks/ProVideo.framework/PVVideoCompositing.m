@interface PVVideoCompositing
+ (BOOL)flushOnFinalRelease;
+ (void)setFlushOnFinalRelease:(BOOL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)schedulingTime;
- (BOOL)canConformColorOfSourceFrames;
- (BOOL)cancelsPendingRequests;
- (BOOL)inPlayback;
- (BOOL)shouldDoLowPowerExport;
- (BOOL)supportsHDRSourceFrames;
- (BOOL)supportsWideColorSourceFrames;
- (BOOL)thumbnailCompositing;
- (NSDictionary)requiredPixelBufferAttributesForRenderContext;
- (NSDictionary)sourcePixelBufferAttributes;
- (PVVideoCompositing)init;
- (float)playerRate;
- (id).cxx_construct;
- (id)refreshCompletionBlock;
- (unsigned)minimumRequestCompletionTimeMS;
- (unsigned)parentCode;
- (void)_validateDestinationBufferColorSpace:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)callRefreshCompletionBlock:(BOOL)a3;
- (void)cancelAllPendingVideoCompositionRequests;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)didRecieveMemoryWarning:(id)a3;
- (void)renderContextChanged:(id)a3;
- (void)renderRequestFinished:(HGRef<PVRenderJob>)a3;
- (void)setCancelsPendingRequests:(BOOL)a3;
- (void)setColorSpacesFromDestinationBuffer:(id)a3;
- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPlayerRate:(float)a3;
- (void)setRefreshCompletionBlock:(id)a3;
- (void)setSchedulingTime:(id *)a3;
- (void)setThumbnailCompositing:(BOOL)a3;
- (void)setupEffectScheduler;
- (void)setupTextureFactories;
- (void)signalScheduling:(id *)a3 playerRate:(float)a4;
- (void)signalSchedulingResetSearch;
- (void)startVideoCompositionRequest:(id)a3;
- (void)updateDestinationFormatForOutputColorSpace;
- (void)videoCompositionChanged:(id)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation PVVideoCompositing

- (NSDictionary)sourcePixelBufferAttributes
{
  v17[3] = *MEMORY[0x1E4F143B8];
  sourceAttributes = self->_sourceAttributes;
  if (!sourceAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (+[PVEnvironment PV_DISABLE_YCBCR_INPUTS])
    {
      v17[0] = &unk_1F11EC0D0;
      v17[1] = &unk_1F11EC0E8;
      v17[2] = &unk_1F11EC100;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
LABEL_10:
      [(NSDictionary *)v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
      [(NSDictionary *)v4 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
      p_sourceAttributes = &self->_sourceAttributes;
      v12 = *p_sourceAttributes;
      *p_sourceAttributes = v4;

      sourceAttributes = *p_sourceAttributes;
      goto LABEL_11;
    }
    v16[0] = &unk_1F11EC148;
    v16[1] = &unk_1F11EC160;
    v16[2] = &unk_1F11EC178;
    v16[3] = &unk_1F11EC190;
    v16[4] = &unk_1F11EC0E8;
    v16[5] = &unk_1F11EC100;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    v15[0] = &unk_1F11EC118;
    v15[1] = &unk_1F11EC130;
    v15[2] = &unk_1F11EC148;
    v15[3] = &unk_1F11EC160;
    v15[4] = &unk_1F11EC178;
    v15[5] = &unk_1F11EC190;
    v15[6] = &unk_1F11EC0D0;
    v15[7] = &unk_1F11EC0E8;
    v15[8] = &unk_1F11EC100;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:9];
    v7 = [(PVRendererBase *)self compositingContext];
    v8 = [v7 outputColorSpace];
    if ([v8 isHDRSpace])
    {
      BOOL v9 = [(PVVideoCompositing *)self canConformColorOfSourceFrames];

      v10 = v14;
      if (!v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10 = v6;
LABEL_9:
    id v5 = v10;

    goto LABEL_10;
  }
LABEL_11:

  return sourceAttributes;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  v17[1] = *MEMORY[0x1E4F143B8];
  destinationBufferPoolAttributes = self->_destinationBufferPoolAttributes;
  if (!destinationBufferPoolAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (+[PVEnvironment PV_ENABLE_420V_OUTPUT])
    {
      id v5 = &unk_1F11EC118;
LABEL_10:
      v17[0] = v5;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [(NSDictionary *)v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F24D70]];

      [(NSDictionary *)v4 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
      p_destinationBufferPoolAttributes = &self->_destinationBufferPoolAttributes;
      v15 = *p_destinationBufferPoolAttributes;
      *p_destinationBufferPoolAttributes = v4;

      destinationBufferPoolAttributes = *p_destinationBufferPoolAttributes;
      goto LABEL_11;
    }
    v6 = [(PVRendererBase *)self compositingContext];
    v7 = [v6 outputColorSpace];
    char v8 = [v7 isP3d65GammaColorSpace];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = [(PVRendererBase *)self compositingContext];
      v10 = [v9 outputColorSpace];
      if ([v10 isWideGamutSpace])
      {
        v11 = [(PVRendererBase *)self compositingContext];
        int v12 = [v11 gpuRenderAPI];

        if (v12)
        {
          id v5 = &unk_1F11EC148;
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    id v5 = &unk_1F11EC0D0;
    goto LABEL_10;
  }
LABEL_11:

  return destinationBufferPoolAttributes;
}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (BOOL)canConformColorOfSourceFrames
{
  char v3 = +[PVEnvironment PV_ENABLE_AVF_COLOR_CONFORM_INPUTS];
  v4 = [(PVRendererBase *)self compositingContext];
  id v5 = [v4 workingColorSpace];
  char v6 = [v5 isRec2020LinearColorSpace];

  return v6 & ~v3;
}

- (PVVideoCompositing)init
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PVVideoCompositing;
  id v2 = [(PVRendererBase *)&v16 init];
  if (v2)
  {
    if (-[PVVideoCompositing init]::onceToken != -1) {
      dispatch_once(&-[PVVideoCompositing init]::onceToken, &__block_literal_global_13);
    }
    v14 = (HGSynchronizable *)sRefCountLock;
    char v15 = 0;
    HGSynchronizable::Lock((HGSynchronizable *)sRefCountLock);
    ++sLivingCompositorRefCount;
    uint64_t v3 = +[PVEnvironment PV_MAX_EXPECTED_LIVE_COMPOSITORS];
    if (sLivingCompositorRefCount > v3)
    {
      v17[0] = @"kPVVideoCompositingTooManyLiveCompositorsWarning_LiveCount";
      v4 = objc_msgSend(NSNumber, "numberWithInt:");
      v17[1] = @"kPVVideoCompositingTooManyLiveCompositorsWarning_MaxExpected";
      v18[0] = v4;
      id v5 = [NSNumber numberWithUnsignedInt:v3];
      v18[1] = v5;
      char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"kPVVideoCompositingTooManyCompositorsWarning" object:v6];
    }
    HGSynchronizer::~HGSynchronizer(&v14);
    PVRenderManager::INSTANCE(v8, &v14);
    BOOL v9 = (HGSynchronizable *)*((void *)v2 + 36);
    v10 = v14;
    if (v9 == v14)
    {
      if (v9) {
        (*((void (**)(HGSynchronizable *))v9->var0 + 3))(v9);
      }
    }
    else
    {
      if (v9)
      {
        (*((void (**)(HGSynchronizable *))v9->var0 + 3))(v9);
        v10 = v14;
      }
      *((void *)v2 + 36) = v10;
    }
    [v2 setupTextureFactories];
    PVRenderManager::FreeTexturePools(*((PVRenderManager **)v2 + 36));
    [v2 setupEffectScheduler];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *((_OWORD *)v2 + 7) = *MEMORY[0x1E4F1FA48];
    *((void *)v2 + 16) = v11;
    int v12 = +[PVVideoCompositingContext createContextForGPU];
    [v2 setCompositingContext:v12];

    operator new();
  }
  return 0;
}

void __26__PVVideoCompositing_init__block_invoke()
{
}

- (void)setupTextureFactories
{
}

- (void)setupEffectScheduler
{
  uint64_t v3 = objc_alloc_init(PVEffectScheduler);
  effectScheduler = self->_effectScheduler;
  self->_effectScheduler = v3;

  int64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)&self->_schedulingTime.value = *MEMORY[0x1E4F1F9F8];
  self->_schedulingTime.epoch = v5;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43718] object:0];

  [(PVVideoCompositing *)self cancelAllPendingVideoCompositionRequests];
  v13 = (HGSynchronizable *)sRefCountLock;
  char v14 = 0;
  HGSynchronizable::Lock((HGSynchronizable *)sRefCountLock);
  int v5 = --sLivingCompositorRefCount;
  if (!sLivingCompositorRefCount)
  {
    [(PVVideoCompositing *)self setPlayerRate:0.0];
    long long v11 = *MEMORY[0x1E4F1F9F8];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(PVVideoCompositing *)self setSchedulingTime:&v11];
    +[PVInstructionGraphImageSourceNode purgeBitmapCache:1];
  }
  HGSynchronizer::~HGSynchronizer(&v13);
  [(PVRendererBase *)self printAndClearStats];
  PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  if (!v5 && [(id)objc_opt_class() flushOnFinalRelease]) {
    +[PVEffectResources flushEngine];
  }
  notificationStateLock = self->_notificationStateLock;
  if (notificationStateLock) {
    (*((void (**)(HGSynchronizable *))notificationStateLock->var0 + 1))(notificationStateLock);
  }
  throttleLock = self->_throttleLock;
  if (throttleLock) {
    (*((void (**)(HGSynchronizable *))throttleLock->var0 + 1))(throttleLock);
  }
  playerRateLock = self->_playerRateLock;
  if (playerRateLock) {
    (*((void (**)(HGSynchronizable *))playerRateLock->var0 + 1))(playerRateLock);
  }
  trackerLock = self->_trackerLock;
  if (trackerLock) {
    (*((void (**)(HGSynchronizable *))trackerLock->var0 + 1))(trackerLock);
  }
  v10.receiver = self;
  v10.super_class = (Class)PVVideoCompositing;
  [(PVRendererBase *)&v10 dealloc];
}

- (void)renderContextChanged:(id)a3
{
  v4 = (AVVideoCompositionRenderContext *)a3;
  int v5 = [(PVRendererBase *)self compositingContext];
  char v6 = (PVAVFInstructionGraphContext *)HGObject::operator new(0x88uLL);
  PVAVFInstructionGraphContext::PVAVFInstructionGraphContext(v6, v5, v4, self->_thumbnailCompositing);

  effectScheduler = self->_effectScheduler;
  char v15 = v6;
  if (v6) {
    (*(void (**)(PVAVFInstructionGraphContext *))(*(void *)v6 + 16))(v6);
  }
  [(PVEffectScheduler *)effectScheduler setEffectLoadingRenderContext:&v15];
  if (v15) {
    (*(void (**)(PVAVFInstructionGraphContext *))(*(void *)v15 + 24))(v15);
  }
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  [(PVVideoCompositing *)self schedulingTime];
  if ((unsigned __int128)0 >> 96)
  {
    char v8 = self->_effectScheduler;
    [(PVVideoCompositing *)self playerRate];
    -[PVEffectScheduler loadEffects:playerRate:](v8, "loadEffects:playerRate:", &v12);
  }
  videoComposition = self->_videoComposition;
  objc_super v10 = [(AVVideoCompositionRenderContext *)v4 videoComposition];

  if (videoComposition != v10)
  {
    long long v11 = [(AVVideoCompositionRenderContext *)v4 videoComposition];
    [(PVVideoCompositing *)self videoCompositionChanged:v11];
  }
  [(PVVideoCompositing *)self _validateDestinationBufferColorSpace:v4];
  if (v6) {
    (*(void (**)(PVAVFInstructionGraphContext *))(*(void *)v6 + 24))(v6);
  }
}

- (void)setColorSpacesFromDestinationBuffer:(id)a3
{
  v4 = (__CVBuffer *)[a3 newPixelBuffer];
  if (!v4) {
    return;
  }
  int v5 = v4;
  CFTypeRef v6 = CVBufferCopyAttachment(v4, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  if (v6)
  {
    v7 = v6;
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F24AC0]))
    {
      char v8 = +[PVColorSpace p3d65GammaColorSpace];
      BOOL v9 = [(PVRendererBase *)self compositingContext];
      [v9 setWorkingColorSpace:v8];

      objc_super v10 = +[PVColorSpace p3d65GammaColorSpace];
      long long v11 = [(PVRendererBase *)self compositingContext];
      [v11 setOutputColorSpace:v10];

      long long v12 = [(PVRendererBase *)self compositingContext];
      [v12 setWorkingColorSpaceConformIntent:0];

      long long v13 = [(PVRendererBase *)self compositingContext];
      [v13 setBufferFormat:24];
    }
    else
    {
      if (!CFEqual(v7, (CFTypeRef)*MEMORY[0x1E4F24AB0]))
      {
LABEL_9:
        CFRelease(v7);
        goto LABEL_10;
      }
      uint64_t v14 = +[PVColorSpace rec709GammaColorSpace];
      char v15 = [(PVRendererBase *)self compositingContext];
      [v15 setWorkingColorSpace:v14];

      objc_super v16 = +[PVColorSpace rec709GammaColorSpace];
      v17 = [(PVRendererBase *)self compositingContext];
      [v17 setOutputColorSpace:v16];

      v18 = [(PVRendererBase *)self compositingContext];
      [v18 setWorkingColorSpaceConformIntent:0];

      long long v13 = [(PVRendererBase *)self compositingContext];
      [v13 setBufferFormat:24];
    }

    goto LABEL_9;
  }
LABEL_10:

  CVPixelBufferRelease(v5);
}

- (void)_validateDestinationBufferColorSpace:(id)a3
{
  id v11 = a3;
  v4 = (__CVBuffer *)[v11 newPixelBuffer];
  if (v4)
  {
    int v5 = +[PVColorSpace pvColorSpaceForCVPixelBuffer:v4];
    CFTypeRef v6 = [(PVRendererBase *)self compositingContext];
    v7 = [v6 outputColorSpace];
    char v8 = [v5 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      BOOL v9 = [(PVRendererBase *)self compositingContext];
      objc_super v10 = [v9 outputColorSpace];
      NSLog(&cfstr_WarningDestina.isa, self, v5, v10);
    }
    CVPixelBufferRelease(v4);
  }
  else
  {
    NSLog(&cfstr_WarningUnableT.isa, self);
  }
}

- (void)updateDestinationFormatForOutputColorSpace
{
  if (self->_destinationBufferPoolAttributes) {
    NSLog(&cfstr_WarningComposi.isa, a2, self);
  }
}

- (void)videoCompositionChanged:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_videoComposition, a3);
  p_videoCompositionDuration = &self->_videoCompositionDuration;
  int64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&self->_videoCompositionDuration.value = *MEMORY[0x1E4F1FA48];
  self->_videoCompositionDuration.epoch = v7;
  [(AVVideoComposition *)self->_videoComposition instructions];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        *(_OWORD *)&lhs.value = *(_OWORD *)&p_videoCompositionDuration->value;
        lhs.epoch = self->_videoCompositionDuration.epoch;
        if (v12) {
          [v12 timeRange];
        }
        else {
          memset(v13, 0, sizeof(v13));
        }
        CMTime rhs = *(CMTime *)&v13[1];
        CMTimeAdd(&v16, &lhs, &rhs);
        *(_OWORD *)&p_videoCompositionDuration->value = *(_OWORD *)&v16.value;
        self->_videoCompositionDuration.epoch = v16.epoch;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(PVEffectScheduler *)self->_effectScheduler resetSchedule:self->_videoComposition];
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v4 = a3;
  time.value = (CMTimeValue)self->_notificationStateLock;
  LOBYTE(time.timescale) = 0;
  HGSynchronizable::Lock((HGSynchronizable *)time.value);
  BOOL hostAppIsShuttingDown = self->_hostAppIsShuttingDown;
  HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);
  if (hostAppIsShuttingDown)
  {
    [v4 finishCancelledRequest];
  }
  else
  {
    CFTypeRef v6 = [v4 renderContext];
    [(PVVideoCompositing *)self _validateDestinationBufferColorSpace:v6];

    memset(&v37, 0, sizeof(v37));
    if (v4)
    {
      [v4 compositionTime];
      int32_t timescale = v37.timescale;
    }
    else
    {
      int32_t timescale = 0;
    }
    CMTime time1 = v37;
    CMTimeMake(&time2, 0, timescale);
    CMTimeMaximum(&time, &time1, &time2);
    CMTime v37 = time;
    CMTime v34 = time;
    CMTime lhs = (CMTime)self->_videoCompositionDuration;
    CMTimeMake(&rhs, 1, self->_videoCompositionDuration.timescale);
    CMTimeSubtract(&v33, &lhs, &rhs);
    CMTimeMinimum(&time, &v34, &v33);
    CMTime v37 = time;
    id v8 = [(PVTaskTokenPool *)self->_tokenPool getToken];
    uint64_t v9 = [PVAVFRenderJobDelegate alloc];
    CMTime v30 = v37;
    uint64_t v10 = [(PVAVFRenderJobDelegate *)v9 initWithCompositor:self request:v4 compositionTime:&v30 thumbnailCompositing:self->_thumbnailCompositing];
    [(PVAVFRenderJobDelegate *)v10 setMinimumRequestCompletionTimeMS:self->_minimumRequestCompletionTimeMS];
    [(PVAVFRenderJobDelegate *)v10 setParentCode:[(PVVideoCompositing *)self parentCode]];
    -[PVAVFRenderJobDelegate setChildCode:](v10, "setChildCode:", [v8 tokenId]);
    [(PVAVFRenderJobDelegate *)v10 setToken:v8];
    time.value = (CMTimeValue)self->_throttleLock;
    LOBYTE(time.timescale) = 0;
    HGSynchronizable::Lock((HGSynchronizable *)time.value);
    if (+[PVEnvironment PV_THROTTLE_EXPORT_ON_MEM_WARNING]&& (unsigned int throttleRequestHandling = self->_throttleRequestHandling) != 0)
    {
      self->_unsigned int throttleRequestHandling = throttleRequestHandling - 1;
      int v12 = 1;
    }
    else
    {
      int v12 = 0;
    }
    HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);
    long long v13 = [v4 renderContext];
    int v14 = [v13 highQualityRendering];

    if (v14)
    {
      PVRenderManager::FlushTextureFactories(self->_renderManager.m_Obj);
      if (v12)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v15) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
        usleep(0x7A120u);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v16) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
      }
    }
    if (+[PVEnvironment PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS])
    {
      long long v17 = [v4 renderContext];
      int v18 = [v17 highQualityRendering];

      if (v18)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v19) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
        usleep(1000* +[PVEnvironment PV_THROTTLE_AVF_EXPORT_REQUEST_HANDLING_MS]);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v20) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
      }
    }
    v21 = [v4 renderContext];
    if ([v21 highQualityRendering])
    {
      BOOL v22 = +[PVDeviceCharacteristics isLowMemDevice];

      if (v22)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v23) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
        usleep(0x88B8u);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v24) >= 1)
        {
          [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
          kdebug_trace();
        }
      }
    }
    else
    {
    }
    if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v23) >= 1)
    {
      if (v4) {
        [v4 compositionTime];
      }
      else {
        memset((char *)&v29[1] + 8, 0, 24);
      }
      CMTime time = *(CMTime *)((char *)&v29[1] + 8);
      CMTimeGetSeconds(&time);
      [(PVAVFRenderJobDelegate *)v10 packedFamilyCode];
      kdebug_trace();
    }
    [(PVRendererBase *)self startJobForDelegate:v10 time:v29 playback:[(PVVideoCompositing *)self inPlayback]];
    if (+[PVEnvironment PV_SERIALIZE_EXPORT_REQUESTS])
    {
      v25 = [v4 renderContext];
      int v26 = [v25 highQualityRendering];

      if (v26) {
        PVRenderJob::WaitForFinish((PVRenderJob *)time.value);
      }
    }
    v27 = [v4 renderContext];
    int v28 = v12 & [v27 highQualityRendering];

    if (v28 == 1) {
      PVRenderJob::WaitForFinish((PVRenderJob *)time.value);
    }
    if (time.value) {
      (*(void (**)(CMTimeValue))(*(void *)time.value + 24))(time.value);
    }
  }
}

- (void)setCancelsPendingRequests:(BOOL)a3
{
  if (self->_cancelsPendingRequests != a3)
  {
    cancelPendingLock = self->_cancelPendingLock;
    char v6 = 0;
    HGSynchronizable::Lock(cancelPendingLock);
    self->_cancelsPendingRequests = a3;
    HGSynchronizer::~HGSynchronizer(&cancelPendingLock);
  }
}

- (void)cancelAllPendingVideoCompositionRequests
{
  cancelPendingLock = self->_cancelPendingLock;
  char v4 = 0;
  HGSynchronizable::Lock(cancelPendingLock);
  if (self->_cancelsPendingRequests) {
    [(PVRendererBase *)self cancelAllPendingRequests];
  }
  HGSynchronizer::~HGSynchronizer(&cancelPendingLock);
}

+ (void)setFlushOnFinalRelease:(BOOL)a3
{
  sFlushOnFinalRelease = a3;
}

+ (BOOL)flushOnFinalRelease
{
  return sFlushOnFinalRelease;
}

- (void)signalScheduling:(id *)a3 playerRate:(float)a4
{
  -[PVVideoCompositing setPlayerRate:](self, "setPlayerRate:");
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [(PVVideoCompositing *)self setSchedulingTime:&v8];
  [(PVEffectScheduler *)self->_effectScheduler loadEffects:&v7 playerRate:COERCE_DOUBLE(__PAIR64__(HIDWORD(a3->var0), LODWORD(a4)))];
}

- (void)signalSchedulingResetSearch
{
}

- (void)setPlayerRate:(float)a3
{
  playerRateLock = self->_playerRateLock;
  char v11 = 0;
  HGSynchronizable::Lock(playerRateLock);
  if (a3 == 0.0 && self->_playerRate != 0.0)
  {
    [(PVRendererBase *)self printAndClearStats];
    self->_windowedDropTotal = 0;
    begin = self->_dropFrameTracker.__map_.__begin_;
    end = self->_dropFrameTracker.__map_.__end_;
    self->_dropFrameTracker.__size_.__value_ = 0;
    unint64_t v7 = (char *)end - (char *)begin;
    if (v7 >= 0x11)
    {
      do
      {
        operator delete(*begin);
        $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = self->_dropFrameTracker.__map_.__end_;
        begin = self->_dropFrameTracker.__map_.__begin_ + 1;
        self->_dropFrameTracker.__map_.__begin_ = begin;
        unint64_t v7 = (char *)v8 - (char *)begin;
      }
      while (v7 > 0x10);
    }
    if (v7 >> 3 == 1)
    {
      unint64_t v9 = 512;
      goto LABEL_9;
    }
    if (v7 >> 3 == 2)
    {
      unint64_t v9 = 1024;
LABEL_9:
      self->_dropFrameTracker.__start_ = v9;
    }
  }
  self->_playerRate = a3;
  HGSynchronizer::~HGSynchronizer(&playerRateLock);
  PVRenderManager::SetMinRenderPriority(self->_renderManager.m_Obj, a3 != 0.0);
}

- (BOOL)inPlayback
{
  [(PVVideoCompositing *)self playerRate];
  return v2 != 0.0;
}

- (float)playerRate
{
  playerRateLock = self->_playerRateLock;
  char v6 = 0;
  HGSynchronizable::Lock(playerRateLock);
  float playerRate = self->_playerRate;
  HGSynchronizer::~HGSynchronizer(&playerRateLock);
  return playerRate;
}

- (void)setSchedulingTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_schedulingTime.value = *(_OWORD *)&a3->var0;
  self->_schedulingTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)schedulingTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
  return self;
}

- (void)setRefreshCompletionBlock:(id)a3
{
  id v4 = a3;
  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __48__PVVideoCompositing_setRefreshCompletionBlock___block_invoke;
  v7[3] = &unk_1E61698B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(refreshCompletionCallbackQueue, v7);
}

void __48__PVVideoCompositing_setRefreshCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1BA9C0C60](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 328);
  *(void *)(v3 + 328) = v2;
}

- (id)refreshCompletionBlock
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __44__PVVideoCompositing_refreshCompletionBlock__block_invoke;
  v5[3] = &unk_1E6169380;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(refreshCompletionCallbackQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1BA9C0C60](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__PVVideoCompositing_refreshCompletionBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1BA9C0C60](*(void *)(*(void *)(a1 + 32) + 328));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)callRefreshCompletionBlock:(BOOL)a3
{
  refreshCompletionCallbackQueue = self->_refreshCompletionCallbackQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __49__PVVideoCompositing_callRefreshCompletionBlock___block_invoke;
  v4[3] = &unk_1E61692B0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(refreshCompletionCallbackQueue, v4);
}

uint64_t __49__PVVideoCompositing_callRefreshCompletionBlock___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 328);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)(*(void *)(result + 32) + 328), *(unsigned __int8 *)(result + 40));
  }
  return result;
}

- (void)renderRequestFinished:(HGRef<PVRenderJob>)a3
{
  BOOL v5 = PVRenderJob::GetDelegate(*(PVRenderJob **)a3.var0);
  tokenPool = self->_tokenPool;
  unint64_t v7 = [v5 token];
  [(PVTaskTokenPool *)tokenPool returnToken:v7];

  uint64_t v8 = *(void *)a3.var0;
  uint64_t v14 = v8;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
  }
  [(PVRendererBase *)self renderJobFinished:&v14];
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
  }
  int v9 = PVRenderJob::State(*(PVRenderJob **)a3.var0);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v10) >= 1)
  {
    id v11 = [v5 compositionRequest];
    int v12 = v11;
    if (v11) {
      [v11 compositionTime];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CMTime time = v13;
    CMTimeGetSeconds(&time);
    [v5 packedFamilyCode];
    kdebug_trace();
  }
  time.value = (CMTimeValue)self->_playerRateLock;
  LOBYTE(time.timescale) = 0;
  HGSynchronizable::Lock((HGSynchronizable *)time.value);
  if (self->_playerRate == 0.0) {
    [(PVVideoCompositing *)self callRefreshCompletionBlock:v9 == 4];
  }
  HGSynchronizer::~HGSynchronizer((HGSynchronizable **)&time);
}

- (BOOL)shouldDoLowPowerExport
{
  notificationStateLock = self->_notificationStateLock;
  char v9 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  BOOL didEnterBackground = self->_didEnterBackground;
  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
  id v4 = [(PVRendererBase *)self compositingContext];
  char v5 = [v4 powerFriendlyExport];
  if (didEnterBackground) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5;
  }

  return v6;
}

- (void)didRecieveMemoryWarning:(id)a3
{
  PVRenderManager::FreeTexturePools(self->_renderManager.m_Obj);
  throttleLock = self->_throttleLock;
  char v5 = 0;
  HGSynchronizable::Lock(throttleLock);
  self->_unsigned int throttleRequestHandling = 10;
  HGSynchronizer::~HGSynchronizer(&throttleLock);
}

- (void)applicationWillTerminate:(id)a3
{
  notificationStateLock = self->_notificationStateLock;
  char v5 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_BOOL hostAppIsShuttingDown = 1;
  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (void)didEnterBackground:(id)a3
{
  notificationStateLock = self->_notificationStateLock;
  char v7 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_BOOL didEnterBackground = 1;
  uint64_t v4 = +[PVEnvironment PVPageSizeBackgrounded];
  char v5 = [(PVRendererBase *)self compositingContext];
  [v5 setPageSize:v4];

  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (void)willEnterForeground:(id)a3
{
  notificationStateLock = self->_notificationStateLock;
  char v7 = 0;
  HGSynchronizable::Lock(notificationStateLock);
  self->_BOOL didEnterBackground = 0;
  uint64_t v4 = +[PVEnvironment PVPageSize];
  char v5 = [(PVRendererBase *)self compositingContext];
  [v5 setPageSize:v4];

  HGSynchronizer::~HGSynchronizer(&notificationStateLock);
}

- (BOOL)thumbnailCompositing
{
  return self->_thumbnailCompositing;
}

- (void)setThumbnailCompositing:(BOOL)a3
{
  self->_thumbnailCompositing = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (BOOL)cancelsPendingRequests
{
  return self->_cancelsPendingRequests;
}

- (unsigned)minimumRequestCompletionTimeMS
{
  return self->_minimumRequestCompletionTimeMS;
}

- (void)setMinimumRequestCompletionTimeMS:(unsigned int)a3
{
  self->_minimumRequestCompletionTimeMS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshCompletionBlock, 0);
  objc_storeStrong((id *)&self->_tokenPool, 0);
  objc_storeStrong((id *)&self->_refreshCompletionCallbackQueue, 0);
  m_Obj = self->_renderManager.m_Obj;
  if (m_Obj) {
    (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(m_Obj);
  }
  objc_storeStrong((id *)&self->_effectScheduler, 0);
  std::deque<int>::~deque[abi:ne180100](&self->_dropFrameTracker.__map_.__first_);
  objc_storeStrong((id *)&self->_destinationBufferPoolAttributes, 0);
  objc_storeStrong((id *)&self->_sourceAttributes, 0);

  objc_storeStrong((id *)&self->_videoComposition, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((void *)self + 36) = 0;
  return self;
}

@end