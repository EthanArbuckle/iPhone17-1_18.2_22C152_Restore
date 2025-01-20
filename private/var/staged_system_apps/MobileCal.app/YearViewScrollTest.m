@interface YearViewScrollTest
- (id)scrollView;
- (void)navigateToScrollView;
@end

@implementation YearViewScrollTest

- (void)navigateToScrollView
{
  id v6 = [(ApplicationTest *)self application];
  v3 = [v6 rootNavigationController];
  v4 = [v3 resetToYearView];
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