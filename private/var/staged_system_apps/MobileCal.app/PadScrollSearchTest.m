@interface PadScrollSearchTest
- (id)scrollView;
- (void)navigateToScrollView;
@end

@implementation PadScrollSearchTest

- (id)scrollView
{
  return [(ListViewController *)self->_searchResultsController tableView];
}

- (void)navigateToScrollView
{
  id v7 = [(ApplicationTest *)self application];
  v3 = [v7 rootNavigationController];
  id v4 = [v3 resetToDayView];
  v5 = [v3 showSearchAnimated:0 becomeFirstResponder:0 completion:0];
  searchResultsController = self->_searchResultsController;
  self->_searchResultsController = v5;
}

- (void).cxx_destruct
{
}

@end