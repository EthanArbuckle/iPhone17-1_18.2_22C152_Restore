@interface InboxNewSectionScrollTest
- (InboxNewSectionScrollTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5;
- (void)_inboxDidAppear:(id)a3;
- (void)dealloc;
- (void)runTest;
@end

@implementation InboxNewSectionScrollTest

- (InboxNewSectionScrollTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)InboxNewSectionScrollTest;
  v10 = [(ApplicationTest *)&v16 initWithApplication:v8 model:a4 options:v9];
  if (v10)
  {
    v11 = [TestScroller alloc];
    v12 = [(id)objc_opt_class() testName];
    v13 = [(TestScroller *)v11 initWithOptions:v9 testName:v12 application:v8];
    scroller = v10->_scroller;
    v10->_scroller = v13;
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"InboxNewSectionViewController_ViewDidAppearNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)InboxNewSectionScrollTest;
  [(InboxNewSectionScrollTest *)&v4 dealloc];
}

- (void)runTest
{
  id v8 = [(ApplicationTest *)self application];
  if ([(TestScroller *)self->_scroller inputInvalid])
  {
    v3 = [(id)objc_opt_class() testName];
    [v8 startedTest:v3];
    [v8 failedTest:v3 withFailure:@"input invalid was marked as true when trying to run test"];
  }
  else
  {
    v3 = [v8 rootNavigationController];
    id v4 = [v3 resetToYearView];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_inboxDidAppear:" name:@"InboxViewController_ViewDidAppearNotification" object:0];

    v6 = [v3 showInboxAnimated:1 completion:0];
    inboxViewController = self->_inboxViewController;
    self->_inboxViewController = v6;
  }
}

- (void)_inboxDidAppear:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"InboxViewController_ViewDidAppearNotification" object:0];

  v5 = [(InboxViewController *)self->_inboxViewController switcherViewController];
  v6 = [v5 showNewSection];
  v7 = [(id)objc_opt_class() testName];
  id v8 = [v6 tableView];
  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 4000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000D3D10;
    v11[3] = &unk_1001D28A8;
    v11[4] = self;
    id v12 = v8;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
  else
  {
    v10 = [(ApplicationTest *)self application];
    [v10 startedTest:v7];
    [v10 failedTest:v7 withFailure:@"Table view doesn't exist"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxViewController, 0);

  objc_storeStrong((id *)&self->_scroller, 0);
}

@end