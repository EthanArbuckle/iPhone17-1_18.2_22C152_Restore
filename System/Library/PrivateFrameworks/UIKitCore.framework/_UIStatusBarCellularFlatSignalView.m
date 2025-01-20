@interface _UIStatusBarCellularFlatSignalView
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
@end

@implementation _UIStatusBarCellularFlatSignalView

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  if (_UIGetSecondarySIMUnderBaseline())
  {
    [a1 _barWidthForIconSize:a4];
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a4 - 1) <= 0x10) {
      return dbl_186B9CBB8[a4 - 1];
    }
  }
  return result;
}

@end