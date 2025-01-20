@interface OriginalRouteDivergencePosition
- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate;
- (BOOL)isAnimatingAccuracy;
- (BOOL)tracking;
- (GEORouteMatch)routeMatch;
- (OriginalRouteDivergencePosition)initWithRouteCoordinate:(id)a3 route:(id)a4;
- (VKEdgeInsets)annotationTrackingEdgeInsets;
- (double)minimumAccuracy;
- (double)presentationAccuracy;
- (void)setAnimatingAccuracy:(BOOL)a3;
- (void)setPresentationAccuracy:(double)a3;
- (void)setPresentationCoordinate:(id)a3;
- (void)setRouteMatch:(id)a3;
- (void)setTracking:(BOOL)a3;
@end

@implementation OriginalRouteDivergencePosition

- (OriginalRouteDivergencePosition)initWithRouteCoordinate:(id)a3 route:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)OriginalRouteDivergencePosition;
  v7 = [(OriginalRouteDivergencePosition *)&v20 init];
  if (v7)
  {
    [v6 pointAtRouteCoordinate:a3];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_alloc((Class)GEORouteMatch);
    v15 = +[NSDate now];
    v16 = [v14 initWithRoute:v6 routeCoordinate:a3 locationCoordinate:0 stepIndex:v15 matchedCourse:v9 timestamp:v11];
    routeMatch = v7->_routeMatch;
    v7->_routeMatch = v16;

    v7->_presentationCoordinate.latitude = v9;
    v7->_presentationCoordinate.longitude = v11;
    v18 = v7;
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  double latitude = self->_presentationCoordinate.latitude;
  double longitude = self->_presentationCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setPresentationCoordinate:(id)a3
{
  self->_presentationCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (BOOL)isAnimatingAccuracy
{
  return self->_animatingAccuracy;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  self->_animatingAccuracy = a3;
}

- (double)presentationAccuracy
{
  return self->_presentationAccuracy;
}

- (void)setPresentationAccuracy:(double)a3
{
  self->_presentationAccuracy = a3;
}

- (double)minimumAccuracy
{
  return self->_minimumAccuracy;
}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  float top = self->_annotationTrackingEdgeInsets.top;
  float left = self->_annotationTrackingEdgeInsets.left;
  float bottom = self->_annotationTrackingEdgeInsets.bottom;
  float right = self->_annotationTrackingEdgeInsets.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
  return result;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (void)setRouteMatch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end