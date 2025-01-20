@interface POIShapeUserLocation
- (CGRect)currentFrameInMapView;
- (CGSize)_size;
- (CLLocationCoordinate2D)centerCoordinate;
- (MKMapView)mapView;
- (POIShapeUserLocation)initWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4;
@end

@implementation POIShapeUserLocation

- (POIShapeUserLocation)initWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeUserLocation;
  v8 = [(POIShapeUserLocation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v7);
    v9->_coordinate.CLLocationDegrees latitude = latitude;
    v9->_coordinate.CLLocationDegrees longitude = longitude;
    v10 = v9;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  CLLocationDegrees latitude = self->_coordinate.latitude;
  CLLocationDegrees longitude = self->_coordinate.longitude;
  v11.CLLocationDegrees latitude = latitude;
  v11.CLLocationDegrees longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v11))
  {
    v4 = +[MKLocationManager sharedLocationManager];
    v5 = [v4 lastLocation];
    v6 = v5;
    if (v5)
    {
      [v5 coordinate];
      CLLocationDegrees latitude = v7;
      CLLocationDegrees longitude = v8;
    }
  }
  double v9 = latitude;
  double v10 = longitude;
  result.CLLocationDegrees longitude = v10;
  result.CLLocationDegrees latitude = v9;
  return result;
}

- (CGRect)currentFrameInMapView
{
  [(POIShapeUserLocation *)self centerCoordinate];
  double latitude = v24.latitude;
  double longitude = v24.longitude;
  if (CLLocationCoordinate2DIsValid(v24))
  {
    v5 = [(POIShapeUserLocation *)self mapView];
    v6 = [(POIShapeUserLocation *)self mapView];
    [v5 convertCoordinate:v6 toPointToView:latitude longitude];

    [(POIShapeUserLocation *)self _size];
    double v7 = [(POIShapeUserLocation *)self mapView];
    double v8 = [v7 window];
    double v9 = [v8 screen];
    if (v9)
    {
      double v10 = [v7 window];
      CLLocationCoordinate2D v11 = [v10 screen];
      [v11 nativeScale];
    }
    else
    {
      double v10 = +[UIScreen mainScreen];
      [v10 nativeScale];
    }

    UIRectCenteredAboutPointScale();
    CGFloat x = v16;
    CGFloat y = v17;
    CGFloat width = v18;
    CGFloat height = v19;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGSize)_size
{
  +[_MKPuckAnnotationView baseDiameter];
  double v3 = v2;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end