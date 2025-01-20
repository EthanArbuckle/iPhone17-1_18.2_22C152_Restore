@interface CompassAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (void)_finishedRotationTest;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CompassAppDelegate

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = [(CompassAppDelegate *)self window];
  v6 = [v5 rootViewController];
  compassController = self->_compassController;
  self->_compassController = v6;

  return 1;
}

- (void)setWindow:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (void)applicationWillResignActive:(id)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_testName, a4);
  if ([v9 containsString:@"Rotate"])
  {
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_finishedRotationTest" name:@"CompassFinishedRotationTestNotification" object:0];

    v12 = objc_alloc_init(CompassTestOptions);
    if ([v9 isEqualToString:@"RotateWithBearing"]) {
      [(CompassTestOptions *)v12 setShouldSetBearing:1];
    }
    [(CompassController *)self->_compassController configureForTestingWithOptions:v12];
    dispatch_time_t v13 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007648;
    block[3] = &unk_100010458;
    id v17 = v9;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);

    unsigned __int8 v14 = 1;
  }
  else
  {
    unsigned __int8 v14 = [v8 runTest:v9 options:v10];
  }

  return v14;
}

- (void)_finishedRotationTest
{
  [UIApp finishedTest:self->_testName];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  compassController = self->_compassController;

  [(CompassController *)compassController testCleanup];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);

  objc_storeStrong((id *)&self->_compassController, 0);
}

@end