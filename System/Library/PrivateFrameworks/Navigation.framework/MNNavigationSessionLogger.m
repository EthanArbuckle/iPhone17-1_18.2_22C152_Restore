@interface MNNavigationSessionLogger
- (MNNavigationSessionLogger)init;
- (MNNavigationSessionState)navigationSessionState;
- (id)_stringForLocationType:(unint64_t)a3;
- (void)_updateCameraStyleAttributesForLocation:(id)a3;
- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4;
- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4;
- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationSession:(id)a3 didRemoveWaypoint:(id)a4;
- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7;
- (void)navigationSession:(id)a3 didRerouteWithWaypoints:(id)a4;
- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4;
- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7;
- (void)navigationSession:(id)a3 didSuppressReroute:(id)a4;
- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6;
- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4;
- (void)navigationSession:(id)a3 didUpdateDestination:(id)a4;
- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4;
- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationSessionDidArrive:(id)a3;
- (void)navigationSessionDidCancelReroute:(id)a3;
- (void)navigationSessionDidEnterPreArrivalState:(id)a3;
- (void)navigationSessionWillReroute:(id)a3;
- (void)setNavigationSessionState:(id)a3;
@end

@implementation MNNavigationSessionLogger

- (MNNavigationSessionLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationSessionLogger;
  v2 = [(MNNavigationSessionLogger *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = GEOFindOrCreateLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = [v9 route];
    v13 = [v12 destination];
    v14 = GEOFindOrCreateLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a7)
    {
      if (v15)
      {
        id v16 = [v13 humanDescriptionWithAddressAndLatLng];
        v17 = [v9 routeID];
        uint64_t v18 = [v12 transportType];
        if (v18 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E60FBB90[(int)v18];
        }
        uint64_t v22 = [(__CFString *)v19 capitalizedString];
        v21 = (__CFString *)v22;
        if ((unint64_t)(a5 - 1) > 3) {
          v23 = @"None";
        }
        else {
          v23 = off_1E60FBAF8[a5 - 1];
        }
        *(_DWORD *)buf = 138478595;
        id v28 = v16;
        __int16 v29 = 2112;
        v30 = v17;
        __int16 v31 = 2112;
        uint64_t v32 = v22;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v23;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Restarted navigation session to [%{private}@] (%@) | %@ %@", buf, 0x2Au);
LABEL_19:
      }
    }
    else if (v15)
    {
      id v16 = [v13 humanDescriptionWithAddressAndLatLng];
      v17 = [v12 name];
      v19 = [v9 routeID];
      uint64_t v20 = [v12 transportType];
      if (v20 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E60FBB90[(int)v20];
      }
      uint64_t v24 = [(__CFString *)v21 capitalizedString];
      v25 = (void *)v24;
      if ((unint64_t)(a5 - 1) > 3) {
        v26 = @"None";
      }
      else {
        v26 = off_1E60FBAF8[a5 - 1];
      }
      *(_DWORD *)buf = 138478851;
      id v28 = v16;
      __int16 v29 = 2113;
      v30 = v17;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v19;
      __int16 v33 = 2112;
      uint64_t v34 = v24;
      __int16 v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Started navigation session to [%{private}@] via %{private}@ (%@) | %@ %@", buf, 0x34u);

      goto LABEL_19;
    }
  }
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E60FBB18[(int)v4];
    }
    *(_DWORD *)buf = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Changed navigation state to '%@'", buf, 0xCu);
  }
}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 uuid];
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSessionLogger::navigationSession:didUpdateMatchedLocation:", buf, 0xCu);
  }
  if ([v5 state] == 1)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    self->_previousSuppressedRerouteError = 0;
  }
  uint64_t v9 = GEOFindOrCreateLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    BOOL v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = NSString;
    [v5 coordinate];
    uint64_t v14 = v13;
    [v5 coordinate];
    id v16 = [v12 stringWithFormat:@"(%.6f, %.6f)", v14, v15];
    [v11 addObject:v16];

    if ([v5 state] == 1)
    {
      v17 = NSString;
      uint64_t v18 = [v5 routeMatch];
      uint64_t v19 = [v18 routeCoordinate];
      uint64_t v20 = [v5 routeMatch];
      v21 = [v17 stringWithFormat:@"[%u, %0.2f]", v19, COERCE_FLOAT((unint64_t)objc_msgSend(v20, "routeCoordinate") >> 32)];
      [v11 addObject:v21];
    }
    uint64_t v22 = NSString;
    [v5 course];
    uint64_t v24 = objc_msgSend(v22, "stringWithFormat:", @"%0.1f°", v23);
    [v11 addObject:v24];

    v25 = [v5 roadName];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      v27 = [v5 roadName];
      [v11 addObject:v27];
    }
    if ([v5 state])
    {
      if ([v5 speedLimit])
      {
        id v28 = NSString;
        uint64_t v29 = [v5 speedLimit];
        int v30 = [v5 speedLimitIsMPH];
        __int16 v31 = @"km/h";
        if (v30) {
          __int16 v31 = @"mph";
        }
        uint64_t v32 = [v28 stringWithFormat:@"%d %@", v29, v31];
      }
      else
      {
        uint64_t v32 = @"No speed limit";
      }
      [v11 addObject:v32];
    }
    __int16 v33 = -[MNNavigationSessionLogger _stringForLocationType:](self, "_stringForLocationType:", [v5 state]);
    [v11 addObject:v33];

    uint64_t v34 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = [v11 componentsJoinedByString:@" | "];
      *(_DWORD *)buf = 138477827;
      uint64_t v37 = v35;
      _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_INFO, "Location update: %{private}@", buf, 0xCu);
    }
  }
  [(MNNavigationSessionLogger *)self _updateCameraStyleAttributesForLocation:v5];
}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [(MNNavigationSessionState *)self->_navigationSessionState currentRouteInfo];
  v8 = [v7 route];

  uint64_t v9 = [v8 steps];
  if ([v9 count] <= a4)
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v10 = [v8 steps];
    BOOL v11 = [v10 objectAtIndexedSubscript:a4];
  }
  uint64_t v12 = [v11 maneuverAndInstructionDescription];
  uint64_t v13 = (void *)v12;
  uint64_t v14 = &stru_1F0E08010;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  uint64_t v15 = v14;

  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109634;
    v17[1] = a4;
    __int16 v18 = 2112;
    uint64_t v19 = v15;
    __int16 v20 = 1024;
    int v21 = v5;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Changed step index: %d %@| segment index: %d", (uint8_t *)v17, 0x18u);
  }
}

- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Entered pre-arrival state for leg: %d", (uint8_t *)v7, 8u);
  }
}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Arrived at end of leg: %d", (uint8_t *)v7, 8u);
  }
}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  int v7 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a6 - 1 > 5) {
      uint64_t v9 = @"Unknown";
    }
    else {
      uint64_t v9 = off_1E60FBB60[a6 - 1];
    }
    v10[0] = 67109378;
    v10[1] = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Resumed navigating from leg: %d reason: %@", (uint8_t *)v10, 0x12u);
  }
}

- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Updated target leg index: %d", (uint8_t *)v6, 8u);
  }
}

- (void)navigationSessionDidEnterPreArrivalState:(id)a3
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Entered pre-arrival state", v4, 2u);
  }
}

- (void)navigationSessionDidArrive:(id)a3
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Arrived", v4, 2u);
  }
}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = GEOFindOrCreateLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

  if (v13)
  {
    if (!self->_displayETALookup)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      displayETALookup = self->_displayETALookup;
      self->_displayETALookup = v14;
    }
    id v16 = [v9 routeID];
    if (v16)
    {
      v17 = [(NSMutableDictionary *)self->_displayETALookup objectForKeyedSubscript:v16];
    }
    else
    {
      v17 = 0;
    }
    if (([v17 isEqual:v9] & 1) == 0)
    {
      __int16 v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138413058;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v11;
        __int16 v25 = 2112;
        uint64_t v26 = v16;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_INFO, "Updated display ETA %@ | %@ | %@ | %@", (uint8_t *)&v19, 0x2Au);
      }

      if (v16) {
        [(NSMutableDictionary *)self->_displayETALookup setObject:v9 forKeyedSubscript:v16];
      }
    }
  }
}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 routeManager];
  uint64_t v7 = [v6 currentRouteInfo];

  uint64_t v8 = [v7 routeID];
  id v9 = [v5 routeID];

  LODWORD(v5) = [v8 isEqual:v9];
  if (v5)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "Received ETA update from server", v11, 2u);
    }
  }
}

- (void)navigationSessionWillReroute:(id)a3
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Will reroute", v4, 2u);
  }
}

- (void)navigationSession:(id)a3 didSuppressReroute:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    p_previousSuppressedRerouteError = &self->_previousSuppressedRerouteError;
    uint64_t v8 = previousSuppressedRerouteError;
    if (!previousSuppressedRerouteError || (uint64_t v11 = -[NSError code](v8, "code"), v11 != [v7 code]))
    {
      uint64_t v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [v7 userInfo];
        uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
        int v15 = 138412290;
        id v16 = v14;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v15, 0xCu);
      }
      objc_storeStrong((id *)p_previousSuppressedRerouteError, a4);
    }
  }
}

- (void)navigationSessionDidCancelReroute:(id)a3
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Cancelled reroute", v4, 2u);
  }
}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = GEOFindOrCreateLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = [v9 route];
    BOOL v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a7 - 1 > 0xE) {
        uint64_t v14 = @"Unknown";
      }
      else {
        uint64_t v14 = off_1E60FBBC8[a7 - 1];
      }
      int v15 = [v12 name];
      id v16 = [v9 routeID];
      int v19 = 138412803;
      id v20 = v14;
      __int16 v21 = 2113;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
    }
  }
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;

  displayETALookup = self->_displayETALookup;
  self->_displayETALookup = 0;
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  GEOFindOrCreateLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = off_1E60FBB90[(int)v7];
    }
    uint64_t v12 = [(__CFString *)v11 capitalizedString];
    if (a6 - 1 > 0xE) {
      BOOL v13 = @"Unknown";
    }
    else {
      BOOL v13 = off_1E60FBBC8[a6 - 1];
    }
    uint64_t v14 = [v9 route];
    int v15 = [v14 name];
    id v16 = [v9 routeID];
    *(_DWORD *)buf = 138413059;
    int v19 = v12;
    __int16 v20 = 2112;
    __int16 v21 = v13;
    __int16 v22 = 2113;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
  }
  displayETALookup = self->_displayETALookup;
  self->_displayETALookup = 0;
}

- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Reroute error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if ([v4 count])
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v21 = v4;
      id obj = v4;
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            BOOL v13 = NSString;
            uint64_t v14 = [v12 route];
            int v15 = [v14 name];
            id v16 = [v12 route];
            uint64_t v17 = [v16 uniqueRouteID];
            __int16 v18 = [v13 stringWithFormat:@"%@ (%@)", v15, v17];

            [v7 addObject:v18];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v9);
      }

      id v4 = v21;
    }
    else
    {
      id v7 = 0;
    }
    int v19 = [v7 componentsJoinedByString:@", "];
    __int16 v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v19;
      _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "Updated alternate routes: %@", buf, 0xCu);
    }
  }
}

- (void)navigationSession:(id)a3 didUpdateDestination:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 humanDescriptionWithAddressAndLatLng];
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Updated destination: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)navigationSession:(id)a3 didRerouteWithWaypoints:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_49);
    int v7 = [v6 componentsJoinedByString:@" | "];
    int v8 = 138477827;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Modified waypoints: %{private}@", (uint8_t *)&v8, 0xCu);
  }
}

uint64_t __71__MNNavigationSessionLogger_navigationSession_didRerouteWithWaypoints___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bestDisplayName:0];
}

- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 humanDescriptionWithAddressAndLatLng];
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Inserted waypoint: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)navigationSession:(id)a3 didRemoveWaypoint:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 humanDescriptionWithAddressAndLatLng];
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Removed waypoint: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = GEOFindOrCreateLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    lastGuidanceSignID = self->_lastGuidanceSignID;
    uint64_t v9 = [v5 primarySign];
    uint64_t v10 = [v9 uniqueID];
    LOBYTE(lastGuidanceSignID) = [(NSUUID *)lastGuidanceSignID isEqual:v10];

    if ((lastGuidanceSignID & 1) == 0)
    {
      BOOL v11 = [v5 primarySign];
      uint64_t v12 = [v11 uniqueID];
      BOOL v13 = self->_lastGuidanceSignID;
      self->_lastGuidanceSignID = v12;

      uint64_t v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "Updated sign: %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = GEOFindOrCreateLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    lastARInfos = self->_lastARInfos;
    p_lastARInfos = &self->_lastARInfos;
    if (!+[MNComparison isValue:lastARInfos equalTo:v6])
    {
      objc_storeStrong((id *)p_lastARInfos, a4);
      BOOL v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v6 componentsJoinedByString:@"\n\t"];
        int v13 = 138412290;
        uint64_t v14 = v12;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Updated AR events:\n\t%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Received Dodgeball alert: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if ([v4 type] == 2)
  {
    id v5 = v4;
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 reason];
      if ((unint64_t)(v7 - 1) > 9) {
        id v8 = @"Unknown";
      }
      else {
        id v8 = off_1E60FBC40[v7 - 1];
      }
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "Navigation session stopped with reason: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)_stringForLocationType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E60FBC90[a3];
  }
}

- (void)_updateCameraStyleAttributesForLocation:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = [v4 routeMatch];
    id v8 = [v7 route];

    id v48 = v4;
    int v9 = [v4 routeMatch];
    [v9 routeCoordinate];

    uint64_t v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v11 = [v8 cameraInfos];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          [v16 routeCoordinateRange];
          if (GEOPolylineCoordinateInRange()) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v13);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v17 = [v8 mutableData];
    __int16 v18 = [v17 updateableCameraInfos];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          [v23 routeCoordinateRange];
          if (GEOPolylineCoordinateInRange()) {
            [v10 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
      }
      while (v20);
    }

    location = (id *)&self->_activeCameraInfos;
    long long v24 = (void *)[(NSHashTable *)self->_activeCameraInfos copy];
    v49 = v10;
    [v24 minusHashTable:v10];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v73 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v56 + 1) + 8 * k);
          uint64_t v30 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = [v29 type];
            if (v31 <= 65629)
            {
              uint64_t v32 = @"None";
              if (v31)
              {
                if (v31 == 191)
                {
                  uint64_t v32 = @"Travel Direction Arrow";
                }
                else
                {
LABEL_35:
                  objc_msgSend(NSString, "stringWithFormat:", @"<unexpected visual info type: %lu>", v31);
                  uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            else
            {
              switch(v31)
              {
                case 65630:
                  uint64_t v32 = @"Traffic State";
                  break;
                case 65631:
                case 65632:
                case 65633:
                case 65634:
                case 65635:
                case 65637:
                case 65643:
                case 65645:
                case 65646:
                  goto LABEL_35;
                case 65636:
                  uint64_t v32 = @"Windshield Mode";
                  break;
                case 65638:
                  uint64_t v32 = @"Bridge";
                  break;
                case 65639:
                  uint64_t v32 = @"Tunnel";
                  break;
                case 65640:
                  uint64_t v32 = @"Urban Canyon";
                  break;
                case 65641:
                  uint64_t v32 = @"Complex Overpass";
                  break;
                case 65642:
                  uint64_t v32 = @"Complex Intersection";
                  break;
                case 65644:
                  uint64_t v32 = @"Traffic Camera";
                  break;
                case 65647:
                  uint64_t v32 = @"Covered";
                  break;
                default:
                  if (v31 == 131073)
                  {
                    uint64_t v32 = @"Exit Number";
                  }
                  else
                  {
                    if (v31 != 131074) {
                      goto LABEL_35;
                    }
                    uint64_t v32 = @"Significant Road Name";
                  }
                  break;
              }
            }
            *(_DWORD *)buf = 138412290;
            v69 = v32;
            _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_DEFAULT, "Removing camera style attribute: { %@ }", buf, 0xCu);
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v73 count:16];
      }
      while (v26);
    }

    __int16 v33 = (void *)[v10 copy];
    [v33 minusHashTable:*location];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v34 = v33;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v53;
      do
      {
        for (uint64_t m = 0; m != v36; ++m)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v52 + 1) + 8 * m);
          v40 = [v39 styleAttributes];
          v41 = [v40 attributes];
          v42 = [v41 firstObject];
          int v43 = [v42 value];

          v44 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v39 type];
            if (v45 <= 65629)
            {
              v46 = @"None";
              if (v45)
              {
                if (v45 == 191)
                {
                  v46 = @"Travel Direction Arrow";
                }
                else
                {
LABEL_63:
                  objc_msgSend(NSString, "stringWithFormat:", @"<unexpected visual info type: %lu>", v45);
                  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            else
            {
              switch(v45)
              {
                case 65630:
                  v46 = @"Traffic State";
                  break;
                case 65631:
                case 65632:
                case 65633:
                case 65634:
                case 65635:
                case 65637:
                case 65643:
                case 65645:
                case 65646:
                  goto LABEL_63;
                case 65636:
                  v46 = @"Windshield Mode";
                  break;
                case 65638:
                  v46 = @"Bridge";
                  break;
                case 65639:
                  v46 = @"Tunnel";
                  break;
                case 65640:
                  v46 = @"Urban Canyon";
                  break;
                case 65641:
                  v46 = @"Complex Overpass";
                  break;
                case 65642:
                  v46 = @"Complex Intersection";
                  break;
                case 65644:
                  v46 = @"Traffic Camera";
                  break;
                case 65647:
                  v46 = @"Covered";
                  break;
                default:
                  if (v45 == 131073)
                  {
                    v46 = @"Exit Number";
                  }
                  else
                  {
                    if (v45 != 131074) {
                      goto LABEL_63;
                    }
                    v46 = @"Significant Road Name";
                  }
                  break;
              }
            }
            *(_DWORD *)buf = 138412546;
            v69 = v46;
            __int16 v70 = 1024;
            int v71 = v43;
            _os_log_impl(&dword_1B542B000, v44, OS_LOG_TYPE_DEFAULT, "Activating camera style attribute: { %@: %u }", buf, 0x12u);
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v72 count:16];
      }
      while (v36);
    }

    if ([v49 count]) {
      v47 = v49;
    }
    else {
      v47 = 0;
    }
    objc_storeStrong(location, v47);

    id v4 = v48;
  }
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_storeStrong((id *)&self->_activeCameraInfos, 0);
  objc_storeStrong((id *)&self->_displayETALookup, 0);
  objc_storeStrong((id *)&self->_previousSuppressedRerouteError, 0);
  objc_storeStrong((id *)&self->_lastARInfos, 0);
  objc_storeStrong((id *)&self->_lastGuidanceSignID, 0);
}

@end