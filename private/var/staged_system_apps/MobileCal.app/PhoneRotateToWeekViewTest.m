@interface PhoneRotateToWeekViewTest
- (id)checkTestPreconditions;
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PhoneRotateToWeekViewTest

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self application];
  v6 = [v5 rootNavigationController];
  id v8 = [v6 resetToYearView];

  v7 = [v4 date];

  [v8 showDate:v7 animated:0];
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
    return @"Test cannot be run on plus-sized phones";
  }
  else {
    return 0;
  }
}

@end