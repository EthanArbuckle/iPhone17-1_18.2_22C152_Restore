@interface PhoneRotateFromDayToWeekViewTest
- (id)checkTestPreconditions;
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PhoneRotateFromDayToWeekViewTest

- (void)_setupViewToDate:(id)a3
{
  id v9 = a3;
  v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];
  v6 = [v5 resetToMonthView];

  v7 = [v9 date];
  [v6 showDate:v7 animated:0];

  id v8 = [v6 pushedDayViewControllerWithDate:v9 animated:0];
}

- (id)rotationAnimationStartedNotificationName
{
  return @"RootNavigationController_TransitionStartedNotification";
}

- (id)rotationAnimationCompleteNotificationName
{
  return @"RootNavigationController_TransitionCompletedNotification";
}

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI()) {
    return @"Test cannot be run on plus sized phones";
  }
  else {
    return 0;
  }
}

@end