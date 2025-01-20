@interface VKAlternateRouteInfo
- (PolylineCoordinate)convergenceCoordinate;
- (PolylineCoordinate)divergenceCoordinate;
- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6;
- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6;
- (id).cxx_construct;
- (unsigned)etaComparisionToMain;
- (void)setEtaComparisionToMain:(unsigned __int8)a3;
@end

@implementation VKAlternateRouteInfo

- (id).cxx_construct
{
  *((void *)self + 13) = 0xBF80000000000000;
  *((void *)self + 14) = 0xBF80000000000000;
  return self;
}

- (void)setEtaComparisionToMain:(unsigned __int8)a3
{
  self->_etaComparisonToMain = a3;
}

- (unsigned)etaComparisionToMain
{
  return self->_etaComparisonToMain;
}

- (PolylineCoordinate)convergenceCoordinate
{
  return self->_convergenceCoordinate;
}

- (PolylineCoordinate)divergenceCoordinate
{
  return self->_divergenceCoordinate;
}

- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6
{
  v12.receiver = self;
  v12.super_class = (Class)VKAlternateRouteInfo;
  v8 = [(VKRouteInfo *)&v12 initWithComposedRoute:a3 etaDescription:a4];
  v9 = v8;
  if (v8)
  {
    v8->_divergenceCoordinate = a5;
    v8->_convergenceCoordinate = a6;
    v10 = v8;
  }

  return v9;
}

- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11) {
    objc_super v12 = [[VKRouteEtaDescription alloc] initWithEtaText:v11];
  }
  else {
    objc_super v12 = 0;
  }
  v13 = [(VKAlternateRouteInfo *)self initWithComposedRoute:v10 etaDescription:v12 divergenceRouteCoordinate:a5 convergenceRouteCoordinate:a6];

  return v13;
}

@end