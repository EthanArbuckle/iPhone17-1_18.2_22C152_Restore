@interface SUICFlamesViewLegacy
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
- (BOOL)_initGLAndSetupDisplayLink:(BOOL)a3;
- (BOOL)_isOriginatingProcessInBackground;
- (BOOL)_resizeFromLayer:(id)a3;
- (BOOL)_setCurrentContext;
- (BOOL)_setupFramebuffer;
- (BOOL)_setupShaders;
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
- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5;
- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5;
- (SUICFlamesViewProvidingDelegate)flamesDelegate;
- (UIColor)dictationColor;
- (UIImage)overlayImage;
- (double)_currentDisplayScale;
- (double)horizontalScaleFactor;
- (float)_currentMicPowerLevel;
- (float32x2_t)_predeterminedVertexPositionForAuraWithPolarVertex:(uint64_t)a1;
- (int)_generateIndicesForNumCircleShapes:(int)a3 withMaxSubdivisionLevel:(float)a4 startingWithNumSubdivisionLevel:(float)a5 forIndices:(unsigned int *)a6 atStartIndex:(int)a7 withFill:(BOOL)a8 withCullingForAura:(BOOL)a9 forVertices:(id *)a10;
- (int64_t)_preferredFramesPerSecond;
- (int64_t)mode;
- (int64_t)state;
- (unsigned)_numVerticesPerCircle;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_cleanupGL;
- (void)_prewarmShaders;
- (void)_reduceMotionStatusChanged:(id)a3;
- (void)_restoreCurrentContext;
- (void)_setPreferredFramesPerSecond;
- (void)_setValuesForFidelity:(int64_t)a3;
- (void)_setupDisplayLink;
- (void)_setupVertexBuffer;
- (void)_tearDownDisplayLink;
- (void)_updateCurveLayer:(id)a3;
- (void)_updateDisplayLinkPausedState;
- (void)_updateOrthoProjection;
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
- (void)stopRenderingAndCleanupGL;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUICFlamesViewLegacy

- (void)_setValuesForFidelity:(int64_t)a3
{
  if (self->_mode == 1)
  {
    self->_unsigned int maxVertexCircles = 1;
    [(SUICFlamesViewLegacy *)self _currentDisplayScale];
    float v5 = v4 * 6.0;
    double v6 = v4 * self->_activeFrame.size.width * self->_horizontalScaleFactor;
    *(float *)&double v4 = v6;
    self->_maxSubdivisionLevel = logf(roundf((float)(fmaxf(v5, *(float *)&v4) / v5) / 3.0) * 4.0) / 0.69315;
    float v7 = v6 / ((float)[(SUICFlamesViewLegacy *)self _numVerticesPerCircle] * 0.25);
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

- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v40.receiver = self;
  v40.super_class = (Class)SUICFlamesViewLegacy;
  v13 = -[SUICFlamesViewLegacy initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
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
    [(SUICFlamesViewLegacy *)v13 setMode:0];
    v13->_fidelitdouble y = a5;
    [(SUICFlamesViewLegacy *)v13 _setValuesForFidelity:a5];
    [(SUICFlamesViewLegacy *)v13 bounds];
    v13->_activeFrame.origin.double x = v25;
    v13->_activeFrame.origin.double y = v26;
    v13->_currentContextCount = 0;
    v13->_activeFrame.size.double width = v27;
    v13->_activeFrame.size.double height = v28;
    v13->_horizontalScaleFactor = 1.0;
    v13->_frameRateScalingFactor = 1.0;
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F38D58]) initWithAPI:2];
    eaglContext = v13->_eaglContext;
    v13->_eaglContext = (EAGLContext *)v29;

    if (!v13->_eaglContext
      || (BOOL v31 = [(SUICFlamesViewLegacy *)v13 _setCurrentContext],
          [(SUICFlamesViewLegacy *)v13 _restoreCurrentContext],
          !v31))
    {
      v38 = 0;
      goto LABEL_7;
    }
    v13->_state = 0;
    v13->_dictationRedColor = 1.0;
    v13->_dictationGreenColor = 1.0;
    v13->_dictationBlueColor = 1.0;
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    flameGroups = v13->_flameGroups;
    v13->_flameGroups = v32;

    v34 = objc_alloc_init(SUICFlameGroup);
    currentFlameGroup = v13->_currentFlameGroup;
    v13->_currentFlameGroup = v34;

    [(NSMutableArray *)v13->_flameGroups addObject:v13->_currentFlameGroup];
    uint64_t v36 = [MEMORY[0x1E4F1CA80] set];
    renderingDisabledReasons = v13->_renderingDisabledReasons;
    v13->_renderingDisabledReasons = (NSMutableSet *)v36;
  }
  v38 = v13;
LABEL_7:

  return v38;
}

- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v11 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  id v12 = -[SUICFlamesViewLegacy initWithFrame:screen:fidelity:](self, "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);

  return v12;
}

- (void)dealloc
{
  [(SUICFlamesViewLegacy *)self _tearDownDisplayLink];
  [(SUICFlamesViewLegacy *)self _cleanupGL];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SUICFlamesViewLegacy *)self _restoreCurrentContext];
  eaglContext = self->_eaglContext;
  self->_eaglContext = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewLegacy;
  [(SUICFlamesViewLegacy *)&v5 dealloc];
}

- (void)didMoveToSuperview
{
  v3 = [(SUICFlamesViewLegacy *)self superview];

  if (v3)
  {
    [(SUICFlamesViewLegacy *)self _setupDisplayLink];
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(SUICFlamesViewLegacy *)self setBackgroundColor:v4];

    [(SUICFlamesViewLegacy *)self setUserInteractionEnabled:0];
  }
  else
  {
    [(SUICFlamesViewLegacy *)self _tearDownDisplayLink];
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
    [(SUICFlamesViewLegacy *)self _tearDownDisplayLink];
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
    [(SUICFlamesViewLegacy *)self _setPreferredFramesPerSecond];
    [(SUICFlamesViewLegacy *)self _updateDisplayLinkPausedState];
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
  if (_supportsAdaptiveFramerate_onceToken != -1) {
    dispatch_once(&_supportsAdaptiveFramerate_onceToken, &__block_literal_global_0);
  }
  return _supportsAdaptiveFramerate_supportsAdaptiveFramerate;
}

uint64_t __50__SUICFlamesViewLegacy__supportsAdaptiveFramerate__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _supportsAdaptiveFramerate_supportsAdaptiveFramerate = result;
  return result;
}

- (void)_setPreferredFramesPerSecond
{
  if (self->_flamesPaused)
  {
    uint64_t v3 = 10;
    goto LABEL_3;
  }
  if ([(id)objc_opt_class() _supportsAdaptiveFramerate]
    && (unint64_t state = self->_state, state <= 4))
  {
    uint64_t v3 = qword_1A64FBA50[state];
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
  else
  {
    if (!self->_reduceFrameRate) {
      goto LABEL_3;
    }
    if (mode != 2)
    {
      if (mode == 1)
      {
        uint64_t v3 = 30;
        goto LABEL_3;
      }
      if (mode) {
        goto LABEL_3;
      }
    }
    if (self->_state != 2) {
      uint64_t v3 = 30;
    }
  }
LABEL_3:
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
      [(SUICFlamesViewLegacy *)self _setValuesForFidelity:0];
    }
    if (self->_isInitialized)
    {
      [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:1];
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    [(SUICFlamesViewLegacy *)self _tearDownDisplayLink];
  }
  else if (self->_isInitialized)
  {
    [(SUICFlamesViewLegacy *)self _setupDisplayLink];
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
  v9.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    [(SUICFlamesViewLegacy *)self bounds];
    self->_activeFrame.origin.double x = v4;
    self->_activeFrame.origin.double y = v5;
    self->_activeFrame.size.double width = v6;
    self->_activeFrame.size.double height = v7;
  }
  if (self->_mode == 1)
  {
    [(SUICFlamesViewLegacy *)self _setValuesForFidelity:0];
    if (self->_isInitialized) {
      [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:1];
    }
  }
  overlayImageView = self->_overlayImageView;
  [(SUICFlamesViewLegacy *)self frame];
  -[UIImageView setFrame:](overlayImageView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    [(SUICFlamesViewLegacy *)self bounds];
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
    [(SUICFlamesViewLegacy *)self _setValuesForFidelity:0];
    if (self->_isInitialized)
    {
      [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:1];
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
    [(SUICFlamesViewLegacy *)self frame];
    -[UIImageView setFrame:](v7, "setFrame:");
    [(SUICFlamesViewLegacy *)self addSubview:self->_overlayImageView];
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
  BOOL v3 = a3;
  [(EAGLContext *)self->_eaglContext setParameter:321 to:&v3];
}

- (BOOL)flamesPaused
{
  return self->_flamesPaused;
}

- (void)setFlamesPaused:(BOOL)a3
{
  self->_BOOL flamesPaused = a3;
  [(SUICFlamesViewLegacy *)self _setPreferredFramesPerSecond];

  [(SUICFlamesViewLegacy *)self _updateDisplayLinkPausedState];
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
  v18 = -[SUICFlamesViewLegacy initWithFrame:screen:fidelity:]([SUICFlamesViewLegacy alloc], "initWithFrame:screen:fidelity:", v17, a6, v16, v15, v14, v13);

  [(SUICFlamesViewLegacy *)v18 setRenderInBackground:v7];
  -[SUICFlamesViewLegacy setActiveFrame:](v18, "setActiveFrame:", x, y, width, height);
  [(SUICFlamesViewLegacy *)v18 _prewarmShaders];
}

- (void)setHorizontalScaleFactor:(double)a3
{
  self->_horizontalScaleFactor = a3;
  if (a3 != 0.0)
  {
    CGFloat v4 = [(SUICFlamesViewLegacy *)self layer];
    CGAffineTransformMakeScale(&v5, 1.0 / self->_horizontalScaleFactor, 1.0);
    [v4 setAffineTransform:&v5];

    [(SUICFlamesViewLegacy *)self _setValuesForFidelity:self->_fidelity];
  }
}

- (void)_prewarmShaders
{
  self->_isInitialized = [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:0];
  displayLink = self->_displayLink;

  [(SUICFlamesViewLegacy *)self _updateCurveLayer:displayLink];
}

- (void)resetAndReinitialize:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:1];
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
  [(SUICFlamesViewLegacy *)self _updateCurveLayer:self->_displayLink];
}

- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  renderingDisabledReasons = self->_renderingDisabledReasons;
  id v8 = v6;
  if (v4)
  {
    [(NSMutableSet *)renderingDisabledReasons removeObject:v6];
  }
  else
  {
    [(NSMutableSet *)renderingDisabledReasons addObject:v6];
    if (!self->_renderInBackground) {
      glFinish();
    }
  }
  if ([(SUICFlamesViewLegacy *)self isRenderingEnabled]) {
    [(SUICFlamesViewLegacy *)self setNeedsLayout];
  }
}

- (BOOL)_setCurrentContext
{
  BOOL v3 = [MEMORY[0x1E4F38D58] currentContext];
  BOOL v4 = v3;
  int64_t currentContextCount = self->_currentContextCount;
  if (currentContextCount <= 0 && v3 != self->_eaglContext)
  {
    objc_storeStrong((id *)&self->_previousContext, v3);
    int64_t currentContextCount = self->_currentContextCount;
  }
  self->_int64_t currentContextCount = currentContextCount + 1;
  char v6 = [MEMORY[0x1E4F38D58] setCurrentContext:self->_eaglContext];

  return v6;
}

- (void)_restoreCurrentContext
{
  int64_t currentContextCount = self->_currentContextCount;
  if (currentContextCount <= 1) {
    int64_t currentContextCount = 1;
  }
  self->_int64_t currentContextCount = currentContextCount - 1;
  if ((unint64_t)currentContextCount <= 1) {
    [MEMORY[0x1E4F38D58] setCurrentContext:self->_previousContext];
  }
}

- (void)_reduceMotionStatusChanged:(id)a3
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (!self->_mode)
  {
    self->_shadersAreCompiled = 0;
    [(SUICFlamesViewLegacy *)self resetAndReinitialize:1];
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
  if (([(SUICFlamesViewLegacy *)self isHidden] & 1) == 0 && !self->_displayLink)
  {
    BOOL v3 = [(UIScreen *)self->_screen displayLinkWithTarget:self selector:sel__updateCurveLayer_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    CGAffineTransform v5 = self->_displayLink;
    char v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    [(SUICFlamesViewLegacy *)self _setPreferredFramesPerSecond];
    [(SUICFlamesViewLegacy *)self _updateDisplayLinkPausedState];
  }
}

- (BOOL)_setupFramebuffer
{
  p_framebufferHandle = &self->_framebufferHandle;
  glGenFramebuffers(1, &self->_framebufferHandle);
  if (glGetError()) {
    return 0;
  }
  p_renderbufferHandle = &self->_renderbufferHandle;
  glGenRenderbuffers(1, &self->_renderbufferHandle);
  if (glGetError()) {
    return 0;
  }
  glBindFramebuffer(0x8D40u, *p_framebufferHandle);
  if (glGetError()) {
    return 0;
  }
  glBindRenderbuffer(0x8D41u, *p_renderbufferHandle);
  if (glGetError()) {
    return 0;
  }
  eaglContext = self->_eaglContext;
  char v6 = [(SUICFlamesViewLegacy *)self layer];
  LODWORD(eaglContext) = [(EAGLContext *)eaglContext renderbufferStorage:36161 fromDrawable:v6];

  if (!eaglContext) {
    return 0;
  }
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *p_renderbufferHandle);
  if (glGetError()) {
    return 0;
  }
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &self->_viewWidth);
  if (glGetError()) {
    return 0;
  }
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &self->_viewHeight);
  return !glGetError() && glCheckFramebufferStatus(0x8D40u) == 36053;
}

- (BOOL)_setupShaders
{
  if (self->_shadersAreCompiled) {
    return 1;
  }
  GLuint flameProgramHandle = self->_flameProgramHandle;
  if (flameProgramHandle)
  {
    glDeleteProgram(flameProgramHandle);
    self->_GLuint flameProgramHandle = 0;
  }
  GLuint auraProgramHandle = self->_auraProgramHandle;
  if (auraProgramHandle)
  {
    glDeleteProgram(auraProgramHandle);
    self->_GLuint auraProgramHandle = 0;
  }
  GLuint v6 = glCreateShader(0x8B31u);
  GLuint v7 = glCreateShader(0x8B30u);
  GLuint v8 = v7;
  BOOL v9 = 0;
  GLint params = 0;
  if (v6 && v7)
  {
    glDisable(0xB71u);
    if (glGetError() || (glDisable(0xBD0u), glGetError()) || (glEnable(0xBE2u), glGetError()))
    {
      BOOL v9 = 0;
    }
    else
    {
      glBlendFunc(0x302u, 0x303u);
      BOOL v9 = glGetError() == 0;
    }
  }
  int64_t mode = self->_mode;
  if (mode == 2)
  {
    if (!v9) {
      goto LABEL_54;
    }
    glShaderSource(v6, 1, (const GLchar *const *)siriTrainingVertexShader, 0);
    if (glGetError()) {
      goto LABEL_54;
    }
    glCompileShader(v6);
    if (glGetError()) {
      goto LABEL_54;
    }
    glGetShaderiv(v6, 0x8B81u, &params);
    if (glGetError()) {
      goto LABEL_54;
    }
    uint64_t v19 = &siriTrainingFragmentShader;
  }
  else
  {
    if (mode != 1)
    {
      if (mode) {
        goto LABEL_34;
      }
      if (v9)
      {
        if (self->_reduceMotionEnabled) {
          long long v11 = siriFlameAccessibilityVertexShader;
        }
        else {
          long long v11 = siriFlameVertexShader;
        }
        glShaderSource(v6, 1, (const GLchar *const *)v11, 0);
        if (glGetError()
          || (glCompileShader(v6), glGetError())
          || (glGetShaderiv(v6, 0x8B81u, &params), glGetError())
          || (glShaderSource(v8, 1, (const GLchar *const *)siriFlameFragmentShader, 0), glGetError())
          || (glCompileShader(v8), glGetError()))
        {
          BOOL v9 = 0;
        }
        else
        {
          glGetShaderiv(v8, 0x8B81u, &params);
          BOOL v9 = glGetError() == 0;
        }
      }
      if (!self->_showAura)
      {
LABEL_34:
        GLuint v13 = 0;
        goto LABEL_35;
      }
      GLuint v12 = glCreateShader(0x8B30u);
      GLuint v13 = v12;
      char v14 = !v9;
      if (!v12) {
        char v14 = 1;
      }
      if ((v14 & 1) == 0)
      {
        glShaderSource(v12, 1, (const GLchar *const *)siriAuraFragmentShader, 0);
        if (!glGetError())
        {
          glCompileShader(v13);
          if (!glGetError())
          {
            GLuint v15 = v13;
LABEL_33:
            glGetShaderiv(v15, 0x8B81u, &params);
            BOOL v9 = glGetError() == 0;
LABEL_35:
            BOOL v16 = 0;
            if (!v9) {
              goto LABEL_56;
            }
            if (!params) {
              goto LABEL_56;
            }
            self->_GLuint flameProgramHandle = glCreateProgram();
            GLenum Error = glGetError();
            BOOL v16 = 0;
            if (Error) {
              goto LABEL_56;
            }
            GLuint v18 = self->_flameProgramHandle;
            if (!v18) {
              goto LABEL_56;
            }
            glAttachShader(v18, v6);
            if (!glGetError())
            {
              glAttachShader(self->_flameProgramHandle, v8);
              if (!glGetError())
              {
                glLinkProgram(self->_flameProgramHandle);
                if (!glGetError())
                {
                  glGetProgramiv(self->_flameProgramHandle, 0x8B82u, &params);
                  BOOL v16 = glGetError() == 0;
                  goto LABEL_56;
                }
              }
            }
          }
        }
      }
LABEL_55:
      BOOL v16 = 0;
      goto LABEL_56;
    }
    if (!v9
      || (glShaderSource(v6, 1, (const GLchar *const *)siriDictationVertexShader, 0), glGetError())
      || (glCompileShader(v6), glGetError())
      || (glGetShaderiv(v6, 0x8B81u, &params), glGetError()))
    {
LABEL_54:
      GLuint v13 = 0;
      goto LABEL_55;
    }
    uint64_t v19 = siriDictationFragmentShader;
  }
  glShaderSource(v8, 1, (const GLchar *const *)v19, 0);
  if (glGetError()) {
    goto LABEL_54;
  }
  glCompileShader(v8);
  GLenum v45 = glGetError();
  GLuint v13 = 0;
  BOOL v16 = 0;
  GLuint v15 = v8;
  if (!v45) {
    goto LABEL_33;
  }
LABEL_56:
  if (params) {
    BOOL v20 = v16;
  }
  else {
    BOOL v20 = 0;
  }
  glClear(0x4000u);
  float width = self->_activeFrame.size.width;
  double v22 = self->_horizontalScaleFactor * width;
  GLfloat x = self->_activeFrame.origin.x;
  GLfloat y = self->_activeFrame.origin.y;
  *(float *)&double v22 = v22;
  GLfloat height = self->_activeFrame.size.height;
  glVertexAttrib4f(2u, x, y, *(GLfloat *)&v22, height);
  GLfloat viewWidth = (float)self->_viewWidth;
  GLfloat viewHeight = (float)self->_viewHeight;
  [(SUICFlamesViewLegacy *)self _currentDisplayScale];
  GLfloat v29 = v28;
  glVertexAttrib4f(1u, viewWidth, viewHeight, v29, self->_dictationUnitSize);
  glVertexAttrib4f(4u, 0.0, 0.0, 0.0, 0.0);
  glVertexAttrib4f(3u, 0.0, 0.0, 0.0, 0.0);
  if (self->_mode == 1)
  {
    GLfloat dictationRedColor = self->_dictationRedColor;
    GLfloat dictationGreenColor = self->_dictationGreenColor;
    GLfloat dictationBlueColor = self->_dictationBlueColor;
    glVertexAttrib3f(5u, dictationRedColor, dictationGreenColor, dictationBlueColor);
  }
  GLuint shader = v13;
  if (!v13)
  {
    if (!v20)
    {
      BOOL v40 = 0;
      goto LABEL_81;
    }
    goto LABEL_77;
  }
  GLuint v46 = v8;
  if (!v20) {
    goto LABEL_68;
  }
  self->_GLuint auraProgramHandle = glCreateProgram();
  BOOL v33 = 0;
  if (!glGetError())
  {
    GLuint v34 = self->_auraProgramHandle;
    if (v34)
    {
      glAttachShader(v34, v6);
      if (glGetError()
        || (glAttachShader(self->_auraProgramHandle, v13), glGetError())
        || (glLinkProgram(self->_auraProgramHandle), glGetError()))
      {
LABEL_68:
        BOOL v33 = 0;
        goto LABEL_69;
      }
      glGetProgramiv(self->_auraProgramHandle, 0x8B82u, &params);
      BOOL v33 = 0;
      if (!glGetError() && params)
      {
        glUseProgram(self->_auraProgramHandle);
        BOOL v33 = glGetError() == 0;
      }
    }
  }
LABEL_69:
  int AttribLocation = glGetAttribLocation(self->_auraProgramHandle, "in_Polar");
  int v36 = glGetAttribLocation(self->_auraProgramHandle, "in_FittedBounds");
  int v37 = glGetAttribLocation(self->_auraProgramHandle, "in_Time_ZTime_Height_Alpha");
  int v38 = glGetAttribLocation(self->_auraProgramHandle, "in_States");
  int v39 = glGetAttribLocation(self->_auraProgramHandle, "in_ViewportDim_ScreenScale_UnitLength");
  glDrawArrays(4u, 0, 3);
  BOOL v40 = 0;
  if (!v33 || AttribLocation || v36 != 2 || v37 != 3)
  {
    GLuint v8 = v46;
    goto LABEL_81;
  }
  GLuint v8 = v46;
  if (v38 == 4 && v39 == 1)
  {
LABEL_77:
    glUseProgram(self->_flameProgramHandle);
    BOOL v40 = glGetError() == 0;
  }
LABEL_81:
  if (glGetAttribLocation(self->_flameProgramHandle, "in_Polar")) {
    BOOL v41 = 0;
  }
  else {
    BOOL v41 = v40;
  }
  if (glGetAttribLocation(self->_flameProgramHandle, "in_FittedBounds") != 2) {
    BOOL v41 = 0;
  }
  if (glGetAttribLocation(self->_flameProgramHandle, "in_Time_ZTime_Height_Alpha") != 3) {
    BOOL v41 = 0;
  }
  if (glGetAttribLocation(self->_flameProgramHandle, "in_States") != 4) {
    BOOL v41 = 0;
  }
  BOOL v2 = glGetAttribLocation(self->_flameProgramHandle, "in_ViewportDim_ScreenScale_UnitLength") == 1 && v41;
  if (self->_mode == 1 && glGetAttribLocation(self->_flameProgramHandle, "in_FragmentColor") != 5) {
    BOOL v2 = 0;
  }
  glDrawArrays(4u, 0, 3);
  if (v6) {
    glDeleteShader(v6);
  }
  if (v8) {
    glDeleteShader(v8);
  }
  if (shader) {
    glDeleteShader(shader);
  }
  if (v2)
  {
    self->_shadersAreCompiled = 1;
  }
  else
  {
    GLuint v42 = self->_flameProgramHandle;
    if (v42)
    {
      glDeleteProgram(v42);
      self->_GLuint flameProgramHandle = 0;
    }
    GLuint v43 = self->_auraProgramHandle;
    if (v43)
    {
      glDeleteProgram(v43);
      self->_GLuint auraProgramHandle = 0;
    }
  }
  return v2;
}

- (unsigned)_numVerticesPerCircle
{
  return llroundf(exp2f(self->_maxSubdivisionLevel) * 3.0);
}

- (float32x2_t)_predeterminedVertexPositionForAuraWithPolarVertex:(uint64_t)a1
{
  v2.f64[0] = *(double *)(a1 + 704) * *(double *)(a1 + 656);
  v2.f64[1] = *(float64_t *)(a1 + 712);
  __asm { FMOV            V3.2S, #-1.0 }
  float32x2_t v8 = vmla_f32(_D3, (float32x2_t)0x4000000040000000, vdiv_f32(vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 688)), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v2)), vcvt_f32_s32(*(int32x2_t *)(a1 + 536))));
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
  unsigned int v15 = [(SUICFlamesViewLegacy *)self _numVerticesPerCircle];
  v78 = a6;
  BOOL v16 = (char *)*a6;
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
        BOOL v16 = (char *)malloc_type_realloc(v16, v21 + 24, 0x100004052888210uLL);
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
      signed int v50 = v49 + v90;
      ++v44;
      unsigned int v51 = v49 + v89;
      float v52 = (float)((float)(v47 + v48) / v46) * v88;
      unsigned int v53 = (int)v52 % v15 + v89;
      unsigned int v54 = (int)(float)((float)((float)((float)(v46 + v48) - v47) / v46) * v88) % v15 + v89;
      if (v94)
      {
        unsigned int v87 = v49 + v90;
        long long v55 = *((_OWORD *)a10 + v50);
        unsigned int v56 = (int)v52 % v15 + v89;
        [(SUICFlamesViewLegacy *)self _predeterminedVertexPositionForAuraWithPolarVertex:*(double *)&v55];
        uint64_t v58 = v57 & 0x7FFFFFFF7FFFFFFFLL;
        unsigned int v53 = v56;
        [(SUICFlamesViewLegacy *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 2 * (int)((int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90))];
        uint64_t v60 = v59 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewLegacy *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 2 * (int)v51)];
        uint64_t v62 = v61 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewLegacy *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 2 * (int)v56)];
        uint64_t v64 = v63 & 0x7FFFFFFF7FFFFFFFLL;
        [(SUICFlamesViewLegacy *)self _predeterminedVertexPositionForAuraWithPolarVertex:*((double *)a10 + 2 * (int)v54)];
        if (v92 == 1.0)
        {
          int v41 = v85;
          signed int v50 = v87;
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
        signed int v50 = v87;
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
      BOOL v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
      v68 = (signed int *)&v16[4 * a7];
      signed int *v68 = v50;
      v68[1] = v54;
      v68[2] = v51;
      a7 += 3;
      if (v94) {
        goto LABEL_28;
      }
LABEL_29:
      int v71 = a7;
      a7 += 3;
      BOOL v16 = (char *)malloc_type_realloc(v16, 4 * a7, 0x100004052888210uLL);
      v72 = (signed int *)&v16[4 * v71];
      signed int *v72 = v50;
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
        BOOL v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
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
  v39[1] = *(const GLvoid **)MEMORY[0x1E4F143B8];
  self->_numVertices = self->_maxVertexCircles
                     * [(SUICFlamesViewLegacy *)self _numVerticesPerCircle];
  int v3 = MEMORY[0x1F4188790]();
  GLuint v6 = &v39[-2 * v5];
  unsigned int v8 = *(_DWORD *)((char *)&self->super.super.super.isa + v7);
  if (v8)
  {
    int v9 = 0;
    int v10 = 0;
    float v11 = (float)v3;
    float64x2_t v12 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
    do
    {
      ++v10;
      if (v3 >= 1)
      {
        int v13 = 0;
        int64_t mode = self->_mode;
        unsigned int v15 = &v6[2 * v9];
        do
        {
          if (mode == 1)
          {
            int v16 = v13 & 1;
            int v17 = v13++ | 1;
            v18.f32[0] = (float)v17 / v11;
            float v19 = (double)v13 + (double)(v16 - 1);
            v18.i32[1] = fminf((float)(v19 / v11) - floorf(v19 / v11), 1.0);
            int32x2_t v20 = (int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v18), v12));
          }
          else
          {
            double v21 = (float)((float)v13 / v11) * 6.28318531;
            *(float *)&double v21 = v21;
            ++v13;
            int32x2_t v20 = vdup_lane_s32(*(int32x2_t *)&v21, 0);
          }
          *(float *)v4.i32 = (float)v10 / (float)v8;
          *(int32x2_t *)&long long v22 = vzip1_s32(v4, v20);
          v20.i32[0] = v4.i32[0];
          *((int32x2_t *)&v22 + 1) = v20;
          *(_OWORD *)unsigned int v15 = v22;
          v15 += 2;
          ++v9;
        }
        while (v13 != v3);
      }
    }
    while (v10 != v8);
  }
  v39[0] = 0;
  unsigned int v23 = SUICGetIndexCacheEntryKey(self->_fidelity, self->_mode, self->_viewWidth, self->_viewHeight, self->_activeFrame.origin.x, self->_activeFrame.origin.y, self->_activeFrame.size.width, self->_activeFrame.size.height, self->_horizontalScaleFactor);
  v24 = [(id)objc_opt_class() _indexCache];
  unsigned int v25 = [v24 objectForKey:v23];

  unsigned int v26 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG))
  {
    [(SUICFlamesViewLegacy *)(uint64_t)v25 _setupVertexBuffer];
    if (v25) {
      goto LABEL_12;
    }
LABEL_14:
    *(float *)&double v27 = self->_auraMaxSubdivisionLevel;
    *(float *)&double v28 = self->_auraMinSubdivisionLevel;
    uint64_t v29 = [(SUICFlamesViewLegacy *)self _generateIndicesForNumCircleShapes:self->_auraVertexCircles withMaxSubdivisionLevel:v39 startingWithNumSubdivisionLevel:0 forIndices:1 atStartIndex:0 withFill:v6 withCullingForAura:v27 forVertices:v28];
    self->_numAuraIndices = v29;
    *(float *)&double v30 = self->_auraMaxSubdivisionLevel;
    *(float *)&double v31 = self->_auraMinSubdivisionLevel;
    uint64_t v32 = [(SUICFlamesViewLegacy *)self _generateIndicesForNumCircleShapes:self->_auraVertexCircles withMaxSubdivisionLevel:v39 startingWithNumSubdivisionLevel:v29 forIndices:1 atStartIndex:1 withFill:v6 withCullingForAura:v30 forVertices:v31];
    self->_numAuraIndicesCulled = v32;
    *(float *)&double v33 = self->_maxSubdivisionLevel;
    LODWORD(v34) = LODWORD(v33);
    unsigned int v35 = [(SUICFlamesViewLegacy *)self _generateIndicesForNumCircleShapes:1 withMaxSubdivisionLevel:v39 startingWithNumSubdivisionLevel:v32 forIndices:1 atStartIndex:0 withFill:v6 withCullingForAura:v33 forVertices:v34];
    self->_numWaveIndices = v35;
    self->_numWaveIndices = v35 - self->_numAuraIndicesCulled;
    self->_numAuraIndicesCulled -= self->_numAuraIndices;
    unsigned int v25 = objc_alloc_init(SUICGLIndexCacheEntry);
    [(SUICGLIndexCacheEntry *)v25 setNumAuraIndices:self->_numAuraIndices];
    [(SUICGLIndexCacheEntry *)v25 setNumAuraIndicesCulled:self->_numAuraIndicesCulled];
    [(SUICGLIndexCacheEntry *)v25 setNumWaveIndices:self->_numWaveIndices];
    [(SUICGLIndexCacheEntry *)v25 setGl_indices:v39[0]];
    float v36 = [(id)objc_opt_class() _indexCache];
    [v36 setObject:v25 forKey:v23];

    goto LABEL_15;
  }
  if (!v25) {
    goto LABEL_14;
  }
LABEL_12:
  self->_numAuraIndices = [(SUICGLIndexCacheEntry *)v25 numAuraIndices];
  self->_numAuraIndicesCulled = [(SUICGLIndexCacheEntry *)v25 numAuraIndicesCulled];
  self->_numWaveIndices = [(SUICGLIndexCacheEntry *)v25 numWaveIndices];
  v39[0] = [(SUICGLIndexCacheEntry *)v25 gl_indices];
LABEL_15:
  glGenVertexArraysOES();
  if (glGetError()
    || (glBindVertexArrayOES(), glGetError())
    || (glGenBuffers(1, &self->_vertexBufferHandle), glGetError())
    || (glGenBuffers(1, &self->_elementArrayHandle), glGetError())
    || (glBindBuffer(0x8892u, self->_vertexBufferHandle), glGetError())
    || (glBufferData(0x8892u, 16 * self->_numVertices, v6, 0x88E4u), glGetError())
    || (glBindBuffer(0x8893u, self->_elementArrayHandle), glGetError())
    || (glBufferData(0x8893u, 4 * (self->_numAuraIndicesCulled + self->_numAuraIndices + self->_numWaveIndices), v39[0], 0x88E4u), glGetError()))
  {
    BOOL v37 = 0;
  }
  else
  {
    glVertexAttribPointer(0, 4, 0x1406u, 0, 16, 0);
    BOOL v37 = 0;
    if (!glGetError())
    {
      glEnableVertexAttribArray(0);
      BOOL v37 = glGetError() == 0;
    }
  }

  return v37;
}

- (BOOL)_initGLAndSetupDisplayLink:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUICFlamesViewLegacy *)self _cleanupGL];
  uint64_t v5 = [(SUICFlamesViewLegacy *)self layer];
  [v5 setOpaque:0];
  [(SUICFlamesViewLegacy *)self _currentDisplayScale];
  objc_msgSend(v5, "setContentsScale:");
  [(SUICFlamesViewLegacy *)self _setCurrentContext];
  if ([(SUICFlamesViewLegacy *)self _setupFramebuffer]
    && [(SUICFlamesViewLegacy *)self _setupVertexBuffer])
  {
    BOOL v6 = [(SUICFlamesViewLegacy *)self _setupShaders];
    glClearColor(0.0, 0.0, 0.0, 0.0);
    if (v6 && v3) {
      [(SUICFlamesViewLegacy *)self _setupDisplayLink];
    }
  }
  else
  {
    glClearColor(0.0, 0.0, 0.0, 0.0);
    LOBYTE(v6) = 0;
  }
  [(SUICFlamesViewLegacy *)self _restoreCurrentContext];

  return v6;
}

- (void)_cleanupGL
{
  if (self->_eaglContext)
  {
    [(SUICFlamesViewLegacy *)self _setCurrentContext];
    GLuint flameProgramHandle = self->_flameProgramHandle;
    if (flameProgramHandle)
    {
      glDeleteProgram(flameProgramHandle);
      self->_GLuint flameProgramHandle = 0;
    }
    GLuint auraProgramHandle = self->_auraProgramHandle;
    if (auraProgramHandle)
    {
      glDeleteProgram(auraProgramHandle);
      self->_GLuint auraProgramHandle = 0;
    }
    if (self->_elementArrayHandle)
    {
      glDeleteBuffers(1, &self->_elementArrayHandle);
      self->_elementArrayHandle = 0;
    }
    if (self->_vertexBufferHandle)
    {
      glDeleteBuffers(1, &self->_vertexBufferHandle);
      self->_vertexBufferHandle = 0;
    }
    if (self->_vertexArrayObjectHandle)
    {
      glDeleteBuffers(1, &self->_vertexArrayObjectHandle);
      self->_vertexArrayObjectHandle = 0;
    }
    if (self->_framebufferHandle)
    {
      glDeleteFramebuffers(1, &self->_framebufferHandle);
      self->_framebufferHandle = 0;
    }
    if (self->_renderbufferHandle)
    {
      glDeleteRenderbuffers(1, &self->_renderbufferHandle);
      self->_renderbufferHandle = 0;
    }
    glFinish();
    [(SUICFlamesViewLegacy *)self _restoreCurrentContext];
  }
}

- (BOOL)_resizeFromLayer:(id)a3
{
  id v4 = a3;
  if ([(SUICFlamesViewLegacy *)self isRenderingEnabled])
  {
    glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
    BOOL v5 = !glGetError()
      && [(EAGLContext *)self->_eaglContext renderbufferStorage:36161 fromDrawable:v4]&& (glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &self->_viewWidth), !glGetError())&& (glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &self->_viewHeight), !glGetError())&& glCheckFramebufferStatus(0x8D40u) == 36053;
    glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateOrthoProjection
{
  if ([(SUICFlamesViewLegacy *)self isRenderingEnabled])
  {
    GLsizei viewWidth = self->_viewWidth;
    GLsizei viewHeight = self->_viewHeight;
    glViewport(0, 0, viewWidth, viewHeight);
  }
}

- (void)layoutSubviews
{
  [(SUICFlamesViewLegacy *)self _setCurrentContext];
  if (self->_isInitialized)
  {
    BOOL v3 = [(SUICFlamesViewLegacy *)self layer];
    [(SUICFlamesViewLegacy *)self _resizeFromLayer:v3];
  }
  else
  {
    self->_isInitialized = [(SUICFlamesViewLegacy *)self _initGLAndSetupDisplayLink:1];
  }
  [(SUICFlamesViewLegacy *)self _updateOrthoProjection];

  [(SUICFlamesViewLegacy *)self _restoreCurrentContext];
}

- (double)_currentDisplayScale
{
  BOOL v3 = [(SUICFlamesViewLegacy *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 < 1.0)
  {
    [(UIScreen *)self->_screen scale];
    double v5 = v6;
  }
  BOOL v7 = [(SUICFlamesViewLegacy *)self _deviceNeeds2xFlamesWithCurrentScale:v5];
  double result = 2.0;
  if (!v7) {
    return v5;
  }
  return result;
}

- (BOOL)_deviceNeeds2xFlamesWithCurrentScale:(double)a3
{
  if (_deviceNeeds2xFlamesWithCurrentScale__onceToken != -1) {
    dispatch_once(&_deviceNeeds2xFlamesWithCurrentScale__onceToken, &__block_literal_global_69);
  }
  return a3 == 3.0 && _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames != 0;
}

uint64_t __61__SUICFlamesViewLegacy__deviceNeeds2xFlamesWithCurrentScale___block_invoke()
{
  uint64_t result = MGGetProductType();
  _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames = result == 1737882206;
  return result;
}

- (void)_tearDownDisplayLink
{
  self->_int64_t state = 4;
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (BOOL)inSiriMode
{
  return [(SUICFlamesViewLegacy *)self mode] == 0;
}

- (BOOL)inDictationMode
{
  return [(SUICFlamesViewLegacy *)self mode] == 1;
}

- (void)stopRenderingAndCleanupGL
{
  [(SUICFlamesViewLegacy *)self _tearDownDisplayLink];

  [(SUICFlamesViewLegacy *)self _cleanupGL];
}

- (BOOL)isRenderingEnabled
{
  return [(NSMutableSet *)self->_renderingDisabledReasons count] == 0;
}

- (BOOL)_isOriginatingProcessInBackground
{
  return 0;
}

- (void)_updateCurveLayer:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_currentFlameGroup
    || !self->_isInitialized
    || ![(SUICFlamesViewLegacy *)self isRenderingEnabled])
  {
    goto LABEL_69;
  }
  double v5 = [(SUICFlamesViewLegacy *)self layer];
  if (![v5 isDrawableAvailable]) {
    goto LABEL_68;
  }
  float v80 = v5;
  id v81 = v4;
  double v6 = [(SUICFlameGroup *)self->_currentFlameGroup transitionPhasePtr];
  BOOL v7 = [(SUICFlameGroup *)self->_currentFlameGroup stateModifiersPtr];
  v8.f32[0] = *v6;
  LODWORD(v9) = 1.0;
  float v79 = *v6;
  if (*v6 < 1.0)
  {
    double v9 = v79;
    switch(self->_state)
    {
      case 0:
        double v11 = v9 + self->_frameRateScalingFactor * 0.03;
        *(float *)&double v11 = v11;
        *(float *)&double v11 = fminf(*(float *)&v11, 1.0);
        *double v6 = *(float *)&v11;
        *BOOL v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA20, *v7), *(float *)&v11);
        levelSmoother = self->_levelSmoother;
        LODWORD(v11) = 1064514355;
        goto LABEL_9;
      case 1:
        double v11 = v9 + self->_frameRateScalingFactor * 0.03;
        *(float *)&double v11 = v11;
        *(float *)&double v11 = fminf(*(float *)&v11, 1.0);
        *double v6 = *(float *)&v11;
        *BOOL v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA10, *v7), *(float *)&v11);
        levelSmoother = self->_levelSmoother;
        LODWORD(v11) = 1063675494;
LABEL_9:
        [(SUICAudioLevelSmoother *)levelSmoother setDecaySpeed:v11];
        break;
      case 2:
        double v9 = v9 + self->_frameRateScalingFactor * 0.02;
        *(float *)&double v9 = v9;
        *(float *)&double v9 = fminf(*(float *)&v9, 1.0);
        *double v6 = *(float *)&v9;
        float32x4_t v8 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A64FBA00, *v7), *(float *)&v9);
        *BOOL v7 = v8;
        break;
      case 4:
        v8.i64[0] = *(void *)&self->_frameRateScalingFactor;
        double v9 = v9 + *(double *)v8.i64 * 0.03;
        *(float *)&double v9 = v9;
        v8.i32[0] = 1.0;
        *(float *)&double v9 = fminf(*(float *)&v9, 1.0);
        *double v6 = *(float *)&v9;
        *BOOL v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)0, *v7), *(float *)&v9);
        *(float *)&double v9 = *v6;
        if (*v6 == 1.0) {
          -[SUICFlamesViewLegacy setHidden:](self, "setHidden:", 1, v9);
        }
        break;
      default:
        break;
    }
  }
  float v12 = 0.0;
  if (self->_state == 1)
  {
    [(SUICFlamesViewLegacy *)self _currentMicPowerLevel];
    float v12 = v13;
  }
  [(SUICFlamesViewLegacy *)self _setCurrentContext];
  [(CADisplayLink *)self->_displayLink duration];
  double v15 = v14;
  glClear(0x4000u);
  double horizontalScaleFactor = self->_horizontalScaleFactor;
  double v17 = horizontalScaleFactor * self->_activeFrame.size.width;
  *(float *)&double horizontalScaleFactor = self->_activeFrame.origin.x * horizontalScaleFactor;
  GLfloat y = self->_activeFrame.origin.y;
  GLfloat v19 = v17;
  *(float *)&double v17 = self->_activeFrame.size.height;
  glVertexAttrib4f(2u, *(GLfloat *)&horizontalScaleFactor, y, v19, *(GLfloat *)&v17);
  GLfloat viewWidth = (float)self->_viewWidth;
  GLfloat viewHeight = (float)self->_viewHeight;
  [(SUICFlamesViewLegacy *)self _currentDisplayScale];
  GLfloat v23 = v22;
  glVertexAttrib4f(1u, viewWidth, viewHeight, v23, self->_dictationUnitSize);
  if (self->_mode == 1)
  {
    GLfloat dictationRedColor = self->_dictationRedColor;
    GLfloat dictationGreenColor = self->_dictationGreenColor;
    GLfloat dictationBlueColor = self->_dictationBlueColor;
    glVertexAttrib3f(5u, dictationRedColor, dictationGreenColor, dictationBlueColor);
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v78 = 520;
  id obj = self->_flameGroups;
  uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v91 count:16];
  v84 = v27;
  if (!v28)
  {
    int v83 = 0;
    goto LABEL_60;
  }
  uint64_t v29 = v28;
  int v83 = 0;
  float v30 = v15;
  uint64_t v31 = *(void *)v88;
  double v32 = v30;
  double v86 = v30 * 0.5;
  float32x2_t v82 = (float32x2_t)vdup_n_s32(0x25800000u);
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v88 != v31) {
        objc_enumerationMutation(obj);
      }
      double v34 = *(void **)(*((void *)&v87 + 1) + 8 * v33);
      unsigned int v35 = (float32x4_t *)objc_msgSend(v34, "stateModifiersPtr", v78);
      if (!self->_freezesAura || ([v34 isAura] & 1) == 0)
      {
        BOOL reduceMotionEnabled = self->_reduceMotionEnabled;
        double frameRateScalingFactor = self->_frameRateScalingFactor;
        [v34 stateTime];
        double v39 = v38;
        double v40 = v86;
        if (reduceMotionEnabled)
        {
          double v41 = 0.1;
        }
        else
        {
          double v40 = v32;
          double v41 = 0.25;
        }
        if (reduceMotionEnabled) {
          double v42 = v12 * 0.5 + 0.1;
        }
        else {
          double v42 = v12 * 2.0 + 0.25;
        }
        double v43 = v39 + v40 * frameRateScalingFactor;
        *(float *)&double v43 = v43;
        [v34 setStateTime:v43];
        double v44 = v41 * v35->f32[2] + v42 * (float)(v35->f32[0] + v35->f32[1]) + v35->f32[3] * 0.05;
        [v34 zTime];
        double v46 = v45 + v32 * v44;
        *(float *)&double v46 = v46;
        [v34 setZTime:v46];
      }
      if ([v34 isDyingOff])
      {
        [v34 globalAlpha];
        *(float *)&double v47 = *(float *)&v47 + -0.03;
        if (*(float *)&v47 < 0.0) {
          *(float *)&double v47 = 0.0;
        }
        [v34 setGlobalAlpha:v47];
      }
      if (![v34 isAura] || self->_mode)
      {
        GLsizei numAuraIndicesCulled = 0;
LABEL_38:
        uint64_t numAuraIndices = 0;
        goto LABEL_39;
      }
      float32x2_t v65 = (float *)[v34 transitionPhasePtr];
      if (*v65 >= 1.0)
      {
        uint64_t numAuraIndices = self->_numAuraIndices;
        GLsizei numAuraIndicesCulled = self->_numAuraIndicesCulled;
        int v83 = 1;
      }
      else
      {
        uint64_t numAuraIndices = 0;
        float v66 = *v65 + dbl_1A64FBA30[!self->_reduceMotionEnabled] * self->_frameRateScalingFactor;
        float v67 = fminf(v66, 1.0);
        *float32x2_t v65 = v67;
        int8x16_t v68 = (int8x16_t)vmlaq_n_f32(*v35, vsubq_f32((float32x4_t)xmmword_1A64FBA40, *v35), v67);
        *unsigned int v35 = (float32x4_t)v68;
        GLsizei numAuraIndicesCulled = self->_numAuraIndices;
        if (*(float *)v68.i32 <= 2.2204e-16)
        {
          v69.i32[1] = v68.i32[1];
          v69.i32[0] = vextq_s8(v68, v68, 8uLL).u32[0];
          int8x8_t v70 = vmvn_s8((int8x8_t)vcge_f32(v82, v69));
          if ((v70.i8[4] & 1) == 0 && (v70.i8[0] & 1) == 0)
          {
            if (*(float *)&v68.i32[3] + 2.22044605e-16 < 1.0) {
              goto LABEL_38;
            }
            int v71 = [(SUICFlamesViewLegacy *)self flamesDelegate];
            char v72 = objc_opt_respondsToSelector();

            if (v72)
            {
              int32x2_t v73 = [(SUICFlamesViewLegacy *)self flamesDelegate];
              [v73 flamesViewAuraDidDisplay:self];
            }
            uint64_t numAuraIndices = 0;
            id v27 = v84;
          }
        }
      }
LABEL_39:
      float v50 = v35->f32[3];
      if (self->_reduceMotionEnabled)
      {
        if (v50 > 0.5) {
          goto LABEL_41;
        }
      }
      else if (v50 > 0.0)
      {
LABEL_41:
        glUseProgram(self->_auraProgramHandle);
        glVertexAttrib4f(4u, v35->f32[0], v35->f32[1], v35->f32[2], v35->f32[3]);
        [v34 stateTime];
        GLfloat v52 = v51;
        [v34 zTime];
        GLfloat v54 = v53;
        [v34 globalAlpha];
        glVertexAttrib4f(3u, v52, v54, v12, v55);
        glDrawElements(4u, numAuraIndicesCulled, 0x1405u, (const GLvoid *)(4 * numAuraIndices));
        glUseProgram(self->_flameProgramHandle);
        goto LABEL_44;
      }
      GLsizei numWaveIndices = self->_numWaveIndices;
      unsigned int v57 = self->_numAuraIndicesCulled + self->_numAuraIndices;
      glVertexAttrib4f(4u, v35->f32[0], v35->f32[1], v35->f32[2], v50);
      [v34 stateTime];
      GLfloat v59 = v58;
      [v34 zTime];
      GLfloat v61 = v60;
      [v34 globalAlpha];
      glVertexAttrib4f(3u, v59, v61, v12, v62);
      uint64_t v63 = (const GLvoid *)(4 * v57);
      id v27 = v84;
      glDrawElements(4u, numWaveIndices, 0x1405u, v63);
LABEL_44:
      [v34 globalAlpha];
      if (v64 == 0.0) {
        [v27 addObject:v34];
      }
      ++v33;
    }
    while (v29 != v33);
    uint64_t v74 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v91 count:16];
    uint64_t v29 = v74;
  }
  while (v74);
LABEL_60:

  if ([v27 count]) {
    [*(id *)((char *)&self->super.super.super.isa + v78) removeObjectsInArray:v27];
  }
  glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
  [(EAGLContext *)self->_eaglContext presentRenderbuffer:36161];
  [(SUICFlamesViewLegacy *)self _restoreCurrentContext];
  double v5 = v80;
  id v4 = v81;
  if (!self->_transitionFinished)
  {
    LODWORD(v75) = 1.0;
    *(float *)&double v76 = v79;
    int v77 = v79 >= 1.0;
    if (self->_freezesAura) {
      v77 &= v83;
    }
    if (v77 == 1)
    {
      self->_transitionFinished = 1;
      [(SUICFlamesViewLegacy *)self _didFinishTransition];
    }
  }

LABEL_68:
LABEL_69:
}

+ (id)_indexCache
{
  if (_indexCache_onceToken != -1) {
    dispatch_once(&_indexCache_onceToken, &__block_literal_global_73);
  }
  float64x2_t v2 = (void *)_indexCache_sIndexCache;

  return v2;
}

uint64_t __35__SUICFlamesViewLegacy__indexCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_indexCache_sIndexCache;
  _indexCache_sIndexCache = (uint64_t)v0;

  float64x2_t v2 = (void *)_indexCache_sIndexCache;
  uint64_t v3 = sIndexCacheSize;

  return [v2 setCountLimit:v3];
}

+ (void)setIndexCacheSize:(unint64_t)a3
{
  sIndexCacheSize = a3;
  id v3 = [a1 _indexCache];
  [v3 setCountLimit:sIndexCacheSize];
}

- (float)_currentMicPowerLevel
{
  id v3 = [(SUICFlamesViewLegacy *)self flamesDelegate];
  [v3 audioLevelForFlamesView:self];
  int v5 = v4;

  LODWORD(v6) = v5;
  [(SUICAudioLevelSmoother *)self->_levelSmoother smoothedLevelForMicPower:v6];
  return v7 * 0.95 + 0.05;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICFlamesViewLegacy;
  [(SUICFlamesViewLegacy *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    int v5 = [(SUICFlamesViewLegacy *)self traitCollection];
    [v5 displayScale];
    double v7 = v6;
    [v4 displayScale];
    if (v7 != v8)
    {
      [(SUICFlamesViewLegacy *)self resetAndReinitialize:1];
      [(SUICFlamesViewLegacy *)self _setValuesForFidelity:self->_fidelity];
      [(SUICFlamesViewLegacy *)self setNeedsLayout];
    }
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)state
{
  return self->_state;
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

- (double)horizontalScaleFactor
{
  return self->_horizontalScaleFactor;
}

- (BOOL)showAura
{
  return self->_showAura;
}

- (void)setShowAura:(BOOL)a3
{
  self->_showAura = a3;
}

- (BOOL)freezesAura
{
  return self->_freezesAura;
}

- (void)setFreezesAura:(BOOL)a3
{
  self->_freezesAura = a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (SUICFlamesViewProvidingDelegate)flamesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);

  return (SUICFlamesViewProvidingDelegate *)WeakRetained;
}

- (UIColor)dictationColor
{
  return self->_dictationColor;
}

- (BOOL)renderInBackground
{
  return self->_renderInBackground;
}

- (BOOL)accelerateTransitions
{
  return self->_accelerateTransitions;
}

- (void)setAccelerateTransitions:(BOOL)a3
{
  self->_accelerateTransitions = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationColor, 0);
  objc_destroyWeak((id *)&self->_flamesDelegate);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_currentFlameGroup, 0);
  objc_storeStrong((id *)&self->_flameGroups, 0);
  objc_storeStrong((id *)&self->_renderingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
  objc_storeStrong((id *)&self->_eaglContext, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)_setupVertexBuffer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SUICFlamesViewLegacy _setupVertexBuffer]";
  __int16 v4 = 1024;
  BOOL v5 = a1 != 0;
  _os_log_debug_impl(&dword_1A64CC000, a2, OS_LOG_TYPE_DEBUG, "%s Vertex buffer data cached: %d", (uint8_t *)&v2, 0x12u);
}

@end