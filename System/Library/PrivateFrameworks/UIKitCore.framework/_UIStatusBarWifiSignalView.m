@interface _UIStatusBarWifiSignalView
+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
+ (double)_totalWidthForIconSize:(int64_t)a3;
+ (double)widthForIconSize:(int64_t)a3;
+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10;
- (BOOL)needsCycleAnimationUpdate;
- (CGSize)intrinsicContentSize;
- (_UIStatusBarCycleAnimation)cycleAnimation;
- (double)_barCornerRadius;
- (id)accessibilityHUDRepresentation;
- (void)_colorsDidChange;
- (void)_iconSizeDidChange;
- (void)_setNeedsUpdateCycleAnimation;
- (void)_updateActiveBars;
- (void)_updateBars;
- (void)_updateCycleAnimationIfNeeded;
- (void)_updateCycleAnimationNow;
- (void)_updateFromMode:(int64_t)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCycleAnimation:(id)a3;
- (void)setNeedsCycleAnimationUpdate:(BOOL)a3;
@end

@implementation _UIStatusBarWifiSignalView

- (double)_barCornerRadius
{
  int64_t v4 = [(_UIStatusBarSignalView *)self iconSize];
  double result = 0.5;
  switch(v4)
  {
    case 0:
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0.5);
      [v6 handleFailureInMethod:a2 object:self file:@"_UIStatusBarWifiSignalView.m" lineNumber:66 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 17:
      double result = 0.666666667;
      break;
    case 9:
    case 11:
    case 15:
      double result = 0.75;
      break;
    case 10:
    case 12:
    case 13:
      double result = 0.833333333;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4
{
  if (a3)
  {
    double result = 2.25;
    switch(a4)
    {
      case 0:
        v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 2.25);
        v8 = v7;
        SEL v9 = a2;
        id v10 = a1;
        uint64_t v11 = 151;
        goto LABEL_18;
      case 2:
      case 3:
      case 17:
        double result = 2.33333333;
        break;
      case 4:
        double result = 2.41666667;
        break;
      case 5:
      case 6:
      case 7:
        double result = 2.5;
        break;
      case 8:
      case 12:
      case 13:
        double result = 2.83333333;
        break;
      case 9:
      case 11:
      case 15:
        double result = 2.75;
        break;
      case 10:
        double result = 2.66666667;
        break;
      case 14:
        double result = 2.0;
        break;
      default:
        return result;
    }
  }
  else
  {
    double result = 3.25;
    switch(a4)
    {
      case 0:
        v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 3.25);
        v8 = v7;
        SEL v9 = a2;
        id v10 = a1;
        uint64_t v11 = 110;
LABEL_18:
        [v7 handleFailureInMethod:v9 object:v10 file:@"_UIStatusBarWifiSignalView.m" lineNumber:v11 description:@"Undefined icon size"];

        double result = 0.0;
        break;
      case 2:
      case 3:
      case 17:
        double result = 3.33333333;
        break;
      case 4:
      case 6:
        double result = 3.5;
        break;
      case 7:
      case 10:
        double result = 3.83333333;
        break;
      case 8:
        double result = 4.33333333;
        break;
      case 9:
      case 15:
        double result = 3.75;
        break;
      case 11:
        double result = 4.25;
        break;
      case 12:
      case 13:
        double result = 4.16666667;
        break;
      case 14:
        double result = 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 1.5;
  switch(a3)
  {
    case 0:
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.5);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarWifiSignalView.m" lineNumber:195 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 4:
    case 5:
    case 7:
    case 9:
    case 11:
    case 15:
      double result = 1.75;
      break;
    case 6:
    case 10:
      double result = 1.66666667;
      break;
    case 8:
      double result = 1.91666667;
      break;
    case 12:
    case 13:
      double result = 1.83333333;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_totalWidthForIconSize:(int64_t)a3
{
  double result = 15.5;
  switch(a3)
  {
    case 0:
      v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 15.5);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarWifiSignalView.m" lineNumber:238 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 2:
    case 3:
    case 17:
      double result = 15.3333333;
      break;
    case 4:
      double result = 16.6666667;
      break;
    case 5:
      double result = 16.5;
      break;
    case 6:
      double result = 16.3333333;
      break;
    case 7:
      double result = 17.0;
      break;
    case 8:
      double result = 19.6666667;
      break;
    case 9:
    case 15:
      double result = 17.5;
      break;
    case 10:
      double result = 17.6666667;
      break;
    case 11:
      double result = 18.0;
      break;
    case 12:
    case 13:
      double result = 19.0;
      break;
    case 14:
      double result = 14.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)widthForIconSize:(int64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  objc_msgSend(a1, "_totalWidthForIconSize:");
  return result;
}

- (void)_updateBars
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarWifiSignalView;
  [(_UIStatusBarSignalView *)&v6 _updateBars];
  if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      int64_t v4 = [MEMORY[0x1E4F39BE8] layer];
      v5 = [(UIView *)self layer];
      [v5 addSublayer:v4];

      ++v3;
    }
    while (v3 < [(_UIStatusBarSignalView *)self numberOfBars]);
  }
  [(_UIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)layoutSubviews
{
  id v36 = [(UIView *)self layer];
  int64_t v3 = [v36 sublayers];
  [(_UIStatusBarWifiSignalView *)self _barCornerRadius];
  double v5 = v4;
  [(UIView *)self bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  double v42 = v14;
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  double MidX = CGRectGetMidX(v47);
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  double MaxY = CGRectGetMaxY(v48);
  BOOL v16 = [(_UIStatusBarSignalView *)self rounded];
  CGFloat v37 = v9;
  double v38 = v7;
  v49.origin.x = v7;
  v49.origin.y = v9;
  double v17 = v11;
  v49.size.width = v11;
  double v18 = v13;
  v49.size.height = v13;
  CGFloat Height = CGRectGetHeight(v49);
  double v45 = MidX;
  double v20 = acos(MidX / Height);
  v21 = [(UIView *)self traitCollection];
  v22 = v21;
  if (!v21 || ([v21 displayScale], v23 == 0.0))
  {
    v25 = [(UIView *)self _screen];
    [v25 scale];
    double v44 = v26;
  }
  else
  {
    [v22 displayScale];
    double v44 = v24;
  }
  if ([(_UIStatusBarSignalView *)self numberOfBars])
  {
    unint64_t v27 = 0;
    double v41 = MaxY + v5 * -0.5;
    double v43 = v5 + v42;
    double v39 = v38 + v11 * 0.5;
    double v28 = v9 + v13 * 0.5;
    double v29 = 0.0;
    do
    {
      v30 = [v3 objectAtIndexedSubscript:v27];
      objc_msgSend((id)objc_opt_class(), "_barThicknessAtIndex:iconSize:", v27, -[_UIStatusBarSignalView iconSize](self, "iconSize"));
      double v32 = v31 - v5;
      double v33 = v20;
      if (v16)
      {
        v50.origin.y = v37;
        v50.origin.x = v38;
        v50.size.width = v17;
        v50.size.height = v18;
        CGFloat v34 = CGRectGetHeight(v50);
        double v33 = v20 + atan(v32 * 0.5 / v34);
      }
      objc_msgSend((id)objc_opt_class(), "_barImageWithSize:forScale:distance:angle:centerPoint:cornerRadius:thickness:rounded:", v16, v17, v18, v44, v29, v33, v45, v41, v5, *(void *)&v32);
      id v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setContents:", objc_msgSend(v35, "CGImage"));
      [(UIView *)self bounds];
      objc_msgSend(v30, "setBounds:");
      objc_msgSend(v30, "setPosition:", v39, v28);
      double v29 = v29 + v43 + v32;

      ++v27;
    }
    while (v27 < [(_UIStatusBarSignalView *)self numberOfBars]);
  }
  [(_UIStatusBarWifiSignalView *)self _updateActiveBars];
}

+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10
{
  BOOL v10 = a10;
  double y = a7.y;
  double x = a7.x;
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB25CA78 != -1) {
    dispatch_once(&qword_1EB25CA78, &__block_literal_global_489);
  }
  double v18 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", objc_opt_class(), v10, width, height, x, y, a5, a6, a8, a9, *(void *)&a4);
  v19 = [(id)_MergedGlobals_5_13 objectForKey:v18];
  if (!v19)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2;
    aBlock[3] = &__block_descriptor_80_e19__CGPoint_dd_16__0d8l;
    *(double *)&aBlock[4] = x;
    *(double *)&aBlock[5] = y;
    *(double *)&aBlock[6] = a6;
    *(double *)&aBlock[7] = width;
    *(double *)&aBlock[8] = height;
    *(double *)&aBlock[9] = a8;
    double v20 = _Block_copy(aBlock);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3;
    v38[3] = &__block_descriptor_48_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v38[4] = width;
    *(double *)&v38[5] = height;
    v21 = _Block_copy(v38);
    v22 = +[UIGraphicsImageRendererFormat defaultFormat];
    [v22 setScale:a4];
    [v22 setOpaque:0];
    [v22 setPreferredRange:0x7FFFLL];
    double v23 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v22, width, height);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4;
    v28[3] = &unk_1E5305AC0;
    BOOL v37 = v10;
    double v31 = a5;
    double v32 = x;
    double v33 = y;
    double v34 = a9;
    id v29 = v20;
    id v30 = v21;
    double v35 = a6;
    double v36 = a8;
    id v24 = v21;
    id v25 = v20;
    v19 = [(UIGraphicsImageRenderer *)v23 imageWithActions:v28];
    [(id)_MergedGlobals_5_13 setObject:v19 forKey:v18];
  }
  return v19;
}

- (void)_colorsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarWifiSignalView;
  [(_UIStatusBarSignalView *)&v3 _colorsDidChange];
  [(_UIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_setNeedsUpdateCycleAnimation
{
  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && [(_UIStatusBarCycleAnimation *)cycleAnimation state])
  {
    [(_UIStatusBarWifiSignalView *)self _updateCycleAnimationNow];
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
  }
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate) {
    [(_UIStatusBarWifiSignalView *)self _updateCycleAnimationNow];
  }
}

- (void)_updateCycleAnimationNow
{
  v44[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(_UIStatusBarSignalView *)self activeColor];
  uint64_t v4 = [(_UIStatusBarSignalView *)self inactiveColor];
  double v5 = (void *)v4;
  if (v3 && v4 && [(_UIStatusBarSignalView *)self numberOfBars])
  {
    double v6 = [(UIView *)self layer];
    CGFloat v7 = [v6 sublayers];

    double v8 = [MEMORY[0x1E4F1CA48] array];
    int64_t v9 = [(_UIStatusBarSignalView *)self numberOfBars];
    if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      uint64_t v10 = 0;
      double v11 = (double)(v9 + 2);
      double v12 = v11 * 0.2;
      uint64_t v36 = *MEMORY[0x1E4F39D98];
      double v13 = v11 + 0.5;
      double v14 = 1.0 / v11;
      uint64_t v35 = *MEMORY[0x1E4F39D68];
      double v15 = 3.0 / v11;
      double v38 = v7;
      double v39 = v3;
      BOOL v37 = v8;
      do
      {
        double v41 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v35);
        BOOL v16 = [MEMORY[0x1E4F39B38] animation];
        [v16 setDuration:v12];
        LODWORD(v17) = 2139095040;
        [v16 setRepeatCount:v17];
        [v16 setAutoreverses:0];
        [v16 setBeginTimeMode:v36];
        [v16 duration];
        [v16 setBeginTime:(double)v10 / v13 * v18];
        v44[0] = &unk_1ED3F2438;
        v19 = [NSNumber numberWithDouble:v14];
        v44[1] = v19;
        double v20 = [NSNumber numberWithDouble:v15];
        v44[2] = v20;
        v44[3] = &unk_1ED3F2448;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];

        v21 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
        [v21 setKeyTimes:v40];
        [v21 setCalculationMode:v35];
        [v21 setTensionValues:&unk_1ED3F1090];
        v22 = NSNumber;
        [v5 alphaComponent];
        double v23 = objc_msgSend(v22, "numberWithDouble:");
        v43[0] = v23;
        id v24 = NSNumber;
        [v3 alphaComponent];
        id v25 = objc_msgSend(v24, "numberWithDouble:");
        v43[1] = v25;
        double v26 = NSNumber;
        [v5 alphaComponent];
        unint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
        v43[2] = v27;
        double v28 = NSNumber;
        [v5 alphaComponent];
        id v29 = objc_msgSend(v28, "numberWithDouble:");
        v43[3] = v29;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
        double v31 = v30 = v5;
        [v21 setValues:v31];

        double v5 = v30;
        double v8 = v37;
        double v42 = v21;
        double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        [v16 setAnimations:v32];

        double v33 = +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:v41 animation:v16 key:@"searching"];
        [v37 addObject:v33];

        objc_super v3 = v39;
        CGFloat v7 = v38;

        ++v10;
      }
      while (v10 < [(_UIStatusBarSignalView *)self numberOfBars]);
    }
    double v34 = [[_UIStatusBarCycleAnimation alloc] initWithLayerAnimations:v8];
    [(_UIStatusBarWifiSignalView *)self setCycleAnimation:v34];
  }
}

- (void)_updateActiveBars
{
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarWifiSignalView;
  [(_UIStatusBarSignalView *)&v15 _updateActiveBars];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(_UIStatusBarCycleAnimation *)cycleAnimation state])
  {
    uint64_t v4 = [(UIView *)self layer];
    double v5 = [v4 sublayers];

    if ([(_UIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v6 = 0;
      do
      {
        CGFloat v7 = [v5 objectAtIndexedSubscript:v6];
        if ([(_UIStatusBarSignalView *)self signalMode] == 2
          && v6 < [(_UIStatusBarSignalView *)self numberOfActiveBars])
        {
          double v8 = [(_UIStatusBarSignalView *)self activeColor];
        }
        else
        {
          double v8 = [(_UIStatusBarSignalView *)self inactiveColor];
        }
        int64_t v9 = v8;
        id v10 = [v8 colorWithAlphaComponent:1.0];
        uint64_t v11 = [v10 CGColor];

        [v9 alphaComponent];
        double v13 = v12;
        [v7 setContentsMultiplyColor:v11];
        *(float *)&double v14 = v13;
        [v7 setOpacity:v14];

        ++v6;
      }
      while (v6 < [(_UIStatusBarSignalView *)self numberOfBars]);
    }
  }
}

- (void)_updateFromMode:(int64_t)a3
{
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(_UIStatusBarCycleAnimation *)cycleAnimation state]) {
    [(_UIStatusBarWifiSignalView *)self _updateActiveBars];
  }
  if ([(_UIStatusBarSignalView *)self signalMode] == 1)
  {
    [(_UIStatusBarWifiSignalView *)self _updateCycleAnimationIfNeeded];
    double v5 = self->_cycleAnimation;
    [(_UIStatusBarCycleAnimation *)v5 start];
  }
  else
  {
    int64_t v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46___UIStatusBarWifiSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E52DC3A0;
    v7[4] = self;
    [(_UIStatusBarCycleAnimation *)v6 stopWithCompletionHandler:v7];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarWifiSignalView;
  [(UIView *)&v4 didMoveToWindow];
  objc_super v3 = [(UIView *)self window];

  if (v3) {
    [(_UIStatusBarWifiSignalView *)self _updateActiveBars];
  }
}

- (void)_iconSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarWifiSignalView;
  [(_UIStatusBarSignalView *)&v3 _iconSizeDidChange];
  [(_UIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  if (a3)
  {
    uint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      [a1 _barThicknessAtIndex:v7 iconSize:a4];
      double v8 = v8 + v9;
      ++v7;
    }
    while (a3 != v7);
  }
  else
  {
    double v8 = 0.0;
  }
  [a1 _interspaceForIconSize:a4];
  double v11 = v10;
  double v12 = 2.0;
  if ((unint64_t)a4 <= 0x11)
  {
    if (((1 << a4) & 0x235DC) != 0)
    {
      double v12 = 3.0;
    }
    else if (!a4)
    {
      double v18 = +[UIScreen mainScreen];
      [v18 scale];
      double v12 = v19;
    }
  }
  [a1 _totalWidthForIconSize:a4];
  double v14 = v13;
  UICeilToScale(v8 + v11 * (double)(a3 - 1), v12);
  double v16 = v15;
  double v17 = v14;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = objc_opt_class();
  int64_t v4 = [(_UIStatusBarSignalView *)self numberOfBars];
  int64_t v5 = [(_UIStatusBarSignalView *)self iconSize];
  [v3 _intrinsicContentSizeForNumberOfBars:v4 iconSize:v5];
  result.double height = v7;
  result.double width = v6;
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
  int64_t v5 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_WiFi_%d", v4);
  double v6 = +[UIImage kitImageNamed:v5];
  double v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v7 setScaleImage:1];

  return v7;
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

- (void)setCycleAnimation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end