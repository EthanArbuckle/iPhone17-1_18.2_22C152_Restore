@interface POIShapeComposedWaypoint
- (CGRect)_boundingRect;
- (CGRect)currentFrameInMapView;
- (CGSize)estimatedSize;
- (CLLocationCoordinate2D)centerCoordinate;
- (MKMapView)mapView;
- (POIShapeComposedWaypoint)initWithMapView:(id)a3 composedWaypoint:(id)a4;
@end

@implementation POIShapeComposedWaypoint

- (POIShapeComposedWaypoint)initWithMapView:(id)a3 composedWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeComposedWaypoint;
  v8 = [(POIShapeComposedWaypoint *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v6);
    objc_storeStrong((id *)&v9->_composedWaypoint, a4);
    CGSize size = CGRectNull.size;
    v9->_boundingRect.origin = CGRectNull.origin;
    v9->_boundingRect.CGSize size = size;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  v3 = [(GEOComposedWaypoint *)self->_composedWaypoint location];

  if (v3)
  {
    v4 = [(GEOComposedWaypoint *)self->_composedWaypoint location];
    [v4 coordinate];
    CLLocationDegrees latitude = v5;
    CLLocationDegrees longitude = v7;
  }
  else
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  double v9 = latitude;
  double v10 = longitude;
  result.CLLocationDegrees longitude = v10;
  result.CLLocationDegrees latitude = v9;
  return result;
}

- (CGRect)currentFrameInMapView
{
  [(POIShapeComposedWaypoint *)self centerCoordinate];
  double latitude = v24.latitude;
  double longitude = v24.longitude;
  if (CLLocationCoordinate2DIsValid(v24))
  {
    [(POIShapeComposedWaypoint *)self _boundingRect];
    double v5 = [(POIShapeComposedWaypoint *)self mapView];
    id v6 = [(POIShapeComposedWaypoint *)self mapView];
    [v5 convertCoordinate:v6 toPointToView:latitude, longitude];

    double v7 = [(POIShapeComposedWaypoint *)self mapView];
    v8 = [v7 window];
    double v9 = [v8 screen];
    if (v9)
    {
      double v10 = [v7 window];
      v11 = [v10 screen];
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

- (CGSize)estimatedSize
{
  [(POIShapeComposedWaypoint *)self _boundingRect];
  v3 = [(POIShapeComposedWaypoint *)self mapView];
  v4 = [v3 window];
  double v5 = [v4 screen];
  if (v5)
  {
    id v6 = [v3 window];
    double v7 = [v6 screen];
    [v7 nativeScale];
  }
  else
  {
    id v6 = +[UIScreen mainScreen];
    [v6 nativeScale];
  }

  UIRectIntegralWithScale();
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGRect)_boundingRect
{
  if (CGRectIsNull(self->_boundingRect))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((char *)[(GEOComposedWaypoint *)self->_composedWaypoint anchorPointType] - 3 >= (char *)2) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = 3;
      }
    }
    else
    {
      uint64_t v3 = 1;
    }
    v4 = [(POIShapeComposedWaypoint *)self mapView];
    double v5 = [v4 _mapLayer];
    id v6 = [v5 metrics];
    double v7 = [(GEOComposedWaypoint *)self->_composedWaypoint name];
    double v8 = +[NSLocale currentLocale];
    double v9 = [v8 localeIdentifier];
    [v6 boundingRectForItem:v3 text:v7 locale:v9];
    self->_boundingRect.origin.double x = v10;
    self->_boundingRect.origin.double y = v11;
    self->_boundingRect.size.double width = v12;
    self->_boundingRect.size.double height = v13;
  }
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);

  objc_storeStrong((id *)&self->_composedWaypoint, 0);
}

@end