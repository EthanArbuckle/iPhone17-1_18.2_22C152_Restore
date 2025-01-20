@interface PhonePlusWeekViewHorizontalScrollTest
- (WeekViewController)controller;
- (id)checkTestPreconditions;
- (id)scrollView;
- (void)_setupWeekView;
- (void)navigateToScrollView;
@end

@implementation PhonePlusWeekViewHorizontalScrollTest

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI()) {
    return 0;
  }
  else {
    return @"Test cannot be run on non plus-format phones";
  }
}

- (void)navigateToScrollView
{
  v3 = [(ApplicationTest *)self application];
  v4 = [v3 rootNavigationController];
  v5 = [v4 view];
  v6 = [v5 window];
  v7 = [v6 windowScene];
  v8 = (char *)[v7 interfaceOrientation];

  if ((unint64_t)(v8 - 3) > 1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100051238;
    v9[3] = &unk_1001D27D8;
    v9[4] = self;
    [UIApp rotateIfNeeded:4 completion:v9];
  }
  else
  {
    [(PhonePlusWeekViewHorizontalScrollTest *)self _setupWeekView];
  }
}

- (void)_setupWeekView
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