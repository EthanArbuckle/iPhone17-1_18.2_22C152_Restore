@interface PKRingGradientView
- (BOOL)isEnabled;
- (CGPoint)_center;
- (CGPoint)_centerPointForMaskViewWithAngle:(double)a3 adjustToCover:(BOOL)a4;
- (PKRingGradientView)init;
- (UIColor)fillColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)strokeColor;
- (double)_maskRadius;
- (double)_offsetEndAngle;
- (double)_offsetStartAngle;
- (double)_radius;
- (double)currentAngle;
- (double)minimumAngle;
- (double)ringWidth;
- (double)strokeWidth;
- (double)totalWidth;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateEffectiveColors;
- (void)_updateGradient;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCurrentAngle:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFillColor:(id)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setMinimumAngle:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation PKRingGradientView

- (PKRingGradientView)init
{
  v32.receiver = self;
  v32.super_class = (Class)PKRingGradientView;
  v2 = [(PKRingGradientView *)&v32 init];
  v3 = v2;
  if (v2)
  {
    [(PKRingGradientView *)v2 setOpaque:0];
    [(PKRingGradientView *)v3 setClipsToBounds:1];
    v3->_enabled = 1;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    -[CAGradientLayer setStartPoint:](v3->_gradientLayer, "setStartPoint:", 0.5, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_gradientLayer, "setEndPoint:", 0.5, 0.0);
    [(CAGradientLayer *)v3->_gradientLayer setType:*MEMORY[0x1E4F3A398]];
    v6 = v3->_gradientLayer;
    v7 = PKLayerNullActions();
    [(CAGradientLayer *)v6 setActions:v7];

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    gradientMaskLayer = v3->_gradientMaskLayer;
    v3->_gradientMaskLayer = v8;

    [(CAShapeLayer *)v3->_gradientMaskLayer setFillColor:0];
    v10 = v3->_gradientMaskLayer;
    id v11 = [MEMORY[0x1E4FB1618] blackColor];
    -[CAShapeLayer setStrokeColor:](v10, "setStrokeColor:", [v11 CGColor]);

    v12 = v3->_gradientMaskLayer;
    v13 = PKLayerNullActions();
    [(CAShapeLayer *)v12 setActions:v13];

    [(CAGradientLayer *)v3->_gradientLayer setMask:v3->_gradientMaskLayer];
    v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    strokeLayer = v3->_strokeLayer;
    v3->_strokeLayer = v14;

    [(CAShapeLayer *)v3->_strokeLayer setFillColor:0];
    v16 = v3->_strokeLayer;
    v17 = PKLayerNullActions();
    [(CAShapeLayer *)v16 setActions:v17];

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = v18;

    [(CAShapeLayer *)v3->_backgroundLayer setFillColor:0];
    v20 = v3->_backgroundLayer;
    v21 = PKLayerNullActions();
    [(CAShapeLayer *)v20 setActions:v21];

    v22 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backgroundCap = v3->_backgroundCap;
    v3->_backgroundCap = v22;

    [(CAShapeLayer *)v3->_backgroundCap setFillColor:0];
    v24 = v3->_backgroundCap;
    v25 = PKLayerNullActions();
    [(CAShapeLayer *)v24 setActions:v25];

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    gradientCap = v3->_gradientCap;
    v3->_gradientCap = v26;

    [(CAShapeLayer *)v3->_gradientCap setFillColor:0];
    v28 = v3->_gradientCap;
    v29 = PKLayerNullActions();
    [(CAShapeLayer *)v28 setActions:v29];

    v30 = [(PKRingGradientView *)v3 layer];
    [v30 addSublayer:v3->_strokeLayer];
    [v30 addSublayer:v3->_backgroundLayer];
    [v30 addSublayer:v3->_gradientLayer];
    [v30 addSublayer:v3->_backgroundCap];
    [v30 addSublayer:v3->_gradientCap];
  }
  return v3;
}

- (void)dealloc
{
  CGColorRelease(self->_effectiveStartColor);
  CGColorRelease(self->_effectiveEndColor);
  CGColorRelease(self->_effectiveFillColor);
  CGColorRelease(self->_effectiveStrokeColor);
  v3.receiver = self;
  v3.super_class = (Class)PKRingGradientView;
  [(PKRingGradientView *)&v3 dealloc];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKRingGradientView;
  [(PKRingGradientView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKRingGradientView *)self _updateEffectiveColors];
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)PKRingGradientView;
  [(PKRingGradientView *)&v44 layoutSubviews];
  [(PKRingGradientView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKRingGradientView *)self _center];
  double v42 = v12;
  double v43 = v11;
  [(PKRingGradientView *)self _radius];
  double v14 = v13;
  [(PKRingGradientView *)self totalWidth];
  double v16 = v14 + v15 * -0.5;
  [(PKRingGradientView *)self ringWidth];
  double v18 = v17;
  [(PKRingGradientView *)self _maskRadius];
  [(PKRingGradientView *)self strokeWidth];
  double v20 = v19;
  [(PKRingGradientView *)self _offsetStartAngle];
  [(PKRingGradientView *)self _offsetEndAngle];
  double v22 = v21;
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
  [(CAShapeLayer *)self->_gradientMaskLayer setLineWidth:v18];
  v23 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v43, v42, v16, 0.0, 6.28318531);
  strokeLayer = self->_strokeLayer;
  [(PKRingGradientView *)self totalWidth];
  -[CAShapeLayer setLineWidth:](strokeLayer, "setLineWidth:");
  v25 = self->_strokeLayer;
  id v26 = v23;
  -[CAShapeLayer setPath:](v25, "setPath:", [v26 CGPath]);
  v27 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v43, v42, v16, 0.0, 6.28318531);
  [(CAShapeLayer *)self->_backgroundLayer setLineWidth:v18];
  backgroundLayer = self->_backgroundLayer;
  id v29 = v27;
  -[CAShapeLayer setPath:](backgroundLayer, "setPath:", [v29 CGPath]);
  [(CAShapeLayer *)self->_backgroundCap setLineWidth:v20];
  [(PKRingGradientView *)self _centerPointForMaskViewWithAngle:0 adjustToCover:4.71238898];
  v30 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  backgroundCap = self->_backgroundCap;
  id v32 = v30;
  -[CAShapeLayer setPath:](backgroundCap, "setPath:", [v32 CGPath]);
  [(PKRingGradientView *)self _centerPointForMaskViewWithAngle:1 adjustToCover:v22];
  v33 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
  gradientCap = self->_gradientCap;
  id v35 = v33;
  -[CAShapeLayer setPath:](gradientCap, "setPath:", [v35 CGPath]);
  if (self->_effectiveStartColor
    && self->_effectiveEndColor
    && (uint64_t BlendedLinearColor = PKColorCreateBlendedLinearColor()) != 0)
  {
    v37 = (const void *)BlendedLinearColor;
    v38 = [MEMORY[0x1E4FB1618] colorWithCGColor:BlendedLinearColor];
    CFRelease(v37);
  }
  else
  {
    v38 = 0;
  }
  v39 = self->_gradientCap;
  id v40 = v38;
  effectiveFillColor = (CGColor *)[v40 CGColor];
  if (!effectiveFillColor) {
    effectiveFillColor = self->_effectiveFillColor;
  }
  [(CAShapeLayer *)v39 setFillColor:effectiveFillColor];
  self->_gradientCapIsFillColor = v40 == 0;
  [(CAShapeLayer *)self->_gradientCap setLineWidth:v20];
  [(PKRingGradientView *)self _updateGradient];
}

- (double)_offsetStartAngle
{
  return 4.71238898;
}

- (double)_offsetEndAngle
{
  return self->_currentAngle + 4.71238898;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CAGradientLayer *)self->_gradientLayer setHidden:!a3];
    gradientCap = self->_gradientCap;
    BOOL v5 = !self->_enabled;
    [(CAShapeLayer *)gradientCap setHidden:v5];
  }
}

- (void)setGradientStartColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    double v4 = (UIColor *)[v6 copy];
    gradientStartColor = self->_gradientStartColor;
    self->_gradientStartColor = v4;

    [(PKRingGradientView *)self _updateEffectiveColors];
  }
}

- (void)setGradientEndColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    double v4 = (UIColor *)[v6 copy];
    gradientEndColor = self->_gradientEndColor;
    self->_gradientEndColor = v4;

    [(PKRingGradientView *)self _updateEffectiveColors];
  }
}

- (void)setStrokeColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [(PKRingGradientView *)self _updateEffectiveColors];
  }
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(PKRingGradientView *)self _updateEffectiveColors];
  }
}

- (void)setMinimumAngle:(double)a3
{
  if (self->_minimumAngle != a3)
  {
    self->_minimumAngle = a3;
    [(PKRingGradientView *)self setNeedsLayout];
  }
}

- (void)setCurrentAngle:(double)a3
{
  if (self->_currentAngle != a3)
  {
    self->_currentAngle = a3;
    [(PKRingGradientView *)self setNeedsLayout];
  }
}

- (double)ringWidth
{
  [(PKRingGradientView *)self _radius];

  PKFloatRoundToPixel();
  return result;
}

- (double)strokeWidth
{
  [(PKRingGradientView *)self _radius];

  PKFloatRoundToPixel();
  return result;
}

- (double)totalWidth
{
  [(PKRingGradientView *)self strokeWidth];
  double v4 = v3;
  [(PKRingGradientView *)self ringWidth];
  return v5 + v4 * 2.0;
}

- (void)_updateEffectiveColors
{
  CGColorRelease(self->_effectiveStartColor);
  CGColorRelease(self->_effectiveEndColor);
  CGColorRelease(self->_effectiveFillColor);
  CGColorRelease(self->_effectiveStrokeColor);
  double v3 = [(PKRingGradientView *)self traitCollection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKRingGradientView__updateEffectiveColors__block_invoke;
  v7[3] = &unk_1E59CA7D0;
  v7[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v7);

  effectiveStrokeColor = self->_effectiveStrokeColor;
  effectiveFillColor = self->_effectiveFillColor;
  if (effectiveStrokeColor)
  {
    if (!effectiveFillColor)
    {
      effectiveFillColor = CGColorRetain(effectiveStrokeColor);
      self->_effectiveFillColor = effectiveFillColor;
    }
  }
  else if (effectiveFillColor)
  {
    self->_effectiveStrokeColor = CGColorRetain(self->_effectiveFillColor);
    effectiveFillColor = self->_effectiveFillColor;
  }
  [(CAShapeLayer *)self->_backgroundLayer setStrokeColor:effectiveFillColor];
  [(CAShapeLayer *)self->_backgroundCap setFillColor:self->_effectiveFillColor];
  if (self->_gradientCapIsFillColor) {
    [(CAShapeLayer *)self->_gradientCap setFillColor:self->_effectiveFillColor];
  }
  [(CAShapeLayer *)self->_strokeLayer setStrokeColor:self->_effectiveStrokeColor];
  [(CAShapeLayer *)self->_backgroundCap setStrokeColor:self->_effectiveStrokeColor];
  [(CAShapeLayer *)self->_gradientCap setStrokeColor:self->_effectiveStrokeColor];
  if (self->_effectiveStartColor && self->_effectiveEndColor)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v6 addObject:self->_effectiveStartColor];
    [v6 addObject:self->_effectiveEndColor];
    [(CAGradientLayer *)self->_gradientLayer setColors:v6];
  }
  [(PKRingGradientView *)self setNeedsLayout];
}

CGColorRef __44__PKRingGradientView__updateEffectiveColors__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 528), "pkui_extendedLinearColor");
  id v2 = objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(a1 + 32) + 472) = CGColorRetain((CGColorRef)[v2 CGColor]);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 536), "pkui_extendedLinearColor");
  id v3 = objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(a1 + 32) + 480) = CGColorRetain((CGColorRef)[v3 CGColor]);

  *(void *)(*(void *)(a1 + 32) + 488) = CGColorRetain((CGColorRef)[*(id *)(*(void *)(a1 + 32) + 512) CGColor]);
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(*(void *)(a1 + 32) + 520) CGColor]);
  *(void *)(*(void *)(a1 + 32) + 496) = result;
  return result;
}

- (void)_updateGradient
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (self->_effectiveStartColor)
  {
    if (self->_effectiveEndColor)
    {
      gradientLayer = self->_gradientLayer;
      v21[0] = &unk_1EF2B8C88;
      double v4 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(self->_minimumAngle, self->_currentAngle) / 6.28318531);
      v21[1] = v4;
      double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      [(CAGradientLayer *)gradientLayer setLocations:v5];

      [(PKRingGradientView *)self _radius];
      double v7 = v6;
      [(PKRingGradientView *)self totalWidth];
      double v9 = v7 + v8 * -0.5;
      double v10 = (void *)MEMORY[0x1E4FB14C0];
      [(PKRingGradientView *)self _center];
      double v12 = v11;
      double v14 = v13;
      [(PKRingGradientView *)self _offsetStartAngle];
      double v16 = v15;
      [(PKRingGradientView *)self _offsetEndAngle];
      double v18 = objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v14, v9, v16, v17);
      gradientMaskLayer = self->_gradientMaskLayer;
      id v20 = v18;
      -[CAShapeLayer setPath:](gradientMaskLayer, "setPath:", [v20 CGPath]);
    }
  }
}

- (double)_radius
{
  [(PKRingGradientView *)self bounds];
  if (v2 >= v3) {
    double v4 = v3;
  }
  else {
    double v4 = v2;
  }
  return v4 * 0.5;
}

- (CGPoint)_center
{
  [(PKRingGradientView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (double)_maskRadius
{
  [(PKRingGradientView *)self ringWidth];
  double v4 = v3;
  [(PKRingGradientView *)self strokeWidth];
  return (v4 + v5) * 0.5;
}

- (CGPoint)_centerPointForMaskViewWithAngle:(double)a3 adjustToCover:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKRingGradientView *)self _center];
  double v8 = v7;
  double v10 = v9;
  [(PKRingGradientView *)self _maskRadius];
  double v12 = v11;
  [(PKRingGradientView *)self _radius];
  double v14 = v13 - v12;
  [(PKRingGradientView *)self strokeWidth];
  double v16 = v14 + v15 * -0.5;
  if (v4)
  {
    double v17 = PKUIPixelLength();
    a3 = a3 + asin(v17 / v16) * -5.0;
  }
  __double2 v18 = __sincos_stret(a3);
  double v19 = v10 + v16 * v18.__sinval;
  double v20 = v8 + v16 * v18.__cosval;
  result.CGFloat y = v19;
  result.CGFloat x = v20;
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (double)minimumAngle
{
  return self->_minimumAngle;
}

- (double)currentAngle
{
  return self->_currentAngle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_gradientCap, 0);
  objc_storeStrong((id *)&self->_backgroundCap, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_strokeLayer, 0);
  objc_storeStrong((id *)&self->_gradientMaskLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_originalEndColor, 0);

  objc_storeStrong((id *)&self->_originalStartColor, 0);
}

@end