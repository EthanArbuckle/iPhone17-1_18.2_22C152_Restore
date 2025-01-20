@interface STUIStatusBarCellularSignalView
+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_barCornerRadiusForIconSize:(int64_t)a3;
+ (double)_barWidthForIconSize:(int64_t)a3;
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
- (BOOL)needsCycleAnimationUpdate;
- (BOOL)needsLargerScale;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarCycleAnimation)cycleAnimation;
- (double)_heightForBarAtIndex:(int64_t)a3;
- (double)_heightForBarAtIndex:(int64_t)a3 mode:(int64_t)a4;
- (id)accessibilityHUDRepresentation;
- (void)_colorsDidChange;
- (void)_iconSizeDidChange;
- (void)_setNeedsUpdateCycleAnimation;
- (void)_updateActiveBars;
- (void)_updateBars;
- (void)_updateCycleAnimationIfNeeded;
- (void)_updateCycleAnimationNow;
- (void)_updateFromMode:(int64_t)a3;
- (void)applyStyleAttributes:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCycleAnimation:(id)a3;
- (void)setNeedsCycleAnimationUpdate:(BOOL)a3;
- (void)setNeedsLargerScale:(BOOL)a3;
@end

@implementation STUIStatusBarCellularSignalView

- (void)_colorsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularSignalView;
  [(STUIStatusBarSignalView *)&v3 _colorsDidChange];
  [(STUIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_setNeedsUpdateCycleAnimation
{
  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && [(STUIStatusBarCycleAnimation *)cycleAnimation state])
  {
    [(STUIStatusBarCellularSignalView *)self _updateCycleAnimationNow];
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
    [(STUIStatusBarCellularSignalView *)self setNeedsLayout];
  }
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  [a1 _barWidthForIconSize:a4];
  double v8 = v7;
  [a1 _interspaceForIconSize:a4];
  double v10 = v9 * (double)(a3 - 1) + (double)a3 * v8;
  objc_msgSend(a1, "_heightForNormalBarAtIndex:iconSize:");
  double v12 = v11;
  double v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 1.5;
  if ((unint64_t)a3 <= 0x11) {
    return dbl_1D7ED5F90[a3];
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 1:
      long long v9 = xmmword_1D7ED5DB0;
      long long v10 = xmmword_1D7ED5DC0;
      uint64_t v4 = 0x403A000000000000;
      goto LABEL_19;
    case 2:
      long long v6 = xmmword_1D7ED5D30;
      long long v7 = xmmword_1D7ED5DA0;
      goto LABEL_7;
    case 3:
      long long v6 = xmmword_1D7ED5C90;
      long long v7 = xmmword_1D7ED5D50;
LABEL_7:
      long long v9 = v6;
      long long v10 = v7;
      uint64_t v8 = 0x4043800000000000;
      goto LABEL_21;
    case 4:
      long long v9 = xmmword_1D7ED5D30;
      long long v10 = xmmword_1D7ED5D40;
      uint64_t v8 = 0x4045000000000000;
      goto LABEL_21;
    case 5:
      long long v9 = xmmword_1D7ED5D80;
      long long v10 = xmmword_1D7ED5D90;
      uint64_t v4 = 0x403C000000000000;
      goto LABEL_19;
    case 6:
      long long v9 = xmmword_1D7ED5D60;
      long long v10 = xmmword_1D7ED5D70;
      uint64_t v8 = 0x4045800000000000;
      goto LABEL_21;
    case 7:
      long long v9 = xmmword_1D7ED5D10;
      long long v10 = xmmword_1D7ED5D20;
      uint64_t v8 = 0x4046800000000000;
      goto LABEL_21;
    case 8:
      long long v9 = xmmword_1D7ED5CF0;
      long long v10 = xmmword_1D7ED5D00;
      uint64_t v8 = 0x4048800000000000;
      goto LABEL_21;
    case 9:
    case 15:
      long long v9 = xmmword_1D7ED5C30;
      long long v10 = xmmword_1D7ED5C40;
      uint64_t v4 = 0x4040000000000000;
      goto LABEL_19;
    case 10:
      long long v9 = xmmword_1D7ED5CB0;
      long long v10 = xmmword_1D7ED5CC0;
      uint64_t v8 = 0x4048000000000000;
      goto LABEL_21;
    case 11:
      long long v9 = xmmword_1D7ED5C90;
      long long v10 = xmmword_1D7ED5CA0;
      uint64_t v4 = 0x4041000000000000;
      goto LABEL_19;
    case 12:
      long long v9 = xmmword_1D7ED5C70;
      long long v10 = xmmword_1D7ED5C80;
      uint64_t v8 = 0x404A000000000000;
      goto LABEL_21;
    case 13:
      long long v9 = xmmword_1D7ED5CD0;
      long long v10 = xmmword_1D7ED5CE0;
      uint64_t v8 = 0x404B000000000000;
      goto LABEL_21;
    case 14:
      long long v9 = xmmword_1D7ED5C50;
      long long v10 = xmmword_1D7ED5C60;
      uint64_t v4 = 0x4038000000000000;
      goto LABEL_19;
    case 16:
      long long v9 = xmmword_1D7ED5C10;
      long long v10 = xmmword_1D7ED5C20;
      uint64_t v4 = 0x4035000000000000;
LABEL_19:
      uint64_t v11 = v4;
      double result = *((double *)&v9 + a3) * 0.5;
      break;
    case 17:
      long long v9 = xmmword_1D7ED5BF0;
      long long v10 = xmmword_1D7ED5C00;
      uint64_t v8 = 0x4040000000000000;
LABEL_21:
      uint64_t v11 = v8;
      double result = *((double *)&v9 + a3) / 3.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (double)_barWidthForIconSize:(int64_t)a3
{
  double result = 3.0;
  if ((unint64_t)a3 <= 0x10) {
    return dbl_1D7ED5E88[a3];
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = objc_opt_class();
  int64_t v4 = [(STUIStatusBarSignalView *)self numberOfBars];
  int64_t v5 = [(STUIStatusBarSignalView *)self iconSize];
  [v3 _intrinsicContentSizeForNumberOfBars:v4 iconSize:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_iconSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularSignalView;
  [(STUIStatusBarSignalView *)&v3 _iconSizeDidChange];
  [(STUIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)layoutSubviews
{
  id v22 = [(STUIStatusBarCellularSignalView *)self layer];
  objc_super v3 = [v22 sublayers];
  [(STUIStatusBarCellularSignalView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  double v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  double v15 = v14;
  if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
  {
    uint64_t v16 = 0;
    double v17 = v13 + v15;
    do
    {
      v18 = [v3 objectAtIndexedSubscript:v16];
      [(STUIStatusBarCellularSignalView *)self _heightForBarAtIndex:v16];
      double v20 = v19;
      if ([(STUIStatusBarCellularSignalView *)self _shouldReverseLayoutDirection])
      {
        v24.origin.x = v5;
        v24.origin.y = v7;
        v24.size.width = v9;
        v24.size.height = v11;
        double v21 = CGRectGetWidth(v24) - v13 - (double)v16 * v17;
      }
      else
      {
        double v21 = v17 * (double)v16;
      }
      v25.origin.x = v5;
      v25.origin.y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      objc_msgSend(v18, "setFrame:", v21, CGRectGetHeight(v25) - v20, v13, v20);

      ++v16;
    }
    while (v16 < [(STUIStatusBarSignalView *)self numberOfBars]);
  }
  [(STUIStatusBarCellularSignalView *)self _updateActiveBars];
  if ([(STUIStatusBarSignalView *)self signalMode] == 1)
  {
    [(STUIStatusBarCellularSignalView *)self _updateCycleAnimationIfNeeded];
    [(STUIStatusBarCycleAnimation *)self->_cycleAnimation start];
  }
}

- (double)_heightForBarAtIndex:(int64_t)a3 mode:(int64_t)a4
{
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      CGFloat v9 = objc_opt_class();
      int64_t v10 = [(STUIStatusBarSignalView *)self iconSize];
      [v9 _heightForNormalBarAtIndex:a3 iconSize:v10];
    }
  }
  else
  {
    CGFloat v5 = objc_opt_class();
    int64_t v6 = [(STUIStatusBarSignalView *)self iconSize];
    [v5 _barWidthForIconSize:v6];
  }
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3
{
  int64_t v5 = [(STUIStatusBarSignalView *)self signalMode];
  [(STUIStatusBarCellularSignalView *)self _heightForBarAtIndex:a3 mode:v5];
  return result;
}

- (void)_updateActiveBars
{
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarCellularSignalView;
  [(STUIStatusBarSignalView *)&v12 _updateActiveBars];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(STUIStatusBarCycleAnimation *)cycleAnimation state])
  {
    double v4 = [(STUIStatusBarSignalView *)self activeColor];
    int64_t v5 = [(STUIStatusBarSignalView *)self inactiveColor];
    int64_t v6 = [(STUIStatusBarCellularSignalView *)self layer];
    CGFloat v7 = [v6 sublayers];

    if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v8 = 0;
      do
      {
        if ([(STUIStatusBarSignalView *)self signalMode] == 2
          && v8 < [(STUIStatusBarSignalView *)self numberOfActiveBars])
        {
          CGFloat v9 = v4;
        }
        else
        {
          CGFloat v9 = v5;
        }
        uint64_t v10 = [v9 CGColor];
        CGFloat v11 = [v7 objectAtIndexedSubscript:v8];
        [v11 setBackgroundColor:v10];

        ++v8;
      }
      while (v8 < [(STUIStatusBarSignalView *)self numberOfBars]);
    }
  }
}

- (void)setNeedsLargerScale:(BOOL)a3
{
  self->_needsLargerScale = a3;
}

- (void)_updateBars
{
  if ([(STUIStatusBarSignalView *)self iconSize])
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarCellularSignalView;
    [(STUIStatusBarSignalView *)&v14 _updateBars];
    BOOL v3 = [(STUIStatusBarSignalView *)self rounded];
    double v4 = objc_opt_class();
    int64_t v5 = [(STUIStatusBarSignalView *)self iconSize];
    if (v3)
    {
      [v4 _barWidthForIconSize:v5];
      double v7 = v6 * 0.5;
    }
    else
    {
      [v4 _barCornerRadiusForIconSize:v5];
      double v7 = v8;
    }
    if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v9 = 0;
      uint64_t v10 = *MEMORY[0x1E4F39EA8];
      uint64_t v11 = *MEMORY[0x1E4F3A340];
      do
      {
        objc_super v12 = [MEMORY[0x1E4F39BE8] layer];
        objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);
        [v12 setCornerCurve:v10];
        [v12 setCornerRadius:v7];
        if ([(STUIStatusBarCellularSignalView *)self needsLargerScale])
        {
          [v12 setMinificationFilter:v11];
          [v12 setRasterizationScale:5.0];
          [v12 setShouldRasterize:1];
        }
        double v13 = [(STUIStatusBarCellularSignalView *)self layer];
        [v13 addSublayer:v12];

        ++v9;
      }
      while (v9 < [(STUIStatusBarSignalView *)self numberOfBars]);
    }
    [(STUIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
  }
}

- (BOOL)needsLargerScale
{
  return self->_needsLargerScale;
}

- (void).cxx_destruct
{
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarCellularSignalView;
  [(STUIStatusBarCellularSignalView *)&v4 didMoveToWindow];
  BOOL v3 = [(STUIStatusBarCellularSignalView *)self window];

  if (v3) {
    [(STUIStatusBarCellularSignalView *)self _updateActiveBars];
  }
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)a3 <= 0xF) {
    return dbl_1D7ED5F10[a3];
  }
  return result;
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate) {
    [(STUIStatusBarCellularSignalView *)self _updateCycleAnimationNow];
  }
}

- (void)_updateCycleAnimationNow
{
  v57[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(STUIStatusBarSignalView *)self activeColor];
  objc_super v4 = [v3 colorWithAlphaComponent:0.6];

  int64_t v5 = [(STUIStatusBarSignalView *)self inactiveColor];
  v50 = self;
  if ([(STUIStatusBarSignalView *)self iconSize])
  {
    BOOL v6 = !v4 || v5 == 0;
    if (!v6 && [(STUIStatusBarSignalView *)self numberOfBars])
    {
      self->_needsCycleAnimationUpdate = 0;
      int64_t v7 = [(STUIStatusBarSignalView *)self numberOfBars];
      double v8 = [(STUIStatusBarCellularSignalView *)self layer];
      int64_t v9 = [v8 sublayers];

      v48 = [MEMORY[0x1E4F1CA48] array];
      if ([(STUIStatusBarSignalView *)v50 numberOfBars] >= 1)
      {
        uint64_t v10 = 0;
        double v11 = (double)(v7 + 3);
        double v12 = v11 * 0.175;
        uint64_t v44 = *MEMORY[0x1E4F39D98];
        double v13 = v11 + 0.5;
        double v14 = 1.0 / v11;
        uint64_t v43 = *MEMORY[0x1E4F39D68];
        double v15 = 3.0 / v11;
        v46 = v4;
        v47 = v5;
        v45 = v9;
        do
        {
          uint64_t v51 = v10;
          v49 = objc_msgSend(v9, "objectAtIndexedSubscript:", v10, v43);
          uint64_t v16 = [MEMORY[0x1E4F39B38] animation];
          [v16 setDuration:v12];
          LODWORD(v17) = 2139095040;
          [v16 setRepeatCount:v17];
          [v16 setAutoreverses:0];
          [v16 setBeginTimeMode:v44];
          [v16 duration];
          [v16 setBeginTime:(double)v51 / v13 * v18];
          v57[0] = &unk_1F2F9CD20;
          double v19 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
          v57[1] = v19;
          double v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v15];
          v57[2] = v20;
          v57[3] = &unk_1F2F9CD30;
          double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];

          id v22 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"backgroundColor"];
          [v22 setKeyTimes:v21];
          [v22 setCalculationMode:v43];
          [v22 setTensionValues:&unk_1F2F9C948];
          id v23 = v5;
          v56[0] = [v23 CGColor];
          v56[1] = [v4 CGColor];
          id v24 = v23;
          v56[2] = [v24 CGColor];
          v56[3] = [v24 CGColor];
          CGRect v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
          [v22 setValues:v25];

          v26 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.height"];
          [(STUIStatusBarCellularSignalView *)v50 _heightForBarAtIndex:0 mode:0];
          double v28 = v27;
          [(STUIStatusBarCellularSignalView *)v50 _heightForBarAtIndex:1 mode:2];
          double v30 = v29;
          [v26 setKeyTimes:v21];
          [v26 setCalculationMode:v43];
          [v26 setTensionValues:&unk_1F2F9C948];
          v31 = [MEMORY[0x1E4F28ED0] numberWithDouble:v28];
          v55[0] = v31;
          v32 = [MEMORY[0x1E4F28ED0] numberWithDouble:v30];
          v55[1] = v32;
          v33 = [MEMORY[0x1E4F28ED0] numberWithDouble:v28];
          v55[2] = v33;
          v34 = [MEMORY[0x1E4F28ED0] numberWithDouble:v28];
          v55[3] = v34;
          v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
          [v26 setValues:v35];

          v54[0] = v22;
          v54[1] = v26;
          v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
          [v16 setAnimations:v36];

          v37 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:v49 animation:v16 key:@"searching"];
          [v48 addObject:v37];

          objc_super v4 = v46;
          int64_t v5 = v47;

          int64_t v9 = v45;
          uint64_t v38 = [(STUIStatusBarSignalView *)v50 numberOfBars];
          uint64_t v10 = v51 + 1;
        }
        while (v51 + 1 < v38);
      }
      v39 = [[STUIStatusBarCycleAnimation alloc] initWithLayerAnimations:v48];
      cycleAnimation = v50->_cycleAnimation;
      if (!cycleAnimation) {
        goto LABEL_13;
      }
      uint64_t v41 = [(STUIStatusBarCycleAnimation *)cycleAnimation state];
      if (v41 == 1)
      {
        v42 = v50->_cycleAnimation;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __59__STUIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke;
        v52[3] = &unk_1E6AA4330;
        v52[4] = v50;
        v53 = v39;
        [(STUIStatusBarCycleAnimation *)v42 stopWithCompletionHandler:v52];

        goto LABEL_15;
      }
      if (!v41) {
LABEL_13:
      }
        [(STUIStatusBarCellularSignalView *)v50 setCycleAnimation:v39];
LABEL_15:
    }
  }
}

uint64_t __59__STUIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) signalMode];
  if (result == 1)
  {
    [*(id *)(a1 + 32) setCycleAnimation:*(void *)(a1 + 40)];
    BOOL v3 = *(void **)(a1 + 40);
    return [v3 start];
  }
  return result;
}

- (void)setCycleAnimation:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = (STUIStatusBarCycleAnimation *)a3;
  if (self->_cycleAnimation != v5)
  {
    objc_storeStrong((id *)&self->_cycleAnimation, a3);
    if (v5)
    {
      v7[0] = v5;
      BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [(STUIStatusBarPersistentAnimationView *)self setPersistentAnimations:v6];
    }
    else
    {
      [(STUIStatusBarPersistentAnimationView *)self setPersistentAnimations:MEMORY[0x1E4F1CBF0]];
    }
  }
}

- (void)_updateFromMode:(int64_t)a3
{
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(STUIStatusBarCycleAnimation *)cycleAnimation state]) {
    [(STUIStatusBarCellularSignalView *)self setNeedsLayout];
  }
  if (a3 == 1 && [(STUIStatusBarSignalView *)self signalMode] != 1)
  {
    BOOL v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __51__STUIStatusBarCellularSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E6AA3FA8;
    v7[4] = self;
    [(STUIStatusBarCycleAnimation *)v6 stopWithCompletionHandler:v7];
  }
}

uint64_t __51__STUIStatusBarCellularSignalView__updateFromMode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) signalMode];
  if (result != 1)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setNeedsLayout];
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  BOOL v3 = NSString;
  if ([(STUIStatusBarSignalView *)self signalMode] == 2) {
    int64_t v4 = [(STUIStatusBarSignalView *)self numberOfActiveBars];
  }
  else {
    int64_t v4 = 0;
  }
  int64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", v4);
  BOOL v6 = [MEMORY[0x1E4FB1818] kitImageNamed:v5];
  id v7 = objc_alloc(MEMORY[0x1E4FB13E0]);
  double v8 = objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v8 setScaleImage:1];

  return v8;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self, "setNeedsLargerScale:", [v4 isScaledFixedWidthBar]);
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularSignalView;
  [(STUIStatusBarSignalView *)&v5 applyStyleAttributes:v4];
}

- (BOOL)needsCycleAnimationUpdate
{
  return self->_needsCycleAnimationUpdate;
}

- (void)setNeedsCycleAnimationUpdate:(BOOL)a3
{
  self->_needsCycleAnimationUpdate = a3;
}

- (STUIStatusBarCycleAnimation)cycleAnimation
{
  return self->_cycleAnimation;
}

@end