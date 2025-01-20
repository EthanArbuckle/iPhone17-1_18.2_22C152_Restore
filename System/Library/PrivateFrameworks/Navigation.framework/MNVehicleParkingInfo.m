@interface MNVehicleParkingInfo
+ (BOOL)supportsSecureCoding;
- (GEOComposedRoute)remainingWalkingRoute;
- (MNDisplayETAInfo)walkingRouteDisplayETAInfo;
- (MNVehicleParkingInfo)initWithCoder:(id)a3;
- (id)description;
- (int64_t)parkingType;
- (void)encodeWithCoder:(id)a3;
- (void)setParkingType:(int64_t)a3;
- (void)setRemainingWalkingRoute:(id)a3;
- (void)setWalkingRouteDisplayETAInfo:(id)a3;
@end

@implementation MNVehicleParkingInfo

- (void)setRemainingWalkingRoute:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueRouteID];
  routeID = self->_routeID;
  self->_routeID = v5;

  remainingWalkingRoute = self->_remainingWalkingRoute;
  self->_remainingWalkingRoute = (GEOComposedRoute *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_parkingType forKey:@"_parkingType"];
  remainingWalkingRoute = self->_remainingWalkingRoute;
  if (remainingWalkingRoute)
  {
    MNSaveRouteWithSubpath(remainingWalkingRoute, 0, 1, 0);
    [v5 encodeObject:self->_routeID forKey:@"_routeID"];
  }
  [v5 encodeObject:self->_walkingRouteDisplayETAInfo forKey:@"_walkingRouteDisplayETAInfo"];
}

- (MNVehicleParkingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MNVehicleParkingInfo *)self init];
  if (v5)
  {
    v5->_parkingType = [v4 decodeIntegerForKey:@"_parkingType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_walkingRouteDisplayETAInfo"];
    walkingRouteDisplayETAInfo = v5->_walkingRouteDisplayETAInfo;
    v5->_walkingRouteDisplayETAInfo = (MNDisplayETAInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;

    v10 = v5->_routeID;
    if (v10)
    {
      uint64_t v11 = MNGetRouteFromSubpathWithID(v10, 0, 0);
      remainingWalkingRoute = v5->_remainingWalkingRoute;
      v5->_remainingWalkingRoute = (GEOComposedRoute *)v11;
    }
    v13 = v5;
  }

  return v5;
}

- (id)description
{
  int64_t parkingType = self->_parkingType;
  v3 = @"None";
  if (parkingType == 1) {
    v3 = @"Parked";
  }
  if (parkingType == 2) {
    id v4 = @"SearchingForParking";
  }
  else {
    id v4 = v3;
  }
  return (id)[NSString stringWithFormat:@"Type: %@, remaining walking route: %@", v4, self->_walkingRouteDisplayETAInfo];
}

- (int64_t)parkingType
{
  return self->_parkingType;
}

- (void)setParkingType:(int64_t)a3
{
  self->_int64_t parkingType = a3;
}

- (GEOComposedRoute)remainingWalkingRoute
{
  return self->_remainingWalkingRoute;
}

- (MNDisplayETAInfo)walkingRouteDisplayETAInfo
{
  return self->_walkingRouteDisplayETAInfo;
}

- (void)setWalkingRouteDisplayETAInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingRouteDisplayETAInfo, 0);
  objc_storeStrong((id *)&self->_remainingWalkingRoute, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end