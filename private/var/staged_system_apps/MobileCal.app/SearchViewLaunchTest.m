@interface SearchViewLaunchTest
- (SearchViewLaunchTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5;
- (void)_searchViewDidAppear;
- (void)dealloc;
- (void)runTest;
@end

@implementation SearchViewLaunchTest

- (SearchViewLaunchTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SearchViewLaunchTest;
  v9 = [(ApplicationTest *)&v17 initWithApplication:a3 model:a4 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:@"iterations"];
    v11 = v10;
    if (v10) {
      v9->_iterations = (unint64_t)[v10 integerValue];
    }
    else {
      v9->_inputInvalid = 1;
    }
    v12 = [(ApplicationTest *)v9 application];
    v13 = [v12 rootNavigationController];

    id v14 = [(RootNavigationController *)v13 resetToDayView];
    rootNavController = v9->_rootNavController;
    v9->_rootNavController = v13;
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SearchViewLaunchTest;
  [(SearchViewLaunchTest *)&v4 dealloc];
}

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  objc_super v4 = [(id)objc_opt_class() testName];
  if (self->_inputInvalid)
  {
    [v3 startedTest:v4];
    [v3 failedTest:v4 withFailure:@"input invalid was marked as true when trying to run test"];
  }
  else
  {
    v5 = [(ApplicationTest *)self application];
    v6 = [v5 rootNavigationController];

    id v7 = [v6 resetToYearView];
    id v8 = [(ApplicationTest *)self model];
    [v8 setShowDayAsList:0];

    rootNavController = self->_rootNavController;
    v10 = [(ApplicationTest *)self model];
    v11 = [v10 selectedDate];
    id v12 = [(RootNavigationController *)rootNavController pushCalendarViewControllerWithViewType:3 andDate:v11];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011F028;
    v18[3] = &unk_1001D28A8;
    v18[4] = self;
    id v19 = v4;
    v13 = objc_retainBlock(v18);
    dispatch_time_t v14 = dispatch_time(0, 3000000000);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011F0D0;
    v16[3] = &unk_1001D2F88;
    v16[4] = self;
    id v17 = v13;
    v15 = v13;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v16);
  }
}

- (void)_searchViewDidAppear
{
  v3 = [(ApplicationTest *)self application];
  objc_super v4 = [(id)objc_opt_class() testName];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011F21C;
  v5[3] = &unk_1001D2740;
  v5[4] = self;
  [v3 finishedTest:v4 waitForCommit:1 extraResults:0 withTeardownBlock:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViewController, 0);

  objc_storeStrong((id *)&self->_rootNavController, 0);
}

@end