@interface MapsAppTestRouteChrome
- (BOOL)runTest;
- (MapsAppTestRouteChromeDelegate)chromeDelegate;
- (void)_setupDirectionsPlan:(id)a3;
- (void)cleanup:(BOOL)a3;
- (void)setChromeDelegate:(id)a3;
@end

@implementation MapsAppTestRouteChrome

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MapsAppTest *)self popToRootTrayWithCompletion:0];
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestRouteChrome;
  [(MapsAppTest *)&v5 cleanup:v3];
}

- (BOOL)runTest
{
  BOOL v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  [(MapsAppTest *)self setupForVKTest];
  v4 = [(MapsAppTest *)self options];
  objc_super v5 = [v4 _mapstest_directionsPlan];

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10037A488;
  v8[3] = &unk_1012E6690;
  objc_copyWeak(&v10, &location);
  id v6 = v5;
  id v9 = v6;
  [(MapsAppTest *)self addFullyDrawnCallback:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_setupDirectionsPlan:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10037A5F0;
  id v9 = &unk_1012E6730;
  objc_copyWeak(&v10, &location);
  +[PPTNotificationCenter addOnceObserverForName:@"MapsRoutePlanningShowingRoutesNotification" object:0 usingBlock:&v6];
  objc_super v5 = [(MapsAppTest *)self testCoordinator];
  [v5 setPPTTestDirectionsPlan:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (MapsAppTestRouteChromeDelegate)chromeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeDelegate);

  return (MapsAppTestRouteChromeDelegate *)WeakRetained;
}

- (void)setChromeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end