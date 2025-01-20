@interface STUIStatusBarStaticBatteryView
+ (CGSize)_batterySizeForIconSize:(int64_t)a3;
+ (CGSize)_pinSizeForIconSize:(int64_t)a3;
+ (double)_insideCornerRadiusForIconSize:(int64_t)a3;
+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3;
+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3;
- (BOOL)hasValidIconSize;
- (CGSize)_pinSizeForIconSize:(int64_t)a3;
- (double)_batteryBoltScaleFactorMultiplier;
- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3;
- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3;
- (double)_percentageBatteryBoltScaleFactorMultiplier;
- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3;
- (double)_percentageFontSizeForIconSize:(int64_t)a3;
- (void)applyStyleAttributes:(id)a3;
@end

@implementation STUIStatusBarStaticBatteryView

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED69E0[a3 - 1];
  }
  return result;
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  v3 = (double *)((char *)&unk_1D7ED6848 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11) {
    v4 = (double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else {
    v4 = (double *)((char *)&unk_1D7ED6C00 + 8 * a3 - 8);
  }
  if ((unint64_t)(a3 - 1) >= 0x11) {
    v3 = (double *)MEMORY[0x1E4F1DB30];
  }
  double v5 = *v3;
  double v6 = *v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)hasValidIconSize
{
  return [(_UIBatteryView *)self iconSize] != 0;
}

- (double)_batteryBoltScaleFactorMultiplier
{
  if ([(_UIBatteryView *)self internalSizeCategory]
    || ![(_UIBatteryView *)self iconSize])
  {
    v6.receiver = self;
    v6.super_class = (Class)STUIStatusBarStaticBatteryView;
    [(_UIBatteryView *)&v6 _batteryBoltScaleFactorMultiplier];
  }
  else
  {
    int64_t v4 = [(_UIBatteryView *)self iconSize];
    if ((unint64_t)(v4 - 1) >= 0x11) {
      double v5 = (double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else {
      double v5 = (double *)((char *)&unk_1D7ED6C00 + 8 * v4 - 8);
    }
    return *v5 / 11.5;
  }
  return result;
}

- (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  BOOL v4 = [(_UIBatteryView *)self rounded];
  double v5 = 4.5;
  double v6 = 1.25;
  switch(a3)
  {
    case 1:
    case 16:
      break;
    case 2:
    case 17:
      double v5 = 4.66666667;
      goto LABEL_7;
    case 3:
    case 4:
      double v5 = 4.0;
      goto LABEL_7;
    case 5:
      goto LABEL_17;
    case 6:
      double v5 = 5.0;
      goto LABEL_7;
    case 7:
LABEL_7:
      double v6 = 1.33333333;
      break;
    case 8:
      double v5 = 5.0;
      double v6 = 1.66666667;
      break;
    case 9:
    case 15:
      double v5 = 5.5;
      goto LABEL_11;
    case 10:
      double v5 = 5.0;
      goto LABEL_17;
    case 11:
      double v5 = 6.0;
LABEL_11:
      double v6 = 1.75;
      break;
    case 12:
      double v5 = 5.66666667;
      goto LABEL_14;
    case 13:
      double v5 = 6.0;
LABEL_14:
      double v6 = 1.83333333;
      break;
    case 14:
      double v5 = 4.0;
      if (!v4) {
        double v5 = 4.5;
      }
LABEL_17:
      double v6 = 1.5;
      break;
    default:
      double v6 = *MEMORY[0x1E4F1DB30];
      double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)_insideCornerRadiusForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED6AF0[a3 - 1];
  }
  return result;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isRounded];
  uint64_t v6 = [v4 iconSize];

  [(_UIBatteryView *)self setRounded:v5 iconSize:v6];
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  v3 = (double *)((char *)&unk_1D7ED68D0 + 8 * a3 - 8);
  if ((unint64_t)(a3 - 1) >= 0x11) {
    id v4 = (double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else {
    id v4 = (double *)((char *)&unk_1D7ED6958 + 8 * a3 - 8);
  }
  if ((unint64_t)(a3 - 1) >= 0x11) {
    v3 = (double *)MEMORY[0x1E4F1DB30];
  }
  double v5 = *v3;
  double v6 = *v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED6A68[a3 - 1];
  }
  return result;
}

- (double)_percentageFontSizeForIconSize:(int64_t)a3
{
  BOOL v4 = [(_UIBatteryView *)self rounded];
  double result = 9.0;
  switch(a3)
  {
    case 1:
    case 14:
    case 16:
    case 17:
      return result;
    case 2:
    case 4:
      double result = 11.3333333;
      break;
    case 3:
      double result = 10.3333333;
      break;
    case 5:
    case 6:
    case 9:
      double result = 12.0;
      break;
    case 7:
      double result = 12.6666667;
      if (v4) {
        double result = 11.6666667;
      }
      break;
    case 8:
      double result = 13.6666667;
      break;
    case 10:
    case 11:
    case 12:
    case 13:
      double result = 13.0;
      break;
    case 15:
      double result = 10.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3
{
  BOOL v4 = [(_UIBatteryView *)self rounded];
  if (a3 == 8) {
    return 0.0;
  }
  double result = 1.0;
  if (a3 == 7) {
    return (double)!v4;
  }
  return result;
}

- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED6B78[a3 - 1];
  }
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3
{
  [(STUIStatusBarStaticBatteryView *)self _currentScreenScale];
  double v5 = v4;
  double result = 0.0;
  if (a3 != 3) {
    return -1.0 / v5 + 0.0;
  }
  return result;
}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  if ([(_UIBatteryView *)self internalSizeCategory]
    || ![(_UIBatteryView *)self iconSize])
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarStaticBatteryView;
    [(_UIBatteryView *)&v7 _percentageBatteryBoltScaleFactorMultiplier];
  }
  else
  {
    int64_t v4 = [(_UIBatteryView *)self iconSize];
    BOOL v5 = [(_UIBatteryView *)self rounded];
    double v6 = 9.0;
    switch(v4)
    {
      case 1:
      case 14:
      case 16:
      case 17:
        return v6 / 11.5 * 0.7;
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
        double v6 = 12.6666667;
        if (v5) {
          double v6 = 11.6666667;
        }
        break;
      case 8:
        double v6 = 13.6666667;
        break;
      case 10:
      case 11:
      case 12:
      case 13:
        double v6 = 13.0;
        break;
      case 15:
        double v6 = 10.0;
        break;
      default:
        double v6 = 0.0;
        break;
    }
    return v6 / 11.5 * 0.7;
  }
  return result;
}

@end