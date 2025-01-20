@interface MNBatteryChargeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MNBatteryChargeInfo)init;
- (MNBatteryChargeInfo)initWithBatteryChargeRemainingAtEndOfLeg:(double)a3 batteryChargeRemainingAtEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6;
- (MNBatteryChargeInfo)initWithCoder:(id)a3;
- (double)batteryChargeRemainingAtEndOfLeg;
- (double)batteryChargeRemainingAtEndOfRoute;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNBatteryChargeInfo

- (MNBatteryChargeInfo)init
{
  result = (MNBatteryChargeInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MNBatteryChargeInfo)initWithBatteryChargeRemainingAtEndOfLeg:(double)a3 batteryChargeRemainingAtEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MNBatteryChargeInfo;
  v12 = [(MNBatteryChargeInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_batteryChargeRemainingAtEndOfLeg = a3;
    v12->_batteryChargeRemainingAtEndOfRoute = a4;
    v12->_legIndex = a5;
    objc_storeStrong((id *)&v12->_routeID, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNBatteryChargeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"_batteryChargeRemainingAtEndOfLeg"];
  double v6 = v5;
  self->_batteryChargeRemainingAtEndOfLeg = v5;
  [v4 decodeDoubleForKey:@"_batteryChargeRemainingAtEndOfRoute"];
  double v8 = v7;
  self->_batteryChargeRemainingAtEndOfRoute = v7;
  unint64_t v9 = [v4 decodeIntegerForKey:@"_legIndex"];
  self->_legIndex = v9;
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];

  routeID = self->_routeID;
  self->_routeID = v10;

  return [(MNBatteryChargeInfo *)self initWithBatteryChargeRemainingAtEndOfLeg:v9 batteryChargeRemainingAtEndOfRoute:v10 forLegIndex:v6 forRouteID:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double batteryChargeRemainingAtEndOfLeg = self->_batteryChargeRemainingAtEndOfLeg;
  id v5 = a3;
  [v5 encodeDouble:@"_batteryChargeRemainingAtEndOfLeg" forKey:batteryChargeRemainingAtEndOfLeg];
  [v5 encodeDouble:@"_batteryChargeRemainingAtEndOfRoute" forKey:self->_batteryChargeRemainingAtEndOfRoute];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeObject:self->_routeID forKey:@"_routeID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MNBatteryChargeInfo *)a3;
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
      if (self->_batteryChargeRemainingAtEndOfLeg == v5->_batteryChargeRemainingAtEndOfLeg
        && self->_batteryChargeRemainingAtEndOfRoute == v5->_batteryChargeRemainingAtEndOfRoute
        && self->_legIndex == v5->_legIndex)
      {
        routeID = self->_routeID;
        double v8 = v5->_routeID;
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
  return (id)[NSString stringWithFormat:@"endOfLeg: %ldm, endOfRoute: %ldm", (uint64_t)self->_batteryChargeRemainingAtEndOfLeg, (uint64_t)self->_batteryChargeRemainingAtEndOfRoute];
}

- (double)batteryChargeRemainingAtEndOfLeg
{
  return self->_batteryChargeRemainingAtEndOfLeg;
}

- (double)batteryChargeRemainingAtEndOfRoute
{
  return self->_batteryChargeRemainingAtEndOfRoute;
}

- (void).cxx_destruct
{
}

@end