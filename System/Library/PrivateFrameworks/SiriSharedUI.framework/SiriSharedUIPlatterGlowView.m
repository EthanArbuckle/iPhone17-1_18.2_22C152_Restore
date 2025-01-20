@interface SiriSharedUIPlatterGlowView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SiriSharedUIPlatterGlowView)initWithFrame:(CGRect)a3;
- (id)_createILLayerWithPalette:(unint64_t)a3;
- (void)_createFadeLayerAnimation;
- (void)_createSiriGlowToPlatter:(CGRect)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateScreenSize;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cleanupViewHierarchy;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SiriSharedUIPlatterGlowView

- (void)_updateScreenSize
{
  v3 = [(SiriSharedUIPlatterGlowView *)self _screen];

  if (v3)
  {
    v4 = [(SiriSharedUIPlatterGlowView *)self _screen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13.receiver = self;
    v13.super_class = (Class)SiriSharedUIPlatterGlowView;
    -[SiriSharedUIPlatterGlowView setFrame:](&v13, sel_setFrame_, v6, v8, v10, v12);
    -[CALayer setFrame:](self->_colorLayer, "setFrame:", v6, v8, v10, v12);
    -[SUICIntelligentLightLayer setFrame:](self->_noiseLayer, "setFrame:", v6, v8, v10, v12);
    -[_UIIntelligenceSystemLightView setFrame:](self->_systemLightView, "setFrame:", v6, v8, v10, v12);
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIPlatterGlowView;
  [(SiriSharedUIPlatterGlowView *)&v4 didMoveToSuperview];
  v3 = [(SiriSharedUIPlatterGlowView *)self superview];

  if (v3) {
    [(SiriSharedUIPlatterGlowView *)self _updateScreenSize];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIPlatterGlowView;
  [(SiriSharedUIPlatterGlowView *)&v4 didMoveToWindow];
  v3 = [(SiriSharedUIPlatterGlowView *)self window];

  if (v3)
  {
    [(SiriSharedUIPlatterGlowView *)self _updateScreenSize];
    [(SiriSharedUIPlatterGlowView *)self _createFadeLayerAnimation];
  }
  else
  {
    [(SiriSharedUIPlatterGlowView *)self cleanupViewHierarchy];
  }
}

- (void)cleanupViewHierarchy
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  [(SUICIntelligentLightLayer *)self->_noiseLayer invalidate];
  [(SUICIntelligentLightLayer *)self->_noiseLayer removeFromSuperlayer];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = [(SiriSharedUIPlatterGlowView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v5);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v8 = self->_glowLayers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v12++) removeFromSuperlayer];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v10);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v13 = [(SiriSharedUIPlatterGlowView *)self layer];
  v14 = [v13 sublayers];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v18++) removeFromSuperlayer];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v16);
  }

  noiseLayer = self->_noiseLayer;
  self->_noiseLayer = 0;

  glowLayers = self->_glowLayers;
  self->_glowLayers = 0;

  systemLightView = self->_systemLightView;
  self->_systemLightView = 0;

  colorLayer = self->_colorLayer;
  self->_colorLayer = 0;

  edrLayer = self->_edrLayer;
  self->_edrLayer = 0;

  fadeLayer = self->_fadeLayer;
  self->_fadeLayer = 0;

  [(SiriSharedUIPlatterGlowView *)self removeFromSuperview];
}

- (SiriSharedUIPlatterGlowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUIPlatterGlowView;
  uint64_t v7 = -[SiriSharedUIPlatterGlowView initWithFrame:](&v10, sel_initWithFrame_);
  double v8 = v7;
  if (v7) {
    -[SiriSharedUIPlatterGlowView _createSiriGlowToPlatter:](v7, "_createSiriGlowToPlatter:", x, y, width, height);
  }
  return v8;
}

- (void)dealloc
{
  noiseLayer = self->_noiseLayer;
  if (noiseLayer)
  {
    [(SUICIntelligentLightLayer *)noiseLayer invalidate];
    [(SUICIntelligentLightLayer *)self->_noiseLayer removeFromSuperlayer];
    uint64_t v4 = self->_noiseLayer;
    self->_noiseLayer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SiriSharedUIPlatterGlowView;
  [(SiriSharedUIPlatterGlowView *)&v5 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGFloat v8 = -a3.origin.x;
  CGFloat v9 = -a3.origin.y;
  objc_super v10 = [(SiriSharedUIPlatterGlowView *)self window];
  [v10 bounds];
  v24.receiver = self;
  v24.super_class = (Class)SiriSharedUIPlatterGlowView;
  -[SiriSharedUIPlatterGlowView setFrame:](&v24, sel_setFrame_, v8, v9);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = self->_glowLayers;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15++), "setFrame:", x, y, width, height, (void)v20);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  [(SiriSharedUIPlatterGlowView *)self frame];
  double v17 = fmin(fmax(width + width, height), v16);
  double v18 = x - (v17 - width) * 0.5;
  double v19 = y - (v17 - height) * 0.5;
  [(CAGradientLayer *)self->_fadeLayer frame];
  v28.origin.double x = v18;
  v28.origin.double y = v19;
  v28.size.double width = v17;
  v28.size.double height = v17;
  if (!CGRectEqualToRect(v27, v28)) {
    -[CAGradientLayer setFrame:](self->_fadeLayer, "setFrame:", v18, v19, v17, v17);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_glowLayers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setBounds:", x, y, width, height, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_glowLayers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setCornerRadius:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_createILLayerWithPalette:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F75430]);
  uint64_t v6 = [(SiriSharedUIPlatterGlowView *)self window];

  if (v6)
  {
    uint64_t v7 = [(SiriSharedUIPlatterGlowView *)self window];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    objc_msgSend(v5, "setFrame:", v9, v11, v13, v15);
  }
  [v5 setColorPalette:a3];
  [v5 setMasksToBounds:0];
  return v5;
}

- (void)_createSiriGlowToPlatter:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v72[1] = *MEMORY[0x263EF8340];
  double v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[SiriSharedUIPlatterGlowView setFrame:](self, "setFrame:", x, y, width, height);
  [(SiriSharedUIPlatterGlowView *)self setClipsToBounds:1];
  id v66 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v66 setName:@"SiriPlatterGlowMask"];
  [v66 setAllowsHitTesting:0];
  id v65 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v65 setName:@"RoundRectMask"];
  [v65 setAllowsHitTesting:0];
  uint64_t v17 = (_UIIntelligenceSystemLightView *)objc_msgSend(objc_alloc(MEMORY[0x263F83008]), "initWithFrame:preferringAudioReactivity:", 0, v10, v12, v14, v16);
  systemLightView = self->_systemLightView;
  self->_systemLightView = v17;

  double v19 = [(_UIIntelligenceSystemLightView *)self->_systemLightView layer];
  colorLayer = self->_colorLayer;
  self->_colorLayer = v19;

  long long v21 = [(SiriSharedUIPlatterGlowView *)self _createILLayerWithPalette:500];
  noiseLayer = self->_noiseLayer;
  self->_noiseLayer = v21;

  [(SUICIntelligentLightLayer *)self->_noiseLayer setPaused:0];
  uint64_t v23 = *MEMORY[0x263F15BC8];
  objc_super v24 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  long long v25 = [MEMORY[0x263F157C8] filterWithType:v23];
  uint64_t v26 = [MEMORY[0x263F157C8] filterWithType:v23];
  uint64_t v27 = *MEMORY[0x263F15C80];
  [v24 setValue:&unk_26C1AE620 forKey:*MEMORY[0x263F15C80]];
  CGRect v28 = v25;
  v63 = v25;
  [v25 setValue:&unk_26C1AE638 forKey:v27];
  v62 = v26;
  [v26 setValue:&unk_26C1AE650 forKey:v27];
  v64 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  long long v29 = (void *)MEMORY[0x263F08D40];
  CAColorMatrixMakeMultiplyColor();
  long long v30 = [v29 valueWithCAColorMatrix:v67];
  [v64 setValue:v30 forKey:*MEMORY[0x263F15C30]];

  [v64 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
  long long v31 = self->_colorLayer;
  v72[0] = v64;
  long long v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:1];
  [(CALayer *)v31 setFilters:v32];

  id v33 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v33 setName:@"RoundRect-BlurLarge"];
  objc_msgSend(v33, "setFrame:", x, y, width, height);
  [v33 setMasksToBounds:0];
  [v33 setAllowsHitTesting:0];
  [v33 setCornerRadius:25.0];
  [v33 setBorderWidth:10.0];
  [v33 borderWidth];
  [v33 setBorderOffset:v34 * 0.5];
  id v35 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v33, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));

  id v36 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  objc_msgSend(v33, "setBorderColor:", objc_msgSend(v36, "CGColor"));

  v71 = v24;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
  [v33 setFilters:v37];

  id v38 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v38 setName:@"RoundRect-BlurMedium"];
  objc_msgSend(v38, "setFrame:", x, y, width, height);
  [v38 setMasksToBounds:0];
  [v38 setAllowsHitTesting:0];
  [v38 setCornerRadius:25.0];
  [v38 setBorderWidth:4.0];
  [v38 borderWidth];
  [v38 setBorderOffset:v39 * 0.5];
  id v40 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v38, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

  id v41 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  objc_msgSend(v38, "setBorderColor:", objc_msgSend(v41, "CGColor"));

  v70 = v28;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
  [v38 setFilters:v42];

  id v43 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v43 setName:@"RoundRect-BlurSmall"];
  objc_msgSend(v43, "setFrame:", x, y, width, height);
  [v43 setMasksToBounds:0];
  [v43 setAllowsHitTesting:0];
  [v43 setCornerRadius:25.0];
  [v43 setBorderWidth:3.0];
  [v43 borderWidth];
  [v43 setBorderOffset:v44 * 0.5];
  id v45 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.05];
  objc_msgSend(v43, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));

  id v46 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  objc_msgSend(v43, "setBorderColor:", objc_msgSend(v46, "CGColor"));

  v69 = v26;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
  [v43 setFilters:v47];

  id v48 = objc_alloc_init(MEMORY[0x263F157E8]);
  [v48 setName:@"RoundRect-Inside"];
  objc_msgSend(v48, "setFrame:", x, y, width, height);
  [v48 setMasksToBounds:0];
  [v48 setAllowsHitTesting:0];
  [v48 setCornerRadius:25.0];
  id v49 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.2];
  objc_msgSend(v48, "setBackgroundColor:", objc_msgSend(v49, "CGColor"));

  v50 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v50 setFromValue:&unk_26C1AE700];
  [v50 setToValue:&unk_26C1AE710];
  [v50 setDuration:2.3];
  [v50 setBeginTime:CACurrentMediaTime() + 1.0];
  [v50 setRemovedOnCompletion:0];
  [v50 setFillMode:*MEMORY[0x263F15AB0]];
  v51 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
  [v50 setTimingFunction:v51];

  [v48 addAnimation:v50 forKey:@"opacityAnimation"];
  [(CALayer *)self->_colorLayer setAllowsGroupBlending:0];
  LODWORD(v52) = 5.0;
  [(CALayer *)self->_colorLayer setGain:v52];
  v53 = [MEMORY[0x263F157D0] layer];
  fadeLayer = self->_fadeLayer;
  self->_fadeLayer = v53;

  [(CAGradientLayer *)self->_fadeLayer setName:@"Fade In/Out Mask Layer"];
  -[CAGradientLayer setFrame:](self->_fadeLayer, "setFrame:", x, y, width, height);
  [(CAGradientLayer *)self->_fadeLayer setMasksToBounds:0];
  [(CAGradientLayer *)self->_fadeLayer setAllowsHitTesting:0];
  [(CAGradientLayer *)self->_fadeLayer setType:*MEMORY[0x263F15DE0]];
  id v55 = [MEMORY[0x263F825C8] redColor];
  v68[0] = [v55 CGColor];
  id v56 = [MEMORY[0x263F825C8] redColor];
  v68[1] = [v56 CGColor];
  id v57 = [MEMORY[0x263F825C8] clearColor];
  v68[2] = [v57 CGColor];
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:3];
  [(CAGradientLayer *)self->_fadeLayer setColors:v58];

  -[CAGradientLayer setStartPoint:](self->_fadeLayer, "setStartPoint:", 0.5, 0.5);
  -[CAGradientLayer setEndPoint:](self->_fadeLayer, "setEndPoint:", 1.0, 1.0);
  [(CAGradientLayer *)self->_fadeLayer setLocations:&unk_26C1AE590];
  v59 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B88]];
  [(CAGradientLayer *)self->_fadeLayer setCompositingFilter:v59];

  [v66 addSublayer:self->_noiseLayer];
  [v66 addSublayer:v65];
  [v66 addSublayer:v48];
  [v66 addSublayer:self->_fadeLayer];
  [v65 addSublayer:v43];
  [v65 addSublayer:v38];
  [v65 addSublayer:v33];
  [v65 setCompositingFilter:*MEMORY[0x263F15D10]];
  [(CALayer *)self->_colorLayer setMask:v66];
  [(SiriSharedUIPlatterGlowView *)self addSubview:self->_systemLightView];
  [(SiriSharedUIPlatterGlowView *)self _updateScreenSize];
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v43, v38, v33, v48, 0);
  v60 = (NSArray *)objc_claimAutoreleasedReturnValue();
  glowLayers = self->_glowLayers;
  self->_glowLayers = v60;
}

- (void)_createFadeLayerAnimation
{
  id v13 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.translation.y"];
  v3 = NSNumber;
  [(SiriSharedUIPlatterGlowView *)self frame];
  id v5 = [v3 numberWithDouble:v4 * 0.5];
  [v13 setFromValue:v5];

  [v13 setToValue:&unk_26C1AE668];
  [v13 setDuration:2.5];
  uint64_t v6 = *MEMORY[0x263F15EA0];
  uint64_t v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
  [v13 setTimingFunction:v7];

  [(CAGradientLayer *)self->_fadeLayer addAnimation:v13 forKey:@"positionAnimation"];
  double v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v8 setFromValue:&unk_26C1AE720];
  [v8 setToValue:&unk_26C1AE730];
  [v8 setDuration:2.5];
  [v8 setRemovedOnCompletion:0];
  uint64_t v9 = *MEMORY[0x263F15AB0];
  [v8 setFillMode:*MEMORY[0x263F15AB0]];
  double v10 = [MEMORY[0x263F15808] functionWithName:v6];
  [v8 setTimingFunction:v10];

  [(CAGradientLayer *)self->_fadeLayer addAnimation:v8 forKey:@"scaleAnimation"];
  double v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v11 setFromValue:&unk_26C1AE650];
  [v11 setToValue:&unk_26C1AE668];
  [v11 setDuration:3.0];
  [v11 setBeginTime:CACurrentMediaTime() + 2.0];
  [v11 setRemovedOnCompletion:0];
  [v11 setFillMode:v9];
  double v12 = [MEMORY[0x263F15808] functionWithName:v6];
  [v11 setTimingFunction:v12];

  [v11 setDelegate:self];
  [(CAGradientLayer *)self->_fadeLayer addAnimation:v11 forKey:@"opacityAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    fadeLayer = self->_fadeLayer;
    id v6 = a3;
    uint64_t v7 = [(CAGradientLayer *)fadeLayer animationForKey:@"opacityAnimation"];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      [(SiriSharedUIPlatterGlowView *)self removeFromSuperview];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLightView, 0);
  objc_storeStrong((id *)&self->_noiseLayer, 0);
  objc_storeStrong((id *)&self->_fadeLayer, 0);
  objc_storeStrong((id *)&self->_edrLayer, 0);
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_glowLayers, 0);
}

@end