@interface PadDayViewScrollTest
- (DayViewController)controller;
- (id)scrollView;
- (void)navigateToScrollView;
- (void)setController:(id)a3;
@end

@implementation PadDayViewScrollTest

- (void)navigateToScrollView
{
  id v8 = [(ApplicationTest *)self extractInitialDateOption];
  v3 = [(ApplicationTest *)self model];
  [v3 setSelectedDate:v8];

  v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];
  v6 = [v5 resetToDayView];
  controller = self->_controller;
  self->_controller = v6;

  [(DayViewController *)self->_controller selectDate:v8 animated:0];
}

- (id)scrollView
{
  v2 = [(DayViewController *)self->_controller dayView];
  v3 = [v2 horizontalScrollView];

  return v3;
}

- (DayViewController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end