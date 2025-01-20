@interface MNRouteDivergenceOverlappingSectionComponent
- (GEOPolylineCoordinateRange)range;
- (id).cxx_construct;
- (unint64_t)routeIndex;
- (void)setRange:(GEOPolylineCoordinateRange)a3;
- (void)setRouteIndex:(unint64_t)a3;
@end

@implementation MNRouteDivergenceOverlappingSectionComponent

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unint64_t)a3
{
  self->_routeIndex = a3;
}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate end = self->_range.end;
  PolylineCoordinate start = self->_range.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (void)setRange:(GEOPolylineCoordinateRange)a3
{
  self->_range = a3;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0xBF80000000000000;
  *((void *)self + 3) = 0xBF80000000000000;
  return self;
}

@end