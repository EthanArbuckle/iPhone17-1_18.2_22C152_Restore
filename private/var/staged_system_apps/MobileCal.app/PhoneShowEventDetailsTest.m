@interface PhoneShowEventDetailsTest
+ (id)_animationSubTestName;
+ (id)_delaySubTestName;
- (id)_eventForTest;
- (void)_detailViewControllerAppeared:(id)a3;
- (void)runTest;
@end

@implementation PhoneShowEventDetailsTest

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
  v6 = [(PhoneShowEventDetailsTest *)self _eventForTest];
  v7 = [(ApplicationTest *)self application];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 rootNavigationController];
    v10 = [v9 resetToDayView];

    [v10 reloadData];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100042E84;
    block[3] = &unk_1001D2EB8;
    block[4] = self;
    id v15 = v3;
    id v16 = v4;
    id v17 = v6;
    id v18 = v5;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [v7 startedTest:v3];

    v12 = [(ApplicationTest *)self application];
    v13 = +[NSString stringWithFormat:@"Failed to create event"];
    [v12 failedTest:v3 withFailure:v13];
  }
}

- (void)_detailViewControllerAppeared:(id)a3
{
  id v11 = [(id)objc_opt_class() testName];
  v4 = [(id)objc_opt_class() _animationSubTestName];
  v5 = [(ApplicationTest *)self application];
  [v5 finishedSubTest:v4 forTest:v11];

  v6 = [(ApplicationTest *)self application];
  [v6 finishedTest:v11 extraResults:0];

  v7 = [(ApplicationTest *)self model];
  v8 = [v7 eventStore];
  v9 = [(PhoneShowEventDetailsTest *)self _eventForTest];
  [v8 removeEvent:v9 span:0 error:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:EKEventViewControllerDidAppearNotification object:0];
}

- (id)_eventForTest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043238;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_100216570 != -1) {
    dispatch_once(&qword_100216570, block);
  }
  return (id)qword_100216568;
}

@end