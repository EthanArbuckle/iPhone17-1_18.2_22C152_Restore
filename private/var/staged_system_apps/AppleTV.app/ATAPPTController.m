@interface ATAPPTController
+ (id)sharedInstance;
- (ATAPPTController)init;
- (BOOL)_canHandleTest:(id)a3;
- (NSDictionary)testsManifest;
- (OS_dispatch_queue)workQueue;
- (id)_init;
- (id)applicationLoadCompletion;
- (void)_registerTests;
- (void)_runTest:(id)a3 app:(id)a4;
- (void)_scrollHalfTheScreenHeightIn:(id)a3;
- (void)_waitForSearchShelfsToLoadInTabBarController:(id)a3;
- (void)runTest:(id)a3 app:(id)a4;
- (void)setApplicationLoadCompletion:(id)a3;
- (void)setTestsManifest:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)waitForApplicationToLoadNotification:(id)a3;
@end

@implementation ATAPPTController

+ (id)sharedInstance
{
  if (qword_10001E518 != -1) {
    dispatch_once(&qword_10001E518, &stru_1000187D8);
  }
  v2 = (void *)qword_10001E510;

  return v2;
}

- (ATAPPTController)init
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ATAPPTController;
  v2 = [(ATAPPTController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_appLoadedLock._os_unfair_lock_opaque = 0;
    [(ATAPPTController *)v2 _registerTests];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"waitForApplicationToLoadNotification:" name:_VUITVAppNavigationDidDisplayViewControllerNotification object:0];
  }
  return v3;
}

- (void)runTest:(id)a3 app:(id)a4
{
}

- (OS_dispatch_queue)workQueue
{
  workQueue = self->_workQueue;
  if (!workQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.tv.ppt", 0);
    v5 = self->_workQueue;
    self->_workQueue = v4;

    workQueue = self->_workQueue;
  }

  return workQueue;
}

- (void)_waitForSearchShelfsToLoadInTabBarController:(id)a3
{
  id v17 = a3;
  v3 = [v17 valueForKeyPath:@"tabBar.items.title"];
  id v4 = [v3 indexOfObject:VUITabBarItemIdentifierKeySearch];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    objc_super v6 = [v17 viewControllers];
    v7 = [v6 objectAtIndex:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    v9 = [v8 childViewControllers];
    v10 = [v9 firstObject];

    v11 = [v10 childViewControllers];
    v12 = [v11 firstObject];

    v13 = [v12 childViewControllers];
    v14 = [v13 firstObject];

    while (1)
    {
      v15 = [v14 childViewControllers];
      id v16 = [v15 count];

      if (v16) {
        break;
      }
      usleep(0xC350u);
    }
  }
}

- (void)_scrollHalfTheScreenHeightIn:(id)a3
{
  v3 = +[ATAPPTUtilities topMostController];
  id v4 = [v3 view];
  id v5 = +[ATAPPTUtilities findScrollViewInView:v4 desiredScrollViewClass:NSClassFromString(@"VideosUI.StackCollectionView")];

  [v5 contentOffset];
  double v7 = v6;
  double v9 = v8;
  v10 = [UIApp keyWindow];
  [v10 frame];
  double v12 = v9 + v11 * 0.5;

  if (+[NSThread isMainThread])
  {
    [v5 setContentOffset:0 animated:v7];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000070E4;
    block[3] = &unk_100018800;
    id v14 = v5;
    double v15 = v7;
    double v16 = v12;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  sleep(2u);
}

- (BOOL)_canHandleTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(ATAPPTController *)self testsManifest];
  double v6 = [v5 allKeys];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007208;
  v9[3] = &unk_100018828;
  id v7 = v4;
  id v10 = v7;
  double v11 = &v12;
  [v6 enumerateObjectsUsingBlock:v9];
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (void)_registerTests
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007B50;
  v10[3] = &unk_100018A70;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007C54;
  v9[3] = &unk_100018A70;
  void v9[4] = self;
  id v4 = objc_retainBlock(v9);
  v11[0] = @"ScrollPage";
  v11[1] = @"ScrollWhatToWatch";
  v12[0] = &stru_1000188C8;
  v12[1] = &stru_100018A08;
  v11[2] = @"ScrollSwoosh";
  id v5 = objc_retainBlock(v3);
  v12[2] = v5;
  v11[3] = @"ScrollBricks";
  double v6 = objc_retainBlock(v4);
  v12[3] = v6;
  v12[4] = &stru_1000188E8;
  v11[4] = @"ScrollUpNext";
  v11[5] = @"ScrollSportsPage";
  v12[5] = &stru_100018AB0;
  v12[6] = &stru_100018AD0;
  v11[6] = @"ScrollShowProductPage";
  v11[7] = @"ScrollLibrary";
  v12[7] = &stru_100018948;
  v12[8] = &stru_100018988;
  v11[8] = @"ScrollLibraryCategories";
  v11[9] = @"ScrollLibraryCategoryGrid";
  v12[9] = &stru_1000189C8;
  v12[10] = &stru_100018868;
  v11[10] = @"LaunchToWatchNow";
  v11[11] = @"LaunchToLibrary";
  v11[12] = @"LaunchToSearch";
  v12[11] = &stru_100018888;
  v12[12] = &stru_1000188A8;
  id v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:13];
  testsManifest = self->_testsManifest;
  self->_testsManifest = v7;
}

- (void)waitForApplicationToLoadNotification:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:_VUITVAppNavigationDidDisplayViewControllerNotification object:0];

  os_unfair_lock_lock(&self->_appLoadedLock);
  self->_appLoaded = 1;
  os_unfair_lock_unlock(&self->_appLoadedLock);
  id v5 = [(ATAPPTController *)self applicationLoadCompletion];
  if (v5)
  {
    [(ATAPPTController *)self setApplicationLoadCompletion:0];
    v5[2]();
  }
}

- (void)_runTest:(id)a3 app:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ATAPPTController *)self _canHandleTest:v6])
  {
    objc_initWeak(&location, self);
    double v8 = [(ATAPPTController *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000808C;
    block[3] = &unk_100018BC0;
    id v10 = v6;
    id v11 = v7;
    uint64_t v12 = self;
    objc_copyWeak(&v13, &location);
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)setWorkQueue:(id)a3
{
}

- (NSDictionary)testsManifest
{
  return self->_testsManifest;
}

- (void)setTestsManifest:(id)a3
{
}

- (id)applicationLoadCompletion
{
  return self->_applicationLoadCompletion;
}

- (void)setApplicationLoadCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_applicationLoadCompletion, 0);
  objc_storeStrong((id *)&self->_testsManifest, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end