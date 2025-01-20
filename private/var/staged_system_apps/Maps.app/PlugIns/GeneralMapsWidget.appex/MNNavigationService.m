@interface MNNavigationService
- (BOOL)isArrivedAtEVCharger;
- (GEOComposedRouteEVChargingStationInfo)arrivalChargingStationInfo;
- (GEOComposedWaypoint)stopAfterCharging;
- (GEOComposedWaypoint)upcomingStop;
- (unint64_t)arrivalState;
@end

@implementation MNNavigationService

- (GEOComposedWaypoint)upcomingStop
{
  v3 = [(MNNavigationService *)self lastLocation];

  if (v3)
  {
    v4 = [(MNNavigationService *)self lastLocation];
    v5 = [v4 routeMatch];
    [v5 leg];
  }
  else
  {
    v4 = [(MNNavigationService *)self route];
    v5 = [v4 legs];
    [v5 firstObject];
  v6 = };
  v7 = [v6 destination];

  return (GEOComposedWaypoint *)v7;
}

- (unint64_t)arrivalState
{
  v3 = [(MNNavigationService *)self route];
  v4 = (char *)[v3 legIndexForStepIndex:-[self stepIndex]];

  v5 = [(MNNavigationService *)self route];
  v6 = [v5 legs];
  v7 = (char *)[v6 count];

  v8 = [(MNNavigationService *)self arrivalInfo];
  unint64_t v9 = (unint64_t)[v8 arrivalState];

  if (v9 > 6) {
    return 0;
  }
  v10 = v7 - 1;
  if (((1 << v9) & 0x72) != 0)
  {
    BOOL v11 = v4 == v10;
    unint64_t v12 = 4;
  }
  else
  {
    if (((1 << v9) & 0xC) == 0) {
      return 1;
    }
    BOOL v11 = v4 == v10;
    unint64_t v12 = 2;
  }
  if (v11) {
    return v12 + 1;
  }
  else {
    return v12;
  }
}

- (BOOL)isArrivedAtEVCharger
{
  v3 = [(MNNavigationService *)self arrivalInfo];
  if (([v3 isInArrivalState] & 1) == 0
    && ![v3 isInParkingState])
  {
    goto LABEL_6;
  }
  v4 = [(MNNavigationService *)self route];
  v5 = [v4 legs];
  id v6 = [v5 count];
  id v7 = [v3 legIndex];

  if (v6 > v7)
  {
    v8 = [(MNNavigationService *)self route];
    unint64_t v9 = [v8 legs];
    v10 = [v9 objectAtIndex:[v3 legIndex]];

    BOOL v11 = [v10 chargingStationInfo];

    if (v11)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v13 = [v3 destination];
      v14 = [v13 chargingInfo];
      BOOL v12 = v14 != 0;
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (GEOComposedRouteEVChargingStationInfo)arrivalChargingStationInfo
{
  if ([(MNNavigationService *)self isArrivedAtEVCharger])
  {
    v3 = [(MNNavigationService *)self arrivalInfo];
    v4 = [v3 destination];
    v5 = [(MNNavigationService *)self route];
    id v6 = [v5 legs];
    id v7 = [v6 objectAtIndex:[v3 legIndex]];

    v8 = [(MNNavigationService *)self route];
    unint64_t v9 = [v8 waypointDisplayInfoForWaypoint:v4];

    v10 = [v7 chargingStationInfo];

    if (v10)
    {
      BOOL v11 = [v9 evChargingInfo];
      BOOL v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [v7 chargingStationInfo];
      }
      v14 = v13;
    }
    else
    {
      v14 = [v4 chargingInfo];
    }
  }
  else
  {
    v14 = 0;
  }

  return (GEOComposedRouteEVChargingStationInfo *)v14;
}

- (GEOComposedWaypoint)stopAfterCharging
{
  v3 = [(MNNavigationService *)self arrivalInfo];
  id v4 = [v3 legIndex];
  v5 = [(MNNavigationService *)self route];
  id v6 = [v5 legs];
  id v7 = [v6 count];

  if (v4 >= v7)
  {
    BOOL v12 = 0;
  }
  else
  {
    v8 = [(MNNavigationService *)self route];
    unint64_t v9 = [v8 legs];
    v10 = [(MNNavigationService *)self arrivalInfo];
    BOOL v11 = [v9 objectAtIndex:[v10 legIndex] + 1];
    BOOL v12 = [v11 destination];
  }

  return (GEOComposedWaypoint *)v12;
}

@end