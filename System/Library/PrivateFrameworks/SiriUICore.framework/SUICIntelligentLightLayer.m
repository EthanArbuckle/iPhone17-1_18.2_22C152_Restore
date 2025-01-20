@interface SUICIntelligentLightLayer
+ (Class)layerClass;
+ (id)createNoiseTextureWithDevice:(id)a3 commandQueue:(id)a4;
+ (void)prewarm;
- (BOOL)quicktationMode;
- (CADisplayLink)displayLink;
- (MTLCommandQueue)commandQueue;
- (MTLRenderPassDescriptor)renderPassDesc;
- (MTLRenderPipelineState)renderPipeline;
- (SUICIntelligentLightLayer)init;
- (SUICIntelligentLightLayer)initWithLayer:(id)a3;
- (SUICIntelligentLightLayer)initWithScreen:(id)a3 commandQueue:(id)a4;
- (float)minPowerLevel;
- (float)volumeLinearPowerLevel;
- (unint64_t)colorPalette;
- (void)_commonInitWithScreen:(id)a3 commandQueue:(id)a4;
- (void)_drawFrame:(id)a3;
- (void)_loadMetalPipelines;
- (void)_loadMetalState;
- (void)_updateMetalRatios:(CGSize)a3;
- (void)_updateScreen:(id)a3;
- (void)endReducedFramerateForPerformance;
- (void)invalidate;
- (void)setBounds:(CGRect)a3;
- (void)setColorPalette:(unint64_t)a3;
- (void)setDisplayLink:(id)a3;
- (void)setIsQuicktationPill:(BOOL)a3;
- (void)setMinPowerLevel:(float)a3;
- (void)setMinimumPowerLevel:(float)a3;
- (void)setPaused:(BOOL)a3;
- (void)setQuicktationMode:(BOOL)a3;
- (void)setRenderPassDesc:(id)a3;
- (void)setRenderPipeline:(id)a3;
- (void)setScreen:(id)a3;
- (void)setVolumeLinearPowerLevel:(float)a3;
- (void)startReducedFramerateForPerformance;
- (void)stopVolumeInput;
- (void)transitionToNextBuddyStep;
- (void)updateVolumeInputdB:(float)a3;
@end

@implementation SUICIntelligentLightLayer

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_commonInitWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  AFLogInitIfNeeded();
  v8 = (id *)MEMORY[0x1E4F4E378];
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E378]);
  v10 = *v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A64CC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "IntelligentLightLayerFirstFrame", (const char *)&unk_1A65831AB, v23, 2u);
  }

  self->_firstFrameSignpost = v9;
  id v12 = MTLCreateSystemDefaultDevice();
  if (v12)
  {
    [(CAMetalLayer *)self setDevice:v12];
    v13 = v7;
    if (!v7) {
      v13 = (void *)[v12 newCommandQueue];
    }
    objc_storeStrong((id *)&self->_commandQueue, v13);
    if (!v7) {

    }
    v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    self->_idiom = [v14 userInterfaceIdiom];

    self->_volumeLinearPowerLevel = 0.0;
    self->_minPowerLevel = 0.0;
    *(float *)self->_anon_210 = (float)rand() * 4.6566e-10;
    *(float *)&self->_anon_210[4] = (float)rand() * 4.6566e-10;
    *(float *)&self->_anon_210[8] = (float)rand() * 4.6566e-10;
    [(SUICIntelligentLightLayer *)self setOpaque:1];
    [(SUICIntelligentLightLayer *)self setAllowsDisplayCompositing:0];
    [(SUICIntelligentLightLayer *)self setContentsDither:0];
    self->_colorPalette = 101;
    [(SUICIntelligentLightLayer *)self _loadMetalPipelines];
    [(SUICIntelligentLightLayer *)self _loadMetalState];
    self->_physics.common.physicsRate = 0;
    self->_physics.zoning = 0;
    self->_physics.zoning = self->_idiom == 1;
    [(SUICIntelligentLightLayer *)self _updateScreen:v6];
    self->_firstFrame = 1;
  }
  else
  {
    v15 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SUICIntelligentLightLayer _commonInitWithScreen:commandQueue:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (SUICIntelligentLightLayer)initWithLayer:(id)a3
{
  v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SUICIntelligentLightLayer initWithLayer:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (SUICIntelligentLightLayer)initWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUICIntelligentLightLayer;
  uint64_t v8 = [(CAMetalLayer *)&v12 init];
  uint64_t v9 = v8;
  if (!v8
    || ([(SUICIntelligentLightLayer *)v8 _commonInitWithScreen:v6 commandQueue:v7], [(CAMetalLayer *)v9 device], uint64_t v10 = (SUICIntelligentLightLayer *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    uint64_t v10 = v9;
  }

  return v10;
}

- (SUICIntelligentLightLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUICIntelligentLightLayer;
  v2 = [(CAMetalLayer *)&v6 init];
  v3 = v2;
  if (!v2
    || ([(SUICIntelligentLightLayer *)v2 _commonInitWithScreen:0 commandQueue:0], [(CAMetalLayer *)v3 device], v4 = (SUICIntelligentLightLayer *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v4 = v3;
  }

  return v4;
}

+ (void)prewarm
{
}

- (void)setColorPalette:(unint64_t)a3
{
  if (self->_colorPalette != a3)
  {
    self->_colorPalette = a3;
    [(SUICIntelligentLightLayer *)self _loadMetalPipelines];
  }
}

- (void)setScreen:(id)a3
{
  if (self->_screen != a3) {
    -[SUICIntelligentLightLayer _updateScreen:](self, "_updateScreen:");
  }
}

- (void)_updateScreen:(id)a3
{
  v4 = (UIScreen *)a3;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    uint64_t v6 = [(CADisplayLink *)displayLink isPaused];
    [(CADisplayLink *)self->_displayLink setPaused:1];
    [(CADisplayLink *)self->_displayLink invalidate];
    id v7 = self->_displayLink;
    self->_displayLink = 0;

    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 1;
    if (v4) {
      goto LABEL_9;
    }
  }
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v9 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SUICIntelligentLightLayer _updateScreen:](v9, v10, v11, v12, v13, v14, v15, v16);
  }
  v4 = [MEMORY[0x1E4FB1BA8] _carScreen];
  if (v4
    || ([MEMORY[0x1E4FB1BA8] mainScreen], (v4 = (UIScreen *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_9:
    uint64_t v17 = [(UIScreen *)v4 maximumFramesPerSecond];
    int v18 = 2;
    uint64_t v19 = 90;
    uint64_t v20 = 45;
    if (v17 > 134)
    {
      if (v17 > 224)
      {
        if (v17 == 225 || v17 == 270) {
          goto LABEL_39;
        }
      }
      else if (v17 == 135 || v17 == 180)
      {
        goto LABEL_39;
      }
LABEL_23:
      uint64_t v21 = 240;
      if ((unint64_t)v17 >= 0x3D) {
        uint64_t v22 = 60;
      }
      else {
        uint64_t v22 = v17;
      }
      if ((unint64_t)v17 < 0x3D)
      {
        int v23 = 10;
      }
      else
      {
        uint64_t v21 = 60;
        int v23 = 1;
      }
      if (v17 >= 24) {
        uint64_t v20 = v22;
      }
      else {
        uint64_t v20 = 24;
      }
      if (v17 >= 24) {
        uint64_t v19 = v21;
      }
      else {
        uint64_t v19 = 240;
      }
      if (v17 >= 24) {
        int v18 = v23;
      }
      else {
        int v18 = 10;
      }
      goto LABEL_39;
    }
    if (v17 > 59)
    {
      if (v17 != 60)
      {
        if (v17 != 90) {
          goto LABEL_23;
        }
        goto LABEL_39;
      }
    }
    else if (v17 != 30)
    {
      if (v17 != 45) {
        goto LABEL_23;
      }
LABEL_39:
      if (v19 != self->_physics.common.physicsRate) {
        SUICLightPhysics_Init((uint64_t)&self->_physics, v19, v18);
      }
      self->_physics.common.maxPhysicsIterationsPerFrame = v18;
      v24 = [(UIScreen *)v4 displayLinkWithTarget:self selector:sel__drawFrame_];
      v25 = self->_displayLink;
      self->_displayLink = v24;

      [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:v20];
      v26 = self->_displayLink;
      v27 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [(CADisplayLink *)v26 addToRunLoop:v27 forMode:*MEMORY[0x1E4F1C4B0]];

      [(CADisplayLink *)self->_displayLink setPaused:v6];
      if (self->_screen != v4)
      {
        objc_storeStrong((id *)&self->_screen, v4);
        [(SUICIntelligentLightLayer *)self bounds];
        -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", v28, v29);
      }
      goto LABEL_43;
    }
    int v18 = 1;
    uint64_t v20 = v17;
    uint64_t v19 = v17;
    goto LABEL_39;
  }
  v30 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[SUICIntelligentLightLayer _updateScreen:](v30, v31, v32, v33, v34, v35, v36, v37);
  }
  SUICLightPhysics_Init((uint64_t)&self->_physics, 60, 1);
  v38 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__drawFrame_];
  v39 = self->_displayLink;
  self->_displayLink = v38;

  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
  v40 = self->_displayLink;
  v41 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(CADisplayLink *)v40 addToRunLoop:v41 forMode:*MEMORY[0x1E4F1C4B0]];

  [(CADisplayLink *)self->_displayLink setPaused:v6];
  v4 = 0;
LABEL_43:
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUICIntelligentLightLayer *)self displayLink];
  [v5 setPaused:v3];

  archivePath = self->_archivePath;
  self->_archivePath = 0;
}

- (void)invalidate
{
  BOOL v3 = [(SUICIntelligentLightLayer *)self displayLink];
  [v3 setPaused:1];

  v4 = [(SUICIntelligentLightLayer *)self displayLink];
  [v4 invalidate];

  [(SUICIntelligentLightLayer *)self setDisplayLink:0];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SUICIntelligentLightLayer;
  -[SUICIntelligentLightLayer setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != 0.0 && height != 0.0)
  {
    -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", width, height);
    double v6 = (double)((int)width >> 3);
    double v7 = (double)((int)height >> 3);
    if ((int)width < 32) {
      double v6 = 4.0;
    }
    if ((int)height < 32) {
      double v7 = 4.0;
    }
    -[CAMetalLayer setDrawableSize:](self, "setDrawableSize:", v6, v7);
  }
}

- (void)setIsQuicktationPill:(BOOL)a3
{
  self->_quicktationMode = a3;
  [(SUICIntelligentLightLayer *)self bounds];

  -[SUICIntelligentLightLayer _updateMetalRatios:](self, "_updateMetalRatios:", v4, v5);
}

- (void)setMinimumPowerLevel:(float)a3
{
  self->_minPowerLevel = a3;
}

- (void)updateVolumeInputdB:(float)a3
{
  if (self->_colorPalette != 104)
  {
    +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
    self->_volumeLinearPowerLevel = v4;
  }
}

- (void)stopVolumeInput
{
  self->_volumeLinearPowerLevel = 0.0;
}

- (void)transitionToNextBuddyStep
{
  if (!self->_physics.common.reduceMotion)
  {
    self->_physics.isBuddy = 1;
    self->_physics.energySpring.value = 4.0;
  }
}

- (void)_updateMetalRatios:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat height = a3.height;
  [(UIScreen *)self->_screen scale];
  float v5 = v4;
  if (v5 == 0.0) {
    float v6 = 1.0;
  }
  else {
    float v6 = 1.0 / v5;
  }
  double v7 = v6;
  v8.f64[0] = width;
  v8.f64[1] = height;
  float32x2_t v9 = vcvt_f32_f64(v8);
  *(float32x2_t *)&self->_anon_210[16] = vcvt_f32_f64(vmulq_n_f64(vmulq_f64(vcvtq_f64_f32(v9), (float64x2_t)vdupq_n_s64(0x3F56F0068DB8BAC7uLL)), v7));
  anon_30 = self->_anon_30;
  if (v9.f32[0] >= v9.f32[1])
  {
    float v18 = v9.f32[1] / v9.f32[0];
    __asm { FMOV            V2.2S, #1.5 }
    *((float *)&_D2 + 1) = v18 * 1.5;
    *(void *)anon_30 = _D2;
    if (!self->_quicktationMode) {
      return;
    }
    float v20 = (float)(1.0 - v18) * 0.4;
    LODWORD(v17) = 0;
    *((float *)&v17 + 1) = v20;
  }
  else
  {
    float v11 = v9.f32[0] / v9.f32[1];
    __asm { FMOV            V2.2S, #1.5 }
    *(float *)&_D2 = v11 * 1.5;
    *(void *)anon_30 = _D2;
    if (!self->_quicktationMode) {
      return;
    }
    HIDWORD(v17) = 0;
    *(float *)&uint64_t v17 = (float)(1.0 - v11) * 0.4;
  }
  *(void *)&self->_anon_30[8] = v17;
}

- (void)_loadMetalPipelines
{
}

+ (id)createNoiseTextureWithDevice:(id)a3 commandQueue:(id)a4
{
  float v5 = (objc_class *)MEMORY[0x1E4F35330];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setTextureType:7];
  [v8 setWidth:80];
  [v8 setHeight:80];
  [v8 setDepth:40];
  [v8 setMipmapLevelCount:1];
  [v8 setPixelFormat:10];
  [v8 setUsage:1];
  float32x2_t v9 = (void *)[v7 newTextureWithDescriptor:v8];
  [v8 setStorageMode:2];
  uint64_t v10 = (void *)[v7 newTextureWithDescriptor:v8];

  [v10 setLabel:@"ilNoise"];
  memset(v15, 0, sizeof(v15));
  int64x2_t v16 = vdupq_n_s64(0x50uLL);
  uint64_t v17 = 40;
  [v9 replaceRegion:v15 mipmapLevel:0 slice:0 withBytes:&precalcSUICILNoise3DTexture bytesPerRow:80 bytesPerImage:6400];
  float v11 = [v6 commandBuffer];

  if (v11)
  {
    uint64_t v12 = [v11 blitCommandEncoder];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 copyFromTexture:v9 toTexture:v10];
      [v13 endEncoding];
    }
    [v11 commit];
    [v11 waitUntilCompleted];
  }

  return v10;
}

- (void)_loadMetalState
{
  BOOL v3 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  [(SUICIntelligentLightLayer *)self setRenderPassDesc:v3];

  double v4 = [(SUICIntelligentLightLayer *)self renderPassDesc];
  float v5 = [v4 colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];

  [v6 setLoadAction:0];
  [v6 setStoreAction:1];
}

- (void)_drawFrame:(id)a3
{
  id v4 = a3;
  if ([(CAMetalLayer *)self isDrawableAvailable])
  {
    float v5 = [(SUICIntelligentLightLayer *)self commandQueue];
    id v6 = [v5 commandBuffer];

    if (v6)
    {
      [v4 targetTimestamp];
      double v8 = v7;
      [v4 timestamp];
      double v10 = v8 - v9;
      *(float *)&double v10 = v10;
      double v42 = v10;
      if (self->_colorPalette <= 0x1F3)
      {
        float minPowerLevel = self->_minPowerLevel;
        if (minPowerLevel < self->_volumeLinearPowerLevel) {
          float minPowerLevel = self->_volumeLinearPowerLevel;
        }
        self->_physics.common.micPowerLevel = minPowerLevel;
        SUICLightPhysics_UpdatePhysics((uint64_t)&self->_physics, *(float *)&v42);
      }
      uint64_t v12 = [(CAMetalLayer *)self nextDrawable];
      uint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = [v12 texture];
        uint64_t v15 = [(SUICIntelligentLightLayer *)self renderPassDesc];
        int64x2_t v16 = [v15 colorAttachments];
        uint64_t v17 = [v16 objectAtIndexedSubscript:0];
        [v17 setTexture:v14];

        float v18 = [(SUICIntelligentLightLayer *)self renderPassDesc];
        uint64_t v19 = [v6 renderCommandEncoderWithDescriptor:v18];

        [v19 setCullMode:0];
        float v20 = [(SUICIntelligentLightLayer *)self renderPipeline];
        [v19 setRenderPipelineState:v20];

        if (self->_colorPalette < 0x1F4)
        {
          [v19 setVertexBytes:self->_anon_30 length:16 atIndex:0];
          long long v34 = *(_OWORD *)&self->_anon_1b8[16];
          *(_OWORD *)self->_anon_40 = *(_OWORD *)self->_anon_1b8;
          *(_OWORD *)&self->_anon_40[16] = v34;
          _Q0 = *(_OWORD *)&self->_anon_1b8[32];
          long long v36 = *(_OWORD *)&self->_anon_1b8[48];
          long long v37 = *(_OWORD *)&self->_anon_1b8[64];
          *(void *)&self->_anon_40[80] = *(void *)&self->_anon_1b8[80];
          *(_OWORD *)&self->_anon_40[48] = v36;
          *(_OWORD *)&self->_anon_40[64] = v37;
          *(_OWORD *)&self->_anon_40[32] = _Q0;
          *(float *)&_Q0 = self->_physics.volumeSpring.value;
          __asm { FCVT            H0, S0 }
          *(_WORD *)&self->_anon_40[88] = _Q0;
          *(float *)&_Q0 = self->_physics.lightnessSpring.value;
          __asm { FCVT            H0, S0 }
          *(_WORD *)&self->_anon_40[90] = _Q0;
          objc_msgSend(v19, "setFragmentBytes:length:atIndex:");
        }
        else
        {
          anon_210 = self->_anon_210;
          v22.i32[3] = 0;
          float32x4_t v23 = vmlaq_n_f32(*(float32x4_t *)self->_anon_210, (float32x4_t)xmmword_1A653C180, v43);
          *(float32x4_t *)self->_anon_210 = v23;
          if (v23.f32[0] > 1.0)
          {
            v22.f32[0] = v23.f32[0] + -1.0;
            HIDWORD(v24) = v23.i32[1];
            *(float *)&uint64_t v24 = v23.f32[0] + -1.0;
            v22.i32[1] = v23.i32[1];
            v22.i32[2] = v23.i32[2];
            *(_DWORD *)&self->_anon_210[8] = v23.i32[2];
            *(void *)anon_210 = v24;
            float32x4_t v23 = v22;
          }
          if (v23.f32[1] < 0.0)
          {
            float32x4_t v25 = v23;
            v25.f32[1] = v23.f32[1] + 1.0;
            *(void *)anon_210 = v25.i64[0];
            v25.i32[2] = v23.i32[2];
            *(_DWORD *)&self->_anon_210[8] = v23.i32[2];
            float32x4_t v23 = v25;
          }
          if (v23.f32[2] > 1.0)
          {
            *(float *)&self->_anon_210[8] = v23.f32[2] + -1.0;
            *(void *)anon_210 = v23.i64[0];
          }
          objc_msgSend(v19, "setVertexBytes:length:atIndex:");
          [v19 setFragmentTexture:self->_noiseTexture atIndex:0];
        }
        [v19 drawPrimitives:3 vertexStart:0 vertexCount:3];
        [v19 endEncoding];
        [v6 presentDrawable:v13];
      }
      if (self->_firstFrame)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __40__SUICIntelligentLightLayer__drawFrame___block_invoke;
        v44[3] = &unk_1E5C596A0;
        v44[4] = self;
        [v6 addCompletedHandler:v44];
        self->_firstFrame = 0;
      }
      [v6 commit];
    }
    else
    {
      v26 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SUICIntelligentLightLayer _drawFrame:](v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }
  }
}

void __40__SUICIntelligentLightLayer__drawFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 GPUStartTime];
  double v5 = v4;
  [v3 GPUEndTime];
  double v7 = v6;

  double v8 = (id)*MEMORY[0x1E4F4E378];
  double v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 584);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v11 = 134217984;
    double v12 = v7 - v5;
    _os_signpost_emit_with_name_impl(&dword_1A64CC000, v9, OS_SIGNPOST_INTERVAL_END, v10, "IntelligentLightLayerFirstFrame", "GPU time:%f", (uint8_t *)&v11, 0xCu);
  }
}

- (void)startReducedFramerateForPerformance
{
}

- (void)endReducedFramerateForPerformance
{
  self->_physics.common.maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsBeforePerformanceOptimization;
}

- (unint64_t)colorPalette
{
  return self->_colorPalette;
}

- (BOOL)quicktationMode
{
  return self->_quicktationMode;
}

- (void)setQuicktationMode:(BOOL)a3
{
  self->_quicktationMode = a3;
}

- (float)minPowerLevel
{
  return self->_minPowerLevel;
}

- (void)setMinPowerLevel:(float)a3
{
  self->_float minPowerLevel = a3;
}

- (float)volumeLinearPowerLevel
{
  return self->_volumeLinearPowerLevel;
}

- (void)setVolumeLinearPowerLevel:(float)a3
{
  self->_volumeLinearPowerLevel = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLRenderPipelineState)renderPipeline
{
  return self->_renderPipeline;
}

- (void)setRenderPipeline:(id)a3
{
}

- (MTLRenderPassDescriptor)renderPassDesc
{
  return self->_renderPassDesc;
}

- (void)setRenderPassDesc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_screen, 0);

  objc_storeStrong((id *)&self->_noiseTexture, 0);
}

- (void)_commonInitWithScreen:(uint64_t)a3 commandQueue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLayer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateScreen:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateScreen:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_drawFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end