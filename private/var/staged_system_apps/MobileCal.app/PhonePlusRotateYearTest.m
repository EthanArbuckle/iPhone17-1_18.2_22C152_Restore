@interface PhonePlusRotateYearTest
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PhonePlusRotateYearTest

- (id)rotationAnimationStartedNotificationName
{
  return @"YearViewController_RotationAnimationStartedNotification";
}

- (id)rotationAnimationCompleteNotificationName
{
  return @"YearViewController_RotationAnimationCompletedNotification";
}

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self application];
  v6 = [v5 rootNavigationController];
  id v8 = [v6 resetToYearView];

  v7 = [v4 date];

  [v8 showDate:v7 animated:0];
}

@end