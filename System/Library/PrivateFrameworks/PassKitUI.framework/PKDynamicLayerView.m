@interface PKDynamicLayerView
- (BOOL)automaticallyLoadContent;
- (BOOL)isLoaded;
- (BOOL)isMotionEnabled;
- (BOOL)isPaused;
- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4;
- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4 automaticallyLoadContent:(BOOL)a5;
- (id)_configureMotionEffectGroupForCrossDissolveConfiguration:(id)a3;
- (id)_dimmingLayerAnimationWithDuration:(double)a3;
- (void)_addParallaxAndMotionEffects;
- (void)_addRadialMaskEffectsToView:(id)a3;
- (void)_configureDynamicViewsWithImageSet:(id)a3;
- (void)_configureViews;
- (void)_removeParallaxMotionEffect;
- (void)_updateVisibility;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)loadContent;
- (void)runTransactionEffect;
- (void)setAutomaticallyLoadContent:(BOOL)a3;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PKDynamicLayerView

- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  return -[PKDynamicLayerView initWithFrame:pass:automaticallyLoadContent:](self, "initWithFrame:pass:automaticallyLoadContent:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4 automaticallyLoadContent:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PKDynamicLayerView;
  v13 = -[PKDynamicLayerView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_pass = (id *)&v13->_pass;
    objc_storeStrong((id *)&v13->_pass, a4);
    v16 = [*p_pass paymentPass];
    uint64_t v17 = [v16 dynamicLayerConfiguration];
    dynamicLayerConfiguration = v14->_dynamicLayerConfiguration;
    v14->_dynamicLayerConfiguration = (PKDynamicLayerConfiguration *)v17;

    uint64_t v19 = [(PKDynamicLayerConfiguration *)v14->_dynamicLayerConfiguration transactionEffect];
    transactionEffectConfiguration = v14->_transactionEffectConfiguration;
    v14->_transactionEffectConfiguration = (PKDynamicLayerTransactionEffectConfiguration *)v19;

    uint64_t v21 = [(PKDynamicLayerConfiguration *)v14->_dynamicLayerConfiguration crossDissolve];
    crossDissolveConfiguration = v14->_crossDissolveConfiguration;
    v14->_crossDissolveConfiguration = (PKDynamicLayerCrossDissolveConfiguration *)v21;

    v14->_automaticallyLoadContent = a5;
    v14->_loaded = 0;
    [*p_pass style];
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    v14->_parallaxOffset.horizontal = v23;
    PKFloatRoundToPixel();
    v14->_parallaxOffset.vertical = v24;
    if (v14->_automaticallyLoadContent) {
      [(PKDynamicLayerView *)v14 loadContent];
    }
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v14 selector:sel__updateVisibility name:*MEMORY[0x1E4FB2498] object:0];

    if (([(PKDynamicLayerConfiguration *)v14->_dynamicLayerConfiguration isSupported] & 1) == 0)
    {
      v26 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *MEMORY[0x1E4F871E0];
        uint64_t v28 = [(PKDynamicLayerConfiguration *)v14->_dynamicLayerConfiguration version];
        *(_DWORD *)buf = 134218240;
        uint64_t v32 = v27;
        __int16 v33 = 2048;
        uint64_t v34 = v28;
        _os_log_impl(&dword_19F450000, v26, OS_LOG_TYPE_DEFAULT, "Using static fallback asset for dynamic pass. Client supported dynamic layer configuration version: %lu pass's version: %lu", buf, 0x16u);
      }
    }
  }

  return v14;
}

- (void)loadContent
{
  if (!self->_loaded)
  {
    if (self->_automaticallyLoadContent) {
      [(PKPass *)self->_pass loadImageSetSync:0 preheat:1];
    }
    [(PKDynamicLayerView *)self _configureViews];
  }
}

- (void)dealloc
{
  [(PKDynamicLayerView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKDynamicLayerView;
  [(PKDynamicLayerView *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKDynamicContentView *)self->_foregroundParallaxView invalidate];
    [(PKDynamicContentView *)self->_neutralView invalidate];
    [(PKDynamicContentView *)self->_backgroundParallaxView invalidate];
    [(PKDynamicContentView *)self->_staticOverlayView invalidate];
    [(CALayer *)self->_dimmingLayer removeAllAnimations];
    [(CALayer *)self->_dimmingLayer removeFromSuperlayer];
    dimmingLayer = self->_dimmingLayer;
    self->_dimmingLayer = 0;

    [(CAEmitterLayer *)self->_transactionEffectLayer removeAllAnimations];
    [(CAEmitterLayer *)self->_transactionEffectLayer removeFromSuperlayer];
    transactionEffectLayer = self->_transactionEffectLayer;
    self->_transactionEffectLayer = 0;

    [(PKDynamicLayerView *)self _removeParallaxMotionEffect];
  }
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)PKDynamicLayerView;
  [(PKDynamicLayerView *)&v43 layoutSubviews];
  [(PKDynamicLayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIImageView *)self->_staticFallbackView image];
  [v11 size];

  PKSizeAspectFit();
  staticFallbackView = self->_staticFallbackView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](staticFallbackView, "setFrame:");
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  if ([(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration parallaxEnabled])
  {
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    PKSizeAlignedInRect();
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
    double v16 = v20;
  }
  -[PKDynamicContentView setFrame:](self->_backgroundParallaxView, "setFrame:", v13, v14, v15, v16);
  -[UIImageView setFrame:](self->_backgroundParallaxCrossDissolveView, "setFrame:", v13, v14, v15, v16);
  -[PKDynamicContentView setFrame:](self->_neutralView, "setFrame:", v4, v6, v8, v10);
  -[PKDynamicContentView setFrame:](self->_foregroundParallaxView, "setFrame:", v13, v14, v15, v16);
  -[UIImageView setFrame:](self->_foregroundParallaxCrossDissolveView, "setFrame:", v13, v14, v15, v16);
  -[PKDynamicContentView setFrame:](self->_staticOverlayView, "setFrame:", v4, v6, v8, v10);
  [(UIImageView *)self->_backgroundParallaxCrossDissolveView bounds];
  PKFloatRoundToPixel();
  PKSizeAlignedInRect();
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(UIImageView *)self->_backgroundParallaxCrossDissolveView maskView];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
  backgroundRadialGradientLayer = self->_backgroundRadialGradientLayer;
  [v29 bounds];
  -[CAGradientLayer setFrame:](backgroundRadialGradientLayer, "setFrame:");
  [(UIImageView *)self->_foregroundParallaxCrossDissolveView bounds];
  PKFloatRoundToPixel();
  PKSizeAlignedInRect();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(UIImageView *)self->_foregroundParallaxCrossDissolveView maskView];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);
  foregroundRadialGradientLayer = self->_foregroundRadialGradientLayer;
  [v39 bounds];
  -[CAGradientLayer setFrame:](foregroundRadialGradientLayer, "setFrame:");
  dimmingLayer = self->_dimmingLayer;
  if (dimmingLayer)
  {
    -[CALayer setFrame:](dimmingLayer, "setFrame:", v4, v6, v8, v10);
    -[CALayer setPosition:](self->_dimmingLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  }
  transactionEffectLayer = self->_transactionEffectLayer;
  if (transactionEffectLayer)
  {
    -[CAEmitterLayer setFrame:](transactionEffectLayer, "setFrame:", v4, v6, v8, v10);
    -[CAEmitterLayer setPosition:](self->_transactionEffectLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
    -[PKDynamicLayerTransactionEffectConfiguration configureTransactionEffectEmitterLayer:withBounds:](self->_transactionEffectConfiguration, "configureTransactionEffectEmitterLayer:withBounds:", self->_transactionEffectLayer, v4, v6, v8, v10);
  }
}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    [(PKDynamicLayerView *)self _updateVisibility];
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setAutomaticallyLoadContent:(BOOL)a3
{
  if (((!self->_automaticallyLoadContent ^ a3) & 1) == 0)
  {
    self->_automaticallyLoadContent = a3;
    [(PKDynamicLayerView *)self loadContent];
  }
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (((!self->_motionEnabled ^ a3) & 1) == 0)
  {
    self->_motionEnabled = a3;
    [(PKDynamicLayerView *)self _updateVisibility];
  }
}

- (void)_configureViews
{
  id v9 = [(PKPass *)self->_pass frontFaceImageSet];
  if (!self->_staticFallbackView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v4 = (void *)MEMORY[0x1E4FB1818];
    double v5 = [v9 dynamicLayerStaticFallbackImage];
    double v6 = [v4 imageWithPKImage:v5];
    double v7 = (UIImageView *)[v3 initWithImage:v6];
    staticFallbackView = self->_staticFallbackView;
    self->_staticFallbackView = v7;

    [(UIImageView *)self->_staticFallbackView setContentMode:1];
    [(PKDynamicLayerView *)self addSubview:self->_staticFallbackView];
  }
  [(PKDynamicLayerView *)self _configureDynamicViewsWithImageSet:v9];
  self->_loaded = 1;
  [(PKDynamicLayerView *)self _updateVisibility];
}

- (void)_configureDynamicViewsWithImageSet:(id)a3
{
  id v85 = a3;
  uint64_t v4 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration backgroundParallaxEmitter];
  uint64_t v5 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration neutralEmitter];
  double v6 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration foregroundParallaxEmitter];
  v84 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration staticOverlayEmitter];
  double v7 = (void *)MEMORY[0x1E4FB1818];
  double v8 = [v85 backgroundParallaxImage];
  uint64_t v9 = [v7 imageWithPKImage:v8];

  if (v4)
  {
    double v10 = (void *)MEMORY[0x1E4FB1818];
    v11 = [v85 backgroundParallaxEmitterImage];
    uint64_t v12 = [v10 imageWithPKImage:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (!self->_backgroundParallaxView)
  {
    double v13 = [[PKDynamicContentView alloc] initWithImage:v9 emitterImage:v12 dynamicLayerEmitterConfiguration:v4];
    backgroundParallaxView = self->_backgroundParallaxView;
    self->_backgroundParallaxView = v13;

    [(PKDynamicLayerView *)self addSubview:self->_backgroundParallaxView];
  }
  v80 = (void *)v12;
  v83 = (void *)v4;
  double v15 = (void *)MEMORY[0x1E4FB1818];
  double v16 = [v85 backgroundParallaxCrossDissolveImage];
  uint64_t v17 = [v15 imageWithPKImage:v16];

  if (v9
    && self->_backgroundParallaxView
    && v17
    && !self->_backgroundParallaxCrossDissolveView
    && self->_crossDissolveConfiguration)
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v19 = (void *)MEMORY[0x1E4FB1818];
    double v20 = [v85 backgroundParallaxCrossDissolveImage];
    double v21 = [v19 imageWithPKImage:v20];
    double v22 = (UIImageView *)[v18 initWithImage:v21];
    backgroundParallaxCrossDissolveView = self->_backgroundParallaxCrossDissolveView;
    self->_backgroundParallaxCrossDissolveView = v22;

    [(UIImageView *)self->_backgroundParallaxCrossDissolveView setContentMode:1];
    if (!self->_backgroundRadialGradientLayer)
    {
      RadialGradientLayer();
      double v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      backgroundRadialGradientLayer = self->_backgroundRadialGradientLayer;
      self->_backgroundRadialGradientLayer = v24;

      id v26 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v27 = [v26 layer];
      [v27 addSublayer:self->_backgroundRadialGradientLayer];

      [(UIImageView *)self->_backgroundParallaxCrossDissolveView setMaskView:v26];
    }
    [(PKDynamicLayerView *)self addSubview:self->_backgroundParallaxCrossDissolveView];
  }
  double v28 = (void *)MEMORY[0x1E4FB1818];
  v29 = [v85 neutralImage];
  uint64_t v30 = [v28 imageWithPKImage:v29];

  if (v5)
  {
    double v31 = (void *)MEMORY[0x1E4FB1818];
    double v32 = [v85 neutralEmitterImage];
    uint64_t v33 = [v31 imageWithPKImage:v32];
  }
  else
  {
    uint64_t v33 = 0;
  }
  if (!self->_neutralView)
  {
    double v34 = [[PKDynamicContentView alloc] initWithImage:v30 emitterImage:v33 dynamicLayerEmitterConfiguration:v5];
    neutralView = self->_neutralView;
    self->_neutralView = v34;

    [(PKDynamicLayerView *)self addSubview:self->_neutralView];
  }
  v81 = (void *)v9;
  v82 = (void *)v5;
  double v36 = (void *)MEMORY[0x1E4FB1818];
  double v37 = [v85 foregroundParallaxImage];
  double v38 = [v36 imageWithPKImage:v37];

  v78 = (void *)v30;
  if (v6)
  {
    v39 = (void *)MEMORY[0x1E4FB1818];
    v40 = [v85 foregroundParallaxEmitterImage];
    v41 = [v39 imageWithPKImage:v40];
  }
  else
  {
    v41 = 0;
  }
  v79 = (void *)v17;
  if (!self->_foregroundParallaxView)
  {
    v42 = [[PKDynamicContentView alloc] initWithImage:v38 emitterImage:v41 dynamicLayerEmitterConfiguration:v6];
    foregroundParallaxView = self->_foregroundParallaxView;
    self->_foregroundParallaxView = v42;

    [(PKDynamicLayerView *)self addSubview:self->_foregroundParallaxView];
  }
  v44 = (void *)MEMORY[0x1E4FB1818];
  v45 = [v85 foregroundParallaxCrossDissolveImage];
  v46 = [v44 imageWithPKImage:v45];

  v47 = (void *)v33;
  if (v38
    && self->_foregroundParallaxView
    && v46
    && !self->_foregroundParallaxCrossDissolveView
    && self->_crossDissolveConfiguration)
  {
    id v48 = objc_alloc(MEMORY[0x1E4FB1838]);
    v49 = (void *)MEMORY[0x1E4FB1818];
    v50 = [v85 foregroundParallaxCrossDissolveImage];
    v51 = [v49 imageWithPKImage:v50];
    v52 = (UIImageView *)[v48 initWithImage:v51];
    foregroundParallaxCrossDissolveView = self->_foregroundParallaxCrossDissolveView;
    self->_foregroundParallaxCrossDissolveView = v52;

    [(UIImageView *)self->_foregroundParallaxCrossDissolveView setContentMode:1];
    if (!self->_foregroundRadialGradientLayer)
    {
      RadialGradientLayer();
      v54 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      foregroundRadialGradientLayer = self->_foregroundRadialGradientLayer;
      self->_foregroundRadialGradientLayer = v54;

      id v56 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v57 = [v56 layer];
      [v57 addSublayer:self->_foregroundRadialGradientLayer];

      [(UIImageView *)self->_foregroundParallaxCrossDissolveView setMaskView:v56];
    }
    [(PKDynamicLayerView *)self addSubview:self->_foregroundParallaxCrossDissolveView];
  }
  v58 = (void *)MEMORY[0x1E4FB1818];
  v59 = [v85 staticOverlayImage];
  v60 = [v58 imageWithPKImage:v59];

  if (v84)
  {
    v61 = (void *)MEMORY[0x1E4FB1818];
    v62 = [v85 staticOverlayEmitterImage];
    v63 = [v61 imageWithPKImage:v62];
  }
  else
  {
    v63 = 0;
  }
  if (!self->_staticOverlayView)
  {
    v64 = [[PKDynamicContentView alloc] initWithImage:v60 emitterImage:v63 dynamicLayerEmitterConfiguration:v84];
    staticOverlayView = self->_staticOverlayView;
    self->_staticOverlayView = v64;

    [(PKDynamicLayerView *)self addSubview:self->_staticOverlayView];
  }
  v66 = (void *)MEMORY[0x1E4FB1818];
  v67 = [v85 transactionEffectEmitterImage];
  v68 = [v66 imageWithPKImage:v67];
  transactionEffectEmitterImage = self->_transactionEffectEmitterImage;
  self->_transactionEffectEmitterImage = v68;

  v70 = [v85 transactionEffectEmitterShapeSVGData];
  transactionEffectShapeData = self->_transactionEffectShapeData;
  self->_transactionEffectShapeData = v70;

  if (!self->_dimmingLayer)
  {
    v72 = [MEMORY[0x1E4F39BE8] layer];
    dimmingLayer = self->_dimmingLayer;
    self->_dimmingLayer = v72;

    v74 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithWhite:0.0 alpha:0.5];
    v75 = self->_dimmingLayer;
    id v76 = v74;
    -[CALayer setBackgroundColor:](v75, "setBackgroundColor:", [v76 CGColor]);
    [(CALayer *)self->_dimmingLayer setOpacity:0.0];
    v77 = [(PKDynamicLayerView *)self layer];
    [v77 addSublayer:self->_dimmingLayer];
  }
}

- (void)_updateVisibility
{
  int v3 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration isSupported];
  int v4 = v3 & !UIAccessibilityIsReduceMotionEnabled();
  if (self->_motionEnabled) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  self->_effectiveMotionEnabled = v5;
  [(PKDynamicContentView *)self->_backgroundParallaxView setHidden:!v5];
  [(UIImageView *)self->_backgroundParallaxCrossDissolveView setHidden:!self->_effectiveMotionEnabled];
  [(PKDynamicContentView *)self->_neutralView setHidden:!self->_effectiveMotionEnabled];
  [(PKDynamicContentView *)self->_foregroundParallaxView setHidden:!self->_effectiveMotionEnabled];
  [(UIImageView *)self->_foregroundParallaxCrossDissolveView setHidden:!self->_effectiveMotionEnabled];
  [(PKDynamicContentView *)self->_staticOverlayView setHidden:!self->_effectiveMotionEnabled];
  [(UIImageView *)self->_staticFallbackView setHidden:self->_effectiveMotionEnabled];
  if (self->_paused || !self->_effectiveMotionEnabled) {
    [(PKDynamicLayerView *)self _removeParallaxMotionEffect];
  }
  else {
    [(PKDynamicLayerView *)self _addParallaxAndMotionEffects];
  }
  [(PKDynamicContentView *)self->_backgroundParallaxView setPaused:self->_paused];
  [(PKDynamicContentView *)self->_neutralView setPaused:self->_paused];
  [(PKDynamicContentView *)self->_foregroundParallaxView setPaused:self->_paused];
  staticOverlayView = self->_staticOverlayView;
  BOOL paused = self->_paused;

  [(PKDynamicContentView *)staticOverlayView setPaused:paused];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKDynamicLayerView;
  [(PKDynamicLayerView *)&v4 didMoveToWindow];
  int v3 = [(PKDynamicLayerView *)self window];

  if (v3) {
    [(PKDynamicLayerView *)self _updateVisibility];
  }
  else {
    [(PKDynamicLayerView *)self _removeParallaxMotionEffect];
  }
}

- (void)_addParallaxAndMotionEffects
{
  int v3 = [(PKDynamicLayerView *)self window];

  if (v3)
  {
    if ([(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration parallaxEnabled])
    {
      if (!self->_bottomEffect)
      {
        objc_super v4 = (_UIParallaxMotionEffect *)objc_alloc_init(MEMORY[0x1E4FB2220]);
        bottomEffect = self->_bottomEffect;
        self->_bottomEffect = v4;

        -[_UIParallaxMotionEffect setSlideMagnitude:](self->_bottomEffect, "setSlideMagnitude:", -self->_parallaxOffset.horizontal, -self->_parallaxOffset.vertical);
        [(PKDynamicContentView *)self->_backgroundParallaxView addMotionEffect:self->_bottomEffect];
        if (self->_crossDissolveConfiguration) {
          [(UIImageView *)self->_backgroundParallaxCrossDissolveView addMotionEffect:self->_bottomEffect];
        }
      }
      if (!self->_topEffect)
      {
        double v6 = (_UIParallaxMotionEffect *)objc_alloc_init(MEMORY[0x1E4FB2220]);
        topEffect = self->_topEffect;
        self->_topEffect = v6;

        -[_UIParallaxMotionEffect setSlideMagnitude:](self->_topEffect, "setSlideMagnitude:", self->_parallaxOffset.horizontal, self->_parallaxOffset.vertical);
        [(PKDynamicContentView *)self->_foregroundParallaxView addMotionEffect:self->_topEffect];
        if (self->_crossDissolveConfiguration) {
          [(UIImageView *)self->_foregroundParallaxCrossDissolveView addMotionEffect:self->_topEffect];
        }
      }
    }
    if (self->_crossDissolveConfiguration)
    {
      double v8 = [(UIImageView *)self->_backgroundParallaxCrossDissolveView maskView];
      [(PKDynamicLayerView *)self _addRadialMaskEffectsToView:v8];

      id v9 = [(UIImageView *)self->_foregroundParallaxCrossDissolveView maskView];
      [(PKDynamicLayerView *)self _addRadialMaskEffectsToView:v9];
    }
  }
}

- (void)_addRadialMaskEffectsToView:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!self->_radialMaskEffects)
  {
    BOOL v5 = [(PKDynamicLayerView *)self _configureMotionEffectGroupForCrossDissolveConfiguration:self->_crossDissolveConfiguration];
    radialMaskEffects = self->_radialMaskEffects;
    self->_radialMaskEffects = v5;

    id v4 = v9;
  }
  double v7 = [v4 motionEffects];
  uint64_t v8 = [v7 count];

  if (!v8) {
    [v9 addMotionEffect:self->_radialMaskEffects];
  }
}

- (id)_configureMotionEffectGroupForCrossDissolveConfiguration:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)MEMORY[0x1E4FB19B0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"layer.transform.translation.x" type:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"layer.transform.translation.y" type:1];
  uint64_t v8 = [v4 intensity];

  if (!v8)
  {
    [v6 setMinimumRelativeValue:&unk_1EF2B94F8];
    [v6 setMaximumRelativeValue:&unk_1EF2B9510];
    [v7 setMinimumRelativeValue:&unk_1EF2B94F8];
    [v7 setMaximumRelativeValue:&unk_1EF2B9510];
  }
  v11[0] = v6;
  v11[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v5 setMotionEffects:v9];

  return v5;
}

- (void)_removeParallaxMotionEffect
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PKDynamicLayerView__removeParallaxMotionEffect__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v2 options:0 animations:0.25 completion:0.0];
}

void __49__PKDynamicLayerView__removeParallaxMotionEffect__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 544))
  {
    objc_msgSend(*(id *)(v2 + 416), "removeMotionEffect:");
    [*(id *)(*(void *)(a1 + 32) + 424) removeMotionEffect:*(void *)(*(void *)(a1 + 32) + 544)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 544);
    *(void *)(v3 + 544) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 552))
  {
    objc_msgSend(*(id *)(v2 + 448), "removeMotionEffect:");
    [*(id *)(*(void *)(a1 + 32) + 456) removeMotionEffect:*(void *)(*(void *)(a1 + 32) + 552)];
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + 552);
    *(void *)(v5 + 552) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 560))
  {
    double v7 = [*(id *)(v2 + 424) maskView];
    [v7 removeMotionEffect:*(void *)(*(void *)(a1 + 32) + 560)];

    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 456) maskView];
    [v8 removeMotionEffect:*(void *)(*(void *)(a1 + 32) + 560)];

    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(v9 + 560);
    *(void *)(v9 + 560) = 0;
  }
}

- (void)runTransactionEffect
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration isSupported]
    && self->_transactionEffectConfiguration)
  {
    if (self->_transactionEffectLayer) {
      return;
    }
    uint64_t v3 = [MEMORY[0x1E4F39BB0] layer];
    transactionEffectLayer = self->_transactionEffectLayer;
    self->_transactionEffectLayer = v3;

    uint64_t v5 = [(PKDynamicLayerTransactionEffectConfiguration *)self->_transactionEffectConfiguration configureTransactionEffectEmitterLayer:self->_transactionEffectLayer withImage:[(UIImage *)self->_transactionEffectEmitterImage CGImage] andEmitterShapeData:self->_transactionEffectShapeData];
    if (v5)
    {
      objc_initWeak((id *)location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__PKDynamicLayerView_runTransactionEffect__block_invoke;
      void v11[3] = &unk_1E59CB100;
      objc_copyWeak(&v12, (id *)location);
      [v5 pkui_setCompletionHandler:v11];
      [v5 duration];
      double v6 = -[PKDynamicLayerView _dimmingLayerAnimationWithDuration:](self, "_dimmingLayerAnimationWithDuration:");
      double v7 = [(PKDynamicLayerView *)self layer];
      [v7 addSublayer:self->_transactionEffectLayer];

      [(CALayer *)self->_dimmingLayer addAnimation:v6 forKey:@"dimmingLayerFadeInFadeOut"];
      [(CAEmitterLayer *)self->_transactionEffectLayer addAnimation:v5 forKey:@"transactionEffectAnimation"];

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
    else
    {
      double v10 = self->_transactionEffectLayer;
      self->_transactionEffectLayer = 0;
    }
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *MEMORY[0x1E4F871E0];
      uint64_t v9 = [(PKDynamicLayerConfiguration *)self->_dynamicLayerConfiguration version];
      *(_DWORD *)location = 134218240;
      *(void *)&location[4] = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Boop Effect unsupported. Client supported dynamic layer configuration version: %lu pass's version: %lu", location, 0x16u);
    }
  }
}

void __42__PKDynamicLayerView_runTransactionEffect__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[66] removeFromSuperlayer];
    id v2 = v3[66];
    v3[66] = 0;

    WeakRetained = v3;
  }
}

- (id)_dimmingLayerAnimationWithDuration:(double)a3
{
  id v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v4 setDuration:a3];
  [v4 setKeyTimes:&unk_1EF2BA080];
  [v4 setValues:&unk_1EF2BA098];

  return v4;
}

- (BOOL)automaticallyLoadContent
{
  return self->_automaticallyLoadContent;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radialMaskEffects, 0);
  objc_storeStrong((id *)&self->_topEffect, 0);
  objc_storeStrong((id *)&self->_bottomEffect, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_transactionEffectLayer, 0);
  objc_storeStrong((id *)&self->_transactionEffectShapeData, 0);
  objc_storeStrong((id *)&self->_transactionEffectEmitterImage, 0);
  objc_storeStrong((id *)&self->_crossDissolveConfiguration, 0);
  objc_storeStrong((id *)&self->_transactionEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_dynamicLayerConfiguration, 0);
  objc_storeStrong((id *)&self->_staticFallbackView, 0);
  objc_storeStrong((id *)&self->_staticOverlayView, 0);
  objc_storeStrong((id *)&self->_foregroundRadialGradientLayer, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxCrossDissolveView, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxView, 0);
  objc_storeStrong((id *)&self->_neutralView, 0);
  objc_storeStrong((id *)&self->_backgroundRadialGradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxCrossDissolveView, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end