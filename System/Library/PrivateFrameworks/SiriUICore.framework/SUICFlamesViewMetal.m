@interface SUICFlamesViewMetal
+ (BOOL)_supportsAdaptiveFramerate;
+ (Class)layerClass;
+ (id)_indexCache;
+ (void)prewarmShadersForScreen:(id)a3 activeFrame:(CGRect)a4 fidelity:(int64_t)a5;
+ (void)prewarmShadersForScreen:(id)a3 initialFrame:(CGRect)a4 activeFrame:(CGRect)a5 fidelity:(int64_t)a6 prewarmInBackground:(BOOL)a7;
+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4;
+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5;
+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5 prewarmInBackground:(BOOL)a6;
+ (void)setIndexCacheSize:(unint64_t)a3;
- (BOOL)_deviceNeeds2xFlamesWithCurrentScale:(double)a3;
- (BOOL)_initMetalAndSetupDisplayLink:(BOOL)a3;
- (BOOL)_isOriginatingProcessInBackground;
- (BOOL)_loadPipelineLibraries;
- (BOOL)_resizeFromLayer:(id)a3;
- (BOOL)_setupVertexBuffer;
- (BOOL)accelerateTransitions;
- (BOOL)flamesPaused;
- (BOOL)freezesAura;
- (BOOL)inDictationMode;
- (BOOL)inSiriMode;
- (BOOL)isRenderingEnabled;
- (BOOL)reduceFrameRate;
- (BOOL)reduceThinkingFramerate;
- (BOOL)renderInBackground;
- (BOOL)showAura;
- (CGRect)activeFrame;
- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5;
- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5;
- (SUICFlamesViewProvidingDelegate)flamesDelegate;
- (UIColor)dictationColor;
- (UIImage)overlayImage;
- (double)_currentDisplayScale;
- (double)horizontalScaleFactor;
- (float)_currentMicPowerLevel;
- (float32x2_t)_predeterminedVertexPositionForAuraWithPolarVertex:(uint64_t)a1;
- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5;
- (id)_lazy_commandQueue;
- (int)_generateIndicesForNumCircleShapes:(int)a3 withMaxSubdivisionLevel:(float)a4 startingWithNumSubdivisionLevel:(float)a5 forIndices:(unsigned int *)a6 atStartIndex:(int)a7 withFill:(BOOL)a8 withCullingForAura:(BOOL)a9 forVertices:(id *)a10;
- (int64_t)_preferredFramesPerSecond;
- (int64_t)mode;
- (int64_t)state;
- (unsigned)_numVerticesPerCircle;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_didSkipFrameUpdateWithReason:(id)a3 andCount:(unint64_t)a4;
- (void)_loadPipelineLibraries;
- (void)_prewarmShaders;
- (void)_reduceMotionStatusChanged:(id)a3;
- (void)_setPreferredFramesPerSecond;
- (void)_setValuesForFidelity:(int64_t)a3;
- (void)_setupDisplayLink;
- (void)_tearDownDisplayLink;
- (void)_updateCurveLayer:(id)a3;
- (void)_updateDisplayLinkPausedState;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)fadeOutCurrentAura;
- (void)layoutSubviews;
- (void)resetAndReinitialize:(BOOL)a3;
- (void)setAccelerateTransitions:(BOOL)a3;
- (void)setActiveFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDictationColor:(id)a3;
- (void)setFlamesDelegate:(id)a3;
- (void)setFlamesPaused:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFreezesAura:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHorizontalScaleFactor:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setOverlayImage:(id)a3;
- (void)setReduceFrameRate:(BOOL)a3;
- (void)setReduceThinkingFramerate:(BOOL)a3;
- (void)setRenderInBackground:(BOOL)a3;
- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4;
- (void)setShowAura:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUICFlamesViewMetal

- (void)_setValuesForFidelity:(int64_t)a3
{
  if (self->_mode == 1)
  {
    self->_unsigned int maxVertexCircles = 1;
    [(SUICFlamesViewMetal *)self _currentDisplayScale];
    float v5 = v4 * 6.0;
    double v6 = v4 * self->_activeFrame.size.width * self->_horizontalScaleFactor;
    *(float *)&double v4 = v6;
    self->_maxSubdivisionLevel = logf(roundf((float)(fmaxf(v5, *(float *)&v4) / v5) / 3.0) * 4.0) / 0.69315;
    float v7 = v6 / ((float)[(SUICFlamesViewMetal *)self _numVerticesPerCircle] * 0.25);
    self->_dictationUnitSize = v7;
    unsigned int maxVertexCircles = self->_maxVertexCircles;
    float v9 = 0.0;
    float v10 = 0.0;
  }
  else
  {
    if (a3 == 2)
    {
      unsigned int maxVertexCircles = 18;
      self->_unsigned int maxVertexCircles = 18;
      self->_maxSubdivisionLevel = 8.0;
      float v10 = 4.0;
    }
    else
    {
      if (a3 == 1)
      {
        unsigned int maxVertexCircles = 12;
        self->_unsigned int maxVertexCircles = 12;
        float v11 = 7.0;
      }
      else
      {
        if (a3) {
          return;
        }
        unsigned int maxVertexCircles = 6;
        self->_unsigned int maxVertexCircles = 6;
        float v11 = 6.0;
      }
      self->_maxSubdivisionLevel = v11;
      float v10 = 3.0;
    }
    float v9 = 1.0;
  }
  self->_auraVertexCircles = maxVertexCircles;
  self->_auraMinSubdivisionLevel = v9;
  self->_auraMaxSubdivisionLevel = v10;
}

- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)SUICFlamesViewMetal;
  v13 = -[MTKView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v13->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__reduceMotionStatusChanged_ name:*MEMORY[0x1E4FB2498] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v13 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v13 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

    v18 = [SUICAudioLevelSmoother alloc];
    LODWORD(v19) = -1032847360;
    LODWORD(v20) = 1051931443;
    LODWORD(v21) = 1063675494;
    LODWORD(v22) = -10.0;
    uint64_t v23 = [(SUICAudioLevelSmoother *)v18 initWithMinimumPower:5 maximumPower:v19 historyLength:v22 attackSpeed:v20 decaySpeed:v21];
    levelSmoother = v13->_levelSmoother;
    v13->_levelSmoother = (SUICAudioLevelSmoother *)v23;

    objc_storeStrong((id *)&v13->_screen, a4);
    v13->_showAura = 1;
    [(SUICFlamesViewMetal *)v13 setMode:0];
    v13->_fidelitdouble y = a5;
    [(SUICFlamesViewMetal *)v13 _setValuesForFidelity:a5];
    [(SUICFlamesViewMetal *)v13 bounds];
    v13->_activeFrame.origin.double x = v25;
    v13->_activeFrame.origin.double y = v26;
    v13->_activeFrame.size.double width = v27;
    v13->_activeFrame.size.double height = v28;
    v13->_currentContextCount = 0;
    v13->_horizontalScaleFactor = 1.0;
    v13->_frameRateScalingFactor = 1.0;
    v13->_state = 0;
    v13->_dictationRedColor = 1.0;
    v13->_dictationGreenColor = 1.0;
    v13->_dictationBlueColor = 1.0;
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    flameGroups = v13->_flameGroups;
    v13->_flameGroups = v29;

    v31 = objc_alloc_init(SUICFlameGroup);
    currentFlameGroup = v13->_currentFlameGroup;
    v13->_currentFlameGroup = v31;

    [(NSMutableArray *)v13->_flameGroups addObject:v13->_currentFlameGroup];
    uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
    renderingDisabledReasons = v13->_renderingDisabledReasons;
    v13->_renderingDisabledReasons = (NSMutableSet *)v33;

    -[MTKView setClearColor:](v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    v35 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[SUICFlamesViewMetal initWithFrame:screen:fidelity:]";
      __int16 v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_1A64CC000, v35, OS_LOG_TYPE_DEFAULT, "%s Created flames view: %@", buf, 0x16u);
    }
  }

  return v13;
}

- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v11 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  id v12 = -[SUICFlamesViewMetal initWithFrame:screen:fidelity:](self, "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);

  return v12;
}

- (void)dealloc
{
  [(SUICFlamesViewMetal *)self _tearDownDisplayLink];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesViewMetal;
  [(MTKView *)&v4 dealloc];
}

- (void)didMoveToSuperview
{
  v3 = [(SUICFlamesViewMetal *)self superview];

  if (v3)
  {
    [(SUICFlamesViewMetal *)self _setupDisplayLink];
    objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(SUICFlamesViewMetal *)self setBackgroundColor:v4];

    [(SUICFlamesViewMetal *)self setUserInteractionEnabled:0];
  }
  else
  {
    [(SUICFlamesViewMetal *)self _tearDownDisplayLink];
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFlamesDelegate:(id)a3
{
  id v4 = a3;
  id obj = v4;
  if (!v4 && self->_displayLink)
  {
    [(SUICFlamesViewMetal *)self _tearDownDisplayLink];
    id v4 = 0;
  }
  objc_storeWeak((id *)&self->_flamesDelegate, v4);
}

- (void)setState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_transitionFinished = 0;
    self->_state = a3;
    LODWORD(v3) = 0.25;
    if (!self->_accelerateTransitions) {
      *(float *)&double v3 = 0.0;
    }
    [(SUICFlameGroup *)self->_currentFlameGroup setTransitionPhase:v3];
    [(SUICFlameGroup *)self->_currentFlameGroup setStateTime:0.0];
    if (a3 == 3)
    {
      if (self->_showAura)
      {
        [(SUICFlameGroup *)self->_currentFlameGroup setIsAura:1];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        double v6 = self->_flameGroups;
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v15;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              float v11 = *(SUICFlameGroup **)(*((void *)&v14 + 1) + 8 * i);
              if (v11 != self->_currentFlameGroup) {
                -[SUICFlameGroup setIsDyingOff:](v11, "setIsDyingOff:", 1, (void)v14);
              }
            }
            uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v8);
        }

        self->_state = 0;
        id v12 = objc_alloc_init(SUICFlameGroup);
        currentFlameGroup = self->_currentFlameGroup;
        self->_currentFlameGroup = v12;

        [(NSMutableArray *)self->_flameGroups addObject:self->_currentFlameGroup];
      }
      else
      {
        self->_state = 0;
      }
    }
    [(SUICFlamesViewMetal *)self _setPreferredFramesPerSecond];
    [(SUICFlamesViewMetal *)self _updateDisplayLinkPausedState];
  }
}

- (void)fadeOutCurrentAura
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_flameGroups;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isAura", (void)v8)) {
          [v7 setIsDyingOff:1];
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (BOOL)_supportsAdaptiveFramerate
{
  if (_supportsAdaptiveFramerate_onceToken_0 != -1) {
    dispatch_once(&_supportsAdaptiveFramerate_onceToken_0, &__block_literal_global_6);
  }
  return _supportsAdaptiveFramerate_supportsAdaptiveFramerate_0;
}

uint64_t __49__SUICFlamesViewMetal__supportsAdaptiveFramerate__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _supportsAdaptiveFramerate_supportsAdaptiveFramerate_0 = result;
  return result;
}

- (void)_setPreferredFramesPerSecond
{
  if (self->_flamesPaused)
  {
    uint64_t v3 = 10;
  }
  else
  {
    if ([(id)objc_opt_class() _supportsAdaptiveFramerate]
      && (unint64_t state = self->_state, state <= 4))
    {
      uint64_t v3 = qword_1A657A9A0[state];
    }
    else
    {
      uint64_t v3 = 0;
    }
    int64_t mode = self->_mode;
    if (!mode && self->_state == 2 && self->_reduceThinkingFramerate)
    {
      uint64_t v7 = [(UIScreen *)self->_screen maximumFramesPerSecond];
      double v8 = (double)(v7 / 20);
      if (v7 < 20) {
        double v8 = 1.0;
      }
      self->_frameRateScalingFactor = v8;
      uint64_t v3 = 20;
    }
    else if (self->_reduceFrameRate)
    {
      if ((mode | 2) == 2)
      {
        if (self->_state != 2) {
          uint64_t v3 = 30;
        }
      }
      else
      {
        uint64_t v3 = 30;
      }
    }
  }
  displayLink = self->_displayLink;

  [(CADisplayLink *)displayLink setPreferredFramesPerSecond:v3];
}

- (int64_t)_preferredFramesPerSecond
{
  return [(CADisplayLink *)self->_displayLink preferredFramesPerSecond];
}

- (void)_updateDisplayLinkPausedState
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 1) > 1)
  {
    if (self->_showAura)
    {
      if (state) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = !self->_freezesAura;
      }
      if (v5) {
        goto LABEL_14;
      }
    }
    else if (state)
    {
      goto LABEL_14;
    }
    if (self->_transitionFinished)
    {
      displayLink = self->_displayLink;
      BOOL flamesPaused = 1;
      goto LABEL_3;
    }
LABEL_14:
    BOOL flamesPaused = self->_flamesPaused;
    displayLink = self->_displayLink;
    goto LABEL_3;
  }
  displayLink = self->_displayLink;
  BOOL flamesPaused = 0;
LABEL_3:
  [(CADisplayLink *)displayLink setPaused:flamesPaused];
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_shadersAreCompiled = 0;
    self->_int64_t mode = a3;
    if (a3 == 1) {
      [(SUICFlamesViewMetal *)self _setValuesForFidelity:0];
    }
    if (self->_isInitialized)
    {
      [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:1];
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewMetal;
  -[SUICFlamesViewMetal setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    [(SUICFlamesViewMetal *)self _tearDownDisplayLink];
  }
  else if (self->_isInitialized)
  {
    [(SUICFlamesViewMetal *)self _setupDisplayLink];
  }
}

- (void)setDictationColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_dictationColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_dictationColor, a3);
    [(UIColor *)self->_dictationColor getRed:&self->_dictationRedColor green:&self->_dictationGreenColor blue:&self->_dictationBlueColor alpha:0];
    objc_super v5 = v6;
  }
}

- (void)setFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUICFlamesViewMetal;
  -[MTKView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    [(SUICFlamesViewMetal *)self bounds];
    self->_activeFrame.origin.double x = v4;
    self->_activeFrame.origin.double y = v5;
    self->_activeFrame.size.double width = v6;
    self->_activeFrame.size.double height = v7;
  }
  if (self->_mode == 1)
  {
    [(SUICFlamesViewMetal *)self _setValuesForFidelity:0];
    if (self->_isInitialized) {
      [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:1];
    }
  }
  overlayImageView = self->_overlayImageView;
  [(SUICFlamesViewMetal *)self frame];
  -[UIImageView setFrame:](overlayImageView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUICFlamesViewMetal;
  -[SUICFlamesViewMetal setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    [(SUICFlamesViewMetal *)self bounds];
    self->_activeFrame.origin.double x = v4;
    self->_activeFrame.origin.double y = v5;
    self->_activeFrame.size.double width = v6;
    self->_activeFrame.size.double height = v7;
  }
}

- (void)setActiveFrame:(CGRect)a3
{
  self->_hasCustomActiveFrame = 1;
  self->_activeFrame = a3;
  if (self->_mode == 1)
  {
    [(SUICFlamesViewMetal *)self _setValuesForFidelity:0];
    if (self->_isInitialized)
    {
      [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:1];
    }
  }
}

- (void)setOverlayImage:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_overlayImage, a3);
  if (self->_overlayImage)
  {
    CGFloat v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = v5;

    CGFloat v7 = self->_overlayImageView;
    [(SUICFlamesViewMetal *)self frame];
    -[UIImageView setFrame:](v7, "setFrame:");
    [(SUICFlamesViewMetal *)self addSubview:self->_overlayImageView];
  }
  else
  {
    [(UIImageView *)self->_overlayImageView removeFromSuperview];
    objc_super v8 = self->_overlayImageView;
    self->_overlayImageView = 0;
  }
}

- (void)setRenderInBackground:(BOOL)a3
{
  self->_renderInBackground = a3;
}

- (BOOL)flamesPaused
{
  return self->_flamesPaused;
}

- (void)setFlamesPaused:(BOOL)a3
{
  self->_BOOL flamesPaused = a3;
  [(SUICFlamesViewMetal *)self _setPreferredFramesPerSecond];

  [(SUICFlamesViewMetal *)self _updateDisplayLinkPausedState];
}

- (void)setHorizontalScaleFactor:(double)a3
{
  self->_horizontalScaleFactor = a3;
  if (a3 != 0.0)
  {
    CGFloat v4 = [(SUICFlamesViewMetal *)self layer];
    CGAffineTransformMakeScale(&v5, 1.0 / self->_horizontalScaleFactor, 1.0);
    [v4 setAffineTransform:&v5];

    [(SUICFlamesViewMetal *)self _setValuesForFidelity:self->_fidelity];
  }
}

- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  renderingDisabledReasons = self->_renderingDisabledReasons;
  id v8 = v6;
  if (v4) {
    [(NSMutableSet *)renderingDisabledReasons removeObject:v6];
  }
  else {
    [(NSMutableSet *)renderingDisabledReasons addObject:v6];
  }
  if ([(SUICFlamesViewMetal *)self isRenderingEnabled]) {
    [(SUICFlamesViewMetal *)self setNeedsLayout];
  }
}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4
{
}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5
{
}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5 prewarmInBackground:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  [v13 bounds];
  objc_msgSend(a1, "prewarmShadersForScreen:initialFrame:activeFrame:fidelity:prewarmInBackground:", v13, a5, v6, v11, v12, width, height, v11, v12, width, height);
}

+ (void)prewarmShadersForScreen:(id)a3 activeFrame:(CGRect)a4 fidelity:(int64_t)a5
{
  id v7 = a3;
  [v7 bounds];
  objc_msgSend(a1, "prewarmShadersForScreen:initialFrame:activeFrame:fidelity:prewarmInBackground:", v7, a5, 0);
}

+ (void)prewarmShadersForScreen:(id)a3 initialFrame:(CGRect)a4 activeFrame:(CGRect)a5 fidelity:(int64_t)a6 prewarmInBackground:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v13 = a4.size.height;
  double v14 = a4.size.width;
  double v15 = a4.origin.y;
  double v16 = a4.origin.x;
  id v17 = a3;
  v18 = -[SUICFlamesViewMetal initWithFrame:screen:fidelity:]([SUICFlamesViewMetal alloc], "initWithFrame:screen:fidelity:", v17, a6, v16, v15, v14, v13);

  [(SUICFlamesViewMetal *)v18 setRenderInBackground:v7];
  -[SUICFlamesViewMetal setActiveFrame:](v18, "setActiveFrame:", x, y, width, height);
  [(SUICFlamesViewMetal *)v18 _prewarmShaders];
}

- (void)_prewarmShaders
{
  self->_isInitialized = [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:0];
  displayLink = self->_displayLink;

  [(SUICFlamesViewMetal *)self _updateCurveLayer:displayLink];
}

- (void)resetAndReinitialize:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:1];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CGAffineTransform v5 = self->_flameGroups;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(SUICFlameGroup **)(*((void *)&v10 + 1) + 8 * v9) != self->_currentFlameGroup) {
          [v4 addObject:(void)v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_flameGroups removeObjectsInArray:v4];
  [(SUICFlamesViewMetal *)self _updateCurveLayer:self->_displayLink];
}

- (void)_reduceMotionStatusChanged:(id)a3
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (!self->_mode)
  {
    self->_shadersAreCompiled = 0;
    [(SUICFlamesViewMetal *)self resetAndReinitialize:1];
  }
}

- (void)_applicationWillResignActive:(id)a3
{
}

- (void)_applicationWillEnterForeground:(id)a3
{
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (void)_setupDisplayLink
{
  if (!self->_displayLink)
  {
    uint64_t v3 = [(SUICFlamesViewMetal *)self superview];
    if (v3)
    {
      id v4 = (void *)v3;
      char v5 = [(SUICFlamesViewMetal *)self isHidden];

      if ((v5 & 1) == 0)
      {
        uint64_t v6 = [(UIScreen *)self->_screen displayLinkWithTarget:self selector:sel__updateCurveLayer_];
        displayLink = self->_displayLink;
        self->_displayLink = v6;

        uint64_t v8 = self->_displayLink;
        uint64_t v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

        [(SUICFlamesViewMetal *)self _setPreferredFramesPerSecond];
        [(SUICFlamesViewMetal *)self _updateDisplayLinkPausedState];
      }
    }
  }
}

- (unsigned)_numVerticesPerCircle
{
  return llroundf(exp2f(self->_maxSubdivisionLevel) * 3.0);
}

- (float32x2_t)_predeterminedVertexPositionForAuraWithPolarVertex:(uint64_t)a1
{
  v2.f64[0] = *(double *)(a1 + 1352) * *(double *)(a1 + 1312);
  v2.f64[1] = *(float64_t *)(a1 + 1360);
  __asm { FMOV            V3.2S, #-1.0 }
  float32x2_t v8 = vmla_f32(_D3, (float32x2_t)0x4000000040000000, vdiv_f32(vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 1336)), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v2)), *(float32x2_t *)(a1 + 1120)));
  float32x2_t v9 = vneg_f32(v8);
  float32x2_t v10 = vsub_f32(_D3, v8);
  float v13 = sqrtf(vaddv_f32(vmul_f32(v10, v10))) * *(float *)&a2;
  __float2 v11 = __sincosf_stret(*((float *)&a2 + 1));
  return vmla_n_f32(v9, (float32x2_t)__PAIR64__(LODWORD(v11.__sinval), LODWORD(v11.__cosval)), v13);
}

- (int)_generateIndicesForNumCircleShapes:(int)a3 withMaxSubdivisionLevel:(float)a4 startingWithNumSubdivisionLevel:(float)a5 forIndices:(unsigned int *)a6 atStartIndex:(int)a7 withFill:(BOOL)a8 withCullingForAura:(BOOL)a9 forVertices:(id *)a10
{
  BOOL v94 = a9;
  BOOL v10 = a8;
  unsigned int v15 = [(SUICFlamesViewMetal *)self _numVerticesPerCircle];
  v78 = a6;
  double v16 = (char *)*a6;
  int v91 = a3;
  if (v10)
  {
    unsigned int v17 = vcvtas_u32_f32(exp2f(a5) * 3.0);
    unsigned int v18 = a3 == 1 ? (self->_maxVertexCircles - 1) * v15 : 0;
    int v19 = (v17 >> 1) - 1;
    if (v17 >> 1 != 1)
    {
      int v20 = (int)(float)((float)v15 / (float)v17);
      uint64_t v21 = 4 * a7;
      int v93 = v20 * (v17 - 1);
      int v22 = v20 * (v17 - 2);
      unsigned int v23 = v18;
      do
      {
        double v16 = (char *)malloc_type_realloc(v16, v21 + 24, 0x100004052888210uLL);
        v24 = (unsigned int *)&v16[v21];
        unsigned int v25 = v22 + v23;
        unsigned int *v24 = v18;
        v24[1] = v20 + v18;
        v24[2] = v22 + v23;
        v24[3] = v18;
        unsigned int v26 = v93 + v23;
        v23 -= v20;
        v24[4] = v25;
        v24[5] = v26;
        a7 += 6;
        v18 += v20;
        v21 += 24;
        --v19;
      }
      while (v19);
    }
  }
  int v27 = v91 - 2;
  if (v91 >= 2)
  {
    float v80 = a5;
    int v28 = 0;
    float v82 = (float)v91;
    float v88 = (float)v15;
    float32x2_t v29 = (float32x2_t)vdup_n_s32(0x3F8CCCCDu);
    __asm { FMOV            V14.2S, #1.0 }
    int v79 = v91 - 2;
    while (1)
    {
      unsigned int maxVertexCircles = self->_maxVertexCircles;
      float v36 = (float)maxVertexCircles;
      int v37 = v28 == v27 ? maxVertexCircles - 1 : (int)(float)((float)((float)(v28 + 1) / v82) * v36);
      float v38 = (float)v28 + v80;
      float v39 = v38 >= a4 ? a4 : (float)v28 + v80;
      float v40 = exp2f(v39) * 3.0;
      int v41 = llroundf(v40);
      float v42 = v38 + 1.0;
      if ((float)(v38 + 1.0) >= a4) {
        float v42 = a4;
      }
      float v43 = exp2f(v42);
      int v83 = v28;
      if (v41 >= 1) {
        break;
      }
LABEL_35:
      int v28 = v83 + 1;
      int v27 = v79;
      if (v83 == v79) {
        goto LABEL_36;
      }
    }
    int v44 = 0;
    int v45 = (int)(float)((float)((float)v28 / v82) * v36);
    float v46 = (float)(int)roundf(v40);
    float v47 = v46 / (float)(int)roundf(v43 * 3.0);
    int v89 = v37 * v15;
    int v90 = v15 * v45;
    float v92 = v47;
    int v85 = v41;
    while (1)
    {
      float v48 = (float)v44;
      unsigned int v49 = (int)(float)((float)((float)v44 / v46) * v88) % v15;
      unsigned int v50 = v49 + v90;
      ++v44;
      unsigned int v51 = v49 + v89;
      float v52 = (float)((float)(v47 + v48) / v46) * v88;
      unsigned int v53 = (int)v52 % v15 + v89;
      unsigned int v54 = (int)(float)((float)((float)((float)(v46 + v48) - v47) / v46) * v88) % v15 + v89;
      if (v94)
      {
        unsigned int v87 = v49 + v90;
        long long v55 = *((_OWORD *)a10 + 2 * (int)v50);
        unsigned int v56 = (int)v52 % v15 + v89;
        [(SUICFlamesViewMetal *)self _predeterminedVertexPositionForAuraWithPolarVertex:*(double *)&v55];
        uint64_t v58 = v57 & 0x7FFFFFFF7FFFFFFFLL;
        unsigned int v53 = v56;
        [(SUICFlamesViewMetal *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 4 * (int)((int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90))];
        uint64_t v60 = v59 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewMetal *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 4 * (int)v51)];
        uint64_t v62 = v61 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewMetal *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 4 * (int)v56)];
        uint64_t v64 = v63 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewMetal *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 4 * (int)v54)];
        if (v92 == 1.0)
        {
          int v41 = v85;
          unsigned int v50 = v87;
LABEL_28:
          int32x2_t v69 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
          int32x2_t v70 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v62));
          if ((float)(vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v69, v70), (float32x2_t)vzip2_s32(v69, v70))))
                     + sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v64))))) >= 3.0)
            goto LABEL_30;
          goto LABEL_29;
        }
        int32x2_t v66 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
        int32x2_t v67 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, vabs_f32(v65)));
        int v41 = v85;
        unsigned int v50 = v87;
        if ((float)(sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v62))))
                   + vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v66, v67), (float32x2_t)vzip2_s32(v66, v67))))) >= 3.0)
          goto LABEL_28;
      }
      else
      {
        uint64_t v58 = 0;
        uint64_t v60 = 0;
        uint64_t v62 = 0;
        uint64_t v64 = 0;
        if (v47 == 1.0) {
          goto LABEL_29;
        }
      }
      double v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
      v68 = (unsigned int *)&v16[4 * a7];
      unsigned int *v68 = v50;
      v68[1] = v54;
      v68[2] = v51;
      a7 += 3;
      if (v94) {
        goto LABEL_28;
      }
LABEL_29:
      int v71 = a7;
      a7 += 3;
      double v16 = (char *)malloc_type_realloc(v16, 4 * a7, 0x100004052888210uLL);
      v72 = (unsigned int *)&v16[4 * v71];
      unsigned int *v72 = v50;
      v72[1] = v51;
      v72[2] = v53;
      if (!v94)
      {
        uint64_t v75 = a7;
        goto LABEL_33;
      }
LABEL_30:
      int32x2_t v73 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
      int32x2_t v74 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v64));
      if ((float)(sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v60))))
                 + vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v74, v73), (float32x2_t)vzip2_s32(v74, v73))))) < 3.0)
      {
        uint64_t v75 = a7;
LABEL_33:
        double v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
        *(_DWORD *)&v16[4 * v75] = v50;
        v76 = &v16[4 * a7];
        *((_DWORD *)v76 + 1) = v53;
        *((_DWORD *)v76 + 2) = (int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90;
        a7 += 3;
      }
      float v47 = v92;
      if (v41 == v44) {
        goto LABEL_35;
      }
    }
  }
LABEL_36:
  *v78 = (unsigned int *)v16;
  return a7;
}

- (BOOL)_setupVertexBuffer
{
  int v3 = [(SUICFlamesViewMetal *)self _numVerticesPerCircle];
  unint64_t v4 = self->_maxVertexCircles * v3;
  self->_numVertices = v4;
  id v5 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32 * v4];
  uint64_t v6 = [v5 mutableBytes];
  uint64_t v10 = v6;
  unsigned int maxVertexCircles = self->_maxVertexCircles;
  if (maxVertexCircles)
  {
    int v12 = 0;
    int v13 = 0;
    float v14 = (float)v3;
    float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
    do
    {
      ++v12;
      if (v3 >= 1)
      {
        int v15 = 0;
        double v16 = (_OWORD *)(v6 + 32 * v13);
        do
        {
          if (self->_mode == 1)
          {
            int v17 = v15 & 1;
            int v18 = v15++ | 1;
            v19.f32[0] = (float)v18 / v14;
            float v20 = (double)v15 + (double)(v17 - 1);
            v19.i32[1] = fminf((float)(v20 / v14) - floorf(v20 / v14), 1.0);
            int32x2_t v21 = (int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v19), v8));
          }
          else
          {
            double v22 = (float)((float)v15 / v14) * 6.28318531;
            *(float *)&double v22 = v22;
            ++v15;
            int32x2_t v21 = vdup_lane_s32(*(int32x2_t *)&v22, 0);
          }
          *(float *)v9.i32 = (float)v12 / (float)maxVertexCircles;
          *(int32x2_t *)&long long v23 = vzip1_s32(v9, v21);
          v21.i32[0] = v9.i32[0];
          *((int32x2_t *)&v23 + 1) = v21;
          _OWORD *v16 = v23;
          v16 += 2;
          ++v13;
        }
        while (v15 != v3);
        unsigned int maxVertexCircles = self->_maxVertexCircles;
      }
    }
    while (v12 < maxVertexCircles);
  }
  uint64_t v44 = 0;
  *(float *)&double v7 = self->_auraMaxSubdivisionLevel;
  *(float *)v8.f64 = self->_auraMinSubdivisionLevel;
  uint64_t v24 = [(SUICFlamesViewMetal *)self _generateIndicesForNumCircleShapes:self->_auraVertexCircles withMaxSubdivisionLevel:&v44 startingWithNumSubdivisionLevel:0 forIndices:1 atStartIndex:0 withFill:v6 withCullingForAura:v7 forVertices:v8.f64[0]];
  self->_numAuraIndices = v24;
  *(float *)&double v25 = self->_auraMaxSubdivisionLevel;
  *(float *)&double v26 = self->_auraMinSubdivisionLevel;
  uint64_t v27 = [(SUICFlamesViewMetal *)self _generateIndicesForNumCircleShapes:self->_auraVertexCircles withMaxSubdivisionLevel:&v44 startingWithNumSubdivisionLevel:v24 forIndices:1 atStartIndex:1 withFill:v10 withCullingForAura:v25 forVertices:v26];
  self->_numAuraIndicesCulled = v27;
  *(float *)&double v28 = self->_maxSubdivisionLevel;
  LODWORD(v29) = LODWORD(v28);
  unsigned int v30 = [(SUICFlamesViewMetal *)self _generateIndicesForNumCircleShapes:1 withMaxSubdivisionLevel:&v44 startingWithNumSubdivisionLevel:v27 forIndices:1 atStartIndex:0 withFill:v10 withCullingForAura:v28 forVertices:v29];
  self->_numWaveIndices = v30;
  self->_numWaveIndices = v30 - self->_numAuraIndicesCulled;
  unsigned int v31 = self->_numAuraIndicesCulled - self->_numAuraIndices;
  self->_numAuraIndicesCulled = v31;
  uint64_t v32 = 4 * (self->_numAuraIndices + self->_numWaveIndices + v31);
  id v33 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v34 = (void *)[v33 initWithBytesNoCopy:v44 length:v32 freeWhenDone:1];
  v35 = [(MTKView *)self device];
  id v36 = v5;
  int v37 = (MTLBuffer *)objc_msgSend(v35, "newBufferWithBytes:length:options:", objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"), 0);
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v37;

  self->_numVertices = (unint64_t)[v36 length] >> 5;
  float v39 = [(MTKView *)self device];
  id v40 = v34;
  int v41 = (MTLBuffer *)objc_msgSend(v39, "newBufferWithBytes:length:options:", objc_msgSend(v40, "bytes"), objc_msgSend(v40, "length"), 0);
  indexBuffer = self->_indexBuffer;
  self->_indexBuffer = v41;

  self->_numIndices = (unint64_t)[v40 length] >> 1;
  return 1;
}

- (BOOL)_initMetalAndSetupDisplayLink:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    unsigned int v31 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
    _os_log_impl(&dword_1A64CC000, v6, OS_LOG_TYPE_DEFAULT, "%s Setup Metal Rendering", (uint8_t *)&v30, 0xCu);
  }
  kdebug_trace();
  double v7 = [(SUICFlamesViewMetal *)self layer];
  [v7 setOpaque:0];

  [(SUICFlamesViewMetal *)self _currentDisplayScale];
  double v9 = v8;
  uint64_t v10 = [(SUICFlamesViewMetal *)self layer];
  [v10 setContentsScale:v9];

  __float2 v11 = [(SUICFlamesViewMetal *)self layer];
  [v11 contentsScale];
  double v13 = v12;
  float v14 = [(SUICFlamesViewMetal *)self layer];
  [v14 bounds];
  float v16 = v13 * v15;
  self->_viewWidth = v16;

  int v17 = [(SUICFlamesViewMetal *)self layer];
  [v17 contentsScale];
  double v19 = v18;
  float v20 = [(SUICFlamesViewMetal *)self layer];
  [v20 bounds];
  float v22 = v19 * v21;
  self->_viewHeight = v22;

  -[MTKView setDrawableSize:](self, "setDrawableSize:", self->_viewWidth, self->_viewHeight);
  id v23 = MTLCreateSystemDefaultDevice();
  [(MTKView *)self setDevice:v23];

  uint64_t v24 = [(MTKView *)self device];

  if (!v24)
  {
    uint64_t v27 = *v5;
    BOOL v26 = os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR);
    if (!v26) {
      return v26;
    }
    -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](v27);
    goto LABEL_15;
  }
  [(SUICFlamesViewMetal *)self _setupVertexBuffer];
  if (![(SUICFlamesViewMetal *)self _loadPipelineLibraries])
  {
    double v28 = *v5;
    BOOL v26 = os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR);
    if (!v26) {
      return v26;
    }
    -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](v28);
LABEL_15:
    LOBYTE(v26) = 0;
    return v26;
  }
  if (v3) {
    [(SUICFlamesViewMetal *)self _setupDisplayLink];
  }
  double v25 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    unsigned int v31 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
    _os_log_impl(&dword_1A64CC000, v25, OS_LOG_TYPE_DEFAULT, "%s Metal Rendering Setup Complete", (uint8_t *)&v30, 0xCu);
  }
  kdebug_trace();
  LOBYTE(v26) = 1;
  return v26;
}

- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5
{
  id v11 = 0;
  uint64_t v6 = (void *)[a3 newRenderPipelineStateWithName:a4 options:0 reflection:0 error:&v11];
  id v7 = v11;
  double v8 = v7;
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

- (BOOL)_loadPipelineLibraries
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  unint64_t v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
    _os_log_impl(&dword_1A64CC000, v4, OS_LOG_TYPE_DEFAULT, "%s Started Loading Pipeline Libraries", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 bundlePath];
  id v7 = [v6 stringByAppendingPathComponent:@"SUICPipelineState.pipelinelib"];

  if (!v7)
  {
    BOOL v9 = 0;
    id v10 = 0;
    goto LABEL_8;
  }
  double v8 = [(MTKView *)self device];
  id v77 = 0;
  BOOL v9 = (void *)[v8 newPipelineLibraryWithFilePath:v7 error:&v77];
  id v10 = v77;

  if (!v9) {
    goto LABEL_8;
  }
  id v76 = v10;
  id v11 = [(SUICFlamesViewMetal *)self _from:v9 getRenderPipeline:@"Flame Pipeline" err:&v76];
  id v12 = v76;

  double v13 = self->_pipelineState[0];
  self->_pipelineState[0] = v11;

  id v75 = v12;
  float v14 = [(SUICFlamesViewMetal *)self _from:v9 getRenderPipeline:@"Dictation Pipeline" err:&v75];
  id v15 = v75;

  float v16 = self->_pipelineState[1];
  self->_pipelineState[1] = v14;

  id v74 = v15;
  int v17 = [(SUICFlamesViewMetal *)self _from:v9 getRenderPipeline:@"Training Pipeline" err:&v74];
  id v18 = v74;

  double v19 = self->_pipelineState[2];
  self->_pipelineState[2] = v17;

  id v73 = v18;
  float v20 = [(SUICFlamesViewMetal *)self _from:v9 getRenderPipeline:@"Aura Pipeline" err:&v73];
  id v10 = v73;

  double v21 = self->_pipelineState[3];
  self->_pipelineState[3] = v20;

  if (v10)
  {
LABEL_8:
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      -[SUICFlamesViewMetal _loadPipelineLibraries].cold.5();
    }
    int32x2_t v67 = v7;
    float v22 = [(MTKView *)self device];
    id v72 = v10;
    id v23 = (void *)[v22 newDefaultLibraryWithBundle:v5 error:&v72];
    id v24 = v72;

    if (!v23)
    {
      double v25 = [(MTKView *)self device];
      id v23 = (void *)[v25 newDefaultLibrary];
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    unint64_t v27 = [(MTKView *)self colorPixelFormat];
    double v28 = [v26 colorAttachments];
    double v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setPixelFormat:v27];

    int v30 = [v26 colorAttachments];
    unsigned int v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setBlendingEnabled:1];

    uint64_t v32 = [v26 colorAttachments];
    id v33 = [v32 objectAtIndexedSubscript:0];
    [v33 setRgbBlendOperation:0];

    v34 = [v26 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setSourceRGBBlendFactor:4];

    id v36 = [v26 colorAttachments];
    int v37 = [v36 objectAtIndexedSubscript:0];
    [v37 setDestinationRGBBlendFactor:5];

    [v26 setLabel:@"Flame Pipeline"];
    if (self->_reduceMotionEnabled) {
      float v38 = @"siriFlameAccessibilityVertexShader";
    }
    else {
      float v38 = @"siriFlameVertexShader";
    }
    float v39 = (void *)[v23 newFunctionWithName:v38];
    [v26 setVertexFunction:v39];

    id v40 = (void *)[v23 newFunctionWithName:@"siriFlameFragmentShader"];
    [v26 setFragmentFunction:v40];

    int v41 = [(MTKView *)self device];
    id v71 = v24;
    float v42 = (MTLRenderPipelineState *)[v41 newRenderPipelineStateWithDescriptor:v26 error:&v71];
    id v43 = v71;

    pipelineState = self->_pipelineState;
    int v45 = self->_pipelineState[0];
    self->_pipelineState[0] = v42;

    if (self->_pipelineState[0])
    {
      [v26 setLabel:@"Aura Pipeline"];
      float v46 = (void *)[v23 newFunctionWithName:@"siriAuraFragmentShader"];
      [v26 setFragmentFunction:v46];

      float v47 = [(MTKView *)self device];
      id v70 = v43;
      float v48 = (MTLRenderPipelineState *)[v47 newRenderPipelineStateWithDescriptor:v26 error:&v70];
      id v49 = v70;

      unsigned int v50 = self->_pipelineState[3];
      self->_pipelineState[3] = v48;

      if (!self->_pipelineState[3])
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
          -[SUICFlamesViewMetal _loadPipelineLibraries]();
        }
        BOOL v64 = 0;
        id v43 = v49;
        goto LABEL_33;
      }
      [v26 setLabel:@"Dictation Pipeline"];
      unsigned int v51 = (void *)[v23 newFunctionWithName:@"siriDictationVertexShader"];
      [v26 setVertexFunction:v51];

      float v52 = (void *)[v23 newFunctionWithName:@"siriDictationFragmentShader"];
      [v26 setFragmentFunction:v52];

      unsigned int v53 = [(MTKView *)self device];
      id v69 = v49;
      unsigned int v54 = (MTLRenderPipelineState *)[v53 newRenderPipelineStateWithDescriptor:v26 error:&v69];
      id v43 = v69;

      long long v55 = self->_pipelineState[1];
      self->_pipelineState[1] = v54;

      if (self->_pipelineState[1])
      {
        [v26 setLabel:@"Training Pipeline"];
        unsigned int v56 = (void *)[v23 newFunctionWithName:@"siriTrainingVertexShader"];
        [v26 setVertexFunction:v56];

        uint64_t v57 = (void *)[v23 newFunctionWithName:@"siriTrainingFragmentShader"];
        [v26 setFragmentFunction:v57];

        uint64_t v58 = [(MTKView *)self device];
        id v68 = v43;
        uint64_t v59 = [v58 newRenderPipelineStateWithDescriptor:v26 error:&v68];
        id v60 = v68;

        uint64_t v61 = pipelineState[2];
        pipelineState[2] = (MTLRenderPipelineState *)v59;

        uint64_t v62 = *MEMORY[0x1E4F4E360];
        uint64_t v63 = *MEMORY[0x1E4F4E360];
        if (pipelineState[2])
        {
          id v7 = v67;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            int v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
            _os_log_impl(&dword_1A64CC000, v62, OS_LOG_TYPE_DEFAULT, "%s Finished Loading Pipeline Libraries", buf, 0xCu);
          }
          BOOL v64 = 1;
        }
        else
        {
          id v7 = v67;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            -[SUICFlamesViewMetal _loadPipelineLibraries].cold.4();
          }
          BOOL v64 = 0;
        }
        id v43 = v60;
        goto LABEL_38;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SUICFlamesViewMetal _loadPipelineLibraries]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR))
    {
      -[SUICFlamesViewMetal _loadPipelineLibraries]();
    }
    BOOL v64 = 0;
LABEL_33:
    id v7 = v67;
LABEL_38:

    goto LABEL_39;
  }
  float32x2_t v65 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
    _os_log_impl(&dword_1A64CC000, v65, OS_LOG_TYPE_DEFAULT, "%s Finished Loading Pipeline Libraries", buf, 0xCu);
  }
  BOOL v64 = 1;
LABEL_39:

  return v64;
}

- (BOOL)_resizeFromLayer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUICFlamesViewMetal *)self isRenderingEnabled];
  if (v5)
  {
    [v4 contentsScale];
    double v7 = v6;
    [v4 bounds];
    float v9 = v7 * v8;
    self->_viewWidth = v9;
    [v4 contentsScale];
    double v11 = v10;
    [v4 bounds];
    float v13 = v11 * v12;
    self->_viewHeight = v13;
    -[MTKView setDrawableSize:](self, "setDrawableSize:", self->_viewWidth, v13);
  }

  return v5;
}

- (void)layoutSubviews
{
  if (self->_isInitialized)
  {
    BOOL v3 = [(SUICFlamesViewMetal *)self _metalLayer];
    [(SUICFlamesViewMetal *)self _resizeFromLayer:v3];
  }
  else
  {
    self->_isInitialized = [(SUICFlamesViewMetal *)self _initMetalAndSetupDisplayLink:1];
  }

  [(SUICFlamesViewMetal *)self _updateOrthoProjection];
}

- (double)_currentDisplayScale
{
  BOOL v3 = [(SUICFlamesViewMetal *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 < 1.0)
  {
    [(UIScreen *)self->_screen scale];
    double v5 = v6;
  }
  BOOL v7 = [(SUICFlamesViewMetal *)self _deviceNeeds2xFlamesWithCurrentScale:v5];
  double result = 2.0;
  if (!v7) {
    return v5;
  }
  return result;
}

- (BOOL)_deviceNeeds2xFlamesWithCurrentScale:(double)a3
{
  if (_deviceNeeds2xFlamesWithCurrentScale__onceToken_0 != -1) {
    dispatch_once(&_deviceNeeds2xFlamesWithCurrentScale__onceToken_0, &__block_literal_global_104);
  }
  return a3 == 3.0 && _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames_0 != 0;
}

uint64_t __60__SUICFlamesViewMetal__deviceNeeds2xFlamesWithCurrentScale___block_invoke()
{
  uint64_t result = MGGetProductType();
  _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames_0 = result == 1737882206;
  return result;
}

- (void)_tearDownDisplayLink
{
  self->_int64_t state = 4;
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;
}

- (BOOL)inSiriMode
{
  return [(SUICFlamesViewMetal *)self mode] == 0;
}

- (BOOL)inDictationMode
{
  return [(SUICFlamesViewMetal *)self mode] == 1;
}

- (BOOL)isRenderingEnabled
{
  return [(NSMutableSet *)self->_renderingDisabledReasons count] == 0;
}

- (BOOL)_isOriginatingProcessInBackground
{
  return 0;
}

- (void)_didSkipFrameUpdateWithReason:(id)a3 andCount:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    double v8 = "-[SUICFlamesViewMetal _didSkipFrameUpdateWithReason:andCount:]";
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl(&dword_1A64CC000, v6, OS_LOG_TYPE_DEFAULT, "%s Frame Skip Reason: %@; count = %lu",
      (uint8_t *)&v7,
      0x20u);
  }
  kdebug_trace();
}

- (id)_lazy_commandQueue
{
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    double v4 = [(MTKView *)self device];
    id v5 = (MTLCommandQueue *)[v4 newCommandQueue];
    double v6 = self->_commandQueue;
    self->_commandQueue = v5;

    commandQueue = self->_commandQueue;
  }

  return commandQueue;
}

- (void)_updateCurveLayer:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_currentFlameGroup)
  {
    uint64_t v13 = @"No current flame group";
LABEL_11:
    [(SUICFlamesViewMetal *)self _didSkipFrameUpdateWithReason:v13 andCount:0];
    goto LABEL_12;
  }
  if (!self->_isInitialized)
  {
    uint64_t v13 = @"not initialized";
    goto LABEL_11;
  }
  if (![(SUICFlamesViewMetal *)self isRenderingEnabled])
  {
    uint64_t v13 = @"rendering disabled";
    goto LABEL_11;
  }
  id v5 = [(SUICFlamesViewMetal *)self _metalLayer];
  if ([v5 isDrawableAvailable])
  {
    double v6 = [(SUICFlameGroup *)self->_currentFlameGroup transitionPhasePtr];
    int v7 = [(SUICFlameGroup *)self->_currentFlameGroup stateModifiersPtr];
    float v8 = *v6;
    BOOL v9 = *v6 >= 1.0;
    if (*v6 < 1.0)
    {
      double v10 = v8;
      switch(self->_state)
      {
        case 0:
          double v12 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&double v12 = v12;
          *(float *)&double v12 = fminf(*(float *)&v12, 1.0);
          *double v6 = *(float *)&v12;
          *int v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA20, *v7), *(float *)&v12);
          levelSmoother = self->_levelSmoother;
          LODWORD(v12) = 1064514355;
          goto LABEL_16;
        case 1:
          double v12 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&double v12 = v12;
          *(float *)&double v12 = fminf(*(float *)&v12, 1.0);
          *double v6 = *(float *)&v12;
          *int v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA10, *v7), *(float *)&v12);
          levelSmoother = self->_levelSmoother;
          LODWORD(v12) = 1063675494;
LABEL_16:
          [(SUICAudioLevelSmoother *)levelSmoother setDecaySpeed:v12];
          break;
        case 2:
          float v15 = v10 + self->_frameRateScalingFactor * 0.02;
          float v16 = fminf(v15, 1.0);
          *double v6 = v16;
          *int v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA00, *v7), v16);
          break;
        case 4:
          double v17 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&double v17 = v17;
          *(float *)&double v17 = fminf(*(float *)&v17, 1.0);
          *double v6 = *(float *)&v17;
          *int v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)0, *v7), *(float *)&v17);
          if (*v6 == 1.0)
          {
            *(float *)&double v17 = *v6;
            -[SUICFlamesViewMetal setHidden:](self, "setHidden:", 1, v17);
          }
          break;
        default:
          break;
      }
    }
    float v86 = 0.0;
    if (self->_state == 1)
    {
      [(SUICFlamesViewMetal *)self _currentMicPowerLevel];
      float v86 = v18;
    }
    double v19 = [(MTKView *)self currentRenderPassDescriptor];
    if (v19)
    {
      float v76 = v8;
      BOOL v75 = v9;
      int v79 = v5;
      id v80 = v4;
      float v20 = [(SUICFlamesViewMetal *)self _lazy_commandQueue];
      double v21 = [v20 commandBuffer];

      [v21 setLabel:@"SUICFlamesViewMetalBuffer"];
      id v77 = v21;
      v78 = v19;
      float v22 = [v21 renderCommandEncoderWithDescriptor:v19];
      [v22 setLabel:@"SUICFlamesViewMetalEncoder"];
      [(CADisplayLink *)self->_displayLink duration];
      double v24 = v23;
      id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id obj = self->_flameGroups;
      uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        char v82 = 0;
        float v27 = v24;
        uint64_t v28 = *(void *)v100;
        double v29 = v27;
        double v85 = v27 * 0.5;
        float32x2_t v81 = (float32x2_t)vdup_n_s32(0x25800000u);
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v100 != v28) {
              objc_enumerationMutation(obj);
            }
            unsigned int v31 = *(void **)(*((void *)&v99 + 1) + 8 * v30);
            uint64_t v32 = (float32x4_t *)[v31 stateModifiersPtr];
            if (!self->_freezesAura || ([v31 isAura] & 1) == 0)
            {
              BOOL reduceMotionEnabled = self->_reduceMotionEnabled;
              double frameRateScalingFactor = self->_frameRateScalingFactor;
              [v31 stateTime];
              double v36 = v35;
              double v37 = v85;
              if (reduceMotionEnabled)
              {
                double v38 = 0.1;
              }
              else
              {
                double v37 = v29;
                double v38 = 0.25;
              }
              if (reduceMotionEnabled) {
                double v39 = v86 * 0.5 + 0.1;
              }
              else {
                double v39 = v86 * 2.0 + 0.25;
              }
              double v40 = v36 + v37 * frameRateScalingFactor;
              *(float *)&double v40 = v40;
              [v31 setStateTime:v40];
              double v41 = v38 * v32->f32[2] + v39 * (float)(v32->f32[0] + v32->f32[1]) + v32->f32[3] * 0.05;
              [v31 zTime];
              double v43 = v42 + v29 * v41;
              *(float *)&double v43 = v43;
              [v31 setZTime:v43];
            }
            if ([v31 isDyingOff])
            {
              [v31 globalAlpha];
              *(float *)&double v44 = *(float *)&v44 + -0.03;
              if (*(float *)&v44 < 0.0) {
                *(float *)&double v44 = 0.0;
              }
              [v31 setGlobalAlpha:v44];
            }
            if ([v31 isAura] && !self->_mode)
            {
              id v60 = (float *)[v31 transitionPhasePtr];
              if (*v60 >= 1.0)
              {
                unsigned int numAuraIndices = self->_numAuraIndices;
                uint64_t numAuraIndicesCulled = self->_numAuraIndicesCulled;
                char v82 = 1;
              }
              else
              {
                unsigned int numAuraIndices = 0;
                float v61 = *v60 + dbl_1A64FBA30[!self->_reduceMotionEnabled] * self->_frameRateScalingFactor;
                float v62 = fminf(v61, 1.0);
                *id v60 = v62;
                int8x16_t v63 = (int8x16_t)vmlaq_n_f32(*v32, vsubq_f32((float32x4_t)xmmword_1A64FBA40, *v32), v62);
                *uint64_t v32 = (float32x4_t)v63;
                uint64_t numAuraIndicesCulled = self->_numAuraIndices;
                if (*(float *)v63.i32 <= 2.2204e-16)
                {
                  v64.i32[1] = v63.i32[1];
                  v64.i32[0] = vextq_s8(v63, v63, 8uLL).u32[0];
                  int8x8_t v65 = vmvn_s8((int8x8_t)vcge_f32(v81, v64));
                  if ((v65.i8[4] & 1) == 0 && (v65.i8[0] & 1) == 0)
                  {
                    if (*(float *)&v63.i32[3] + 2.22044605e-16 >= 1.0)
                    {
                      id WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);
                      char v89 = objc_opt_respondsToSelector();

                      if (v89)
                      {
                        id v67 = objc_loadWeakRetained((id *)&self->_flamesDelegate);
                        [v67 flamesViewAuraDidDisplay:self];
                      }
                    }
                    unsigned int numAuraIndices = 0;
                  }
                }
              }
            }
            else
            {
              unsigned int numAuraIndices = 0;
              uint64_t numAuraIndicesCulled = 0;
            }
            long long v98 = 0u;
            [(MTKView *)self drawableSize];
            *(float *)&double v47 = v47;
            LODWORD(v98) = LODWORD(v47);
            [(MTKView *)self drawableSize];
            float v49 = v48;
            *((float *)&v98 + 1) = v49;
            [v22 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
            [(SUICFlamesViewMetal *)self _currentDisplayScale];
            *(float *)&double v50 = v50;
            *(void *)&long long v51 = v98;
            DWORD2(v51) = LODWORD(v50);
            HIDWORD(v51) = LODWORD(self->_dictationUnitSize);
            long long v98 = v51;
            [v22 setVertexBytes:&v98 length:16 atIndex:1];
            [v22 setVertexBytes:v32 length:16 atIndex:4];
            float32x4_t v97 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_activeFrame.origin), (float64x2_t)self->_activeFrame.size);
            [v22 setVertexBytes:&v97 length:16 atIndex:2];
            long long v96 = 0u;
            [v31 stateTime];
            unsigned int v88 = v52;
            [v31 zTime];
            unsigned int location = v53;
            [v31 globalAlpha];
            *(void *)&long long v54 = __PAIR64__(location, v88);
            *((void *)&v54 + 1) = __PAIR64__(v55, LODWORD(v86));
            long long v96 = v54;
            [v22 setVertexBytes:&v96 length:16 atIndex:3];
            if ([(SUICFlamesViewMetal *)self inDictationMode])
            {
              float64x2_t v56 = *(float64x2_t *)&self->_dictationRedColor;
              *(float32x2_t *)&v56.f64[0] = vcvt_f32_f64(v56);
              float dictationBlueColor = self->_dictationBlueColor;
              *(float *)&v56.f64[1] = dictationBlueColor;
              float64x2_t v95 = v56;
              [v22 setFragmentBytes:&v95 length:16 atIndex:5];
            }
            if (v32->f32[3] <= 0.0)
            {
              uint64_t numAuraIndicesCulled = self->_numWaveIndices;
              unsigned int numAuraIndices = self->_numAuraIndicesCulled + self->_numAuraIndices;
              uint64_t v58 = &self->_pipelineState[self->_mode];
            }
            else
            {
              uint64_t v58 = &self->_pipelineState[3];
            }
            [v22 setRenderPipelineState:*v58];
            [v22 drawIndexedPrimitives:3 indexCount:numAuraIndicesCulled indexType:1 indexBuffer:self->_indexBuffer indexBufferOffset:4 * numAuraIndices];
            [v31 globalAlpha];
            if (v59 == 0.0) {
              [v84 addObject:v31];
            }
            ++v30;
          }
          while (v26 != v30);
          uint64_t v68 = [(NSMutableArray *)obj countByEnumeratingWithState:&v99 objects:v103 count:16];
          uint64_t v26 = v68;
        }
        while (v68);
      }
      else
      {
        char v82 = 0;
      }

      [v22 endEncoding];
      id v69 = [(MTKView *)self currentDrawable];
      [v77 presentDrawable:v69];

      if (self->_freezesAura)
      {
        BOOL v70 = (v76 >= 1.0) & v82;
        id v4 = v80;
      }
      else
      {
        id v4 = v80;
        BOOL v70 = v75;
      }
      double v19 = v78;
      self->_transitionFinished = v70;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke;
      v92[3] = &unk_1E5C59D18;
      id v93 = v84;
      BOOL v94 = self;
      id v71 = v84;
      id v72 = (void *)MEMORY[0x1AD0BCD30](v92);
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_2;
      v90[3] = &unk_1E5C59D40;
      id v91 = v72;
      id v73 = v72;
      [v77 addCompletedHandler:v90];
      [v77 commit];

      id v5 = v79;
    }
    if (!v4)
    {
      commandQueue = self->_commandQueue;
      self->_commandQueue = 0;
    }
  }
  else
  {
    uint64_t v14 = _updateCurveLayer__skipCount++;
    if (__ROR8__(0x1CAC083126E978D5 * v14, 3) <= 0x4189374BC6A7EFuLL) {
      -[SUICFlamesViewMetal _didSkipFrameUpdateWithReason:andCount:](self, "_didSkipFrameUpdateWithReason:andCount:", @"no drawable available");
    }
  }

LABEL_12:
}

unsigned char *__41__SUICFlamesViewMetal__updateCurveLayer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(*(void *)(a1 + 40) + 1104) removeObjectsInArray:*(void *)(a1 + 32)];
  }
  uint64_t result = *(unsigned char **)(a1 + 40);
  if (result[1208])
  {
    return (unsigned char *)[result _didFinishTransition];
  }
  return result;
}

void __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_2(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    float64x2_t v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_3;
    block[3] = &unk_1E5C593F8;
    id v4 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_indexCache
{
  if (_indexCache_onceToken_0 != -1) {
    dispatch_once(&_indexCache_onceToken_0, &__block_literal_global_128);
  }
  float64x2_t v2 = (void *)_indexCache_sIndexCache_0;

  return v2;
}

uint64_t __34__SUICFlamesViewMetal__indexCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_indexCache_sIndexCache_0;
  _indexCache_sIndexCache_0 = (uint64_t)v0;

  float64x2_t v2 = (void *)_indexCache_sIndexCache_0;
  uint64_t v3 = sIndexCacheSize_0;

  return [v2 setCountLimit:v3];
}

+ (void)setIndexCacheSize:(unint64_t)a3
{
  sIndexCacheSize_0 = a3;
  id v3 = [a1 _indexCache];
  [v3 setCountLimit:sIndexCacheSize_0];
}

- (float)_currentMicPowerLevel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);
  [WeakRetained audioLevelForFlamesView:self];
  int v5 = v4;

  LODWORD(v6) = v5;
  [(SUICAudioLevelSmoother *)self->_levelSmoother smoothedLevelForMicPower:v6];
  return v7 * 0.95 + 0.05;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICFlamesViewMetal;
  [(SUICFlamesViewMetal *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    int v5 = [(SUICFlamesViewMetal *)self traitCollection];
    [v5 displayScale];
    double v7 = v6;
    [v4 displayScale];
    if (v7 != v8)
    {
      [(SUICFlamesViewMetal *)self resetAndReinitialize:1];
      [(SUICFlamesViewMetal *)self _setValuesForFidelity:self->_fidelity];
      [(SUICFlamesViewMetal *)self setNeedsLayout];
    }
  }
}

- (SUICFlamesViewProvidingDelegate)flamesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);

  return (SUICFlamesViewProvidingDelegate *)WeakRetained;
}

- (BOOL)accelerateTransitions
{
  return self->_accelerateTransitions;
}

- (void)setAccelerateTransitions:(BOOL)a3
{
  self->_accelerateTransitions = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)showAura
{
  return self->_showAura;
}

- (void)setShowAura:(BOOL)a3
{
  self->_showAura = a3;
}

- (CGRect)activeFrame
{
  double x = self->_activeFrame.origin.x;
  double y = self->_activeFrame.origin.y;
  double width = self->_activeFrame.size.width;
  double height = self->_activeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)dictationColor
{
  return self->_dictationColor;
}

- (BOOL)freezesAura
{
  return self->_freezesAura;
}

- (void)setFreezesAura:(BOOL)a3
{
  self->_freezesAura = a3;
}

- (double)horizontalScaleFactor
{
  return self->_horizontalScaleFactor;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (BOOL)reduceFrameRate
{
  return self->_reduceFrameRate;
}

- (void)setReduceFrameRate:(BOOL)a3
{
  self->_reduceFrameRate = a3;
}

- (BOOL)reduceThinkingFramerate
{
  return self->_reduceThinkingFramerate;
}

- (void)setReduceThinkingFramerate:(BOOL)a3
{
  self->_reduceThinkingFramerate = a3;
}

- (BOOL)renderInBackground
{
  return self->_renderInBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_dictationColor, 0);
  objc_destroyWeak((id *)&self->_flamesDelegate);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_pipelineState[i], 0);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_currentFlameGroup, 0);
  objc_storeStrong((id *)&self->_flameGroups, 0);
  objc_storeStrong((id *)&self->_renderingDisabledReasons, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)_initMetalAndSetupDisplayLink:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  float64x2_t v2 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
  _os_log_error_impl(&dword_1A64CC000, log, OS_LOG_TYPE_ERROR, "%s Metal is not supported on this device", (uint8_t *)&v1, 0xCu);
}

- (void)_initMetalAndSetupDisplayLink:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  float64x2_t v2 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
  _os_log_error_impl(&dword_1A64CC000, log, OS_LOG_TYPE_ERROR, "%s Unable to setup pipeline library", (uint8_t *)&v1, 0xCu);
}

- (void)_loadPipelineLibraries
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A64CC000, v0, v1, "%s Unable to load pipelines: %@", v2, v3, v4, v5, 2u);
}

@end