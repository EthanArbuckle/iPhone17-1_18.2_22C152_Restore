@interface WCFocusRingShapeLayer
+ (id)clearLayer;
+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3;
- (BOOL)increasedContrast;
- (CAShapeLayer)innerFocusOutlineLayer;
- (CAShapeLayer)outerFocusOutlineLayer;
- (double)scaledOutlineWidth:(double)a3;
- (id)strokeColorForFocusOutline;
- (id)viewTintColor;
- (int64_t)focusRingColor;
- (void)dealloc;
- (void)setFocusRingColor:(int64_t)a3;
- (void)setIncreasedContrast:(BOOL)a3;
- (void)setInnerFocusOutlineLayer:(id)a3;
- (void)setOuterFocusOutlineLayer:(id)a3;
- (void)setPath:(CGPath *)a3;
- (void)updateAppearance;
- (void)updateCachedSettings;
- (void)updateFocusOutlinePath;
- (void)watchControlSettingsDidChange:(id)a3;
@end

@implementation WCFocusRingShapeLayer

+ (id)clearLayer
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WCFocusRingShapeLayer;
  v2 = objc_msgSendSuper2(&v5, sel_layer);
  id v3 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v3, "CGColor"));

  return v2;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  id v3 = objc_msgSend(a1, "layer", a3);
  [v3 setFillColor:0];
  v4 = [MEMORY[0x263F15880] layer];
  [v3 setInnerFocusOutlineLayer:v4];

  objc_super v5 = [v3 innerFocusOutlineLayer];
  [v5 setFillColor:0];

  v6 = [v3 innerFocusOutlineLayer];
  [v3 addSublayer:v6];

  v7 = [MEMORY[0x263F15880] layer];
  [v3 setOuterFocusOutlineLayer:v7];

  v8 = [v3 outerFocusOutlineLayer];
  [v8 setFillColor:0];

  v9 = [v3 outerFocusOutlineLayer];
  [v3 addSublayer:v9];

  [v3 updateCachedSettings];
  v10 = +[WatchControlSettings sharedInstance];
  [v10 addSettingsObserver:v3];

  return v3;
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[WCFocusRingShapeLayer clearLayer];
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[WCFocusRingShapeLayer clearLayer];
}

- (void)dealloc
{
  id v3 = +[WatchControlSettings sharedInstance];
  [v3 removeSettingsObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WCFocusRingShapeLayer;
  [(WCFocusRingShapeLayer *)&v4 dealloc];
}

- (void)watchControlSettingsDidChange:(id)a3
{
}

uint64_t __55__WCFocusRingShapeLayer_watchControlSettingsDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCachedSettings];
  v2 = *(void **)(a1 + 32);
  return [v2 updateAppearance];
}

- (void)setPath:(CGPath *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WCFocusRingShapeLayer;
  [(WCFocusRingShapeLayer *)&v4 setPath:a3];
  [(WCFocusRingShapeLayer *)self updateFocusOutlinePath];
  [(WCFocusRingShapeLayer *)self updateAppearance];
}

- (void)updateCachedSettings
{
  id v3 = +[WatchControlSettings sharedInstance];
  -[WCFocusRingShapeLayer setIncreasedContrast:](self, "setIncreasedContrast:", [v3 focusRingHighContrastEnabled]);

  id v4 = +[WatchControlSettings sharedInstance];
  -[WCFocusRingShapeLayer setFocusRingColor:](self, "setFocusRingColor:", [v4 focusRingColor]);
}

- (void)updateFocusOutlinePath
{
  if ([(WCFocusRingShapeLayer *)self path])
  {
    id v3 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithCGPath:", -[WCFocusRingShapeLayer path](self, "path"));
    [v3 bounds];
    CGFloat x = v62.origin.x;
    CGFloat y = v62.origin.y;
    CGFloat width = v62.size.width;
    CGFloat height = v62.size.height;
    double v8 = CGRectGetWidth(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    CGFloat rect_16 = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    double v9 = CGRectGetHeight(v63);
    if (v8 >= v9) {
      double v8 = v9;
    }
    v10 = [(WCFocusRingShapeLayer *)self innerFocusOutlineLayer];
    [v10 lineWidth];
    double v12 = v11 * 0.5;

    BOOL v13 = [(WCFocusRingShapeLayer *)self increasedContrast];
    double v14 = v12 + -0.5;
    if (!v13) {
      double v14 = v12;
    }
    if (v14 + v14 >= v8) {
      double v15 = 0.0;
    }
    else {
      double v15 = v14;
    }
    v64.origin.CGFloat x = x;
    CGFloat v16 = x;
    CGFloat rect = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGRect v65 = CGRectInset(v64, v15, v15);
    CGFloat v17 = v65.size.width;
    CGFloat v18 = v65.size.height;
    double v19 = v65.origin.x;
    double v20 = v65.origin.y;
    double v21 = CGRectGetWidth(v65);
    v66.origin.CGFloat x = v16;
    v66.origin.CGFloat y = rect_16;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGFloat v22 = v21 / CGRectGetWidth(v66);
    v67.origin.CGFloat x = v19;
    v67.origin.CGFloat y = v20;
    v67.size.CGFloat width = v17;
    v67.size.CGFloat height = v18;
    double v23 = CGRectGetHeight(v67);
    v68.origin.CGFloat x = rect;
    v68.origin.CGFloat y = rect_16;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    CGFloat v24 = CGRectGetHeight(v68);
    memset(&v61, 0, sizeof(v61));
    long long rect_16a = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v60.a = *MEMORY[0x263F000D0];
    long long recta = *(_OWORD *)&v60.a;
    *(_OWORD *)&v60.c = rect_16a;
    *(_OWORD *)&v60.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v53 = *(_OWORD *)&v60.tx;
    CGAffineTransformScale(&v61, &v60, v22, v23 / v24);
    CGAffineTransform v60 = v61;
    [v3 applyTransform:&v60];
    [v3 bounds];
    *(_OWORD *)&v59.a = recta;
    *(_OWORD *)&v59.c = rect_16a;
    *(_OWORD *)&v59.tCGFloat x = v53;
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformTranslate(&v60, &v59, v19 - v25, v20 - v26);
    CGAffineTransform v59 = v60;
    [v3 applyTransform:&v59];
    [v3 closePath];
    id v27 = v3;
    uint64_t v28 = [v27 CGPath];
    v29 = [(WCFocusRingShapeLayer *)self innerFocusOutlineLayer];
    [v29 setPath:v28];

    v30 = [(WCFocusRingShapeLayer *)self outerFocusOutlineLayer];
    [v30 lineWidth];
    CGFloat v32 = v31 * -0.5;

    v33 = (void *)MEMORY[0x263F1C478];
    id v34 = v27;
    v35 = objc_msgSend(v33, "bezierPathWithCGPath:", objc_msgSend(v34, "CGPath"));

    [v35 bounds];
    CGFloat v36 = v69.origin.x;
    CGFloat v37 = v69.origin.y;
    CGFloat v38 = v69.size.width;
    CGFloat v39 = v69.size.height;
    CGRect v70 = CGRectInset(v69, v32, v32);
    double v51 = v70.origin.y;
    CGFloat v40 = v70.size.width;
    CGFloat v41 = v70.size.height;
    double v42 = v70.origin.x;
    double v43 = CGRectGetWidth(v70);
    v71.origin.CGFloat x = v36;
    v71.origin.CGFloat y = v37;
    v71.size.CGFloat width = v38;
    v71.size.CGFloat height = v39;
    sCGFloat x = v43 / CGRectGetWidth(v71);
    v72.origin.CGFloat x = v42;
    v72.origin.CGFloat y = v51;
    v72.size.CGFloat width = v40;
    v72.size.CGFloat height = v41;
    double v44 = CGRectGetHeight(v72);
    v73.origin.CGFloat x = v36;
    v73.origin.CGFloat y = v37;
    v73.size.CGFloat width = v38;
    v73.size.CGFloat height = v39;
    CGFloat v45 = CGRectGetHeight(v73);
    *(_OWORD *)&v58.a = recta;
    *(_OWORD *)&v58.c = rect_16a;
    *(_OWORD *)&v58.tCGFloat x = v53;
    CGAffineTransformScale(&v59, &v58, sx, v44 / v45);
    CGAffineTransform v61 = v59;
    [v35 applyTransform:&v59];
    [v35 bounds];
    *(_OWORD *)&v58.a = recta;
    *(_OWORD *)&v58.c = rect_16a;
    *(_OWORD *)&v58.tCGFloat x = v53;
    CGAffineTransformTranslate(&v59, &v58, v42 - v46, v51 - v47);
    CGAffineTransform v60 = v59;
    [v35 applyTransform:&v59];
    [v35 closePath];
    id v48 = v35;
    uint64_t v49 = [v48 CGPath];
    v50 = [(WCFocusRingShapeLayer *)self outerFocusOutlineLayer];
    [v50 setPath:v49];
  }
}

- (void)updateAppearance
{
  [(WCFocusRingShapeLayer *)self scaledOutlineWidth:3.0];
  double v4 = v3;
  objc_super v5 = [(WCFocusRingShapeLayer *)self innerFocusOutlineLayer];
  [v5 setLineWidth:v4];

  id v6 = [(WCFocusRingShapeLayer *)self strokeColorForFocusOutline];
  id v7 = (id)[v6 CGColor];
  double v8 = [(WCFocusRingShapeLayer *)self innerFocusOutlineLayer];
  [v8 setStrokeColor:v7];

  [(WCFocusRingShapeLayer *)self scaledOutlineWidth:3.0];
  double v10 = v9;
  double v11 = [(WCFocusRingShapeLayer *)self outerFocusOutlineLayer];
  [v11 setLineWidth:v10];

  BOOL v12 = [(WCFocusRingShapeLayer *)self increasedContrast];
  if (v12)
  {
    id v7 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v13 = [v7 CGColor];
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v14 = [(WCFocusRingShapeLayer *)self outerFocusOutlineLayer];
  [v14 setStrokeColor:v13];

  if (v12) {
  [(WCFocusRingShapeLayer *)self updateFocusOutlinePath];
  }
}

- (id)strokeColorForFocusOutline
{
  double v3 = (void *)MEMORY[0x263F1C550];
  AXAssistiveTouchCursorColorForCursorColor([(WCFocusRingShapeLayer *)self focusRingColor]);
  double v4 = [v3 colorWithCGColor:AXSAssistiveTouchCursorColor()];
  if (![(WCFocusRingShapeLayer *)self focusRingColor])
  {
    uint64_t v5 = [(WCFocusRingShapeLayer *)self viewTintColor];
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v4;
    }
    id v8 = v7;

    double v4 = v8;
  }
  double v18 = 0.0;
  double v19 = 0.0;
  double v17 = 0.0;
  [v4 getHue:&v19 saturation:&v18 brightness:&v17 alpha:0];
  double v9 = v17 + v17 * v18 * -0.5;
  double v10 = 0.0;
  BOOL v11 = v9 == 0.0 || v9 == 1.0;
  double v12 = 0.0;
  if (!v11) {
    double v12 = (v17 - v9) / fmin(v9, 1.0 - v9);
  }
  double v13 = fmax(fmin(v9, 0.8), 0.25);
  double v14 = v13 + v12 * fmin(v13, 1.0 - v13);
  double v17 = v14;
  if (v14 != 0.0) {
    double v10 = 2.0 - (v13 + v13) / v14;
  }
  double v18 = v10;
  double v15 = objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:brightness:alpha:", v19);

  return v15;
}

- (id)viewTintColor
{
  objc_opt_class();
  double v3 = [(WCFocusRingShapeLayer *)self superlayer];
  double v4 = CALayerGetDelegate();
  uint64_t v5 = __UIAccessibilityCastAsClass();

  id v6 = [v5 _accessibilityFocusRingTintColor];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_opt_class();
    double v9 = [v5 safeValueForKey:@"_normalInheritedTintColor"];
    __UIAccessibilityCastAsClass();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (double)scaledOutlineWidth:(double)a3
{
  objc_opt_class();
  uint64_t v5 = [(WCFocusRingShapeLayer *)self superlayer];
  id v6 = CALayerGetDelegate();
  id v7 = __UIAccessibilityCastAsClass();

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v7 _axScaleTransformForFocusLayerLineWidth];
    a3 = v8 * a3;
  }

  return a3;
}

- (int64_t)focusRingColor
{
  return self->_focusRingColor;
}

- (void)setFocusRingColor:(int64_t)a3
{
  self->_focusRingColor = a3;
}

- (BOOL)increasedContrast
{
  return self->_increasedContrast;
}

- (void)setIncreasedContrast:(BOOL)a3
{
  self->_increasedContrast = a3;
}

- (CAShapeLayer)innerFocusOutlineLayer
{
  return self->_innerFocusOutlineLayer;
}

- (void)setInnerFocusOutlineLayer:(id)a3
{
}

- (CAShapeLayer)outerFocusOutlineLayer
{
  return self->_outerFocusOutlineLayer;
}

- (void)setOuterFocusOutlineLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerFocusOutlineLayer, 0);
  objc_storeStrong((id *)&self->_innerFocusOutlineLayer, 0);
}

@end