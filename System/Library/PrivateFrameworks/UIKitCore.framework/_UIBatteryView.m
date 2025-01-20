@interface _UIBatteryView
+ (CGSize)_batterySizeForIconSize:(int64_t)a3;
+ (CGSize)_pinSizeForIconSize:(int64_t)a3;
+ (double)_insideCornerRadiusForIconSize:(int64_t)a3;
+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3;
+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3;
+ (id)_boltBezierPathForSize:(CGSize)a3;
+ (id)_boltMaskBezierPath;
+ (id)_pinBezierPathForSize:(CGSize)a3 isComplex:(BOOL)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_batteryTextIsCutout;
- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3;
- (BOOL)_shouldShowBolt;
- (BOOL)hasValidIconSize;
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
- (CGSize)_pinSizeForIconSize:(int64_t)a3;
- (CGSize)_pinSizeForTraitCollection:(id)a3;
- (CGSize)intrinsicContentSize;
- (UIColor)bodyColor;
- (UIColor)boltColor;
- (UIColor)fillColor;
- (UIColor)inactiveColor;
- (UIColor)pinColor;
- (UILabel)percentageLabel;
- (_UIBatteryView)initWithCoder:(id)a3;
- (_UIBatteryView)initWithFrame:(CGRect)a3;
- (_UIBatteryView)initWithSizeCategory:(int64_t)a3;
- (_UIBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo;
- (double)_batteryBoltLargeScaleFactor;
- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3;
- (double)_batteryBoltScaleFactorMultiplier;
- (double)_batteryBoltSmallScaleFactor;
- (double)_insideCornerRadiusForTraitCollection:(id)a3;
- (double)_lineWidthAndInterspaceForTraitCollection:(id)a3;
- (double)_outsideCornerRadiusForTraitCollection:(id)a3;
- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3;
- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3;
- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3;
- (double)_percentTextXAdjustmentWhenFullForTraitCollection:(id)a3;
- (double)_percentageBatteryBoltScaleFactorMultiplier;
- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3;
- (double)_percentageFontSizeForIconSize:(int64_t)a3;
- (double)_percentageFontSizeForTraitCollection:(id)a3;
- (double)bodyColorAlpha;
- (double)chargePercent;
- (double)lowBatteryChargePercentThreshold;
- (double)pinColorAlpha;
- (id)_batteryFillColor;
- (id)_batteryTextColor;
- (id)_batteryUnfilledColor;
- (id)accessibilityHUDRepresentation;
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
- (void)_updateForObservedTraitChange;
- (void)_updateLightningBoltAndPercentagePosition;
- (void)_updatePercentage;
- (void)_updatePercentageFont;
- (void)_updateTransform;
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
- (void)setRounded:(BOOL)a3 iconSize:(int64_t)a4;
- (void)setSaverModeActive:(BOOL)a3;
- (void)setShowsInlineChargingIndicator:(BOOL)a3;
- (void)setShowsPercentage:(BOOL)a3;
- (void)setSizeCategory:(int64_t)a3;
@end

@implementation _UIBatteryView

- (CGSize)intrinsicContentSize
{
  v3 = [(UIView *)self traitCollection];
  [(_UIBatteryView *)self _batterySizeForTraitCollection:v3];
  double v5 = v4;
  double v7 = v6;
  [(_UIBatteryView *)self _pinSizeForTraitCollection:v3];
  double v9 = v8;
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v11 = v9 + v5 + v10;

  double v12 = v11;
  double v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateFillColor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v3 = __34___UIBatteryView__updateFillColor__block_invoke;
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

- (void)_updateForObservedTraitChange
{
  [(_UIBatteryView *)self _updateFillColor];
  [(_UIBatteryView *)self _updateTransform];
  [(_UIBatteryView *)self _updateBolt];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
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

- (double)_batteryBoltScaleFactorMultiplier
{
  double result = 1.30434783;
  if (self->_internalSizeCategory != 2) {
    return 1.0;
  }
  return result;
}

- (void)setFillColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_fillColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(_UIBatteryView *)self _updateFillColor];
    double v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIBatteryView *)self _updateBodyColors];
      double v5 = v6;
    }
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
    double v4 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%.0f", *(void *)&v3);
    double v5 = [(UILabel *)self->_percentageLabel text];
    char v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [(UILabel *)self->_percentageLabel setText:v4];
      [(_UIBatteryView *)self _updateLightningBoltAndPercentagePosition];
      [MEMORY[0x1E4F39CF8] commit];
    }
    [(UIView *)self->_percentageLabel alpha];
    if (v7 < 1.0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35___UIBatteryView__updatePercentage__block_invoke;
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
      v9[2] = __35___UIBatteryView__updatePercentage__block_invoke_2;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0.25];
    }
  }
  [(_UIBatteryView *)self __updateFillLayer];
}

- (void)_updateLightningBoltAndPercentagePosition
{
  if (self->_internalSizeCategory || [(_UIBatteryView *)self hasValidIconSize])
  {
    double v3 = [(UIView *)self traitCollection];
    [(_UIBatteryView *)self _bodyRectForTraitCollection:v3];
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    if (self->_showsPercentage)
    {
      BOOL v12 = [(_UIBatteryView *)self _shouldShowBolt];
      [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
      double v14 = v13;
      [(_UIBatteryView *)self _updatePercentageFont];
      [(UIView *)self->_percentageLabel sizeToFit];
      v49.origin.x = v8;
      v49.origin.y = v9;
      v49.size.width = v10;
      v49.size.height = v11;
      double MidY = CGRectGetMidY(v49);
      [(_UIBatteryView *)self _percentTextVerticalAdjustmentForTraitCollection:v3];
      double v17 = MidY + v16;
      if (v12)
      {
        [(UIView *)self _currentScreenScale];
        double v19 = v14 + v14 + 2.0 / v18;
        [(_UIBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
        double v21 = v19 + v20 * 0.333333333 * 10.6666667;
        v50.origin.x = v8;
        v50.origin.y = v9;
        v50.size.width = v10;
        v50.size.height = v11;
        double MidX = CGRectGetMidX(v50) + v21 * -0.5;
      }
      else
      {
        double chargePercent = self->_chargePercent;
        v52.origin.x = v8;
        v52.origin.y = v9;
        v52.size.width = v10;
        v52.size.height = v11;
        double MidX = CGRectGetMidX(v52);
        if (chargePercent >= 0.995)
        {
          [(_UIBatteryView *)self _percentTextXAdjustmentWhenFullForTraitCollection:v3];
          double MidX = MidX + v29;
        }
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
      v53.origin.x = v8;
      v53.origin.y = v9;
      v53.size.width = v10;
      v53.size.height = v11;
      CGFloat v42 = CGRectGetMidX(v53) + v41 * 0.5;
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
      v51.size.width = v10;
      v51.size.height = v11;
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
  [(_UIBatteryView *)self _updateBodyLayers];
  -[CALayer setFrame:](self->_bodyLayer, "setFrame:", v4, v6, v8, v10);
  [(_UIBatteryView *)self _updateLightningBoltAndPercentagePosition];
  [(_UIBatteryView *)self _updateBodyColors];
  [(_UIBatteryView *)self __updateFillLayer];
  CGFloat v11 = (void *)MEMORY[0x1E4F39CF8];
  [v11 commit];
}

- (void)__updateFillLayer
{
  if (self->_internalSizeCategory || [(_UIBatteryView *)self hasValidIconSize])
  {
    [(_UIBatteryView *)self _updateFillLayer];
    [(_UIBatteryView *)self _updateFillColor];
  }
}

- (CALayer)boltLayer
{
  return self->_boltLayer;
}

- (UIColor)boltColor
{
  boltColor = self->_boltColor;
  if (boltColor)
  {
    double v3 = boltColor;
  }
  else
  {
    double v4 = [(_UIBatteryView *)self bodyColor];
    double v3 = [v4 colorWithAlphaComponent:1.0];
  }
  return v3;
}

- (UIColor)pinColor
{
  pinColor = self->_pinColor;
  if (pinColor)
  {
    double v3 = pinColor;
  }
  else
  {
    double v5 = [(_UIBatteryView *)self bodyColor];
    double v3 = [v5 colorWithAlphaComponent:self->_pinColorAlpha];
  }
  return v3;
}

- (UIColor)bodyColor
{
  bodyColor = self->_bodyColor;
  if (bodyColor)
  {
    double v3 = bodyColor;
  }
  else
  {
    double v5 = [(_UIBatteryView *)self fillColor];
    double v3 = [v5 colorWithAlphaComponent:self->_bodyColorAlpha];
  }
  return v3;
}

- (UIColor)fillColor
{
  fillColor = self->_fillColor;
  if (fillColor)
  {
    double v3 = fillColor;
  }
  else
  {
    double v3 = +[UIColor labelColor];
  }
  return v3;
}

- (int64_t)internalSizeCategory
{
  return self->_internalSizeCategory;
}

- (CGRect)_bodyRectForTraitCollection:(id)a3
{
  id v4 = a3;
  [(_UIBatteryView *)self _batterySizeForTraitCollection:v4];
  double v6 = v5;
  double v8 = v7;
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v4];
  double v10 = v9;

  [(UIView *)self bounds];
  if (!self->_showsPercentage)
  {
    double v11 = v10 * 0.5 + v11;
    double v6 = v6 - v10 * 0.5 - v10 * 0.5;
    double v12 = v10 * 0.5 + v12;
    double v8 = v8 - v10 * 0.5 - v10 * 0.5;
  }
  double v13 = v6;
  double v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGSize)_batterySizeForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = v4;
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
    objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
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
  result.height = v14;
  result.width = v13;
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
      objc_msgSend((id)objc_opt_class(), "_lineWidthAndInterspaceForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      double v7 = v8;
    }
  }

  return v7;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (CALayer)bodyLayer
{
  return self->_bodyLayer;
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (CALayer)boltMaskLayer
{
  return self->_boltMaskLayer;
}

- (CGSize)_pinSizeForTraitCollection:(id)a3
{
  id v6 = a3;
  double v7 = v6;
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
      [(_UIBatteryView *)self _pinSizeForIconSize:[(_UIBatteryView *)self iconSize]];
      double v4 = v9;
      double v3 = v10;
      break;
  }

  double v12 = v4;
  double v13 = v3;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CALayer)fillLayer
{
  return self->_fillLayer;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
}

- (id)_batteryFillColor
{
  if ([(_UIBatteryView *)self saverModeActive])
  {
    double v3 = [(UIView *)self traitCollection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35___UIBatteryView__batteryFillColor__block_invoke;
    v15[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v15[4] = 0;
    double v4 = [v3 traitCollectionByModifyingTraits:v15];

    double v5 = +[UIColor systemYellowColor];
LABEL_7:
    double v8 = v5;
    double v9 = [v5 resolvedColorWithTraitCollection:v4];

    goto LABEL_8;
  }
  if ([(_UIBatteryView *)self isLowBattery])
  {
    id v6 = [(UIView *)self traitCollection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35___UIBatteryView__batteryFillColor__block_invoke_2;
    v13[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    long long v14 = xmmword_186B8FCC0;
    double v4 = [v6 traitCollectionByModifyingTraits:v13];

    double v5 = +[UIColor systemRedColor];
    goto LABEL_7;
  }
  if ([(_UIBatteryView *)self chargingState])
  {
    double v7 = [(UIView *)self traitCollection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35___UIBatteryView__batteryFillColor__block_invoke_3;
    v11[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    long long v12 = xmmword_186B8FCC0;
    double v4 = [v7 traitCollectionByModifyingTraits:v11];

    double v5 = +[UIColor systemGreenColor];
    goto LABEL_7;
  }
  double v9 = [(_UIBatteryView *)self fillColor];
LABEL_8:
  return v9;
}

- (BOOL)saverModeActive
{
  return self->_saverModeActive;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (void)_fillLayerFrame:(CGRect *)a3 cornerRadius:(double *)a4
{
  id v24 = [(UIView *)self traitCollection];
  [(_UIBatteryView *)self _batterySizeForTraitCollection:v24];
  double v8 = v7;
  double v10 = v9;
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v24];
  double v12 = v11;
  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  [(_UIBatteryView *)self chargePercent];
  if (!self->_showsPercentage)
  {
    double v14 = v12 + v12 + v14;
    double v8 = v8 - (v12 + v12) - (v12 + v12);
    double v16 = v12 + v12 + v16;
    double v10 = v10 - (v12 + v12) - (v12 + v12);
  }
  double v18 = v17 * v8;
  [(_UIBatteryView *)self _insideCornerRadiusForTraitCollection:v24];
  double v20 = v19;
  if ([(_UIBatteryView *)self rounded]) {
    double v20 = v10 / 3.125;
  }
  if (!self->_showsPercentage)
  {
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v10;
    if (CGRectGetWidth(v26) < v20 + v20)
    {
      v27.origin.x = v14;
      v27.origin.y = v16;
      v27.size.width = v18;
      v27.size.height = v10;
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
    a3->size.width = fmax(v23, 1.0);
    a3->size.height = v10;
  }
  if (a4) {
    *a4 = v20;
  }
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (BOOL)isLowBattery
{
  int64_t lowBatteryMode = self->_lowBatteryMode;
  if (lowBatteryMode) {
    return lowBatteryMode == 2;
  }
  [(_UIBatteryView *)self chargePercent];
  double v6 = v5;
  [(_UIBatteryView *)self lowBatteryChargePercentThreshold];
  return v6 <= v7;
}

- (double)chargePercent
{
  return self->_chargePercent;
}

- (double)lowBatteryChargePercentThreshold
{
  return self->_lowBatteryChargePercentThreshold;
}

- (double)_insideCornerRadiusForTraitCollection:(id)a3
{
  id v5 = a3;
  double v6 = v5;
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
      [v5 displayScale];
      double v3 = 1.5;
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_insideCornerRadiusForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      double v3 = v8;
      break;
  }

  return v3;
}

- (void)_updateBolt
{
  BOOL v3 = [(_UIBatteryView *)self _shouldShowBolt];
  [(CALayer *)self->_boltLayer opacity];
  float v5 = v4;
  BOOL showsPercentage = self->_showsPercentage;
  [(_UIBatteryView *)self _batteryBoltLargeScaleFactor];
  double v8 = v7;
  if (showsPercentage) {
    [(_UIBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
  }
  else {
    [(_UIBatteryView *)self _batteryBoltScaleFactorMultiplier];
  }
  CGFloat v10 = v8 * v9;
  [(_UIBatteryView *)self _batteryBoltSmallScaleFactor];
  double v12 = v11;
  [(_UIBatteryView *)self _batteryBoltScaleFactorMultiplier];
  CGFloat v14 = v12 * v13;
  memset(&v37, 0, sizeof(v37));
  CATransform3DMakeScale(&v37, v10, v10, 1.0);
  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeScale(&v36, v14, v14, 1.0);
  char v15 = !v3;
  if (v3 && v5 != 1.0)
  {
    if (!self->_boltLayer) {
      -[_UIBatteryView _createBoltLayersWithSize:](self, "_createBoltLayersWithSize:", 32.0, 40.0);
    }
    double v16 = [(UIView *)self layer];
    [v16 addSublayer:self->_boltMaskLayer];

    double v17 = [(UIView *)self layer];
    [v17 addSublayer:self->_boltLayer];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    CATransform3D v35 = v37;
    double v32 = __29___UIBatteryView__updateBolt__block_invoke;
    double v33 = &unk_1E52E9E00;
    double v34 = self;
    if (+[UIView areAnimationsEnabled])
    {
      CATransform3D v30 = v36;
      [(CALayer *)self->_boltLayer setTransform:&v30];
      [(CALayer *)self->_boltLayer setOpacity:0.0];
      CATransform3D v29 = v36;
      [(CALayer *)self->_boltMaskLayer setTransform:&v29];
      [(CALayer *)self->_boltMaskLayer setOpacity:0.0];
      [(_UIBatteryView *)self _unflipBoltIfNecessary];
      [(_UIBatteryView *)self _notifyWillBeginAnimatingBoltToVisible:1];
      [MEMORY[0x1E4F39CF8] begin];
      double v18 = 0.25;
      if (!self->_showsPercentage) {
        double v18 = 0.5;
      }
      [MEMORY[0x1E4F39CF8] setAnimationDuration:v18];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __29___UIBatteryView__updateBolt__block_invoke_2;
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
    [(_UIBatteryView *)self _notifyWillBeginAnimatingBoltToVisible:0];
    [MEMORY[0x1E4F39CF8] begin];
    if (+[UIView areAnimationsEnabled]) {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
    }
    else {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __29___UIBatteryView__updateBolt__block_invoke_3;
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
    [(_UIBatteryView *)self _unflipBoltIfNecessary];
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
    [(_UIBatteryView *)self _unflipBoltIfNecessary];
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

- (double)_batteryBoltLargeScaleFactor
{
  return 0.333333333;
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
    float v4 = self->_boltLayer;
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
    double v6 = self->_boltMaskLayer;
    CATransform3D v7 = v10;
    [(CALayer *)v6 setTransform:&v7];
  }
}

- (void)setBoltMaskLayer:(id)a3
{
}

- (void)setBoltLayer:(id)a3
{
}

- (void)setSaverModeActive:(BOOL)a3
{
  if (self->_saverModeActive != a3)
  {
    self->_saverModeActive = a3;
    [(_UIBatteryView *)self _updateFillColor];
  }
}

- (_UIBatteryView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBatteryView;
  BOOL v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIBatteryView *)v3 _commonInit];
  return v3;
}

- (void)_commonInit
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(_UIBatteryView *)self _createBodyLayers];
  [(_UIBatteryView *)self _createFillLayer];
  self->_bodyColorAlphCATransform3D a = 0.4;
  self->_pinColorAlphCATransform3D a = 0.5;
  [(_UIBatteryView *)self setSizeCategory:0];
  BOOL v3 = +[UIDevice currentDevice];
  -[_UIBatteryView setLowBatteryChargePercentThreshold:](self, "setLowBatteryChargePercentThreshold:", dbl_186B94640[[v3 userInterfaceIdiom] == 1]);

  float v4 = self;
  CATransform3D v9 = v4;
  objc_super v5 = self;
  CATransform3D v10 = v5;
  double v6 = self;
  CATransform3D v11 = v6;
  CATransform3D v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  id v8 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, sel__updateForObservedTraitChange, v9, v10);

  [(_UIBatteryView *)self _updateTransform];
}

- (void)_updateTransform
{
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
    BOOL v3 = [(UIView *)self layer];
    float v4 = v3;
    CATransform3D v18 = v19;
    objc_super v5 = &v18;
  }
  else
  {
    BOOL v3 = [(UIView *)self layer];
    float v4 = v3;
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
    objc_super v5 = (CATransform3D *)&v10;
  }
  objc_msgSend(v3, "setSublayerTransform:", v5, v10, v11, v12, v13, v14, v15, v16, v17, *(_OWORD *)&v18.m11, *(_OWORD *)&v18.m13, *(_OWORD *)&v18.m21, *(_OWORD *)&v18.m23, *(_OWORD *)&v18.m31, *(_OWORD *)&v18.m33, *(_OWORD *)&v18.m41, *(_OWORD *)&v18.m43);
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
  [(_UIBatteryView *)self setInternalSizeCategory:v3];
}

- (void)setPinLayer:(id)a3
{
}

- (void)setPercentFillLayer:(id)a3
{
}

- (void)setLowBatteryChargePercentThreshold:(double)a3
{
  self->_lowBatteryChargePercentThreshold = a3;
}

- (void)setFillLayer:(id)a3
{
}

- (void)setBodyLayer:(id)a3
{
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
      v4[2] = __35___UIBatteryView_setChargingState___block_invoke;
      v4[3] = &unk_1E52D9F70;
      v4[4] = self;
      +[UIView animateWithDuration:v4 animations:0.25];
    }
    [(_UIBatteryView *)self _updateFillColor];
    [(_UIBatteryView *)self _updateBolt];
  }
}

- (void)setRounded:(BOOL)a3 iconSize:(int64_t)a4
{
  if (self->_iconSize == a4)
  {
    BOOL rounded = self->_rounded;
    self->_BOOL rounded = a3;
    self->_iconSize = a4;
    if (rounded == a3) {
      return;
    }
  }
  else
  {
    self->_BOOL rounded = a3;
    self->_iconSize = a4;
  }
  if (!self->_internalSizeCategory)
  {
    [(_UIBatteryView *)self __resetBoltLayers];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setInternalSizeCategory:(int64_t)a3
{
  if (self->_internalSizeCategory != a3)
  {
    self->_int64_t internalSizeCategory = a3;
    [(_UIBatteryView *)self __resetBoltLayers];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
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

  [(_UIBatteryView *)self _updateBolt];
}

- (void)setShowsInlineChargingIndicator:(BOOL)a3
{
  if (self->_showsInlineChargingIndicator != a3)
  {
    self->_showsInlineChargingIndicator = a3;
    [(_UIBatteryView *)self _updatePercentage];
    [(_UIBatteryView *)self _updateBolt];
  }
}

- (void)setChargePercent:(double)a3
{
  if (self->_chargePercent != a3)
  {
    BOOL v5 = [(_UIBatteryView *)self _shouldShowBolt];
    BOOL v6 = [(_UIBatteryView *)self isLowBattery];
    self->_double chargePercent = fmin(fmax(a3, 0.0), 1.0);
    if (v5 != [(_UIBatteryView *)self _shouldShowBolt])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __35___UIBatteryView_setChargePercent___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
    if (self->_showsPercentage && v6 != [(_UIBatteryView *)self isLowBattery])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35___UIBatteryView_setChargePercent___block_invoke_2;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      +[UIView animateWithDuration:v7 animations:0.25];
    }
    [(_UIBatteryView *)self __updateFillLayer];
    [(_UIBatteryView *)self _updatePercentage];
  }
}

- (void)setShowsPercentage:(BOOL)a3
{
  if (self->_showsPercentage != a3)
  {
    self->_BOOL showsPercentage = a3;
    [(_UIBatteryView *)self _updatePercentageFont];
    [(_UIBatteryView *)self _updatePercentage];
    [(_UIBatteryView *)self _updateBolt];
    if (self->_internalSizeCategory || [(_UIBatteryView *)self hasValidIconSize])
    {
      [(_UIBatteryView *)self _updateBodyLayers];
      [(UIView *)self invalidateIntrinsicContentSize];
      [(UIView *)self setNeedsLayout];
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37___UIBatteryView_setShowsPercentage___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:0.25];
    if (!a3) {
      [(_UIBatteryView *)self _updateBodyColors];
    }
  }
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

- (void)_createFillLayer
{
  uint64_t v3 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIBatteryView *)self setFillLayer:v3];

  [(CALayer *)self->_fillLayer setMasksToBounds:1];
  [(CALayer *)self->_fillLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
  bodyLayer = self->_bodyLayer;
  fillLayer = self->_fillLayer;
  [(CALayer *)bodyLayer addSublayer:fillLayer];
}

- (void)_createBodyLayers
{
  uint64_t v3 = [MEMORY[0x1E4F39C88] layer];
  [(_UIBatteryView *)self setBodyLayer:v3];

  id v4 = +[UIColor clearColor];
  uint64_t v5 = [v4 CGColor];
  BOOL v6 = [(_UIBatteryView *)self bodyShapeLayer];
  [v6 setFillColor:v5];

  long long v7 = [(UIView *)self layer];
  [v7 addSublayer:self->_bodyLayer];

  long long v8 = [MEMORY[0x1E4F39C88] layer];
  [(_UIBatteryView *)self setPinLayer:v8];

  long long v9 = [(UIView *)self layer];
  [v9 addSublayer:self->_pinLayer];

  long long v10 = [MEMORY[0x1E4F39C88] layer];
  [(_UIBatteryView *)self setPercentFillLayer:v10];

  id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  id v11 = +[UIColor blackColor];
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  long long v12 = [(_UIBatteryView *)self percentFillLayer];
  [v12 setMask:v14];

  long long v13 = [(UIView *)self layer];
  [v13 addSublayer:self->_percentFillLayer];
}

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "_boltBezierPathForSize:", a3.width, a3.height);
  long long v7 = [(id)objc_opt_class() _boltMaskBezierPath];
  long long v8 = [MEMORY[0x1E4F39C88] layer];
  boltMaskLayer = self->_boltMaskLayer;
  self->_boltMaskLayer = v8;

  id v10 = v7;
  uint64_t v11 = [v10 CGPath];
  long long v12 = [(_UIBatteryView *)self boltMaskShapeLayer];
  [v12 setPath:v11];

  id v13 = +[UIColor blackColor];
  uint64_t v14 = [v13 CGColor];
  long long v15 = [(_UIBatteryView *)self boltMaskShapeLayer];
  [v15 setFillColor:v14];

  long long v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [(CALayer *)self->_boltMaskLayer setCompositingFilter:v16];

  -[CALayer setBounds:](self->_boltMaskLayer, "setBounds:", 0.0, 0.0, width, height);
  long long v17 = [MEMORY[0x1E4F39C88] layer];
  boltLayer = self->_boltLayer;
  self->_boltLayer = v17;

  id v21 = v6;
  uint64_t v19 = [v21 CGPath];
  double v20 = [(_UIBatteryView *)self boltShapeLayer];
  [v20 setPath:v19];

  -[CALayer setBounds:](self->_boltLayer, "setBounds:", 0.0, 0.0, width, height);
}

- (_UIBatteryView)initWithSizeCategory:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBatteryView;
  id v4 = [(UIView *)&v6 init];
  [(_UIBatteryView *)v4 _commonInit];
  [(_UIBatteryView *)v4 setSizeCategory:a3];
  return v4;
}

- (_UIBatteryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBatteryView;
  uint64_t v3 = [(UIView *)&v5 initWithCoder:a3];
  [(_UIBatteryView *)v3 _commonInit];
  return v3;
}

- (id)_batteryUnfilledColor
{
  if (self->_showsPercentage && self->_chargePercent < 0.995)
  {
    BOOL v2 = [(_UIBatteryView *)self inactiveColor];
  }
  else
  {
    BOOL v2 = [(_UIBatteryView *)self _batteryFillColor];
  }
  return v2;
}

- (id)_batteryTextColor
{
  if ([(_UIBatteryView *)self saverModeActive]) {
    +[UIColor systemBlackColor];
  }
  else {
  BOOL v2 = +[UIColor systemWhiteColor];
  }
  return v2;
}

- (BOOL)_batteryTextIsCutout
{
  if ([(_UIBatteryView *)self saverModeActive]
    || [(_UIBatteryView *)self chargingState])
  {
    return 0;
  }
  else
  {
    return ![(_UIBatteryView *)self isLowBattery];
  }
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"_UIBatteryView.m" lineNumber:257 description:@"Subclass must implement"];

  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"_UIBatteryView.m" lineNumber:302 description:@"Subclass must implement"];

  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"_UIBatteryView.m" lineNumber:326 description:@"Subclass must implement"];

  return 0.0;
}

+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"_UIBatteryView.m" lineNumber:346 description:@"Subclass must implement"];

  return 0.0;
}

- (double)_outsideCornerRadiusForTraitCollection:(id)a3
{
  id v5 = a3;
  double v6 = v5;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      [v5 displayScale];
      if (v9 <= 2.5) {
        double v3 = 4.25;
      }
      else {
        double v3 = 4.16666667;
      }
      break;
    case 1:
      [v5 displayScale];
      if (v10 <= 2.5) {
        double v3 = 3.25;
      }
      else {
        double v3 = 3.0;
      }
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_outsideCornerRadiusForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      double v3 = v8;
      break;
  }

  return v3;
}

+ (double)_insideCornerRadiusForIconSize:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"_UIBatteryView.m" lineNumber:370 description:@"Subclass must implement"];

  return 0.0;
}

- (double)_percentageFontSizeForIconSize:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIBatteryView.m" lineNumber:394 description:@"Subclass must implement"];

  return 0.0;
}

- (double)_percentageFontSizeForTraitCollection:(id)a3
{
  id v4 = a3;
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    double v6 = 13.0;
  }
  else
  {
    double v6 = 9.0;
    if (!internalSizeCategory)
    {
      [(_UIBatteryView *)self _percentageFontSizeForIconSize:[(_UIBatteryView *)self iconSize]];
      double v6 = v7;
    }
  }

  return v6;
}

- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIBatteryView.m" lineNumber:410 description:@"Subclass must implement"];

  return 0.0;
}

- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3
{
  if (self->_internalSizeCategory) {
    return 1;
  }
  [(_UIBatteryView *)self _percentageFontCondensedWhenChargingForIconSize:[(_UIBatteryView *)self iconSize]];
  return v4 != 0.0;
}

- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIBatteryView.m" lineNumber:425 description:@"Subclass must implement"];

  return 0.0;
}

- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3
{
  if (self->_internalSizeCategory) {
    return 0.0;
  }
  int64_t v5 = [(_UIBatteryView *)self iconSize];
  [(_UIBatteryView *)self _percentTextVerticalAdjustmentForIconSize:v5];
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3
{
  int64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIBatteryView.m" lineNumber:440 description:@"Subclass must implement"];

  return 0.0;
}

- (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  double v4 = objc_opt_class();
  [v4 _pinSizeForIconSize:a3];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForTraitCollection:(id)a3
{
  id v5 = a3;
  if ([v5 userInterfaceIdiom] == 6)
  {
    [v5 displayScale];
    double v7 = 1.0;
LABEL_5:
    double v3 = v7 / v6;
    goto LABEL_6;
  }
  int64_t internalSizeCategory = self->_internalSizeCategory;
  if ((unint64_t)(internalSizeCategory - 1) < 2)
  {
    [v5 displayScale];
    double v7 = -1.0;
    goto LABEL_5;
  }
  if (!internalSizeCategory)
  {
    [(_UIBatteryView *)self _percentTextVerticalAdjustmentForIconSize:[(_UIBatteryView *)self iconSize]];
    double v3 = v10;
  }
LABEL_6:

  return v3;
}

- (BOOL)hasValidIconSize
{
  return 0;
}

- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3
{
  id v4 = a3;
  [(_UIBatteryView *)self _percentageBatteryBoltScaleFactorMultiplier];
  double v6 = v5 * 0.333333333 * 10.6666667;
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v4];
  double v8 = v7;

  return v8 + v6;
}

- (CGRect)_updateBodyLayers
{
  double v3 = [(UIView *)self traitCollection];
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v5 = v4;
  [(_UIBatteryView *)self _batterySizeForTraitCollection:v3];
  double v45 = v6;
  [(_UIBatteryView *)self _pinSizeForTraitCollection:v3];
  double v46 = v7;
  double v9 = v8;
  [(_UIBatteryView *)self _bodyRectForTraitCollection:v3];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIView *)self bounds];
  CGFloat v43 = v19;
  CGFloat v44 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  if ([(_UIBatteryView *)self rounded])
  {
    double v24 = v17 / 3.125;
  }
  else
  {
    BOOL showsPercentage = self->_showsPercentage;
    [(_UIBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
    double v24 = v26;
    if (!showsPercentage) {
      double v24 = v26 + v5 * -0.5;
    }
  }
  CGRect v27 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v24);
  BOOL v28 = [(_UIBatteryView *)self bodyShapeLayer];
  [v28 setLineWidth:v5];

  id v29 = v27;
  uint64_t v30 = [v29 CGPath];
  double v31 = [(_UIBatteryView *)self bodyShapeLayer];
  [v31 setPath:v30];

  v47.origin.y = v43;
  v47.origin.x = v44;
  v47.size.double width = v21;
  v47.size.double height = v23;
  -[CALayer setFrame:](self->_pinLayer, "setFrame:", v5 + v45, CGRectGetMidY(v47) + v9 * -0.5, v46, v9);
  double v32 = [(_UIBatteryView *)self percentFillShapeLayer];
  [v32 setLineWidth:v5];

  id v33 = v29;
  uint64_t v34 = [v33 CGPath];
  CATransform3D v35 = [(_UIBatteryView *)self percentFillShapeLayer];
  [v35 setPath:v34];

  objc_msgSend((id)objc_opt_class(), "_pinBezierPathForSize:isComplex:", self->_internalSizeCategory == 2, v46, v9);
  id v36 = objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 CGPath];
  v38 = [(_UIBatteryView *)self pinShapeLayer];
  [v38 setPath:v37];

  double v39 = v11;
  double v40 = v13;
  double v41 = v15;
  double v42 = v17;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (void)_updateBodyColors
{
  double v3 = [(UIView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35___UIBatteryView__updateBodyColors__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

- (void)_updateBatteryFillColor
{
  double v3 = [(UIView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41___UIBatteryView__updateBatteryFillColor__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

- (void)_updateFillLayer
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v3;
  double v7 = 0.0;
  [(_UIBatteryView *)self _fillLayerFrame:&v8 cornerRadius:&v7];
  [(CALayer *)self->_fillLayer setCornerRadius:v7];
  -[CALayer setFrame:](self->_fillLayer, "setFrame:", v8, v9);
  long long v4 = v8;
  long long v5 = v9;
  double v6 = [(CALayer *)self->_percentFillLayer mask];
  objc_msgSend(v6, "setFrame:", v4, v5);
}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  long long v3 = [(UIView *)self traitCollection];
  [(_UIBatteryView *)self _percentageFontSizeForTraitCollection:v3];
  double v5 = v4 / 11.5 * 0.7;

  return v5;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.125;
}

- (void)_notifyWillBeginAnimatingBoltToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBatteryView *)self internalSizeCategory]
    || [(_UIBatteryView *)self hasValidIconSize])
  {
    [(_UIBatteryView *)self _willBeginAnimatingBoltToVisible:v3];
  }
}

- (void)_notifyDidFinishAnimatingBoltToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBatteryView *)self internalSizeCategory]
    || [(_UIBatteryView *)self hasValidIconSize])
  {
    [(_UIBatteryView *)self _didFinishAnimatingBoltToVisible:v3];
  }
}

- (void)_updatePercentageFont
{
  BOOL v3 = [(UIView *)self traitCollection];
  [(_UIBatteryView *)self _percentageFontSizeForTraitCollection:v3];
  uint64_t v5 = v4;

  double v6 = [(UIView *)self traitCollection];
  BOOL v7 = [(_UIBatteryView *)self _percentageFontCondensedWhenChargingForTraitCollection:v6];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  double v14 = __39___UIBatteryView__updatePercentageFont__block_invoke;
  double v15 = &unk_1E52E9E28;
  BOOL v18 = v7;
  double v16 = self;
  uint64_t v17 = v5;
  if (self->_percentageLabel)
  {
    long long v8 = __39___UIBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    [(UILabel *)self->_percentageLabel setFont:v8];
  }
  else
  {
    long long v9 = [UILabel alloc];
    double v10 = -[UILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    percentageLabel = self->_percentageLabel;
    self->_percentageLabel = v10;

    double v12 = v14((uint64_t)v13);
    [(UILabel *)self->_percentageLabel setFont:v12];

    [(UIView *)self addSubview:self->_percentageLabel];
    [(_UIBatteryView *)self _updateFillColor];
  }
}

- (int64_t)sizeCategory
{
  return self->_internalSizeCategory == 2;
}

- (void)setLowBatteryMode:(int64_t)a3
{
  if (self->_lowBatteryMode != a3)
  {
    BOOL v5 = [(_UIBatteryView *)self isLowBattery];
    self->_int64_t lowBatteryMode = a3;
    if (v5 != [(_UIBatteryView *)self isLowBattery])
    {
      [(_UIBatteryView *)self _updateFillColor];
    }
  }
}

- (void)setBodyColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_bodyColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_bodyColor, a3);
    BOOL v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIBatteryView *)self _updateBodyColors];
      BOOL v5 = v6;
    }
  }
}

- (void)setBodyColorAlpha:(double)a3
{
  if (self->_bodyColorAlpha != a3)
  {
    self->_bodyColorAlphCATransform3D a = a3;
    if (!self->_bodyColor && !self->_showsPercentage) {
      [(_UIBatteryView *)self _updateBodyColors];
    }
  }
}

- (void)setPinColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_pinColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_pinColor, a3);
    BOOL v5 = v6;
    if (!self->_showsPercentage)
    {
      [(_UIBatteryView *)self _updateBodyColors];
      BOOL v5 = v6;
    }
  }
}

- (void)setPinColorAlpha:(double)a3
{
  if (self->_pinColorAlpha != a3)
  {
    self->_pinColorAlphCATransform3D a = a3;
    if (!self->_pinColor && !self->_showsPercentage) {
      [(_UIBatteryView *)self _updateBodyColors];
    }
  }
}

- (void)setBoltColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_boltColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_boltColor, a3);
    [(_UIBatteryView *)self _updateBodyColors];
    BOOL v5 = v6;
  }
}

- (void)setInactiveColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    if (self->_showsPercentage) {
      [(_UIBatteryView *)self _updateFillColor];
    }
  }
}

- (UIColor)inactiveColor
{
  inactiveColor = self->_inactiveColor;
  if (inactiveColor)
  {
    BOOL v3 = inactiveColor;
  }
  else
  {
    BOOL v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    BOOL saverModeActive = self->_saverModeActive;
    if (v6 == 2)
    {
      if (!self->_saverModeActive
        && ([(_UIBatteryView *)self isLowBattery]
         || [(_UIBatteryView *)self chargingState]))
      {
        long long v8 = +[UIColor systemWhiteColor];
        long long v9 = v8;
        double v10 = 0.3;
      }
      else
      {
        long long v8 = +[UIColor systemWhiteColor];
        long long v9 = v8;
        double v10 = 0.5;
      }
    }
    else
    {
      long long v8 = +[UIColor systemBlackColor];
      long long v9 = v8;
      if (saverModeActive) {
        double v10 = 0.2;
      }
      else {
        double v10 = 0.3;
      }
    }
    BOOL v3 = [v8 colorWithAlphaComponent:v10];
  }
  return v3;
}

- (void)setIconSize:(int64_t)a3
{
}

- (void)setRounded:(BOOL)a3
{
}

+ (id)_pinBezierPathForSize:(CGSize)a3 isComplex:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  BOOL v7 = +[UIBezierPath bezierPath];
  long long v8 = v7;
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
  BOOL v3 = +[UIBezierPath bezierPath];
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

- (id)accessibilityHUDRepresentation
{
  [(_UIBatteryView *)self chargePercent];
  double v4 = v3;
  BOOL v5 = [(_UIBatteryView *)self _batteryFillColor];
  uint64_t v6 = [(UIView *)self traitCollection];
  if ([v6 userInterfaceStyle] == 2) {
    +[UIColor whiteColor];
  }
  else {
  BOOL v7 = +[UIColor blackColor];
  }

  BOOL v8 = [(_UIBatteryView *)self _shouldShowBolt];
  BOOL v9 = [(UIView *)self _shouldReverseLayoutDirection];
  double v10 = [(UIView *)self _screen];
  [v10 scale];
  double v12 = v11;

  BOOL v13 = [(_UIBatteryView *)self showsPercentage];
  double v14 = [(UIView *)self traitCollection];
  double v15 = [v14 preferredContentSizeCategory];

  uint64_t v16 = [(_UIBatteryView *)self accessibilityHUDImageCacheInfo];
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
    [(_UIBatteryView *)self setAccessibilityHUDImageCacheInfo:v19];
  }
  double v20 = [UIAccessibilityHUDItem alloc];
  CGFloat v21 = [(_UIBatteryView *)self accessibilityHUDImageCacheInfo];
  double v22 = [v21 cachedImage];
  CGFloat v23 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v20, "initWithTitle:image:imageInsets:", 0, v22, 0.0, 0.0, 0.0, 0.0);

  [(UIAccessibilityHUDItem *)v23 setFlattenImage:0];
  return v23;
}

- (int64_t)lowBatteryMode
{
  return self->_lowBatteryMode;
}

- (BOOL)showsInlineChargingIndicator
{
  return self->_showsInlineChargingIndicator;
}

- (UILabel)percentageLabel
{
  return self->_percentageLabel;
}

- (void)setPercentageLabel:(id)a3
{
}

- (_UIBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo
{
  return self->_accessibilityHUDImageCacheInfo;
}

- (void)setAccessibilityHUDImageCacheInfo:(id)a3
{
}

- (CALayer)percentFillLayer
{
  return self->_percentFillLayer;
}

- (double)bodyColorAlpha
{
  return self->_bodyColorAlpha;
}

- (double)pinColorAlpha
{
  return self->_pinColorAlpha;
}

@end