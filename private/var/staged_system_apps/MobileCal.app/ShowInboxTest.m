@interface ShowInboxTest
- (void)runTest;
@end

@implementation ShowInboxTest

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [v3 rootNavigationController];
  id v5 = [v4 resetToYearView];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050920;
  block[3] = &unk_1001D2EE0;
  block[4] = self;
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end