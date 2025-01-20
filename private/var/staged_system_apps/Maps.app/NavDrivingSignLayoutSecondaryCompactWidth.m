@interface NavDrivingSignLayoutSecondaryCompactWidth
+ (id)sharedDrivingSecondaryCompactWidthSignLayout;
- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3;
- (BOOL)forceHideShieldViewForSign:(id)a3;
- (double)minimumHeightForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
@end

@implementation NavDrivingSignLayoutSecondaryCompactWidth

+ (id)sharedDrivingSecondaryCompactWidthSignLayout
{
  if (qword_101610E48 != -1) {
    dispatch_once(&qword_101610E48, &stru_101320A98);
  }
  v2 = (void *)qword_101610E40;

  return v2;
}

- (double)minimumHeightForSign:(id)a3
{
  return 48.0;
}

- (double)textTopMarginForSign:(id)a3
{
  return 31.0;
}

- (double)textBottomMarginForSign:(id)a3
{
  return 17.0;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 1;
}

- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3
{
  return 1;
}

@end