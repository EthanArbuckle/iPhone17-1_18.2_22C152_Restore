@interface MapsAppTestDropPin
- ($1AB5FA073B851C12C2339EC22442E995)region;
- (BOOL)runTest;
- (CLLocationCoordinate2D)pinCoordinate;
- (MapsAppTestDropPin)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (double)pitch;
- (double)yaw;
- (void)didFinishJumping;
- (void)didShowPlaceCard;
- (void)setPinCoordinate:(CLLocationCoordinate2D)a3;
- (void)setPitch:(double)a3;
- (void)setRegion:(id)a3;
- (void)setYaw:(double)a3;
@end

@implementation MapsAppTestDropPin

- (MapsAppTestDropPin)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MapsAppTestDropPin;
  v9 = [(MapsAppTest *)&v22 initWithApplication:a3 testName:a4 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"pin_latitude"];
    [v10 doubleValue];
    CLLocationDegrees v12 = v11;

    v13 = [v8 objectForKeyedSubscript:@"pin_longitude"];
    [v13 doubleValue];
    CLLocationDegrees v15 = v14;

    v9->_pinCoordinate = CLLocationCoordinate2DMake(v12, v15);
    [v8 _mapstest_pitch];
    v9->_pitch = v16;
    [v8 _mapstest_yaw];
    v9->_yaw = v17;
    [v8 _mapstest_jumpPoint];
    v9->_region.latitude = v18;
    v9->_region.longitude = v19;
    v9->_region.altitude = v20;
  }

  return v9;
}

- (BOOL)runTest
{
  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self startedSubTest:@"loadingScene"];
  v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 _mapstest_jumpToCoords:1 pitch:self->_region.latitude yaw:self->_region.longitude altitudeIsRegionSize:self->_region.altitude pitch:self->_pitch yaw:self->_yaw];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AD5FB8;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return 1;
}

- (void)didFinishJumping
{
  [(MapsAppTest *)self finishedSubTest:@"loadingScene"];
  [(MapsAppTest *)self startedSubTest:@"showPin"];
  v3 = +[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", 0x7FFFFFFFLL, self->_pinCoordinate.latitude, self->_pinCoordinate.longitude);
  [v3 setType:3];
  [v3 setHasIncompleteMetadata:1];
  objc_initWeak(&location, self);
  uint64_t v4 = MKPlaceViewControllerDidShowNotification;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100AD6164;
  v9 = &unk_1012E6730;
  objc_copyWeak(&v10, &location);
  +[PPTNotificationCenter addOnceObserverForName:v4 object:0 usingBlock:&v6];
  v5 = [(MapsAppTest *)self testCoordinator];
  [v5 pptTestPresentPlaceCardForSearchResult:v3 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)didShowPlaceCard
{
  [(MapsAppTest *)self finishedSubTest:@"showPin"];

  [(MapsAppTest *)self finishedTest];
}

- (CLLocationCoordinate2D)pinCoordinate
{
  double latitude = self->_pinCoordinate.latitude;
  double longitude = self->_pinCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setPinCoordinate:(CLLocationCoordinate2D)a3
{
  self->_pinCoordinate = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)region
{
  double latitude = self->_region.latitude;
  double longitude = self->_region.longitude;
  double altitude = self->_region.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setRegion:(id)a3
{
  self->_region = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

@end