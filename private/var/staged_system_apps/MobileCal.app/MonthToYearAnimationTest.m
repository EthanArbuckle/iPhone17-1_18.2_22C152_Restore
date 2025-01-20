@interface MonthToYearAnimationTest
- (id)notificationName;
- (void)kickOffAnimation;
- (void)setUp;
@end

@implementation MonthToYearAnimationTest

- (id)notificationName
{
  return @"YearMonthAnimator_MonthToYearAnimationCompleteNotification";
}

- (void)setUp
{
  v3 = [(ApplicationTest *)self application];
  id v6 = [v3 rootNavigationController];

  v4 = [v6 resetToMonthView];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v4;
}

- (void)kickOffAnimation
{
  id v3 = [(MonthViewController *)self->_monthViewController navigationController];
  id v2 = [v3 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
}

@end