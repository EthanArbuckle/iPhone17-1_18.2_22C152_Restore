@interface MapsAppTestScrollingRouteDetails
- (BOOL)runTest;
- (void)_performScrollTest;
- (void)directionsPlanDidSetup;
@end

@implementation MapsAppTestScrollingRouteDetails

- (BOOL)runTest
{
  [(MapsAppTestRouteChrome *)self setChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestScrollingRouteDetails;
  return [(MapsAppTestRouteChrome *)&v4 runTest];
}

- (void)directionsPlanDidSetup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10037A974;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  [(MapsAppTest *)self _presentDirectionDetailsWithCompletion:v2];
}

- (void)_performScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  objc_super v4 = [v3 pptTestScrollViewForDirectionsDetails];

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [(MapsAppTest *)self testName];
    RPTGetBoundsForView();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_alloc((Class)RPTScrollViewTestParameters);
    [v4 contentSize];
    id v16 = [v14 initWithTestName:v5 scrollBounds:1 scrollContentLength:&stru_1012E6750 direction:v7 completionHandler:v9, v11, v13, v15];
    id v24 = v16;
    v17 = +[NSArray arrayWithObjects:&v24 count:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10037ABC0;
    v20[3] = &unk_1012E6690;
    objc_copyWeak(&v22, &location);
    id v18 = v5;
    id v21 = v18;
    id v19 = +[RPTGroupScrollTestParameters newWithTestName:v18 parameters:v17 completionHandler:v20];

    +[RPTTestRunner runTestWithParameters:v19];
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

@end