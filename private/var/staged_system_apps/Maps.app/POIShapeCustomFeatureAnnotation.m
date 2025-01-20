@interface POIShapeCustomFeatureAnnotation
- (CGRect)currentFrameInMapView;
- (CGSize)estimatedSize;
- (CLLocationCoordinate2D)centerCoordinate;
- (MKMapView)mapView;
- (POIShapeCustomFeatureAnnotation)initWithMapView:(id)a3 customFeatureAnnotation:(id)a4;
- (VKCustomFeatureAnnotation)customFeatureAnnotation;
- (id)_labelMarker;
@end

@implementation POIShapeCustomFeatureAnnotation

- (POIShapeCustomFeatureAnnotation)initWithMapView:(id)a3 customFeatureAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeCustomFeatureAnnotation;
  v8 = [(POIShapeCustomFeatureAnnotation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v6);
    objc_storeStrong((id *)&v9->_customFeatureAnnotation, a4);
    v10 = v9;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  v3 = [(POIShapeCustomFeatureAnnotation *)self customFeatureAnnotation];
  [v3 coordinate];
  CLLocationDegrees v5 = v4;
  id v6 = [(POIShapeCustomFeatureAnnotation *)self customFeatureAnnotation];
  [v6 coordinate];
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v5, v7);

  double latitude = v8.latitude;
  double longitude = v8.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CGRect)currentFrameInMapView
{
  v3 = [(POIShapeCustomFeatureAnnotation *)self _labelMarker];
  if ([v3 isVisible])
  {
    double v4 = [(POIShapeCustomFeatureAnnotation *)self mapView];
    [v3 screenCollisionBounds];
    [v4 convertRect:0 fromView:];

    CLLocationDegrees v5 = [(POIShapeCustomFeatureAnnotation *)self mapView];
    id v6 = [v5 window];
    CLLocationDegrees v7 = [v6 screen];
    if (v7)
    {
      CLLocationCoordinate2D v8 = [v5 window];
      v9 = [v8 screen];
      [v9 nativeScale];
    }
    else
    {
      CLLocationCoordinate2D v8 = +[UIScreen mainScreen];
      [v8 nativeScale];
    }

    UIRectIntegralWithScale();
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGSize)estimatedSize
{
  v2 = [(POIShapeCustomFeatureAnnotation *)self _labelMarker];
  if ([v2 isVisible])
  {
    [v2 screenCollisionBounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0x404E000000000000;
    uint64_t v6 = 0x404E000000000000;
  }

  double v7 = *(double *)&v4;
  double v8 = *(double *)&v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (id)_labelMarker
{
  if (!self->_labelMarker)
  {
    uint64_t v3 = [(VKCustomFeatureAnnotation *)self->_customFeatureAnnotation feature];
    uint64_t v4 = [v3 dataSource];

    if (v4)
    {
      uint64_t v5 = [(POIShapeCustomFeatureAnnotation *)self mapView];
      uint64_t v6 = [v5 _labelMarkerForCustomFeatureAnnotation:self->_customFeatureAnnotation];
      labelMarker = self->_labelMarker;
      self->_labelMarker = v6;
    }
  }
  double v8 = self->_labelMarker;

  return v8;
}

- (VKCustomFeatureAnnotation)customFeatureAnnotation
{
  return self->_customFeatureAnnotation;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_customFeatureAnnotation, 0);

  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end