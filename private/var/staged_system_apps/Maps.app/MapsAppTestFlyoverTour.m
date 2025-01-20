@interface MapsAppTestFlyoverTour
- (BOOL)runTest;
- (void)cleanup:(BOOL)a3;
@end

@implementation MapsAppTestFlyoverTour

- (BOOL)runTest
{
  [(MapsAppTest *)self setupForVKTest];
  v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 setMapType:3];
  [v3 enableTestStatistics];
  v4 = [(MapsAppTest *)self options];
  id v5 = [v4 _mapstest_flyoverTourId];

  [(MapsAppTest *)self startedTest];
  v6 = [(MapsAppTest *)self mainMKMapView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003CE8DC;
  v9[3] = &unk_1012E6160;
  v9[4] = self;
  id v10 = v3;
  id v7 = v3;
  [v6 _startFlyoverTourAnimation:v5 duration:v9 completion:0.0];

  return 1;
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 disableTestStatistics];
  [v5 clearScene];
  v6.receiver = self;
  v6.super_class = (Class)MapsAppTestFlyoverTour;
  [(MapsAppTest *)&v6 cleanup:v3];
}

@end