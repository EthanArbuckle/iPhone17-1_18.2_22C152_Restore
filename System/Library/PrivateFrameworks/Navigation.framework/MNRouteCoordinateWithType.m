@interface MNRouteCoordinateWithType
+ (id)convergenceCoordinate:(PolylineCoordinate)a3;
+ (id)divergenceCoordinate:(PolylineCoordinate)a3;
- (PolylineCoordinate)routeCoordinate;
- (id).cxx_construct;
- (id)description;
- (unint64_t)significanceType;
- (void)setRouteCoordinate:(PolylineCoordinate)a3;
- (void)setSignificanceType:(unint64_t)a3;
@end

@implementation MNRouteCoordinateWithType

- (id)description
{
  unint64_t v3 = [(MNRouteCoordinateWithType *)self significanceType];
  v4 = @"Divergence";
  if (v3 == 1) {
    v4 = @"Convergence";
  }
  v5 = v4;
  v6 = [NSString stringWithFormat:@"[%u, %0.2f] - %@", -[MNRouteCoordinateWithType routeCoordinate](self, "routeCoordinate"), COERCE_FLOAT((unint64_t)-[MNRouteCoordinateWithType routeCoordinate](self, "routeCoordinate") >> 32), v5];

  return v6;
}

+ (id)divergenceCoordinate:(PolylineCoordinate)a3
{
  v4 = objc_alloc_init(MNRouteCoordinateWithType);
  [(MNRouteCoordinateWithType *)v4 setSignificanceType:0];
  [(MNRouteCoordinateWithType *)v4 setRouteCoordinate:a3];
  return v4;
}

+ (id)convergenceCoordinate:(PolylineCoordinate)a3
{
  v4 = objc_alloc_init(MNRouteCoordinateWithType);
  [(MNRouteCoordinateWithType *)v4 setSignificanceType:1];
  [(MNRouteCoordinateWithType *)v4 setRouteCoordinate:a3];
  return v4;
}

- (unint64_t)significanceType
{
  return self->_significanceType;
}

- (void)setSignificanceType:(unint64_t)a3
{
  self->_significanceType = a3;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0xBF80000000000000;
  return self;
}

@end