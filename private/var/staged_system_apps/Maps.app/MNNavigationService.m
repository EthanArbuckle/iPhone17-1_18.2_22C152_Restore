@interface MNNavigationService
- (BOOL)isArrivedAtEVCharger;
- (GEOComposedRouteEVChargingStationInfo)arrivalChargingStationInfo;
- (GEOComposedWaypoint)stopAfterCharging;
- (GEOComposedWaypoint)upcomingStop;
- (id)etaFilterData;
- (id)incidentsOnRouteData;
- (id)incidentsOnRouteOffsets;
- (id)legacyRouteRepresentation;
- (id)originalWaypointRouteRepresentation;
- (id)routeId;
- (int)effectiveTransportType;
- (int64_t)effectiveNavigationType;
- (unint64_t)arrivalState;
- (void)setVoiceGuidanceEnabled:(BOOL)a3;
@end

@implementation MNNavigationService

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

- (id)routeId
{
  v2 = [(MNNavigationService *)self route];
  v3 = [v2 serverRouteID];

  return v3;
}

- (id)legacyRouteRepresentation
{
  v2 = [(MNNavigationService *)self route];
  v3 = [v2 zilchDataFromStepIndex:0];

  return v3;
}

- (id)originalWaypointRouteRepresentation
{
  v3 = [(MNNavigationService *)self lastLocation];
  v4 = [v3 routeMatch];
  id v5 = [v4 routeCoordinate];

  if (GEOPolylineCoordinateIsValid())
  {
    v6 = [(MNNavigationService *)self route];
    v7 = [v6 geoOriginalWaypointRouteFromRouteCoordinate:v5 purpose:0];

    v8 = [v7 data];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOComposedWaypoint)upcomingStop
{
  v3 = [(MNNavigationService *)self lastLocation];

  if (v3)
  {
    v4 = [(MNNavigationService *)self lastLocation];
    id v5 = [v4 routeMatch];
    [v5 leg];
  }
  else
  {
    v4 = [(MNNavigationService *)self route];
    id v5 = [v4 legs];
    [v5 firstObject];
  v6 = };
  v7 = [v6 destination];

  return (GEOComposedWaypoint *)v7;
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
  id v5 = [v4 legs];
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
    id v5 = [(MNNavigationService *)self route];
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
  id v5 = [(MNNavigationService *)self route];
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

- (void)setVoiceGuidanceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [AudioPreferences alloc];
  id v6 = +[NSUserDefaults standardUserDefaults];
  unint64_t v9 = [(AudioPreferences *)v5 initWithDefaults:v6];

  if (v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(MNNavigationService *)self route];
  -[AudioPreferences setGuidanceLevel:forTransportType:](v9, "setGuidanceLevel:forTransportType:", v7, [v8 transportType]);

  [(AudioPreferences *)v9 synchronize];
}

- (id)etaFilterData
{
  v2 = [(MNNavigationService *)self route];
  BOOL v3 = [v2 routeAttributes];

  id v4 = +[GEOMapService sharedService];
  id v5 = [v4 serializedETAFilterForSiriWithRouteAttributes:v3];

  return v5;
}

- (id)incidentsOnRouteData
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(MNNavigationService *)self route];
  id v5 = [v4 traffic];
  id v6 = [v5 routeIncidents];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v12 = [v11 incident];

        if (v12)
        {
          id v13 = [v11 incident];
          v14 = [v13 data];
          [v3 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)incidentsOnRouteOffsets
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(MNNavigationService *)self lastLocation];
  id v5 = [v4 routeMatch];
  id v6 = [v5 routeCoordinate];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(MNNavigationService *)self route];
  id v8 = [v7 traffic];
  uint64_t v9 = [v8 routeIncidents];

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v14 incident];

        if (v15)
        {
          long long v16 = [(MNNavigationService *)self route];
          [v16 distanceBetweenRouteCoordinate:v6 andRouteCoordinate:[v14 routeCoordinate]];
          double v18 = v17;

          long long v19 = +[NSNumber numberWithDouble:v18];
          [v3 addObject:v19];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v3;
}

- (int64_t)effectiveNavigationType
{
  if ([(MNNavigationService *)self isInNavigatingState])
  {
    return (int64_t)[(MNNavigationService *)self navigationType];
  }
  else
  {
    return (int64_t)[(MNNavigationService *)self desiredNavigationType];
  }
}

- (int)effectiveTransportType
{
  if ([(MNNavigationService *)self isInNavigatingState])
  {
    return [(MNNavigationService *)self navigationTransportType];
  }
  else
  {
    return [(MNNavigationService *)self desiredTransportType];
  }
}

@end