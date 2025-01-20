@interface CarMetadataNavigationListener
- (BOOL)_isTurnByTurn:(unint64_t)a3;
- (CarMetadataNavigationListener)initWithDelegate:(id)a3;
- (double)_angleForGeoLaneDirection:(int)a3;
- (id)_attributedInstructionVariantsForGuidanceEvent:(id)a3 route:(id)a4;
- (id)_cpLaneGuidanceForGuidanceEvent:(id)a3;
- (id)_cpManeuverForGuidanceEvent:(id)a3 route:(id)a4;
- (id)_cpTravelEstimatesForGuidanceEvent:(id)a3 route:(id)a4;
- (id)_instructionVariantsForGuidanceEvent:(id)a3 route:(id)a4;
- (id)_measurementForDistanceInMeters:(double)a3;
- (id)_preconditioningInfo;
- (id)_symbolImageForGuidanceEvent:(id)a3;
- (int64_t)_maneuverStateForLocation:(id)a3 distanceToManeuver:(double)a4;
- (unint64_t)_cpConnectorTypeForConnectorType:(int)a3;
- (void)_startRouteGuidanceUpdatesWithRoute:(id)a3;
- (void)_stopRouteGuidanceUpdates;
- (void)_updateBeingShownInApp;
- (void)_updateForNewRoute:(id)a3;
- (void)_updatePreconditioningInfo;
- (void)_updateRouteGuidance:(id)a3;
- (void)_updateStringArgument:(id)a3 route:(id)a4 guidanceEvent:(id)a5;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationServiceDidFinishLocationUpdate:(id)a3;
@end

@implementation CarMetadataNavigationListener

- (CarMetadataNavigationListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarMetadataNavigationListener;
  v5 = [(CarMetadataNavigationListener *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[MNNavigationService sharedService];
    [v7 registerObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarMetadataNavigationListener;
  [(CarMetadataNavigationListener *)&v4 dealloc];
}

- (void)_startRouteGuidanceUpdatesWithRoute:(id)a3
{
  id v4 = a3;
  v5 = (CPRouteGuidance *)objc_alloc_init((Class)CPRouteGuidance);
  cpRouteGuidance = self->_cpRouteGuidance;
  self->_cpRouteGuidance = v5;

  [(CPRouteGuidance *)self->_cpRouteGuidance setSourceName:@"Apple Maps"];
  [(CPRouteGuidance *)self->_cpRouteGuidance setSourceSupportsRouteGuidance:1];
  v7 = sub_1005F3B50();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(CPRouteGuidance *)self->_cpRouteGuidance sourceName];
    unsigned int v9 = [(CPRouteGuidance *)self->_cpRouteGuidance sourceSupportsRouteGuidance];
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 1024;
    unsigned int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating CPRouteGuidance. Source name: %@, supports route guidance: %d", (uint8_t *)&v10, 0x12u);
  }
  self->_cpGuidanceState = 1;
  [(CarMetadataNavigationListener *)self _updateForNewRoute:v4];

  [(CarMetadataNavigationListener *)self _updateBeingShownInApp];
}

- (void)_stopRouteGuidanceUpdates
{
  activeManeuverGuidanceEvents = self->_activeManeuverGuidanceEvents;
  self->_activeManeuverGuidanceEvents = 0;

  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = 0;

  cpRouteGuidance = self->_cpRouteGuidance;
  self->_cpRouteGuidance = 0;

  id v6 = objc_alloc_init((Class)CPRouteGuidance);
  [v6 setGuidanceState:0];
  v7 = sub_1005F3B50();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopping CarPlay metadata updates.", v8, 2u);
  }

  [(CarMetadataNavigationListener *)self _updateRouteGuidance:v6];
}

- (void)_updateRouteGuidance:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = sub_1005F3B50();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [v4 _maps_description];
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updating CPRouteGuidance: %@", (uint8_t *)&v10, 0xCu);
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 navigationListener:self didUpdateRouteGuidance:v4];
  }
}

- (void)_updateBeingShownInApp
{
  v3 = +[MNNavigationService sharedService];
  id v4 = [v3 state];

  cpRouteGuidance = self->_cpRouteGuidance;

  [(CPRouteGuidance *)cpRouteGuidance setBeingShownInApp:v4 == (id)4];
}

- (BOOL)_isTurnByTurn:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)_measurementForDistanceInMeters:(double)a3
{
  v3 = +[NSLocale currentLocale];
  [v3 _navigation_distanceUsesMetricSystem];
  [v3 _navigation_useYardsForShortDistances];
  uint64_t v4 = MNInstructionsCalculateDistanceUnits();
  float v6 = v5;
  switch(v4)
  {
    case 0:
      uint64_t v7 = +[NSUnitLength meters];
      goto LABEL_9;
    case 1:
      uint64_t v7 = +[NSUnitLength kilometers];
      goto LABEL_9;
    case 2:
      uint64_t v7 = +[NSUnitLength yards];
      goto LABEL_9;
    case 3:
      uint64_t v7 = +[NSUnitLength feet];
      goto LABEL_9;
    case 4:
      goto LABEL_8;
    case 5:
      float v6 = v5 * 0.25;
LABEL_8:
      uint64_t v7 = +[NSUnitLength miles];
LABEL_9:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  id v9 = [objc_alloc((Class)NSMeasurement) initWithDoubleValue:v8 unit:v6];

  return v9;
}

- (void)_updateForNewRoute:(id)a3
{
  id v4 = a3;
  id v27 = +[NSMutableArray array];
  id v26 = +[NSMutableArray array];
  +[NSMutableDictionary dictionary];
  v29 = v4;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v4 composedGuidanceEvents];
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    int v8 = 0;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v11 = [(CarMetadataNavigationListener *)self _cpManeuverForGuidanceEvent:v10 route:v29];
        __int16 v12 = v11;
        if (v11)
        {
          [v11 setIndex:(unsigned __int16)v8];
          unsigned int v13 = objc_opt_new();
          [v13 setGuidanceEvent:v10];
          v14 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v12 index]);
          [v13 setCpIndex:v14];

          v15 = [v10 uniqueID];
          [v30 setObject:v13 forKeyedSubscript:v15];

          [v27 addObject:v12];
          ++v8;
        }
        v16 = [(CarMetadataNavigationListener *)self _cpLaneGuidanceForGuidanceEvent:v10];
        v17 = v16;
        if (v16)
        {
          int v18 = v7 + 1;
          [v16 setIndex:(unsigned __int16)v7];
          v19 = objc_opt_new();
          [v19 setGuidanceEvent:v10];
          v20 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v17 index]);
          [v19 setCpIndex:v20];

          v21 = [v10 uniqueID];
          [v30 setObject:v19 forKeyedSubscript:v21];

          [v26 addObject:v17];
          int v7 = v18;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  objc_storeStrong((id *)&self->_cpManeuvers, v27);
  objc_storeStrong((id *)&self->_cpLaneGuidances, v26);
  objc_storeStrong((id *)&self->_guidanceEventLookup, v30);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    [v24 navigationListener:self didUpdateManeuvers:self->_cpManeuvers laneGuidances:self->_cpLaneGuidances];
  }
  [(CarMetadataNavigationListener *)self _updatePreconditioningInfo];
}

- (id)_cpManeuverForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasSignGuidance])
  {
    id v8 = [v6 stepIndex];
    id v9 = [v7 steps];
    if (v8 >= [v9 count])
    {
      v11 = 0;
    }
    else
    {
      int v10 = [v7 steps];
      v11 = [v10 objectAtIndexedSubscript:[v6 stepIndex]];
    }
    unsigned int v13 = [v6 maneuverJunction];
    __int16 v12 = objc_opt_new();
    v14 = [(CarMetadataNavigationListener *)self _cpTravelEstimatesForGuidanceEvent:v6 route:v7];
    [v12 setInitialTravelEstimates:v14];

    v15 = [(CarMetadataNavigationListener *)self _instructionVariantsForGuidanceEvent:v6 route:v7];
    [v12 setInstructionVariants:v15];

    v16 = [(CarMetadataNavigationListener *)self _attributedInstructionVariantsForGuidanceEvent:v6 route:v7];
    [v12 setAttributedInstructionVariants:v16];

    v17 = [(CarMetadataNavigationListener *)self _symbolImageForGuidanceEvent:v6];
    [v12 setSymbolImage:v17];

    int v18 = [v6 roadName];
    if (v18)
    {
      v19 = [v6 roadName];
      v40 = v19;
      v20 = +[NSArray arrayWithObjects:&v40 count:1];
      [v12 setRoadFollowingManeuverVariants:v20];
    }
    else
    {
      [v12 setRoadFollowingManeuverVariants:0];
    }

    objc_msgSend(v12, "setManeuverType:", sub_10080055C((int)objc_msgSend(v6, "maneuverType")));
    objc_msgSend(v12, "setTrafficSide:", objc_msgSend(v6, "drivingSide") != 0);
    [v12 setJunctionType:[v13 junctionType] != 0];
    v21 = (char *)[v13 numElements];
    if (v21)
    {
      v22 = v21;
      id v38 = v7;
      id v39 = v6;
      char v23 = (char *)[v13 elements];
      id v24 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v13 numElements]);
      v25 = v23 + 12;
      do
      {
        int v26 = *((_DWORD *)v25 - 3);
        int v27 = *((_DWORD *)v25 - 1);
        char v28 = *v25;
        id v29 = objc_alloc((Class)NSMeasurement);
        double v30 = (double)v26;
        long long v31 = +[NSUnitAngle degrees];
        id v32 = [v29 initWithDoubleValue:v31 unit:v30];

        if ((v28 & 4) != 0 && v27 == 2) {
          [v12 setJunctionExitAngle:v32];
        }
        else {
          [v24 addObject:v32];
        }
        v25 += 16;

        --v22;
      }
      while (v22);
      [v12 setJunctionElementAngles:v24];

      id v7 = v38;
      id v6 = v39;
    }
    long long v33 = [v11 geoStep];
    long long v34 = [v33 exitNumber];

    if (v34)
    {
      v35 = [v6 shieldInfo];
      v36 = [v35 shield];

      if ([v36 length]) {
        [v12 setExitInfo:v36];
      }
    }
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

- (id)_cpTravelEstimatesForGuidanceEvent:(id)a3 route:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 distanceBetweenRouteCoordinate:[v5 startValidRouteCoordinate] andRouteCoordinate:[v5 endValidRouteCoordinate]];
  id v7 = GEORoundedMeasurementForDistance();
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v8 = [v5 startValidRouteCoordinate];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1005F4804;
  v14[3] = &unk_1012F1D60;
  id v9 = v5;
  id v15 = v9;
  id v10 = v6;
  id v16 = v10;
  v17 = &v18;
  [v10 iterateTravelTimeRangesFromRouteCoordinate:v8 etaRoute:0 handler:v14];
  id v11 = objc_alloc((Class)CPTravelEstimates);
  id v12 = [v11 initWithDistanceRemaining:v7 timeRemaining:v19[3]];

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)_instructionVariantsForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 secondarySignStrings];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005F498C;
  v13[3] = &unk_1012F1DB0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 _geo_map:v13];

  return v11;
}

- (id)_attributedInstructionVariantsForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 secondarySignStrings];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005F4B80;
  v13[3] = &unk_1012F1DD8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 _geo_map:v13];

  return v11;
}

- (id)_symbolImageForGuidanceEvent:(id)a3
{
  memset(__src, 0, sizeof(__src));
  id v3 = a3;
  MKDefaultGuidanceManeuverMetrics();
  [v3 maneuverType];
  [v3 drivingSide];

  id v4 = +[UIColor whiteColor];
  id v5 = +[UIColor lightGrayColor];
  memcpy(v11, __src, sizeof(v11));
  id v6 = MKManeuverArrowImage();

  id v7 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  id v8 = [v6 configuration];
  id v9 = [v8 configurationWithTraitCollection:v7];

  return v6;
}

- (id)_cpLaneGuidanceForGuidanceEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lanes];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 lanes];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005F4F80;
    v11[3] = &unk_1012F1E28;
    v11[4] = self;
    [v7 _geo_map:v11];

    id v9 = objc_opt_new();
    [v9 setLanes:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (double)_angleForGeoLaneDirection:(int)a3
{
  double result = 0.0;
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 256)
      {
        return 180.0;
      }
      else if (a3 == 128)
      {
        return -45.0;
      }
    }
    else if (a3 == 32)
    {
      return -135.0;
    }
    else if (a3 == 64)
    {
      return -90.0;
    }
  }
  else if (a3 > 7)
  {
    if (a3 == 8)
    {
      return 135.0;
    }
    else if (a3 == 16)
    {
      return -180.0;
    }
  }
  else if (a3 == 2)
  {
    return 45.0;
  }
  else if (a3 == 4)
  {
    return 90.0;
  }
  return result;
}

- (int64_t)_maneuverStateForLocation:(id)a3 distanceToManeuver:(double)a4
{
  id v5 = a3;
  if (qword_10160F250 != -1) {
    dispatch_once(&qword_10160F250, &stru_1012F1E48);
  }
  id v6 = [v5 routeMatch];
  id v7 = [v6 road];
  unsigned int v8 = [v7 roadClass];

  if (v8 - 2 > 6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_100F6FFB0[v8 - 2];
  }
  id v10 = +[NSLocale currentLocale];
  id v11 = [v10 objectForKey:NSLocaleMeasurementSystem];

  id v12 = [(id)qword_10160F248 objectForKeyedSubscript:v11];
  if (v12)
  {
    unsigned int v13 = +[NSNumber numberWithInteger:v9];
    id v14 = [v12 objectForKeyedSubscript:v13];

    if (v14)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      int64_t v16 = (int64_t)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v19, "count", (void)v25) == (id)2)
            {
              uint64_t v20 = [v19 objectAtIndexedSubscript:0];
              [v20 doubleValue];
              double v22 = v21;

              if (v22 > a4)
              {
                char v23 = [v19 objectAtIndexedSubscript:1];
                int64_t v16 = [v23 unsignedCharValue];

                goto LABEL_19;
              }
            }
          }
          int64_t v16 = (int64_t)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
    else
    {
      int64_t v16 = 0;
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (void)_updateStringArgument:(id)a3 route:(id)a4 guidanceEvent:(id)a5
{
  id v22 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v22 type] == 10)
  {
    id v9 = [v7 legIndexForStepIndex:[v8 stepIndex]];
    id v10 = [v7 legs];
    id v11 = [v10 count];

    if (v9 < v11)
    {
      id v12 = [v7 legs];
      unsigned int v13 = [v12 objectAtIndexedSubscript:v9];

      id v14 = [v22 token];
      unsigned int v15 = [v14 isEqualToString:@"{Name}"];

      if (v15)
      {
        int64_t v16 = [v13 destination];
        uint64_t v17 = [v16 navDisplayName];
      }
      else
      {
        uint64_t v18 = [v22 token];
        unsigned int v19 = [v18 isEqualToString:@"{Address}"];

        if (!v19)
        {
LABEL_8:

          goto LABEL_9;
        }
        int64_t v16 = [v13 destination];
        uint64_t v17 = [v16 navDisplayAddress];
      }
      uint64_t v20 = (void *)v17;
      double v21 = [v22 stringFormat];
      [v21 setOverrideValue:v20];

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_updatePreconditioningInfo
{
  id v4 = [(CarMetadataNavigationListener *)self _preconditioningInfo];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationListener:self didUpdatePreconditioningInfo:v4];
}

- (id)_preconditioningInfo
{
  id v3 = +[MNNavigationService sharedService];
  id v4 = [v3 route];
  id v5 = sub_1005F3B50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v29 = [v4 isEVRoute];
    __int16 v30 = 1024;
    unsigned int v31 = [v3 targetLegIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating preconditioning info. Is EV route: %d, target leg index: %d", buf, 0xEu);
  }

  if ([v4 isEVRoute])
  {
    id v6 = [v3 targetLegIndex];
    id v7 = [v4 legs];
    id v8 = [v7 count];

    if (v6 >= v8)
    {
      id v10 = sub_1005F3B50();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned int v23 = [v3 targetLegIndex];
        id v24 = [v4 legs];
        unsigned int v25 = [v24 count];
        *(_DWORD *)buf = 67109376;
        unsigned int v29 = v23;
        __int16 v30 = 1024;
        unsigned int v31 = v25;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Target leg index (%d) on navigation service is out of bounds of current route (%d legs).", buf, 0xEu);
      }
      id v11 = 0;
    }
    else
    {
      id v9 = [v4 legs];
      id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v3, "targetLegIndex"));

      id v11 = objc_opt_new();
      id v12 = [v4 batteryLevelForStepIndex:[v10 endStepIndex]];
      [v11 setArrivalBatteryLevel:v12];

      unsigned int v13 = [v4 steps];
      id v14 = [v13 lastObject];
      unsigned int v15 = [v4 batteryLevelForStepIndex:[v14 stepIndex]];
      [v11 setFinalWaypointBatteryLevel:v15];

      int64_t v16 = [v10 nextLeg];
      uint64_t v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v4 batteryLevelForStepIndex:[v16 startStepIndex]];
        [v11 setDepartureBatteryLevel:v18];
      }
      unsigned int v19 = [v4 mutableData];
      uint64_t v20 = [v19 chargingStationInfoForLegIndex:[v10 legIndex]];

      double v21 = [v20 supportedChargerPlugs];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1005F5BEC;
      v27[3] = &unk_1012F1E70;
      v27[4] = self;
      id v22 = sub_100099700(v21, v27);
      [v11 setConnectors:v22];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)_cpConnectorTypeForConnectorType:(int)a3
{
  if (a3 > 0xA) {
    return 3;
  }
  else {
    return qword_100F6FFE8[a3];
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v10 = a3;
  cpRouteGuidance = self->_cpRouteGuidance;
  if (![(CarMetadataNavigationListener *)self _isTurnByTurn:a5])
  {
    if (!cpRouteGuidance) {
      goto LABEL_9;
    }
LABEL_8:
    [(CarMetadataNavigationListener *)self _stopRouteGuidanceUpdates];
    goto LABEL_9;
  }
  unsigned int v8 = [v10 navigationTransportType];
  if ((cpRouteGuidance == 0) == (v8 == 0))
  {
    if (!v8)
    {
      id v9 = [v10 route];
      [(CarMetadataNavigationListener *)self _startRouteGuidanceUpdatesWithRoute:v9];

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v8) {
    [(CarMetadataNavigationListener *)self _updateBeingShownInApp];
  }
LABEL_9:
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  char v4 = a4 - 1;
  if (a4 - 1) <= 6 && ((0x73u >> v4)) {
    self->_cpGuidanceState = 0x2020501010106uLL >> (8 * v4);
  }
}

- (void)navigationServiceDidFinishLocationUpdate:(id)a3
{
  id v4 = a3;
  cpRouteGuidance = self->_cpRouteGuidance;
  if (cpRouteGuidance)
  {
    [(CPRouteGuidance *)cpRouteGuidance setGuidanceState:self->_cpGuidanceState];
    id v6 = [v4 lastLocation];
    id v7 = [v6 roadName];
    if (v7)
    {
      unsigned int v8 = [v6 roadName];
      v45 = v8;
      id v9 = +[NSArray arrayWithObjects:&v45 count:1];
      [(CPRouteGuidance *)self->_cpRouteGuidance setCurrentRoadNameVariants:v9];
    }
    else
    {
      [(CPRouteGuidance *)self->_cpRouteGuidance setCurrentRoadNameVariants:0];
    }

    id v10 = [v4 route];
    id v11 = (char *)[v4 targetLegIndex];
    id v12 = [v10 legs];
    unsigned int v13 = (char *)[v12 count];

    if (v11 >= v13)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = 0;
      do
      {
        unsigned int v15 = [v10 legs];
        int64_t v16 = [v15 objectAtIndexedSubscript:v11];

        uint64_t v17 = [v16 destination];
        uint64_t v18 = [v17 navDisplayName];

        if (v18)
        {
          if (!v14)
          {
            id v14 = +[NSMutableArray array];
          }
          [v14 addObject:v18];
        }

        ++v11;
        unsigned int v19 = [v10 legs];
        uint64_t v20 = (char *)[v19 count];
      }
      while (v11 < v20);
    }
    [(CPRouteGuidance *)self->_cpRouteGuidance setDestinationNameVariants:v14];
    double v21 = [v4 displayEtaInfo];
    id v22 = [v21 legInfos];
    unsigned int v23 = [v22 firstObject];

    -[CPRouteGuidance setTimeRemaining:](self->_cpRouteGuidance, "setTimeRemaining:", (double)(unint64_t)(60 * (void)[v23 remainingMinutes]));
    id v24 = [v23 eta];
    [(CPRouteGuidance *)self->_cpRouteGuidance setEstimatedTimeOfArrival:v24];

    unsigned int v25 = [v23 timeZone];
    unsigned int v26 = [v25 secondsFromGMT];
    [(CPRouteGuidance *)self->_cpRouteGuidance setDestinationTimeZoneOffsetMinutes:((__int16)((34953 * (__int16)v26) >> 16) >> 5)+ (((v26 + ((-30583 * (__int16)v26) >> 16)) & 0x8000) >> 15)];

    long long v27 = [v4 remainingDistanceInfo];
    [v27 distanceRemainingToEndOfLeg];
    double v29 = v28;

    id v30 = objc_alloc((Class)NSMeasurement);
    unsigned int v31 = +[NSUnitLength meters];
    id v32 = [v30 initWithDoubleValue:v31 unit:v29];
    [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemaining:v32];

    long long v33 = [(CarMetadataNavigationListener *)self _measurementForDistanceInMeters:v29];
    [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemainingDisplay:v33];

    long long v34 = [(NSArray *)self->_activeManeuverGuidanceEvents firstObject];
    v44 = v6;
    if (v34)
    {
      if ([v4 navigationState] == 2)
      {
        [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemainingToNextManeuver:self->_remainingDistanceToManeuver];
        [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemainingToNextManeuverDisplay:self->_displayRemainingDistanceToManeuver];
        [(NSMeasurement *)self->_remainingDistanceToManeuver doubleValue];
        -[CPRouteGuidance setManeuverState:](self->_cpRouteGuidance, "setManeuverState:", -[CarMetadataNavigationListener _maneuverStateForLocation:distanceToManeuver:](self, "_maneuverStateForLocation:distanceToManeuver:", v6));
      }
      else if ([v4 navigationState] == 1)
      {
        v35 = [v6 routeMatch];
        [v35 distanceFromRoute];
        v36 = +[NSMeasurement _geo_distanceMeasurementForMeters:](NSMeasurement, "_geo_distanceMeasurementForMeters:");

        [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemainingToNextManeuver:v36];
        v37 = GEORoundedDistanceMeasurement();
        [(CPRouteGuidance *)self->_cpRouteGuidance setDistanceRemainingToNextManeuverDisplay:v37];
      }
    }
    id v38 = [(NSArray *)self->_activeManeuverGuidanceEvents _geo_map:&stru_1012F1EB0];
    [(CPRouteGuidance *)self->_cpRouteGuidance setCurrentManeuverIndexes:v38];
    id v39 = self->_cpRouteGuidance;
    if (self->_activeLaneGuidanceEvent)
    {
      [(CPRouteGuidance *)v39 setLaneGuidanceShowing:1];
      v40 = [(_CarMetadataGuidanceEventPair *)self->_activeLaneGuidanceEvent cpIndex];
      -[CPRouteGuidance setCurrentLaneGuidanceIndex:](self->_cpRouteGuidance, "setCurrentLaneGuidanceIndex:", (unsigned __int16)[v40 intValue]);
    }
    else
    {
      [(CPRouteGuidance *)v39 setLaneGuidanceShowing:0];
    }
    [(CPRouteGuidance *)self->_cpRouteGuidance setTotalManeuverCount:(unsigned __int16)[(NSArray *)self->_cpManeuvers count]];
    [(CPRouteGuidance *)self->_cpRouteGuidance setTotalLaneGuidanceCount:(unsigned __int16)[(NSArray *)self->_cpLaneGuidances count]];
    v41 = [v4 nextWaypoint];
    if ([v10 isEVRoute]
      && ([v41 chargingInfo], v42 = objc_claimAutoreleasedReturnValue(), v42, v42))
    {
      if ([v41 isServerProvidedWaypoint]) {
        unsigned __int8 v43 = 3;
      }
      else {
        unsigned __int8 v43 = 2;
      }
    }
    else
    {
      unsigned __int8 v43 = 0;
    }
    [(CPRouteGuidance *)self->_cpRouteGuidance setStopType:v43];
    [(CarMetadataNavigationListener *)self _updateRouteGuidance:self->_cpRouteGuidance];
  }
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v20 = a4;
  id v5 = +[NSMutableArray array];
  id v6 = [v20 primarySign];
  id v7 = [v6 uniqueID];

  if (v7)
  {
    unsigned int v8 = [(NSDictionary *)self->_guidanceEventLookup objectForKeyedSubscript:v7];
    if (v8) {
      [(NSArray *)v5 addObject:v8];
    }
  }
  id v9 = [v20 secondarySign];
  id v10 = [v9 uniqueID];

  if (v10)
  {
    id v11 = [(NSDictionary *)self->_guidanceEventLookup objectForKeyedSubscript:v10];
    if (v11) {
      [(NSArray *)v5 addObject:v11];
    }
  }
  activeManeuverGuidanceEvents = self->_activeManeuverGuidanceEvents;
  self->_activeManeuverGuidanceEvents = v5;
  unsigned int v13 = v5;

  id v14 = [v20 primarySign];
  [v14 remainingDistance];
  +[NSMeasurement _geo_distanceMeasurementForMeters:](NSMeasurement, "_geo_distanceMeasurementForMeters:");
  unsigned int v15 = (NSMeasurement *)objc_claimAutoreleasedReturnValue();
  remainingDistanceToManeuver = self->_remainingDistanceToManeuver;
  self->_remainingDistanceToManeuver = v15;

  uint64_t v17 = [v20 primarySign];
  uint64_t v18 = [v17 displayRemainingDistance];
  displayRemainingDistanceToManeuver = self->_displayRemainingDistanceToManeuver;
  self->_displayRemainingDistanceToManeuver = v18;
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  [a4 uniqueID:a3];
  id v5 = (_CarMetadataGuidanceEventPair *)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  if (v5)
  {
    id v5 = [(NSDictionary *)self->_guidanceEventLookup objectForKeyedSubscript:v5];
  }
  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = v5;
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = 0;
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v12 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4)
  {
    [(CarMetadataNavigationListener *)self _stopRouteGuidanceUpdates];
  }
  else if (self->_cpRouteGuidance)
  {
    [(CarMetadataNavigationListener *)self _updateForNewRoute:v10];
  }
  else
  {
    [(CarMetadataNavigationListener *)self _startRouteGuidanceUpdatesWithRoute:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_displayRemainingDistanceToManeuver, 0);
  objc_storeStrong((id *)&self->_remainingDistanceToManeuver, 0);
  objc_storeStrong((id *)&self->_activeManeuverGuidanceEvents, 0);
  objc_storeStrong((id *)&self->_guidanceEventLookup, 0);
  objc_storeStrong((id *)&self->_cpLaneGuidances, 0);
  objc_storeStrong((id *)&self->_cpManeuvers, 0);
  objc_storeStrong((id *)&self->_cpRouteGuidance, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end