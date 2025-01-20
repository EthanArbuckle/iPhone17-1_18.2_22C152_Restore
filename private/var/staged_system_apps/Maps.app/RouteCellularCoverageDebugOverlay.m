@interface RouteCellularCoverageDebugOverlay
- ($C79183323B9A0D5602617FF3BE5395AC)boundingMapRect;
- (CLLocationCoordinate2D)coordinate;
- (GEOComposedRoute)route;
- (RouteCellularCoverageDebugOverlay)init;
- (RouteCellularCoverageDebugOverlay)initWithRoute:(id)a3;
@end

@implementation RouteCellularCoverageDebugOverlay

- (RouteCellularCoverageDebugOverlay)init
{
  result = (RouteCellularCoverageDebugOverlay *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (RouteCellularCoverageDebugOverlay)initWithRoute:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RouteCellularCoverageDebugOverlay;
  v6 = [(RouteCellularCoverageDebugOverlay *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v8 = [v5 boundingMapRegion];
    GEOMapRectForMapRegion();
    v7->_boundingMapRect.origin.x = v9;
    v7->_boundingMapRect.origin.double y = v10;
    v7->_boundingMapRect.size.width = v11;
    v7->_boundingMapRect.size.height = v12;

    __asm { FMOV            V2.2D, #0.5 }
    MKMapPoint v18 = (MKMapPoint)vaddq_f64((float64x2_t)v7->_boundingMapRect.origin, vmulq_f64((float64x2_t)v7->_boundingMapRect.size, _Q2));
    double y = v18.y;
    v7->_coordinate = MKCoordinateForMapPoint(v18);
    v20 = v7;
  }

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  double longitude = v4.longitude;
  double latitude = v4.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)boundingMapRect
{
  double x = self->_boundingMapRect.origin.x;
  double y = self->_boundingMapRect.origin.y;
  double width = self->_boundingMapRect.size.width;
  double height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
}

@end