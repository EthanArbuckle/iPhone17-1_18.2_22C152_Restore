@interface UIStatusBarLockScreenForegroundStyleAttributes
- (BOOL)supportsShowingBuildVersion;
- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3;
- (UIEdgeInsets)edgeInsetsForBatteryInsides;
- (double)sizeForMoonMaskVisible:(BOOL)a3;
- (double)textOffsetForStyle:(int64_t)a3;
- (id)expandedNameForImageName:(id)a3;
- (id)makeTextFontForStyle:(int64_t)a3;
- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3;
@end

@implementation UIStatusBarLockScreenForegroundStyleAttributes

- (id)expandedNameForImageName:(id)a3
{
  return (id)[@"LockScreen_" stringByAppendingString:a3];
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3) {
    return 12;
  }
  else {
    return 11;
  }
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v2 <= 2.5) {
    double v3 = 4.5;
  }
  else {
    double v3 = 4.66666667;
  }
  double v4 = 2.0;
  double v5 = 2.0;
  double v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:", a3, 14.0);
}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 1.5;
}

- (double)sizeForMoonMaskVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v5 <= 2.5)
  {
    [(UIStatusBarForegroundStyleAttributes *)self scale];
    double v8 = 15.0;
    if (v3) {
      double v8 = 10.0;
    }
    double v9 = 13.5;
    if (v3) {
      double v9 = 9.5;
    }
    if (v7 > 1.5) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    double result = 13.3333333;
    if (v3) {
      return 9.66666667;
    }
  }
  return result;
}

- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIStatusBarForegroundStyleAttributes *)self scale];
  if (v8 <= 2.5)
  {
    [(UIStatusBarForegroundStyleAttributes *)self scale];
    if (v11 <= 1.5) {
      double v10 = 1.0;
    }
    else {
      double v10 = 1.5;
    }
    if (v11 <= 1.5) {
      double v9 = 4.0;
    }
    else {
      double v9 = 5.0;
    }
  }
  else
  {
    double v9 = 5.66666667;
    double v10 = 1.33333333;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v12 = v10 + CGRectGetMaxX(v15);
  double v13 = v9;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (BOOL)supportsShowingBuildVersion
{
  return 0;
}

@end