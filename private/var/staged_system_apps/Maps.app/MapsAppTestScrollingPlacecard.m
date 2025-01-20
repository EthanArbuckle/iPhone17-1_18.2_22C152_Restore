@interface MapsAppTestScrollingPlacecard
- (BOOL)runTest;
- (void)_scrollingTest;
- (void)placecardDidPresent;
@end

@implementation MapsAppTestScrollingPlacecard

- (BOOL)runTest
{
  [(MapsAppTestPlacecardChrome *)self setPlacecardChromeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)MapsAppTestScrollingPlacecard;
  return [(MapsAppTestPlacecardChrome *)&v4 runTest];
}

- (void)placecardDidPresent
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007BB868;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_scrollingTest
{
  dispatch_time_t v3 = [(MapsAppTest *)self testName];
  int BOOL = GEOConfigGetBOOL();
  v5 = [(MapsAppTestPlacecardChrome *)self placeViewController];
  v6 = [v5 view];
  objc_opt_class();
  v7 = sub_1007B8E1C(v6);

  if (BOOL)
  {
    RPTContentSizeInDirection();
    double v9 = v8;
    RPTGetBoundsForView();
    id v14 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v3 scrollBounds:1 scrollContentLength:&stru_1012F8C60 direction:v10 completionHandler:v11 v12 v13 v9];
    v15 = [v7 window];
    v16 = +[RPTCoordinateSpaceConverter converterFromWindow:v15];
    [v14 setConversion:v16];

    objc_initWeak(&location, self);
    id v23 = v14;
    v17 = +[NSArray arrayWithObjects:&v23 count:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1007BBBE4;
    v19[3] = &unk_1012E6690;
    objc_copyWeak(&v21, &location);
    id v20 = v3;
    id v18 = +[RPTGroupScrollTestParameters newWithTestName:v20 parameters:v17 completionHandler:v19];

    +[RPTTestRunner runTestWithParameters:v18];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [v7 _performScrollTest:v3 iterations:10 delta:20];
  }
}

@end