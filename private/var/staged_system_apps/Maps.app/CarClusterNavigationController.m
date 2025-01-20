@interface CarClusterNavigationController
- (ACCNavigationAccessory)accessory;
- (ACCNavigationAccessoryComponent)component;
- (BOOL)smartGuidanceActive;
- (BOOL)updateManeuverIndex:(unint64_t)a3 distanceToManeuver:(double)a4;
- (BOOL)updateManeuverIndices:(id)a3 distanceToManeuver:(double)a4;
- (BOOL)updateRemainingDistance:(double)a3;
- (BOOL)updateRemainingTime:(double)a3;
- (BOOL)updateRouteGuidanceState:(unsigned __int16)a3;
- (CarClusterNavigationController)initWithAccessory:(id)a3 component:(id)a4;
- (CarClusterUpdateRouteGuidance)currentACCNavRouteGuidance;
- (GEOComposedRoute)currentRoute;
- (MNETADisplayFormatter)etaDisplayFormatter;
- (MNGuidanceLaneInfo)latestLaneGuidanceInfo;
- (MNGuidanceSignInfo)latestSignInfo;
- (NSMutableArray)currentACCNavLaneGuidances;
- (NSMutableArray)currentACCNavManeuvers;
- (NSMutableDictionary)indexedSteps;
- (NSMutableSet)currentACCNavLaneGuidanceIndexes;
- (id)_destinationTimeZoneOffsetMinutes;
- (int)_roadClassAtLocation:(id)a3;
- (void)_updateRemainingTimeIfNeededWithDisplayFormatter:(id)a3 remainingSeconds:(double)a4;
- (void)_updateSecondaryManeuversIfNecessaryForGuidanceEvent:(id)a3 maneuver:(id)a4;
- (void)dealloc;
- (void)etaDisplayFormatter:(id)a3 didUpdateDisplayETA:(id)a4;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationService:(id)a3 didFailWithError:(id)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationServiceDidCancelReroute:(id)a3;
- (void)navigationServiceDidHideSecondaryStep:(id)a3;
- (void)navigationServiceEndGuidanceUpdate:(id)a3;
- (void)navigationServiceWillReroute:(id)a3;
- (void)sendLaneGuidance;
- (void)sendLaneGuidanceUpdate:(id)a3;
- (void)sendManeuverUpdate:(id)a3;
- (void)sendManeuvers;
- (void)sendRouteGuidance;
- (void)setAccessory:(id)a3;
- (void)setComponent:(id)a3;
- (void)setCurrentACCNavLaneGuidanceIndexes:(id)a3;
- (void)setCurrentACCNavLaneGuidances:(id)a3;
- (void)setCurrentACCNavManeuvers:(id)a3;
- (void)setCurrentACCNavRouteGuidance:(id)a3;
- (void)setCurrentRoute:(id)a3;
- (void)setEtaDisplayFormatter:(id)a3;
- (void)setIndexedSteps:(id)a3;
- (void)setLatestLaneGuidanceInfo:(id)a3;
- (void)setLatestSignInfo:(id)a3;
- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3;
@end

@implementation CarClusterNavigationController

- (CarClusterNavigationController)initWithAccessory:(id)a3 component:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CarClusterNavigationController;
  v9 = [(CarClusterNavigationController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_component, a4);
    v11 = objc_alloc_init(CarClusterUpdateRouteGuidance);
    currentACCNavRouteGuidance = v10->_currentACCNavRouteGuidance;
    v10->_currentACCNavRouteGuidance = v11;

    [(CarClusterUpdate *)v10->_currentACCNavRouteGuidance setComponent:v8];
    v13 = +[MNNavigationService sharedService];
    [v13 registerObserver:v10];
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  etaDisplayFormatter = self->_etaDisplayFormatter;
  if (etaDisplayFormatter) {
    [(MNETADisplayFormatter *)etaDisplayFormatter setDelegate:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)CarClusterNavigationController;
  [(CarClusterNavigationController *)&v5 dealloc];
}

- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  [v5 setBeingShownInApp:v3];

  [(CarClusterNavigationController *)self sendRouteGuidance];
}

- (BOOL)smartGuidanceActive
{
  v2 = [(GEOComposedRoute *)self->_currentRoute composedGuidanceEvents];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setCurrentRoute:(id)a3
{
  objc_super v5 = (GEOComposedRoute *)a3;
  if (self->_currentRoute != v5)
  {
    v35 = v5;
    objc_storeStrong((id *)&self->_currentRoute, a3);
    [(CarClusterNavigationController *)self setCurrentACCNavManeuvers:0];
    [(CarClusterNavigationController *)self setCurrentACCNavLaneGuidances:0];
    [(CarClusterNavigationController *)self setEtaDisplayFormatter:0];
    [(CarClusterNavigationController *)self setIndexedSteps:0];
    if (v35)
    {
      v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      unsigned int v7 = [v6 routeGuidanceState];

      if (!v7) {
        [(CarClusterNavigationController *)self updateRouteGuidanceState:3];
      }
      id v8 = objc_alloc((Class)MNETADisplayFormatter);
      v9 = +[MNNavigationService sharedService];
      v10 = [v9 upcomingStop];
      v11 = [v10 timezone];
      id v12 = [v8 initWithTimeZone:v11];
      [(CarClusterNavigationController *)self setEtaDisplayFormatter:v12];

      v13 = [(CarClusterNavigationController *)self etaDisplayFormatter];
      [v13 setDelegate:self];

      BOOL v14 = [(CarClusterNavigationController *)self smartGuidanceActive];
      objc_super v15 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v15 setSmartGuidanceActive:v14];

      v16 = [(GEOComposedRoute *)v35 composedGuidanceEventsWithSignGuidance];
      v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
      v18 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v18 setRouteGuidanceManeuverCount:v17];

      v19 = [(GEOComposedRoute *)v35 composedGuidanceEvents];
      v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
      v21 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v21 setLaneGuidanceTotalCount:v20];

      v22 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v22 setLaneGuidanceShowing:0];

      v23 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v23 setLaneGuidanceCurrentIndex:0];

      v24 = [(CarClusterNavigationController *)self _destinationTimeZoneOffsetMinutes];
      v25 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v25 setDestinationTimeZoneOffsetMinutes:v24];

      v26 = +[MNNavigationService sharedService];
      v27 = [v26 displayETAInfoForRoute:v35];

      double v28 = (double)(unint64_t)[v27 displayRemainingMinutesToEndOfLeg];
      v29 = [(CarClusterNavigationController *)self etaDisplayFormatter];
      [v29 setRemainingTimeToEndOfLeg:v28];

      v30 = +[MNNavigationService sharedService];
      v31 = [v30 remainingDistanceInfoForRoute:v35];

      [v31 distanceRemainingToEndOfLeg];
      -[CarClusterNavigationController updateRemainingDistance:](self, "updateRemainingDistance:");
      v32 = +[MNNavigationService sharedService];
      v33 = [v32 destinationName];
      v34 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v34 setDestinationName:v33];
    }
    [(CarClusterNavigationController *)self sendLaneGuidance];
    [(CarClusterNavigationController *)self sendManeuvers];
    [(CarClusterNavigationController *)self sendRouteGuidance];
    objc_super v5 = v35;
  }
}

- (BOOL)updateManeuverIndex:(unint64_t)a3 distanceToManeuver:(double)a4
{
  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  v9 = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:&v9 count:1];
  LOBYTE(self) = [(CarClusterNavigationController *)self updateManeuverIndices:v7 distanceToManeuver:a4];

  return (char)self;
}

- (BOOL)updateManeuverIndices:(id)a3 distanceToManeuver:(double)a4
{
  id v6 = a3;
  unsigned int v7 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  uint64_t v8 = [v7 routeGuidanceManeuverCurrentList];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    v11 = [v10 routeGuidanceManeuverCurrentList];
    unsigned __int8 v12 = +[MNComparison isValue:v11 equalTo:v6];

    if (v12)
    {
      BOOL v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v14 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  [v14 setRouteGuidanceManeuverCurrentList:v6];

  BOOL v13 = 1;
LABEL_6:
  objc_super v15 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  v16 = [v15 distanceRemainingToNextManeuver];
  [v16 doubleValue];
  double v18 = v17;

  if (v18 != a4)
  {
    v19 = +[NSNumber numberWithDouble:a4];
    v20 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v20 setDistanceRemainingToNextManeuver:v19];

    unsigned __int16 v27 = 0;
    id v26 = 0;
    +[CarClusterUpdate getStringValue:&v26 displayUnits:&v27 forRemainingDistance:a4];
    id v21 = v26;
    v22 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v22 setDistanceRemainingToNextManeuverDisplayString:v21];

    uint64_t v23 = v27;
    v24 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v24 setDistanceRemainingToNextManeuverDisplayUnits:v23];

    BOOL v13 = 1;
  }

  return v13;
}

- (id)_destinationTimeZoneOffsetMinutes
{
  v2 = [(GEOComposedRoute *)self->_currentRoute destination];
  BOOL v3 = [v2 timezone];

  v4 = +[NSDate date];
  objc_super v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)[v3 secondsFromGMTForDate:v4] / 60);

  return v5;
}

- (BOOL)updateRemainingTime:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  unsigned int v6 = [v5 routeGuidanceState];

  if (!v6) {
    return 0;
  }
  unsigned int v7 = [(CarClusterNavigationController *)self etaDisplayFormatter];
  [v7 displayRemainingTimeToEndOfLeg];
  double v9 = v8;

  v10 = [(CarClusterNavigationController *)self etaDisplayFormatter];
  v11 = [v10 displayETAToEndOfLeg];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  BOOL v14 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  objc_super v15 = [v14 timeRemainingToDestination];
  [v15 doubleValue];
  double v17 = v16;

  double v18 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  v19 = [v18 estimatedTimeOfArrival];
  [v19 doubleValue];
  double v21 = v20;

  if (v9 == v17 && v13 == v21) {
    return 0;
  }
  v22 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  [v22 updateRemainingTime:v9 estimatedTimeOfArrival:v13];

  return 1;
}

- (BOOL)updateRemainingDistance:(double)a3
{
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  unsigned int v6 = [v5 distanceRemaining];
  [v6 doubleValue];
  BOOL v8 = v7 != a3 && a3 >= 0.0;

  if (v8)
  {
    double v9 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v9 updateRemainingDistance:a3];
  }
  return v8;
}

- (BOOL)updateRouteGuidanceState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (a3 == 1)
  {
    objc_super v5 = [(CarClusterNavigationController *)self currentRoute];

    if (!v5) {
      return 0;
    }
  }
  unsigned int v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  unsigned int v7 = [v6 routeGuidanceState];

  if (v7 == v3) {
    return 0;
  }
  double v9 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  [v9 setRouteGuidanceState:v3];

  int v10 = v3 - 3;
  if (v3 >= 3)
  {
    v11 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v11 setCurrentRoadName:&stru_101324E70];

    if (v3 == 5) {
      [(CarClusterNavigationController *)self setCurrentRoute:0];
    }
    double v12 = [(CarClusterNavigationController *)self currentRoute];

    if (!v12)
    {
      double v13 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v13 setRouteGuidanceManeuverCount:&off_1013AAAE0];

      BOOL v14 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v14 setRouteGuidanceManeuverCurrentList:&off_1013AE778];

      objc_super v15 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v15 setManeuverState:3];

      double v16 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v16 setLaneGuidanceShowing:0];

      double v17 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v17 setLaneGuidanceTotalCount:&off_1013AAAF8];

      double v18 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v18 setLaneGuidanceCurrentIndex:&off_1013AAAF8];

      v19 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v19 setDestinationTimeZoneOffsetMinutes:&off_1013AAAF8];

      double v20 = objc_opt_new();
      double v21 = [(CarClusterNavigationController *)self component];
      [v20 setComponent:v21];

      v22 = &stru_101324E70;
      [v20 setAfterManeuverRoadName:&stru_101324E70];
      [v20 setManeuverType:0];
      switch(v10)
      {
        case 0:
          uint64_t v23 = +[NSBundle mainBundle];
          v24 = v23;
          CFStringRef v25 = @"ACCNav_RouteGuidance_Loading";
          goto LABEL_14;
        case 1:
          uint64_t v23 = +[NSBundle mainBundle];
          v24 = v23;
          CFStringRef v25 = @"ACCNav_RouteGuidance_Locating";
          goto LABEL_14;
        case 2:
          uint64_t v23 = +[NSBundle mainBundle];
          v24 = v23;
          CFStringRef v25 = @"ACCNav_RouteGuidance_Rerouting";
          goto LABEL_14;
        case 3:
          uint64_t v23 = +[NSBundle mainBundle];
          v24 = v23;
          CFStringRef v25 = @"ACCNav_RouteGuidance_ProceedToRoute";
LABEL_14:
          v22 = [v23 localizedStringForKey:v25 value:@"localized string not found" table:0];

          break;
        default:
          break;
      }
      [v20 setManeuverDescription:v22];
      [v20 setIndex:&off_1013AAAF8];
      [(CarClusterNavigationController *)self sendManeuverUpdate:v20];
    }
  }
  return 1;
}

- (void)sendRouteGuidance
{
  uint64_t v3 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = [(CarClusterNavigationController *)self accessory];
    unsigned int v6 = [v5 accessoryUID];
    unsigned int v7 = [(CarClusterNavigationController *)self component];
    id v8 = [v7 identifier];
    double v9 = [v3 logFormat];
    int v10 = [v3 accNavFormat];
    *(_DWORD *)buf = 138413058;
    double v17 = v6;
    __int16 v18 = 2048;
    id v19 = v8;
    __int16 v20 = 2112;
    double v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);
  }
  v11 = [(CarClusterNavigationController *)self accessory];
  double v12 = +[ACCNavigationInfoBuilder accNavigationRouteGuidanceUpdateInfoFrom:v3];
  double v13 = [(CarClusterNavigationController *)self component];
  objc_super v15 = v13;
  BOOL v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [v11 updateRouteGuidanceInfo:v12 componentList:v14];
}

- (void)sendManeuverUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavLaneGuidanceIndexes];
  unsigned int v6 = [v4 index];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = [v4 index];
    [v4 setLinkedLaneGuidanceInfo:v8];
  }
  double v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [(CarClusterNavigationController *)self accessory];
    v11 = [v10 accessoryUID];
    double v12 = [(CarClusterNavigationController *)self component];
    id v13 = [v12 identifier];
    BOOL v14 = [v4 logFormat];
    objc_super v15 = [v4 accNavFormat];
    *(_DWORD *)buf = 138413058;
    __int16 v22 = v11;
    __int16 v23 = 2048;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    double v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);
  }
  double v16 = [(CarClusterNavigationController *)self accessory];
  double v17 = +[ACCNavigationInfoBuilder accNavigationManeuverUpdateInfoFrom:v4];
  __int16 v18 = [(CarClusterNavigationController *)self component];
  __int16 v20 = v18;
  id v19 = +[NSArray arrayWithObjects:&v20 count:1];
  [v16 updateManeuverInfo:v17 componentList:v19];
}

- (void)sendLaneGuidanceUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = [(CarClusterNavigationController *)self accessory];
    unsigned int v7 = [v6 accessoryUID];
    id v8 = [(CarClusterNavigationController *)self component];
    id v9 = [v8 identifier];
    int v10 = [v4 logFormat];
    v11 = [v4 accNavFormat];
    *(_DWORD *)buf = 138413058;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);
  }
  double v12 = [(CarClusterNavigationController *)self accessory];
  id v13 = +[ACCNavigationInfoBuilder accNavigationLaneGuidanceInfoFrom:v4];
  BOOL v14 = [(CarClusterNavigationController *)self component];
  double v16 = v14;
  objc_super v15 = +[NSArray arrayWithObjects:&v16 count:1];
  [v12 updateLaneGuidanceInfo:v13 componentList:v15];
}

- (void)sendLaneGuidance
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];

  if (!v5)
  {
    unsigned int v6 = objc_opt_new();
    [(CarClusterNavigationController *)self setCurrentACCNavLaneGuidances:v6];

    unsigned int v7 = objc_opt_new();
    [(CarClusterNavigationController *)self setCurrentACCNavLaneGuidanceIndexes:v7];
  }
  id v8 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  v58 = [v8 valueForKey:@"index"];

  id v9 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  int v10 = [v9 firstObject];

  uint64_t v11 = [v10 index];
  if (v11)
  {
    double v12 = (void *)v11;
    id v13 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    BOOL v14 = [v13 laneGuidanceCurrentIndex];

    if (v14)
    {
      while (1)
      {
        objc_super v15 = [v10 index];
        id v16 = [v15 unsignedIntegerValue];
        double v17 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
        __int16 v18 = [v17 laneGuidanceCurrentIndex];
        id v19 = [v18 unsignedIntegerValue];

        if (v16 == v19) {
          break;
        }
        id v20 = [v10 index];
        [v3 addObject:v20];

        __int16 v21 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
        [v21 removeObjectAtIndex:0];

        __int16 v22 = [(CarClusterNavigationController *)self currentACCNavLaneGuidanceIndexes];
        __int16 v23 = [v10 index];
        [v22 removeObject:v23];

        id v24 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
        uint64_t v25 = [v24 firstObject];

        int v10 = (void *)v25;
      }
    }
  }
  id v26 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  __int16 v27 = [v26 lastObject];

  v57 = v27;
  double v28 = [v27 index];
  v29 = (char *)[v28 unsignedIntegerValue];

  v59 = v3;
  if ([(CarClusterNavigationController *)self smartGuidanceActive])
  {
    v30 = [(CarClusterNavigationController *)self currentRoute];
    v31 = [v30 composedGuidanceEvents];
  }
  else
  {
    v31 = 0;
  }
  v32 = [(CarClusterNavigationController *)self component];
  id v33 = [v32 laneGuidanceCapacity];

  v34 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  if ([v34 count] >= v33)
  {
LABEL_16:
  }
  else
  {
    v35 = v29 + 1;
    while (1)
    {
      v36 = (char *)[v31 count];

      if (v36 <= v35) {
        break;
      }
      v37 = [v31 objectAtIndexedSubscript:v35];
      v38 = [(CarClusterNavigationController *)self component];
      v39 = +[CarClusterUpdateLaneGuidance laneGuidanceUpdateWithComposedGuidanceEvent:v37 component:v38];

      v40 = +[NSNumber numberWithUnsignedInteger:v35];
      [v39 setIndex:v40];

      if (v39)
      {
        v41 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
        [v41 addObject:v39];

        v42 = [(CarClusterNavigationController *)self currentACCNavLaneGuidanceIndexes];
        v43 = [v39 index];
        [v42 addObject:v43];
      }
      v34 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
      ++v35;
      if ([v34 count] >= v33) {
        goto LABEL_16;
      }
    }
  }
  v44 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  v60 = [v44 valueForKey:@"index"];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v45 = [(CarClusterNavigationController *)self currentACCNavLaneGuidances];
  id v46 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v62;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (([v50 hasBeenSent] & 1) == 0)
        {
          [v50 setHasBeenSent:1];
          v51 = [v50 index];
          [v4 addObject:v51];

          [(CarClusterNavigationController *)self sendLaneGuidanceUpdate:v50];
        }
      }
      id v47 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v47);
  }

  v52 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    v53 = [v58 componentsJoinedByString:@", "];
    v54 = [v59 componentsJoinedByString:@", "];
    v55 = [v60 componentsJoinedByString:@", "];
    v56 = [v4 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    v66 = v53;
    __int16 v67 = 2112;
    v68 = v54;
    __int16 v69 = 2112;
    v70 = v55;
    __int16 v71 = 2112;
    v72 = v56;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "current=[%@] removed=[%@] newCurrent=[%@] sent=[%@]", buf, 0x2Au);
  }
}

- (void)sendManeuvers
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  objc_super v5 = [(CarClusterNavigationController *)self currentACCNavManeuvers];

  if (!v5)
  {
    unsigned int v6 = objc_opt_new();
    [(CarClusterNavigationController *)self setCurrentACCNavManeuvers:v6];

    unsigned int v7 = objc_opt_new();
    [(CarClusterNavigationController *)self setIndexedSteps:v7];
  }
  id v8 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  uint64_t v9 = [v8 valueForKey:@"index"];

  int v10 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  uint64_t v11 = [v10 firstObject];

  double v12 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  id v13 = [v12 firstIndex_RouteGuidanceManeuverCurrentList];

  if (v13 != (id)-1)
  {
    BOOL v14 = [v11 index];
    id v15 = [v14 unsignedIntegerValue];
    id v16 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    if (v15 == objc_msgSend(v16, "firstIndex_RouteGuidanceManeuverCurrentList"))
    {
      double v17 = v11;
LABEL_8:

      uint64_t v11 = v17;
    }
    else
    {
      while (1)
      {
        __int16 v18 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
        id v19 = [v18 count];

        if (!v19) {
          break;
        }
        id v20 = [v11 index];
        [v3 addObject:v20];

        __int16 v21 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
        [v21 removeObjectAtIndex:0];

        __int16 v22 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
        double v17 = [v22 firstObject];

        BOOL v14 = [v17 index];
        id v23 = [v14 unsignedIntegerValue];
        id v16 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
        uint64_t v11 = v17;
        if (v23 == objc_msgSend(v16, "firstIndex_RouteGuidanceManeuverCurrentList")) {
          goto LABEL_8;
        }
      }
    }
  }
  id v24 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  uint64_t v25 = [v24 lastObject];

  v59 = v25;
  if (v25)
  {
    id v26 = [v25 index];
    __int16 v27 = (char *)[v26 unsignedIntegerValue] + 1;
  }
  else
  {
    id v26 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    __int16 v27 = (char *)[v26 firstIndex_RouteGuidanceManeuverCurrentList];
  }

  unsigned int v28 = [(CarClusterNavigationController *)self smartGuidanceActive];
  v29 = [(CarClusterNavigationController *)self currentRoute];
  v30 = v29;
  long long v61 = v3;
  if (v28) {
    [v29 composedGuidanceEvents];
  }
  else {
  v31 = [v29 steps];
  }
  v60 = (void *)v9;

  v32 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  id v33 = [v32 count];
  v34 = [(CarClusterNavigationController *)self component];
  if (v33 >= [v34 guidanceManeuverCapacity])
  {
LABEL_23:
  }
  else
  {
    while (1)
    {
      v35 = (char *)[v31 count];

      if (v35 <= v27) {
        break;
      }
      if ([(CarClusterNavigationController *)self smartGuidanceActive])
      {
        v36 = [v31 objectAtIndexedSubscript:v27];
        v37 = [(CarClusterNavigationController *)self currentRoute];
        v38 = [v37 steps];
        v39 = [v38 objectAtIndexedSubscript:[v36 stepIndex]];

        v40 = [(CarClusterNavigationController *)self component];
        v41 = +[CarClusterUpdateManeuverInfo maneuverUpdateWithGuidanceEvent:v36 routeStep:v39 component:v40];

        v42 = +[NSNumber numberWithUnsignedInteger:v27];
        [v41 setIndex:v42];

        [(CarClusterNavigationController *)self _updateSecondaryManeuversIfNecessaryForGuidanceEvent:v36 maneuver:v41];
      }
      else
      {
        v36 = [v31 objectAtIndexedSubscript:v27];
        v39 = [(CarClusterNavigationController *)self component];
        v41 = +[CarClusterUpdateManeuverInfo maneuverUpdateWithStep:v36 component:v39];
      }

      if (v41)
      {
        v43 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
        [v43 addObject:v41];
      }
      ++v27;

      v32 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
      id v44 = [v32 count];
      v34 = [(CarClusterNavigationController *)self component];
      if (v44 >= [v34 guidanceManeuverCapacity]) {
        goto LABEL_23;
      }
    }
  }
  v45 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  v58 = [v45 valueForKey:@"index"];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v46 = [(CarClusterNavigationController *)self currentACCNavManeuvers];
  id v47 = [v46 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v63;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v63 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ((objc_msgSend(v51, "hasBeenSent", v58, v59) & 1) == 0)
        {
          if ([v51 isSecondary])
          {
            [v51 setDistanceBetweenManeuver:0];
            [v51 setDistanceBetweenManeuverDisplayString:0];
            [v51 setDistanceBetweenManeuverDisplayUnits:0xFFFFLL];
          }
          [v51 setHasBeenSent:1];
          v52 = [v51 index];
          [v4 addObject:v52];

          [(CarClusterNavigationController *)self sendManeuverUpdate:v51];
        }
      }
      id v48 = [v46 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v48);
  }

  v53 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = [v60 componentsJoinedByString:@", "];
    v55 = [v61 componentsJoinedByString:@", "];
    v56 = [v58 componentsJoinedByString:@", "];
    v57 = [v4 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    __int16 v67 = v54;
    __int16 v68 = 2112;
    __int16 v69 = v55;
    __int16 v70 = 2112;
    __int16 v71 = v56;
    __int16 v72 = 2112;
    v73 = v57;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "current=[%@] removed=[%@] newCurrent=[%@] sent=[%@]", buf, 0x2Au);
  }
}

- (void)_updateSecondaryManeuversIfNecessaryForGuidanceEvent:(id)a3 maneuver:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 stepIndex]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v7 = [(CarClusterNavigationController *)self indexedSteps];
    id v8 = [v7 objectForKeyedSubscript:v20];

    if (!v8)
    {
      uint64_t v9 = objc_opt_new();
      int v10 = [(CarClusterNavigationController *)self indexedSteps];
      [v10 setObject:v9 forKeyedSubscript:v20];
    }
    uint64_t v11 = [(CarClusterNavigationController *)self indexedSteps];
    double v12 = [v11 objectForKeyedSubscript:v20];
    [v12 addObject:v6];

    id v13 = [(CarClusterNavigationController *)self indexedSteps];
    BOOL v14 = [v13 objectForKeyedSubscript:v20];
    [v14 sortUsingComparator:&stru_10131B4C0];

    id v15 = [(CarClusterNavigationController *)self indexedSteps];
    id v16 = [v15 objectForKeyedSubscript:v20];
    id v17 = [v16 count];

    if ((unint64_t)v17 >= 2)
    {
      __int16 v18 = [(CarClusterNavigationController *)self indexedSteps];
      id v19 = [v18 objectForKeyedSubscript:v20];
      [v19 enumerateObjectsUsingBlock:&stru_10131B500];
    }
  }
}

- (int)_roadClassAtLocation:(id)a3
{
  int v8 = 0;
  int v9 = 9;
  id v4 = [a3 routeMatch];
  id v5 = [v4 routeCoordinate];

  id v6 = [(CarClusterNavigationController *)self currentRoute];
  [v6 getFormOfWay:&v8 roadClass:&v9 at:v5];

  return v9;
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v11 = a3;
  if (MNNavigationServiceStateChangedToNavigating())
  {
    unsigned int v7 = [v11 route];

    if (v7)
    {
      int v8 = [v11 route];
      [(CarClusterNavigationController *)self setCurrentRoute:v8];

      int v9 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      unsigned int v10 = [v9 routeGuidanceState];

      if (!v10) {
        [(CarClusterNavigationController *)self updateRouteGuidanceState:3];
      }
      goto LABEL_7;
    }
  }
  if (!a5 && [(CarClusterNavigationController *)self updateRouteGuidanceState:0]) {
LABEL_7:
  }
    [(CarClusterNavigationController *)self sendRouteGuidance];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (a5)
  {
    if (a5 == 4)
    {
      id v12 = v7;
      int v8 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      int v9 = v8;
      uint64_t v10 = 1;
    }
    else
    {
      if (a5 != 5) {
        goto LABEL_9;
      }
      id v12 = v7;
      int v8 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      int v9 = v8;
      uint64_t v10 = 0;
    }
    [v8 setBeingShownInApp:v10];
  }
  else
  {
    id v12 = v7;
    [(CarClusterNavigationController *)self updateRouteGuidanceState:0];
    id v11 = [(CarClusterNavigationController *)self etaDisplayFormatter];
    [v11 setDelegate:0];

    [(CarClusterNavigationController *)self setEtaDisplayFormatter:0];
    [(CarClusterNavigationController *)self setCurrentRoute:0];
  }
  [(CarClusterNavigationController *)self sendRouteGuidance];
  id v7 = v12;
LABEL_9:
}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 0, a4))
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  if ([(CarClusterNavigationController *)self updateRouteGuidanceState:+[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:*(void *)&a4]])
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v12 = a4;
  if ([v12 locationUnreliable])
  {
    id v5 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v5 setCurrentRoadName:&stru_101324E70];

    if (![(CarClusterNavigationController *)self smartGuidanceActive]) {
      goto LABEL_7;
    }
    id v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    id v7 = v6;
    uint64_t v8 = 9;
  }
  else
  {
    int v9 = [v12 roadName];
    uint64_t v10 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v10 setCurrentRoadName:v9];

    if (![(CarClusterNavigationController *)self smartGuidanceActive]) {
      goto LABEL_7;
    }
    uint64_t v11 = [(CarClusterNavigationController *)self _roadClassAtLocation:v12];
    id v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    id v7 = v6;
    uint64_t v8 = v11;
  }
  [v6 setManeuverRoadClass:v8];

LABEL_7:
  [(CarClusterNavigationController *)self sendRouteGuidance];
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = a4;
  if ([(CarClusterNavigationController *)self smartGuidanceActive]) {
    [(CarClusterNavigationController *)self setLatestSignInfo:v5];
  }
}

- (void)navigationServiceEndGuidanceUpdate:(id)a3
{
  if (![(CarClusterNavigationController *)self smartGuidanceActive]) {
    return;
  }
  id v18 = (id)objc_opt_new();
  id v4 = [(CarClusterNavigationController *)self latestSignInfo];
  id v5 = [v4 primarySign];

  if (v5)
  {
    id v6 = [(CarClusterNavigationController *)self latestSignInfo];
    id v7 = [v6 primarySign];
    uint64_t v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 composedGuidanceEventIndex]);
    [v18 addObject:v8];
  }
  int v9 = [(CarClusterNavigationController *)self latestSignInfo];
  uint64_t v10 = [v9 secondarySign];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)v10;
  id v12 = [(CarClusterNavigationController *)self component];
  id v13 = [v12 guidanceManeuverCapacity];

  if ((unint64_t)v13 >= 2)
  {
    int v9 = [(CarClusterNavigationController *)self latestSignInfo];
    BOOL v14 = [v9 secondarySign];
    id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 composedGuidanceEventIndex]);
    [v18 addObject:v15];

LABEL_7:
  }
  id v16 = [(CarClusterNavigationController *)self latestSignInfo];
  [v16 primaryDistance_SIRI_USE_ONLY];
  unsigned int v17 = -[CarClusterNavigationController updateManeuverIndices:distanceToManeuver:](self, "updateManeuverIndices:distanceToManeuver:", v18);

  if (v17)
  {
    [(CarClusterNavigationController *)self sendManeuvers];
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  if (a6 <= 1) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a6;
  }
  if (-[CarClusterNavigationController updateManeuverIndex:distanceToManeuver:](self, "updateManeuverIndex:distanceToManeuver:", v7, a5, a4))
  {
    [(CarClusterNavigationController *)self sendManeuvers];
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  int v9 = [(CarClusterNavigationController *)self currentRoute];

  if (v9)
  {
    unsigned __int8 v10 = [(CarClusterNavigationController *)self updateManeuverIndex:a6 distanceToManeuver:a4];
    unsigned int v11 = [(CarClusterNavigationController *)self updateRouteGuidanceState:1];
    if ((v10 & 1) != 0 || v11)
    {
      [(CarClusterNavigationController *)self sendManeuvers];
      [(CarClusterNavigationController *)self sendRouteGuidance];
    }
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v17 = a4;
  id v9 = a5;
  id v10 = a3;
  unsigned int v11 = [v17 routeID];
  id v12 = [v10 route];

  id v13 = [v12 uniqueRouteID];
  unsigned int v14 = [v11 isEqual:v13];

  if (v14)
  {
    double v15 = (double)(unint64_t)[v17 displayRemainingMinutesToEndOfLeg] * 60.0;
    id v16 = [(CarClusterNavigationController *)self etaDisplayFormatter];
    [v16 setRemainingTimeToEndOfLeg:v15];

    [v9 distanceRemainingToEndOfLeg];
    if (-[CarClusterNavigationController updateRemainingDistance:](self, "updateRemainingDistance:")) {
      [(CarClusterNavigationController *)self sendRouteGuidance];
    }
  }
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  if (-[CarClusterNavigationController updateManeuverIndex:distanceToManeuver:](self, "updateManeuverIndex:distanceToManeuver:", a9, (double)objc_msgSend(a4, "distance", a3)))
  {
    [(CarClusterNavigationController *)self sendManeuvers];
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  id v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  [v6 updateNavAnnouncementStage:a4];

  [(CarClusterNavigationController *)self sendRouteGuidance];
}

- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  [(CarClusterNavigationController *)self sendManeuvers];
  id v22 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  id v9 = [v22 routeGuidanceManeuverCurrentList];
  if ([v9 count] == (id)1)
  {
    id v10 = [(CarClusterNavigationController *)self component];
    id v11 = [v10 guidanceManeuverCapacity];

    if ((unint64_t)v11 >= 2)
    {
      id v12 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      id v13 = [v12 routeGuidanceManeuverCurrentList];
      unsigned int v14 = [v13 firstObject];
      double v15 = (char *)[v14 unsignedIntegerValue];

      id v16 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      id v17 = [v16 routeGuidanceManeuverCurrentList];
      id v18 = [v17 firstObject];
      v23[0] = v18;
      id v19 = +[NSNumber numberWithUnsignedInteger:v15 + 1];
      v23[1] = v19;
      id v20 = +[NSArray arrayWithObjects:v23 count:2];
      __int16 v21 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
      [v21 setRouteGuidanceManeuverCurrentList:v20];

      [(CarClusterNavigationController *)self sendRouteGuidance];
    }
  }
  else
  {
  }
}

- (void)navigationServiceDidHideSecondaryStep:(id)a3
{
  [(CarClusterNavigationController *)self sendManeuvers];
  id v4 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
  id v5 = [v4 routeGuidanceManeuverCurrentList];
  id v6 = [v5 count];

  if (v6 == (id)2)
  {
    unint64_t v7 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    uint64_t v8 = [v7 routeGuidanceManeuverCurrentList];
    id v9 = [v8 firstObject];
    id v12 = v9;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    id v11 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v11 setRouteGuidanceManeuverCurrentList:v10];

    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  unint64_t v7 = [a3 route];
  LODWORD(a5) = [v7 isLegIndexOfLastLeg:a5];

  if (a5 && [(CarClusterNavigationController *)self updateRouteGuidanceState:2])
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v12 = a4;
  id v5 = [(CarClusterNavigationController *)self latestLaneGuidanceInfo];
  id v6 = [v5 uniqueID];
  unint64_t v7 = [v12 uniqueID];
  unsigned __int8 v8 = +[MNComparison isValue:v6 equalTo:v7];

  if ((v8 & 1) == 0)
  {
    [(CarClusterNavigationController *)self setLatestLaneGuidanceInfo:v12];
    id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 composedGuidanceEventIndex]);
    id v10 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v10 setLaneGuidanceCurrentIndex:v9];

    id v11 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v11 setLaneGuidanceShowing:1];

    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  id v5 = [(CarClusterNavigationController *)self latestLaneGuidanceInfo];

  if (v5)
  {
    [(CarClusterNavigationController *)self setLatestLaneGuidanceInfo:0];
    id v6 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v6 setLaneGuidanceCurrentIndex:0];

    unint64_t v7 = [(CarClusterNavigationController *)self currentACCNavRouteGuidance];
    [v7 setLaneGuidanceShowing:0];

    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  if ([(CarClusterNavigationController *)self updateRouteGuidanceState:5])
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  [(CarClusterNavigationController *)self updateRouteGuidanceState:0];
  [(CarClusterNavigationController *)self sendRouteGuidance];
  [(CarClusterNavigationController *)self setCurrentRoute:v6];

  unint64_t v7 = +[MNNavigationService sharedService];
  uint64_t v8 = +[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:](CarClusterUpdate, "_accNavRouteGuidanceStateForGEONavigationState:", [v7 navigationState]);

  if ([(CarClusterNavigationController *)self updateRouteGuidanceState:v8])
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  id v4 = [a3 route];
  [(CarClusterNavigationController *)self setCurrentRoute:v4];

  id v5 = +[MNNavigationService sharedService];
  uint64_t v6 = +[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:](CarClusterUpdate, "_accNavRouteGuidanceStateForGEONavigationState:", [v5 navigationState]);

  if ([(CarClusterNavigationController *)self updateRouteGuidanceState:v6])
  {
    [(CarClusterNavigationController *)self sendRouteGuidance];
  }
}

- (void)etaDisplayFormatter:(id)a3 didUpdateDisplayETA:(id)a4
{
  id v6 = a3;
  -[CarClusterNavigationController _updateRemainingTimeIfNeededWithDisplayFormatter:remainingSeconds:](self, "_updateRemainingTimeIfNeededWithDisplayFormatter:remainingSeconds:", v6, (double)(unint64_t)[a4 displayRemainingMinutesToEndOfLeg] * 60.0);
}

- (void)_updateRemainingTimeIfNeededWithDisplayFormatter:(id)a3 remainingSeconds:(double)a4
{
  id v6 = a3;
  id v7 = [(CarClusterNavigationController *)self etaDisplayFormatter];

  if (v7 == v6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C03B30;
    block[3] = &unk_1012F0708;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)&a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (ACCNavigationAccessory)accessory
{
  return (ACCNavigationAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessory:(id)a3
{
}

- (ACCNavigationAccessoryComponent)component
{
  return (ACCNavigationAccessoryComponent *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponent:(id)a3
{
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (CarClusterUpdateRouteGuidance)currentACCNavRouteGuidance
{
  return (CarClusterUpdateRouteGuidance *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentACCNavRouteGuidance:(id)a3
{
}

- (NSMutableArray)currentACCNavManeuvers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentACCNavManeuvers:(id)a3
{
}

- (NSMutableArray)currentACCNavLaneGuidances
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentACCNavLaneGuidances:(id)a3
{
}

- (NSMutableSet)currentACCNavLaneGuidanceIndexes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentACCNavLaneGuidanceIndexes:(id)a3
{
}

- (NSMutableDictionary)indexedSteps
{
  return self->_indexedSteps;
}

- (void)setIndexedSteps:(id)a3
{
}

- (MNETADisplayFormatter)etaDisplayFormatter
{
  return (MNETADisplayFormatter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEtaDisplayFormatter:(id)a3
{
}

- (MNGuidanceSignInfo)latestSignInfo
{
  return (MNGuidanceSignInfo *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLatestSignInfo:(id)a3
{
}

- (MNGuidanceLaneInfo)latestLaneGuidanceInfo
{
  return (MNGuidanceLaneInfo *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLatestLaneGuidanceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestLaneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_latestSignInfo, 0);
  objc_storeStrong((id *)&self->_etaDisplayFormatter, 0);
  objc_storeStrong((id *)&self->_indexedSteps, 0);
  objc_storeStrong((id *)&self->_currentACCNavLaneGuidanceIndexes, 0);
  objc_storeStrong((id *)&self->_currentACCNavLaneGuidances, 0);
  objc_storeStrong((id *)&self->_currentACCNavManeuvers, 0);
  objc_storeStrong((id *)&self->_currentACCNavRouteGuidance, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_component, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end