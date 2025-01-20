@interface SUICEdgeLightMaskMetalLayer
+ (BOOL)currentIdiomDefaultsToFullBorder;
+ (void)prewarm;
- (BOOL)isPaused;
- (SUICEdgeLightMaskMetalLayer)init;
- (SUICEdgeLightMaskMetalLayer)initWithBaseEdgeLightLayer:(id)a3;
- (SUICEdgeLightMaskMetalLayer)initWithCommandQueue:(id)a3;
- (SUICEdgeLightMaskMetalLayer)initWithFullBorder:(BOOL)a3;
- (SUICEdgeLightMaskMetalLayer)initWithScreen:(id)a3 commandQueue:(id)a4;
- (id)_createRenderPipelineFromLibrary:(id)a3 archive:(id)a4 vert:(id)a5 frag:(id)a6;
- (id)_getCommandQueue;
- (id)_getNoiseTexture;
- (id)_getScreen;
- (void)_calculateCornerRadiusRatio:(BOOL)a3;
- (void)_commonInitWithScreen:(id)a3 commandQueue:(id)a4;
- (void)_drawFrame:(id)a3;
- (void)_invalidate;
- (void)_loadMetalPipelines;
- (void)_loadMetalState;
- (void)_startOffAnimation;
- (void)_updateForUIIdiom;
- (void)_updateMetalRatios:(CGSize)a3;
- (void)_updateiPadLayout;
- (void)animateOffWithCompletion:(id)a3;
- (void)animateOn;
- (void)animateOnWithCompletion:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dismissalBlur:(float)a3;
- (void)endReducedFramerateForPerformance;
- (void)setBounds:(CGRect)a3;
- (void)setBurstOpacity:(float)_S0;
- (void)setBurstStartPosition:(unint64_t)a3;
- (void)setBurstStartPositionCustom:(CGPoint)a3;
- (void)setFlamePosX:(float)_S0 posY:(float)_S1 radius:(float)_S2;
- (void)setFlameScale:(float)a3;
- (void)setInputAveragePowerLevel:(float)a3 withPeakPowerLevel:(float)a4;
- (void)setMinimumPowerLevel:(float)a3;
- (void)setPaused:(BOOL)a3;
- (void)setScreen:(id)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)startReducedFramerateForPerformance;
- (void)stopVolumeInput;
- (void)updateVolumeInputdB:(float)a3;
@end

@implementation SUICEdgeLightMaskMetalLayer

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [(SUICEdgeLightMaskMetalLayer *)self removeAllAnimations];
  [(SUICEdgeLightMaskMetalLayer *)self _invalidate];
  offCompletion = (void (**)(void))self->_offCompletion;
  if (offCompletion)
  {
    offCompletion[2]();
    id v6 = self->_offCompletion;
    self->_offCompletion = 0;
  }
}

- (void)setBurstStartPosition:(unint64_t)a3
{
  self->_shouldBurst = 1;
  _D0 = 0x3FC0000000000000;
  switch(a3)
  {
    case 0uLL:
      self->_shouldBurst = 0;
      _D0 = 0;
      goto LABEL_8;
    case 1uLL:
      _D0 = *(void *)self->_buttonCenter;
      goto LABEL_8;
    case 2uLL:
      goto LABEL_8;
    case 3uLL:
      _D0 = 3217031168;
      goto LABEL_8;
    case 4uLL:
      _D0 = 1069547520;
      goto LABEL_8;
    case 5uLL:
      _D0 = 0x3F400000BF400000;
      goto LABEL_8;
    case 6uLL:
      __asm { FMOV            V0.2S, #0.75; jumptable 00000001A64D8C74 case 6 }
LABEL_8:
      *(void *)self->_anon_c0 = _D0;
      goto LABEL_9;
    case 7uLL:
      return;
    default:
LABEL_9:
      self->_burstModeHasBeenSet = 1;
      self->_burstAnimationType = a3;
      if (!self->_paused) {
        [(SUICEdgeLightMaskMetalLayer *)self animateOn];
      }
      return;
  }
}

- (void)setBurstStartPositionCustom:(CGPoint)a3
{
  self->_shouldBurst = 1;
  CGFloat y = a3.y;
  *(float32x2_t *)self->_anon_c0 = vcvt_f32_f64((float64x2_t)a3);
  self->_burstModeHasBeenSet = 1;
  self->_burstAnimationType = 7;
  if (!self->_paused) {
    [(SUICEdgeLightMaskMetalLayer *)self animateOn];
  }
}

- (void)_commonInitWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  AFLogInitIfNeeded();
  v8 = (id *)MEMORY[0x1E4F4E378];
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E378]);
  v10 = *v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A64CC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EdgeLightMaskLayerFirstFrame", (const char *)&unk_1A65831AB, v29, 2u);
  }

  self->_firstFrameSignpost = v9;
  self->_firstFrame = 1;
  v12 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v12;

  if (!self->_device)
  {
    v14 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SUICEdgeLightMaskMetalLayer _commonInitWithScreen:commandQueue:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  v22 = [[SUICWEdgeLight alloc] initWithDelegate:self];
  wedgeLight = self->_wedgeLight;
  self->_wedgeLight = v22;

  v24 = v6;
  if (!v6) {
    v24 = (void *)[(MTLDevice *)self->_device newCommandQueue];
  }
  objc_storeStrong((id *)&self->_commandQueue, v24);
  if (!v6) {

  }
  self->_animating = 0;
  self->_burstModeHasBeenSet = 0;
  self->_paused = 1;
  self->_customFlameScale = 1.0;
  v25 = [MEMORY[0x1E4FB16C8] currentDevice];
  self->_idiom = [v25 userInterfaceIdiom];

  *(_WORD *)&self->_anon_d8[26] = 0;
  *(_WORD *)&self->_anon_c0[20] = COERCE_UNSIGNED_INT(1.0);
  *(_WORD *)&self->_anon_c0[12] = 22080;
  self->_volumeLinearPowerLevel = 0.0;
  self->_minPowerLevel = 0.0;
  [(CAMetalLayer *)self setName:@"EdgeLightMaskLayer"];
  [(SUICEdgeLightMaskMetalLayer *)self setOpaque:1];
  [(SUICEdgeLightMaskMetalLayer *)self setAllowsDisplayCompositing:0];
  [(CAMetalLayer *)self setDevice:self->_device];
  [(SUICEdgeLightMaskMetalLayer *)self _loadMetalPipelines];
  [(SUICEdgeLightMaskMetalLayer *)self _loadMetalState];
  baseLayer = self->_baseLayer;
  if (baseLayer) {
    [(SUICEdgeLightMaskMetalLayer *)baseLayer _getNoiseTexture];
  }
  else {
  v27 = +[SUICIntelligentLightLayer createNoiseTextureWithDevice:self->_device commandQueue:self->_commandQueue];
  }
  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = v27;

  [(SUICEdgeLightMaskMetalLayer *)self setScreen:v7];
}

- (SUICEdgeLightMaskMetalLayer)initWithBaseEdgeLightLayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  id v6 = [(CAMetalLayer *)&v10 init];
  if (v6 == self)
  {
    objc_storeStrong((id *)&self->_baseLayer, a3);
    id v7 = [v5 _getScreen];
    v8 = [v5 _getCommandQueue];
    [(SUICEdgeLightMaskMetalLayer *)self _commonInitWithScreen:v7 commandQueue:v8];
  }
  return v6;
}

- (SUICEdgeLightMaskMetalLayer)initWithScreen:(id)a3 commandQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v8 = [(CAMetalLayer *)&v11 init];
  if (v8 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    [(SUICEdgeLightMaskMetalLayer *)self _commonInitWithScreen:v6 commandQueue:v7];
  }

  return v8;
}

- (SUICEdgeLightMaskMetalLayer)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  id v5 = [(CAMetalLayer *)&v8 init];
  if (v5 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    [(SUICEdgeLightMaskMetalLayer *)self _commonInitWithScreen:0 commandQueue:v4];
  }

  return v5;
}

- (SUICEdgeLightMaskMetalLayer)initWithFullBorder:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  id v4 = [(CAMetalLayer *)&v7 init];
  if (v4 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    [(SUICEdgeLightMaskMetalLayer *)self _commonInitWithScreen:0 commandQueue:0];
  }
  return v4;
}

- (SUICEdgeLightMaskMetalLayer)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  v3 = [(CAMetalLayer *)&v9 init];
  if (v3 == self)
  {
    baseLayer = self->_baseLayer;
    self->_baseLayer = 0;

    id v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    dismissalBlurFilter = self->_dismissalBlurFilter;
    self->_dismissalBlurFilter = v5;

    [(CAFilter *)self->_dismissalBlurFilter setName:@"blurFilter"];
    [(CAFilter *)self->_dismissalBlurFilter setValue:&unk_1EFB50208 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    v10[0] = self->_dismissalBlurFilter;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(SUICEdgeLightMaskMetalLayer *)self setFilters:v7];

    [(SUICEdgeLightMaskMetalLayer *)self _commonInitWithScreen:0 commandQueue:0];
  }
  return v3;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)SUICEdgeLightMaskMetalLayer;
  -[SUICEdgeLightMaskMetalLayer setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != 0.0 && height != 0.0) {
    -[SUICEdgeLightMaskMetalLayer _updateMetalRatios:](self, "_updateMetalRatios:", width, height);
  }
}

- (id)_getScreen
{
  return self->_screen;
}

- (id)_getCommandQueue
{
  return self->_commandQueue;
}

- (id)_getNoiseTexture
{
  return self->_noiseTexture;
}

- (id)_createRenderPipelineFromLibrary:(id)a3 archive:(id)a4 vert:(id)a5 frag:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  uint64_t v15 = (void *)[v10 newFunctionWithName:v12];
  [v14 setVertexFunction:v15];

  uint64_t v16 = (void *)[v10 newFunctionWithName:v13];
  [v14 setFragmentFunction:v16];

  uint64_t v17 = [v14 colorAttachments];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setPixelFormat:65];

  uint64_t v19 = [v14 colorAttachments];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setBlendingEnabled:0];

  if (v11)
  {
    v43[0] = v11;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    [v14 setBinaryArchives:v21];

    device = self->_device;
    id v34 = 0;
    v23 = (void *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v14 options:4 reflection:0 error:&v34];
    id v24 = v34;
    v25 = v24;
    if (v23 && !v24)
    {
      id v26 = v23;
      goto LABEL_10;
    }
    v27 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[SUICEdgeLightMaskMetalLayer _createRenderPipelineFromLibrary:archive:vert:frag:]";
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2112;
      id v42 = v25;
      _os_log_error_impl(&dword_1A64CC000, v27, OS_LOG_TYPE_ERROR, "%s Unable to load pipeline state from binary archive (v:%@ f:%@), error %@", buf, 0x2Au);
    }
  }
  else
  {
    v25 = 0;
    v23 = 0;
  }
  v28 = self->_device;
  id v33 = v25;
  v29 = (void *)[(MTLDevice *)v28 newRenderPipelineStateWithDescriptor:v14 error:&v33];
  id v30 = v33;

  if (!v29)
  {
    v32 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[SUICEdgeLightMaskMetalLayer _createRenderPipelineFromLibrary:archive:vert:frag:]";
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2112;
      id v42 = v30;
      _os_log_error_impl(&dword_1A64CC000, v32, OS_LOG_TYPE_ERROR, "%s Failed to create Siri Intelligent Light pipeline state (v:%@ f:%@), error %@", buf, 0x2Au);
    }
    __assert_rtn("-[SUICEdgeLightMaskMetalLayer _createRenderPipelineFromLibrary:archive:vert:frag:]", "SUICEdgeLightMaskMetalLayer.m", 348, "0");
  }
  id v26 = v29;

LABEL_10:

  return v26;
}

- (void)_loadMetalPipelines
{
}

- (void)_loadMetalState
{
  v3 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  renderPassDesc = self->_renderPassDesc;
  self->_renderPassDesc = v3;

  id v5 = [(MTLRenderPassDescriptor *)self->_renderPassDesc colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];

  [v6 setLoadAction:0];
  [v6 setStoreAction:1];
}

- (void)_updateMetalRatios:(CGSize)a3
{
  *(float *)&a3.double width = a3.width;
  float height = a3.height;
  float v4 = 1.0;
  if (*(float *)&a3.width != 0.0) {
    float v4 = height / *(float *)&a3.width;
  }
  *((float *)&a3.width + 1) = height;
  *(CGFloat *)self->_anon_d8 = a3.width;
  *(float *)&self->_anon_d8[8] = v4;
  *(void *)&self->_anon_a0[8] = 0;
  LODWORD(v5) = 1056964608;
  HIDWORD(v6) = 1056964608;
  if (*(float *)&a3.width >= height)
  {
    *((float *)&v5 + 1) = (float)(height / *(float *)&a3.width) * 0.5;
    double v7 = v5;
  }
  else
  {
    *(float *)&double v6 = (float)(*(float *)&a3.width / height) * 0.5;
    double v7 = v6;
  }
  *(double *)self->_anon_a0 = v7;
  [(SUICEdgeLightMaskMetalLayer *)self _updateForUIIdiom];
}

- (void)_drawFrame:(id)a3
{
  id v4 = a3;
  if ([(CAMetalLayer *)self isDrawableAvailable])
  {
    [(NSDate *)self->_burstStartDate timeIntervalSinceNow];
    float v6 = v5;
    if (v6 <= 0.0)
    {
      if (v6 >= -10.0) {
        _S9 = -v6;
      }
      else {
        _S9 = 10.0;
      }
      objc_super v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      if (v8)
      {
        [v4 targetTimestamp];
        double v10 = v9;
        [v4 timestamp];
        *(double *)&long long v11 = v10 - *(double *)&v11;
        *(float *)&long long v11 = *(double *)&v11;
        if (self->_isInFluidDismissal)
        {
          float fluidDismissalProgress = self->_fluidDismissalProgress;
        }
        else
        {
          float fluidDismissalProgress = self->_volumeLinearPowerLevel;
          if (self->_minPowerLevel >= fluidDismissalProgress) {
            float fluidDismissalProgress = self->_minPowerLevel;
          }
        }
        self->_physics.common.micPowerLevel = fluidDismissalProgress;
        long long v52 = v11;
        SUICLightPhysics_UpdatePhysics((uint64_t)&self->_physics, *(float *)&v11);
        uint64_t v21 = [(CAMetalLayer *)self nextDrawable];
        v22 = v21;
        if (v21)
        {
          v23 = [v21 texture];
          id v24 = [(MTLRenderPassDescriptor *)self->_renderPassDesc colorAttachments];
          v25 = [v24 objectAtIndexedSubscript:0];
          [v25 setTexture:v23];

          id v26 = [v8 renderCommandEncoderWithDescriptor:self->_renderPassDesc];
          float value = self->_physics.volumeSpring.value;
          long double v28 = value;
          float32_t v29 = value * 0.25 + 0.06;
          v30.i64[0] = 0xBC3439583BE56042;
          v30.f32[2] = v29;
          if (self->_physics.common.reduceMotion)
          {
            _S2 = self->_physics.onSpring.value;
            __asm { FCVT            H2, S2 }
            *(_WORD *)&self->_anon_c0[20] = LOWORD(_S2);
            float32x4_t v30 = vmulq_f32(v30, (float32x4_t)vdupq_n_s32(0x3EA8F5C3u));
          }
          float32x4_t v36 = vmlaq_n_f32(*(float32x4_t *)&self->_anon_a0[16], v30, *(float *)&v52);
          *(float32x4_t *)&self->_anon_a0[16] = v36;
          if (v36.f32[0] > 1.0)
          {
            v30.f32[0] = v36.f32[0] + -1.0;
            HIDWORD(v37) = v36.i32[1];
            *(float *)&uint64_t v37 = v36.f32[0] + -1.0;
            v30.i32[1] = v36.i32[1];
            v30.i32[2] = v36.i32[2];
            *(_DWORD *)&self->_anon_a0[24] = v36.i32[2];
            *(void *)&self->_anon_a0[16] = v37;
            float32x4_t v36 = v30;
          }
          if (v36.f32[1] < 0.0)
          {
            float32x4_t v38 = v36;
            v38.f32[1] = v36.f32[1] + 1.0;
            *(void *)&self->_anon_a0[16] = v38.i64[0];
            v38.i32[2] = v36.i32[2];
            *(_DWORD *)&self->_anon_a0[24] = v36.i32[2];
            float32x4_t v36 = v38;
          }
          if (v36.f32[2] > 1.0)
          {
            *(float *)&self->_anon_a0[24] = v36.f32[2] + -1.0;
            *(void *)&self->_anon_a0[16] = v36.i64[0];
          }
          _H2 = *(_WORD *)&self->_anon_c0[18];
          __asm { FCVT            D2, H2 }
          _D1 = _D2 + (float)((float)(value * value) * *(float *)&v52) * -0.1;
          __asm
          {
            FCVT            H1, D1
            FCVT            D2, H1
          }
          _D2 = _D2 + 6.28318531;
          __asm
          {
            FCVT            H2, D2
            FCMP            H1, #0
          }
          if (_NF) {
            _H1 = _H2;
          }
          *(short float *)&self->_anon_c0[18] = _H1;
          __asm { FCVT            H1, S9 }
          *(_WORD *)&self->_anon_c0[16] = _H1;
          _D0 = pow(v28, 0.3);
          __asm { FCVT            H0, D0 }
          *(_WORD *)&self->_anon_c0[14] = _H0;
          if (self->_iPadReduceMotionBoost)
          {
            __asm { FCVT            D0, H0 }
            _D0 = _D0 * 0.6 + 0.4;
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_c0[14] = LOWORD(_D0);
          }
          objc_msgSend(v26, "setLabel:", @"EdgeLight", v52);
          if (self->_useRoundPipeline) {
            v51 = &OBJC_IVAR___SUICEdgeLightMaskMetalLayer__roundRenderPipeline;
          }
          else {
            v51 = &OBJC_IVAR___SUICEdgeLightMaskMetalLayer__renderPipeline;
          }
          [v26 setRenderPipelineState:*(Class *)((char *)&self->super.super.super.isa + *v51)];
          [v26 setVertexBytes:self->_anon_a0 length:32 atIndex:0];
          [v26 setFragmentTexture:self->_noiseTexture atIndex:0];
          [v26 setFragmentBytes:self->_anon_c0 length:24 atIndex:0];
          [v26 setFragmentBytes:self->_anon_d8 length:32 atIndex:1];
          [v26 drawPrimitives:3 vertexStart:0 vertexCount:3];
          [v26 endEncoding];
          [v8 presentDrawable:v22];
        }
        if (self->_firstFrame)
        {
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __42__SUICEdgeLightMaskMetalLayer__drawFrame___block_invoke;
          v53[3] = &unk_1E5C596A0;
          v53[4] = self;
          [v8 addCompletedHandler:v53];
          self->_firstFrame = 0;
        }
        objc_msgSend(v8, "commit", v52);
      }
      else
      {
        id v13 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
          -[SUICEdgeLightMaskMetalLayer _drawFrame:](v13, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
  }
}

void __42__SUICEdgeLightMaskMetalLayer__drawFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 GPUStartTime];
  double v5 = v4;
  [v3 GPUEndTime];
  double v7 = v6;

  objc_super v8 = (id)*MEMORY[0x1E4F4E378];
  double v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v14 = 134217984;
    double v15 = v7 - v5;
    _os_signpost_emit_with_name_impl(&dword_1A64CC000, v9, OS_SIGNPOST_INTERVAL_END, v10, "EdgeLightMaskLayerFirstFrame", "GPU time:%f", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 144);
  if (v11)
  {
    (*(void (**)(void))(v11 + 16))();
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 144);
    *(void *)(v12 + 144) = 0;
  }
}

- (void)_calculateCornerRadiusRatio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  screen = self->_screen;
  if (screen)
  {
    double v6 = screen;
    if (!v6) {
      goto LABEL_19;
    }
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1BA8] _carScreen];
    objc_super v8 = v7;
    if (v7)
    {
      double v9 = v7;
    }
    else
    {
      double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    }
    double v6 = v9;

    if (!v6) {
      goto LABEL_19;
    }
  }
  anon_d8 = self->_anon_d8;
  if (COERCE_FLOAT(*(void *)self->_anon_d8) > 0.0)
  {
    LODWORD(v20) = *(void *)self->_anon_d8;
    float v11 = 13.5;
    if (([(UIScreen *)v6 _isCarScreen] & 1) == 0)
    {
      uint64_t v12 = [(UIScreen *)v6 traitCollection];
      [v12 displayCornerRadius];
      float v11 = v13;
    }
    float v14 = (float)(v11 + 1.0) + (float)(v11 + 1.0);
    float v15 = 10.0;
    if ((float)(v11 + 1.0) <= 5.0) {
      float v14 = 10.0;
    }
    float v16 = v14 / v20;
    if (v11 > 5.0) {
      float v15 = v11 + v11;
    }
    float v17 = v15 / v20;
    uint64_t v18 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      double v19 = *((float *)anon_d8 + 3);
      *(_DWORD *)buf = 136316162;
      v22 = "-[SUICEdgeLightMaskMetalLayer _calculateCornerRadiusRatio:]";
      __int16 v23 = 2048;
      double v24 = v11;
      __int16 v25 = 2048;
      double v26 = v16;
      __int16 v27 = 2048;
      double v28 = v17;
      __int16 v29 = 2048;
      double v30 = v19;
      _os_log_impl(&dword_1A64CC000, v18, OS_LOG_TYPE_DEFAULT, "%s #edgeLight screen corner radius (%.2f) calculated: %f (%f unpadded), default was: %f", buf, 0x34u);
    }
    if (v3)
    {
      *((float *)anon_d8 + 3) = v16;
      *((float *)anon_d8 + 4) = v17;
    }
  }
LABEL_19:
}

- (void)_updateiPadLayout
{
  anon_d8 = self->_anon_d8;
  int32x2_t v4 = vcge_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)self->_anon_d8, 1), *(float32x2_t *)self->_anon_d8);
  self->_useRoundPipeline = 1;
  *(void *)self->_buttonCenter = 0xBF8666663F000000;
  int32x2_t v5 = vdup_lane_s32(v4, 0);
  int8x8_t v6 = vbsl_s8((int8x8_t)v5, (int8x8_t)0xC14000003D4CCCCDLL, (int8x8_t)0xC1C000003CF5C28FLL);
  *(_DWORD *)&self->_anon_d8[12] = v6.i32[0];
  *(int8x8_t *)&self->_anon_d8[16] = v6;
  _D0 = 2.72 / self->_customFlameScale;
  __asm { FCVT            H0, D0 }
  *(_WORD *)&self->_anon_d8[24] = LOWORD(_D0);
  self->_iPadReduceMotionBoost = self->_physics.common.reduceMotion;
  uint64_t v12 = 0x3D3333333D3851ECLL;
  uint64_t v13 = MGGetProductType();
  if (v13 <= 2619317133)
  {
    if (v13 <= 1834147426)
    {
      if (v13 == 555503454) {
        goto LABEL_18;
      }
      uint64_t v14 = 746003606;
    }
    else
    {
      if (v13 == 1834147427 || v13 == 2089455188) {
        goto LABEL_19;
      }
      uint64_t v14 = 2487868872;
    }
LABEL_16:
    if (v13 != v14) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v13 <= 3241053351)
  {
    if (v13 != 2619317134)
    {
      if (v13 != 2628394914)
      {
        uint64_t v14 = 3054476161;
        goto LABEL_16;
      }
LABEL_19:
      *(void *)(anon_d8 + 12) = v12;
      self->_useRoundPipeline = 1;
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v12 = 0x3D4B1BBD3D51E109;
    goto LABEL_19;
  }
  if (v13 == 3241053352 || v13 == 3361025853) {
    goto LABEL_19;
  }
  if (v13 == 4242862982)
  {
    *(void *)self->_buttonCenter = 0xBF6666663F733333;
    int8x8_t v15 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(v5, 0x1FuLL)), (int8x8_t)0xC14000003E8A3D71, (int8x8_t)0xC18000003DF5C28FLL);
    *((_DWORD *)anon_d8 + 3) = v15.i32[0];
    *((int8x8_t *)anon_d8 + 2) = v15;
    self->_useRoundPipeline = 0;
    return;
  }
LABEL_20:

  [(SUICEdgeLightMaskMetalLayer *)self _calculateCornerRadiusRatio:1];
}

- (void)_updateForUIIdiom
{
  anon_d8 = self->_anon_d8;
  float32x2_t v22 = *(float32x2_t *)self->_anon_d8;
  *(_WORD *)&self->_anon_d8[28] = COERCE_UNSIGNED_INT(1.0);
  self->_useRoundPipeline = 0;
  *(void *)self->_buttonCenter = 0;
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    *((_WORD *)anon_d8 + 14) = 16179;
  }
  int64_t idiom = self->_idiom;
  if (idiom == -1)
  {
    int32x2_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    int64_t idiom = [v5 userInterfaceIdiom];
  }
  if (idiom == 1)
  {
    [(SUICEdgeLightMaskMetalLayer *)self _updateiPadLayout];
    return;
  }
  _D0 = 1.0 / self->_customFlameScale;
  __asm { FCVT            H0, D0 }
  *((_WORD *)anon_d8 + 12) = LOWORD(_D0);
  if (idiom != 3)
  {
    unsigned __int8 v14 = vcge_f32((float32x2_t)vdup_lane_s32((int32x2_t)v22, 1), v22).u8[0];
    *(void *)self->_buttonCenter = 0xBEB333333F400000;
    unsigned __int8 v15 = v14;
    if (v14) {
      float v16 = 0.27;
    }
    else {
      float v16 = 0.12;
    }
    *((float *)anon_d8 + 3) = v16;
    if (v14) {
      float v17 = -12.0;
    }
    else {
      float v17 = -24.0;
    }
    *((float *)anon_d8 + 5) = v17;
    uint64_t v18 = MGGetProductType();
    if (v18 <= 2688879998)
    {
      if (v18 > 574536382)
      {
        if (v18 == 574536383)
        {
          uint64_t v20 = 0x3E82FA0D3E87AE14;
        }
        else
        {
          if (v18 != 851437781) {
            goto LABEL_43;
          }
          uint64_t v20 = 0x3E8F4ECA3E92F1AALL;
        }
        *(void *)(anon_d8 + 12) = v20;
        *((float *)anon_d8 + 5) = v17;
LABEL_42:
        self->_useRoundPipeline = 1;
        return;
      }
      if (v18 == 133314240)
      {
LABEL_35:
        *(void *)self->_buttonCenter = 0xBE851EB83F400000;
        uint64_t v19 = 0x3E8F4ECA3E926E98;
        goto LABEL_37;
      }
      if (v18 == 330877086)
      {
        *(void *)self->_buttonCenter = 0xBEA8F5C33F400000;
        uint64_t v19 = 0x3E904A733E92F1AALL;
LABEL_37:
        *(void *)(anon_d8 + 12) = v19;
        float v21 = -18.0;
        if (v15) {
          float v21 = -9.0;
        }
        *((float *)anon_d8 + 5) = v21;
        goto LABEL_42;
      }
    }
    else
    {
      if (v18 > 2940697644)
      {
        if (v18 != 2940697645)
        {
          if (v18 != 2941181571)
          {
            if (v18 == 3819635030)
            {
              *(void *)self->_buttonCenter = 0xBEB333333F400000;
              *((_DWORD *)anon_d8 + 3) = 1056964608;
              *((_DWORD *)anon_d8 + 5) = -1063256064;
              return;
            }
            goto LABEL_43;
          }
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if (v18 == 2688879999)
      {
LABEL_36:
        *(void *)self->_buttonCenter = 0xBEA8F5C33F400000;
        uint64_t v19 = 0x3E82FA0D3E8CCCCDLL;
        goto LABEL_37;
      }
      if (v18 == 2795618603)
      {
        *(void *)self->_buttonCenter = 0xBE851EB83F400000;
        uint64_t v19 = 0x3E9DEE353EA147AELL;
        goto LABEL_37;
      }
    }
LABEL_43:
    *(void *)self->_buttonCenter = 0xBEB333333F400000;
    *((float *)anon_d8 + 3) = v16;
    *((float *)anon_d8 + 5) = v17;
    return;
  }
  double screenScale = self->_screenScale;
  float v12 = screenScale * 30.3786169 / self->_nativeScreenWidth;
  *((float *)anon_d8 + 3) = v12;
  *((float *)anon_d8 + 4) = v12;
  *((_DWORD *)anon_d8 + 5) = -1044381696;
  _D0 = screenScale / self->_customFlameScale;
  __asm { FCVT            H0, D0 }
  *((_WORD *)anon_d8 + 12) = LOWORD(_D0);
  self->_useRoundPipeline = 1;

  [(SUICEdgeLightMaskMetalLayer *)self _calculateCornerRadiusRatio:1];
}

- (void)_invalidate
{
  baseLayer = self->_baseLayer;
  self->_baseLayer = 0;

  [(CADisplayLink *)self->_displayLink setPaused:1];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  noiseTexture = self->_noiseTexture;
  self->_noiseTexture = 0;
}

- (void)_startOffAnimation
{
  [(SUICEdgeLightMaskMetalLayer *)self setOpacity:0.0];
  BOOL reduceMotion = self->_physics.common.reduceMotion;
  int32x2_t v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  int32x2_t v5 = v4;
  if (reduceMotion) {
    int8x8_t v6 = &unk_1EFB502E0;
  }
  else {
    int8x8_t v6 = &unk_1EFB50310;
  }
  if (reduceMotion) {
    double v7 = &unk_1EFB502F8;
  }
  else {
    double v7 = &unk_1EFB50328;
  }
  [v4 setValues:v6];
  [v5 setKeyTimes:v7];
  [v5 setDuration:0.35];
  id v8 = objc_initWeak(&location, self);
  [v5 setDelegate:self];

  [(SUICEdgeLightMaskMetalLayer *)self addAnimation:v5 forKey:0];
  if (!reduceMotion)
  {
    double v9 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale"];
    [v9 setDamping:-0.22];
    LODWORD(v10) = dword_1A64FBB80[!self->_isInFluidDismissal];
    [v9 setSpeed:v10];
    [v9 setFromValue:&unk_1EFB50220];
    [v9 setToValue:&unk_1EFB50378];
    [(SUICEdgeLightMaskMetalLayer *)self addAnimation:v9 forKey:@"scale"];
  }
  objc_destroyWeak(&location);
}

+ (BOOL)currentIdiomDefaultsToFullBorder
{
  return 1;
}

+ (void)prewarm
{
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_int64_t idiom = a3;
  [(SUICEdgeLightMaskMetalLayer *)self _updateForUIIdiom];
}

- (void)setScreen:(id)a3
{
  id v5 = a3;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    uint64_t v7 = [(CADisplayLink *)displayLink isPaused];
    [(CADisplayLink *)self->_displayLink setPaused:1];
    [(CADisplayLink *)self->_displayLink invalidate];
    id v8 = self->_displayLink;
    self->_displayLink = 0;

    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 1;
    if (v5)
    {
LABEL_3:
      [v5 scale];
      self->_double screenScale = v9;
      [v5 nativeBounds];
      self->_nativeScreenWidth = v10;
      objc_storeStrong((id *)&self->_screen, a3);
      [(SUICEdgeLightMaskMetalLayer *)self _updateForUIIdiom];
      uint64_t v11 = [v5 maximumFramesPerSecond];
      int v12 = 1;
      uint64_t v13 = 60;
      if (v11 <= 119)
      {
        if (v11 == 30)
        {
          uint64_t v13 = 30;
          uint64_t v14 = 30;
          goto LABEL_31;
        }
        uint64_t v14 = 60;
        if (v11 != 60)
        {
LABEL_14:
          uint64_t v28 = 240;
          if ((unint64_t)v11 >= 0x5A) {
            uint64_t v29 = 90;
          }
          else {
            uint64_t v29 = v11;
          }
          if ((unint64_t)v11 < 0x5A)
          {
            int v30 = 10;
          }
          else
          {
            uint64_t v28 = 90;
            int v30 = 1;
          }
          if (v11 >= 24) {
            uint64_t v13 = v29;
          }
          else {
            uint64_t v13 = 24;
          }
          if (v11 >= 24) {
            uint64_t v14 = v28;
          }
          else {
            uint64_t v14 = 240;
          }
          if (v11 >= 24) {
            int v12 = v30;
          }
          else {
            int v12 = 10;
          }
        }
      }
      else
      {
        if (v11 == 120 || v11 == 240)
        {
          uint64_t v14 = 60;
          goto LABEL_31;
        }
        uint64_t v14 = 60;
        if (v11 != 300) {
          goto LABEL_14;
        }
      }
LABEL_31:
      if (v14 != self->_physics.common.physicsRate) {
        SUICLightPhysics_Init((uint64_t)&self->_physics, v14, v12);
      }
      self->_physics.common.maxPhysicsIterationsPerFrame = v12;
      uint64_t v31 = [v5 displayLinkWithTarget:self->_wedgeLight selector:sel__drawFrame_];
      v32 = self->_displayLink;
      self->_displayLink = v31;

      [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:v13];
      id v33 = self->_displayLink;
      id v34 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [(CADisplayLink *)v33 addToRunLoop:v34 forMode:*MEMORY[0x1E4F1C4B0]];

      [(CADisplayLink *)self->_displayLink setPaused:v7];
      goto LABEL_34;
    }
  }
  unsigned __int8 v15 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SUICEdgeLightMaskMetalLayer setScreen:](v15, v16, v17, v18, v19, v20, v21, v22);
  }
  SUICLightPhysics_Init((uint64_t)&self->_physics, 60, 4);
  __int16 v23 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self->_wedgeLight selector:sel__drawFrame_];
  double v24 = self->_displayLink;
  self->_displayLink = v23;

  self->_double screenScale = 2.0;
  [(SUICEdgeLightMaskMetalLayer *)self _updateForUIIdiom];
  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
  __int16 v25 = self->_displayLink;
  double v26 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(CADisplayLink *)v25 addToRunLoop:v26 forMode:*MEMORY[0x1E4F1C4B0]];

  [(CADisplayLink *)self->_displayLink setPaused:v7];
  screen = self->_screen;
  self->_screen = 0;

LABEL_34:
}

- (void)setMinimumPowerLevel:(float)a3
{
  self->_minPowerLevel = a3;
}

- (void)animateOn
{
}

- (void)animateOnWithCompletion:(id)a3
{
  int32x2_t v4 = (void *)MEMORY[0x1AD0BCD30](a3, a2);
  id onCompletion = self->_onCompletion;
  self->_id onCompletion = v4;

  if (self->_burstModeHasBeenSet)
  {
    if (self->_physics.common.reduceMotion) {
      self->_shouldBurst = 0;
    }
    if (!self->_animating)
    {
      self->_animating = 1;
      self->_firstFrame = 1;
      if (self->_shouldBurst)
      {
        double v6 = 0.133328006;
        if (self->_burstAnimationType != 1) {
          double v6 = 0.0;
        }
      }
      else
      {
        double v6 = -10.0;
      }
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v6];
      burstStartDate = self->_burstStartDate;
      self->_burstStartDate = v7;
    }
    displayLink = self->_displayLink;
    [(CADisplayLink *)displayLink setPaused:0];
  }
}

- (void)animateOffWithCompletion:(id)a3
{
  int32x2_t v4 = (void *)MEMORY[0x1AD0BCD30](a3, a2);
  id offCompletion = self->_offCompletion;
  self->_id offCompletion = v4;

  [(SUICEdgeLightMaskMetalLayer *)self _startOffAnimation];
}

- (void)setPaused:(BOOL)a3
{
  BOOL paused = self->_paused;
  if (paused == a3)
  {
LABEL_4:
    if (paused) {
      return;
    }
    goto LABEL_5;
  }
  self->_BOOL paused = a3;
  if (a3)
  {
    [(SUICEdgeLightMaskMetalLayer *)self _startOffAnimation];
    BOOL paused = self->_paused;
    goto LABEL_4;
  }
LABEL_5:

  [(SUICEdgeLightMaskMetalLayer *)self animateOn];
}

- (void)setBurstOpacity:(float)_S0
{
  __asm { FCVT            H0, S0 }
  *(_WORD *)&self->_anon_d8[26] = _H0;
}

- (void)setFlameScale:(float)a3
{
  self->_customFlameScale = a3;
  [(SUICEdgeLightMaskMetalLayer *)self _updateForUIIdiom];
}

- (void)setFlamePosX:(float)_S0 posY:(float)_S1 radius:(float)_S2
{
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S1
  }
  *((short float *)&_S0 + 1) = -_H1;
  *(_DWORD *)&self->_anon_c0[8] = _S0;
  __asm { FCVT            H0, S2 }
  *(_WORD *)&self->_anon_c0[12] = _S0;
}

- (void)setInputAveragePowerLevel:(float)a3 withPeakPowerLevel:(float)a4
{
  +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
  self->_volumeLinearPowerLevel = v5;
}

- (void)updateVolumeInputdB:(float)a3
{
  +[SUICAudioPowerLevelLinearConverter linearValueForInputPowerLevel:](SUICAudioPowerLevelLinearConverter, "linearValueForInputPowerLevel:");
  self->_volumeLinearPowerLevel = v4;
}

- (void)dismissalBlur:(float)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  self->_isInFluidDismissal = a3 < 1.0;
  float v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  dismissalBlurFilter = self->_dismissalBlurFilter;
  self->_dismissalBlurFilter = v5;

  [(CAFilter *)self->_dismissalBlurFilter setName:@"blurFilter"];
  uint64_t v7 = self->_dismissalBlurFilter;
  id v8 = [NSNumber numberWithDouble:(1.0 - a3) * 80.0];
  [(CAFilter *)v7 setValue:v8 forKeyPath:*MEMORY[0x1E4F3A1D8]];

  v10[0] = self->_dismissalBlurFilter;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(SUICEdgeLightMaskMetalLayer *)self setFilters:v9];

  self->_float fluidDismissalProgress = a3;
}

- (void)stopVolumeInput
{
  self->_volumeLinearPowerLevel = 0.0;
}

- (void)startReducedFramerateForPerformance
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  float v4 = "-[SUICEdgeLightMaskMetalLayer startReducedFramerateForPerformance]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A64CC000, a2, OS_LOG_TYPE_ERROR, "%s Unexpected physics rate: %lu", (uint8_t *)&v3, 0x16u);
}

- (void)endReducedFramerateForPerformance
{
  self->_physics.common.maxPhysicsIterationsPerFrame = self->_maxPhysicsIterationsBeforePerformanceOptimization;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalBlurFilter, 0);
  objc_storeStrong(&self->_onCompletion, 0);
  objc_storeStrong(&self->_offCompletion, 0);
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_roundRenderPipeline, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_noiseTexture, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_burstStartDate, 0);
  objc_storeStrong((id *)&self->_wedgeLight, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_commonInitWithScreen:(uint64_t)a3 commandQueue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_drawFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setScreen:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end