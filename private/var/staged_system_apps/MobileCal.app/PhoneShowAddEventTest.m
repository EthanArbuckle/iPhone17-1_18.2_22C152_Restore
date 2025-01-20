@interface PhoneShowAddEventTest
+ (id)_animationSubTestName;
+ (id)_delaySubTestName;
- (void)_viewControllerAppeared:(id)a3;
- (void)runTest;
@end

@implementation PhoneShowAddEventTest

+ (id)_delaySubTestName
{
  return @"Delay";
}

+ (id)_animationSubTestName
{
  return @"Animation";
}

- (void)runTest
{
  v3 = [(id)objc_opt_class() testName];
  v4 = [(id)objc_opt_class() _delaySubTestName];
  v5 = [(id)objc_opt_class() _animationSubTestName];
  v6 = [(ApplicationTest *)self application];
  v7 = [v6 rootNavigationController];
  id v8 = [v7 resetToDayView];

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100091704;
  v13[3] = &unk_1001D2E90;
  v13[4] = self;
  id v14 = v3;
  id v15 = v4;
  id v16 = v5;
  id v10 = v5;
  id v11 = v4;
  id v12 = v3;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)_viewControllerAppeared:(id)a3
{
  id v11 = [(id)objc_opt_class() testName];
  v4 = [(id)objc_opt_class() _animationSubTestName];
  v5 = [(ApplicationTest *)self application];
  [v5 finishedSubTest:v4 forTest:v11];

  v6 = [(ApplicationTest *)self application];
  [v6 finishedTest:v11 extraResults:0];

  v7 = [(ApplicationTest *)self application];
  id v8 = [v7 rootNavigationController];
  id v9 = [v8 popToRootViewControllerAnimated:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:EKEventViewControllerDidAppearNotification object:0];
}

@end