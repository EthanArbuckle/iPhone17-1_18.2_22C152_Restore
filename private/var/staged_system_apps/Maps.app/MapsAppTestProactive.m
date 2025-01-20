@interface MapsAppTestProactive
- (BOOL)runTest;
- (void)_performScrollTest;
- (void)_setupTrayLayoutAndPerformScrollTest;
@end

@implementation MapsAppTestProactive

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 6000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007526CC;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestProactive *)self _setupTrayLayoutAndPerformScrollTest];
  }
  return 1;
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100752784;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(MapsAppTest *)self updateTrayLayout:2 animated:1 completion:v3];
  }
  else
  {
    [(MapsAppTestProactive *)self _performScrollTest];
  }
}

- (void)_performScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  unsigned int v4 = [v3 pptTestScrollViewForProactive];

  RPTContentSizeInDirection();
  double v6 = v5;
  RPTGetBoundsForView();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_alloc((Class)RPTScrollViewTestParameters);
  v16 = [(MapsAppTest *)self testName];
  id v17 = [v15 initWithTestName:v16 scrollBounds:1 scrollContentLength:&stru_1012F7690 scrollDirection:v8 completionHandler:v10];

  objc_initWeak(&location, self);
  v18 = [(MapsAppTest *)self testName];
  id v24 = v17;
  v19 = +[NSArray arrayWithObjects:&v24 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1007529D0;
  v21[3] = &unk_1012E6690;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  id v20 = +[RPTGroupScrollTestParameters newWithTestName:v18 parameters:v19 completionHandler:v21];

  +[RPTTestRunner runTestWithParameters:v20];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

@end