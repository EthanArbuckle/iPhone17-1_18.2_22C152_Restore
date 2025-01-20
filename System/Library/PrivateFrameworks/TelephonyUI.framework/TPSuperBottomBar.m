@interface TPSuperBottomBar
+ (double)defaultBottomMargin;
+ (double)defaultInterButtonSpacing;
+ (double)defaultSideMarginForDoubleButton;
+ (double)defaultSideMarginForSingleButton;
+ (double)defaultWidth;
@end

@implementation TPSuperBottomBar

+ (double)defaultSideMarginForSingleButton
{
  return 16.0;
}

+ (double)defaultSideMarginForDoubleButton
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  BOOL v9 = v8 <= 1024.0;
  double result = 31.0;
  if (!v9) {
    return 25.0;
  }
  return result;
}

+ (double)defaultInterButtonSpacing
{
  return 8.0;
}

+ (double)defaultWidth
{
  return 320.0;
}

+ (double)defaultBottomMargin
{
  return 61.0;
}

@end