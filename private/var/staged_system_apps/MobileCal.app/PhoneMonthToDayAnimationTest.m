@interface PhoneMonthToDayAnimationTest
- (id)notificationName;
- (void)kickOffAnimation;
- (void)setUp;
@end

@implementation PhoneMonthToDayAnimationTest

- (id)notificationName
{
  return @"PhoneMonthDayAnimator_MonthToDayAnimationCompleteNotification";
}

- (void)setUp
{
  v3 = [(ApplicationTest *)self extractInitialDateOption];
  initialDate = self->_initialDate;
  self->_initialDate = v3;

  v5 = self->_initialDate;
  v6 = [(ApplicationTest *)self model];
  [v6 setSelectedDate:v5];

  v7 = [(ApplicationTest *)self application];
  id v10 = [v7 rootNavigationController];

  v8 = [v10 resetToMonthView];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;
}

- (void)kickOffAnimation
{
  monthViewController = self->_monthViewController;
  id v5 = [(ApplicationTest *)self model];
  v3 = [v5 selectedDate];
  id v4 = [(MonthViewController *)monthViewController pushedDayViewControllerWithDate:v3 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);

  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end