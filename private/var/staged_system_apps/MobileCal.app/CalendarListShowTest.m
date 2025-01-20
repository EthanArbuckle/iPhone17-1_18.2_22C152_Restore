@interface CalendarListShowTest
- (void)runTest;
@end

@implementation CalendarListShowTest

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [v3 rootNavigationController];
  v5 = [v3 rootViewController];
  id v6 = [v4 resetToYearView];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004700C;
  v11[3] = &unk_1001D2E90;
  v11[4] = self;
  id v12 = v3;
  id v13 = v5;
  id v14 = v4;
  id v8 = v4;
  id v9 = v5;
  id v10 = v3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v11);
}

@end