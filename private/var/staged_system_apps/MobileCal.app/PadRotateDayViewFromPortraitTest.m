@interface PadRotateDayViewFromPortraitTest
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PadRotateDayViewFromPortraitTest

- (id)rotationAnimationStartedNotificationName
{
  return @"DayViewController_RotationAnimationStartedNotification";
}

- (id)rotationAnimationCompleteNotificationName
{
  return @"DayViewController_RotationAnimationCompletedNotification";
}

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self application];
  v6 = [v5 rootNavigationController];
  id v7 = [v6 resetToDayView];

  [v7 selectDate:v4 animated:0];
}

@end