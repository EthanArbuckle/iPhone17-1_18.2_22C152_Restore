@interface PadRotateWeekViewFromPortraitTest
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PadRotateWeekViewFromPortraitTest

- (id)rotationAnimationStartedNotificationName
{
  return @"LargeWeekViewController_RotationAnimationStartedNotification";
}

- (id)rotationAnimationCompleteNotificationName
{
  return @"LargeWeekViewController_RotationAnimationCompletedNotification";
}

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self application];
  v6 = [v5 rootNavigationController];
  id v7 = [v6 resetToWeekView];

  [v7 setDisplayedDate:v4 animated:0];
}

@end