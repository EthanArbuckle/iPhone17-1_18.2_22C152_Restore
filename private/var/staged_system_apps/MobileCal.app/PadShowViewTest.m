@interface PadShowViewTest
- (int64_t)_viewType;
- (void)_viewShown:(id)a3;
- (void)runTest;
@end

@implementation PadShowViewTest

- (void)runTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_viewShown:" name:@"MainViewControllerDidAppearNotification" object:0];

  v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];
  v6 = [(ApplicationTest *)self extractInitialDateOption];
  v7 = [(ApplicationTest *)self application];
  v8 = [v7 rootNavigationController];
  v9 = [v8 resetToYearView];

  v10 = [v6 date];
  [v9 showDate:v10 animated:0];

  v11 = [v5 pushCalendarViewControllerWithViewType:[self _viewType] andDate:v6];
  v12 = [v11 currentChildViewController];
  [v12 selectDate:v6 animated:0];

  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F1ABC;
  v17[3] = &unk_1001D2E90;
  v17[4] = self;
  id v18 = v4;
  id v19 = v5;
  id v20 = v6;
  id v14 = v6;
  id v15 = v5;
  id v16 = v4;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v17);
}

- (int64_t)_viewType
{
  return -1;
}

- (void)_viewShown:(id)a3
{
  v4 = [(id)objc_opt_class() testName];
  v5 = [(ApplicationTest *)self application];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000F1DBC;
  v6[3] = &unk_1001D2740;
  v6[4] = self;
  [v5 finishedTest:v4 extraResults:0 withTeardownBlock:v6];
}

@end