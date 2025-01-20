@interface EVBadTripRouteInfo
- (EVBadTripRouteInfo)initWithRoute:(id)a3 currentVehicleState:(id)a4;
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)lastTraversedStep;
- (NSNumber)expectedArrivalBatteryCharge;
- (NSNumber)initialBatteryCharge;
- (NSNumber)realArrivalBatteryCharge;
- (id)description;
- (void)setExpectedArrivalBatteryCharge:(id)a3;
- (void)setInitialBatteryCharge:(id)a3;
- (void)setLastTraversedStep:(id)a3;
- (void)setRealArrivalBatteryCharge:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation EVBadTripRouteInfo

- (EVBadTripRouteInfo)initWithRoute:(id)a3 currentVehicleState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EVBadTripRouteInfo;
  v9 = [(EVBadTripRouteInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    v10->_initialBatteryCharge = (NSNumber *)[v8 currentBatteryCharge];
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(GEOComposedRoute *)self->_route uniqueRouteID];
  v5 = [v4 UUIDString];
  v6 = +[NSString stringWithFormat:@"<%@:%p, routeId: %@, lastTraversedStepIdx: %lu, initial: %lu, expected: %lu, real: %lu>", v3, self, v5, [(GEOComposedRouteStep *)self->_lastTraversedStep stepIndex], [(NSNumber *)self->_initialBatteryCharge unsignedLongValue], [(NSNumber *)self->_expectedArrivalBatteryCharge unsignedLongValue], [(NSNumber *)self->_realArrivalBatteryCharge unsignedLongValue]];

  return v6;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (GEOComposedRouteStep)lastTraversedStep
{
  return self->_lastTraversedStep;
}

- (void)setLastTraversedStep:(id)a3
{
}

- (NSNumber)initialBatteryCharge
{
  return self->_initialBatteryCharge;
}

- (void)setInitialBatteryCharge:(id)a3
{
  self->_initialBatteryCharge = (NSNumber *)a3;
}

- (NSNumber)expectedArrivalBatteryCharge
{
  return self->_expectedArrivalBatteryCharge;
}

- (void)setExpectedArrivalBatteryCharge:(id)a3
{
  self->_expectedArrivalBatteryCharge = (NSNumber *)a3;
}

- (NSNumber)realArrivalBatteryCharge
{
  return self->_realArrivalBatteryCharge;
}

- (void)setRealArrivalBatteryCharge:(id)a3
{
  self->_realArrivalBatteryCharge = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTraversedStep, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end