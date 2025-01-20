@interface PadMonthChangeMonthTest
- (void)_mainLoop;
- (void)_realTest;
- (void)dealloc;
- (void)runTest;
@end

@implementation PadMonthChangeMonthTest

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PadMonthChangeMonthTest;
  [(PadMonthChangeMonthTest *)&v4 dealloc];
}

- (void)runTest
{
  id v8 = [(ApplicationTest *)self extractInitialDateOption];
  v3 = [(ApplicationTest *)self model];
  [v3 setSelectedDate:v8];

  objc_super v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];

  self->_monthsToScroll = 10;
  v6 = [v5 resetToMonthView];
  monthViewController = self->_monthViewController;
  self->_monthViewController = v6;

  [(PadMonthChangeMonthTest *)self _realTest];
}

- (void)_realTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_mainLoop" name:@"MonthViewController_ScrollDidEndAnimationNotification" object:0];

  objc_super v4 = [(id)objc_opt_class() testName];
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009EAF0;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_mainLoop
{
  int64_t monthsToScroll = self->_monthsToScroll;
  if (monthsToScroll)
  {
    self->_int64_t monthsToScroll = monthsToScroll - 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009EC50;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v5 = [(id)objc_opt_class() testName];
    objc_super v4 = [(ApplicationTest *)self application];
    [v4 finishedTest:v5 waitForCommit:1 extraResults:0 withTeardownBlock:&stru_1001D3CF8];
  }
}

- (void).cxx_destruct
{
}

@end