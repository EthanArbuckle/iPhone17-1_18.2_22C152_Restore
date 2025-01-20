@interface STUIStatusBarWifiSignalView
+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
+ (double)_totalWidthForIconSize:(int64_t)a3;
+ (double)widthForIconSize:(int64_t)a3;
+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10;
- (BOOL)needsCycleAnimationUpdate;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarCycleAnimation)cycleAnimation;
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

@implementation STUIStatusBarWifiSignalView

- (void)_colorsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarWifiSignalView;
  [(STUIStatusBarSignalView *)&v3 _colorsDidChange];
  [(STUIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_setNeedsUpdateCycleAnimation
{
  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && [(STUIStatusBarCycleAnimation *)cycleAnimation state])
  {
    [(STUIStatusBarWifiSignalView *)self _updateCycleAnimationNow];
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
  }
}

- (void)_updateFromMode:(int64_t)a3
{
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(STUIStatusBarCycleAnimation *)cycleAnimation state]) {
    [(STUIStatusBarWifiSignalView *)self _updateActiveBars];
  }
  if ([(STUIStatusBarSignalView *)self signalMode] == 1)
  {
    [(STUIStatusBarWifiSignalView *)self _updateCycleAnimationIfNeeded];
    v5 = self->_cycleAnimation;
    [(STUIStatusBarCycleAnimation *)v5 start];
  }
  else
  {
    v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__STUIStatusBarWifiSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E6AA3FA8;
    v7[4] = self;
    [(STUIStatusBarCycleAnimation *)v6 stopWithCompletionHandler:v7];
  }
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
  [a1 _interspaceForIconSize:a4];
  if ((unint64_t)a4 <= 0x11 && ((1 << a4) & 0x235DC) == 0 && !a4)
  {
    v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 scale];
  }
  [a1 _totalWidthForIconSize:a4];
  double v11 = v10;
  UICeilToScale();
  double v13 = v12;
  double v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (double)_totalWidthForIconSize:(int64_t)a3
{
  double result = 15.5;
  if ((unint64_t)a3 <= 0x11) {
    return dbl_1D7ED66D0[a3];
  }
  return result;
}

- (void)_updateActiveBars
{
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarWifiSignalView;
  [(STUIStatusBarSignalView *)&v15 _updateActiveBars];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || ![(STUIStatusBarCycleAnimation *)cycleAnimation state])
  {
    v4 = [(STUIStatusBarWifiSignalView *)self layer];
    v5 = [v4 sublayers];

    if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
    {
      int64_t v6 = 0;
      do
      {
        uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
        if ([(STUIStatusBarSignalView *)self signalMode] == 2
          && v6 < [(STUIStatusBarSignalView *)self numberOfActiveBars])
        {
          double v8 = [(STUIStatusBarSignalView *)self activeColor];
        }
        else
        {
          double v8 = [(STUIStatusBarSignalView *)self inactiveColor];
        }
        double v9 = v8;
        id v10 = [v8 colorWithAlphaComponent:1.0];
        uint64_t v11 = [v10 CGColor];

        [v9 alphaComponent];
        double v13 = v12;
        [v7 setContentsMultiplyColor:v11];
        *(float *)&double v14 = v13;
        [v7 setOpacity:v14];

        ++v6;
      }
      while (v6 < [(STUIStatusBarSignalView *)self numberOfBars]);
    }
  }
}

- (void)layoutSubviews
{
  id v35 = [(STUIStatusBarWifiSignalView *)self layer];
  objc_super v3 = [v35 sublayers];
  [(STUIStatusBarWifiSignalView *)self _barCornerRadius];
  double v5 = v4;
  [(STUIStatusBarWifiSignalView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  double v37 = v14;
  v43.origin.x = v7;
  v43.origin.y = v9;
  v43.size.width = v11;
  v43.size.height = v13;
  double MidX = CGRectGetMidX(v43);
  v44.origin.x = v7;
  v44.origin.y = v9;
  v44.size.width = v11;
  v44.size.height = v13;
  double MaxY = CGRectGetMaxY(v44);
  BOOL v17 = [(STUIStatusBarSignalView *)self rounded];
  CGFloat rect = v7;
  v45.origin.x = v7;
  CGFloat v18 = v9;
  v45.origin.y = v9;
  v45.size.width = v11;
  v45.size.height = v13;
  CGFloat Height = CGRectGetHeight(v45);
  double v40 = MidX;
  double v20 = acos(MidX / Height);
  v21 = [(STUIStatusBarWifiSignalView *)self traitCollection];
  v22 = v21;
  if (!v21 || ([v21 displayScale], v23 == 0.0))
  {
    v25 = [(STUIStatusBarWifiSignalView *)self _screen];
    [v25 scale];
    double v39 = v26;
  }
  else
  {
    [v22 displayScale];
    double v39 = v24;
  }
  if ([(STUIStatusBarSignalView *)self numberOfBars])
  {
    unint64_t v27 = 0;
    double v36 = MaxY + v5 * -0.5;
    double v38 = v5 + v37;
    double v28 = 0.0;
    do
    {
      v29 = [v3 objectAtIndexedSubscript:v27];
      objc_msgSend((id)objc_opt_class(), "_barThicknessAtIndex:iconSize:", v27, -[STUIStatusBarSignalView iconSize](self, "iconSize"));
      double v31 = v30 - v5;
      double v32 = v20;
      if (v17)
      {
        v46.origin.x = rect;
        v46.origin.y = v18;
        v46.size.width = v11;
        v46.size.height = v13;
        CGFloat v33 = CGRectGetHeight(v46);
        double v32 = v20 + atan(v31 * 0.5 / v33);
      }
      objc_msgSend((id)objc_opt_class(), "_barImageWithSize:forScale:distance:angle:centerPoint:cornerRadius:thickness:rounded:", v17, v11, v13, v39, v28, v32, v40, v36, v5, *(void *)&v31);
      id v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setContents:", objc_msgSend(v34, "CGImage"));
      [(STUIStatusBarWifiSignalView *)self bounds];
      objc_msgSend(v29, "setBounds:");
      UIRectGetCenter();
      objc_msgSend(v29, "setPosition:");
      double v28 = v28 + v38 + v31;

      ++v27;
    }
    while (v27 < [(STUIStatusBarSignalView *)self numberOfBars]);
  }
  [(STUIStatusBarWifiSignalView *)self _updateActiveBars];
}

+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4
{
  double result = 2.25;
  if (!a3) {
    double result = 3.25;
  }
  if ((unint64_t)a4 <= 0x11)
  {
    double v5 = (double *)&unk_1D7ED65C0;
    if (!a3) {
      double v5 = (double *)&unk_1D7ED6530;
    }
    return v5[a4];
  }
  return result;
}

+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10
{
  BOOL v10 = a10;
  double y = a7.y;
  double x = a7.x;
  double height = a3.height;
  double width = a3.width;
  if (qword_1EC05EF98 != -1) {
    dispatch_once(&qword_1EC05EF98, &__block_literal_global_8);
  }
  CGFloat v18 = -[STUIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([STUIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", objc_opt_class(), v10, width, height, x, y, a5, a6, a8, a9, *(void *)&a4);
  v19 = [(id)_MergedGlobals_2 objectForKey:v18];
  if (!v19)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2;
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
    v38[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3;
    v38[3] = &__block_descriptor_48_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v38[4] = width;
    *(double *)&v38[5] = height;
    v21 = _Block_copy(v38);
    v22 = [MEMORY[0x1E4FB17E0] preferredFormat];
    [v22 setScale:a4];
    [v22 setOpaque:0];
    [v22 setPreferredRange:0x7FFFLL];
    double v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v22, width, height);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4;
    v28[3] = &unk_1E6AA43E8;
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
    v19 = [v23 imageWithActions:v28];
    [(id)_MergedGlobals_2 setObject:v19 forKey:v18];
  }
  return v19;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 1.5;
  if ((unint64_t)a3 <= 0xF) {
    return dbl_1D7ED6650[a3];
  }
  return result;
}

- (double)_barCornerRadius
{
  unint64_t v2 = [(STUIStatusBarSignalView *)self iconSize];
  double result = 0.5;
  if (v2 <= 0x11) {
    return dbl_1D7ED64A0[v2];
  }
  return result;
}

- (void)_updateBars
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarWifiSignalView;
  [(STUIStatusBarSignalView *)&v6 _updateBars];
  if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      double v4 = [MEMORY[0x1E4F39BE8] layer];
      double v5 = [(STUIStatusBarWifiSignalView *)self layer];
      [v5 addSublayer:v4];

      ++v3;
    }
    while (v3 < [(STUIStatusBarSignalView *)self numberOfBars]);
  }
  [(STUIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)_iconSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarWifiSignalView;
  [(STUIStatusBarSignalView *)&v3 _iconSizeDidChange];
  [(STUIStatusBarWifiSignalView *)self _setNeedsUpdateCycleAnimation];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarWifiSignalView;
  [(STUIStatusBarWifiSignalView *)&v4 didMoveToWindow];
  objc_super v3 = [(STUIStatusBarWifiSignalView *)self window];

  if (v3) {
    [(STUIStatusBarWifiSignalView *)self _updateActiveBars];
  }
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = objc_opt_class();
  int64_t v4 = [(STUIStatusBarSignalView *)self numberOfBars];
  int64_t v5 = [(STUIStatusBarSignalView *)self iconSize];
  [v3 _intrinsicContentSizeForNumberOfBars:v4 iconSize:v5];
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void).cxx_destruct
{
}

+ (double)widthForIconSize:(int64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  objc_msgSend(a1, "_totalWidthForIconSize:");
  return result;
}

uint64_t __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = _MergedGlobals_2;
  _MergedGlobals_2 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

double __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 32);
  return v2 - a2 * __sincos_stret(*(double *)(a1 + 48)).__cosval;
}

double __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) - a2;
}

void __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  if (*(unsigned char *)(a1 + 96) && v2 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64) - *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5, 0.0, 6.28318531);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 setLineWidth:*(double *)(a1 + 88)];
  }
  else
  {
    double v3 = (*(double (**)(double))(*(void *)(a1 + 32) + 16))(v2);
    double v5 = v4;
    id v8 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v8, "moveToPoint:", v3, v5);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), v2, *(double *)(a1 + 80) + 3.14159265, 6.28318531 - *(double *)(a1 + 80));
    double v6 = *(double *)(a1 + 72);
    if (*(unsigned char *)(a1 + 96)) {
      double v6 = v6 * 0.5;
    }
    double v7 = v2 + v6;
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v7);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (*(unsigned char *)(a1 + 96))
    {
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
      double v7 = v7 + *(double *)(a1 + 72) * 0.5;
    }
    else
    {
      objc_msgSend(v8, "addLineToPoint:");
    }
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v7, 6.28318531 - *(double *)(a1 + 80), *(double *)(a1 + 80) + 3.14159265);
    if (*(unsigned char *)(a1 + 96))
    {
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v7 - *(double *)(a1 + 72) * 0.5);
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
    }
    else
    {
      [v8 setLineJoinStyle:1];
    }
    [v8 setLineWidth:*(double *)(a1 + 88)];
  }
  [v8 closePath];
  [v8 fill];
  [v8 stroke];
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate) {
    [(STUIStatusBarWifiSignalView *)self _updateCycleAnimationNow];
  }
}

- (void)_updateCycleAnimationNow
{
  v44[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(STUIStatusBarSignalView *)self activeColor];
  uint64_t v4 = [(STUIStatusBarSignalView *)self inactiveColor];
  double v5 = (void *)v4;
  if (v3 && v4 && [(STUIStatusBarSignalView *)self numberOfBars])
  {
    double v6 = [(STUIStatusBarWifiSignalView *)self layer];
    double v7 = [v6 sublayers];

    id v8 = [MEMORY[0x1E4F1CA48] array];
    int64_t v9 = [(STUIStatusBarSignalView *)self numberOfBars];
    if ([(STUIStatusBarSignalView *)self numberOfBars] >= 1)
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
        v41 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v35);
        v16 = [MEMORY[0x1E4F39B38] animation];
        [v16 setDuration:v12];
        LODWORD(v17) = 2139095040;
        [v16 setRepeatCount:v17];
        [v16 setAutoreverses:0];
        [v16 setBeginTimeMode:v36];
        [v16 duration];
        [v16 setBeginTime:(double)v10 / v13 * v18];
        v44[0] = &unk_1F2F9CD50;
        v19 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
        v44[1] = v19;
        double v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v15];
        v44[2] = v20;
        v44[3] = &unk_1F2F9CD60;
        double v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];

        v21 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
        [v21 setKeyTimes:v40];
        [v21 setCalculationMode:v35];
        [v21 setTensionValues:&unk_1F2F9C960];
        v22 = (void *)MEMORY[0x1E4F28ED0];
        [v5 alphaComponent];
        double v23 = objc_msgSend(v22, "numberWithDouble:");
        v43[0] = v23;
        id v24 = (void *)MEMORY[0x1E4F28ED0];
        [v3 alphaComponent];
        id v25 = objc_msgSend(v24, "numberWithDouble:");
        v43[1] = v25;
        double v26 = (void *)MEMORY[0x1E4F28ED0];
        [v5 alphaComponent];
        unint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
        v43[2] = v27;
        double v28 = (void *)MEMORY[0x1E4F28ED0];
        [v5 alphaComponent];
        id v29 = objc_msgSend(v28, "numberWithDouble:");
        v43[3] = v29;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
        v31 = id v30 = v5;
        [v21 setValues:v31];

        double v5 = v30;
        id v8 = v37;
        v42 = v21;
        double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        [v16 setAnimations:v32];

        double v33 = +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:v41 animation:v16 key:@"searching"];
        [v37 addObject:v33];

        double v3 = v39;
        double v7 = v38;

        ++v10;
      }
      while (v10 < [(STUIStatusBarSignalView *)self numberOfBars]);
    }
    double v34 = [[STUIStatusBarCycleAnimation alloc] initWithLayerAnimations:v8];
    [(STUIStatusBarWifiSignalView *)self setCycleAnimation:v34];
  }
}

uint64_t __47__STUIStatusBarWifiSignalView__updateFromMode___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateActiveBars];
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  double v3 = NSString;
  if ([(STUIStatusBarSignalView *)self signalMode] == 2) {
    int64_t v4 = [(STUIStatusBarSignalView *)self numberOfActiveBars];
  }
  else {
    int64_t v4 = 0;
  }
  double v5 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_WiFi_%d", v4);
  double v6 = [MEMORY[0x1E4FB1818] kitImageNamed:v5];
  id v7 = objc_alloc(MEMORY[0x1E4FB13E0]);
  id v8 = objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v8 setScaleImage:1];

  return v8;
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

- (void)setCycleAnimation:(id)a3
{
}

@end