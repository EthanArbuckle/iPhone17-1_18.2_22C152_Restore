@interface _UIStatusBarCellularSignalView
+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_barCornerRadiusForIconSize:(int64_t)a3;
+ (double)_barWidthForIconSize:(int64_t)a3;
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
- (BOOL)needsCycleAnimationUpdate;
- (BOOL)needsLargerScale;
- (CGSize)intrinsicContentSize;
- (_UIStatusBarCycleAnimation)cycleAnimation;
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

@implementation _UIStatusBarCellularSignalView

+ (double)_barWidthForIconSize:(int64_t)a3
{
  double result = 3.0;
  switch(a3)
  {
    case 0:
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 3.0);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarCellularSignalView.m" lineNumber:72 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 5:
      double result = 3.5;
      break;
    case 6:
    case 7:
      double result = 3.33333333;
      break;
    case 8:
    case 10:
      double result = 3.66666667;
      break;
    case 9:
    case 12:
    case 13:
    case 15:
      double result = 4.0;
      break;
    case 11:
      double result = 4.5;
      break;
    case 16:
      double result = 2.5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3
{
  int64_t v5 = [(_UIStatusBarSignalView *)self signalMode];
  [(_UIStatusBarCellularSignalView *)self _heightForBarAtIndex:a3 mode:v5];
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3 mode:(int64_t)a4
{
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      v9 = objc_opt_class();
      int64_t v10 = [(_UIStatusBarSignalView *)self iconSize];
      [v9 _heightForNormalBarAtIndex:a3 iconSize:v10];
    }
  }
  else
  {
    int64_t v5 = objc_opt_class();
    int64_t v6 = [(_UIStatusBarSignalView *)self iconSize];
    [v5 _barWidthForIconSize:v6];
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 0:
      v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
      [v8 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarCellularSignalView.m" lineNumber:183 description:@"Undefined icon size"];

      return 0.0;
    case 1:
      long long v12 = xmmword_186B9C9A0;
      long long v13 = xmmword_186B9C9B0;
      uint64_t v5 = 0x403A000000000000;
      goto LABEL_19;
    case 2:
      long long v9 = xmmword_186B9C920;
      long long v10 = xmmword_186B9C990;
      goto LABEL_7;
    case 3:
      long long v9 = xmmword_186B9C880;
      long long v10 = xmmword_186B9C940;
LABEL_7:
      long long v12 = v9;
      long long v13 = v10;
      uint64_t v11 = 0x4043800000000000;
      goto LABEL_21;
    case 4:
      long long v12 = xmmword_186B9C920;
      long long v13 = xmmword_186B9C930;
      uint64_t v11 = 0x4045000000000000;
      goto LABEL_21;
    case 5:
      long long v12 = xmmword_186B9C970;
      long long v13 = xmmword_186B9C980;
      uint64_t v5 = 0x403C000000000000;
      goto LABEL_19;
    case 6:
      long long v12 = xmmword_186B9C950;
      long long v13 = xmmword_186B9C960;
      uint64_t v11 = 0x4045800000000000;
      goto LABEL_21;
    case 7:
      long long v12 = xmmword_186B9C900;
      long long v13 = xmmword_186B9C910;
      uint64_t v11 = 0x4046800000000000;
      goto LABEL_21;
    case 8:
      long long v12 = xmmword_186B9C8E0;
      long long v13 = xmmword_186B9C8F0;
      uint64_t v11 = 0x4048800000000000;
      goto LABEL_21;
    case 9:
    case 15:
      long long v12 = xmmword_186B9C820;
      long long v13 = xmmword_186B9C830;
      uint64_t v5 = 0x4040000000000000;
      goto LABEL_19;
    case 10:
      long long v12 = xmmword_186B9C8A0;
      long long v13 = xmmword_186B9C8B0;
      uint64_t v11 = 0x4048000000000000;
      goto LABEL_21;
    case 11:
      long long v12 = xmmword_186B9C880;
      long long v13 = xmmword_186B9C890;
      uint64_t v5 = 0x4041000000000000;
      goto LABEL_19;
    case 12:
      long long v12 = xmmword_186B9C860;
      long long v13 = xmmword_186B9C870;
      uint64_t v11 = 0x404A000000000000;
      goto LABEL_21;
    case 13:
      long long v12 = xmmword_186B9C8C0;
      long long v13 = xmmword_186B9C8D0;
      uint64_t v11 = 0x404B000000000000;
      goto LABEL_21;
    case 14:
      long long v12 = xmmword_186B9C840;
      long long v13 = xmmword_186B9C850;
      uint64_t v5 = 0x4038000000000000;
      goto LABEL_19;
    case 16:
      long long v12 = xmmword_186B9C800;
      long long v13 = xmmword_186B9C810;
      uint64_t v5 = 0x4035000000000000;
LABEL_19:
      uint64_t v14 = v5;
      double result = *((double *)&v12 + a3) * 0.5;
      break;
    case 17:
      long long v12 = xmmword_186B9A630;
      long long v13 = xmmword_186B9C7F0;
      uint64_t v11 = 0x4040000000000000;
LABEL_21:
      uint64_t v14 = v11;
      double result = *((double *)&v12 + a3) / 3.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  double result = 1.0;
  switch(a3)
  {
    case 0:
      int64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.0);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarCellularSignalView.m" lineNumber:227 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 5:
      double result = 1.15;
      break;
    case 6:
    case 7:
      double result = 1.16666667;
      break;
    case 8:
    case 10:
      double result = 1.2;
      break;
    case 9:
    case 15:
      double result = 1.25;
      break;
    case 11:
      double result = 1.3;
      break;
    case 12:
    case 13:
      double result = 1.4;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 1.5;
  switch(a3)
  {
    case 0:
      int64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.5);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarCellularSignalView.m" lineNumber:270 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 17:
      double result = 1.66666667;
      break;
    case 7:
    case 9:
    case 10:
    case 11:
    case 15:
      double result = 2.0;
      break;
    case 8:
    case 12:
    case 13:
      double result = 2.33333333;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_updateBars
{
  if ([(_UIStatusBarSignalView *)self iconSize])
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarCellularSignalView;
    [(_UIStatusBarSignalView *)&v14 _updateBars];
    BOOL v3 = [(_UIStatusBarSignalView *)self rounded];
    v4 = objc_opt_class();
    int64_t v5 = [(_UIStatusBarSignalView *)self iconSize];
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
    if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v9 = 0;
      uint64_t v10 = *MEMORY[0x1E4F39EA8];
      uint64_t v11 = *MEMORY[0x1E4F3A340];
      do
      {
        long long v12 = [MEMORY[0x1E4F39BE8] layer];
        objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);
        [v12 setCornerCurve:v10];
        [v12 setCornerRadius:v7];
        if ([(_UIStatusBarCellularSignalView *)self needsLargerScale])
        {
          [v12 setMinificationFilter:v11];
          [v12 setRasterizationScale:5.0];
          [v12 setShouldRasterize:1];
        }
        long long v13 = [(UIView *)self layer];
        [v13 addSublayer:v12];

        ++v9;
      }
      while (v9 < [(_UIStatusBarSignalView *)self numberOfBars]);
    }
    [(_UIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
  }
}

- (void)_setNeedsUpdateCycleAnimation
{
  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && [(_UIStatusBarCycleAnimation *)cycleAnimation state])
  {
    [(_UIStatusBarCellularSignalView *)self _updateCycleAnimationNow];
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate) {
    [(_UIStatusBarCellularSignalView *)self _updateCycleAnimationNow];
  }
}

- (void)_updateCycleAnimationNow
{
  BOOL v3 = self;
  v62[4] = *MEMORY[0x1E4F143B8];
  v4 = [(_UIStatusBarSignalView *)self activeColor];
  int64_t v5 = [v4 colorWithAlphaComponent:0.6];

  double v6 = [(_UIStatusBarSignalView *)v3 inactiveColor];
  if ([(_UIStatusBarSignalView *)v3 iconSize])
  {
    BOOL v7 = !v5 || v6 == 0;
    if (!v7 && [(_UIStatusBarSignalView *)v3 numberOfBars])
    {
      v3->_needsCycleAnimationUpdate = 0;
      uint64_t v8 = [(_UIStatusBarSignalView *)v3 numberOfBars];
      int64_t v9 = [(UIView *)v3 layer];
      uint64_t v10 = [v9 sublayers];

      v53 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = v10;
      uint64_t v12 = [v10 count];
      if (v12 != [(_UIStatusBarSignalView *)v3 numberOfBars])
      {
        v46 = [MEMORY[0x1E4F28B00] currentHandler];
        [v46 handleFailureInMethod:a2 object:v3 file:@"_UIStatusBarCellularSignalView.m" lineNumber:338 description:@"The number of bars is not consistent"];
      }
      if ([(_UIStatusBarSignalView *)v3 numberOfBars] >= 1)
      {
        uint64_t v13 = 0;
        double v14 = (double)(v8 + 3);
        double v15 = v14 * 0.175;
        uint64_t v49 = *MEMORY[0x1E4F39D98];
        double v16 = v14 + 0.5;
        double v17 = 1.0 / v14;
        v47 = v10;
        uint64_t v48 = *MEMORY[0x1E4F39D68];
        double v18 = 3.0 / v14;
        v51 = v5;
        v52 = v6;
        v50 = v3;
        do
        {
          uint64_t v56 = v13;
          v55 = objc_msgSend(v11, "objectAtIndexedSubscript:", v13, v47);
          v19 = [MEMORY[0x1E4F39B38] animation];
          [v19 setDuration:v15];
          LODWORD(v20) = 2139095040;
          [v19 setRepeatCount:v20];
          [v19 setAutoreverses:0];
          [v19 setBeginTimeMode:v49];
          [v19 duration];
          [v19 setBeginTime:(double)v56 / v16 * v21];
          v62[0] = &unk_1ED3F23E8;
          v22 = [NSNumber numberWithDouble:v17];
          v62[1] = v22;
          v23 = [NSNumber numberWithDouble:v18];
          v62[2] = v23;
          v62[3] = &unk_1ED3F23F8;
          uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];

          v25 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"backgroundColor"];
          v54 = (void *)v24;
          [v25 setKeyTimes:v24];
          [v25 setCalculationMode:v48];
          [v25 setTensionValues:&unk_1ED3F1078];
          id v26 = v6;
          v61[0] = [v26 CGColor];
          v61[1] = [v5 CGColor];
          id v27 = v26;
          v61[2] = [v27 CGColor];
          v61[3] = [v27 CGColor];
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
          [v25 setValues:v28];

          v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.height"];
          [(_UIStatusBarCellularSignalView *)v3 _heightForBarAtIndex:0 mode:0];
          double v31 = v30;
          [(_UIStatusBarCellularSignalView *)v3 _heightForBarAtIndex:1 mode:2];
          double v33 = v32;
          [v29 setKeyTimes:v24];
          [v29 setCalculationMode:v48];
          [v29 setTensionValues:&unk_1ED3F1078];
          v34 = [NSNumber numberWithDouble:v31];
          v60[0] = v34;
          v35 = [NSNumber numberWithDouble:v33];
          v60[1] = v35;
          v36 = [NSNumber numberWithDouble:v31];
          v60[2] = v36;
          v37 = [NSNumber numberWithDouble:v31];
          v60[3] = v37;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
          [v29 setValues:v38];

          uint64_t v11 = v47;
          BOOL v3 = v50;
          v59[0] = v25;
          v59[1] = v29;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
          [v19 setAnimations:v39];

          v40 = +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:v55 animation:v19 key:@"searching"];
          [v53 addObject:v40];

          int64_t v5 = v51;
          double v6 = v52;

          uint64_t v41 = [(_UIStatusBarSignalView *)v50 numberOfBars];
          uint64_t v13 = v56 + 1;
        }
        while (v56 + 1 < v41);
      }
      v42 = [[_UIStatusBarCycleAnimation alloc] initWithLayerAnimations:v53];
      cycleAnimation = v3->_cycleAnimation;
      if (!cycleAnimation) {
        goto LABEL_15;
      }
      uint64_t v44 = [(_UIStatusBarCycleAnimation *)cycleAnimation state];
      if (v44 == 1)
      {
        v45 = v3->_cycleAnimation;
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __58___UIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke;
        v57[3] = &unk_1E52DA660;
        v57[4] = v3;
        v58 = v42;
        [(_UIStatusBarCycleAnimation *)v45 stopWithCompletionHandler:v57];

        goto LABEL_17;
      }
      if (!v44) {
LABEL_15:
      }
        [(_UIStatusBarCellularSignalView *)v3 setCycleAnimation:v42];
LABEL_17:
    }
  }
}

- (void)setCycleAnimation:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = (_UIStatusBarCycleAnimation *)a3;
  if (self->_cycleAnimation != v5)
  {
    objc_storeStrong((id *)&self->_cycleAnimation, a3);
    if (v5)
    {
      v7[0] = v5;
      double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [(_UIStatusBarPersistentAnimationView *)self setPersistentAnimations:v6];
    }
    else
    {
      [(_UIStatusBarPersistentAnimationView *)self setPersistentAnimations:MEMORY[0x1E4F1CBF0]];
    }
  }
}

- (void)layoutSubviews
{
  id v22 = [(UIView *)self layer];
  BOOL v3 = [v22 sublayers];
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  double v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  double v15 = v14;
  if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
  {
    uint64_t v16 = 0;
    double v17 = v13 + v15;
    do
    {
      double v18 = [v3 objectAtIndexedSubscript:v16];
      [(_UIStatusBarCellularSignalView *)self _heightForBarAtIndex:v16];
      double v20 = v19;
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        v24.origin.x = v5;
        v24.origin.y = v7;
        v24.size.width = v9;
        v24.size.height = v11;
        double v21 = CGRectGetWidth(v24) - v13 - v17 * (double)v16;
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
    while (v16 < [(_UIStatusBarSignalView *)self numberOfBars]);
  }
  [(_UIStatusBarCellularSignalView *)self _updateActiveBars];
  if ([(_UIStatusBarSignalView *)self signalMode] == 1)
  {
    [(_UIStatusBarCellularSignalView *)self _updateCycleAnimationIfNeeded];
    [(_UIStatusBarCycleAnimation *)self->_cycleAnimation start];
  }
}

- (void)_colorsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularSignalView;
  [(_UIStatusBarSignalView *)&v3 _colorsDidChange];
  [(_UIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_iconSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularSignalView;
  [(_UIStatusBarSignalView *)&v3 _iconSizeDidChange];
  [(_UIStatusBarCellularSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_updateActiveBars
{
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarCellularSignalView;
  [(_UIStatusBarSignalView *)&v12 _updateActiveBars];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(_UIStatusBarCycleAnimation *)cycleAnimation state])
  {
    double v4 = [(_UIStatusBarSignalView *)self activeColor];
    CGFloat v5 = [(_UIStatusBarSignalView *)self inactiveColor];
    double v6 = [(UIView *)self layer];
    CGFloat v7 = [v6 sublayers];

    if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v8 = 0;
      do
      {
        if ([(_UIStatusBarSignalView *)self signalMode] == 2
          && v8 < [(_UIStatusBarSignalView *)self numberOfActiveBars])
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
      while (v8 < [(_UIStatusBarSignalView *)self numberOfBars]);
    }
  }
}

- (void)_updateFromMode:(int64_t)a3
{
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(_UIStatusBarCycleAnimation *)cycleAnimation state]) {
    [(UIView *)self setNeedsLayout];
  }
  if (a3 == 1 && [(_UIStatusBarSignalView *)self signalMode] != 1)
  {
    double v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __50___UIStatusBarCellularSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E52DC3A0;
    v7[4] = self;
    [(_UIStatusBarCycleAnimation *)v6 stopWithCompletionHandler:v7];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularSignalView;
  [(UIView *)&v4 didMoveToWindow];
  objc_super v3 = [(UIView *)self window];

  if (v3) {
    [(_UIStatusBarCellularSignalView *)self _updateActiveBars];
  }
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  [a1 _barWidthForIconSize:a4];
  double v8 = v7;
  [a1 _interspaceForIconSize:a4];
  double v10 = v8 * (double)a3 + v9 * (double)(a3 - 1);
  objc_msgSend(a1, "_heightForNormalBarAtIndex:iconSize:");
  double v12 = v11;
  double v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = objc_opt_class();
  int64_t v4 = [(_UIStatusBarSignalView *)self numberOfBars];
  int64_t v5 = [(_UIStatusBarSignalView *)self iconSize];
  [v3 _intrinsicContentSizeForNumberOfBars:v4 iconSize:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)accessibilityHUDRepresentation
{
  objc_super v3 = NSString;
  if ([(_UIStatusBarSignalView *)self signalMode] == 2) {
    int64_t v4 = [(_UIStatusBarSignalView *)self numberOfActiveBars];
  }
  else {
    int64_t v4 = 0;
  }
  int64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", v4);
  double v6 = +[UIImage kitImageNamed:v5];
  double v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v7 setScaleImage:1];

  return v7;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self, "setNeedsLargerScale:", [v4 isScaledFixedWidthBar]);
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarCellularSignalView;
  [(_UIStatusBarSignalView *)&v5 applyStyleAttributes:v4];
}

- (BOOL)needsLargerScale
{
  return self->_needsLargerScale;
}

- (void)setNeedsLargerScale:(BOOL)a3
{
  self->_needsLargerScale = a3;
}

- (BOOL)needsCycleAnimationUpdate
{
  return self->_needsCycleAnimationUpdate;
}

- (void)setNeedsCycleAnimationUpdate:(BOOL)a3
{
  self->_needsCycleAnimationUpdate = a3;
}

- (_UIStatusBarCycleAnimation)cycleAnimation
{
  return self->_cycleAnimation;
}

- (void).cxx_destruct
{
}

@end