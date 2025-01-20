@interface YearToMonthAnimationTest
- (id)notificationName;
- (void)kickOffAnimation;
- (void)setUp;
@end

@implementation YearToMonthAnimationTest

- (id)notificationName
{
  return @"YearMonthAnimator_YearToMonthAnimationCompleteNotification";
}

- (void)setUp
{
  v3 = [(ApplicationTest *)self application];
  id v6 = [v3 rootNavigationController];

  v4 = [v6 resetToYearView];
  yearViewController = self->_yearViewController;
  self->_yearViewController = v4;
}

- (void)kickOffAnimation
{
  yearViewController = self->_yearViewController;
  id v5 = [(ApplicationTest *)self model];
  v3 = [v5 selectedDate];
  id v4 = [(YearViewController *)yearViewController pushedMonthViewControllerWithDate:v3 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);

  objc_storeStrong((id *)&self->_yearViewController, 0);
}

@end