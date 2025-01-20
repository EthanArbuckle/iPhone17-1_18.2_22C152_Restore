@interface AXFKAFocusRingShapeLayer
+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)layerWithStyle:(int64_t)a3 kind:(unint64_t)a4;
+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3;
- (AXFKAFocusRingBorderShapeLayer)bottomBorderLayer;
- (AXFKAFocusRingShapeLayer)init;
- (BOOL)increaseContrast;
- (BOOL)useDefaultRingColor;
- (BOOL)useLargeRing;
- (CGColor)ringColorRef;
- (CGColor)strokeColorForBottomLayer;
- (double)borderScale;
- (double)insetForFocusRingBorder:(id)a3;
- (double)lineWidthForBottomLayer;
- (id)bottomFocusRingColorForTintColor:(id)a3;
- (id)fillColorForBottomLayer;
- (id)tintColor;
- (int64_t)interfaceStyle;
- (unint64_t)kind;
- (void)_updateBottomLayerPath;
- (void)dealloc;
- (void)setBottomBorderLayer:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)setKind:(unint64_t)a3;
- (void)setPath:(CGPath *)a3;
- (void)updateAppearance;
@end

@implementation AXFKAFocusRingShapeLayer

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)[a1 layerWithStyle:a3 kind:0];
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)[a1 layerWithStyle:a3 kind:2];
}

+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)[a1 layerWithStyle:a3 kind:1];
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)[a1 layerWithStyle:a3 kind:3];
}

+ (id)layerWithStyle:(int64_t)a3 kind:(unint64_t)a4
{
  v6 = [a1 layer];
  [v6 setInterfaceStyle:a3];
  [v6 setKind:a4];

  return v6;
}

- (AXFKAFocusRingShapeLayer)init
{
  v20.receiver = self;
  v20.super_class = (Class)AXFKAFocusRingShapeLayer;
  v2 = [(AXFKAFocusRingShapeLayer *)&v20 init];
  if (v2)
  {
    v3 = +[AXFKAFocusRingBorderShapeLayer layer];
    [(AXFKAFocusRingShapeLayer *)v2 setBottomBorderLayer:v3];

    objc_initWeak(&location, v2);
    v4 = [MEMORY[0x1E4F49458] sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__AXFKAFocusRingShapeLayer_init__block_invoke;
    v17[3] = &unk_1E59B9BF8;
    objc_copyWeak(&v18, &location);
    [v4 registerUpdateBlock:v17 forRetrieveSelector:sel_fullKeyboardAccessFocusRingColor withListener:v2];

    objc_destroyWeak(&v18);
    v5 = [MEMORY[0x1E4F49458] sharedInstance];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__AXFKAFocusRingShapeLayer_init__block_invoke_2;
    v15[3] = &unk_1E59B9BF8;
    objc_copyWeak(&v16, &location);
    [v5 registerUpdateBlock:v15 forRetrieveSelector:sel_fullKeyboardAccessLargeFocusRingEnabled withListener:v2];

    objc_destroyWeak(&v16);
    v6 = [MEMORY[0x1E4F49458] sharedInstance];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __32__AXFKAFocusRingShapeLayer_init__block_invoke_3;
    v13 = &unk_1E59B9BF8;
    objc_copyWeak(&v14, &location);
    [v6 registerUpdateBlock:&v10 forRetrieveSelector:sel_fullKeyboardAccessFocusRingHighContrastEnabled withListener:v2];

    objc_destroyWeak(&v14);
    v7 = [(AXFKAFocusRingShapeLayer *)v2 bottomBorderLayer];
    [(AXFKAFocusRingShapeLayer *)v2 addSublayer:v7];

    [(AXFKAFocusRingShapeLayer *)v2 setFillColor:0];
    v8 = [(AXFKAFocusRingShapeLayer *)v2 bottomBorderLayer];
    [v8 setFillColor:0];

    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAppearance];
}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAppearance];
}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAppearance];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB9108] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusRingShapeLayer;
  [(AXFKAFocusRingShapeLayer *)&v4 dealloc];
}

- (void)setPath:(CGPath *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusRingShapeLayer;
  [(AXFKAFocusRingShapeLayer *)&v4 setPath:a3];
  [(AXFKAFocusRingShapeLayer *)self _updateBottomLayerPath];
  [(AXFKAFocusRingShapeLayer *)self updateAppearance];
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
  [(AXFKAFocusRingShapeLayer *)self updateAppearance];
}

- (void)_updateBottomLayerPath
{
  if ([(AXFKAFocusRingShapeLayer *)self path])
  {
    v3 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v3 unscaledLineWidth];
    double v5 = v4;
    [(AXFKAFocusRingShapeLayer *)self borderScale];
    double v7 = v5 * v6;
    v8 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v8 setLineWidth:v7];

    v9 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithCGPath:", -[AXFKAFocusRingShapeLayer path](self, "path"));
    [v9 bounds];
    CGFloat x = v49.origin.x;
    CGFloat y = v49.origin.y;
    CGFloat width = v49.size.width;
    CGFloat height = v49.size.height;
    double v14 = CGRectGetWidth(v49);
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v15 = CGRectGetHeight(v50);
    if (v14 >= v15) {
      double v16 = v15;
    }
    else {
      double v16 = v14;
    }
    v17 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [(AXFKAFocusRingShapeLayer *)self insetForFocusRingBorder:v17];
    double v19 = v18;

    if ([(AXFKAFocusRingShapeLayer *)self kind] != 1)
    {
      BOOL v20 = [(AXFKAFocusRingShapeLayer *)self increaseContrast];
      BOOL v21 = [(AXFKAFocusRingShapeLayer *)self useLargeRing];
      double v22 = 0.0;
      double v23 = 2.0;
      if (v21) {
        double v22 = 2.0;
      }
      double v24 = v19 + v22;
      if (!v21) {
        double v23 = -1.0;
      }
      double v25 = v19 + v23;
      if (v20) {
        double v19 = v25;
      }
      else {
        double v19 = v24;
      }
    }
    if (v19 + v19 >= v16) {
      double v26 = 0.0;
    }
    else {
      double v26 = v19;
    }
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGRect v52 = CGRectInset(v51, v26, v26);
    CGFloat v27 = v52.size.width;
    CGFloat v28 = v52.size.height;
    double v29 = v52.origin.x;
    CGFloat v30 = width;
    CGFloat v31 = y;
    CGFloat v32 = x;
    double v33 = v52.origin.y;
    double v44 = CGRectGetWidth(v52);
    v53.origin.CGFloat x = v32;
    v53.origin.CGFloat y = v31;
    v53.size.CGFloat width = v30;
    v53.size.CGFloat height = height;
    sCGFloat x = v44 / CGRectGetWidth(v53);
    v54.origin.CGFloat x = v29;
    v54.origin.CGFloat y = v33;
    v54.size.CGFloat width = v27;
    v54.size.CGFloat height = v28;
    double v34 = CGRectGetHeight(v54);
    v55.origin.CGFloat x = v32;
    v55.origin.CGFloat y = v31;
    v55.size.CGFloat width = v30;
    v55.size.CGFloat height = height;
    CGFloat v35 = CGRectGetHeight(v55);
    memset(&v48, 0, sizeof(v48));
    long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v47.a = *MEMORY[0x1E4F1DAB8];
    long long v43 = *(_OWORD *)&v47.a;
    *(_OWORD *)&v47.c = v45;
    *(_OWORD *)&v47.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v42 = *(_OWORD *)&v47.tx;
    CGAffineTransformScale(&v48, &v47, sx, v34 / v35);
    CGAffineTransform v47 = v48;
    [v9 applyTransform:&v47];
    [v9 bounds];
    *(_OWORD *)&v46.a = v43;
    *(_OWORD *)&v46.c = v45;
    *(_OWORD *)&v46.tCGFloat x = v42;
    memset(&v47, 0, sizeof(v47));
    CGAffineTransformTranslate(&v47, &v46, v29 - v36, v33 - v37);
    CGAffineTransform v46 = v47;
    [v9 applyTransform:&v46];
    [v9 closePath];
    id v38 = v9;
    uint64_t v39 = [v38 CGPath];
    v40 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v40 setPath:v39];
  }
}

- (void)updateAppearance
{
  if (![(AXFKAFocusRingShapeLayer *)self kind]
    || [(AXFKAFocusRingShapeLayer *)self kind] == 3
    || [(AXFKAFocusRingShapeLayer *)self kind] == 1
    && [(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    v3 = [(AXFKAFocusRingShapeLayer *)self strokeColorForBottomLayer];
    double v4 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v4 setStrokeColor:v3];

    if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    double v6 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v6 setRingPosition:v5];

    [(AXFKAFocusRingShapeLayer *)self lineWidthForBottomLayer];
    double v8 = v7;
    v9 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v9 setUnscaledLineWidth:v8];
  }
  else
  {
    v9 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v9 setStrokeColor:0];
  }

  if ([(AXFKAFocusRingShapeLayer *)self kind] == 1)
  {
    if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
      double v10 = 0.3;
    }
    else {
      double v10 = 0.15;
    }
    uint64_t v11 = [(AXFKAFocusRingShapeLayer *)self fillColorForBottomLayer];
    v12 = [v11 colorWithAlphaComponent:v10];

    id v13 = v12;
    uint64_t v14 = [v13 CGColor];
    double v15 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v15 setFillColor:v14];
  }
  else
  {
    id v13 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v13 setFillColor:0];
  }

  [(AXFKAFocusRingShapeLayer *)self _updateBottomLayerPath];
}

- (double)lineWidthForBottomLayer
{
  if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
    double v3 = 8.0;
  }
  else {
    double v3 = 4.0;
  }
  if ([(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
      double v4 = 10.0;
    }
    else {
      double v4 = 8.0;
    }
    unint64_t v5 = [(AXFKAFocusRingShapeLayer *)self kind];
    double v6 = 1.0;
    if (v5 == 1) {
      double v6 = 1.5;
    }
    return v4 / v6;
  }
  return v3;
}

- (CGColor)strokeColorForBottomLayer
{
  if ([(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    if ([(AXFKAFocusRingShapeLayer *)self interfaceStyle] == 2) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    double v3 = [MEMORY[0x1E4F428B8] whiteColor];
    }
  }
  else
  {
    double v3 = [(AXFKAFocusRingShapeLayer *)self fillColorForBottomLayer];
  }
  id v4 = v3;
  unint64_t v5 = (CGColor *)[v4 CGColor];

  return v5;
}

- (id)fillColorForBottomLayer
{
  double v3 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", -[AXFKAFocusRingShapeLayer ringColorRef](self, "ringColorRef"));
  if ([(AXFKAFocusRingShapeLayer *)self useDefaultRingColor])
  {
    uint64_t v4 = [(AXFKAFocusRingShapeLayer *)self tintColor];
    unint64_t v5 = (void *)v4;
    if (v4) {
      double v6 = (void *)v4;
    }
    else {
      double v6 = v3;
    }
    id v7 = v6;

    double v3 = v7;
  }
  double v8 = [(AXFKAFocusRingShapeLayer *)self bottomFocusRingColorForTintColor:v3];

  return v8;
}

- (id)tintColor
{
  objc_opt_class();
  double v3 = [(AXFKAFocusRingShapeLayer *)self superlayer];
  uint64_t v4 = CALayerGetDelegate();
  unint64_t v5 = __UIAccessibilityCastAsClass();

  double v6 = [v5 _accessibilityFocusRingTintColor];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_opt_class();
    v9 = [v5 safeValueForKey:@"_normalInheritedTintColor"];
    __UIAccessibilityCastAsClass();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (double)borderScale
{
  objc_opt_class();
  double v3 = [(AXFKAFocusRingShapeLayer *)self superlayer];
  uint64_t v4 = CALayerGetDelegate();
  unint64_t v5 = __UIAccessibilityCastAsClass();

  [v5 _axScaleTransformForFocusLayerLineWidth];
  double v7 = v6;

  return v7;
}

- (BOOL)useDefaultRingColor
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  BOOL v3 = [v2 fullKeyboardAccessFocusRingColor] == 0;

  return v3;
}

- (CGColor)ringColorRef
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  [v2 fullKeyboardAccessFocusRingColor];
  BOOL v3 = (CGColor *)AXSAssistiveTouchCursorColor();

  return v3;
}

- (BOOL)useLargeRing
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  char v3 = [v2 fullKeyboardAccessLargeFocusRingEnabled];

  return v3;
}

- (BOOL)increaseContrast
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  char v3 = [v2 fullKeyboardAccessFocusRingHighContrastEnabled];

  return v3;
}

- (double)insetForFocusRingBorder:(id)a3
{
  id v3 = a3;
  if ([v3 ringPosition])
  {
    double v4 = 0.0;
    double v5 = -0.5;
    if ([v3 ringPosition] != 1) {
      goto LABEL_6;
    }
  }
  else
  {
    double v5 = 0.5;
  }
  [v3 lineWidth];
  double v4 = v6 * v5;
LABEL_6:

  return v4;
}

- (id)bottomFocusRingColorForTintColor:(id)a3
{
  double v4 = a3;
  if (a3)
  {
    var8[0] = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    [a3 getHue:var8 saturation:&v13 brightness:&v12 alpha:0];
    double v5 = v12 + v12 * v13 * -0.5;
    double v6 = 0.0;
    BOOL v7 = v5 == 0.0 || v5 == 1.0;
    double v8 = 0.0;
    if (!v7) {
      double v8 = (v12 - v5) / fmin(v5, 1.0 - v5);
    }
    double v9 = fmax(fmin(v5, 0.8), 0.25);
    double v10 = v9 + v8 * fmin(v9, 1.0 - v9);
    double v12 = v10;
    if (v10 != 0.0) {
      double v6 = 2.0 - (v9 + v9) / v10;
    }
    double v13 = v6;
    double v4 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithHue:saturation:brightness:alpha:", var8[0]);
    double v3 = var8[2];
  }
  return v4;
}

- (AXFKAFocusRingBorderShapeLayer)bottomBorderLayer
{
  return self->_bottomBorderLayer;
}

- (void)setBottomBorderLayer:(id)a3
{
}

- (unint64_t)kind
{
  return self->_kind;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (void).cxx_destruct
{
}

@end