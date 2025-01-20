@interface PadWeekViewScrollTest
- (WeekViewController)controller;
- (id)scrollView;
- (void)navigateToScrollView;
@end

@implementation PadWeekViewScrollTest

- (void)navigateToScrollView
{
  id v8 = [(ApplicationTest *)self extractInitialDateOption];
  v3 = [(ApplicationTest *)self model];
  [v3 setSelectedDate:v8];

  v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];
  v6 = [v5 resetToWeekView];
  controller = self->_controller;
  self->_controller = v6;

  [(WeekViewController *)self->_controller setDisplayedDate:v8 animated:0];
}

- (id)scrollView
{
  return [(WeekViewController *)self->_controller weekScroller];
}

- (WeekViewController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
}

@end