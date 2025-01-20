@interface MapsAppTestFlyover
- (BOOL)runTest;
- (void)setCenterCoordinateFull:(id)a3;
@end

@implementation MapsAppTestFlyover

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testName];
  NSLog(@"test is %@", v3);

  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self setupForVKTest];
  [(MapsAppTest *)self runSerialSubTestAtIndex:0];
  return 1;
}

- (void)setCenterCoordinateFull:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v5 = [(MapsAppTest *)self options];
  }
  v6 = [v5 objectForKeyedSubscript:@"subTestName"];
  if (!v6)
  {
    v6 = NSStringFromSelector(a2);
  }
  if ([v6 hasSuffix:@":"])
  {
    uint64_t v7 = [v6 substringToIndex:[v6 length] - 1];

    v6 = (void *)v7;
  }
  objc_initWeak(&location, self);
  [v5 _mapstest_VKLocationCoordinate2D];
  double v9 = v8;
  double v11 = v10;
  [v5 _mapstest_altitude];
  double v13 = v12;
  [v5 _mapstest_yaw];
  double v15 = v14;
  [v5 _mapstest_pitch];
  double v17 = v16;
  [v5 _mapstest_duration];
  double v19 = v18;
  v20 = [(MapsAppTest *)self mainVKMapView];
  uint64_t v21 = VKAnimationCurveEaseInOut;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100BF60A4;
  v23[3] = &unk_1012E5D30;
  objc_copyWeak(&v25, &location);
  id v22 = v6;
  id v24 = v22;
  [v20 setCenterCoordinate:v21 altitude:v23 yaw:v9 pitch:v11 duration:v13 timingCurve:v15 completion:v17];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

@end