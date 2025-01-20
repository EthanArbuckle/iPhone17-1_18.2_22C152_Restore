@interface MNRouteDivergenceResult
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate;
- (MNRouteDivergenceResult)init;
- (NSUUID)routeID;
- (PolylineCoordinate)routeCoordinate;
- (id).cxx_construct;
- (id)description;
- (unint64_t)resultType;
- (void)setLocationCoordinate:(id)a3;
- (void)setResultType:(unint64_t)a3;
- (void)setRouteCoordinate:(PolylineCoordinate)a3;
- (void)setRouteID:(id)a3;
@end

@implementation MNRouteDivergenceResult

- (MNRouteDivergenceResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)MNRouteDivergenceResult;
  result = [(MNRouteDivergenceResult *)&v3 init];
  if (result) {
    result->_routeCoordinate = (PolylineCoordinate)*MEMORY[0x1E4F64198];
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = GEOPolylineCoordinateAsString();
  v5 = (void *)v4;
  unint64_t resultType = self->_resultType;
  v7 = @"None";
  if (resultType == 1) {
    v7 = @"Divergence";
  }
  if (resultType == 2) {
    v8 = @"Convergence";
  }
  else {
    v8 = v7;
  }
  v9 = [v3 stringWithFormat:@"%@ (%f, %f) | %@ | %@", v4, *(void *)&self->_locationCoordinate.latitude, *(void *)&self->_locationCoordinate.longitude, self->_routeID, v8];

  return v9;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_unint64_t resultType = a3;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  double altitude = self->_locationCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocationCoordinate:(id)a3
{
  self->_locationCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0xBF80000000000000;
  return self;
}

@end