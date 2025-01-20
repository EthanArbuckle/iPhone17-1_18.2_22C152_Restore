@interface STUIStatusBarActivityView
- (BOOL)isSlow;
- (CAGradientLayer)barLayer;
- (CALayer)mainLayer;
- (CALayer)pointLayer;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarActivityView)initWithCoder:(id)a3;
- (STUIStatusBarActivityView)initWithFrame:(CGRect)a3;
- (STUIStatusBarCycleAnimation)cycleAnimation;
- (UIColor)color;
- (double)_thicknessForTraitCollection:(id)a3;
- (double)thickness;
- (void)_commonInit;
- (void)_displayScaleChanged;
- (void)_stopAnimatingWithStoppingAnimations:(BOOL)a3 completionHandler:(id)a4;
- (void)applyStyleAttributes:(id)a3;
- (void)setBarLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setCycleAnimation:(id)a3;
- (void)setIsSlow:(BOOL)a3;
- (void)setMainLayer:(id)a3;
- (void)setPointLayer:(id)a3;
- (void)setThickness:(double)a3;
- (void)startAnimating;
- (void)stopAnimatingWithCompletionHandler:(id)a3;
@end

@implementation STUIStatusBarActivityView

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageTintColor];
  BOOL v6 = [v4 style] == 1;

  id v7 = [v5 colorWithAlphaComponent:dbl_1D7ED6780[v6]];

  [(STUIStatusBarActivityView *)self setColor:v7];
}

- (void)_commonInit
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BE8] layer];
  mainLayer = self->_mainLayer;
  self->_mainLayer = v3;

  v5 = [MEMORY[0x1E4F39BD0] layer];
  barLayer = self->_barLayer;
  self->_barLayer = v5;

  -[CAGradientLayer setStartPoint:](self->_barLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_barLayer, "setEndPoint:", 1.0, 0.5);
  [(CAGradientLayer *)self->_barLayer setLocations:&unk_1F2F9C9A8];
  [(CALayer *)self->_mainLayer addSublayer:self->_barLayer];
  id v7 = [MEMORY[0x1E4F39BE8] layer];
  pointLayer = self->_pointLayer;
  self->_pointLayer = v7;

  [(CALayer *)self->_mainLayer addSublayer:self->_pointLayer];
  v9 = [(STUIStatusBarActivityView *)self layer];
  [v9 addSublayer:self->_mainLayer];

  LODWORD(v10) = 1112014848;
  [(STUIStatusBarActivityView *)self setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1112014848;
  [(STUIStatusBarActivityView *)self setContentCompressionResistancePriority:0 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(STUIStatusBarActivityView *)self setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(STUIStatusBarActivityView *)self setContentCompressionResistancePriority:1 forAxis:v13];
  v14 = self;
  v17[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v16 = (id)[(STUIStatusBarActivityView *)self registerForTraitChanges:v15 withAction:sel__displayScaleChanged];

  [(STUIStatusBarActivityView *)self _displayScaleChanged];
}

- (STUIStatusBarActivityView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarActivityView;
  v3 = -[STUIStatusBarActivityView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STUIStatusBarActivityView *)v3 _commonInit];
  return v3;
}

- (STUIStatusBarActivityView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarActivityView;
  v3 = [(STUIStatusBarActivityView *)&v5 initWithCoder:a3];
  [(STUIStatusBarActivityView *)v3 _commonInit];
  return v3;
}

- (void)startAnimating
{
  v51[2] = *MEMORY[0x1E4F143B8];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [(STUIStatusBarActivityView *)self bounds];
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    CGFloat v12 = v8;
    if (self->_isSlow) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.75;
    }
    double thickness = self->_thickness;
    CGFloat Width = CGRectGetWidth(*(CGRect *)&v5);
    -[CAGradientLayer setFrame:](self->_barLayer, "setFrame:", -(Width * 0.5 - self->_thickness), 0.0, Width * 0.5 - self->_thickness + Width * 0.5 - self->_thickness);
    id v16 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
    [v16 setRemovedOnCompletion:0];
    uint64_t v17 = *MEMORY[0x1E4F39FA8];
    [v16 setFillMode:*MEMORY[0x1E4F39FA8]];
    v52.origin.x = v9;
    v52.origin.y = v10;
    v52.size.width = v11;
    v52.size.height = v12;
    double v18 = thickness * 0.5;
    v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18 + CGRectGetMinX(v52), v18);
    v51[0] = v19;
    v53.origin.x = v9;
    v53.origin.y = v10;
    v53.size.width = v11;
    v53.size.height = v12;
    v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", CGRectGetMaxX(v53) - v18, v18);
    v51[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [v16 setValues:v21];

    [v16 setKeyTimes:&unk_1F2F9C9C0];
    uint64_t v22 = *MEMORY[0x1E4F3A490];
    v23 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    v50 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v16 setTimingFunctions:v24];

    [v16 setDuration:v13];
    [v16 setAutoreverses:1];
    LODWORD(v25) = 2139095040;
    [v16 setRepeatCount:v25];
    v26 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:self->_mainLayer animation:v16 key:@"position"];
    [v4 addObject:v26];

    v27 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
    [v27 setRemovedOnCompletion:0];
    [v27 setFillMode:v17];
    v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_thickness];
    v49[0] = v28;
    v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_thickness + 2.0];
    v49[1] = v29;
    v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_thickness];
    v49[2] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    [v27 setValues:v31];

    [v27 setKeyTimes:&unk_1F2F9C9D8];
    v32 = [MEMORY[0x1E4F39C10] functionWithName:v22];
    v48 = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v27 setTimingFunctions:v33];

    [v27 setDuration:v13];
    [v27 setAutoreverses:1];
    LODWORD(v34) = 2139095040;
    [v27 setRepeatCount:v34];
    v35 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:self->_pointLayer animation:v27 key:@"size"];
    v36 = v4;
    [v4 addObject:v35];

    v37 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"locations"];
    [v37 setTimeOffset:v13 * -0.1];
    [v37 setValues:&unk_1F2F9CA68];
    [v37 setCalculationMode:*MEMORY[0x1E4F39D80]];
    [v37 setKeyTimes:&unk_1F2F9CA80];
    v38 = [MEMORY[0x1E4F39C10] functionWithName:v22];
    v47[0] = v38;
    v39 = [MEMORY[0x1E4F39C10] functionWithName:v22];
    v47[1] = v39;
    v40 = [MEMORY[0x1E4F39C10] functionWithName:v22];
    v47[2] = v40;
    v41 = [MEMORY[0x1E4F39C10] functionWithName:v22];
    v47[3] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v37 setTimingFunctions:v42];

    [v37 setDuration:v13 + v13];
    LODWORD(v43) = 2139095040;
    [v37 setRepeatCount:v43];
    v44 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:self->_barLayer animation:v37 key:@"locations"];
    [v36 addObject:v44];

    v45 = [[STUIStatusBarCycleAnimation alloc] initWithLayerAnimations:v36];
    v46 = self->_cycleAnimation;
    self->_cycleAnimation = v45;

    cycleAnimation = self->_cycleAnimation;
  }
  [(STUIStatusBarCycleAnimation *)cycleAnimation start];
}

- (void)stopAnimatingWithCompletionHandler:(id)a3
{
  cycleAnimation = self->_cycleAnimation;
  id v5 = a3;
  [(STUIStatusBarCycleAnimation *)cycleAnimation setStopsAfterReversing:0];
  [(STUIStatusBarActivityView *)self _stopAnimatingWithStoppingAnimations:1 completionHandler:v5];
}

- (void)_stopAnimatingWithStoppingAnimations:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(STUIStatusBarCycleAnimation *)self->_cycleAnimation state] == 1 && v4)
  {
    double v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v8 setDuration:0.2];
    [v8 setToValue:&unk_1F2F9CD90];
    [v8 setRemovedOnCompletion:0];
    [v8 setFillMode:*MEMORY[0x1E4F39FA8]];
    CGFloat v9 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:self->_mainLayer animation:v8 key:@"opacity"];
    v11[0] = v9;
    CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(STUIStatusBarCycleAnimation *)self->_cycleAnimation setStoppingLayerAnimations:v10];
  }
  [(STUIStatusBarCycleAnimation *)self->_cycleAnimation stopWithCompletionHandler:v6];
}

- (void)setIsSlow:(BOOL)a3
{
  if (self->_isSlow != a3)
  {
    self->_isSlow = a3;
    int64_t v4 = [(STUIStatusBarCycleAnimation *)self->_cycleAnimation state];
    if (v4)
    {
      if (v4 == 2)
      {
        if ([(STUIStatusBarCycleAnimation *)self->_cycleAnimation stopsAfterReversing]) {
          return;
        }
        objc_initWeak(&location, self);
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __39__STUIStatusBarActivityView_setIsSlow___block_invoke_2;
        v7[3] = &unk_1E6AA4858;
        id v5 = &v8;
        objc_copyWeak(&v8, &location);
        [(STUIStatusBarActivityView *)self _stopAnimatingWithStoppingAnimations:0 completionHandler:v7];
      }
      else
      {
        if (v4 != 1) {
          return;
        }
        [(STUIStatusBarCycleAnimation *)self->_cycleAnimation setStopsAfterReversing:1];
        objc_initWeak(&location, self);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __39__STUIStatusBarActivityView_setIsSlow___block_invoke;
        v9[3] = &unk_1E6AA4858;
        id v5 = &v10;
        objc_copyWeak(&v10, &location);
        [(STUIStatusBarActivityView *)self _stopAnimatingWithStoppingAnimations:0 completionHandler:v9];
      }
      objc_destroyWeak(v5);
      objc_destroyWeak(&location);
    }
    else
    {
      cycleAnimation = self->_cycleAnimation;
      self->_cycleAnimation = 0;
    }
  }
}

void __39__STUIStatusBarActivityView_setIsSlow___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      int v3 = [WeakRetained[57] stopsAfterReversing];
      id v4 = v5[57];
      v5[57] = 0;

      WeakRetained = v5;
      if (v3)
      {
        [v5 startAnimating];
        WeakRetained = v5;
      }
    }
  }
}

void __39__STUIStatusBarActivityView_setIsSlow___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      int v3 = (void *)WeakRetained[57];
      WeakRetained[57] = 0;
      id v4 = WeakRetained;

      WeakRetained = v4;
    }
  }
}

- (double)_thicknessForTraitCollection:(id)a3
{
  [a3 displayScale];
  BOOL v4 = v3 <= 2.5;
  double result = 2.66666667;
  if (v4) {
    return 2.5;
  }
  return result;
}

- (void)setColor:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    objc_storeStrong((id *)&self->_color, a3);
    id v6 = [(UIColor *)v5 colorWithAlphaComponent:1.0];
    double v7 = [(UIColor *)v5 colorWithAlphaComponent:0.0];
    [(UIColor *)v5 alphaComponent];
    *(float *)&double v8 = v8;
    [(CALayer *)self->_mainLayer setOpacity:v8];
    id v9 = v7;
    v15[0] = [v9 CGColor];
    id v10 = v6;
    v15[1] = [v10 CGColor];
    id v11 = v10;
    v15[2] = [v11 CGColor];
    id v12 = v9;
    v15[3] = [v12 CGColor];
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    [(CAGradientLayer *)self->_barLayer setColors:v13];

    id v14 = v11;
    -[CALayer setBackgroundColor:](self->_pointLayer, "setBackgroundColor:", [v14 CGColor]);
  }
}

- (void)_displayScaleChanged
{
  double v3 = [(STUIStatusBarActivityView *)self traitCollection];
  [(STUIStatusBarActivityView *)self _thicknessForTraitCollection:v3];
  self->_double thickness = v4;

  [(CALayer *)self->_pointLayer setCornerRadius:self->_thickness * 0.5];
  -[CALayer setFrame:](self->_pointLayer, "setFrame:", self->_thickness * -0.5, 0.0, self->_thickness, self->_thickness);
  [(STUIStatusBarActivityView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double thickness = self->_thickness;
  result.height = thickness;
  result.width = v2;
  return result;
}

- (BOOL)isSlow
{
  return self->_isSlow;
}

- (UIColor)color
{
  return self->_color;
}

- (CALayer)mainLayer
{
  return self->_mainLayer;
}

- (void)setMainLayer:(id)a3
{
}

- (CAGradientLayer)barLayer
{
  return self->_barLayer;
}

- (void)setBarLayer:(id)a3
{
}

- (CALayer)pointLayer
{
  return self->_pointLayer;
}

- (void)setPointLayer:(id)a3
{
}

- (double)thickness
{
  return self->_thickness;
}

- (void)setThickness:(double)a3
{
  self->_double thickness = a3;
}

- (STUIStatusBarCycleAnimation)cycleAnimation
{
  return self->_cycleAnimation;
}

- (void)setCycleAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleAnimation, 0);
  objc_storeStrong((id *)&self->_pointLayer, 0);
  objc_storeStrong((id *)&self->_barLayer, 0);
  objc_storeStrong((id *)&self->_mainLayer, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end