@interface RotationTest
- (RotationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5;
- (id)_subTestNameForTargetInterfaceOrientation:(int64_t)a3;
- (id)checkTestPreconditions;
- (id)delaySubTestName;
- (id)rotationAnimationCompleteNotificationName;
- (id)rotationAnimationStartedNotificationName;
- (void)_finishTest;
- (void)_rotationAnimationCompleted:(id)a3;
- (void)_rotationAnimationStarted:(id)a3;
- (void)_rotationTest;
- (void)_setupViewToDate:(id)a3;
- (void)_startTest;
- (void)runTest;
@end

@implementation RotationTest

- (id)_subTestNameForTargetInterfaceOrientation:(int64_t)a3
{
  if (a3 == 1) {
    return @"RotateToPortrait";
  }
  else {
    return @"RotateToLandscape";
  }
}

- (id)delaySubTestName
{
  return @"Delay";
}

- (RotationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RotationTest;
  v9 = [(ApplicationTest *)&v15 initWithApplication:a3 model:a4 options:v8];
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
    v12 = [(RotationTest *)v9 rotationAnimationStartedNotificationName];
    if (v12)
    {
      v13 = [(RotationTest *)v9 rotationAnimationCompleteNotificationName];
      v9->_useNotifications = v13 != 0;
    }
    else
    {
      v9->_useNotifications = 0;
    }
  }
  return v9;
}

- (id)rotationAnimationStartedNotificationName
{
  return 0;
}

- (id)rotationAnimationCompleteNotificationName
{
  return 0;
}

- (id)checkTestPreconditions
{
  return 0;
}

- (void)runTest
{
  v3 = [(ApplicationTest *)self application];
  v4 = [(RotationTest *)self checkTestPreconditions];
  v5 = [(id)objc_opt_class() testName];
  if (self->_inputInvalid)
  {
    [v3 startedTest:v5];
    [v3 failedTest:v5 withFailure:@"input invalid was marked as true when trying to run test"];
  }
  else if (v4)
  {
    v6 = +[NSString stringWithFormat:@"Test precondition not met: %@", v4];
    [v3 startedTest:v5];
    [v3 failedTest:v5 withFailure:v6];
  }
  else
  {
    uint64_t v7 = [(ApplicationTest *)self extractInitialDateOption];
    id v8 = [(ApplicationTest *)self model];
    objc_super v15 = (void *)v7;
    [v8 setSelectedDate:v7];

    v9 = [(ApplicationTest *)self application];
    v10 = [v9 rootNavigationController];
    v11 = [v10 view];
    v12 = [v11 window];
    v13 = [v12 windowScene];
    v14 = (char *)[v13 interfaceOrientation];

    if ((unint64_t)(v14 - 1) > 1)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10005C4EC;
      v16[3] = &unk_1001D27D8;
      v16[4] = self;
      [UIApp rotateIfNeeded:1 completion:v16];
    }
    else
    {
      [(RotationTest *)self _startTest];
    }
  }
}

- (void)_startTest
{
  v3 = [(id)objc_opt_class() testName];
  v4 = [(ApplicationTest *)self extractInitialDateOption];
  [(RotationTest *)self _setupViewToDate:v4];
  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C5D8;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_finishTest
{
  id v5 = [(id)objc_opt_class() testName];
  v3 = [(ApplicationTest *)self application];
  [v3 finishedTest:v5 waitForCommit:1 extraResults:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)_rotationTest
{
  if (self->_iterations)
  {
    v3 = [(ApplicationTest *)self application];
    v4 = [v3 rootNavigationController];
    id v5 = [v4 view];
    id v6 = [v5 window];
    uint64_t v7 = [v6 windowScene];
    id v8 = (char *)[v7 interfaceOrientation];

    if ((unint64_t)(v8 - 3) < 2) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 4;
    }
    --self->_iterations;
    self->_currentTargetOrientation = v9;
    v10 = [(id)objc_opt_class() testName];
    if (self->_useNotifications)
    {
      v11 = [(ApplicationTest *)self application];
      v12 = [(RotationTest *)self delaySubTestName];
      [v11 startedSubTest:v12 forTest:v10];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005C93C;
    v13[3] = &unk_1001D27D8;
    v13[4] = self;
    [UIApp rotateIfNeeded:v9 completion:v13];
  }
  else
  {
    [(RotationTest *)self _finishTest];
  }
}

- (void)_rotationAnimationStarted:(id)a3
{
  id v8 = [(id)objc_opt_class() testName];
  v4 = [(RotationTest *)self _subTestNameForTargetInterfaceOrientation:self->_currentTargetOrientation];
  id v5 = [(ApplicationTest *)self application];
  id v6 = [(RotationTest *)self delaySubTestName];
  [v5 finishedSubTest:v6 forTest:v8 waitForCommit:0];

  uint64_t v7 = [(ApplicationTest *)self application];
  [v7 startedSubTest:v4 forTest:v8];
}

- (void)_rotationAnimationCompleted:(id)a3
{
  v4 = [(id)objc_opt_class() testName];
  id v5 = [(RotationTest *)self _subTestNameForTargetInterfaceOrientation:self->_currentTargetOrientation];
  id v6 = [(ApplicationTest *)self application];
  [v6 finishedSubTest:v5 forTest:v4 waitForCommit:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CB80;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  id v5 = [(ApplicationTest *)self application];
  id v6 = [v5 rootNavigationController];
  id v8 = [v6 resetToYearView];

  uint64_t v7 = [v4 date];

  [v8 showDate:v7 animated:0];
}

@end