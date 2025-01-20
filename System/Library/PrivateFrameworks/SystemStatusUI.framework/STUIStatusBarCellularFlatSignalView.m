@interface STUIStatusBarCellularFlatSignalView
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
@end

@implementation STUIStatusBarCellularFlatSignalView

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  v6 = +[STUIStatusBarSettingsDomain rootSettings];
  v7 = [v6 itemSettings];
  int v8 = [v7 secondarySIMUnderBaseline];

  if (v8)
  {
    [a1 _barWidthForIconSize:a4];
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a4 - 1) <= 0x10) {
      return dbl_1D7ED61B8[a4 - 1];
    }
  }
  return result;
}

@end