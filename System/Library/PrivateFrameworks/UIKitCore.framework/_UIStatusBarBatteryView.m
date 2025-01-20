@interface _UIStatusBarBatteryView
+ (CGSize)_batterySizeForIconSize:(int64_t)a3;
+ (CGSize)_pinSizeForIconSize:(int64_t)a3;
+ (CGSize)_statusBarIntrinsicContentSizeForIconSize:(int64_t)a3;
+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3;
+ (id)_boltBezierPathForSize:(CGSize)a3;
+ (id)_boltMaskBezierPath;
+ (id)_pinBezierPathForSize:(CGSize)a3 isComplex:(BOOL)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_batteryTextIsCutout;
- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3;
- (BOOL)_shouldShowBolt;
- (BOOL)isLowBattery;
- (BOOL)rounded;
- (BOOL)saverModeActive;
- (BOOL)showsInlineChargingIndicator;
- (BOOL)showsPercentage;
- (CALayer)bodyLayer;
- (CALayer)boltLayer;
- (CALayer)boltMaskLayer;
- (CALayer)fillLayer;
- (CALayer)percentFillLayer;
- (CALayer)pinLayer;
- (CAShapeLayer)bodyShapeLayer;
- (CAShapeLayer)boltMaskShapeLayer;
- (CAShapeLayer)boltShapeLayer;
- (CAShapeLayer)percentFillShapeLayer;
- (CAShapeLayer)pinShapeLayer;
- (CGRect)_bodyRectForTraitCollection:(id)a3;
- (CGRect)_updateBodyLayers;
- (CGSize)_batterySizeForTraitCollection:(id)a3;
- (CGSize)_pinSizeForTraitCollection:(id)a3;
- (CGSize)intrinsicContentSize;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIColor)bodyColor;
- (UIColor)boltColor;
- (UIColor)fillColor;
- (UIColor)inactiveColor;
- (UIColor)pinColor;
- (UILabel)percentageLabel;
- (_UIStatusBarBatteryView)initWithCoder:(id)a3;
- (_UIStatusBarBatteryView)initWithFrame:(CGRect)a3;
- (_UIStatusBarBatteryView)initWithSizeCategory:(int64_t)a3;
- (_UIStatusBarBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo;
- (double)_batteryBoltLargeScaleFactor;
- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3;
- (double)_batteryBoltScaleFactorMultiplier;
- (double)_batteryBoltSmallScaleFactor;
- (double)_insideCornerRadiusForTraitCollection:(id)a3;
- (double)_lineWidthAndInterspaceForTraitCollection:(id)a3;
- (double)_outsideCornerRadiusForTraitCollection:(id)a3;
- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3;
- (double)_percentageBatteryBoltScaleFactorMultiplier;
- (double)_percentageFontSizeForTraitCollection:(id)a3;
- (double)bodyColorAlpha;
- (double)chargePercent;
- (double)lowBatteryChargePercentThreshold;
- (double)pinColorAlpha;
- (id)_batteryFillColor;
- (id)_batteryTextColor;
- (id)_batteryUnfilledColor;
- (int64_t)chargingState;
- (int64_t)iconSize;
- (int64_t)internalSizeCategory;
- (int64_t)lowBatteryMode;
- (int64_t)sizeCategory;
- (void)__resetBoltLayers;
- (void)__updateFillLayer;
- (void)_commonInit;
- (void)_createBodyLayers;
- (void)_createBoltLayersWithSize:(CGSize)a3;
- (void)_createFillLayer;
- (void)_fillLayerFrame:(CGRect *)a3 cornerRadius:(double *)a4;
- (void)_notifyDidFinishAnimatingBoltToVisible:(BOOL)a3;
- (void)_notifyWillBeginAnimatingBoltToVisible:(BOOL)a3;
- (void)_unflipBoltIfNecessary;
- (void)_updateBatteryFillColor;
- (void)_updateBodyColors;
- (void)_updateBolt;
- (void)_updateFillColor;
- (void)_updateFillLayer;
- (void)_updateLightningBoltAndPercentagePosition;
- (void)_updatePercentage;
- (void)_updatePercentageFont;
- (void)_updateTransform;
- (void)applyStyleAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setAccessibilityHUDImageCacheInfo:(id)a3;
- (void)setBodyColor:(id)a3;
- (void)setBodyColorAlpha:(double)a3;
- (void)setBodyLayer:(id)a3;
- (void)setBoltColor:(id)a3;
- (void)setBoltLayer:(id)a3;
- (void)setBoltMaskLayer:(id)a3;
- (void)setChargePercent:(double)a3;
- (void)setChargingState:(int64_t)a3;
- (void)setFillColor:(id)a3;
- (void)setFillLayer:(id)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setInactiveColor:(id)a3;
- (void)setInternalSizeCategory:(int64_t)a3;
- (void)setLowBatteryChargePercentThreshold:(double)a3;
- (void)setLowBatteryMode:(int64_t)a3;
- (void)setPercentFillLayer:(id)a3;
- (void)setPercentageLabel:(id)a3;
- (void)setPinColor:(id)a3;
- (void)setPinColorAlpha:(double)a3;
- (void)setPinLayer:(id)a3;
- (void)setRounded:(BOOL)a3;
- (void)setSaverModeActive:(BOOL)a3;
- (void)setShowsInlineChargingIndicator:(BOOL)a3;
- (void)setShowsPercentage:(BOOL)a3;
- (void)setSizeCategory:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UIStatusBarBatteryView

- (CAShapeLayer)bodyShapeLayer
{
  return (CAShapeLayer *)self->_bodyLayer;
}

- (CAShapeLayer)pinShapeLayer
{
  return (CAShapeLayer *)self->_pinLayer;
}

- (CAShapeLayer)boltMaskShapeLayer
{
  return (CAShapeLayer *)self->_boltMaskLayer;
}

- (CAShapeLayer)boltShapeLayer
{
  return (CAShapeLayer *)self->_boltLayer;
}

- (CAShapeLayer)percentFillShapeLayer
{
  return (CAShapeLayer *)self->_percentFillLayer;
}

- (void)_commonInit
{
  [(_UIStatusBarBatteryView *)self _createBodyLayers];
  [(_UIStatusBarBatteryView *)self _createFillLayer];
  self->_bodyColorAlpha = 0.4;
  self->_pinColorAlpha = 0.5;
  [(_UIStatusBarBatteryView *)self setSizeCategory:0];
  [(_UIStatusBarBatteryView *)self setLowBatteryChargePercentThreshold:dbl_186B94640[_UIDeviceNativeUserInterfaceIdiom() == 1]];
  [(_UIStatusBarBatteryView *)self _updateTransform];
}

- (void)_createFillLayer
{
  v3 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIStatusBarBatteryView *)self setFillLayer:v3];

  [(CALayer *)self->_fillLayer setMasksToBounds:1];
  [(CALayer *)self->_fillLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
  bodyLayer = self->_bodyLayer;
  fillLayer = self->_fillLayer;
  [(CALayer *)bodyLayer addSublayer:fillLayer];
}

- (void)_createBodyLayers
{
  v3 = [MEMORY[0x1E4F39C88] layer];
  [(_UIStatusBarBatteryView *)self setBodyLayer:v3];

  id v4 = +[UIColor clearColor];
  uint64_t v5 = [v4 CGColor];
  v6 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
  [v6 setFillColor:v5];

  v7 = [(UIView *)self layer];
  [v7 addSublayer:self->_bodyLayer];

  v8 = [MEMORY[0x1E4F39C88] layer];
  [(_UIStatusBarBatteryView *)self setPinLayer:v8];

  v9 = [(UIView *)self layer];
  [v9 addSublayer:self->_pinLayer];

  v10 = [MEMORY[0x1E4F39C88] layer];
  [(_UIStatusBarBatteryView *)self setPercentFillLayer:v10];

  id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  id v11 = +[UIColor blackColor];
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  v12 = [(_UIStatusBarBatteryView *)self percentFillLayer];
  [v12 setMask:v14];

  v13 = [(UIView *)self layer];
  [v13 addSublayer:self->_percentFillLayer];
}

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = objc_msgSend((id)objc_opt_class(), "_boltBezierPathForSize:", a3.width, a3.height);
  v7 = [(id)objc_opt_class() _boltMaskBezierPath];
  v8 = [MEMORY[0x1E4F39C88] layer];
  boltMaskLayer = self->_boltMaskLayer;
  self->_boltMaskLayer = v8;

  id v10 = v7;
  uint64_t v11 = [v10 CGPath];
  v12 = [(_UIStatusBarBatteryView *)self boltMaskShapeLayer];
  [v12 setPath:v11];

  id v13 = +[UIColor blackColor];
  uint64_t v14 = [v13 CGColor];
  v15 = [(_UIStatusBarBatteryView *)self boltMaskShapeLayer];
  [v15 setFillColor:v14];

  v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [(CALayer *)self->_boltMaskLayer setCompositingFilter:v16];

  -[CALayer setBounds:](self->_boltMaskLayer, "setBounds:", 0.0, 0.0, width, height);
  v17 = [MEMORY[0x1E4F39C88] layer];
  boltLayer = self->_boltLayer;
  self->_boltLayer = v17;

  id v21 = v6;
  uint64_t v19 = [v21 CGPath];
  v20 = [(_UIStatusBarBatteryView *)self boltShapeLayer];
  [v20 setPath:v19];

  -[CALayer setBounds:](self->_boltLayer, "setBounds:", 0.0, 0.0, width, height);
}

- (_UIStatusBarBatteryView)initWithSizeCategory:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarBatteryView;
  id v4 = [(UIView *)&v6 init];
  [(_UIStatusBarBatteryView *)v4 _commonInit];
  [(_UIStatusBarBatteryView *)v4 setSizeCategory:a3];
  return v4;
}

- (_UIStatusBarBatteryView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarBatteryView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIStatusBarBatteryView *)v3 _commonInit];
  return v3;
}

- (_UIStatusBarBatteryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarBatteryView;
  v3 = [(UIView *)&v5 initWithCoder:a3];
  [(_UIStatusBarBatteryView *)v3 _commonInit];
  return v3;
}

- (id)_batteryUnfilledColor
{
  if (self->_showsPercentage && self->_chargePercent < 0.995)
  {
    v2 = [(_UIStatusBarBatteryView *)self inactiveColor];
  }
  else
  {
    v2 = [(_UIStatusBarBatteryView *)self _batteryFillColor];
  }
  return v2;
}

- (id)_batteryFillColor
{
  if ([(_UIStatusBarBatteryView *)self saverModeActive])
  {
    v3 = [(UIView *)self traitCollection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke;
    v15[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v15[4] = 0;
    id v4 = [v3 traitCollectionByModifyingTraits:v15];

    objc_super v5 = +[UIColor systemYellowColor];
LABEL_7:
    v8 = v5;
    v9 = [v5 resolvedColorWithTraitCollection:v4];

    goto LABEL_8;
  }
  if ([(_UIStatusBarBatteryView *)self isLowBattery])
  {
    objc_super v6 = [(UIView *)self traitCollection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_2;
    v13[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    long long v14 = xmmword_186B852C0;
    id v4 = [v6 traitCollectionByModifyingTraits:v13];

    objc_super v5 = +[UIColor systemRedColor];
    goto LABEL_7;
  }
  if ([(_UIStatusBarBatteryView *)self chargingState])
  {
    v7 = [(UIView *)self traitCollection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_3;
    v11[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    long long v12 = xmmword_186B852C0;
    id v4 = [v7 traitCollectionByModifyingTraits:v11];

    objc_super v5 = +[UIColor systemGreenColor];
    goto LABEL_7;
  }
  v9 = [(_UIStatusBarBatteryView *)self fillColor];
LABEL_8:
  return v9;
}

- (id)_batteryTextColor
{
  if ([(_UIStatusBarBatteryView *)self saverModeActive]) {
    +[UIColor systemBlackColor];
  }
  else {
  v2 = +[UIColor systemWhiteColor];
  }
  return v2;
}

- (BOOL)_batteryTextIsCutout
{
  if ([(_UIStatusBarBatteryView *)self saverModeActive]
    || [(_UIStatusBarBatteryView *)self chargingState])
  {
    return 0;
  }
  else
  {
    return ![(_UIStatusBarBatteryView *)self isLowBattery];
  }
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  double v3 = 11.5;
  double v4 = 22.0;
  switch(a3)
  {
    case 0:
      v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 22.0, 11.5);
      [v7 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarBatteryView.m" lineNumber:314 description:@"Undefined icon size"];

      double v4 = *MEMORY[0x1E4F1DB30];
      double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
    case 2:
    case 17:
      double v3 = 11.3333333;
      break;
    case 3:
      double v3 = 11.3333333;
      double v4 = 20.6666667;
      break;
    case 4:
      double v3 = 12.0;
      double v4 = 22.6666667;
      break;
    case 5:
      double v3 = 12.5;
      goto LABEL_16;
    case 6:
      double v4 = 24.0;
      double v3 = 12.3333333;
      break;
    case 7:
      double v3 = 13.0;
      double v4 = 25.0;
      break;
    case 8:
      double v3 = 14.3333333;
      double v4 = 28.3333333;
      break;
    case 9:
    case 15:
      double v3 = 14.0;
      double v4 = 28.0;
      break;
    case 10:
      double v3 = 13.6666667;
      double v4 = 27.3333333;
      break;
    case 11:
      double v3 = 15.0;
      double v4 = 29.0;
      break;
    case 12:
      double v4 = 29.0;
      double v3 = 14.6666667;
      break;
    case 13:
      double v4 = 30.0;
      double v3 = 15.3333333;
      break;
    case 14:
      double v3 = 12.0;
LABEL_16:
      double v4 = 24.0;
      break;
    default:
      break;
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (CGSize)_batterySizeForTraitCollection:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    [v4 displayScale];
    double v10 = 15.0;
    *(double *)&uint64_t v8 = 33.0;
  }
  else if (internalSizeCategory == 1)
  {
    [v4 displayScale];
    if (v11 <= 2.5)
    {
      double v10 = 11.5;
      *(double *)&uint64_t v8 = 23.5;
    }
    else
    {
      *(double *)&uint64_t v8 = 23.6666667;
      double v10 = 11.3333333;
    }
  }
  else if (internalSizeCategory)
  {
    uint64_t v8 = *(uint64_t *)MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
    uint64_t v8 = v7;
    double v10 = v9;
  }
  if (self->_showsPercentage)
  {
    [(UIView *)self _currentScreenScale];
    double v10 = v10 + 2.0 / v12;
  }

  double v13 = *(double *)&v8;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  if (self->_showsPercentage)
  {
    [(UIView *)self _currentScreenScale];
    double v4 = 1.0 / v3;
  }
  else
  {
    double v4 = 2.22507386e-308;
  }
  double v5 = 2.22507386e-308;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  double v3 = 4.5;
  double v4 = 1.25;
  switch(a3)
  {
    case 0:
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.25, 4.5);
      [v7 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarBatteryView.m" lineNumber:401 description:@"Undefined icon size"];

      double v4 = *MEMORY[0x1E4F1DB30];
      double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
    case 2:
    case 17:
      double v3 = 4.66666667;
      goto LABEL_7;
    case 3:
    case 4:
      double v3 = 4.0;
      goto LABEL_7;
    case 5:
    case 14:
      goto LABEL_10;
    case 6:
      double v3 = 5.0;
      goto LABEL_7;
    case 7:
LABEL_7:
      double v4 = 1.33333333;
      break;
    case 8:
      double v3 = 5.0;
      double v4 = 1.66666667;
      break;
    case 9:
    case 15:
      double v3 = 5.5;
      goto LABEL_12;
    case 10:
      double v3 = 5.0;
LABEL_10:
      double v4 = 1.5;
      break;
    case 11:
      double v3 = 6.0;
LABEL_12:
      double v4 = 1.75;
      break;
    case 12:
      double v3 = 5.66666667;
      goto LABEL_15;
    case 13:
      double v3 = 6.0;
LABEL_15:
      double v4 = 1.83333333;
      break;
    default:
      break;
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (CGSize)_pinSizeForTraitCollection:(id)a3
{
  id v6 = a3;
  uint64_t v7 = v6;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      [v6 displayScale];
      double v3 = 5.0;
      double v4 = 2.0;
      break;
    case 1:
      [v6 displayScale];
      if (v11 <= 2.5)
      {
        double v3 = 3.0;
        double v4 = 1.0;
      }
      else
      {
        double v3 = 4.66666667;
        double v4 = 1.33333333;
      }
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_pinSizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      double v4 = v9;
      double v3 = v10;
      break;
  }

  double v12 = v4;
  double v13 = v3;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  double result = 1.0;
  switch(a3)
  {
    case 0:
      id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.0);
      [v6 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarBatteryView.m" lineNumber:466 description:@"Undefined icon size"];

      double result = 0.0;
      break;
    case 8:
    case 10:
    case 12:
    case 13:
      double result = 1.16666667;
      break;
    case 9:
    case 11:
    case 15:
      double result = 1.25;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_lineWidthAndInterspaceForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    [v4 displayScale];
    if (v9 <= 2.5) {
      double v7 = 1.25;
    }
    else {
      double v7 = 1.16666667;
    }
  }
  else
  {
    double v7 = 1.0;
    if (!internalSizeCategory)
    {
      objc_msgSend((id)objc_opt_class(), "_lineWidthAndInterspaceForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      double v7 = v8;
    }
  }

  return v7;
}

- (double)_outsideCornerRadiusForTraitCollection:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    [v5 displayScale];
    if (v10 <= 2.5) {
      double v3 = 4.25;
    }
    else {
      double v3 = 4.16666667;
    }
  }
  else
  {
    if (internalSizeCategory != 1)
    {
      if (internalSizeCategory) {
        goto LABEL_12;
      }
      unint64_t v8 = [(_UIStatusBarBatteryView *)self iconSize];
      if (v8 < 0x10)
      {
        double v3 = dbl_186B9C5A0[v8];
        goto LABEL_12;
      }
    }
    [v6 displayScale];
    if (v9 <= 2.5) {
      double v3 = 3.25;
    }
    else {
      double v3 = 3.0;
    }
  }
LABEL_12:

  return v3;
}

- (double)_insideCornerRadiusForTraitCollection:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      [v5 displayScale];
      if (v9 <= 2.5) {
        double v3 = 2.0;
      }
      else {
        double v3 = 1.83333333;
      }
      break;
    case 1:
      goto LABEL_6;
    case 0:
      unint64_t v8 = [(_UIStatusBarBatteryView *)self iconSize];
      if (v8 < 0x10)
      {
        double v3 = dbl_186B9C620[v8];
        break;
      }
LABEL_6:
      [v6 displayScale];
      double v3 = 1.5;
      break;
  }

  return v3;
}

- (double)_percentageFontSizeForTraitCollection:(id)a3
{
  id v4 = a3;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
LABEL_4:
    double v6 = 13.0;
  }
  else
  {
    double v6 = 9.0;
    if (!internalSizeCategory)
    {
      switch([(_UIStatusBarBatteryView *)self iconSize])
      {
        case 0:
          double v6 = 0.0;
          break;
        case 2:
        case 4:
          double v6 = 11.3333333;
          break;
        case 3:
          double v6 = 10.3333333;
          break;
        case 5:
        case 6:
        case 9:
          double v6 = 12.0;
          break;
        case 7:
          double v6 = dbl_186B9C540[!self->_rounded];
          break;
        case 8:
          double v6 = 13.6666667;
          break;
        case 10:
        case 11:
        case 12:
        case 13:
          goto LABEL_4;
        case 15:
          double v6 = 10.0;
          break;
        default:
          break;
      }
    }
  }

  return v6;
}

- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3
{
  if (self->_internalSizeCategory) {
    return 1;
  }
  int64_t v5 = [(_UIStatusBarBatteryView *)self iconSize];
  if (v5 == 8) {
    return 0;
  }
  if (v5 != 7) {
    return 1;
  }
  return !self->_rounded;
}

- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (!self->_internalSizeCategory)
  {
    unint64_t v6 = [(_UIStatusBarBatteryView *)self iconSize];
    if (v6 <= 0x11) {
      double v5 = dbl_186B9C6A0[v6];
    }
  }

  return v5;
}

- (CGRect)_bodyRectForTraitCollection:(id)a3
{
  id v4 = a3;
  [(_UIStatusBarBatteryView *)self _batterySizeForTraitCollection:v4];
  double v6 = v5;
  double v8 = v7;
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v4];
  double v10 = v9;

  [(UIView *)self bounds];
  double v12 = v10 * 0.5 + v11;
  double v13 = v6 - v10 * 0.5 - v10 * 0.5;
  double v15 = v10 * 0.5 + v14;
  double v16 = v8 - v10 * 0.5 - v10 * 0.5;
  result.size.double height = v16;
  result.size.double width = v13;
  result.origin.y = v15;
  result.origin.x = v12;
  return result;
}

- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3
{
  id v4 = a3;
  [(_UIStatusBarBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
  double v6 = v5 * 0.333333333 * 10.6666667;
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v4];
  double v8 = v7;

  return v8 + v6;
}

- (void)_updateLightningBoltAndPercentagePosition
{
  if (self->_internalSizeCategory || [(_UIStatusBarBatteryView *)self iconSize])
  {
    double v3 = [(UIView *)self traitCollection];
    [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:v3];
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    if (self->_showsPercentage)
    {
      BOOL v12 = [(_UIStatusBarBatteryView *)self _shouldShowBolt];
      [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
      double v14 = v13;
      [(_UIStatusBarBatteryView *)self _updatePercentageFont];
      [(UIView *)self->_percentageLabel sizeToFit];
      v49.origin.x = v8;
      v49.origin.y = v9;
      v49.size.double width = v10;
      v49.size.double height = v11;
      double MidY = CGRectGetMidY(v49);
      [(_UIStatusBarBatteryView *)self _percentTextVerticalAdjustmentForTraitCollection:v3];
      double v17 = MidY + v16;
      if (v12)
      {
        [(UIView *)self _currentScreenScale];
        double v19 = v14 + v14 + 2.0 / v18;
        [(_UIStatusBarBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
        double v21 = v19 + v20 * 0.333333333 * 10.6666667;
        v50.origin.x = v8;
        v50.origin.y = v9;
        v50.size.double width = v10;
        v50.size.double height = v11;
        double MidX = CGRectGetMidX(v50) + v21 * -0.5;
      }
      else if (self->_chargePercent < 0.995 {
             || !self->_internalSizeCategory && [(_UIStatusBarBatteryView *)self iconSize] == 3)
      }
      {
        v52.origin.x = v8;
        v52.origin.y = v9;
        v52.size.double width = v10;
        v52.size.double height = v11;
        double MidX = CGRectGetMidX(v52);
      }
      else
      {
        v53.origin.x = v8;
        v53.origin.y = v9;
        v53.size.double width = v10;
        v53.size.double height = v11;
        double v28 = CGRectGetMidX(v53);
        [(UIView *)self _currentScreenScale];
        double MidX = v28 + -1.0 / v29;
      }
      [(UIView *)self->_percentageLabel bounds];
      double v31 = MidX - v30 * 0.5;
      [(UIView *)self->_percentageLabel bounds];
      double v33 = v17 - v32 * 0.5;
      UIRoundToViewScale(self->_percentageLabel);
      double v35 = MidX + v31 - v34;
      UIRoundToViewScale(self->_percentageLabel);
      -[UIView setPosition:](self->_percentageLabel, "setPosition:", v35, v17 - (v33 - v36));
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        CGAffineTransformMakeScale(&v47, -1.0, 1.0);
        percentageLabel = self->_percentageLabel;
        CGAffineTransform v46 = v47;
        v38 = &v46;
      }
      else
      {
        percentageLabel = self->_percentageLabel;
        long long v39 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v43 = *MEMORY[0x1E4F1DAB8];
        long long v44 = v39;
        long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        v38 = (CGAffineTransform *)&v43;
      }
      -[UIView setTransform:](percentageLabel, "setTransform:", v38, v43, v44, v45, *(_OWORD *)&v46.a, *(_OWORD *)&v46.c, *(_OWORD *)&v46.tx);
      [(UIView *)self->_percentageLabel size];
      double v41 = v40;
      v54.origin.x = v8;
      v54.origin.y = v9;
      v54.size.double width = v10;
      v54.size.double height = v11;
      CGFloat v42 = CGRectGetMidX(v54) + v41 * 0.5;
      -[CALayer setPosition:](self->_boltMaskLayer, "setPosition:", v42, v17);
      boltLayer = self->_boltLayer;
      double v26 = v42;
      double v27 = v17;
    }
    else
    {
      double v23 = CGRectGetMidX(*(CGRect *)&v4);
      v51.origin.x = v8;
      v51.origin.y = v9;
      v51.size.double width = v10;
      v51.size.double height = v11;
      double v24 = CGRectGetMidY(v51);
      -[CALayer setPosition:](self->_boltMaskLayer, "setPosition:", v23, v24);
      boltLayer = self->_boltLayer;
      double v26 = v23;
      double v27 = v24;
    }
    -[CALayer setPosition:](boltLayer, "setPosition:", v26, v27);
  }
  else
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIStatusBarBatteryView *)self _updateBodyLayers];
  -[CALayer setFrame:](self->_bodyLayer, "setFrame:", v4, v6, v8, v10);
  [(_UIStatusBarBatteryView *)self _updateLightningBoltAndPercentagePosition];
  [(_UIStatusBarBatteryView *)self _updateBodyColors];
  [(_UIStatusBarBatteryView *)self __updateFillLayer];
  CGFloat v11 = (void *)MEMORY[0x1E4F39CF8];
  [v11 commit];
}

- (CGRect)_updateBodyLayers
{
  double v3 = [(UIView *)self traitCollection];
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v5 = v4;
  [(_UIStatusBarBatteryView *)self _batterySizeForTraitCollection:v3];
  double v44 = v6;
  [(_UIStatusBarBatteryView *)self _pinSizeForTraitCollection:v3];
  double v45 = v7;
  double v9 = v8;
  [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:v3];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIView *)self bounds];
  CGFloat v42 = v19;
  CGFloat v43 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  if ([(_UIStatusBarBatteryView *)self rounded])
  {
    double v24 = v17 / 3.125;
  }
  else
  {
    [(_UIStatusBarBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
    double v24 = v25 + v5 * -0.5;
  }
  double v26 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v24);
  double v27 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
  [v27 setLineWidth:v5];

  id v28 = v26;
  uint64_t v29 = [v28 CGPath];
  double v30 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
  [v30 setPath:v29];

  v46.origin.y = v42;
  v46.origin.x = v43;
  v46.size.double width = v21;
  v46.size.double height = v23;
  -[CALayer setFrame:](self->_pinLayer, "setFrame:", v5 + v44, CGRectGetMidY(v46) + v9 * -0.5, v45, v9);
  double v31 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
  [v31 setLineWidth:v5];

  id v32 = v28;
  uint64_t v33 = [v32 CGPath];
  double v34 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
  [v34 setPath:v33];

  objc_msgSend((id)objc_opt_class(), "_pinBezierPathForSize:isComplex:", self->_internalSizeCategory == 2, v45, v9);
  id v35 = objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v35 CGPath];
  v37 = [(_UIStatusBarBatteryView *)self pinShapeLayer];
  [v37 setPath:v36];

  double v38 = v11;
  double v39 = v15;
  double v40 = v13;
  double v41 = v17;
  result.size.double height = v41;
  result.size.double width = v39;
  result.origin.y = v40;
  result.origin.x = v38;
  return result;
}

- (void)_updateBodyColors
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      double v44 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v44, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    double v45 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateBodyColors___s_category) + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGRect v46 = 0;
      _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v46, 2u);
    }
  }
  double v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  double v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  double v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (self->_showsPercentage)
  {
    id v6 = [(_UIStatusBarBatteryView *)self _batteryUnfilledColor];
    uint64_t v7 = [v6 CGColor];
    [v6 alphaComponent];
    if (v8 >= 1.0)
    {
      id v32 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      [v32 setStrokeColor:v7];

      uint64_t v33 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      [v33 setFillColor:v7];

      double v15 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      double v16 = v15;
      LODWORD(v17) = 1.0;
    }
    else
    {
      id v9 = [v6 colorWithAlphaComponent:1.0];
      uint64_t v10 = [v9 CGColor];

      double v11 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      [v11 setStrokeColor:v10];

      double v12 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      [v12 setFillColor:v10];

      [v6 alphaComponent];
      float v14 = v13;
      double v15 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
      double v16 = v15;
      *(float *)&double v17 = v14;
    }
    [v15 setOpacity:v17];

    double v34 = [(_UIStatusBarBatteryView *)self pinShapeLayer];
    [v34 setFillColor:v7];

    id v35 = [(_UIStatusBarBatteryView *)self _batteryTextColor];
    uint64_t v36 = [v35 CGColor];
    v37 = [(_UIStatusBarBatteryView *)self boltShapeLayer];
    [v37 setFillColor:v36];

    id v38 = [(_UIStatusBarBatteryView *)self _batteryFillColor];
    uint64_t v39 = [v38 CGColor];
    double v40 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
    [v40 setStrokeColor:v39];

    double v41 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
    [v41 setFillColor:v39];

    CGFloat v42 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
    LODWORD(v43) = 1.0;
    [v42 setOpacity:v43];
  }
  else
  {
    id v18 = [(_UIStatusBarBatteryView *)self bodyColor];
    uint64_t v19 = [v18 CGColor];
    double v20 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
    [v20 setStrokeColor:v19];

    id v21 = +[UIColor clearColor];
    uint64_t v22 = [v21 CGColor];
    CGFloat v23 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
    [v23 setFillColor:v22];

    double v24 = [(_UIStatusBarBatteryView *)self bodyShapeLayer];
    LODWORD(v25) = 1.0;
    [v24 setOpacity:v25];

    id v26 = [(_UIStatusBarBatteryView *)self pinColor];
    uint64_t v27 = [v26 CGColor];
    id v28 = [(_UIStatusBarBatteryView *)self pinShapeLayer];
    [v28 setFillColor:v27];

    id v29 = [(_UIStatusBarBatteryView *)self boltColor];
    uint64_t v30 = [v29 CGColor];
    double v31 = [(_UIStatusBarBatteryView *)self boltShapeLayer];
    [v31 setFillColor:v30];

    id v6 = [(_UIStatusBarBatteryView *)self percentFillShapeLayer];
    [v6 setOpacity:0.0];
  }

  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
}

- (void)_updateFillColor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  double v3 = __43___UIStatusBarBatteryView__updateFillColor__block_invoke;
  double v4 = &unk_1E52D9F70;
  double v5 = self;
  if ([MEMORY[0x1E4F39CF8] currentState])
  {
    v3((uint64_t)v2);
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    if (+[UIView areAnimationsEnabled]) {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
    }
    else {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    v3((uint64_t)v2);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)_updateBatteryFillColor
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      double v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateBatteryFillColor___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v10, 2u);
    }
  }
  double v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  double v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  double v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (self->_showsPercentage)
  {
    id v6 = +[UIColor clearColor];
    -[CALayer setBackgroundColor:](self->_fillLayer, "setBackgroundColor:", [v6 CGColor]);

    [(_UIStatusBarBatteryView *)self _updateBodyColors];
  }
  else
  {
    id v7 = [(_UIStatusBarBatteryView *)self _batteryFillColor];
    -[CALayer setBackgroundColor:](self->_fillLayer, "setBackgroundColor:", [v7 CGColor]);
  }
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
}

- (void)__updateFillLayer
{
  if ([(_UIStatusBarBatteryView *)self internalSizeCategory]
    || [(_UIStatusBarBatteryView *)self iconSize])
  {
    [(_UIStatusBarBatteryView *)self _updateFillLayer];
    [(_UIStatusBarBatteryView *)self _updateFillColor];
  }
}

- (void)__resetBoltLayers
{
  [(CALayer *)self->_boltMaskLayer removeFromSuperlayer];
  boltMaskLayer = self->_boltMaskLayer;
  self->_boltMaskLayer = 0;

  [(CALayer *)self->_boltLayer removeFromSuperlayer];
  boltLayer = self->_boltLayer;
  self->_boltLayer = 0;

  [(_UIStatusBarBatteryView *)self _updateBolt];
}

- (void)_updateFillLayer
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v3;
  double v7 = 0.0;
  [(_UIStatusBarBatteryView *)self _fillLayerFrame:&v8 cornerRadius:&v7];
  [(CALayer *)self->_fillLayer setCornerRadius:v7];
  -[CALayer setFrame:](self->_fillLayer, "setFrame:", v8, v9);
  long long v4 = v8;
  long long v5 = v9;
  id v6 = [(CALayer *)self->_percentFillLayer mask];
  objc_msgSend(v6, "setFrame:", v4, v5);
}

- (void)_fillLayerFrame:(CGRect *)a3 cornerRadius:(double *)a4
{
  id v24 = [(UIView *)self traitCollection];
  [(_UIStatusBarBatteryView *)self _batterySizeForTraitCollection:v24];
  double v8 = v7;
  double v10 = v9;
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v24];
  double v12 = v11;
  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  [(_UIStatusBarBatteryView *)self chargePercent];
  if (!self->_showsPercentage)
  {
    double v14 = v12 + v12 + v14;
    double v8 = v8 - (v12 + v12) - (v12 + v12);
    double v16 = v12 + v12 + v16;
    double v10 = v10 - (v12 + v12) - (v12 + v12);
  }
  double v18 = v17 * v8;
  [(_UIStatusBarBatteryView *)self _insideCornerRadiusForTraitCollection:v24];
  double v20 = v19;
  if ([(_UIStatusBarBatteryView *)self rounded]) {
    double v20 = v10 / 3.125;
  }
  if (!self->_showsPercentage)
  {
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.double width = v18;
    v26.size.double height = v10;
    if (CGRectGetWidth(v26) < v20 + v20)
    {
      v27.origin.x = v14;
      v27.origin.y = v16;
      v27.size.double width = v18;
      v27.size.double height = v10;
      CGFloat v21 = CGRectGetWidth(v27) * 0.5;
      double v22 = (v20 - v21) * 0.5;
      double v16 = v16 + v22;
      double v10 = v10 - v22 - v22;
      double v20 = v21;
    }
  }
  UIRoundToViewScale(self);
  if (a3)
  {
    a3->origin.x = v14;
    a3->origin.y = v16;
    a3->size.double width = fmax(v23, 1.0);
    a3->size.double height = v10;
  }
  if (a4) {
    *a4 = v20;
  }
}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  long long v3 = [(UIView *)self traitCollection];
  [(_UIStatusBarBatteryView *)self _percentageFontSizeForTraitCollection:v3];
  double v5 = v4;
  double v6 = 11.5;
  if (!self->_internalSizeCategory && [(_UIStatusBarBatteryView *)self iconSize])
  {
    [(id)objc_opt_class() _batterySizeForIconSize:1];
    double v6 = v7;
  }

  return v5 / v6 * 0.7;
}

- (double)_batteryBoltScaleFactorMultiplier
{
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (!internalSizeCategory)
  {
    if ([(_UIStatusBarBatteryView *)self iconSize])
    {
      objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      double v6 = v5;
      [(id)objc_opt_class() _batterySizeForIconSize:1];
      return v6 / v7;
    }
    int64_t internalSizeCategory = self->_internalSizeCategory;
  }
  double result = 1.30434783;
  if (internalSizeCategory != 2) {
    return 1.0;
  }
  return result;
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.333333333;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.125;
}

- (void)_updateBolt
{
  BOOL v3 = [(_UIStatusBarBatteryView *)self _shouldShowBolt];
  [(CALayer *)self->_boltLayer opacity];
  float v5 = v4;
  BOOL showsPercentage = self->_showsPercentage;
  [(_UIStatusBarBatteryView *)self _batteryBoltLargeScaleFactor];
  double v8 = v7;
  if (showsPercentage) {
    [(_UIStatusBarBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
  }
  else {
    [(_UIStatusBarBatteryView *)self _batteryBoltScaleFactorMultiplier];
  }
  CGFloat v10 = v8 * v9;
  [(_UIStatusBarBatteryView *)self _batteryBoltSmallScaleFactor];
  double v12 = v11;
  [(_UIStatusBarBatteryView *)self _batteryBoltScaleFactorMultiplier];
  CGFloat v14 = v12 * v13;
  memset(&v37, 0, sizeof(v37));
  CATransform3DMakeScale(&v37, v10, v10, 1.0);
  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeScale(&v36, v14, v14, 1.0);
  char v15 = !v3;
  if (v3 && v5 != 1.0)
  {
    if (!self->_boltLayer) {
      -[_UIStatusBarBatteryView _createBoltLayersWithSize:](self, "_createBoltLayersWithSize:", 32.0, 40.0);
    }
    double v16 = [(UIView *)self layer];
    [v16 addSublayer:self->_boltMaskLayer];

    double v17 = [(UIView *)self layer];
    [v17 addSublayer:self->_boltLayer];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    CATransform3D v35 = v37;
    id v32 = __38___UIStatusBarBatteryView__updateBolt__block_invoke;
    uint64_t v33 = &unk_1E52E9E00;
    double v34 = self;
    if (+[UIView areAnimationsEnabled])
    {
      CATransform3D v30 = v36;
      [(CALayer *)self->_boltLayer setTransform:&v30];
      [(CALayer *)self->_boltLayer setOpacity:0.0];
      CATransform3D v29 = v36;
      [(CALayer *)self->_boltMaskLayer setTransform:&v29];
      [(CALayer *)self->_boltMaskLayer setOpacity:0.0];
      [(_UIStatusBarBatteryView *)self _unflipBoltIfNecessary];
      [(_UIStatusBarBatteryView *)self _notifyWillBeginAnimatingBoltToVisible:1];
      [MEMORY[0x1E4F39CF8] begin];
      double v18 = 0.25;
      if (!self->_showsPercentage) {
        double v18 = 0.5;
      }
      [MEMORY[0x1E4F39CF8] setAnimationDuration:v18];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __38___UIStatusBarBatteryView__updateBolt__block_invoke_2;
      v27[3] = &unk_1E52D9FC0;
      v27[4] = self;
      BOOL v28 = v3;
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v27];
      v32((uint64_t)v31);
      double v19 = (void *)MEMORY[0x1E4F39CF8];
    }
    else
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      v32((uint64_t)v31);
      double v19 = (void *)MEMORY[0x1E4F39CF8];
    }
    goto LABEL_25;
  }
  if (!v3 && v5 == 1.0)
  {
    [(_UIStatusBarBatteryView *)self _notifyWillBeginAnimatingBoltToVisible:0];
    [MEMORY[0x1E4F39CF8] begin];
    if (+[UIView areAnimationsEnabled]) {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
    }
    else {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __38___UIStatusBarBatteryView__updateBolt__block_invoke_3;
    v25[3] = &unk_1E52D9FC0;
    v25[4] = self;
    BOOL v26 = v3;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v25];
    CATransform3D v24 = v36;
    [(CALayer *)self->_boltLayer setTransform:&v24];
    [(CALayer *)self->_boltLayer setOpacity:0.0];
    CATransform3D v23 = v36;
    [(CALayer *)self->_boltMaskLayer setTransform:&v23];
    [(CALayer *)self->_boltMaskLayer setOpacity:0.0];
    [(_UIStatusBarBatteryView *)self _unflipBoltIfNecessary];
    double v19 = (void *)MEMORY[0x1E4F39CF8];
LABEL_25:
    [v19 commit];
    return;
  }
  if (v5 != 1.0) {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    CATransform3D v22 = v37;
    [(CALayer *)self->_boltLayer setTransform:&v22];
    CATransform3D v21 = v37;
    [(CALayer *)self->_boltMaskLayer setTransform:&v21];
    double v20 = 0.0;
    if (!self->_showsPercentage) {
      *(float *)&double v20 = 1.0;
    }
    [(CALayer *)self->_boltMaskLayer setOpacity:v20];
    [(_UIStatusBarBatteryView *)self _unflipBoltIfNecessary];
  }
}

- (void)_notifyWillBeginAnimatingBoltToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIStatusBarBatteryView *)self internalSizeCategory]
    || [(_UIStatusBarBatteryView *)self iconSize])
  {
    [(_UIStatusBarBatteryView *)self _willBeginAnimatingBoltToVisible:v3];
  }
}

- (void)_notifyDidFinishAnimatingBoltToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIStatusBarBatteryView *)self internalSizeCategory]
    || [(_UIStatusBarBatteryView *)self iconSize])
  {
    [(_UIStatusBarBatteryView *)self _didFinishAnimatingBoltToVisible:v3];
  }
}

- (void)_updatePercentageFont
{
  BOOL v3 = [(UIView *)self traitCollection];
  [(_UIStatusBarBatteryView *)self _percentageFontSizeForTraitCollection:v3];
  uint64_t v5 = v4;

  double v6 = [(UIView *)self traitCollection];
  BOOL v7 = [(_UIStatusBarBatteryView *)self _percentageFontCondensedWhenChargingForTraitCollection:v6];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  CGFloat v14 = __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke;
  char v15 = &unk_1E52E9E28;
  BOOL v18 = v7;
  double v16 = self;
  uint64_t v17 = v5;
  if (self->_percentageLabel)
  {
    double v8 = __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    [(UILabel *)self->_percentageLabel setFont:v8];
  }
  else
  {
    double v9 = [UILabel alloc];
    CGFloat v10 = -[UILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    percentageLabel = self->_percentageLabel;
    self->_percentageLabel = v10;

    double v12 = v14((uint64_t)v13);
    [(UILabel *)self->_percentageLabel setFont:v12];

    [(UIView *)self addSubview:self->_percentageLabel];
    [(_UIStatusBarBatteryView *)self _updateFillColor];
  }
}

- (void)_updatePercentage
{
  if (self->_showsPercentage)
  {
    double v3 = self->_chargePercent * 100.0;
    if (v3 < 1.0) {
      double v3 = 1.0;
    }
    uint64_t v4 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%.0f", *(void *)&v3);
    uint64_t v5 = [(UILabel *)self->_percentageLabel text];
    char v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [(UILabel *)self->_percentageLabel setText:v4];
      [(_UIStatusBarBatteryView *)self _updateLightningBoltAndPercentagePosition];
      [MEMORY[0x1E4F39CF8] commit];
    }
    [(UIView *)self->_percentageLabel alpha];
    if (v7 < 1.0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44___UIStatusBarBatteryView__updatePercentage__block_invoke;
      v10[3] = &unk_1E52D9F70;
      v10[4] = self;
      +[UIView animateWithDuration:v10 animations:0.5];
    }
  }
  else
  {
    [(UIView *)self->_percentageLabel alpha];
    if (v8 > 0.0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44___UIStatusBarBatteryView__updatePercentage__block_invoke_2;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0.25];
    }
  }
  [(_UIStatusBarBatteryView *)self __updateFillLayer];
}

- (void)_updateTransform
{
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
    double v3 = [(UIView *)self layer];
    uint64_t v4 = v3;
    CATransform3D v18 = v19;
    uint64_t v5 = &v18;
  }
  else
  {
    double v3 = [(UIView *)self layer];
    uint64_t v4 = v3;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v15 = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v17 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v10 = *MEMORY[0x1E4F39B10];
    long long v11 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v13 = v9;
    uint64_t v5 = (CATransform3D *)&v10;
  }
  objc_msgSend(v3, "setSublayerTransform:", v5, v10, v11, v12, v13, v14, v15, v16, v17, *(_OWORD *)&v18.m11, *(_OWORD *)&v18.m13, *(_OWORD *)&v18.m21, *(_OWORD *)&v18.m23, *(_OWORD *)&v18.m31, *(_OWORD *)&v18.m33, *(_OWORD *)&v18.m41, *(_OWORD *)&v18.m43);
}

- (void)_unflipBoltIfNecessary
{
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    boltLayer = self->_boltLayer;
    if (boltLayer) {
      [(CALayer *)boltLayer transform];
    }
    else {
      memset(&a, 0, sizeof(a));
    }
    CATransform3DMakeScale(&b, -1.0, 1.0, 1.0);
    CATransform3DConcat(&v14, &a, &b);
    uint64_t v4 = self->_boltLayer;
    CATransform3D v11 = v14;
    [(CALayer *)v4 setTransform:&v11];
    boltMaskLayer = self->_boltMaskLayer;
    if (boltMaskLayer) {
      [(CALayer *)boltMaskLayer transform];
    }
    else {
      memset(&v9, 0, sizeof(v9));
    }
    CATransform3DMakeScale(&v8, -1.0, 1.0, 1.0);
    CATransform3DConcat(&v10, &v9, &v8);
    long long v6 = self->_boltMaskLayer;
    CATransform3D v7 = v10;
    [(CALayer *)v6 setTransform:&v7];
  }
}

- (void)setInternalSizeCategory:(int64_t)a3
{
  if (self->_internalSizeCategory != a3)
  {
    self->_int64_t internalSizeCategory = a3;
    [(_UIStatusBarBatteryView *)self __resetBoltLayers];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setSizeCategory:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  [(_UIStatusBarBatteryView *)self setInternalSizeCategory:v3];
}

- (int64_t)sizeCategory
{
  return self->_internalSizeCategory == 2;
}

- (void)setChargePercent:(double)a3
{
  if (self->_chargePercent != a3)
  {
    BOOL v5 = [(_UIStatusBarBatteryView *)self _shouldShowBolt];
    BOOL v6 = [(_UIStatusBarBatteryView *)self isLowBattery];
    self->_chargePercent = fmin(fmax(a3, 0.0), 1.0);
    if (v5 != [(_UIStatusBarBatteryView *)self _shouldShowBolt])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44___UIStatusBarBatteryView_setChargePercent___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
    if (self->_showsPercentage && v6 != [(_UIStatusBarBatteryView *)self isLowBattery])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44___UIStatusBarBatteryView_setChargePercent___block_invoke_2;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      +[UIView animateWithDuration:v7 animations:0.25];
    }
    [(_UIStatusBarBatteryView *)self __updateFillLayer];
    [(_UIStatusBarBatteryView *)self _updatePercentage];
  }
}

- (void)setChargingState:(int64_t)a3
{
  if (self->_chargingState != a3)
  {
    self->_chargingState = a3;
    if (self->_showsPercentage)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __44___UIStatusBarBatteryView_setChargingState___block_invoke;
      v4[3] = &unk_1E52D9F70;
      v4[4] = self;
      +[UIView animateWithDuration:v4 animations:0.25];
    }
    [(_UIStatusBarBatteryView *)self _updateFillColor];
    [(_UIStatusBarBatteryView *)self _updateBolt];
  }
}

- (void)setSaverModeActive:(BOOL)a3
{
  if (self->_saverModeActive != a3)
  {
    self->_saverModeActive = a3;
    [(_UIStatusBarBatteryView *)self _updateFillColor];
  }
}

- (void)setLowBatteryMode:(int64_t)a3
{
  if (self->_lowBatteryMode != a3)
  {
    BOOL v5 = [(_UIStatusBarBatteryView *)self isLowBattery];
    self->_lowBatteryMode = a3;
    if (v5 != [(_UIStatusBarBatteryView *)self isLowBattery])
    {
      [(_UIStatusBarBatteryView *)self _updateFillColor];
    }
  }
}

- (BOOL)isLowBattery
{
  int64_t lowBatteryMode = self->_lowBatteryMode;
  if (lowBatteryMode) {
    return lowBatteryMode == 2;
  }
  [(_UIStatusBarBatteryView *)self chargePercent];
  double v6 = v5;
  [(_UIStatusBarBatteryView *)self lowBatteryChargePercentThreshold];
  return v6 <= v7;
}

- (void)setShowsInlineChargingIndicator:(BOOL)a3
{
  if (self->_showsInlineChargingIndicator != a3)
  {
    self->_showsInlineChargingIndicator = a3;
    [(_UIStatusBarBatteryView *)self _updatePercentage];
    [(_UIStatusBarBatteryView *)self _updateBolt];
  }
}

- (void)setShowsPercentage:(BOOL)a3
{
  if (self->_showsPercentage != a3)
  {
    self->_BOOL showsPercentage = a3;
    [(_UIStatusBarBatteryView *)self _updatePercentageFont];
    [(_UIStatusBarBatteryView *)self _updatePercentage];
    [(_UIStatusBarBatteryView *)self _updateBolt];
    if (self->_internalSizeCategory || [(_UIStatusBarBatteryView *)self iconSize])
    {
      [(_UIStatusBarBatteryView *)self _updateBodyLayers];
      [(UIView *)self invalidateIntrinsicContentSize];
      [(UIView *)self setNeedsLayout];
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46___UIStatusBarBatteryView_setShowsPercentage___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:0.25];
    if (!a3) {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
    }
  }
}

- (BOOL)_shouldShowBolt
{
  BOOL v2 = !self->_showsPercentage || self->_chargePercent < 0.995;
  if (!self->_showsInlineChargingIndicator) {
    return 0;
  }
  if (self->_chargingState) {
    return v2;
  }
  return 0;
}

- (void)setFillColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_fillColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(_UIStatusBarBatteryView *)self _updateFillColor];
    double v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
      double v5 = v6;
    }
  }
}

- (UIColor)fillColor
{
  fillColor = self->_fillColor;
  if (fillColor)
  {
    uint64_t v3 = fillColor;
  }
  else
  {
    uint64_t v3 = +[UIColor labelColor];
  }
  return v3;
}

- (void)setBodyColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_bodyColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_bodyColor, a3);
    double v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
      double v5 = v6;
    }
  }
}

- (UIColor)bodyColor
{
  bodyColor = self->_bodyColor;
  if (bodyColor)
  {
    uint64_t v3 = bodyColor;
  }
  else
  {
    double v5 = [(_UIStatusBarBatteryView *)self fillColor];
    uint64_t v3 = [v5 colorWithAlphaComponent:self->_bodyColorAlpha];
  }
  return v3;
}

- (void)setBodyColorAlpha:(double)a3
{
  if (self->_bodyColorAlpha != a3)
  {
    self->_bodyColorAlphCATransform3D a = a3;
    if (!self->_bodyColor && !self->_showsPercentage) {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
    }
  }
}

- (void)setPinColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_pinColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_pinColor, a3);
    double v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
      double v5 = v6;
    }
  }
}

- (UIColor)pinColor
{
  pinColor = self->_pinColor;
  if (pinColor)
  {
    uint64_t v3 = pinColor;
  }
  else
  {
    double v5 = [(_UIStatusBarBatteryView *)self bodyColor];
    uint64_t v3 = [v5 colorWithAlphaComponent:self->_pinColorAlpha];
  }
  return v3;
}

- (void)setPinColorAlpha:(double)a3
{
  if (self->_pinColorAlpha != a3)
  {
    self->_pinColorAlphCATransform3D a = a3;
    if (!self->_pinColor && !self->_showsPercentage) {
      [(_UIStatusBarBatteryView *)self _updateBodyColors];
    }
  }
}

- (void)setBoltColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_boltColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_boltColor, a3);
    [(_UIStatusBarBatteryView *)self _updateBodyColors];
    double v5 = v6;
  }
}

- (UIColor)boltColor
{
  boltColor = self->_boltColor;
  if (boltColor)
  {
    uint64_t v3 = boltColor;
  }
  else
  {
    uint64_t v4 = [(_UIStatusBarBatteryView *)self bodyColor];
    uint64_t v3 = [v4 colorWithAlphaComponent:1.0];
  }
  return v3;
}

- (void)setInactiveColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    if (self->_showsPercentage) {
      [(_UIStatusBarBatteryView *)self _updateFillColor];
    }
  }
}

- (UIColor)inactiveColor
{
  inactiveColor = self->_inactiveColor;
  if (inactiveColor)
  {
    uint64_t v3 = inactiveColor;
  }
  else
  {
    double v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    BOOL saverModeActive = self->_saverModeActive;
    if (v6 == 2)
    {
      if (!self->_saverModeActive
        && ([(_UIStatusBarBatteryView *)self isLowBattery]
         || [(_UIStatusBarBatteryView *)self chargingState]))
      {
        CATransform3D v8 = +[UIColor systemWhiteColor];
        CATransform3D v9 = v8;
        double v10 = 0.3;
      }
      else
      {
        CATransform3D v8 = +[UIColor systemWhiteColor];
        CATransform3D v9 = v8;
        double v10 = 0.5;
      }
    }
    else
    {
      CATransform3D v8 = +[UIColor systemBlackColor];
      CATransform3D v9 = v8;
      if (saverModeActive) {
        double v10 = 0.2;
      }
      else {
        double v10 = 0.3;
      }
    }
    uint64_t v3 = [v8 colorWithAlphaComponent:v10];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarBatteryView;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  [(_UIStatusBarBatteryView *)self _updateFillColor];
  [(_UIStatusBarBatteryView *)self _updateTransform];
  [(_UIStatusBarBatteryView *)self _updateBolt];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isRounded];
  uint64_t v6 = [v4 iconSize];

  if (self->_iconSize == v6)
  {
    int rounded = self->_rounded;
    [(_UIStatusBarBatteryView *)self setRounded:v5];
    [(_UIStatusBarBatteryView *)self setIconSize:v6];
    if (rounded == v5) {
      return;
    }
  }
  else
  {
    [(_UIStatusBarBatteryView *)self setRounded:v5];
    [(_UIStatusBarBatteryView *)self setIconSize:v6];
  }
  if (!self->_internalSizeCategory)
  {
    [(_UIStatusBarBatteryView *)self __resetBoltLayers];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

+ (CGSize)_statusBarIntrinsicContentSizeForIconSize:(int64_t)a3
{
  objc_msgSend(a1, "_batterySizeForIconSize:");
  double v6 = v5;
  double v8 = v7;
  [a1 _pinSizeForIconSize:a3];
  double v10 = v9;
  [a1 _lineWidthAndInterspaceForIconSize:a3];
  double v12 = v10 + v6 + v11;
  double v13 = v8;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(UIView *)self traitCollection];
  [(_UIStatusBarBatteryView *)self _batterySizeForTraitCollection:v3];
  double v5 = v4;
  double v7 = v6;
  [(_UIStatusBarBatteryView *)self _pinSizeForTraitCollection:v3];
  double v9 = v8;
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v11 = v9 + v5 + v10;

  double v12 = v11;
  double v13 = v7;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (id)_pinBezierPathForSize:(CGSize)a3 isComplex:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v7 = +[UIBezierPath bezierPath];
  double v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "moveToPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.0, width, width, 4.71238898, 0.0);
    double v9 = height - width;
    objc_msgSend(v8, "addLineToPoint:", width, v9);
    double v10 = 1.57079633;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = v8;
    double v14 = v9;
    double v15 = width;
    uint64_t v16 = 1;
  }
  else
  {
    double v17 = height * 0.5;
    double v18 = v17 - width;
    double v19 = acos((v17 - width) / v17);
    objc_msgSend(v8, "moveToPoint:", 0.0, v17 - sqrt(v17 * v17 - v18 * v18));
    double v11 = -v18;
    double v10 = -v19;
    double v13 = v8;
    double v14 = v17;
    double v15 = v17;
    double v12 = v19;
    uint64_t v16 = 0;
  }
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v16, v11, v14, v15, v12, v10);
  [v8 closePath];
  return v8;
}

+ (id)_boltBezierPathForSize:(CGSize)a3
{
  uint64_t v3 = +[UIBezierPath bezierPath];
  objc_msgSend(v3, "moveToPoint:", 12.429, 37.023);
  objc_msgSend(v3, "addLineToPoint:", 27.272, 19.152);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 27.738, 18.034, 27.583, 18.779, 27.738, 18.422);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 26.418, 16.792, 27.738, 17.304, 27.179, 16.792);
  objc_msgSend(v3, "addLineToPoint:", 17.258, 16.792);
  objc_msgSend(v3, "addLineToPoint:", 22.024, 4.309);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 19.571, 2.974, 22.738, 2.477, 20.813, 1.483);
  objc_msgSend(v3, "addLineToPoint:", 4.728, 20.844);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 4.262, 21.978, 4.417, 21.217, 4.262, 21.574);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 5.582, 23.22, 4.262, 22.692, 4.821, 23.22);
  objc_msgSend(v3, "addLineToPoint:", 14.742, 23.22);
  objc_msgSend(v3, "addLineToPoint:", 9.976, 35.688);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 12.429, 37.023, 9.262, 37.535, 11.187, 38.513);
  [v3 closePath];
  return v3;
}

+ (id)_boltMaskBezierPath
{
  BOOL v2 = +[UIBezierPath bezierPath];
  objc_msgSend(v2, "moveToPoint:", 27.828, -2.5);
  objc_msgSend(v2, "addLineToPoint:", 20.172, -2.5);
  objc_msgSend(v2, "addLineToPoint:", 17.286, 0.948);
  objc_msgSend(v2, "addLineToPoint:", 2.351, 18.929);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 1.188, 21.99, 1.579, 19.856, 1.188, 20.886);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 5.517, 26.24, 1.188, 24.373, 3.09, 26.24);
  objc_msgSend(v2, "addLineToPoint:", 10.376, 26.24);
  objc_msgSend(v2, "addLineToPoint:", 7.14, 34.705);
  objc_msgSend(v2, "addLineToPoint:", 4.18, 42.5);
  objc_msgSend(v2, "addLineToPoint:", 11.834, 42.5);
  objc_msgSend(v2, "addLineToPoint:", 14.714, 39.048);
  objc_msgSend(v2, "addLineToPoint:", 29.648, 21.067);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 30.813, 18.021, 30.421, 20.14, 30.813, 19.115);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 26.484, 13.771, 30.813, 15.638, 28.912, 13.771);
  objc_msgSend(v2, "addLineToPoint:", 21.623, 13.771);
  objc_msgSend(v2, "addLineToPoint:", 24.858, 5.299);
  objc_msgSend(v2, "addLineToPoint:", 27.828, -2.5);
  [v2 closePath];
  return v2;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  [(_UIStatusBarBatteryView *)self chargePercent];
  double v4 = v3;
  double v5 = [(_UIStatusBarBatteryView *)self _batteryFillColor];
  double v6 = [(UIView *)self traitCollection];
  if ([v6 userInterfaceStyle] == 2) {
    +[UIColor whiteColor];
  }
  else {
  double v7 = +[UIColor blackColor];
  }

  BOOL v8 = [(_UIStatusBarBatteryView *)self _shouldShowBolt];
  BOOL v9 = [(UIView *)self _shouldReverseLayoutDirection];
  double v10 = [(UIView *)self _screen];
  [v10 scale];
  double v12 = v11;

  BOOL v13 = [(_UIStatusBarBatteryView *)self showsPercentage];
  double v14 = [(UIView *)self traitCollection];
  double v15 = [v14 preferredContentSizeCategory];

  uint64_t v16 = [(_UIStatusBarBatteryView *)self accessibilityHUDImageCacheInfo];
  char v17 = [v16 cacheMatchesCapacity:v5 fillColor:v7 tintColor:v8 showingBolt:v9 reverseLayout:v13 scale:v15 showsPercentage:v4 contentSizeCategory:v12];

  if ((v17 & 1) == 0)
  {
    double v18 = UIStatusBarCreateHUDBatteryImage(v5, v7, v8, v9, v13, v4, v12);
    double v19 = objc_opt_new();
    [v19 setCachedImage:v18];
    [v19 setCapacity:v4];
    [v19 setFillColor:v5];
    [v19 setTintColor:v7];
    [v19 setShowBolt:v8];
    [v19 setReverseLayoutDirection:v9];
    [v19 setScale:v12];
    [v19 setShowsPercentage:v13];
    [v19 setContentSizeCategory:v15];
    [(_UIStatusBarBatteryView *)self setAccessibilityHUDImageCacheInfo:v19];
  }
  double v20 = [UIAccessibilityHUDItem alloc];
  CATransform3D v21 = [(_UIStatusBarBatteryView *)self accessibilityHUDImageCacheInfo];
  CATransform3D v22 = [v21 cachedImage];
  CATransform3D v23 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v20, "initWithTitle:image:imageInsets:", 0, v22, 0.0, 0.0, 0.0, 0.0);

  [(UIAccessibilityHUDItem *)v23 setFlattenImage:0];
  return v23;
}

- (double)chargePercent
{
  return self->_chargePercent;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (BOOL)saverModeActive
{
  return self->_saverModeActive;
}

- (int64_t)lowBatteryMode
{
  return self->_lowBatteryMode;
}

- (double)lowBatteryChargePercentThreshold
{
  return self->_lowBatteryChargePercentThreshold;
}

- (void)setLowBatteryChargePercentThreshold:(double)a3
{
  self->_lowBatteryChargePercentThreshold = a3;
}

- (BOOL)showsInlineChargingIndicator
{
  return self->_showsInlineChargingIndicator;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (UILabel)percentageLabel
{
  return self->_percentageLabel;
}

- (void)setPercentageLabel:(id)a3
{
}

- (_UIStatusBarBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo
{
  return self->_accessibilityHUDImageCacheInfo;
}

- (void)setAccessibilityHUDImageCacheInfo:(id)a3
{
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_int rounded = a3;
}

- (CALayer)bodyLayer
{
  return self->_bodyLayer;
}

- (void)setBodyLayer:(id)a3
{
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (void)setPinLayer:(id)a3
{
}

- (CALayer)boltMaskLayer
{
  return self->_boltMaskLayer;
}

- (void)setBoltMaskLayer:(id)a3
{
}

- (CALayer)boltLayer
{
  return self->_boltLayer;
}

- (void)setBoltLayer:(id)a3
{
}

- (CALayer)fillLayer
{
  return self->_fillLayer;
}

- (void)setFillLayer:(id)a3
{
}

- (CALayer)percentFillLayer
{
  return self->_percentFillLayer;
}

- (void)setPercentFillLayer:(id)a3
{
}

- (int64_t)internalSizeCategory
{
  return self->_internalSizeCategory;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
}

- (double)bodyColorAlpha
{
  return self->_bodyColorAlpha;
}

- (double)pinColorAlpha
{
  return self->_pinColorAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFillLayer, 0);
  objc_storeStrong((id *)&self->_fillLayer, 0);
  objc_storeStrong((id *)&self->_boltLayer, 0);
  objc_storeStrong((id *)&self->_boltMaskLayer, 0);
  objc_storeStrong((id *)&self->_pinLayer, 0);
  objc_storeStrong((id *)&self->_bodyLayer, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDImageCacheInfo, 0);
  objc_storeStrong((id *)&self->_percentageLabel, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
  objc_storeStrong((id *)&self->_boltColor, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_bodyColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end