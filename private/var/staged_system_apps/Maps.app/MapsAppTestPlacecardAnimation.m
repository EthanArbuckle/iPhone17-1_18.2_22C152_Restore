@interface MapsAppTestPlacecardAnimation
- (BOOL)runTest;
- (void)_startTestPresentWithSearchResult:(id)a3;
@end

@implementation MapsAppTestPlacecardAnimation

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  v4 = [v3 _mapstest_location];

  if (v4)
  {
    [(MapsAppTest *)self setupForVKTest];
    v5 = [(MapsAppTest *)self options];
    [v5 _mapstest_jumpPoint];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [(MapsAppTest *)self options];
    [v12 _mapstest_pitch];
    double v14 = v13;

    v15 = [(MapsAppTest *)self options];
    [v15 _mapstest_yaw];
    double v17 = v16;

    v18 = [(MapsAppTest *)self options];
    id v19 = [v18 _mapstest_mapType];

    [(MapsAppTest *)self switchToMapType:v19];
    v20 = [(MapsAppTest *)self mainVKMapView];
    [v20 _mapstest_jumpToCoords:1 pitch:v7 yaw:v9 altitudeIsRegionSize:v14 v17];

    id v21 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v4];
    v22 = [[SearchResult alloc] initWithMapItem:v21];
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1007B94C8;
    v25[3] = &unk_1012E6690;
    objc_copyWeak(&v27, &location);
    v23 = v22;
    v26 = v23;
    [(MapsAppTest *)self addFullyDrawnCallback:v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v4 != 0;
}

- (void)_startTestPresentWithSearchResult:(id)a3
{
  id v4 = a3;
  [(MapsAppTest *)self startedTest];
  v5 = [(MapsAppTest *)self testName];
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007B9618;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007B9670;
  v7[3] = &unk_1012E5D08;
  id v6 = v4;
  [(MapsAppTest *)self presentDismissTrayTestAndSubTestsWithPrefix:v5 presenter:v8 completion:v7];
}

@end