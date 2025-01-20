@interface MapsAppTestRAPPOI
- (BOOL)runTest;
- (void)_showRAPCallout:(id)a3;
- (void)_showRAPPlaceCard:(id)a3;
- (void)_startCalloutRAPControllerPresentationTest;
- (void)_startRAPPlacecardTest;
@end

@implementation MapsAppTestRAPPOI

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  [(MapsAppTestRAP *)self overrideProblemSubmissionURL];
  [(MapsAppTestRAP *)self overridePrivacyConsent];
  [(MapsAppTest *)self setupForVKTest];
  v4 = [(MapsAppTest *)self options];
  [v4 _mapstest_jumpPoint];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [(MapsAppTest *)self options];
  [v11 _mapstest_pitch];
  double v13 = v12;

  v14 = [(MapsAppTest *)self options];
  [v14 _mapstest_yaw];
  double v16 = v15;

  v17 = [(MapsAppTest *)self options];
  id v18 = [v17 _mapstest_mapType];

  [(MapsAppTest *)self switchToMapType:v18];
  v19 = [(MapsAppTest *)self mainVKMapView];
  [v19 _mapstest_jumpToCoords:1 pitch:v6 yaw:v8 altitudeIsRegionSize:v13 v16];

  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100CD0F50;
  v21[3] = &unk_1012E6708;
  objc_copyWeak(&v22, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v21];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return 1;
}

- (void)_startRAPPlacecardTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_showRAPCallout:" name:MKBalloonCalloutDidShowNotification object:0];

  [(MapsAppTestRAPPOI *)self performSelector:"_startCalloutRAPControllerPresentationTest" withObject:0 afterDelay:1.0];
}

- (void)_startCalloutRAPControllerPresentationTest
{
  v3 = [(MapsAppTest *)self options];
  id v6 = [v3 objectForKeyedSubscript:@"searchString"];

  v4 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v4 setSearchString:v6];
  double v5 = [(MapsAppTest *)self testCoordinator];
  [v5 pptTestSearchForFieldItem:v4];
}

- (void)_showRAPCallout:(id)a3
{
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:MKBalloonCalloutDidShowNotification object:0];
  [v8 addObserver:self selector:"_showRAPPlaceCard:" name:MKPlaceViewControllerDidShowNotification object:0];
  v4 = +[SearchSession currentSearchSession];
  double v5 = [v4 currentResults];
  id v6 = [v5 firstObject];

  if (v6)
  {
    double v7 = [(MapsAppTest *)self testCoordinator];
    [v7 pptTestPresentPlaceCardForSearchResult:v6 animated:1];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)_showRAPPlaceCard:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MKPlaceViewControllerDidShowNotification object:0];
  [(MapsAppTest *)self failedTest];
}

@end