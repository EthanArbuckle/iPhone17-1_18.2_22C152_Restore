@interface SUICOrbView
+ (Class)layerClass;
- (BOOL)reduceThinkingModeFramerate;
- (BOOL)suppressTTSAnimations;
- (NSTimer)invalidateTimer;
- (SUICOrbView)initWithCoder:(id)a3;
- (SUICOrbView)initWithFrame:(CGRect)a3;
- (float)bias;
- (float)linearPowerLevel;
- (float)power;
- (float)scale;
- (id)_from:(id)a3 getComputePipeline:(id)a4 err:(id *)a5;
- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5;
- (int)currentlyShownChannel;
- (int)numberOfChips;
- (int64_t)mode;
- (void)_choosePhysicsRate:(int)a3;
- (void)_commonInitWithFrame:(CGRect)a3;
- (void)_configurePreferredFramesPerSecond:(int)a3;
- (void)_createNoiseTexture;
- (void)_createSiriChipBuffer;
- (void)_createSmoothStepTexture;
- (void)_createSphereBuffer;
- (void)_didSetRenderModeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_drawSiriFrame:(id)a3;
- (void)_drawingVeryLastFrameLogic:(id)a3;
- (void)_drawingVeryLastFrameOffCompletion;
- (void)_endReducedFramerateForPerf;
- (void)_initCommandQueue;
- (void)_initNoiseOffsets;
- (void)_initSprings;
- (void)_invalidateDisplayLink;
- (void)_loadAssets;
- (void)_loadMetalPipelines;
- (void)_loadMetalState;
- (void)_resetDisplayLinkFramerate;
- (void)_setMode:(int64_t)a3;
- (void)_setPaused:(BOOL)a3;
- (void)_setupSpring:(id *)a3 withType:(unint64_t)a4 initialValue:(float)a5;
- (void)_startReducedFramerateForPerf;
- (void)_updateChipsSizesForOnOff;
- (void)_updateDynamicBufferState;
- (void)_updateMetalTextureRasterSize:(CGSize)a3;
- (void)_updateRenderModeWithDelta:(float)a3;
- (void)_updateSiriGraphicsState:(double)a3;
- (void)_updateSiriPhysics:(float)a3;
- (void)animateToOffWithCompletion:(id)a3;
- (void)invalidate;
- (void)pauseAnimationAndReset;
- (void)prewarmOrb;
- (void)setBias:(float)a3;
- (void)setCurrentlyShownChannel:(int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInvalidateTimer:(id)a3;
- (void)setNumberOfChips:(int)a3;
- (void)setPower:(float)a3;
- (void)setPowerLevel:(float)a3;
- (void)setReduceThinkingModeFramerate:(BOOL)a3;
- (void)setScale:(float)a3;
- (void)setSuppressTTSAnimations:(BOOL)a3;
@end

@implementation SUICOrbView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setupSpring:(id *)a3 withType:(unint64_t)a4 initialValue:(float)a5
{
  float v7 = 0.0;
  float v8 = 0.0;
  if (a4 <= 3)
  {
    float v7 = flt_1A64FC100[a4];
    float v8 = flt_1A64FC110[a4];
  }
  if (a4 != 0 && self->_reduceMotion)
  {
    float v7 = v7 * 0.5;
    float v9 = v8 * 0.25;
  }
  else
  {
    float v9 = v8;
  }
  unint64_t framerateType = self->_framerateType;
  switch(framerateType)
  {
    case 2uLL:
      float v9 = v9 * 0.222222222;
      float v11 = 1.0 - v7;
      float v12 = 1.0 - fabsf(sqrtf(v11));
      if (v11 == -INFINITY) {
        float v7 = -INFINITY;
      }
      else {
        float v7 = v12;
      }
      break;
    case 1uLL:
      float v9 = v9 * 3.0;
      float v7 = 1.0 - (float)((float)(1.0 - v7) * (float)(1.0 - v7));
      break;
    case 0uLL:
      float v9 = v9 * 9.0;
      float v7 = 1.0 - powf(1.0 - v7, 4.0);
      break;
  }
  a3->var0 = a5;
  a3->var1 = 0.0;
  a3->var2 = v9;
  a3->var3 = v7;
}

- (void)_initSprings
{
  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
  LODWORD(v3) = 1068121457;
  [(SUICOrbView *)self _setupSpring:&self->_bubbleSpring withType:1 initialValue:v3];
  [(SUICOrbView *)self _setupSpring:&self->_energySpring withType:2 initialValue:0.0];
  [(SUICOrbView *)self _setupSpring:&self->_volumeSpring withType:1 initialValue:0.0];
  LODWORD(v4) = 1.0;
  [(SUICOrbView *)self _setupSpring:&self->_chipsSpring withType:2 initialValue:v4];
  LODWORD(v5) = 1.0;
  [(SUICOrbView *)self _setupSpring:&self->_specularSpring withType:1 initialValue:v5];
  [(SUICOrbView *)self _setupSpring:&self->_thinkingSpring withType:3 initialValue:0.0];
  [(SUICOrbView *)self _setupSpring:&self->_speakingSpring withType:2 initialValue:0.0];
  [(SUICOrbView *)self _setupSpring:&self->_glowSpring withType:0 initialValue:0.0];
  [(SUICOrbView *)self _setupSpring:&self->_onSpring withType:!self->_reduceMotion initialValue:0.0];
  for (uint64_t i = 0; i != 6; ++i)
    [(SUICOrbView *)self _setupSpring:&self->_chipSpring[i] withType:0 initialValue:0.0];
}

- (void)_initNoiseOffsets
{
  for (uint64_t i = 0; i != 18; ++i)
    self->_chipRandomOffset[i] = (float)((float)((float)rand() * 4.6566e-10) * 600.0) + -300.0;
}

- (void)_initCommandQueue
{
  if (!self->_commandQueue)
  {
    double v3 = (MTLCommandQueue *)[(MTLDevice *)self->_device newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v3;

    double v5 = self->_commandQueue;
    [(MTLCommandQueue *)v5 setGPUPriority:4];
  }
}

- (SUICOrbView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUICOrbView;
  double v3 = [(SUICOrbView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(SUICOrbView *)v3 frame];
    -[SUICOrbView _commonInitWithFrame:](v4, "_commonInitWithFrame:");
  }
  return v4;
}

- (SUICOrbView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SUICOrbView;
  float v7 = -[SUICOrbView initWithFrame:](&v10, sel_initWithFrame_);
  float v8 = v7;
  if (v7) {
    -[SUICOrbView _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  }
  return v8;
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  self->_framesPerSecond = 60;
  self->_oneOverFPS = 0.016667;
  self->_physicsRate = 0.016667;
  self->_maxPhysicsIterationsPerFrame = 1;
  self->_dynamicFramerate = 0;
  objc_super v6 = [(SUICOrbView *)self layer];
  metalLayer = self->_metalLayer;
  self->_metalLayer = v6;

  float v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v8;

  if (self->_device)
  {
    objc_super v10 = [MEMORY[0x1E4FB1BA8] _carScreen];
    float v11 = v10;
    if (v10)
    {
      id v32 = v10;
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
      v21 = [v20 screen];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
      }
      id v32 = v23;
    }
    [v32 scale];
    float v25 = v24;
    self->_framesPerSecond = [v32 maximumFramesPerSecond];
    float v26 = 1.0;
    if (v25 != 0.0) {
      float v26 = v25;
    }
    double v27 = v26;
    [(CAMetalLayer *)self->_metalLayer setContentsScale:v26];
    [(SUICOrbView *)self _choosePhysicsRate:self->_framesPerSecond];
    [(CAMetalLayer *)self->_metalLayer setDevice:self->_device];
    [(CAMetalLayer *)self->_metalLayer setPixelFormat:80];
    [(CAMetalLayer *)self->_metalLayer setFramebufferOnly:1];
    [(CAMetalLayer *)self->_metalLayer setPresentsWithTransaction:0];
    [(CAMetalLayer *)self->_metalLayer setDrawsAsynchronously:1];
    [(CAMetalLayer *)self->_metalLayer setOpaque:0];
    [(SUICOrbView *)self _initCommandQueue];
    [(SUICOrbView *)self _loadMetalPipelines];
    [(SUICOrbView *)self _loadMetalState];
    [(SUICOrbView *)self _loadAssets];
    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", width * v27, height * v27);
    v28 = [v32 displayLinkWithTarget:self selector:sel__drawSiriFrame_];
    displayLink = self->_displayLink;
    self->_displayLink = v28;

    [(SUICOrbView *)self _resetDisplayLinkFramerate];
    v30 = self->_displayLink;
    v31 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v30 addToRunLoop:v31 forMode:*MEMORY[0x1E4F1C4B0]];

    [(SUICOrbView *)self _setPaused:1];
    self->_currentlyShownChannel = 0;
    self->_numberOfChips = 6;
    self->_bias = 0.0;
    self->_scale = 0.0;
    self->_power = 0.0;
    [(SUICOrbView *)self _initSprings];
    [(SUICOrbView *)self _initNoiseOffsets];
    [(SUICOrbView *)self setSuppressTTSAnimations:1];
  }
  else
  {
    float v12 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SUICOrbView _commonInitWithFrame:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_setMode:(int64_t)a3
{
  int64_t mode = self->_mode;
  if (mode != a3)
  {
    self->_int64_t mode = a3;
    if (a3 == 2 && mode == 1)
    {
      if (self->_delayUntilThinking > 0.0) {
        return;
      }
      self->_delayUntilThinking = 0.1;
      self->_renderMode = 3;
      int64_t mode = 1;
      a3 = 3;
    }
    else
    {
      self->_renderMode = a3;
      self->_delayUntilThinking = 0.0;
    }
    [(SUICOrbView *)self _didSetRenderModeFrom:mode to:a3];
  }
}

- (void)_updateRenderModeWithDelta:(float)a3
{
  if (self->_renderMode == 3 && self->_mode == 2)
  {
    float v3 = self->_delayUntilThinking - a3;
    self->_delayUntilThinking = v3;
    if (v3 <= 0.0)
    {
      self->_delayUntilThinking = 0.0;
      int64_t mode = self->_mode;
      self->_renderMode = mode;
      [(SUICOrbView *)self _didSetRenderModeFrom:mode to:mode];
    }
  }
  else
  {
    self->_delayUntilThinking = 0.0;
  }
}

- (void)_didSetRenderModeFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 == 2)
  {
    self->_startingThinkingModeNow = 1;
    self->_powerLevel = 0.0;
    self->_fullyThinkingModeNow = 0;
  }
  else if (!a4)
  {
    self->_powerLevel = 0.0;
  }
  if (a4 != 2 && a3 == 2 && self->_reduceThinkingModeFramerate) {
    [(SUICOrbView *)self _endReducedFramerateForPerf];
  }
  if (a4 && self->_offCompletion)
  {
    float v7 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      float v8 = NSNumber;
      float v9 = v7;
      objc_super v10 = [v8 numberWithInteger:a4];
      int v12 = 136315394;
      uint64_t v13 = "-[SUICOrbView _didSetRenderModeFrom:to:]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1A64CC000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion nil-ing out because toMode == %@ completion", (uint8_t *)&v12, 0x16u);
    }
    id offCompletion = self->_offCompletion;
    self->_id offCompletion = 0;
  }
  if (!a3 && self->_device)
  {
    [(SUICOrbView *)self _setPaused:0];
    [(CAMetalLayer *)self->_metalLayer discardContents];
    [(SUICOrbView *)self _initCommandQueue];
    if (a4 == 1) {
      [(id)*MEMORY[0x1E4FB2608] finishedIPTest:@"SiriBringupToFlamesListening"];
    }
  }
}

- (void)pauseAnimationAndReset
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SUICOrbView *)self _setPaused:1];
  [(SUICOrbView *)self _initSprings];
  [(SUICOrbView *)self _initNoiseOffsets];
  self->_startingThinkingModeNow = 0;
  self->_fullyThinkingModeNow = 0;
  self->_drawingVeryLastFrame = 0;
  self->_resetOnNextFrame = 1;
  self->_renderMode = 0;
  siriChipsTexture = self->_siriChipsTexture;
  self->_siriChipsTexture = 0;

  blurChipsTexture = self->_blurChipsTexture;
  self->_blurChipsTexture = 0;

  sphereMaskTexture = self->_sphereMaskTexture;
  self->_sphereMaskTexture = 0;

  blurMaskTexture = self->_blurMaskTexture;
  self->_blurMaskTexture = 0;

  float v7 = [(MTLRenderPassDescriptor *)self->_siriChipRenderPassDesc colorAttachments];
  float v8 = [v7 objectAtIndexedSubscript:0];
  [v8 setResolveTexture:0];

  float v9 = [(MTLRenderPassDescriptor *)self->_sphereMaskRenderPassDesc colorAttachments];
  objc_super v10 = [v9 objectAtIndexedSubscript:0];
  [v10 setTexture:0];

  self->_reallocTextures = 1;
  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  [(CAMetalLayer *)self->_metalLayer removeBackBuffers];
  if (self->_offCompletion)
  {
    int v12 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[SUICOrbView pauseAnimationAndReset]";
      _os_log_impl(&dword_1A64CC000, v12, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion nil-ing out completion", (uint8_t *)&v14, 0xCu);
    }
    id offCompletion = self->_offCompletion;
    self->_id offCompletion = 0;
  }
}

- (void)animateToOffWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    float v9 = "-[SUICOrbView animateToOffWithCompletion:]";
    _os_log_impl(&dword_1A64CC000, v5, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion setting completion", (uint8_t *)&v8, 0xCu);
  }
  objc_super v6 = (void *)MEMORY[0x1AD0BCD30](v4);
  id offCompletion = self->_offCompletion;
  self->_id offCompletion = v6;

  [(SUICOrbView *)self _setMode:0];
}

- (void)setPowerLevel:(float)a3
{
  int64_t renderMode = self->_renderMode;
  if (renderMode == 3)
  {
    BOOL v7 = [(SUICOrbView *)self suppressTTSAnimations];
    double v6 = 0.0;
    if (!v7)
    {
      *(float *)&double v6 = a3;
      +[SUICAudioPowerLevelLinearConverter linearValueForOutputPowerLevel:v6];
    }
  }
  else
  {
    if (renderMode != 1) {
      return;
    }
    +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:*(double *)&a3];
  }
  self->_powerLevel = *(float *)&v6;
}

- (void)_configurePreferredFramesPerSecond:(int)a3
{
}

- (void)_setPaused:(BOOL)a3
{
}

- (void)prewarmOrb
{
  id v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  float v3 = [v5 renderCommandEncoderWithDescriptor:self->_siriChipRenderPassDesc];
  [v3 endEncoding];
  id v4 = [v5 renderCommandEncoderWithDescriptor:self->_sphereMaskRenderPassDesc];

  [v4 endEncoding];
  [v5 commit];
}

- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5
{
  id v11 = 0;
  double v6 = (void *)[a3 newRenderPipelineStateWithName:a4 options:0 reflection:0 error:&v11];
  id v7 = v11;
  int v8 = v7;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (v9) {
    *a5 = v7;
  }

  return v6;
}

- (id)_from:(id)a3 getComputePipeline:(id)a4 err:(id *)a5
{
  id v11 = 0;
  double v6 = (void *)[a3 newComputePipelineStateWithName:a4 options:0 reflection:0 error:&v11];
  id v7 = v11;
  int v8 = v7;
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (v9) {
    *a5 = v7;
  }

  return v6;
}

- (void)_loadMetalPipelines
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  float v3 = "-[SUICOrbView _loadMetalPipelines]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A64CC000, a2, OS_LOG_TYPE_ERROR, "%s Unable to load pipelines: %@", (uint8_t *)&v2, 0x16u);
}

- (void)_loadMetalState
{
  float v3 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  siriChipRenderPassDesc = self->_siriChipRenderPassDesc;
  self->_siriChipRenderPassDesc = v3;

  uint64_t v5 = [(MTLRenderPassDescriptor *)self->_siriChipRenderPassDesc colorAttachments];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];

  [v6 setLoadAction:2];
  [v6 setStoreAction:2];
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  id v7 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  sphereMaskRenderPassDesc = self->_sphereMaskRenderPassDesc;
  self->_sphereMaskRenderPassDesc = v7;

  BOOL v9 = [(MTLRenderPassDescriptor *)self->_sphereMaskRenderPassDesc colorAttachments];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];

  [v10 setLoadAction:2];
  [v10 setStoreAction:1];
  objc_msgSend(v10, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  id v11 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  finalRenderPassDesc = self->_finalRenderPassDesc;
  self->_finalRenderPassDesc = v11;

  uint64_t v13 = [(MTLRenderPassDescriptor *)self->_finalRenderPassDesc colorAttachments];
  id v16 = [v13 objectAtIndexedSubscript:0];

  [v16 setLoadAction:2];
  [v16 setStoreAction:2];
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  int v14 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:512 options:0];
  dynamicUniformBuffer = self->_dynamicUniformBuffer;
  self->_dynamicUniformBuffer = v14;

  [(MTLBuffer *)self->_dynamicUniformBuffer setLabel:@"Uniforms"];
}

- (void)_createSphereBuffer
{
  __assert_rtn("-[SUICOrbView _createSphereBuffer]", "SUICOrbView.m", 1096, "index == _sphereNumIndexes");
}

- (void)_createSiriChipBuffer
{
  self->_int chipNumIndexes = 300;
  self->_chipIndexBufferOffset = 4848;
  float v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:2 * self->_chipNumIndexes + 4848 options:0];
  siriChipGeom = self->_siriChipGeom;
  self->_siriChipGeom = v3;

  uint64_t v5 = [(MTLBuffer *)self->_siriChipGeom contents];
  uint64_t v6 = 0;
  *(_OWORD *)uint64_t v5 = xmmword_1A64FC090;
  *(void *)(v5 + 32) = 0;
  *(_WORD *)(v5 + 40) = 0;
  id v7 = (__float2 *)(v5 + 88);
  do
  {
    float v8 = (double)(int)v6 / 100.0 * 3.14159265 + (double)(int)v6 / 100.0 * 3.14159265;
    __float2 v9 = __sincosf_stret(v8);
    v7[-1] = v9;
    v10.i32[1] = 0;
    v10.f32[0] = v9.__sinval * -0.5;
    v10.i64[1] = COERCE_UNSIGNED_INT(v9.__sinval * v9.__cosval);
    v11.i64[0] = 0x3F0000003F000000;
    v11.i64[1] = 0x3F0000003F000000;
    *(float32x4_t *)&v7[-5].__sinval = vmulq_f32(v10, v11);
    LOWORD(v7->__sinval) = COERCE_UNSIGNED_INT(1.0);
    ++v6;
    v7 += 6;
  }
  while (v6 != 100);
  uint64_t v12 = 0;
  float32x4_t v13 = (float32x4_t)xmmword_1A64FBA00;
  *(_OWORD *)(v5 + 16) = xmmword_1A64FBA00;
  uint64_t v14 = 64;
  do
  {
    *(double *)v13.i64 = _calculateChipNormal(v5, (int)v12 + 2, v12, v13);
    *(float32x4_t *)(v5 + v14) = v13;
    ++v12;
    v14 += 48;
  }
  while (v12 != 99);
  *(double *)v15.i64 = _calculateChipNormal(v5, 1, 99, v13);
  *(float32x4_t *)(v5 + 4816) = v15;
  *(double *)&long long v16 = _calculateChipNormal(v5, 2, 100, v15);
  *(_OWORD *)(v5 + 64) = v16;
  uint64_t v17 = v5 + self->_chipIndexBufferOffset;
  int chipNumIndexes = self->_chipNumIndexes;
  uint64_t v19 = (chipNumIndexes - 1);
  if (chipNumIndexes >= 2)
  {
    uint64_t v20 = 0;
    do
    {
      int v21 = v20 - 2 * (v20 / 3);
      if (v20 == 3 * (v20 / 3)) {
        LOWORD(v21) = 0;
      }
      *(_WORD *)(v17 + 2 * v20++) = v21;
    }
    while (v19 != v20);
  }
  *(_WORD *)(v17 + 2 * (int)v19) = 1;
}

- (void)_createSmoothStepTexture
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F35330]);
  [v3 setTextureType:0];
  [v3 setPixelFormat:10];
  [v3 setWidth:16];
  [v3 setMipmapLevelCount:1];
  [v3 setUsage:1];
  [v3 setStorageMode:0];
  __int16 v4 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *__int16 v4 = xmmword_1A64FC0A0;
  uint64_t v5 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v3];
  [v5 setLabel:@"smooth step gradient"];
  memset(v7, 0, sizeof(v7));
  long long v8 = xmmword_1A64FC0B0;
  uint64_t v9 = 1;
  [v5 replaceRegion:v7 mipmapLevel:0 slice:0 withBytes:v4 bytesPerRow:16 bytesPerImage:16];
  free(v4);
  smoothStepTexture = self->_smoothStepTexture;
  self->_smoothStepTexture = (MTLTexture *)v5;
}

- (void)_createNoiseTexture
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F35330]);
  [v3 setTextureType:7];
  [v3 setWidth:64];
  [v3 setHeight:64];
  [v3 setDepth:64];
  [v3 setMipmapLevelCount:1];
  [v3 setStorageMode:0];
  [v3 setPixelFormat:10];
  [v3 setUsage:1];
  __int16 v4 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v3];
  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = v4;

  [(MTLTexture *)self->_noiseTexture setLabel:@"noise"];
  uint64_t v6 = self->_noiseTexture;
  memset(v7, 0, sizeof(v7));
  int64x2_t v8 = vdupq_n_s64(0x40uLL);
  uint64_t v9 = 64;
  [(MTLTexture *)v6 replaceRegion:v7 mipmapLevel:0 slice:0 withBytes:&precalcSUICOrbNoise3DTexture bytesPerRow:64 bytesPerImage:4096];
}

- (void)_loadAssets
{
}

- (void)_updateDynamicBufferState
{
  self->_uniformBufferAddress = (void *)[(MTLBuffer *)self->_dynamicUniformBuffer contents];
}

- (void)_updateChipsSizesForOnOff
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_onSpring = &self->_onSpring;
  int64_t renderMode = self->_renderMode;
  float v4 = 1.0;
  if (!renderMode) {
    float v4 = 0.0;
  }
  float springAmount = self->_onSpring.springAmount;
  double v6 = (float)(springAmount * v4);
  float value = p_onSpring->value;
  float v8 = v6 + p_onSpring->value * (1.0 - springAmount);
  float v9 = v8 - p_onSpring->value;
  if (v9 != 0.0)
  {
    curVelocitdouble y = self->_onSpring.curVelocity;
    float maxAcceleration = self->_onSpring.maxAcceleration;
    float v12 = v9 - curVelocity;
    if ((float)(v9 - curVelocity) <= maxAcceleration)
    {
      if (v12 >= (float)-maxAcceleration) {
        float v13 = curVelocity + v12;
      }
      else {
        float v13 = curVelocity - maxAcceleration;
      }
    }
    else
    {
      float v13 = curVelocity + maxAcceleration;
    }
    self->_onSpring.curVelocitdouble y = v13;
    if (v9 >= 0.0)
    {
      if (v13 <= v9)
      {
LABEL_14:
        float value = value + v13;
        p_onSpring->float value = value;
        int64_t renderMode = self->_renderMode;
        goto LABEL_15;
      }
    }
    else if (v13 >= v9)
    {
      goto LABEL_14;
    }
    self->_onSpring.curVelocitdouble y = v9;
    float v13 = v9;
    goto LABEL_14;
  }
LABEL_15:
  if (!renderMode)
  {
    double v14 = 0.166666672;
LABEL_21:
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    double v16 = value;
    if (v14 < v16)
    {
      LODWORD(v28) = 1065353216;
      if (v14 + 0.166666667 < v16)
      {
        HIDWORD(v28) = 1065353216;
        if (v14 + 0.333333333 < v16)
        {
          LODWORD(v29) = 1065353216;
          if (v14 + 0.5 < v16)
          {
            HIDWORD(v29) = 1065353216;
            if (v14 + 0.666666667 < v16)
            {
              LODWORD(v30) = 1065353216;
              if (v14 + 0.833333333 < v16) {
                HIDWORD(v30) = 1065353216;
              }
            }
          }
        }
      }
    }
    uint64_t v17 = 0;
    p_float maxAcceleration = &self->_chipSpring[0].maxAcceleration;
    float v19 = 0.0;
    while (1)
    {
      float v20 = *(p_maxAcceleration - 2);
      float v21 = (float)(*(float *)((char *)&v28 + v17) * p_maxAcceleration[1]) + v20 * (1.0 - p_maxAcceleration[1]);
      float v22 = v21 - v20;
      if (v22 != 0.0) {
        break;
      }
LABEL_41:
      float v19 = v19 + v20;
      v17 += 4;
      p_maxAcceleration += 4;
      if (v17 == 24)
      {
        self->_maxChipSize = self->_chipSpring[0].value;
        float v27 = v19 * 0.166666667;
        self->_averageChipSize = v27;
        return;
      }
    }
    float v23 = *(p_maxAcceleration - 1);
    float v24 = *p_maxAcceleration;
    float v25 = v22 - v23;
    if ((float)(v22 - v23) <= *p_maxAcceleration)
    {
      if (v25 >= (float)-v24) {
        float v26 = v23 + v25;
      }
      else {
        float v26 = v23 - v24;
      }
    }
    else
    {
      float v26 = v23 + v24;
    }
    *(p_maxAcceleration - 1) = v26;
    if (v22 >= 0.0)
    {
      if (v26 <= v22)
      {
LABEL_40:
        float v20 = v20 + v26;
        *(p_maxAcceleration - 2) = v20;
        goto LABEL_41;
      }
    }
    else if (v26 >= v22)
    {
      goto LABEL_40;
    }
    *(p_maxAcceleration - 1) = v22;
    float v26 = v22;
    goto LABEL_40;
  }
  double v14 = 0.0;
  if (self->_chipSpring[5].value <= 0.999) {
    goto LABEL_21;
  }
  for (uint64_t i = 0; i != 6; ++i)
    self->_chipSpring[i].float value = 1.0;
  self->_maxChipSize = 1.0;
  self->_averageChipSize = 1.0;
}

- (void)_updateSiriPhysics:(float)a3
{
  self->_float time = self->_time + a3;
  if (self->_renderMode != self->_mode) {
    [(SUICOrbView *)self _updateRenderModeWithDelta:*(double *)&a3];
  }
  [(SUICOrbView *)self _updateChipsSizesForOnOff];
  float time = self->_time;
  BOOL reduceMotion = self->_reduceMotion;
  float v7 = (float)(time - self->_thinkingTimeStart) * 4.2 + 2.35619449;
  float v8 = cosf(v7) * 0.5 + 0.5;
  if (reduceMotion) {
    float v9 = 0.0;
  }
  else {
    float v9 = v8;
  }
  float v10 = self->_powerLevel * self->_powerLevel;
  if (reduceMotion)
  {
    float v12 = 1.33;
  }
  else
  {
    float v11 = v10 * 0.42 + 1.33000004;
    float v12 = v11;
  }
  float v13 = 1.0;
  float value = v12;
  switch(self->_renderMode)
  {
    case 0:
      if (reduceMotion) {
        float value = self->_bubbleSpring.value;
      }
      else {
        float value = 0.0;
      }
      if (self->_maxChipSize < 0.25)
      {
        self->_drawingVeryLastFrame = 1;
        [(SUICOrbView *)self _initSprings];
        float v13 = 1.0;
        self->_bubbleSpring.float value = 0.0;
        self->_resetOnNextFrame = 1;
      }
      break;
    case 2:
      if (self->_startingThinkingModeNow)
      {
        if (self->_thinkingSpring.value < 0.025)
        {
          self->_thinkingTimeStart = time;
          float v15 = (float)(self->_time - time) * 4.2 + 2.35619449;
          float v16 = cosf(v15) * 0.5 + 0.5;
          if (reduceMotion) {
            float v9 = 0.0;
          }
          else {
            float v9 = v16;
          }
        }
        self->_startingThinkingModeNow = 0;
      }
      else if (self->_reduceThinkingModeFramerate && !self->_fullyThinkingModeNow && self->_thinkingSpring.value > 0.85)
      {
        [(SUICOrbView *)self _startReducedFramerateForPerf];
        self->_fullyThinkingModeNow = 1;
      }
      float value = v9 * 0.33 + 1.0;
      float v13 = 0.2;
      break;
    case 3:
      float value = 1.0;
      float v13 = 0.9;
      break;
    default:
      break;
  }
  self->_sinTime = v9;
  if (self->_drawingVeryLastFrame) {
    goto LABEL_122;
  }
  float v17 = self->_bubbleSpring.value;
  float v18 = (float)(value * self->_bubbleSpring.springAmount) + v17 * (1.0 - self->_bubbleSpring.springAmount);
  float v19 = v18 - v17;
  if (v19 != 0.0)
  {
    curVelocitdouble y = self->_bubbleSpring.curVelocity;
    float maxAcceleration = self->_bubbleSpring.maxAcceleration;
    float v22 = v19 - curVelocity;
    if ((float)(v19 - curVelocity) <= maxAcceleration)
    {
      if (v22 >= (float)-maxAcceleration) {
        float v23 = curVelocity + v22;
      }
      else {
        float v23 = curVelocity - maxAcceleration;
      }
    }
    else
    {
      float v23 = curVelocity + maxAcceleration;
    }
    self->_bubbleSpring.curVelocitdouble y = v23;
    if (v19 >= 0.0)
    {
      if (v23 <= v19)
      {
LABEL_39:
        self->_bubbleSpring.float value = v17 + v23;
        goto LABEL_40;
      }
    }
    else if (v23 >= v19)
    {
      goto LABEL_39;
    }
    self->_bubbleSpring.curVelocitdouble y = v19;
    float v23 = v19;
    goto LABEL_39;
  }
LABEL_40:
  p_energySpring = &self->_energySpring;
  if (self->_renderMode == 3) {
    float v25 = v12;
  }
  else {
    float v25 = value;
  }
  float springAmount = self->_energySpring.springAmount;
  double v27 = (float)(springAmount * v25);
  float v28 = p_energySpring->value;
  float v29 = v27 + p_energySpring->value * (1.0 - springAmount);
  float v30 = v29 - p_energySpring->value;
  if (v30 != 0.0)
  {
    float v31 = self->_energySpring.curVelocity;
    float v32 = self->_energySpring.maxAcceleration;
    float v33 = v30 - v31;
    if ((float)(v30 - v31) <= v32)
    {
      if (v33 >= (float)-v32) {
        float v34 = v31 + v33;
      }
      else {
        float v34 = v31 - v32;
      }
    }
    else
    {
      float v34 = v31 + v32;
    }
    self->_energySpring.curVelocitdouble y = v34;
    if (v30 >= 0.0)
    {
      if (v34 <= v30)
      {
LABEL_54:
        p_energySpring->float value = v28 + v34;
        goto LABEL_55;
      }
    }
    else if (v34 >= v30)
    {
      goto LABEL_54;
    }
    self->_energySpring.curVelocitdouble y = v30;
    float v34 = v30;
    goto LABEL_54;
  }
LABEL_55:
  float v35 = self->_volumeSpring.value;
  float v36 = (float)(v10 * self->_volumeSpring.springAmount) + v35 * (1.0 - self->_volumeSpring.springAmount);
  float v37 = v36 - v35;
  if (v37 == 0.0) {
    goto LABEL_67;
  }
  float v38 = self->_volumeSpring.curVelocity;
  float v39 = self->_volumeSpring.maxAcceleration;
  float v40 = v37 - v38;
  if ((float)(v37 - v38) <= v39)
  {
    if (v40 >= (float)-v39) {
      float v41 = v38 + v40;
    }
    else {
      float v41 = v38 - v39;
    }
  }
  else
  {
    float v41 = v38 + v39;
  }
  self->_volumeSpring.curVelocitdouble y = v41;
  if (v37 < 0.0)
  {
    if (v41 >= v37) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  if (v41 > v37)
  {
LABEL_65:
    self->_volumeSpring.curVelocitdouble y = v37;
    float v41 = v37;
  }
LABEL_66:
  self->_volumeSpring.float value = v35 + v41;
LABEL_67:
  float v42 = self->_chipsSpring.value;
  float v43 = (float)(v13 * self->_chipsSpring.springAmount) + v42 * (1.0 - self->_chipsSpring.springAmount);
  float v44 = v43 - v42;
  if (v44 == 0.0) {
    goto LABEL_79;
  }
  float v45 = self->_chipsSpring.curVelocity;
  float v46 = self->_chipsSpring.maxAcceleration;
  float v47 = v44 - v45;
  if ((float)(v44 - v45) <= v46)
  {
    if (v47 >= (float)-v46) {
      float v48 = v45 + v47;
    }
    else {
      float v48 = v45 - v46;
    }
  }
  else
  {
    float v48 = v45 + v46;
  }
  self->_chipsSpring.curVelocitdouble y = v48;
  if (v44 < 0.0)
  {
    if (v48 >= v44) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  if (v48 > v44)
  {
LABEL_77:
    self->_chipsSpring.curVelocitdouble y = v44;
    float v48 = v44;
  }
LABEL_78:
  self->_chipsSpring.float value = v42 + v48;
LABEL_79:
  p_specularSpring = &self->_specularSpring;
  int64_t renderMode = self->_renderMode;
  float v51 = 1.0;
  if (renderMode == 2) {
    float v52 = 0.0;
  }
  else {
    float v52 = 1.0;
  }
  float v53 = p_specularSpring->value;
  float v54 = (float)(self->_specularSpring.springAmount * v52)
      + p_specularSpring->value * (1.0 - self->_specularSpring.springAmount);
  float v55 = v54 - p_specularSpring->value;
  if (v55 != 0.0)
  {
    float v56 = self->_specularSpring.curVelocity;
    float v57 = self->_specularSpring.maxAcceleration;
    float v58 = v55 - v56;
    if ((float)(v55 - v56) <= v57)
    {
      if (v58 >= (float)-v57) {
        float v59 = v56 + v58;
      }
      else {
        float v59 = v56 - v57;
      }
    }
    else
    {
      float v59 = v56 + v57;
    }
    self->_specularSpring.curVelocitdouble y = v59;
    if (v55 >= 0.0)
    {
      if (v59 <= v55)
      {
LABEL_93:
        p_specularSpring->float value = v53 + v59;
        int64_t renderMode = self->_renderMode;
        goto LABEL_94;
      }
    }
    else if (v59 >= v55)
    {
      goto LABEL_93;
    }
    self->_specularSpring.curVelocitdouble y = v55;
    float v59 = v55;
    goto LABEL_93;
  }
LABEL_94:
  p_speakingSpring = &self->_speakingSpring;
  if (renderMode != 3) {
    float v51 = 0.0;
  }
  float v61 = self->_speakingSpring.springAmount;
  double v62 = (float)(v61 * v51);
  float v63 = p_speakingSpring->value;
  float v64 = v62 + p_speakingSpring->value * (1.0 - v61);
  float v65 = v64 - p_speakingSpring->value;
  if (v65 != 0.0)
  {
    float v66 = self->_speakingSpring.curVelocity;
    float v67 = self->_speakingSpring.maxAcceleration;
    float v68 = v65 - v66;
    if ((float)(v65 - v66) <= v67)
    {
      if (v68 >= (float)-v67) {
        float v69 = v66 + v68;
      }
      else {
        float v69 = v66 - v67;
      }
    }
    else
    {
      float v69 = v66 + v67;
    }
    self->_speakingSpring.curVelocitdouble y = v69;
    if (v65 >= 0.0)
    {
      if (v69 <= v65)
      {
LABEL_107:
        p_speakingSpring->float value = v63 + v69;
        int64_t renderMode = self->_renderMode;
        goto LABEL_108;
      }
    }
    else if (v69 >= v65)
    {
      goto LABEL_107;
    }
    self->_speakingSpring.curVelocitdouble y = v65;
    float v69 = v65;
    goto LABEL_107;
  }
LABEL_108:
  p_thinkingSpring = &self->_thinkingSpring;
  float v71 = 0.0;
  if (renderMode == 2) {
    float v71 = 1.0;
  }
  float v72 = self->_thinkingSpring.springAmount;
  double v73 = (float)(v72 * v71);
  float v74 = p_thinkingSpring->value;
  float v75 = v73 + p_thinkingSpring->value * (1.0 - v72);
  float v76 = v75 - p_thinkingSpring->value;
  if (v76 != 0.0)
  {
    float v77 = self->_thinkingSpring.curVelocity;
    float v78 = self->_thinkingSpring.maxAcceleration;
    float v79 = v76 - v77;
    if ((float)(v76 - v77) <= v78)
    {
      if (v79 >= (float)-v78) {
        float v80 = v77 + v79;
      }
      else {
        float v80 = v77 - v78;
      }
    }
    else
    {
      float v80 = v77 + v78;
    }
    self->_thinkingSpring.curVelocitdouble y = v80;
    if (v76 >= 0.0)
    {
      if (v80 <= v76)
      {
LABEL_121:
        p_thinkingSpring->float value = v74 + v80;
        goto LABEL_122;
      }
    }
    else if (v80 >= v76)
    {
      goto LABEL_121;
    }
    self->_thinkingSpring.curVelocitdouble y = v76;
    float v80 = v76;
    goto LABEL_121;
  }
LABEL_122:
  float v81 = self->_bubbleSpring.value * 1.15;
  self->_bubbleDrawnSize = v81;
  BOOL v82 = self->_reduceMotion;
  if (!self->_reduceMotion) {
    self->_bubbleDrawnSize = self->_averageChipSize * v81;
  }
  float v83 = fabsf(self->_energySpring.curVelocity);
  float v84 = fabsf(self->_bubbleSpring.curVelocity);
  float v85 = fabsf(self->_speakingSpring.curVelocity);
  float v86 = fabsf(self->_thinkingSpring.curVelocity);
  float v87 = v83 * 3.0;
  double v88 = self->_energySpring.value;
  if (v88 <= 1.33)
  {
    double v90 = a3;
  }
  else
  {
    double v89 = (v88 + -1.33) * 10.0;
    double v90 = a3;
    float v87 = v87 + v89 * a3;
  }
  float v91 = 1.0;
  if (!v82) {
    float v91 = 10.0;
  }
  float v92 = v87 + (float)((float)(v91 * self->_volumeSpring.value) * a3);
  float v93 = fmaxf(self->_onSpring.curVelocity, 0.0);
  double averageChipSize = self->_averageChipSize;
  float v95 = v92 + v93 * 20.0 * averageChipSize;
  float v96 = v95 + v84 * 4.0 * averageChipSize;
  float v97 = v96 + v85 * 4.0;
  float v98 = v97 + v86 * 4.0;
  double v99 = v90 * 25.0;
  if (v99 < v98)
  {
    float v100 = v99;
    float v98 = v100;
  }
  self->_rotationEnergdouble y = v98;
  float v101 = self->_volumeSpring.value
       + (float)((float)((float)((float)((float)(v85 * 5.0) + (float)(v83 * 10.0)) + (float)(v84 * 5.0))
                       + (float)(v93 * 20.0))
               * self->_framerateEnergyModifier);
  if (v101 > 1.3) {
    float v101 = 1.3;
  }
  float v102 = self->_maxChipSize * v101;
  float v103 = self->_glowSpring.value;
  float v104 = (float)(self->_glowSpring.springAmount * v102) + v103 * (1.0 - self->_glowSpring.springAmount);
  float v105 = v104 - v103;
  if (v105 != 0.0)
  {
    float v106 = self->_glowSpring.curVelocity;
    float v107 = self->_glowSpring.maxAcceleration;
    float v108 = v105 - v106;
    if ((float)(v105 - v106) <= v107)
    {
      if (v108 >= (float)-v107) {
        float v109 = v106 + v108;
      }
      else {
        float v109 = v106 - v107;
      }
    }
    else
    {
      float v109 = v106 + v107;
    }
    self->_glowSpring.curVelocitdouble y = v109;
    if (v105 >= 0.0)
    {
      if (v109 <= v105)
      {
LABEL_144:
        self->_glowSpring.float value = v103 + v109;
        goto LABEL_145;
      }
    }
    else if (v109 >= v105)
    {
      goto LABEL_144;
    }
    self->_glowSpring.curVelocitdouble y = v105;
    float v109 = v105;
    goto LABEL_144;
  }
LABEL_145:
  self->_frameEnergdouble y = v102;
}

- (void)_updateSiriGraphicsState:(double)a3
{
  uniformBufferAddress = self->_uniformBufferAddress;
  long long v5 = *(_OWORD *)&self->_anon_2a0[48];
  long long v7 = *(_OWORD *)self->_anon_2a0;
  long long v6 = *(_OWORD *)&self->_anon_2a0[16];
  uniformBufferAddress[2] = *(_OWORD *)&self->_anon_2a0[32];
  uniformBufferAddress[3] = v5;
  _OWORD *uniformBufferAddress = v7;
  uniformBufferAddress[1] = v6;
  float v72 = uniformBufferAddress;
  long long v8 = *(_OWORD *)&self->_anon_2a0[32];
  long long v9 = *(_OWORD *)&self->_anon_2a0[48];
  long long v11 = *(_OWORD *)self->_anon_2a0;
  long long v10 = *(_OWORD *)&self->_anon_2a0[16];
  *(_OWORD *)&self->_anon_2e0[32] = v8;
  *(_OWORD *)&self->_anon_2e0[48] = v9;
  *(_OWORD *)self->_anon_2e0 = v11;
  *(_OWORD *)&self->_anon_2e0[16] = v10;
  *(float *)&self->_anon_2e0[80] = self->_bubbleDrawnSize;
  if (self->_reduceMotion)
  {
    LODWORD(v8) = 961656599;
  }
  else
  {
    *(double *)&long long v8 = self->_frameEnergy * 0.002;
    *(float *)&long long v8 = *(double *)&v8;
  }
  float v12 = a3;
  v13.i32[3] = 0;
  float32x4_t v14 = vaddq_f32(*(float32x4_t *)&self->_anon_2e0[64], vmlaq_n_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v8, 0), (float32x4_t)xmmword_1A64FC0C0, v12));
  *(float32x4_t *)&self->_anon_2e0[64] = v14;
  if (v14.f32[0] > 2.0)
  {
    v13.f32[0] = v14.f32[0] + -2.0;
    HIDWORD(v15) = v14.i32[1];
    *(float *)&uint64_t v15 = v14.f32[0] + -2.0;
    v13.i32[1] = v14.i32[1];
    v13.i32[2] = v14.i32[2];
    *(_DWORD *)&self->_anon_2e0[72] = v14.i32[2];
    *(void *)&self->_anon_2e0[64] = v15;
    float32x4_t v14 = v13;
  }
  if (v14.f32[1] > 2.0)
  {
    float32x4_t v16 = v14;
    v16.f32[1] = v14.f32[1] + -2.0;
    *(void *)&self->_anon_2e0[64] = v16.i64[0];
    v16.i32[2] = v14.i32[2];
    *(_DWORD *)&self->_anon_2e0[72] = v14.i32[2];
    float32x4_t v14 = v16;
  }
  if (v14.f32[2] > 2.0)
  {
    *(float *)&self->_anon_2e0[72] = v14.f32[2] + -2.0;
    *(void *)&self->_anon_2e0[64] = v14.i64[0];
  }
  anon_2e0 = self->_anon_2e0;
  uint64_t v17 = 0;
  float v18 = a3 * 1.25663706;
  float v19 = v18 + (float)(self->_sinTime * (float)((float)(v18 * 4.0) - v18));
  if (self->_reduceMotion) {
    float v19 = v19 * 0.5;
  }
  float v20 = self->_thinkRotation + v19;
  if (v20 > 6.28318531)
  {
    float v21 = v20 + -6.28318531;
    float v20 = v21;
  }
  _S3 = self->_thinkingSpring.value;
  __asm { FCVT            H3, S3 }
  *((_WORD *)uniformBufferAddress + 232) = LOWORD(_S3);
  self->_thinkRotation = v20;
  float v27 = a3 * 0.7;
  float v28 = v27 + self->_rotationEnergy * 0.5;
  float v29 = (float)((float)((float)(v27 * 8.0) * self->_thinkingSpring.value)
              + (float)((float)(1.0 - self->_thinkingSpring.value) * v28))
      * (float)((float)(1.0 - self->_speakingSpring.value) + (float)(self->_speakingSpring.value * 0.5));
  if (!_ZF)
  {
    float v30 = v29 * 0.4;
    float v29 = v30;
  }
  self->_chipRotation = self->_chipRotation + v29;
  double value = self->_thinkingSpring.value;
  float32x4_t v71 = (float32x4_t)vdupq_n_s32(0x41490FDBu);
  do
  {
    noise2();
    v79.i64[0] = v32;
    noise2();
    __int32 v77 = v33;
    noise2();
    float v35 = 1.0;
    if (!self->_reduceMotion) {
      float v35 = self->_chipSpring[v17].value;
    }
    float32x4_t v36 = v79;
    v36.i32[1] = v77;
    v36.i32[2] = v34;
    float32x4_t v79 = vmulq_f32(v36, v71);
    __float2 v37 = __sincosf_stret(v79.f32[2]);
    __float2 v38 = __sincosf_stret(v79.f32[0]);
    v39.i32[0] = 0;
    v39.i32[1] = LODWORD(v38.__cosval);
    v39.i64[1] = LODWORD(v38.__sinval);
    float32x4_t v74 = v39;
    v39.i32[0] = 0;
    v39.f32[1] = -v38.__sinval;
    v39.i64[1] = LODWORD(v38.__cosval);
    float32x4_t v73 = v39;
    __float2 v40 = __sincosf_stret(v79.f32[1]);
    uint64_t v41 = 0;
    HIDWORD(v42) = 0;
    *(void *)&long long v42 = LODWORD(v40.__cosval);
    *((float *)&v42 + 2) = -v40.__sinval;
    LODWORD(v43) = 0;
    *((float *)&v43 + 1) = v40.__cosval + (float)(1.0 - v40.__cosval);
    *(void *)&long long v44 = LODWORD(v40.__sinval);
    *((void *)&v44 + 1) = LODWORD(v40.__cosval);
    long long v80 = v42;
    long long v81 = v43;
    long long v82 = v44;
    long long v83 = xmmword_1A64FBA40;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    do
    {
      *(long long *)((char *)&v84 + v41) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(v38.__cosval + (float)(1.0 - v38.__cosval)), COERCE_FLOAT(*(long long *)((char *)&v80 + v41))), v74, *(float32x2_t *)((char *)&v80 + v41), 1), v73, *(float32x4_t *)((char *)&v80 + v41), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v80 + v41), 3);
      v41 += 16;
    }
    while (v41 != 64);
    uint64_t v45 = 0;
    float32x4_t v47 = (float32x4_t)COERCE_UNSIGNED_INT(-v37.__sinval);
    float32x4_t cosval_low = (float32x4_t)LODWORD(v37.__cosval);
    cosval_low.i32[1] = LODWORD(v37.__sinval);
    v47.i32[1] = LODWORD(v37.__cosval);
    v48.i64[0] = 0;
    long long v80 = v84;
    long long v81 = v85;
    long long v82 = v86;
    long long v83 = v87;
    long long v84 = 0uLL;
    long long v85 = 0uLL;
    long long v86 = 0uLL;
    long long v87 = 0uLL;
    do
    {
      v48.i64[1] = COERCE_UNSIGNED_INT(v37.__cosval + (float)(1.0 - v37.__cosval));
      *(long long *)((char *)&v84 + v45) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(long long *)((char *)&v80 + v45))), v47, *(float32x2_t *)((char *)&v80 + v45), 1), v48, *(float32x4_t *)((char *)&v80 + v45), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v80 + v45), 3);
      v45 += 16;
    }
    while (v45 != 64);
    if (value <= 0.0001)
    {
      uint64_t v62 = 0;
      v63.i32[1] = 0;
      v63.i64[1] = 0;
      v63.f32[0] = (float)(v35 * self->_chipsSpring.value) * self->_bubbleSpring.value;
      v64.i32[0] = 0;
      v64.i64[1] = 0;
      v64.f32[1] = v63.f32[0];
      v65.i64[0] = 0;
      v65.i32[3] = 0;
      v65.f32[2] = v63.f32[0];
      long long v80 = v84;
      long long v81 = v85;
      long long v82 = v86;
      long long v83 = v87;
      long long v84 = 0uLL;
      long long v85 = 0uLL;
      long long v86 = 0uLL;
      long long v87 = 0uLL;
      do
      {
        *(long long *)((char *)&v84 + v62) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(long long *)((char *)&v80 + v62))), v64, *(float32x2_t *)((char *)&v80 + v62), 1), v65, *(float32x4_t *)((char *)&v80 + v62), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v80 + v62), 3);
        v62 += 16;
      }
      while (v62 != 64);
    }
    else
    {
      float v49 = ((double)(int)v17 + (double)(int)v17) * 3.14159265 / 6.0 - self->_thinkRotation;
      float v50 = self->_thinkingSpring.value;
      long long v78 = v86;
      float32x4_t v79 = (float32x4_t)v87;
      long long v75 = v84;
      long long v76 = v85;
      __float2 v51 = __sincosf_stret(v49);
      uint64_t v52 = 0;
      v53.i32[1] = 0;
      v53.i64[1] = 0;
      v53.f32[0] = v35 * self->_chipsSpring.value;
      v54.i32[0] = 0;
      v54.i64[1] = 0;
      v54.f32[1] = v53.f32[0];
      v55.i64[0] = 0;
      v55.i32[3] = 0;
      v55.f32[2] = v53.f32[0];
      float v56 = self->_bubbleSpring.value;
      v57.i32[2] = 0;
      v57.i32[3] = 1.0;
      v58.i32[0] = 0;
      v58.i32[3] = 0;
      *(uint64_t *)((char *)v58.i64 + 4) = LODWORD(v56);
      long long v80 = v75;
      long long v81 = v76;
      long long v82 = v78;
      long long v83 = (__int128)v79;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      do
      {
        *(long long *)((char *)&v84 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(long long *)((char *)&v80 + v52))), v54, *(float32x2_t *)((char *)&v80 + v52), 1), v55, *(float32x4_t *)((char *)&v80 + v52), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v80 + v52), 3);
        v52 += 16;
      }
      while (v52 != 64);
      uint64_t v59 = 0;
      long long v80 = v84;
      long long v81 = v85;
      long long v82 = v86;
      long long v83 = v87;
      long long v84 = 0uLL;
      long long v85 = 0uLL;
      long long v86 = 0uLL;
      long long v87 = 0uLL;
      do
      {
        v57.f32[1] = (float)(v50 * v51.__sinval) * 0.75;
        v57.f32[0] = (float)(v50 * v51.__cosval) * 0.75;
        *(long long *)((char *)&v84 + v59) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A64FBA20, COERCE_FLOAT(*(long long *)((char *)&v80 + v59))), (float32x4_t)xmmword_1A64FBA10, *(float32x2_t *)((char *)&v80 + v59), 1), (float32x4_t)xmmword_1A64FBA00, *(float32x4_t *)((char *)&v80 + v59), 2), v57, *(float32x4_t *)((char *)&v80 + v59), 3);
        v59 += 16;
      }
      while (v59 != 64);
      uint64_t v60 = 0;
      v61.i64[0] = 0;
      v61.i64[1] = LODWORD(v56);
      long long v80 = v84;
      long long v81 = v85;
      long long v82 = v86;
      long long v83 = v87;
      long long v84 = 0uLL;
      long long v85 = 0uLL;
      long long v86 = 0uLL;
      long long v87 = 0uLL;
      do
      {
        *(long long *)((char *)&v84 + v60) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v56), COERCE_FLOAT(*(long long *)((char *)&v80 + v60))), v58, *(float32x2_t *)((char *)&v80 + v60), 1), v61, *(float32x4_t *)((char *)&v80 + v60), 2), (float32x4_t)xmmword_1A64FBA40, *(float32x4_t *)((char *)&v80 + v60), 3);
        v60 += 16;
      }
      while (v60 != 64);
    }
    long long v66 = v85;
    long long v67 = v86;
    long long v68 = v87;
    float v69 = &v72[4 * v17];
    v69[4] = v84;
    v69[5] = v66;
    v69[6] = v67;
    v69[7] = v68;
    ++v17;
  }
  while (v17 != 6);
  v72[28] = *((_OWORD *)anon_2e0 + 4);
}

- (void)_drawingVeryLastFrameLogic:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SUICOrbView *)self _setPaused:1];
  [(CAMetalLayer *)self->_metalLayer removeBackBuffers];
  objc_initWeak(&location, self);
  long long v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  long long v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float32x4_t v13 = "-[SUICOrbView _drawingVeryLastFrameLogic:]";
    _os_log_impl(&dword_1A64CC000, v6, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion drawing  last frame", buf, 0xCu);
  }
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SUICOrbView__drawingVeryLastFrameLogic___block_invoke;
    v9[3] = &unk_1E5C59A78;
    objc_copyWeak(&v10, &location);
    [v4 addCompletedHandler:v9];
    objc_destroyWeak(&v10);
  }
  else
  {
    long long v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float32x4_t v13 = "-[SUICOrbView _drawingVeryLastFrameLogic:]";
      _os_log_impl(&dword_1A64CC000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion calling completion async", buf, 0xCu);
    }
    id v8 = objc_loadWeakRetained(&location);
    [v8 _drawingVeryLastFrameOffCompletion];
  }
  self->_drawingVeryLastFrame = 0;
  objc_destroyWeak(&location);
}

void __42__SUICOrbView__drawingVeryLastFrameLogic___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    long long v5 = "-[SUICOrbView _drawingVeryLastFrameLogic:]_block_invoke";
    _os_log_impl(&dword_1A64CC000, v2, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion calling completion in command buffer completion", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _drawingVeryLastFrameOffCompletion];
}

- (void)_drawingVeryLastFrameOffCompletion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SUICOrbView__drawingVeryLastFrameOffCompletion__block_invoke;
  block[3] = &unk_1E5C59470;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__SUICOrbView__drawingVeryLastFrameOffCompletion__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 424))
  {
    int v2 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[SUICOrbView _drawingVeryLastFrameOffCompletion]_block_invoke";
      _os_log_impl(&dword_1A64CC000, v2, OS_LOG_TYPE_DEFAULT, "%s #orbCompletion completion exists", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 424) + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 424);
    *(void *)(v3 + 424) = 0;
  }
}

- (void)_drawSiriFrame:(id)a3
{
  id v4 = a3;
  if (self->_resetOnNextFrame)
  {
    self->_resetOnNextFrame = 0;
    [(SUICOrbView *)self _initSprings];
  }
  if (self->_reallocTextures)
  {
    double v5 = (double)(int)*(void *)self->_setupRasterSize;
    double v6 = (double)(int)HIDWORD(*(void *)self->_setupRasterSize);
    *(void *)self->_setupRasterSize = 0;
    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", v5, v6);
    self->_reallocTextures = 0;
  }
  if (!self->_drawingVeryLastFrame)
  {
    [(SUICOrbView *)self _updateDynamicBufferState];
    if (self->_dynamicFramerate)
    {
      [v4 targetTimestamp];
      double v9 = v8;
      [v4 timestamp];
      double v11 = v9 - v10;
      int maxPhysicsIterationsPerFrame = (int)(v11 / self->_physicsRate + 0.5);
      if (self->_maxPhysicsIterationsPerFrame < maxPhysicsIterationsPerFrame) {
        int maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsPerFrame;
      }
      if (maxPhysicsIterationsPerFrame <= 1) {
        int maxPhysicsIterationsPerFrame = 1;
      }
      double v13 = v11 / (double)maxPhysicsIterationsPerFrame;
      float v14 = v13;
      float v15 = (float)maxPhysicsIterationsPerFrame;
      float v16 = 0.0;
      do
      {
        *(float *)&double v13 = v14;
        [(SUICOrbView *)self _updateSiriPhysics:v13];
        float v16 = v16 + 1.0;
      }
      while (!self->_drawingVeryLastFrame && v16 < v15);
    }
    else
    {
      float oneOverFPS = self->_oneOverFPS;
      *(float *)&double v7 = oneOverFPS;
      [(SUICOrbView *)self _updateSiriPhysics:v7];
      double v11 = oneOverFPS;
    }
    [(SUICOrbView *)self _updateSiriGraphicsState:v11];
  }
  if ([(CAMetalLayer *)self->_metalLayer isDrawableAvailable])
  {
    float v19 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    if (v19)
    {
      float v20 = v19;
      id v45 = v4;
      [v19 setLabel:@"Siri Chips"];
      float v21 = [v20 renderCommandEncoderWithDescriptor:self->_siriChipRenderPassDesc];
      [v21 setLabel:@"Chips"];
      [v21 setCullMode:1];
      [v21 setRenderPipelineState:self->_siriChipBackfacePipeline];
      [v21 setVertexBuffer:self->_siriChipGeom offset:0 atIndex:0];
      [v21 setVertexBuffer:self->_dynamicUniformBuffer offset:0 atIndex:1];
      [v21 setVertexTexture:self->_noiseTexture atIndex:0];
      [v21 setFragmentBytes:&_drawSiriFrame__chipConstants length:24 atIndex:0];
      [v21 setFragmentBytes:&self->_glowSpring length:4 atIndex:1];
      [v21 setFragmentTexture:self->_smoothStepTexture atIndex:0];
      [v21 drawIndexedPrimitives:3 indexCount:self->_chipNumIndexes indexType:0 indexBuffer:self->_siriChipGeom indexBufferOffset:self->_chipIndexBufferOffset instanceCount:self->_numberOfChips];
      [v21 setCullMode:2];
      [v21 setRenderPipelineState:self->_siriChipFrontfacePipeline];
      [v21 drawIndexedPrimitives:3 indexCount:self->_chipNumIndexes indexType:0 indexBuffer:self->_siriChipGeom indexBufferOffset:self->_chipIndexBufferOffset instanceCount:self->_numberOfChips];
      [v21 endEncoding];
      [v20 commit];
      [v20 waitUntilScheduled];
      float v22 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      [v22 setLabel:@"Siri Blur"];
      mpsBlur = self->_mpsBlur;
      long long v51 = *(_OWORD *)&self->_mpsChipBlurOffset.x;
      int64_t z = self->_mpsChipBlurOffset.z;
      [(MPSImageGaussianBlur *)mpsBlur setOffset:&v51];
      [(MPSImageGaussianBlur *)self->_mpsBlur encodeToCommandBuffer:v22 sourceTexture:self->_siriChipsTexture destinationTexture:self->_blurChipsTexture];
      [v22 commit];
      [v22 waitUntilScheduled];
      float v24 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      [v24 setLabel:@"Siri Mask"];
      float v25 = [v24 renderCommandEncoderWithDescriptor:self->_sphereMaskRenderPassDesc];
      [v25 setLabel:@"Mask"];
      [v25 setRenderPipelineState:self->_sphereMaskPipeline];
      [v25 setVertexBuffer:self->_sphereGeom offset:0 atIndex:0];
      [v25 setVertexTexture:self->_noiseTexture atIndex:0];
      objc_msgSend(v25, "setVertexBytes:length:atIndex:");
      [v25 setFrontFacingWinding:0];
      [v25 setFrontFacingWinding:1];
      [v25 setCullMode:2];
      [v25 drawIndexedPrimitives:3 indexCount:self->_sphereNumIndexes indexType:0 indexBuffer:self->_sphereGeom indexBufferOffset:self->_sphereIndexBufferOffet];
      [v25 endEncoding];
      float v26 = self->_mpsBlur;
      long long v51 = 0uLL;
      int64_t z = 0;
      [(MPSImageGaussianBlur *)v26 setOffset:&v51];
      [(MPSImageGaussianBlur *)self->_mpsBlur encodeToCommandBuffer:v24 sourceTexture:self->_sphereMaskTexture destinationTexture:self->_blurMaskTexture];
      [v24 commit];
      float v27 = [(CAMetalLayer *)self->_metalLayer nextDrawable];
      float v28 = v27;
      if (v27)
      {
        long long v44 = v27;
        float v29 = [v27 texture];
        float v30 = [(MTLRenderPassDescriptor *)self->_finalRenderPassDesc colorAttachments];
        float v31 = [v30 objectAtIndexedSubscript:0];
        [v31 setResolveTexture:v29];

        uint64_t v32 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

        [v32 setLabel:@"Siri Composite"];
        __int32 v33 = [v32 renderCommandEncoderWithDescriptor:self->_finalRenderPassDesc];
        [v33 setLabel:@"Composite"];
        [v33 setVertexBytes:&self->_bubbleDrawnSize length:4 atIndex:0];
        *(float *)&long long v51 = (float)(1.0 - self->_thinkingSpring.value)
                       + (float)(self->_thinkingSpring.value + self->_thinkingSpring.value);
        [v33 setVertexBytes:&v51 length:4 atIndex:1];
        float averageChipSize = 1.0;
        if (self->_reduceMotion) {
          float averageChipSize = self->_averageChipSize;
        }
        float v50 = averageChipSize;
        [v33 setFragmentTexture:self->_blurChipsTexture atIndex:0];
        [v33 setRenderPipelineState:self->_siriShadowPipeline];
        [v33 setFragmentTexture:self->_blurMaskTexture atIndex:1];
        float v49 = (float)((float)((float)(self->_thinkingSpring.value * 0.3)
                            + (float)((float)(1.0 - self->_thinkingSpring.value) * 0.6))
                    * self->_maxChipSize)
            * averageChipSize;
        [v33 setFragmentBytes:&v49 length:4 atIndex:0];
        [v33 drawPrimitives:4 vertexStart:0 vertexCount:48];
        [v33 setFrontFacingWinding:1];
        [v33 setCullMode:2];
        [v33 setRenderPipelineState:self->_siriCompositePipeline];
        [v33 setVertexBuffer:self->_sphereGeom offset:0 atIndex:0];
        [v33 setVertexTexture:self->_noiseTexture atIndex:0];
        float v48 = (float)(1.0 - self->_thinkingSpring.value) + (float)(self->_thinkingSpring.value * 0.5);
        [v33 setFragmentBytes:&v48 length:4 atIndex:0];
        int v47 = 1114636288;
        [v33 setFragmentBytes:&v47 length:4 atIndex:1];
        float v35 = 1.0 - pow(1.0 - self->_averageChipSize, 4.0);
        if (self->_reduceMotion) {
          float v35 = 1.0;
        }
        float v46 = self->_specularSpring.value * v35;
        [v33 setFragmentBytes:&v46 length:4 atIndex:2];
        [v33 setFragmentBytes:&v50 length:4 atIndex:3];
        [v33 setVertexBytes:self->_anon_2e0 length:96 atIndex:2];
        [v33 drawIndexedPrimitives:3 indexCount:self->_sphereNumIndexes indexType:0 indexBuffer:self->_sphereGeom indexBufferOffset:self->_sphereIndexBufferOffet];
        [v33 setCullMode:0];
        [v33 setRenderPipelineState:self->_siriAddBlitPipeline];
        [v33 setFragmentTexture:self->_siriChipsTexture atIndex:0];
        [v33 drawPrimitives:3 vertexStart:0 vertexCount:3];
        [v33 endEncoding];
        float v28 = v44;
        [v32 presentDrawable:v44];
        if (self->_drawingVeryLastFrame) {
          [(SUICOrbView *)self _drawingVeryLastFrameLogic:v32];
        }
        [v32 commit];
      }
      else
      {
        uint64_t v32 = v24;
      }

      id v4 = v45;
    }
    else
    {
      float32x4_t v36 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SUICOrbView _drawSiriFrame:](v36, v37, v38, v39, v40, v41, v42, v43);
      }
    }
  }
  else if (self->_drawingVeryLastFrame)
  {
    [(SUICOrbView *)self _drawingVeryLastFrameLogic:0];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)SUICOrbView;
  -[SUICOrbView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (self->_device)
  {
    double v6 = [(SUICOrbView *)self layer];
    [v6 contentsScale];
    float v8 = v7;

    -[SUICOrbView _updateMetalTextureRasterSize:](self, "_updateMetalTextureRasterSize:", width * v8, height * v8);
  }
}

- (void)_updateMetalTextureRasterSize:(CGSize)a3
{
  v3.i32[0] = 0;
  int width = (int)a3.width;
  int height = (int)a3.height;
  v8.i32[0] = (int)a3.width;
  v8.i32[1] = (int)a3.height;
  v4.i32[0] = (int)a3.height;
  double v9 = COERCE_DOUBLE(vshl_u32(v8, (uint32x2_t)vdup_lane_s32((int32x2_t)vand_s8((int8x8_t)vcgt_s32(v3, v4), (int8x8_t)0x100000001), 0)));
  if ((int)a3.height > 254) {
    double v9 = *(double *)&v8;
  }
  uint32x2_t v55 = v8;
  double v57 = v9;
  if (height <= 254) {
    double v10 = a3.width + a3.width;
  }
  else {
    double v10 = a3.width;
  }
  if (height <= 254) {
    double v11 = a3.height + a3.height;
  }
  else {
    double v11 = a3.height;
  }
  -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", v10, v11);
  if (*(void *)self->_setupRasterSize != width || HIDWORD(*(void *)self->_setupRasterSize) != height)
  {
    *(uint32x2_t *)self->_setupRasterSize = v55;
    float v13 = (double)SHIDWORD(v57) * 0.04;
    id v14 = objc_alloc(MEMORY[0x1E4F35588]);
    *(float *)&double v15 = v13;
    float v16 = (MPSImageGaussianBlur *)[v14 initWithDevice:self->_device sigma:v15];
    mpsBlur = self->_mpsBlur;
    self->_mpsBlur = v16;

    int v18 = LODWORD(v57) + 3;
    int v19 = HIDWORD(v57) + 3;
    if (v57 < 0.0)
    {
      int v20 = HIDWORD(v57) + 1;
    }
    else
    {
      int v19 = HIDWORD(v57);
      int v20 = HIDWORD(v57);
    }
    int v56 = v20;
    if (SLODWORD(v57) >= 0) {
      int v18 = LODWORD(v57);
    }
    self->_mpsChipBlurOffset.double x = (uint64_t)v18 >> 2;
    self->_mpsChipBlurOffset.double y = (uint64_t)v19 >> 2;
    self->_mpsChipBlurOffset.int64_t z = 0;
    float v21 = v11;
    float v22 = v10 / v21;
    *(_OWORD *)self->_anon_2a0 = COERCE_UNSIGNED_INT(1.3764 / v22);
    *(_OWORD *)&self->_anon_2a0[16] = xmmword_1A64FC0D0;
    *(_OWORD *)&self->_anon_2a0[32] = xmmword_1A64FC0E0;
    *(_OWORD *)&self->_anon_2a0[48] = xmmword_1A64FC0F0;
    siriChipsTexture = self->_siriChipsTexture;
    self->_siriChipsTexture = 0;
    if (SLODWORD(v57) >= 0) {
      int v24 = LODWORD(v57);
    }
    else {
      int v24 = LODWORD(v57) + 1;
    }
    int v54 = v24;

    blurChipsTexture = self->_blurChipsTexture;
    self->_blurChipsTexture = 0;

    sphereMaskTexture = self->_sphereMaskTexture;
    self->_sphereMaskTexture = 0;

    blurMaskTexture = self->_blurMaskTexture;
    self->_blurMaskTexture = 0;

    id v28 = objc_alloc_init(MEMORY[0x1E4F35330]);
    [v28 setWidth:SLODWORD(v57)];
    [v28 setHeight:SHIDWORD(v57)];
    [v28 setMipmapLevelCount:1];
    [v28 setStorageMode:3];
    siriChipsTextureMSAA = self->_siriChipsTextureMSAA;
    self->_siriChipsTextureMSAA = 0;

    [v28 setSampleCount:4];
    [v28 setPixelFormat:80];
    [v28 setTextureType:4];
    [v28 setUsage:4];
    float v30 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    float v31 = self->_siriChipsTextureMSAA;
    self->_siriChipsTextureMSAA = v30;

    [(MTLTexture *)self->_siriChipsTextureMSAA setLabel:@"chips MSAA"];
    compositeTextureMSAA = self->_compositeTextureMSAA;
    self->_compositeTextureMSAA = 0;

    [v28 setSampleCount:4];
    [v28 setWidth:(unint64_t)v10];
    [v28 setHeight:(unint64_t)v11];
    objc_msgSend(v28, "setPixelFormat:", -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"));
    [v28 setTextureType:4];
    [v28 setUsage:4];
    __int32 v33 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    __int32 v34 = self->_compositeTextureMSAA;
    self->_compositeTextureMSAA = v33;

    [(MTLTexture *)self->_compositeTextureMSAA setLabel:@"composite MSAA"];
    [v28 setWidth:SLODWORD(v57)];
    [v28 setHeight:SHIDWORD(v57)];
    [v28 setSampleCount:1];
    [v28 setTextureType:2];
    [v28 setStorageMode:2];
    [v28 setPixelFormat:10];
    [v28 setUsage:5];
    float v35 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    float32x4_t v36 = self->_sphereMaskTexture;
    self->_sphereMaskTexture = v35;

    [(MTLTexture *)self->_sphereMaskTexture setLabel:@"platter"];
    [v28 setPixelFormat:80];
    uint64_t v37 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    uint64_t v38 = self->_siriChipsTexture;
    self->_siriChipsTexture = v37;

    [(MTLTexture *)self->_siriChipsTexture setLabel:@"chips"];
    [v28 setUsage:7];
    [v28 setPixelFormat:10];
    uint64_t v39 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    uint64_t v40 = self->_blurMaskTexture;
    self->_blurMaskTexture = v39;

    [(MTLTexture *)self->_blurMaskTexture setLabel:@"blurred platter"];
    [v28 setPixelFormat:80];
    [v28 setWidth:(uint64_t)v54 >> 1];
    [v28 setHeight:(uint64_t)v56 >> 1];
    uint64_t v41 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v28];
    uint64_t v42 = self->_blurChipsTexture;
    self->_blurChipsTexture = v41;

    [(MTLTexture *)self->_blurChipsTexture setLabel:@"blurred chips"];
    uint64_t v43 = self->_siriChipsTextureMSAA;
    long long v44 = [(MTLRenderPassDescriptor *)self->_siriChipRenderPassDesc colorAttachments];
    id v45 = [v44 objectAtIndexedSubscript:0];
    [v45 setTexture:v43];

    float v46 = self->_siriChipsTexture;
    int v47 = [(MTLRenderPassDescriptor *)self->_siriChipRenderPassDesc colorAttachments];
    float v48 = [v47 objectAtIndexedSubscript:0];
    [v48 setResolveTexture:v46];

    float v49 = self->_sphereMaskTexture;
    float v50 = [(MTLRenderPassDescriptor *)self->_sphereMaskRenderPassDesc colorAttachments];
    long long v51 = [v50 objectAtIndexedSubscript:0];
    [v51 setTexture:v49];

    uint64_t v52 = self->_compositeTextureMSAA;
    float32x4_t v58 = [(MTLRenderPassDescriptor *)self->_finalRenderPassDesc colorAttachments];
    float32x4_t v53 = [v58 objectAtIndexedSubscript:0];
    [v53 setTexture:v52];
  }
}

- (void)_startReducedFramerateForPerf
{
  self->_dynamicFramerate = 1;
  [(SUICOrbView *)self _configurePreferredFramesPerSecond:30];
}

- (void)_endReducedFramerateForPerf
{
  self->_dynamicFramerate = 0;
  [(SUICOrbView *)self _resetDisplayLinkFramerate];
}

- (void)_choosePhysicsRate:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_framesPerSecond = a3;
  if (a3 == 30)
  {
    double v7 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      double v11 = "-[SUICOrbView _choosePhysicsRate:]";
      _os_log_impl(&dword_1A64CC000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbView running 30 Hz physics", (uint8_t *)&v10, 0xCu);
    }
    self->_unint64_t framerateType = 0;
    float v5 = 0.033333;
    float v6 = 0.2;
    goto LABEL_9;
  }
  if (a3 == 60)
  {
    int32x2_t v4 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      double v11 = "-[SUICOrbView _choosePhysicsRate:]";
      _os_log_impl(&dword_1A64CC000, v4, OS_LOG_TYPE_DEFAULT, "%s #OrbView running 60 Hz physics", (uint8_t *)&v10, 0xCu);
    }
    self->_unint64_t framerateType = 1;
    self->_int maxPhysicsIterationsPerFrame = 2;
    float v5 = 0.016667;
    float v6 = 0.3;
LABEL_9:
    float v8 = v5;
    goto LABEL_13;
  }
  double v9 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    double v11 = "-[SUICOrbView _choosePhysicsRate:]";
    _os_log_impl(&dword_1A64CC000, v9, OS_LOG_TYPE_DEFAULT, "%s #OrbView running dynamic (240 Hz) physics", (uint8_t *)&v10, 0xCu);
  }
  self->_unint64_t framerateType = 2;
  self->_dynamicFramerate = 1;
  self->_int maxPhysicsIterationsPerFrame = 10;
  float v6 = 1.5;
  float v8 = 0.0041667;
  float v5 = 0.0083333;
LABEL_13:
  self->_framerateEnergyModifier = v6;
  self->_float oneOverFPS = v5;
  self->_physicsRate = v8;
}

- (void)_resetDisplayLinkFramerate
{
  displayLink = self->_displayLink;
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);

  -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int32x2_t v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  CAFrameRateRange v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[SUICOrbView invalidate]";
    _os_log_impl(&dword_1A64CC000, v4, OS_LOG_TYPE_DEFAULT, "%s #OrbView", (uint8_t *)&v9, 0xCu);
  }
  [(NSTimer *)self->_invalidateTimer invalidate];
  invalidateTimer = self->_invalidateTimer;
  self->_invalidateTimer = 0;

  if (self->_offCompletion)
  {
    float v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[SUICOrbView invalidate]";
      _os_log_impl(&dword_1A64CC000, v6, OS_LOG_TYPE_DEFAULT, "%s #OrbView Delay displayLink invalidation since _offCompletion is not yet set to nil", (uint8_t *)&v9, 0xCu);
    }
    double v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__invalidateDisplayLink selector:0 userInfo:0 repeats:2.0];
    float v8 = self->_invalidateTimer;
    self->_invalidateTimer = v7;
  }
  else
  {
    [(SUICOrbView *)self _invalidateDisplayLink];
  }
}

- (void)_invalidateDisplayLink
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int32x2_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    float v8 = "-[SUICOrbView _invalidateDisplayLink]";
    _os_log_impl(&dword_1A64CC000, v3, OS_LOG_TYPE_DEFAULT, "%s #OrbView", (uint8_t *)&v7, 0xCu);
  }
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    float v5 = self->_displayLink;
    self->_displayLink = 0;
  }
  id offCompletion = self->_offCompletion;
  self->_id offCompletion = 0;
}

- (void)setNumberOfChips:(int)a3
{
  if (a3 >= 6) {
    int v3 = 6;
  }
  else {
    int v3 = a3;
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  if (v3 != self->_numberOfChips) {
    self->_numberOfChips = v3;
  }
}

- (void)setCurrentlyShownChannel:(int)a3
{
  if ((a3 & 0x80000000) == 0 && self->_currentlyShownChannel != a3) {
    self->_currentlyShownChannel = a3;
  }
}

- (void)setBias:(float)a3
{
  if (a3 > 3.0) {
    a3 = 3.0;
  }
  float v3 = fmaxf(a3, -1.0);
  if (v3 != self->_bias) {
    self->_bias = v3;
  }
}

- (void)setScale:(float)a3
{
  if (a3 > 3.0) {
    a3 = 3.0;
  }
  float v3 = fmaxf(a3, -1.0);
  if (v3 != self->_scale) {
    self->_scale = v3;
  }
}

- (void)setPower:(float)a3
{
  if (a3 > 3.0) {
    a3 = 3.0;
  }
  float v3 = fmaxf(a3, -1.0);
  if (v3 != self->_power) {
    self->_power = v3;
  }
}

- (float)linearPowerLevel
{
  return self->_powerLevel;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)suppressTTSAnimations
{
  return self->_suppressTTSAnimations;
}

- (void)setSuppressTTSAnimations:(BOOL)a3
{
  self->_suppressTTSAnimations = a3;
}

- (BOOL)reduceThinkingModeFramerate
{
  return self->_reduceThinkingModeFramerate;
}

- (void)setReduceThinkingModeFramerate:(BOOL)a3
{
  self->_reduceThinkingModeFramerate = a3;
}

- (int)currentlyShownChannel
{
  return self->_currentlyShownChannel;
}

- (int)numberOfChips
{
  return self->_numberOfChips;
}

- (float)bias
{
  return self->_bias;
}

- (float)scale
{
  return self->_scale;
}

- (float)power
{
  return self->_power;
}

- (NSTimer)invalidateTimer
{
  return self->_invalidateTimer;
}

- (void)setInvalidateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidateTimer, 0);
  objc_storeStrong((id *)&self->_sphereGeom, 0);
  objc_storeStrong((id *)&self->_siriChipGeom, 0);
  objc_storeStrong((id *)&self->_mpsBlur, 0);
  objc_storeStrong((id *)&self->_finalRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_sphereMaskRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_siriChipRenderPassDesc, 0);
  objc_storeStrong((id *)&self->_blurMaskTexture, 0);
  objc_storeStrong((id *)&self->_siriShadowPipeline, 0);
  objc_storeStrong((id *)&self->_noiseTexture, 0);
  objc_storeStrong((id *)&self->_smoothStepTexture, 0);
  objc_storeStrong((id *)&self->_blurChipsTexture, 0);
  objc_storeStrong((id *)&self->_compositeTextureMSAA, 0);
  objc_storeStrong((id *)&self->_sphereMaskTextureMSAA, 0);
  objc_storeStrong((id *)&self->_siriChipsTextureMSAA, 0);
  objc_storeStrong((id *)&self->_sphereMaskTexture, 0);
  objc_storeStrong((id *)&self->_siriChipsTexture, 0);
  objc_storeStrong((id *)&self->_siriAddBlitPipeline, 0);
  objc_storeStrong((id *)&self->_sphereMaskPipeline, 0);
  objc_storeStrong((id *)&self->_siriCompositePipeline, 0);
  objc_storeStrong((id *)&self->_siriChipFrontfacePipeline, 0);
  objc_storeStrong((id *)&self->_siriChipBackfacePipeline, 0);
  objc_storeStrong((id *)&self->_dynamicUniformBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_offCompletion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_metalLayer, 0);
}

- (void)_commonInitWithFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_drawSiriFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end