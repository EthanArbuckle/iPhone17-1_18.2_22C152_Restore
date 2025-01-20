@interface MapsAppTestETA
- (BOOL)runTest;
- (unint64_t)defaultMapType;
- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3;
- (void)startAtLocation:(CLLocationCoordinate2D)a3;
@end

@implementation MapsAppTestETA

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestResetForLaunchURL];

  [v3 _mapstest_locationCoordinate2D];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  [(MapsAppTest *)self registerGEOManifestSubtests];
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"finishedTest" name:MapsButtonETAUpdatedNotification object:0];

  [self switchToMapType:[v3 _mapstest_mapTypeWithDefaultType:[self defaultMapType]]];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B879F0;
  block[3] = &unk_1012E8160;
  block[4] = self;
  block[5] = v6;
  block[6] = v8;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (void)startAtLocation:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v6 = +[GEOMapRegion _mapstest_mapRegionWithCenterLatitude:a3.latitude longitude:a3.longitude size:0.01];
  uint64_t v7 = [(MapsAppTest *)self mainVKMapView];
  [v7 setMapRegion:v6 pitch:0.0 yaw:0.0];

  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B87AF0;
  block[3] = &unk_1012E8160;
  block[4] = self;
  *(CLLocationDegrees *)&block[5] = latitude;
  *(CLLocationDegrees *)&block[6] = longitude;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)defaultMapType
{
  return 104;
}

- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(MapsAppTest *)self mainMKMapView];
  [v5 convertCoordinate:v5 toPointToView:latitude longitude];
  [v5 _handleSelectionAtPoint:];
}

@end