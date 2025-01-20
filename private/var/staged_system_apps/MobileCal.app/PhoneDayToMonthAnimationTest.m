@interface PhoneDayToMonthAnimationTest
- (id)notificationName;
- (void)kickOffAnimation;
- (void)setUp;
@end

@implementation PhoneDayToMonthAnimationTest

- (id)notificationName
{
  return @"PhoneMonthDayAnimator_DayToMonthAnimationCompleteNotification";
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
  id v14 = [v7 rootNavigationController];

  v8 = [v14 resetToMonthView];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;

  v10 = self->_monthViewController;
  v11 = [(ApplicationTest *)self model];
  v12 = [v11 selectedDate];
  id v13 = [(MonthViewController *)v10 pushedDayViewControllerWithDate:v12 animated:0];
}

- (void)kickOffAnimation
{
  id v3 = [(MonthViewController *)self->_monthViewController navigationController];
  id v2 = [v3 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);

  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end