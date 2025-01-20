@interface MNNavigationProxyUpdater
- (MNNavigationProxyUpdater)init;
- (int)_geoNavigationTypeForNavigationType:(int64_t)a3;
- (void)enteredRoutePreviewWithTransportType:(int)a3;
- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6;
- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6;
- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7;
- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7;
- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4;
- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationSession:(id)a3 didUpdateStepNameInfo:(id)a4;
- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 triggerHaptics:(int)a4;
- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)navigationSessionStopped:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsNavigatingInLowGuidance:(BOOL)a3;
- (void)updateClusteredSectionSelectedRideForNavigationSession:(id)a3;
@end

@implementation MNNavigationProxyUpdater

- (MNNavigationProxyUpdater)init
{
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationProxyUpdater;
  v2 = [(MNNavigationProxyUpdater *)&v8 init];
  if (v2)
  {
    v3 = (GEONavigationProxy *)objc_alloc_init(MEMORY[0x1E4F64778]);
    navigationProxy = v2->_navigationProxy;
    v2->_navigationProxy = v3;

    v5 = objc_alloc_init(MNNanoFormattedStringFormatter);
    [(GEONavigationProxy *)v2->_navigationProxy setFormatter:v5];

    v6 = v2;
  }

  return v2;
}

- (void)enteredRoutePreviewWithTransportType:(int)a3
{
}

- (void)navigationSessionStopped:(id)a3
{
  v4 = [a3 routeManager];
  id v6 = [v4 currentRoute];

  if (v6) {
    uint64_t v5 = [v6 transportType];
  }
  else {
    uint64_t v5 = 4;
  }
  [(GEONavigationProxy *)self->_navigationProxy setNavigationSessionState:0 transportType:v5 navigationType:0 isResumingMultipointRoute:0];
  [(GEONavigationProxy *)self->_navigationProxy stop];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
}

- (void)updateClusteredSectionSelectedRideForNavigationSession:(id)a3
{
  v4 = [a3 routeManager];
  id v5 = [v4 currentRoute];

  [(GEONavigationProxy *)self->_navigationProxy setClusteredSectionSelectedRideFromRoute:v5];
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
}

- (int)_geoNavigationTypeForNavigationType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 1;
  }
  else {
    return dword_1B5542DB0[a3];
  }
}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = a3;
  v11 = [v10 routeManager];
  id v19 = [v11 currentRoute];

  v12 = [v10 destination];
  v13 = [v12 navDisplayName];

  v14 = [v19 waypoints];
  v15 = [v14 objectAtIndexedSubscript:1];
  v16 = [v15 navDisplayName];

  [(GEONavigationProxy *)self->_navigationProxy startWithDestinationName:v13 nextDestinationName:v16];
  -[GEONavigationProxy setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:](self->_navigationProxy, "setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:", 2, [v19 transportType], -[MNNavigationProxyUpdater _geoNavigationTypeForNavigationType:](self, "_geoNavigationTypeForNavigationType:", a5), v7);
  [(GEONavigationProxy *)self->_navigationProxy setRoute:v19];
  navigationProxy = self->_navigationProxy;
  uint64_t v18 = [v10 guidancePromptsEnabled];

  [(GEONavigationProxy *)navigationProxy setGuidancePromptsEnabled:v18];
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [v5 uuid];
    int v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationProxyUpdater::navigationSession:didUpdateMatchedLocation:", (uint8_t *)&v15, 0xCu);
  }
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v5];
  navigationProxy = self->_navigationProxy;
  id v10 = [v5 routeMatch];
  -[GEONavigationProxy setLastLocation:routeMatchedCoordinate:](navigationProxy, "setLastLocation:routeMatchedCoordinate:", v8, [v10 routeCoordinate]);

  v11 = self->_navigationProxy;
  v12 = [v5 routeMatch];
  [(GEONavigationProxy *)v11 setRouteMatch:v12];

  v13 = self->_navigationProxy;
  v14 = [v5 roadName];
  [(GEONavigationProxy *)v13 setCurrentRoadName:v14];
}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
}

- (void)navigationSession:(id)a3 didUpdateStepNameInfo:(id)a4
{
}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 routeManager];
  v12 = [v11 currentRoute];
  v13 = [v12 legs];
  unint64_t v14 = [v13 count];

  if (a5 + 1 >= v14)
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      v22 = "-[MNNavigationProxyUpdater navigationSession:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:]";
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationProxyUpdater.m";
      __int16 v25 = 1024;
      int v26 = 160;
      __int16 v27 = 2080;
      v28 = "(legIndex + 1) < navigationSession.routeManager.currentRoute.legs.count";
      _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v21, 0x26u);
    }
  }
  int v15 = [v9 routeManager];
  v16 = [v15 currentRoute];
  uint64_t v17 = [v16 waypoints];
  uint64_t v18 = [v17 objectAtIndexedSubscript:a5 + 1];
  id v19 = [v18 navDisplayName];

  [(GEONavigationProxy *)self->_navigationProxy setDestinationName:0 nextDestinationName:v19];
  [(GEONavigationProxy *)self->_navigationProxy setResumedNavigatingFromWaypoint:v10 endOfLegIndex:a5];
}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = [a3 routeManager];
  v12 = [v11 currentRoute];
  v13 = [v12 uniqueRouteID];
  unint64_t v14 = [v9 routeID];
  unint64_t v15 = v13;
  unint64_t v16 = v14;
  if (v15 | v16)
  {
    uint64_t v17 = (void *)v16;
    char v18 = [(id)v15 isEqual:v16];

    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v19 = (double)(unint64_t)[v9 displayRemainingMinutesToEndOfLeg] * 60.0;
  [v10 distanceRemainingToEndOfLeg];
  v31 = self;
  -[GEONavigationProxy setPositionFromDestination:](self->_navigationProxy, "setPositionFromDestination:", v19, v20);
  id v21 = objc_alloc_init(MEMORY[0x1E4F643F8]);
  v22 = (void *)MEMORY[0x1E4F1CA48];
  __int16 v23 = [v9 legInfos];
  v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v32 = v9;
  __int16 v25 = [v9 legInfos];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64400]), "initWithLegIndex:remainingTime:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "legIndex"), (double)(unint64_t)(60* objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "remainingMinutes")));
        [v24 addObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v27);
  }

  [v21 setArrivalTimeInfo:v24];
  [v10 distanceRemainingToEndOfLeg];
  objc_msgSend(v21, "setDistanceRemainingToEndOfLeg:");
  [v10 distanceRemainingToEndOfRoute];
  objc_msgSend(v21, "setDistanceRemainingToEndOfRoute:");
  [(GEONavigationProxy *)v31->_navigationProxy setETAUpdate:v21];

  id v9 = v32;
LABEL_12:
}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v12 = a4;
  id v6 = [a3 routeManager];
  id v7 = [v6 currentRouteInfo];

  objc_super v8 = v12;
  if (v7 == v12)
  {
    navigationProxy = self->_navigationProxy;
    id v10 = [v12 route];
    v11 = [v10 traffic];
    [(GEONavigationProxy *)navigationProxy setTrafficForCurrentRoute:v11];

    objc_super v8 = v12;
  }
}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v8 = objc_msgSend(a4, "route", a3);
  id v9 = [v8 waypoints];
  unint64_t v10 = [v9 count];

  if (v10 <= 1)
  {
    char v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      double v20 = "-[MNNavigationProxyUpdater navigationSession:didReroute:withLocation:withAlternateRoutes:rerouteReason:]";
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationProxyUpdater.m";
      __int16 v23 = 1024;
      int v24 = 202;
      __int16 v25 = 2080;
      uint64_t v26 = "route.waypoints.count >= 2";
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v19, 0x26u);
    }
  }
  navigationProxy = self->_navigationProxy;
  id v12 = [v8 waypoints];
  v13 = [v12 lastObject];
  unint64_t v14 = [v13 navDisplayName];
  unint64_t v15 = [v8 waypoints];
  unint64_t v16 = [v15 objectAtIndexedSubscript:1];
  uint64_t v17 = [v16 navDisplayName];
  [(GEONavigationProxy *)navigationProxy setDestinationName:v14 nextDestinationName:v17];

  [(GEONavigationProxy *)self->_navigationProxy setRoute:v8];
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  objc_msgSend(a5, "route", a3, *(void *)&a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GEONavigationProxy *)self->_navigationProxy setRoute:v7];
}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
}

- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
}

- (void)navigationSession:(id)a3 triggerHaptics:(int)a4
{
}

- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
}

- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v6 = a3;
  if ([a4 type] == 2) {
    [(MNNavigationProxyUpdater *)self navigationSessionStopped:v6];
  }
}

- (void).cxx_destruct
{
}

@end