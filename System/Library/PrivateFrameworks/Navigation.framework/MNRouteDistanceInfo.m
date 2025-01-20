@interface MNRouteDistanceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MNRouteDistanceInfo)init;
- (MNRouteDistanceInfo)initWithCoder:(id)a3;
- (MNRouteDistanceInfo)initWithDistanceRemainingToEndOfLeg:(double)a3 distanceRemainingToEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6;
- (double)distanceRemainingToEndOfLeg;
- (double)distanceRemainingToEndOfRoute;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNRouteDistanceInfo

- (MNRouteDistanceInfo)init
{
  result = (MNRouteDistanceInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNRouteDistanceInfo)initWithDistanceRemainingToEndOfLeg:(double)a3 distanceRemainingToEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MNRouteDistanceInfo;
  v12 = [(MNRouteDistanceInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_distanceRemainingToEndOfLeg = a3;
    v12->_distanceRemainingToEndOfRoute = a4;
    v12->_legIndex = a5;
    objc_storeStrong((id *)&v12->_routeID, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNRouteDistanceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MNRouteDistanceInfo *)self initWithDistanceRemainingToEndOfLeg:0 distanceRemainingToEndOfRoute:0 forLegIndex:0.0 forRouteID:0.0];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_distanceRemainingToEndOfLeg"];
    v5->_distanceRemainingToEndOfLeg = v6;
    [v4 decodeDoubleForKey:@"_distanceRemainingToEndOfRoute"];
    v5->_distanceRemainingToEndOfRoute = v7;
    v5->_legIndex = [v4 decodeIntegerForKey:@"_legIndex"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double distanceRemainingToEndOfLeg = self->_distanceRemainingToEndOfLeg;
  id v5 = a3;
  [v5 encodeDouble:@"_distanceRemainingToEndOfLeg" forKey:distanceRemainingToEndOfLeg];
  [v5 encodeDouble:@"_distanceRemainingToEndOfRoute" forKey:self->_distanceRemainingToEndOfRoute];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeObject:self->_routeID forKey:@"_routeID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MNRouteDistanceInfo *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      double v6 = v5;
      if (self->_distanceRemainingToEndOfLeg == v5->_distanceRemainingToEndOfLeg
        && self->_distanceRemainingToEndOfRoute == v5->_distanceRemainingToEndOfRoute
        && self->_legIndex == v5->_legIndex)
      {
        routeID = self->_routeID;
        uint64_t v8 = v5->_routeID;
        id v9 = routeID;
        v10 = v9;
        if ((unint64_t)v9 | (unint64_t)v8) {
          char v11 = [v9 isEqual:v8];
        }
        else {
          char v11 = 1;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"endOfLeg: %ldm, endOfRoute: %ldm", (uint64_t)self->_distanceRemainingToEndOfLeg, (uint64_t)self->_distanceRemainingToEndOfRoute];
}

- (double)distanceRemainingToEndOfLeg
{
  return self->_distanceRemainingToEndOfLeg;
}

- (double)distanceRemainingToEndOfRoute
{
  return self->_distanceRemainingToEndOfRoute;
}

- (void).cxx_destruct
{
}

@end