@interface PadDayChangeDayTest
- (void)_mainLoop;
- (void)_realTest;
- (void)dealloc;
- (void)runTest;
@end

@implementation PadDayChangeDayTest

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PadDayChangeDayTest;
  [(PadDayChangeDayTest *)&v4 dealloc];
}

- (void)runTest
{
  id v8 = [(ApplicationTest *)self extractInitialDateOption];
  v3 = [(ApplicationTest *)self model];
  [v3 setSelectedDate:v8];

  objc_super v4 = [(ApplicationTest *)self application];
  v5 = [v4 rootNavigationController];

  self->_daysToScroll = 10;
  v6 = [v5 resetToDayView];
  dayViewController = self->_dayViewController;
  self->_dayViewController = v6;

  [(PadDayChangeDayTest *)self _realTest];
}

- (void)_realTest
{
  v3 = [(DayViewController *)self->_dayViewController day];
  objc_super v4 = [v3 calendarDateByAddingDays:1];
  [(DayViewController *)self->_dayViewController selectDate:v4 animated:0];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_mainLoop" name:@"NSString *const DayViewController_DayScrollDidEndAnimationNotification" object:0];

  v6 = [(id)objc_opt_class() testName];
  dispatch_time_t v7 = dispatch_time(0, 200000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007712C;
  v9[3] = &unk_1001D28A8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_mainLoop
{
  int64_t daysToScroll = self->_daysToScroll;
  if (daysToScroll)
  {
    self->_int64_t daysToScroll = daysToScroll - 1;
    objc_super v4 = [(DayViewController *)self->_dayViewController day];
    [v4 calendarDateByAddingDays:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000772C8;
    block[3] = &unk_1001D28A8;
    block[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v7 = [(id)objc_opt_class() testName];
    v6 = [(ApplicationTest *)self application];
    [v6 finishedTest:v7 waitForCommit:1 extraResults:0 withTeardownBlock:&stru_1001D36C8];
  }
}

- (void).cxx_destruct
{
}

@end