@interface PTEffect
+ (PTEffectPixelBufferDescriptor)personSegmentationMatteFormatForColorSize:(SEL)a3;
+ (int)prewarmForCameraCaptured;
+ (int)prewarmForMediaserverd;
+ (int)prewarmWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 effectType:(unint64_t)a5 sharedResources:(id)a6;
+ (void)disableAsynchronousWork;
+ (void)prewarmForCameraCaptured;
- (BOOL)isRenderRequiredForRequest:(id)a3;
- (BOOL)validPixelBuffer:(__CVBuffer *)a3;
- (PTEffect)initWithDescriptor:(id)a3;
- (PTEffect)initWithDescriptor:(id)a3 sharedResources:(id)a4;
- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 effectQuality:(int64_t)a7;
- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 prewarmOnly:(BOOL)a7 effectQuality:(int64_t)a8;
- (id)activeReactions;
- (int)_setEffectType:(unint64_t)a3;
- (int)reconfigure:(id)a3;
- (int)render:(id)a3;
- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4;
- (int)updateEffectDelegate:(BOOL)a3;
- (int)validateRenderRequest:(id)a3 reactionOnly:(BOOL)a4;
- (int)waitForInitialization;
- (int64_t)effectQuality;
- (void)_setEffectQuality:(int64_t)a3;
- (void)dealloc;
- (void)keepOldDelegateAlive:(id)a3;
- (void)removeAllActiveReactions;
- (void)reset;
- (void)setDebug:(int64_t)a3;
@end

@implementation PTEffect

- (PTEffect)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(PTEffect *)self initWithDescriptor:v4 sharedResources:v5];

  return v6;
}

- (PTEffect)initWithDescriptor:(id)a3 sharedResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PTEffect;
  v8 = [(PTEffect *)&v40 init];
  if (v8)
  {
    PTKTraceInit();
    if ([v6 prewarmOnly] && (objc_msgSend(v6, "availableEffectTypes") & 4) != 0) {
      [v6 setSyncInitialization:1];
    }
    uint64_t v9 = [v6 copy];
    effectDescriptor = v8->_effectDescriptor;
    v8->_effectDescriptor = (PTEffectDescriptor *)v9;

    v8->_frameId = 0;
    v8->_debugType = 0;
    v8->_delegateLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.portrait.effect_init", 0);
    asyncInitQueue = v8->_asyncInitQueue;
    v8->_asyncInitQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_resources, a4);
    [(PTEffectDescriptor *)v8->_effectDescriptor setAvailableEffectTypes:[(PTEffectDescriptor *)v8->_effectDescriptor availableEffectTypes] | [(PTEffectDescriptor *)v8->_effectDescriptor activeEffectType]];
    v13 = [(PTEffectDescriptor *)v8->_effectDescriptor metalCommandQueue];

    if (v13)
    {
      v14 = [PTMetalContext alloc];
      v15 = [(PTEffectDescriptor *)v8->_effectDescriptor metalCommandQueue];
      uint64_t v16 = [(PTMetalContext *)v14 initWithCommandQueue:v15 bundleClass:objc_opt_class()];
      metalContext = v8->_metalContext;
      v8->_metalContext = (PTMetalContext *)v16;

      v8->_hasExternalCommandQueue = 1;
    }
    else
    {
      id v18 = MTLCreateSystemDefaultDevice();
      v19 = [PTMetalContext alloc];
      v20 = (void *)[v18 newCommandQueue];
      uint64_t v21 = [(PTMetalContext *)v19 initWithCommandQueue:v20 bundleClass:objc_opt_class()];
      v22 = v8->_metalContext;
      v8->_metalContext = (PTMetalContext *)v21;

      v23 = [(PTMetalContext *)v8->_metalContext commandQueue];
      [v23 setGPUPriority:4];

      v24 = [(PTMetalContext *)v8->_metalContext commandQueue];
      [(PTEffectDescriptor *)v8->_effectDescriptor setMetalCommandQueue:v24];

      v8->_hasExternalCommandQueue = 0;
    }
    [(PTMetalContext *)v8->_metalContext setAllowCommandbufferAllocation:0];
    v25 = [[PTHumanDetections alloc] initWithMetalContext:v8->_metalContext];
    humanDetections = v8->_humanDetections;
    v8->_humanDetections = v25;

    if (v8->_humanDetections)
    {
      int v27 = [(PTEffect *)v8 reconfigure:v6];
      if (!v27)
      {
        v38 = v8;
        goto LABEL_17;
      }
      int v28 = v27;
      v29 = _PTLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[PTEffect initWithDescriptor:sharedResources:](v28, v29);
      }
    }
    else
    {
      v30 = _PTLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PTEffect initWithDescriptor:sharedResources:](v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
  }
  v38 = 0;
LABEL_17:

  return v38;
}

- (int)render:(id)a3
{
  id v4 = a3;
  if ([(PTMetalContext *)self->_metalContext isCommandBufferCommitted])
  {
    CMRemoveAttachment((CMAttachmentBearerRef)[v4 outColorBuffer], @"ReactionEffectComplexity");
    if ([v4 effectQuality] == -1) {
      objc_msgSend(v4, "setEffectQuality:", -[PTEffectDescriptor effectQuality](self->_effectDescriptor, "effectQuality"));
    }
    else {
      -[PTEffect _setEffectQuality:](self, "_setEffectQuality:", [v4 effectQuality]);
    }
    if ([v4 effectType] == -1) {
      objc_msgSend(v4, "setEffectType:", -[PTEffectDescriptor activeEffectType](self->_effectDescriptor, "activeEffectType"));
    }
    else {
      -[PTEffect _setEffectType:](self, "_setEffectType:", [v4 effectType]);
    }
    id v7 = (__CVBuffer *)[v4 inColorBuffer];
    uint64_t v8 = [v4 detectedObjects];
    uint64_t v9 = (__CVBuffer *)[v4 outColorBuffer];
    [v4 frameTimeSeconds];
    double v11 = v10;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__PTEffect_render___block_invoke;
    block[3] = &unk_1E68844E0;
    block[4] = self;
    *(double *)&block[5] = v10;
    if (render__onceToken != -1) {
      dispatch_once(&render__onceToken, block);
    }
    if (self->_rebuildEffect
      && (int v12 = [(PTEffect *)self updateEffectDelegate:v11 - self->_lastFrameTime > 0.5]) != 0)
    {
      OSStatus v6 = v12;
      _PTLogSystem();
      v13 = (PTEffectRenderer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
        -[PTEffect render:].cold.5();
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_delegateLock);
      v13 = self->_delegate;
      os_unfair_lock_unlock(&self->_delegateLock);
      -[PTEffectRenderer setEffectQuality:](v13, "setEffectQuality:", [v4 effectQuality]);
      if (v13
        && (int v14 = [(PTEffect *)self validateRenderRequest:v4 reactionOnly:0]) != 0)
      {
        OSStatus v6 = v14;
      }
      else
      {
        int frameId = self->_frameId;
        CVPixelBufferGetWidth(v7);
        CVPixelBufferGetHeight(v7);
        [v4 effectType];
        kdebug_trace();
        CVBufferPropagateAttachments(v7, v9);
        if (v8) {
          uint64_t v16 = v8;
        }
        else {
          uint64_t v16 = 0;
        }
        [(PTHumanDetections *)self->_humanDetections unpackDetections:v16];
        humanDetections = self->_humanDetections;
        if (self->_frameId && v11 - self->_lastDetectionUpdate <= 1.0) {
          uint64_t v18 = [(PTHumanDetections *)humanDetections filterDetections];
        }
        else {
          uint64_t v18 = [(PTHumanDetections *)humanDetections clearFilterDetections];
        }
        self->_lastDetectionUpdate = self->_lastFrameTime;
        if (v13)
        {
          BOOL v19 = !self->_hasExternalCommandQueue;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __19__PTEffect_render___block_invoke_133;
          v25[3] = &unk_1E6884508;
          id v26 = v4;
          int v28 = frameId;
          int v27 = v13;
          OSStatus v6 = [(PTEffectRenderer *)v27 render:v26 waitUntilCompleted:v19 gpuCompleted:v25];
          if (v6)
          {
            v20 = _PTLogSystem();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[PTEffect render:]();
            }
          }
        }
        else
        {
          PTDefaultsFlush(v18);
          objc_msgSend(v4, "setOutColorBufferWriteSkipped:", -[PTEffectDescriptor allowSkipOutColorBufferWrite](self->_effectDescriptor, "allowSkipOutColorBufferWrite"));
          if ([(PTEffectDescriptor *)self->_effectDescriptor allowSkipOutColorBufferWrite])
          {
            OSStatus v6 = 0;
          }
          else
          {
            if (!self->_pixelTransferSession && VTPixelTransferSessionCreate(0, &self->_pixelTransferSession))
            {
              uint64_t v21 = _PTLogSystem();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                -[PTEffect render:]();
              }
            }
            OSStatus v6 = VTPixelTransferSessionTransferImage(self->_pixelTransferSession, v7, v9);
            if (v6)
            {
              v22 = _PTLogSystem();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                -[PTEffect render:]();
              }
            }
          }
          [v4 setOutPersonSegmentationMatteBuffer:0];
          [(PTMetalContext *)self->_metalContext commit];
          [v4 outColorBufferWriteSkipped];
          kdebug_trace();
        }
        if (![(PTMetalContext *)self->_metalContext isCommandBufferCommitted])
        {
          v23 = _PTLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[PTEffect render:]();
          }

          OSStatus v6 = -9;
        }
        self->_lastFrameTime = v11;
        ++self->_frameId;
      }
    }
  }
  else
  {
    v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PTEffect render:]();
    }

    OSStatus v6 = -9;
  }

  return v6;
}

- (BOOL)isRenderRequiredForRequest:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_delegateLock);
  v5 = self->_delegate;
  os_unfair_lock_unlock(&self->_delegateLock);
  if ([(PTEffectRenderer *)v5 isRenderRequiredForRequest:v4])
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = [(PTEffectDescriptor *)self->_effectDescriptor activeEffectType];
    BOOL v6 = v7 != [v4 effectType];
  }
  [v4 frameTimeSeconds];
  [v4 effectType];
  uint64_t v8 = [v4 reactions];
  [v8 count];
  kdebug_trace();

  return v6;
}

- (int)_setEffectType:(unint64_t)a3
{
  if ([(PTEffectDescriptor *)self->_effectDescriptor activeEffectType] != a3) {
    [(PTEffectDescriptor *)self->_effectDescriptor setActiveEffectType:a3];
  }
  return 0;
}

- (void)_setEffectQuality:(int64_t)a3
{
  if ([(PTEffectDescriptor *)self->_effectDescriptor effectQuality] != a3)
  {
    self->_rebuildEffect |= (a3 > 109) ^ ([(PTEffectDescriptor *)self->_effectDescriptor effectQuality] > 109);
    effectDescriptor = self->_effectDescriptor;
    [(PTEffectDescriptor *)effectDescriptor setEffectQuality:a3];
  }
}

- (int)reconfigure:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218752;
    int v12 = self;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 activeEffectType];
    __int16 v15 = 2048;
    uint64_t v16 = [v4 availableEffectTypes];
    __int16 v17 = 2048;
    uint64_t v18 = [v4 effectQuality];
    _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_DEFAULT, "Configure PTEffect (ptr %p). Type: %lu AvailableTypes: %lu quality: %lu", (uint8_t *)&v11, 0x2Au);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  BOOL v6 = (PTEffectDescriptor *)[v4 copy];
  effectDescriptor = self->_effectDescriptor;
  self->_effectDescriptor = v6;

  delegate = self->_delegate;
  self->_delegate = 0;

  os_unfair_lock_unlock(&self->_delegateLock);
  int v9 = [(PTEffect *)self updateEffectDelegate:0];
  if ([(PTEffectDescriptor *)self->_effectDescriptor syncInitialization]
    || sForceSynchronousInitialization == 1)
  {
    dispatch_sync((dispatch_queue_t)self->_asyncInitQueue, &__block_literal_global_3);
    if (sForceSynchronousInitialization == 1) {
      dispatch_sync((dispatch_queue_t)self->_asyncInitQueue, &__block_literal_global_124);
    }
  }

  return v9;
}

- (int)validateRenderRequest:(id)a3 reactionOnly:(BOOL)a4
{
  return 0;
}

- (BOOL)validPixelBuffer:(__CVBuffer *)a3
{
  if (!CVPixelBufferGetIOSurface(a3))
  {
    uint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTEffect validPixelBuffer:]();
    }
    goto LABEL_10;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unsigned int v5 = PixelFormatType;
  BOOL v6 = 1;
  if (PixelFormatType > 875704421)
  {
    if (PixelFormatType > 2019963439)
    {
      if (PixelFormatType > 2084075055)
      {
        if (PixelFormatType == 2084075056) {
          return v6;
        }
        if (PixelFormatType == 2088269360) {
          goto LABEL_25;
        }
        int v7 = 2088265264;
        goto LABEL_24;
      }
      if (PixelFormatType != 2019963440)
      {
        int v10 = 2084070960;
LABEL_37:
        if (PixelFormatType == v10) {
          return v6;
        }
LABEL_38:
        uint64_t v8 = _PTLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[PTEffect validPixelBuffer:](v5, v8);
        }
LABEL_10:
        BOOL v6 = 0;
LABEL_27:

        return v6;
      }
    }
    else
    {
      if (PixelFormatType <= 1882468911)
      {
        if (PixelFormatType == 875704422) {
          return v6;
        }
        int v10 = 875704438;
        goto LABEL_37;
      }
      if (PixelFormatType != 1882468912 && PixelFormatType != 1885745712)
      {
        int v7 = 2016686640;
        goto LABEL_24;
      }
    }
LABEL_25:
    uint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTEffect validPixelBuffer:]();
    }
    goto LABEL_27;
  }
  if (PixelFormatType > 762869295)
  {
    if (PixelFormatType > 792229423)
    {
      if (PixelFormatType == 792229424) {
        return v6;
      }
      if (PixelFormatType == 796419632) {
        goto LABEL_25;
      }
      int v7 = 796423728;
LABEL_24:
      if (PixelFormatType == v7) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
    if (PixelFormatType != 762869296)
    {
      int v10 = 792225328;
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  if (PixelFormatType <= 758670895)
  {
    if (PixelFormatType == 641230384) {
      return v6;
    }
    int v10 = 641234480;
    goto LABEL_37;
  }
  if (PixelFormatType != 758670896 && PixelFormatType != 758674992)
  {
    int v7 = 762865200;
    goto LABEL_24;
  }
  return v6;
}

- (int)updateEffectDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[(PTEffectDescriptor *)self->_effectDescriptor copy];
  uint64_t v6 = [v5 activeEffectType];
  os_unfair_lock_lock(&self->_delegateLock);
  int v7 = self->_delegate;
  os_unfair_lock_unlock(&self->_delegateLock);
  BOOL v8 = [(PTEffectDescriptor *)self->_effectDescriptor syncInitialization];
  int v9 = (v8 | sForceSynchronousInitialization) & 1;
  int v10 = _PTLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    int v52 = [v5 activeEffectType];
    __int16 v53 = 1024;
    int v54 = v9;
    __int16 v55 = 1024;
    BOOL v56 = v3;
    _os_log_debug_impl(&dword_1D0778000, v10, OS_LOG_TYPE_DEBUG, "Schedule set effect type: %i sync: %i forceImmediatePassthrough: %i", buf, 0x14u);
  }

  id v11 = 0;
  if (v7 && !v3)
  {
    int v12 = [(PTMetalContext *)self->_metalContext commandQueue];
    __int16 v13 = [v12 commandBuffer];

    if (!v13)
    {
      uint64_t v14 = _PTLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PTEffect updateEffectDelegate:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    id v11 = [(PTEffectRenderer *)v7 copyTemporalState:v13];
    [v13 commit];
    [v13 waitUntilScheduled];
  }
  uint64_t v32 = v7;
  BOOL v22 = [v5 effectQuality] > 109;
  char v23 = [v5 prewarmOnly];
  v24 = (void *)[(PTMetalContext *)self->_metalContext copy];
  [v24 setAllowCommandbufferAllocation:1];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __33__PTEffect_updateEffectDelegate___block_invoke;
  v43[3] = &unk_1E6884490;
  BOOL v47 = v22;
  char v48 = v9;
  BOOL v49 = v3;
  uint64_t v45 = v6;
  v43[4] = self;
  id v25 = v5;
  id v44 = v25;
  v46 = self;
  char v50 = v23;
  id v26 = (void (**)(void))MEMORY[0x1D25E44D0](v43);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __33__PTEffect_updateEffectDelegate___block_invoke_2;
  v33[3] = &unk_1E68844B8;
  BOOL v39 = v22;
  char v40 = v9;
  BOOL v41 = v3;
  char v42 = v23;
  v33[4] = self;
  id v34 = v25;
  id v35 = v24;
  id v36 = v11;
  uint64_t v37 = v6;
  v38 = self;
  id v27 = v11;
  id v28 = v24;
  id v29 = v25;
  v30 = (void *)MEMORY[0x1D25E44D0](v33);
  if (v3) {
    v26[2](v26);
  }
  dispatch_async((dispatch_queue_t)self->_asyncInitQueue, v30);
  self->_rebuildEffect = 0;

  return 0;
}

- (id)activeReactions
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id v4 = [(PTEffectRenderer *)self->_delegate activeReactions];
  os_unfair_lock_unlock(p_delegateLock);

  return v4;
}

- (void)keepOldDelegateAlive:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(PTMetalContext *)self->_metalContext commandQueue];
    uint64_t v6 = [v5 commandBuffer];

    if (!v6)
    {
      int v7 = _PTLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PTEffect updateEffectDelegate:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__PTEffect_keepOldDelegateAlive___block_invoke;
    v15[3] = &unk_1E68841B0;
    id v16 = v4;
    [v6 addCompletedHandler:v15];
    [v6 commit];
  }
}

- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 effectQuality:(int64_t)a7
{
  return [(PTEffect *)self initWithFormat:a3 metalCommandQueue:a4 availableEffectTypes:a5 activeEffectType:a6 prewarmOnly:0 effectQuality:a7];
}

- (PTEffect)initWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 availableEffectTypes:(unint64_t)a5 activeEffectType:(unint64_t)a6 prewarmOnly:(BOOL)a7 effectQuality:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  uint64_t v15 = objc_opt_new();
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  LODWORD(a3) = Dimensions;
  unint64_t v17 = HIDWORD(Dimensions);
  [v15 setMetalCommandQueue:v14];

  objc_msgSend(v15, "setColorSize:", (double)(int)a3, (double)(int)v17);
  [v15 setAvailableEffectTypes:a5];
  [v15 setActiveEffectType:a6];
  [v15 setPrewarmOnly:v9];
  [v15 setEffectQuality:a8];
  uint64_t v18 = [(PTEffect *)self initWithDescriptor:v15];

  return v18;
}

+ (PTEffectPixelBufferDescriptor)personSegmentationMatteFormatForColorSize:(SEL)a3
{
  return +[PTEffectRenderer segmentationMatteFormatForColorSize:](PTEffectRenderer, "segmentationMatteFormatForColorSize:", a4.width, a4.height);
}

uint64_t __33__PTEffect_updateEffectDelegate___block_invoke(uint64_t a1)
{
  kdebug_trace();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  [*(id *)(a1 + 32) keepOldDelegateAlive:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  [*(id *)(a1 + 40) availableEffectTypes];
  [*(id *)(a1 + 40) laguna];

  return kdebug_trace();
}

uint64_t __33__PTEffect_updateEffectDelegate___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  if (!*(void *)(*(void *)(a1 + 32) + 48) && !*(unsigned char *)(a1 + 83))
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;
  }
  unsigned int v5 = [[PTEffectRenderer alloc] initWithDescriptor:*(void *)(a1 + 40) metalContext:*(void *)(a1 + 48) useHighResNetwork:*(unsigned __int8 *)(a1 + 80) faceAttributesNetwork:*(void *)(*(void *)(a1 + 32) + 48) humanDetections:*(void *)(*(void *)(a1 + 32) + 88) prevTemporalState:*(void *)(a1 + 56) asyncInitQueue:*(void *)(*(void *)(a1 + 32) + 24) sharedResources:*(void *)(*(void *)(a1 + 32) + 56)];
  if (!v5)
  {
    uint64_t v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __33__PTEffect_updateEffectDelegate___block_invoke_2_cold_1();
    }
  }
  [(PTEffectRenderer *)v5 setDebug:*(void *)(*(void *)(a1 + 32) + 80)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  [*(id *)(a1 + 32) keepOldDelegateAlive:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v5;
  BOOL v9 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  [*(id *)(a1 + 40) availableEffectTypes];
  [*(id *)(a1 + 40) laguna];

  return kdebug_trace();
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _PTLogSystem();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_2(v1, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_1();
  }
}

- (void)dealloc
{
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession) {
    CFRelease(pixelTransferSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTEffect;
  [(PTEffect *)&v4 dealloc];
}

+ (int)prewarmWithFormat:(opaqueCMFormatDescription *)a3 metalCommandQueue:(id)a4 effectType:(unint64_t)a5 sharedResources:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1D25E42A0]();
  uint64_t v12 = objc_opt_new();
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  LODWORD(a3) = Dimensions;
  unint64_t v14 = HIDWORD(Dimensions);
  [v12 setMetalCommandQueue:v9];
  objc_msgSend(v12, "setColorSize:", (double)(int)a3, (double)(int)v14);
  [v12 setAvailableEffectTypes:a5];
  [v12 setActiveEffectType:a5];
  [v12 setPrewarmOnly:1];
  [v12 setSyncInitialization:1];
  [v12 setEffectQuality:100];
  uint64_t v15 = [[PTEffect alloc] initWithDescriptor:v12 sharedResources:v10];
  [(PTEffect *)v15 waitForInitialization];
  if (v15) {
    int v16 = 0;
  }
  else {
    int v16 = -1;
  }

  return v16;
}

+ (int)prewarmForMediaserverd
{
  return +[PTEffect prewarmForCameraCaptured];
}

+ (int)prewarmForCameraCaptured
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v2 = CACurrentMediaTime();
  id v24 = MTLCreateSystemDefaultDevice();
  uint64_t v3 = (void *)[v24 newCommandQueue];
  objc_super v4 = objc_opt_new();
  int v5 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    if (v5 == 1) {
      int v7 = 1280;
    }
    else {
      int v7 = 960;
    }
    if (v5 == 1) {
      int v8 = 720;
    }
    else {
      int v8 = 540;
    }
    if (v5) {
      int32_t v9 = v7;
    }
    else {
      int32_t v9 = 1920;
    }
    if (v5) {
      int32_t v10 = v8;
    }
    else {
      int32_t v10 = 1080;
    }
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CMVideoFormatDescriptionCreate(v6, 0x34323076u, v9, v10, 0, &formatDescriptionOut);
    int v11 = +[PTEffect prewarmWithFormat:formatDescriptionOut metalCommandQueue:v3 effectType:83 sharedResources:v4];
    if (v11)
    {
      uint64_t v12 = _PTLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v27 = v11;
        _os_log_error_impl(&dword_1D0778000, v12, OS_LOG_TYPE_ERROR, "Failed to prewarm PTEffect SL+SDOF (%d)", buf, 8u);
      }
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    ++v5;
  }
  while (v5 != 3);
  double v13 = CACurrentMediaTime() - v2;
  unint64_t v14 = _PTLogSystem();
  uint64_t v15 = v14;
  if (v13 <= 1.0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[PTEffect prewarmForCameraCaptured];
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[PTEffect prewarmForCameraCaptured];
  }

  return v11;
}

double __19__PTEffect_render___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(a1 + 32) + 96) = *(double *)(a1 + 40) + -0.0333333333;
  double result = *(double *)(a1 + 40) + -0.0333333333;
  *(double *)(*(void *)(a1 + 32) + 104) = result;
  return result;
}

uint64_t __19__PTEffect_render___block_invoke_133(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  +[PTUtil getRotationDegreesFromAffineTransform:v4];
  [*(id *)(a1 + 40) effectQuality];
  [*(id *)(a1 + 32) outColorBufferWriteSkipped];
  return kdebug_trace();
}

- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CMRemoveAttachment((CMAttachmentBearerRef)[v7 outColorBuffer], @"ReactionEffectComplexity");
  [(PTMetalContext *)self->_metalContext setCommandBuffer:v6];
  int v8 = [(PTEffect *)self validateRenderRequest:v7 reactionOnly:1];
  if (!v8)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    int32_t v9 = self->_delegate;
    os_unfair_lock_unlock(&self->_delegateLock);
    int v8 = [(PTEffectRenderer *)v9 renderReaction:v6 effectRenderRequest:v7];
    if ([(PTMetalContext *)self->_metalContext isCommandBufferCommitted])
    {
      int32_t v10 = _PTLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PTEffect renderReaction:effectRenderRequest:]();
      }

      int v8 = -14;
    }
    [(PTMetalContext *)self->_metalContext setCommandBuffer:0];
  }
  return v8;
}

- (void)reset
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  objc_super v4 = [(PTMetalContext *)self->_metalContext commandQueue];
  id v5 = [v4 commandBuffer];

  [(PTEffectRenderer *)self->_delegate reset:v5];
  [(PTHumanDetections *)self->_humanDetections reset];
  [v5 commit];
  [v5 waitUntilScheduled];
  os_unfair_lock_unlock(p_delegateLock);
}

- (void)removeAllActiveReactions
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  [(PTEffectRenderer *)self->_delegate removeAllActiveReactions];

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)setDebug:(int64_t)a3
{
  self->_debugType = a3;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  [(PTEffectRenderer *)self->_delegate setDebug:self->_debugType];

  os_unfair_lock_unlock(p_delegateLock);
}

+ (void)disableAsynchronousWork
{
  sForceSynchronousInitialization = 1;
  +[PTSyntheticLight disableAsynchronousWork];
}

- (int)waitForInitialization
{
  return 0;
}

- (int64_t)effectQuality
{
  return [(PTEffectDescriptor *)self->_effectDescriptor effectQuality];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_faceAttributesNetwork, 0);
  objc_storeStrong((id *)&self->_asyncInitQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDescriptor:(uint64_t)a3 sharedResources:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDescriptor:(int)a1 sharedResources:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "updateEffectDelegate failed %i", (uint8_t *)v2, 8u);
}

- (void)updateEffectDelegate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__PTEffect_updateEffectDelegate___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "PTEffectRendererSDOF is nil", v2, v3, v4, v5, v6);
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Should never happen", v2, v3, v4, v5, v6);
}

void __33__PTEffect_keepOldDelegateAlive___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "Releasing reference to %@", (uint8_t *)&v3, 0xCu);
}

+ (void)prewarmForCameraCaptured
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1D0778000, log, OS_LOG_TYPE_DEBUG, "Prewarm pteffect took %f seconds", (uint8_t *)&v2, 0xCu);
}

- (void)validPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Pixelbuffer not backed by iosurface", v2, v3, v4, v5, v6);
}

- (void)validPixelBuffer:(unsigned int)a1 .cold.2(unsigned int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromFourCharCode(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Unexpected pixelformat %@", (uint8_t *)&v4, 0xCu);
}

- (void)validPixelBuffer:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "10 bit YUV is unexpected", v2, v3, v4, v5, v6);
}

- (void)render:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Commandbuffer is not committed", v2, v3, v4, v5, v6);
}

- (void)render:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_0(&dword_1D0778000, v0, v1, "Assertion failed %s %i", v2, v3, v4, v5, 2u);
}

- (void)render:.cold.5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error updateEffectDelegate", v2, v3, v4, v5, v6);
}

- (void)renderReaction:effectRenderRequest:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Commandbuffer is committed", v2, v3, v4, v5, v6);
}

@end