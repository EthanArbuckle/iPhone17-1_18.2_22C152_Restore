@interface STUIStatusBarCellularSmallSignalView
+ (double)_barCornerRadiusForIconSize:(int64_t)a3;
+ (double)_barWidthForIconSize:(int64_t)a3;
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
@end

@implementation STUIStatusBarCellularSmallSignalView

+ (double)_barWidthForIconSize:(int64_t)a3
{
  v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  int v7 = [v6 secondarySIMUnderBaseline];

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__barWidthForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_1D7ED6020[a3 - 1];
    }
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  int v7 = [v6 secondarySIMUnderBaseline];

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__interspaceForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_1D7ED6130[a3 - 1];
    }
  }
  return result;
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  int v7 = [v6 secondarySIMUnderBaseline];

  if (v7)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v9, sel__barCornerRadiusForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_1D7ED60A8[a3 - 1];
    }
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v7 = +[STUIStatusBarSettingsDomain rootSettings];
  v8 = [v7 itemSettings];
  int v9 = [v8 secondarySIMUnderBaseline];

  if (v9)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v13, sel__heightForNormalBarAtIndex_iconSize_, a3, a4);
  }
  else
  {
    double result = 0.0;
    switch(a4)
    {
      case 1:
        long long v14 = xmmword_1D7ED5E60;
        long long v15 = xmmword_1D7ED5E10;
        uint64_t v12 = 0x4032000000000000;
        goto LABEL_11;
      case 2:
      case 3:
        long long v14 = xmmword_1D7ED5E50;
        long long v15 = xmmword_1D7ED5DC0;
        uint64_t v11 = 0x4039000000000000;
        goto LABEL_13;
      case 4:
      case 6:
        long long v14 = xmmword_1D7ED5E30;
        long long v15 = xmmword_1D7ED5E40;
        uint64_t v11 = 0x403B000000000000;
        goto LABEL_13;
      case 5:
        long long v14 = xmmword_1D7ED5E60;
        long long v15 = xmmword_1D7ED5E70;
        uint64_t v12 = 0x4034000000000000;
        goto LABEL_11;
      case 7:
        long long v14 = xmmword_1D7ED5E10;
        long long v15 = xmmword_1D7ED5E20;
        uint64_t v11 = 0x403E000000000000;
        goto LABEL_13;
      case 8:
        long long v14 = xmmword_1D7ED5E00;
        long long v15 = xmmword_1D7ED5C00;
        uint64_t v11 = 0x4040000000000000;
        goto LABEL_13;
      case 16:
        long long v14 = xmmword_1D7ED5DF0;
        long long v15 = xmmword_1D7ED5C10;
        uint64_t v12 = 0x402C000000000000;
LABEL_11:
        uint64_t v16 = v12;
        double result = *((double *)&v14 + a3) * 0.5;
        break;
      case 17:
        long long v14 = xmmword_1D7ED5DD0;
        long long v15 = xmmword_1D7ED5DE0;
        uint64_t v11 = 0x4035000000000000;
LABEL_13:
        uint64_t v16 = v11;
        double result = *((double *)&v14 + a3) / 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

@end