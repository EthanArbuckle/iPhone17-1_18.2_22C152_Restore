@interface MonthViewScrollTest
- (id)scrollView;
- (void)navigateToScrollView;
@end

@implementation MonthViewScrollTest

- (void)navigateToScrollView
{
  id v6 = [(ApplicationTest *)self application];
  v3 = [v6 rootNavigationController];
  v4 = [v3 resetToMonthView];
  controller = self->_controller;
  self->_controller = v4;
}

- (id)scrollView
{
  return [(InfiniteScrollViewController *)self->_controller scrollView];
}

- (void).cxx_destruct
{
}

@end