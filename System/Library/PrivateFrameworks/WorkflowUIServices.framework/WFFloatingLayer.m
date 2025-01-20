@interface WFFloatingLayer
- (BOOL)appliesCornerRadiusDuringTouchDownOnly;
- (BOOL)colorizesShadow;
- (BOOL)isPressed;
- (BOOL)usePillCornerRadius;
- (CAGradientLayer)gradientLayer;
- (UITraitCollection)traitCollection;
- (WFFloatingLayer)init;
- (WFGradient)gradient;
- (double)highlightedCornerRadius;
- (double)scalingFactor;
- (id)baseColor;
- (void)applyConfiguration:(id)a3;
- (void)layoutSublayers;
- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3;
- (void)setColorizesShadow:(BOOL)a3;
- (void)setGradient:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setHighlightedCornerRadius:(double)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setScalingFactor:(double)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUsePillCornerRadius:(BOOL)a3;
- (void)updateBackgroundColor;
- (void)updateShadowColor;
@end

@implementation WFFloatingLayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_gradientLayer);
  objc_storeStrong((id *)&self->_gradient, 0);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setGradientLayer:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gradientLayer);
  return (CAGradientLayer *)WeakRetained;
}

- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3
{
  self->_appliesCornerRadiusDuringTouchDownOnly = a3;
}

- (BOOL)appliesCornerRadiusDuringTouchDownOnly
{
  return self->_appliesCornerRadiusDuringTouchDownOnly;
}

- (void)setHighlightedCornerRadius:(double)a3
{
  self->_highlightedCornerRadius = a3;
}

- (double)highlightedCornerRadius
{
  return self->_highlightedCornerRadius;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setUsePillCornerRadius:(BOOL)a3
{
  self->_usePillCornerRadius = a3;
}

- (BOOL)usePillCornerRadius
{
  return self->_usePillCornerRadius;
}

- (void)setColorizesShadow:(BOOL)a3
{
  self->_colorizesShadow = a3;
}

- (BOOL)colorizesShadow
{
  return self->_colorizesShadow;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (WFGradient)gradient
{
  return self->_gradient;
}

- (void)layoutSublayers
{
  v21.receiver = self;
  v21.super_class = (Class)WFFloatingLayer;
  [(WFFloatingLayer *)&v21 layoutSublayers];
  [(WFFloatingLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(WFFloatingLayer *)self gradientLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if ([(WFFloatingLayer *)self usePillCornerRadius])
  {
    [(WFFloatingLayer *)self setCornerRadius:v10 * 0.5];
    v12 = [(WFFloatingLayer *)self gradientLayer];
    [v12 setCornerRadius:v10 * 0.5];
  }
  [(WFFloatingLayer *)self shadowOpacity];
  if (v13 == 0.0)
  {
    if ([(WFFloatingLayer *)self shadowPath]) {
      [(WFFloatingLayer *)self setShadowPath:0];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x263F824C0];
    [(WFFloatingLayer *)self cornerRadius];
    v16 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v15);
    if ([MEMORY[0x263F82E00] areAnimationsEnabled]
      && (v22.origin.x = v4, v22.origin.y = v6, v22.size.width = v8, v22.size.height = v10, !CGRectIsEmpty(v22)))
    {
      [(WFFloatingLayer *)self setShadowPath:0];
      [MEMORY[0x263F82E00] inheritedAnimationDuration];
      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __34__WFFloatingLayer_layoutSublayers__block_invoke;
      v19[3] = &unk_2642A5EC8;
      v19[4] = self;
      id v20 = v16;
      dispatch_after(v18, MEMORY[0x263EF83A0], v19);
    }
    else
    {
      -[WFFloatingLayer setShadowPath:](self, "setShadowPath:", [v16 CGPath]);
    }
  }
}

uint64_t __34__WFFloatingLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) CGPath];
  double v3 = *(void **)(a1 + 32);
  return [v3 setShadowPath:v2];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  v45[2] = *MEMORY[0x263EF8340];
  if (self->_pressed != a3)
  {
    BOOL v4 = a3;
    self->_pressed = a3;
    if (a4) {
      double v6 = 0.0799999982;
    }
    else {
      double v6 = 0.0;
    }
    double v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
    double v8 = [(WFFloatingLayer *)self presentationLayer];
    double v9 = [v8 valueForKeyPath:@"transform.scale"];
    [v7 setFromValue:v9];

    double v10 = NSNumber;
    double v11 = 1.0;
    double v12 = 1.0;
    if (v4)
    {
      [(WFFloatingLayer *)self scalingFactor];
      double v11 = 0.5;
    }
    float v13 = [v10 numberWithDouble:v12];
    [v7 setToValue:v13];

    v14 = (void *)MEMORY[0x263F15760];
    double v15 = NSStringFromSelector(sel_shadowRadius);
    v16 = [v14 animationWithKeyPath:v15];

    double v17 = [(WFFloatingLayer *)self presentationLayer];
    dispatch_time_t v18 = NSStringFromSelector(sel_shadowRadius);
    v19 = [v17 valueForKeyPath:v18];
    [v16 setFromValue:v19];

    id v20 = NSNumber;
    [(WFFloatingLayer *)self shadowRadius];
    CGRect v22 = [v20 numberWithDouble:v11 * v21];
    [v16 setToValue:v22];

    v23 = [MEMORY[0x263F15750] animation];
    v45[0] = v7;
    v45[1] = v16;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
    [v23 setAnimations:v24];

    [v23 setDuration:v6];
    [v23 setFillMode:*MEMORY[0x263F15AB0]];
    [v23 setRemovedOnCompletion:!v4];
    v25 = [(WFFloatingLayer *)self gradient];
    if (v25)
    {
      v26 = (void *)MEMORY[0x263F15760];
      v27 = NSStringFromSelector(sel_backgroundColor);
      v28 = [v26 animationWithKeyPath:v27];

      v29 = [(WFFloatingLayer *)self presentationLayer];
      v30 = NSStringFromSelector(sel_backgroundColor);
      v31 = [v29 valueForKeyPath:v30];
      [v28 setFromValue:v31];

      if (v4)
      {
        id v32 = [v25 baseColor];
        v33 = [v32 platformColor];
        WFDarkenColor(v33, 0.0500000007, 0.150000006);
        id v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setToValue:", objc_msgSend(v34, "CGColor"));
      }
      else
      {
        id v32 = [(WFFloatingLayer *)self baseColor];
        objc_msgSend(v28, "setToValue:", objc_msgSend(v32, "CGColor"));
      }

      v35 = [v23 animations];
      v36 = [v35 arrayByAddingObject:v28];
      [v23 setAnimations:v36];
    }
    [(WFFloatingLayer *)self highlightedCornerRadius];
    if (v37 != 0.0)
    {
      if (v4)
      {
        uint64_t v38 = *MEMORY[0x263F15A20];
        [(WFFloatingLayer *)self setCornerCurve:*MEMORY[0x263F15A20]];
        [(WFFloatingLayer *)self highlightedCornerRadius];
        -[WFFloatingLayer setCornerRadius:](self, "setCornerRadius:");
        v39 = [(WFFloatingLayer *)self gradientLayer];
        [v39 setCornerCurve:v38];

        [(WFFloatingLayer *)self highlightedCornerRadius];
        double v41 = v40;
        v42 = [(WFFloatingLayer *)self gradientLayer];
        [v42 setCornerRadius:v41];
      }
      else
      {
        [MEMORY[0x263F158F8] begin];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __39__WFFloatingLayer_setPressed_animated___block_invoke;
        v44[3] = &unk_2642A5EA0;
        v44[4] = self;
        [MEMORY[0x263F158F8] setCompletionBlock:v44];
      }
    }
    [(WFFloatingLayer *)self addAnimation:v23 forKey:@"WFFloatingLayerPressed"];
    [(WFFloatingLayer *)self highlightedCornerRadius];
    if (v43 != 0.0 && !v4) {
      [MEMORY[0x263F158F8] commit];
    }
  }
}

void __39__WFFloatingLayer_setPressed_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCornerRadius:0.0];
  id v2 = [*(id *)(a1 + 32) gradientLayer];
  [v2 setCornerRadius:0.0];
}

- (void)setPressed:(BOOL)a3
{
}

- (void)updateShadowColor
{
  if ([(WFFloatingLayer *)self colorizesShadow])
  {
    id v7 = [(WFFloatingLayer *)self gradient];
    double v3 = [v7 baseColor];
    BOOL v4 = [v3 platformColor];
    WFDarkenColor(v4, 0.300000012, 0.300000012);
    id v5 = objc_claimAutoreleasedReturnValue();
    -[WFFloatingLayer setShadowColor:](self, "setShadowColor:", [v5 CGColor]);
  }
  else
  {
    CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x263F001C0]);
    [(WFFloatingLayer *)self setShadowColor:ConstantColor];
  }
}

- (void)updateBackgroundColor
{
  id v3 = [(WFFloatingLayer *)self baseColor];
  -[WFFloatingLayer setBackgroundColor:](self, "setBackgroundColor:", [v3 CGColor]);
}

- (id)baseColor
{
  id v3 = [(WFFloatingLayer *)self traitCollection];
  BOOL v4 = -[WFGradient baseColorForDarkMode:highContrast:](self->_gradient, "baseColorForDarkMode:highContrast:", [v3 userInterfaceStyle] == 2, objc_msgSend(v3, "accessibilityContrast") == 1);

  return v4;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  [(WFFloatingLayer *)self updateBackgroundColor];
}

- (void)applyConfiguration:(id)a3
{
  id v15 = a3;
  [v15 shadowOpacity];
  -[WFFloatingLayer setShadowOpacity:](self, "setShadowOpacity:");
  [v15 shadowOffset];
  -[WFFloatingLayer setShadowOffset:](self, "setShadowOffset:");
  [v15 shadowRadius];
  -[WFFloatingLayer setShadowRadius:](self, "setShadowRadius:");
  -[WFFloatingLayer setColorizesShadow:](self, "setColorizesShadow:", [v15 colorizesShadow]);
  -[WFFloatingLayer setUsePillCornerRadius:](self, "setUsePillCornerRadius:", [v15 usePillCornerRadius]);
  [v15 scalingFactor];
  -[WFFloatingLayer setScalingFactor:](self, "setScalingFactor:");
  if ([v15 usePillCornerRadius])
  {
    [(WFFloatingLayer *)self setCornerCurve:*MEMORY[0x263F15A10]];
  }
  else if ([v15 appliesCornerRadiusDuringTouchDownOnly])
  {
    [v15 cornerRadius];
    -[WFFloatingLayer setHighlightedCornerRadius:](self, "setHighlightedCornerRadius:");
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F15A20];
    [(WFFloatingLayer *)self setCornerCurve:*MEMORY[0x263F15A20]];
    [v15 cornerRadius];
    -[WFFloatingLayer setCornerRadius:](self, "setCornerRadius:");
    id v5 = [(WFFloatingLayer *)self gradientLayer];
    [v5 setCornerCurve:v4];

    [v15 cornerRadius];
    double v7 = v6;
    double v8 = [(WFFloatingLayer *)self gradientLayer];
    [v8 setCornerRadius:v7];
  }
  double v9 = [(WFFloatingLayer *)self gradientLayer];
  uint64_t v10 = [v15 gradientDirection];
  double v11 = 1.0;
  double v12 = 0.5;
  double v13 = 0.0;
  double v14 = 0.5;
  switch(v10)
  {
    case 0:
      goto LABEL_12;
    case 1:
      double v12 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
      double v11 = 0.5;
      goto LABEL_10;
    case 2:
      double v12 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
      goto LABEL_10;
    case 3:
      double v12 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
      double v11 = 0.0;
LABEL_10:
      double v14 = 1.0;
      goto LABEL_12;
    case 4:
      double v12 = 0.25;
LABEL_12:
      objc_msgSend(v9, "setStartPoint:", v12, v13);
      objc_msgSend(v9, "setEndPoint:", v14, v11);
      break;
    default:
      break;
  }
  [(WFFloatingLayer *)self updateShadowColor];
  [(WFFloatingLayer *)self setNeedsLayout];
}

- (void)setGradient:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (WFGradient *)[v4 copy];
  gradient = self->_gradient;
  self->_gradient = v5;

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(WFFloatingLayer *)self updateShadowColor];
  [(WFFloatingLayer *)self updateBackgroundColor];
  double v7 = [(WFFloatingLayer *)self gradientLayer];
  double v8 = v7;
  if (v4)
  {
    id v9 = [v4 startColor];
    v12[0] = [v9 CGColor];
    id v10 = [v4 endColor];
    v12[1] = [v10 CGColor];
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    [v8 setColors:v11];
  }
  else
  {
    [v7 setColors:MEMORY[0x263EFFA68]];
  }
  [MEMORY[0x263F158F8] commit];
}

- (WFFloatingLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingLayer;
  id v2 = [(WFFloatingLayer *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F157D0]);
    [v3 setBackgroundColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x263F001C8])];
    [(WFFloatingLayer *)v2 addSublayer:v3];
    objc_storeWeak((id *)&v2->_gradientLayer, v3);
    id v4 = v2;
  }
  return v2;
}

@end