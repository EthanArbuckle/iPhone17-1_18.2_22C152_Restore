@interface PadShowEventTest
- (MainViewController)controller;
- (id)_getEvent;
- (void)runTest;
- (void)setController:(id)a3;
@end

@implementation PadShowEventTest

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [(ApplicationTest *)self extractInitialDateOption];
  [(PadShowEventTest *)self _setupViewToDate:v4];
  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F7208;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (id)_getEvent
{
  return 0;
}

- (MainViewController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end