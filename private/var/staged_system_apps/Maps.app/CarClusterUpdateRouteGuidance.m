@interface CarClusterUpdateRouteGuidance
+ (id)_enumProperties;
+ (id)_integersKeyed;
- (BOOL)beingShownInApp;
- (BOOL)laneGuidanceShowing;
- (BOOL)smartGuidanceActive;
- (BOOL)sourceSupportsRouteGuidance;
- (CarClusterUpdateRouteGuidance)init;
- (NSArray)routeGuidanceManeuverCurrentList;
- (NSNumber)destinationTimeZoneOffsetMinutes;
- (NSNumber)distanceRemaining;
- (NSNumber)distanceRemainingToNextManeuver;
- (NSNumber)estimatedTimeOfArrival;
- (NSNumber)laneGuidanceCurrentIndex;
- (NSNumber)laneGuidanceTotalCount;
- (NSNumber)routeGuidanceManeuverCount;
- (NSNumber)timeRemainingToDestination;
- (NSString)currentRoadName;
- (NSString)destinationName;
- (NSString)distanceRemainingDisplayString;
- (NSString)distanceRemainingToNextManeuverDisplayString;
- (NSString)sourceName;
- (int)maneuverRoadClass;
- (unint64_t)_accNavManeuverRoadClass;
- (unint64_t)_accNavUnitType;
- (unint64_t)firstIndex_RouteGuidanceManeuverCurrentList;
- (unsigned)distanceRemainingDisplayUnits;
- (unsigned)distanceRemainingToNextManeuverDisplayUnits;
- (unsigned)maneuverState;
- (unsigned)routeGuidanceState;
- (void)_updateManeuverState;
- (void)setBeingShownInApp:(BOOL)a3;
- (void)setCurrentRoadName:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDestinationTimeZoneOffsetMinutes:(id)a3;
- (void)setDistanceRemaining:(id)a3;
- (void)setDistanceRemainingDisplayString:(id)a3;
- (void)setDistanceRemainingDisplayUnits:(unsigned __int16)a3;
- (void)setDistanceRemainingToNextManeuver:(id)a3;
- (void)setDistanceRemainingToNextManeuverDisplayString:(id)a3;
- (void)setDistanceRemainingToNextManeuverDisplayUnits:(unsigned __int16)a3;
- (void)setEstimatedTimeOfArrival:(id)a3;
- (void)setLaneGuidanceCurrentIndex:(id)a3;
- (void)setLaneGuidanceShowing:(BOOL)a3;
- (void)setLaneGuidanceTotalCount:(id)a3;
- (void)setManeuverRoadClass:(int)a3;
- (void)setManeuverState:(unsigned __int16)a3;
- (void)setRouteGuidanceManeuverCount:(id)a3;
- (void)setRouteGuidanceManeuverCurrentList:(id)a3;
- (void)setRouteGuidanceState:(unsigned __int16)a3;
- (void)setSmartGuidanceActive:(BOOL)a3;
- (void)setSourceName:(id)a3;
- (void)setTimeRemainingToDestination:(id)a3;
- (void)updateNavAnnouncementStage:(unint64_t)a3;
- (void)updateRemainingDistance:(double)a3;
- (void)updateRemainingTime:(double)a3 estimatedTimeOfArrival:(double)a4;
@end

@implementation CarClusterUpdateRouteGuidance

- (CarClusterUpdateRouteGuidance)init
{
  v3.receiver = self;
  v3.super_class = (Class)CarClusterUpdateRouteGuidance;
  result = [(CarClusterUpdateRouteGuidance *)&v3 init];
  if (result)
  {
    result->_smartGuidanceActive = 1;
    result->_routeGuidanceState = -1;
    result->_maneuverState = -1;
    result->_distanceRemainingDisplayUnits = -1;
    result->_distanceRemainingToNextManeuverDisplayUnits = -1;
    result->_beingShownInApp = 1;
    result->_maneuverRoadClass = 9;
    result->_laneGuidanceShowing = 0;
    result->_sourceSupportsRouteGuidance = 1;
  }
  return result;
}

- (void)updateRemainingTime:(double)a3 estimatedTimeOfArrival:(double)a4
{
  v6 = +[NSNumber numberWithDouble:a3];
  [(CarClusterUpdateRouteGuidance *)self setTimeRemainingToDestination:v6];

  id v7 = +[NSNumber numberWithDouble:a4];
  [(CarClusterUpdateRouteGuidance *)self setEstimatedTimeOfArrival:v7];
}

- (void)updateRemainingDistance:(double)a3
{
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(CarClusterUpdateRouteGuidance *)self setDistanceRemaining:v5];

  unsigned __int16 v8 = 0;
  id v7 = 0;
  +[CarClusterUpdate getStringValue:&v7 displayUnits:&v8 forRemainingDistance:a3];
  id v6 = v7;
  [(CarClusterUpdateRouteGuidance *)self setDistanceRemainingDisplayString:v6];
  [(CarClusterUpdateRouteGuidance *)self setDistanceRemainingDisplayUnits:v8];
}

- (void)updateNavAnnouncementStage:(unint64_t)a3
{
  uint64_t v4 = +[CarClusterUpdate _accNavManeuverStateForGEONavigationAnnouncementStage:a3];

  [(CarClusterUpdateRouteGuidance *)self setManeuverState:v4];
}

- (unint64_t)firstIndex_RouteGuidanceManeuverCurrentList
{
  v2 = [(CarClusterUpdateRouteGuidance *)self routeGuidanceManeuverCurrentList];
  objc_super v3 = [v2 firstObject];

  if (v3) {
    unint64_t v4 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (void)setManeuverRoadClass:(int)a3
{
  if (self->_maneuverRoadClass != a3) {
    self->_maneuverRoadClass = a3;
  }
}

- (void)setRouteGuidanceState:(unsigned __int16)a3
{
  if (self->_routeGuidanceState != a3)
  {
    if (a3)
    {
      v5 = +[NSBundle mainBundle];
      id v6 = [v5 localizedStringForKey:@"Apple Maps [iAP Metadata]" value:@"localized string not found" table:0];
      [(CarClusterUpdateRouteGuidance *)self setSourceName:v6];
    }
    else
    {
      [(CarClusterUpdate *)self resetProperties];
    }
    self->_routeGuidanceState = a3;
  }
}

- (void)setCurrentRoadName:(id)a3
{
  unint64_t v4 = [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  currentRoadName = self->_currentRoadName;
  self->_currentRoadName = v4;
}

- (void)setDestinationName:(id)a3
{
  unint64_t v4 = [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  destinationName = self->_destinationName;
  self->_destinationName = v4;
}

- (void)setDistanceRemaining:(id)a3
{
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 integerValue]);
  unint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  distanceRemaining = self->_distanceRemaining;
  self->_distanceRemaining = v4;
}

- (unint64_t)_accNavUnitType
{
  unsigned __int16 v2 = [(CarClusterUpdateRouteGuidance *)self distanceRemainingToNextManeuverDisplayUnits]- 1;
  if (v2 > 3u) {
    return 1;
  }
  else {
    return qword_100F71DA0[(__int16)v2];
  }
}

- (unint64_t)_accNavManeuverRoadClass
{
  unsigned int v2 = [(CarClusterUpdateRouteGuidance *)self maneuverRoadClass] - 2;
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_100F71DC0[v2];
  }
}

- (void)_updateManeuverState
{
  if ([(CarClusterUpdateRouteGuidance *)self smartGuidanceActive])
  {
    objc_super v3 = [(CarClusterUpdateRouteGuidance *)self distanceRemainingToNextManeuver];

    if (v3)
    {
      if (qword_10160F760 != -1) {
        dispatch_once(&qword_10160F760, &stru_1012F7538);
      }
      unint64_t v4 = [(CarClusterUpdateRouteGuidance *)self _accNavManeuverRoadClass];
      unint64_t v5 = [(CarClusterUpdateRouteGuidance *)self _accNavUnitType];
      id v6 = (void *)qword_10160F758;
      id v7 = +[NSNumber numberWithUnsignedInteger:v4];
      unsigned __int16 v8 = [v6 objectForKeyedSubscript:v7];
      v9 = +[NSNumber numberWithUnsignedInteger:v5];
      v10 = [v8 objectForKeyedSubscript:v9];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v11 = [v10 allKeys];
      v12 = [v11 sortedArrayUsingSelector:"compare:"];

      id obj = v12;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v13)
      {
        unint64_t v22 = v5;
        unint64_t v23 = v4;
        uint64_t v14 = *(void *)v26;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v17 = [v10 objectForKeyedSubscript:v16];
            v18 = [(CarClusterUpdateRouteGuidance *)self distanceRemainingToNextManeuver];
            id v19 = [v18 integerValue];
            id v20 = [v17 integerValue];

            if ((uint64_t)v19 >= (uint64_t)v20)
            {
              LOWORD(v13) = (unsigned __int16)[v16 integerValue];

              goto LABEL_15;
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v13) {
            continue;
          }
          break;
        }
LABEL_15:
        unint64_t v5 = v22;
        unint64_t v4 = v23;
      }

      v21 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v30 = v4;
        __int16 v31 = 2048;
        unint64_t v32 = v5;
        __int16 v33 = 2048;
        uint64_t v34 = (unsigned __int16)v13;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "roadClass=%lu unitType=%lu maneuverState=%lu", buf, 0x20u);
      }

      [(CarClusterUpdateRouteGuidance *)self setManeuverState:(unsigned __int16)v13];
    }
    else
    {
      [(CarClusterUpdateRouteGuidance *)self setManeuverState:0xFFFFLL];
    }
  }
}

- (void)setDistanceRemainingToNextManeuver:(id)a3
{
  if (a3)
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 integerValue]);
    unint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    distanceRemainingToNextManeuver = self->_distanceRemainingToNextManeuver;
    self->_distanceRemainingToNextManeuver = v4;
  }
  else
  {
    distanceRemainingToNextManeuver = self->_distanceRemainingToNextManeuver;
    self->_distanceRemainingToNextManeuver = 0;
  }

  [(CarClusterUpdateRouteGuidance *)self _updateManeuverState];
}

- (void)setLaneGuidanceCurrentIndex:(id)a3
{
  if (a3)
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 unsignedIntegerValue]);
    unint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    self->_laneGuidanceCurrentIndex = v4;
  }
  else
  {
    self->_laneGuidanceCurrentIndex = 0;
  }
}

- (void)setLaneGuidanceTotalCount:(id)a3
{
  if (a3)
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 unsignedIntegerValue]);
    unint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    self->_laneGuidanceTotalCount = v4;
  }
  else
  {
    self->_laneGuidanceTotalCount = 0;
  }
}

+ (id)_enumProperties
{
  if (qword_10160F768 != -1) {
    dispatch_once(&qword_10160F768, &stru_1012F7558);
  }
  unsigned int v2 = (void *)qword_10160F770;

  return v2;
}

+ (id)_integersKeyed
{
  if (qword_10160F778 != -1) {
    dispatch_once(&qword_10160F778, &stru_1012F7578);
  }
  unsigned int v2 = (void *)qword_10160F780;

  return v2;
}

- (BOOL)smartGuidanceActive
{
  return self->_smartGuidanceActive;
}

- (void)setSmartGuidanceActive:(BOOL)a3
{
  self->_smartGuidanceActive = a3;
}

- (int)maneuverRoadClass
{
  return self->_maneuverRoadClass;
}

- (unsigned)routeGuidanceState
{
  return self->_routeGuidanceState;
}

- (unsigned)maneuverState
{
  return self->_maneuverState;
}

- (void)setManeuverState:(unsigned __int16)a3
{
  self->_maneuverState = a3;
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (NSNumber)estimatedTimeOfArrival
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEstimatedTimeOfArrival:(id)a3
{
}

- (NSNumber)timeRemainingToDestination
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeRemainingToDestination:(id)a3
{
}

- (NSNumber)distanceRemaining
{
  return self->_distanceRemaining;
}

- (NSString)distanceRemainingDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDistanceRemainingDisplayString:(id)a3
{
}

- (unsigned)distanceRemainingDisplayUnits
{
  return self->_distanceRemainingDisplayUnits;
}

- (void)setDistanceRemainingDisplayUnits:(unsigned __int16)a3
{
  self->_distanceRemainingDisplayUnits = a3;
}

- (NSNumber)distanceRemainingToNextManeuver
{
  return self->_distanceRemainingToNextManeuver;
}

- (NSString)distanceRemainingToNextManeuverDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDistanceRemainingToNextManeuverDisplayString:(id)a3
{
}

- (unsigned)distanceRemainingToNextManeuverDisplayUnits
{
  return self->_distanceRemainingToNextManeuverDisplayUnits;
}

- (void)setDistanceRemainingToNextManeuverDisplayUnits:(unsigned __int16)a3
{
  self->_distanceRemainingToNextManeuverDisplayUnits = a3;
}

- (NSArray)routeGuidanceManeuverCurrentList
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRouteGuidanceManeuverCurrentList:(id)a3
{
}

- (NSNumber)routeGuidanceManeuverCount
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRouteGuidanceManeuverCount:(id)a3
{
}

- (BOOL)beingShownInApp
{
  return self->_beingShownInApp;
}

- (void)setBeingShownInApp:(BOOL)a3
{
  self->_beingShownInApp = a3;
}

- (NSNumber)laneGuidanceCurrentIndex
{
  return self->_laneGuidanceCurrentIndex;
}

- (NSNumber)laneGuidanceTotalCount
{
  return self->_laneGuidanceTotalCount;
}

- (BOOL)laneGuidanceShowing
{
  return self->_laneGuidanceShowing;
}

- (void)setLaneGuidanceShowing:(BOOL)a3
{
  self->_laneGuidanceShowing = a3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
}

- (BOOL)sourceSupportsRouteGuidance
{
  return self->_sourceSupportsRouteGuidance;
}

- (NSNumber)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationTimeZoneOffsetMinutes, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_routeGuidanceManeuverCount, 0);
  objc_storeStrong((id *)&self->_routeGuidanceManeuverCurrentList, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuverDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuver, 0);
  objc_storeStrong((id *)&self->_distanceRemainingDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_timeRemainingToDestination, 0);
  objc_storeStrong((id *)&self->_estimatedTimeOfArrival, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);

  objc_storeStrong((id *)&self->_currentRoadName, 0);
}

@end