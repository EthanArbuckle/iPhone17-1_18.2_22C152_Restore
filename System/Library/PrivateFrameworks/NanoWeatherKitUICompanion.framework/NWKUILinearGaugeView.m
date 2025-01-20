@interface NWKUILinearGaugeView
- ($1AB5FA073B851C12C2339EC22442E995)layoutConstants;
- (BOOL)shouldIncludeBackground;
- (BOOL)shouldRenderValueAsPercentage;
- (CAGradientLayer)backgroundGaugeLayer;
- (CAGradientLayer)gaugeLayer;
- (CALayer)gaugeWrapperLayer;
- (CGPoint)_centerOfValueIndicator:(id)a3;
- (CGRect)valueIndicatorCutoutFrame;
- (CGSize)intrinsicContentSize;
- (NSArray)backgroundColorIndices;
- (NSArray)colorIndices;
- (NWKUILinearGaugeView)initWithLayoutConstants:(id)a3;
- (UIColor)indicatorFillColor;
- (UIView)valueIndicator;
- (double)highValue;
- (double)lastLayoutSubviewsHeight;
- (double)value;
- (id)_cgColorsFromColorIndices:(id)a3;
- (id)_createGradientLayer;
- (void)_applyCGColors:(id)a3 toGradientLayer:(id)a4;
- (void)_gradientLocationInformationForGaugeWithHeight:(double)a3 colorIndices:(id)a4 handler:(id)a5;
- (void)_setNeedsUpdateGauge;
- (void)applyBackgroundGaugeFilters:(id)a3 fraction:(double)a4;
- (void)applyForegroundGaugeFilters:(id)a3;
- (void)applyIndicatorFillColor:(id)a3;
- (void)interpolateIndicatorWithColor:(id)a3 fraction:(double)a4;
- (void)layoutSubviews;
- (void)setBackgroundColorIndices:(id)a3;
- (void)setBackgroundGaugeLayer:(id)a3;
- (void)setColorIndices:(id)a3;
- (void)setGaugeLayer:(id)a3;
- (void)setGaugeWrapperLayer:(id)a3;
- (void)setHighValue:(double)a3;
- (void)setIncludeBackground:(BOOL)a3;
- (void)setIndicatorFillColor:(id)a3;
- (void)setLastLayoutSubviewsHeight:(double)a3;
- (void)setLayoutConstants:(id)a3;
- (void)setRenderValueAsPercentage:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValueIndicator:(id)a3;
- (void)setValueIndicatorCutoutFrame:(CGRect)a3;
@end

@implementation NWKUILinearGaugeView

- (NWKUILinearGaugeView)initWithLayoutConstants:(id)a3
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v24.receiver = self;
  v24.super_class = (Class)NWKUILinearGaugeView;
  v6 = -[NWKUILinearGaugeView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_layoutConstants.width = var0;
    v6->_layoutConstants.indicatorDiameter = var1;
    v6->_layoutConstants.indicatorStrokeWidth = var2;
    id v8 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(NWKUILinearGaugeView *)v7 setGaugeWrapperLayer:v8];

    CATransform3DMakeScale(&v23, 1.0, -1.0, 1.0);
    v9 = [(NWKUILinearGaugeView *)v7 gaugeWrapperLayer];
    CATransform3D v22 = v23;
    [v9 setTransform:&v22];

    v10 = [(NWKUILinearGaugeView *)v7 _createGradientLayer];
    LODWORD(v11) = 1050253722;
    [v10 setOpacity:v11];
    [(NWKUILinearGaugeView *)v7 setBackgroundGaugeLayer:v10];

    v12 = [(NWKUILinearGaugeView *)v7 gaugeWrapperLayer];
    v13 = [(NWKUILinearGaugeView *)v7 backgroundGaugeLayer];
    [v12 addSublayer:v13];

    v14 = [(NWKUILinearGaugeView *)v7 _createGradientLayer];
    [(NWKUILinearGaugeView *)v7 setGaugeLayer:v14];

    v15 = [(NWKUILinearGaugeView *)v7 gaugeWrapperLayer];
    v16 = [(NWKUILinearGaugeView *)v7 gaugeLayer];
    [v15 addSublayer:v16];

    v17 = [(NWKUILinearGaugeView *)v7 layer];
    v18 = [(NWKUILinearGaugeView *)v7 gaugeWrapperLayer];
    [v17 addSublayer:v18];

    v19 = [[NWKUILinearGaugeValueIndicatorView alloc] initWithDiameter:var1];
    valueIndicator = v7->_valueIndicator;
    v7->_valueIndicator = &v19->super;

    [(UIView *)v7->_valueIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v7->_valueIndicator setHidden:1];
    [(NWKUILinearGaugeView *)v7 addSubview:v7->_valueIndicator];
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = var1;
    v25.size.height = var1;
    CGRect v26 = CGRectInset(v25, -var2, -var2);
    v7->_valueIndicatorCutoutFrame = CGRectOffset(v26, var2, var2);
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  [(NWKUILinearGaugeView *)self layoutConstants];
  double v3 = *MEMORY[0x263F83C20];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)NWKUILinearGaugeView;
  [(NWKUILinearGaugeView *)&v62 layoutSubviews];
  [(NWKUILinearGaugeView *)self bounds];
  double Height = CGRectGetHeight(v63);
  [(NWKUILinearGaugeView *)self lastLayoutSubviewsHeight];
  if (Height != v4)
  {
    [(NWKUILinearGaugeView *)self setLastLayoutSubviewsHeight:Height];
    [(NWKUILinearGaugeView *)self layoutConstants];
    double v6 = v5;
    [(NWKUILinearGaugeView *)self bounds];
    double v7 = (CGRectGetWidth(v64) - v6) * 0.5;
    [(NWKUILinearGaugeView *)self highValue];
    double v9 = Height * v8;
    [(NWKUILinearGaugeView *)self valueIndicatorCutoutFrame];
    double v10 = CGRectGetHeight(v65);
    if (v9 < v10) {
      double v9 = v10;
    }
    double v11 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v13 = [(NWKUILinearGaugeView *)self gaugeWrapperLayer];
    objc_msgSend(v13, "setFrame:", v7, 0.0, v6, Height);

    v14 = [(NWKUILinearGaugeView *)self backgroundGaugeLayer];
    objc_msgSend(v14, "setBounds:", v11, v12, v6, Height);

    v15 = [(NWKUILinearGaugeView *)self gaugeLayer];
    objc_msgSend(v15, "setBounds:", v11, v12, v6, v9);

    [MEMORY[0x263F158F8] commit];
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy_;
    v60 = __Block_byref_object_dispose_;
    id v61 = 0;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __38__NWKUILinearGaugeView_layoutSubviews__block_invoke;
    v55[3] = &unk_2649DE0E0;
    v55[4] = &v56;
    v16 = (void *)MEMORY[0x230FA6310](v55);
    v17 = [(NWKUILinearGaugeView *)self backgroundColorIndices];
    [(NWKUILinearGaugeView *)self _gradientLocationInformationForGaugeWithHeight:v17 colorIndices:v16 handler:Height];

    if (![(id)v57[5] count])
    {
      v18 = (void *)v57[5];
      v57[5] = (uint64_t)&unk_26E23D7C8;
    }
    id v19 = (id)v57[5];

    _Block_object_dispose(&v56, 8);
    v20 = [(NWKUILinearGaugeView *)self backgroundGaugeLayer];
    [v20 setLocations:v19];

    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy_;
    v60 = __Block_byref_object_dispose_;
    id v61 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    id v54 = 0;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __38__NWKUILinearGaugeView_layoutSubviews__block_invoke_10;
    v48[3] = &unk_2649DE108;
    v48[4] = &v56;
    v48[5] = &v49;
    v21 = (void *)MEMORY[0x230FA6310](v48);
    CATransform3D v22 = [(NWKUILinearGaugeView *)self colorIndices];
    [(NWKUILinearGaugeView *)self _gradientLocationInformationForGaugeWithHeight:v22 colorIndices:v21 handler:v9];

    if (![(id)v57[5] count])
    {
      CATransform3D v23 = (void *)v57[5];
      v57[5] = (uint64_t)&unk_26E23D7E0;
    }
    uint64_t v24 = v57[5];
    CGRect v25 = [(NWKUILinearGaugeView *)self gaugeLayer];
    [v25 setLocations:v24];

    [(NWKUILinearGaugeView *)self value];
    if (v26 == 2.22507386e-308)
    {
      v27 = [(NWKUILinearGaugeView *)self gaugeWrapperLayer];
      [v27 setMask:0];

      id v28 = [(NWKUILinearGaugeView *)self valueIndicator];
      [v28 setHidden:1];
    }
    else
    {
      uint64_t v29 = v50[5];
      if (!v29)
      {
        uint64_t v30 = [(id)v57[5] lastObject];
        v31 = (void *)v50[5];
        v50[5] = v30;

        uint64_t v29 = v50[5];
      }
      [(NWKUILinearGaugeView *)self _centerOfValueIndicator:v29];
      double v46 = v33;
      double v47 = v32;
      [(NWKUILinearGaugeView *)self valueIndicatorCutoutFrame];
      CGFloat x = v66.origin.x;
      CGFloat y = v66.origin.y;
      CGFloat width = v66.size.width;
      CGFloat v37 = v66.size.height;
      double MidX = CGRectGetMidX(v66);
      v67.origin.CGFloat x = x;
      v67.origin.CGFloat y = y;
      v67.size.CGFloat width = width;
      v67.size.height = v37;
      double MidY = CGRectGetMidY(v67);
      v68.origin.CGFloat x = x;
      v68.origin.CGFloat y = y;
      v68.size.CGFloat width = width;
      v68.size.height = v37;
      CGFloat v40 = CGRectGetWidth(v68);
      v69.origin.CGFloat x = x;
      v69.origin.CGFloat y = y;
      v69.size.CGFloat width = width;
      v69.size.height = v37;
      CGFloat v41 = CGRectGetHeight(v69);
      id v28 = objc_alloc_init(MEMORY[0x263F15880]);
      [(NWKUILinearGaugeView *)self bounds];
      objc_msgSend(v28, "setFrame:");
      [v28 setFillRule:*MEMORY[0x263F15AC0]];
      Mutable = CGPathCreateMutable();
      [(NWKUILinearGaugeView *)self bounds];
      CGPathAddRect(Mutable, 0, v70);
      v71.origin.CGFloat x = v47 - MidX;
      v71.origin.CGFloat y = v46 - MidY;
      v71.size.CGFloat width = v40;
      v71.size.height = v41;
      CGPathAddEllipseInRect(Mutable, 0, v71);
      [v28 setPath:Mutable];
      v43 = [(NWKUILinearGaugeView *)self gaugeWrapperLayer];
      [v43 setMask:v28];

      v44 = [(NWKUILinearGaugeView *)self valueIndicator];
      objc_msgSend(v44, "setCenter:", v47, Height - v46);

      v45 = [(NWKUILinearGaugeView *)self valueIndicator];
      [v45 setHidden:0];
    }
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v56, 8);
  }
}

void __38__NWKUILinearGaugeView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
}

void __38__NWKUILinearGaugeView_layoutSubviews__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)applyForegroundGaugeFilters:(id)a3
{
  id v4 = a3;
  id v5 = [(NWKUILinearGaugeView *)self gaugeLayer];
  [v5 setFilters:v4];
}

- (void)applyBackgroundGaugeFilters:(id)a3 fraction:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(NWKUILinearGaugeView *)self backgroundGaugeLayer];
  [v7 setFilters:v6];

  *(float *)&a4 = a4 * -0.1 + 0.3;
  id v9 = [(NWKUILinearGaugeView *)self backgroundGaugeLayer];
  LODWORD(v8) = LODWORD(a4);
  [v9 setOpacity:v8];
}

- (void)applyIndicatorFillColor:(id)a3
{
  id v4 = a3;
  [(NWKUILinearGaugeView *)self setIndicatorFillColor:v4];
  id v5 = [(NWKUILinearGaugeView *)self valueIndicator];
  [v5 setBackgroundColor:v4];
}

- (void)interpolateIndicatorWithColor:(id)a3 fraction:(double)a4
{
  id v6 = a3;
  id v9 = [(NWKUILinearGaugeView *)self indicatorFillColor];
  uint64_t v7 = NWMInterpolateBetweenColors(v9, v6, a4);

  double v8 = [(NWKUILinearGaugeView *)self valueIndicator];
  [v8 setBackgroundColor:v7];
}

- (void)setBackgroundColorIndices:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_backgroundColorIndices, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_backgroundColorIndices, a3);
    id v5 = [(NWKUILinearGaugeView *)self _cgColorsFromColorIndices:v7];
    id v6 = [(NWKUILinearGaugeView *)self backgroundGaugeLayer];
    [(NWKUILinearGaugeView *)self _applyCGColors:v5 toGradientLayer:v6];
  }
}

- (void)setColorIndices:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_colorIndices, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_colorIndices, a3);
    id v5 = [(NWKUILinearGaugeView *)self _cgColorsFromColorIndices:v7];
    id v6 = [(NWKUILinearGaugeView *)self gaugeLayer];
    [(NWKUILinearGaugeView *)self _applyCGColors:v5 toGradientLayer:v6];
  }
}

- (void)setHighValue:(double)a3
{
  if (self->_highValue != a3)
  {
    self->_highValue = a3;
    [(NWKUILinearGaugeView *)self _setNeedsUpdateGauge];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    [(NWKUILinearGaugeView *)self _setNeedsUpdateGauge];
  }
}

- (void)_applyCGColors:(id)a3 toGradientLayer:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 count])
  {
    [v6 setHidden:0];
    [v6 setColors:v7];
  }
  else
  {
    [v6 setHidden:1];
  }
  [(NWKUILinearGaugeView *)self _setNeedsUpdateGauge];
}

- (id)_cgColorsFromColorIndices:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  if ([v3 count] == 1)
  {
    id v5 = [v3 firstObject];
    id v6 = [v5 color];
    objc_msgSend(v4, "addObject:", objc_msgSend(v6, "CGColor"));

    id v7 = [v3 firstObject];
    id v8 = [v7 color];
    objc_msgSend(v4, "addObject:", objc_msgSend(v8, "CGColor"));
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v3;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "color", (void)v16);
          id v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", objc_msgSend(v13, "CGColor"));
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }

  v14 = (void *)[v4 copy];
  return v14;
}

- (CGPoint)_centerOfValueIndicator:(id)a3
{
  id v4 = a3;
  [(NWKUILinearGaugeView *)self bounds];
  double Height = CGRectGetHeight(v16);
  if ([(NWKUILinearGaugeView *)self shouldRenderValueAsPercentage])
  {
    [(NWKUILinearGaugeView *)self value];
    if (v6 <= 0.05)
    {
      [(NWKUILinearGaugeView *)self layoutConstants];
      double v9 = v10 * 0.5;
      goto LABEL_9;
    }
    [(NWKUILinearGaugeView *)self value];
    if (v7 >= 0.95)
    {
      [(NWKUILinearGaugeView *)self layoutConstants];
      double v9 = Height + v11 * -0.5;
      goto LABEL_9;
    }
    [(NWKUILinearGaugeView *)self value];
  }
  else
  {
    [v4 doubleValue];
  }
  double v9 = Height * v8;
LABEL_9:
  [(NWKUILinearGaugeView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v17);

  double v13 = MidX;
  double v14 = v9;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (id)_createGradientLayer
{
  [(NWKUILinearGaugeView *)self layoutConstants];
  double v3 = v2;
  id v4 = objc_alloc_init(MEMORY[0x263F157D0]);
  objc_msgSend(v4, "setAnchorPoint:", 0.0, 0.0);
  [v4 setBorderColor:0];
  [v4 setCornerRadius:v3 * 0.5];
  [v4 setCornerCurve:*MEMORY[0x263F15A20]];
  return v4;
}

- (void)_gradientLocationInformationForGaugeWithHeight:(double)a3 colorIndices:(id)a4 handler:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v35 = (void (**)(id, void *, void *))a5;
  double v9 = [v8 firstObject];
  [v9 value];
  double v11 = v10;

  double v12 = [v8 lastObject];
  [v12 value];
  double v14 = v13;

  [(NWKUILinearGaugeView *)self layoutConstants];
  double v16 = v15;
  CGRect v17 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    double v22 = v14 - v11;
    double v23 = v16 * 0.5 + 0.5;
    double v24 = (a3 + v23 * -2.0) / a3;
    double v25 = v23 / a3;
    uint64_t v26 = *(void *)v37;
    double v27 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        double v29 = v27;
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) value];
        double v27 = v30;
        double v31 = (v30 - v29) * 0.5;
        if (v29 == 1.79769313e308) {
          double v31 = 0.0;
        }
        double v32 = v25 + v24 * ((v27 - v31 - v11) / v22);
        double v33 = [NSNumber numberWithDouble:v32];
        [v17 addObject:v33];

        if (!v21)
        {
          [(NWKUILinearGaugeView *)self value];
          if (v27 >= v34)
          {
            uint64_t v21 = [NSNumber numberWithDouble:v32];
          }
          else
          {
            uint64_t v21 = 0;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }
  else
  {
    uint64_t v21 = 0;
  }

  v35[2](v35, v17, v21);
}

- (void)_setNeedsUpdateGauge
{
  [(NWKUILinearGaugeView *)self setLastLayoutSubviewsHeight:0.0];
  [(NWKUILinearGaugeView *)self setNeedsLayout];
}

- (NSArray)backgroundColorIndices
{
  return self->_backgroundColorIndices;
}

- (NSArray)colorIndices
{
  return self->_colorIndices;
}

- (double)highValue
{
  return self->_highValue;
}

- (double)value
{
  return self->_value;
}

- (BOOL)shouldIncludeBackground
{
  return self->_includeBackground;
}

- (void)setIncludeBackground:(BOOL)a3
{
  self->_includeBackground = a3;
}

- (BOOL)shouldRenderValueAsPercentage
{
  return self->_renderValueAsPercentage;
}

- (void)setRenderValueAsPercentage:(BOOL)a3
{
  self->_renderValueAsPercentage = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)layoutConstants
{
  double width = self->_layoutConstants.width;
  double indicatorDiameter = self->_layoutConstants.indicatorDiameter;
  double indicatorStrokeWidth = self->_layoutConstants.indicatorStrokeWidth;
  result.double var2 = indicatorStrokeWidth;
  result.double var1 = indicatorDiameter;
  result.double var0 = width;
  return result;
}

- (void)setLayoutConstants:(id)a3
{
  self->_layoutConstants = ($3194F4A8F1698E655BCF43E4635B14A7)a3;
}

- (double)lastLayoutSubviewsHeight
{
  return self->_lastLayoutSubviewsHeight;
}

- (void)setLastLayoutSubviewsHeight:(double)a3
{
  self->_lastLayoutSubviewsdouble Height = a3;
}

- (CALayer)gaugeWrapperLayer
{
  return self->_gaugeWrapperLayer;
}

- (void)setGaugeWrapperLayer:(id)a3
{
}

- (CAGradientLayer)backgroundGaugeLayer
{
  return self->_backgroundGaugeLayer;
}

- (void)setBackgroundGaugeLayer:(id)a3
{
}

- (CAGradientLayer)gaugeLayer
{
  return self->_gaugeLayer;
}

- (void)setGaugeLayer:(id)a3
{
}

- (UIView)valueIndicator
{
  return self->_valueIndicator;
}

- (void)setValueIndicator:(id)a3
{
}

- (CGRect)valueIndicatorCutoutFrame
{
  double x = self->_valueIndicatorCutoutFrame.origin.x;
  double y = self->_valueIndicatorCutoutFrame.origin.y;
  double width = self->_valueIndicatorCutoutFrame.size.width;
  double height = self->_valueIndicatorCutoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setValueIndicatorCutoutFrame:(CGRect)a3
{
  self->_valueIndicatorCutoutFrame = a3;
}

- (UIColor)indicatorFillColor
{
  return self->_indicatorFillColor;
}

- (void)setIndicatorFillColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorFillColor, 0);
  objc_storeStrong((id *)&self->_valueIndicator, 0);
  objc_storeStrong((id *)&self->_gaugeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundGaugeLayer, 0);
  objc_storeStrong((id *)&self->_gaugeWrapperLayer, 0);
  objc_storeStrong((id *)&self->_colorIndices, 0);
  objc_storeStrong((id *)&self->_backgroundColorIndices, 0);
}

@end