@interface _UISearchTextFieldVisualStyle_iOS
+ (double)defaultHeightForBarMetrics:(int64_t)a3;
- (double)defaultHeightForBarMetrics:(int64_t)a3;
@end

@implementation _UISearchTextFieldVisualStyle_iOS

- (double)defaultHeightForBarMetrics:(int64_t)a3
{
  int v4 = _UIBarsUseNewPadHeights();
  BOOL v5 = a3 == 1 || a3 == 102;
  double result = 36.0;
  double v7 = 30.0;
  if (!v5) {
    double v7 = 36.0;
  }
  if (!v4) {
    return v7;
  }
  return result;
}

+ (double)defaultHeightForBarMetrics:(int64_t)a3
{
  int v4 = _UIBarsUseNewPadHeights();
  BOOL v5 = a3 == 1 || a3 == 102;
  double result = 36.0;
  double v7 = 30.0;
  if (!v5) {
    double v7 = 36.0;
  }
  if (!v4) {
    return v7;
  }
  return result;
}

@end