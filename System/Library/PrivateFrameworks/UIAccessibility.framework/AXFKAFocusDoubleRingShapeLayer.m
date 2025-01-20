@interface AXFKAFocusDoubleRingShapeLayer
- (AXFKAFocusDoubleRingShapeLayer)init;
- (AXFKAFocusRingBorderShapeLayer)topBorderLayer;
- (CGColor)strokeColorForTopLayer;
- (double)lineWidthForTopLayer;
- (id)topLayerFocusRingColorForTintColor:(id)a3;
- (void)_updateTopLayerPath;
- (void)setPath:(CGPath *)a3;
- (void)setTopBorderLayer:(id)a3;
- (void)updateAppearance;
@end

@implementation AXFKAFocusDoubleRingShapeLayer

- (AXFKAFocusDoubleRingShapeLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  v2 = [(AXFKAFocusRingShapeLayer *)&v7 init];
  if (v2)
  {
    v3 = +[AXFKAFocusRingBorderShapeLayer layer];
    [(AXFKAFocusDoubleRingShapeLayer *)v2 setTopBorderLayer:v3];

    v4 = [(AXFKAFocusDoubleRingShapeLayer *)v2 topBorderLayer];
    [(AXFKAFocusDoubleRingShapeLayer *)v2 addSublayer:v4];

    v5 = [(AXFKAFocusDoubleRingShapeLayer *)v2 topBorderLayer];
    [v5 setFillColor:0];
  }
  return v2;
}

- (void)setPath:(CGPath *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  [(AXFKAFocusRingShapeLayer *)&v4 setPath:a3];
  [(AXFKAFocusDoubleRingShapeLayer *)self _updateTopLayerPath];
}

- (void)_updateTopLayerPath
{
  v3 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
  uint64_t v4 = [v3 path];

  if (v4)
  {
    v5 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [v5 unscaledLineWidth];
    double v7 = v6;
    [(AXFKAFocusRingShapeLayer *)self borderScale];
    double v9 = v7 * v8;
    v10 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [v10 setLineWidth:v9];

    v11 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [(AXFKAFocusRingShapeLayer *)self insetForFocusRingBorder:v11];
    CGFloat v13 = v12;

    v14 = (void *)MEMORY[0x1E4F427D0];
    v15 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    v16 = objc_msgSend(v14, "bezierPathWithCGPath:", objc_msgSend(v15, "path"));

    [v16 bounds];
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    CGRect v41 = CGRectInset(v40, v13, v13);
    CGFloat v21 = v41.size.width;
    CGFloat v22 = v41.size.height;
    double v23 = v41.origin.x;
    double v24 = v41.origin.y;
    double v35 = CGRectGetWidth(v41);
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    sCGFloat x = v35 / CGRectGetWidth(v42);
    v43.origin.CGFloat x = v23;
    v43.origin.CGFloat y = v24;
    v43.size.CGFloat width = v21;
    v43.size.CGFloat height = v22;
    double v25 = CGRectGetHeight(v43);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGFloat v26 = CGRectGetHeight(v44);
    memset(&v39, 0, sizeof(v39));
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E4F1DAB8];
    long long v34 = *(_OWORD *)&v38.a;
    *(_OWORD *)&v38.c = v36;
    *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v33 = *(_OWORD *)&v38.tx;
    CGAffineTransformScale(&v39, &v38, sx, v25 / v26);
    CGAffineTransform v38 = v39;
    [v16 applyTransform:&v38];
    [v16 bounds];
    *(_OWORD *)&v37.a = v34;
    *(_OWORD *)&v37.c = v36;
    *(_OWORD *)&v37.tCGFloat x = v33;
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformTranslate(&v38, &v37, v23 - v27, v24 - v28);
    CGAffineTransform v37 = v38;
    [v16 applyTransform:&v37];
    [v16 closePath];
    id v29 = v16;
    uint64_t v30 = [v29 CGPath];
    v31 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [v31 setPath:v30];
  }
}

- (void)updateAppearance
{
  v12.receiver = self;
  v12.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  [(AXFKAFocusRingShapeLayer *)&v12 updateAppearance];
  if (![(AXFKAFocusRingShapeLayer *)self kind]
    || [(AXFKAFocusRingShapeLayer *)self kind] == 3
    || [(AXFKAFocusRingShapeLayer *)self kind] == 1
    && [(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    if ([(AXFKAFocusRingShapeLayer *)self increaseContrast]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [v4 setRingPosition:v3];

    [(AXFKAFocusDoubleRingShapeLayer *)self lineWidthForTopLayer];
    double v6 = v5;
    double v7 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    [v7 setUnscaledLineWidth:v6];

    double v8 = [(AXFKAFocusDoubleRingShapeLayer *)self strokeColorForTopLayer];
    double v9 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    v10 = v9;
    v11 = v8;
  }
  else
  {
    double v9 = [(AXFKAFocusDoubleRingShapeLayer *)self topBorderLayer];
    v10 = v9;
    v11 = 0;
  }
  [v9 setStrokeColor:v11];

  [(AXFKAFocusDoubleRingShapeLayer *)self _updateTopLayerPath];
}

- (double)lineWidthForTopLayer
{
  if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
    double v3 = 4.0;
  }
  else {
    double v3 = 2.0;
  }
  if ([(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    if ([(AXFKAFocusRingShapeLayer *)self useLargeRing]) {
      double v4 = 6.0;
    }
    else {
      double v4 = 4.0;
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

- (CGColor)strokeColorForTopLayer
{
  double v3 = [(AXFKAFocusRingShapeLayer *)self ringColorRef];
  if ([(AXFKAFocusRingShapeLayer *)self increaseContrast])
  {
    if ([(AXFKAFocusRingShapeLayer *)self interfaceStyle] == 2) {
      [MEMORY[0x1E4F428B8] whiteColor];
    }
    else {
    id v4 = [MEMORY[0x1E4F428B8] blackColor];
    }
    v10 = (CGColor *)[v4 CGColor];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F428B8] colorWithCGColor:v3];
    if ([(AXFKAFocusRingShapeLayer *)self useDefaultRingColor])
    {
      uint64_t v5 = [(AXFKAFocusRingShapeLayer *)self tintColor];
      double v6 = (void *)v5;
      if (v5) {
        double v7 = (void *)v5;
      }
      else {
        double v7 = v4;
      }
      id v8 = v7;

      id v4 = v8;
    }
    id v9 = [(AXFKAFocusDoubleRingShapeLayer *)self topLayerFocusRingColorForTintColor:v4];
    v10 = (CGColor *)[v9 CGColor];
  }
  return v10;
}

- (id)topLayerFocusRingColorForTintColor:(id)a3
{
  id v4 = a3;
  if (a3)
  {
    var8[0] = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    [a3 getHue:var8 saturation:&v20 brightness:&v19 alpha:0];
    double v5 = v19 + v19 * v20 * -0.5;
    double v6 = 0.0;
    BOOL v7 = v5 == 0.0 || v5 == 1.0;
    double v8 = (v19 - v5) / fmin(v5, 1.0 - v5);
    if (v7) {
      double v9 = 0.0;
    }
    else {
      double v9 = v8;
    }
    double v10 = fmin(v5, 0.8);
    double v11 = 0.25;
    double v12 = fmax(v10, 0.25);
    double v13 = v9 * 0.75;
    if (v12 > 0.6) {
      double v11 = -0.25;
    }
    double v14 = v12 + v11;
    double v15 = v12 + v9 * fmin(v12, 1.0 - v12);
    double v19 = v15;
    double v16 = 0.0;
    if (v15 != 0.0) {
      double v16 = 2.0 - (v12 + v12) / v15;
    }
    double v20 = v16;
    double v17 = v14 + v13 * fmin(v14, 1.0 - v14);
    if (v17 != 0.0) {
      double v6 = 2.0 - (v14 + v14) / v17;
    }
    id v4 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithHue:saturation:brightness:alpha:", var8[0], v6);
    double v3 = var8[2];
  }
  return v4;
}

- (AXFKAFocusRingBorderShapeLayer)topBorderLayer
{
  return self->_topBorderLayer;
}

- (void)setTopBorderLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end