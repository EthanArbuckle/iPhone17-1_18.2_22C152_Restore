@interface PadWeekChangeWeekTest
- (void)_mainLoop;
- (void)_realTest;
- (void)dealloc;
- (void)runTest;
@end

@implementation PadWeekChangeWeekTest

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PadWeekChangeWeekTest;
  [(PadWeekChangeWeekTest *)&v4 dealloc];
}

- (void)runTest
{
  id v8 = [(ApplicationTest *)self extractInitialDateOption];
  v3 = [(ApplicationTest *)self model];
  [v3 setSelectedDate:v8];

  objc_super v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];

  self->_weeksToScroll = 10;
  v6 = [v5 resetToWeekView];
  weekViewController = self->_weekViewController;
  self->_weekViewController = v6;

  [(PadWeekChangeWeekTest *)self _realTest];
}

- (void)_realTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_mainLoop" name:@"WeekViewController_ScrollDidEndAnimationNotification" object:0];

  objc_super v4 = [(id)objc_opt_class() testName];
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000769D4;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_mainLoop
{
  int64_t weeksToScroll = self->_weeksToScroll;
  if (weeksToScroll)
  {
    self->_int64_t weeksToScroll = weeksToScroll - 1;
    objc_super v4 = [(WeekViewController *)self->_weekViewController displayedDate];
    [v4 calendarDateByAddingDays:7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076B70;
    block[3] = &unk_1001D28A8;
    block[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v7 = [(id)objc_opt_class() testName];
    id v6 = [(ApplicationTest *)self application];
    [v6 finishedTest:v7 waitForCommit:0 extraResults:0 withTeardownBlock:&stru_1001D36A8];
  }
}

- (void).cxx_destruct
{
}

@end