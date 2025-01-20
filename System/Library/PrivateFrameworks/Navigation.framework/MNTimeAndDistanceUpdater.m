@interface MNTimeAndDistanceUpdater
- (MNNavigationSessionState)navigationSessionState;
- (MNTimeAndDistanceUpdater)initWithNavigationSessionState:(id)a3;
- (MNTimeAndDistanceUpdaterDelegate)delegate;
- (id)_batteryChargeInfoForRoute:(id)a3 routeCoordinate:(id)a4;
- (id)_routeDistanceInfoForRoute:(id)a3 routeCoordinate:(id)a4;
- (void)_logDisplayETAInfo:(id)a3;
- (void)_startTimerToNextMinute;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLocation:(id)a3 notificationType:(unint64_t)a4;
- (void)setNavigationSessionState:(id)a3;
- (void)setRoutes:(id)a3 mainRoute:(id)a4 location:(id)a5 notificationType:(unint64_t)a6;
- (void)stopUpdating;
- (void)updateDisplayETAForRoute:(id)a3 notificationType:(unint64_t)a4;
@end

@implementation MNTimeAndDistanceUpdater

- (MNTimeAndDistanceUpdater)initWithNavigationSessionState:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTimeAndDistanceUpdater;
  v6 = [(MNTimeAndDistanceUpdater *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationSessionState, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(MNTimeAndDistanceUpdater *)self stopUpdating];
  v3.receiver = self;
  v3.super_class = (Class)MNTimeAndDistanceUpdater;
  [(MNTimeAndDistanceUpdater *)&v3 dealloc];
}

- (void)stopUpdating
{
}

- (void)setLocation:(id)a3 notificationType:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  v8 = [v7 routeMatch];
  v9 = [v8 route];
  objc_super v10 = [(MNActiveRouteInfo *)self->_mainRoute route];

  if (v9 != v10)
  {
    v16 = NSString;
    v17 = [v7 routeMatch];
    v18 = [v17 route];
    v19 = [v18 uniqueRouteID];
    v20 = [(MNActiveRouteInfo *)self->_mainRoute routeID];
    v21 = [v16 stringWithFormat:@"Location matched to a route that is not the main route. Location route: %@ | Main route: %@", v19, v20];

    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "-[MNTimeAndDistanceUpdater setLocation:notificationType:]";
      __int16 v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      __int16 v32 = 1024;
      int v33 = 80;
      __int16 v34 = 2080;
      v35 = "location.routeMatch.route == _mainRoute.route";
      __int16 v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = self->_routes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        [(MNTimeAndDistanceUpdater *)self updateDisplayETAForRoute:*(void *)(*((void *)&v23 + 1) + 8 * v15++) notificationType:a4];
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)setRoutes:(id)a3 mainRoute:(id)a4 location:(id)a5 notificationType:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (MNActiveRouteInfo *)a4;
  id v13 = a5;
  v21 = v11;
  uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithArray:v11];
  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_routes];
  objc_msgSend(v14, "minusSet:");
  if (self->_mainRoute != v12) {
    self->_currentLogType = 0;
  }
  objc_storeStrong((id *)&self->_routes, a3);
  objc_storeStrong((id *)&self->_location, a5);
  objc_storeStrong((id *)&self->_mainRoute, a4);
  if (v13)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          [(MNTimeAndDistanceUpdater *)self updateDisplayETAForRoute:*(void *)(*((void *)&v22 + 1) + 8 * i) notificationType:a6];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
}

- (void)updateDisplayETAForRoute:(id)a3 notificationType:(unint64_t)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v6 = (MNActiveRouteInfo *)a3;
  if (![(NSArray *)self->_routes containsObject:v6])
  {
    v20 = [NSString stringWithFormat:@"Did not find route in set of routes."];
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v66 = 136316162;
      v67 = "-[MNTimeAndDistanceUpdater updateDisplayETAForRoute:notificationType:]";
      __int16 v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      __int16 v70 = 1024;
      int v71 = 111;
      __int16 v72 = 2080;
      v73 = "NO";
      __int16 v74 = 2112;
      v75 = v20;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v66, 0x30u);
    }
    goto LABEL_61;
  }
  id v7 = [(MNLocation *)self->_location routeMatch];
  uint64_t v8 = [v7 routeCoordinate];

  v9 = [(MNLocation *)self->_location routeMatch];
  objc_super v10 = [v9 route];
  id v11 = [(MNActiveRouteInfo *)v6 route];

  if (v10 != v11)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:self->_location];
    [v12 setCourse:-1.0];
    id v13 = objc_alloc(MEMORY[0x1E4F649E0]);
    uint64_t v14 = [(MNActiveRouteInfo *)v6 route];
    id v15 = (void *)[v13 initWithRoute:v14 auditToken:0];

    uint64_t v16 = [v15 matchToRouteWithLocation:v12];
    uint64_t v17 = v16;
    if (v16)
    {
      if (([v16 isGoodMatch] & 1) == 0)
      {
        uint64_t v18 = MNGetMNTimeAndDistanceUpdaterLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          [v17 distanceFromRoute];
          int v66 = 134217984;
          v67 = v19;
          _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_INFO, "Unexpected poor route match when computing ETA along route. Attempting to compute ETA anyway but result may be inaccurate. Distance from route: %0.1f meters", (uint8_t *)&v66, 0xCu);
        }
      }
      uint64_t v8 = [v17 routeCoordinate];
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4F641A8];
    }
  }
  if (self->_mainRoute == v6 && self->_location)
  {
    unint64_t v22 = [(MNNavigationSessionState *)self->_navigationSessionState targetLegIndex];
    long long v23 = [(MNActiveRouteInfo *)v6 route];
    long long v24 = [v23 legs];
    unint64_t v25 = [v24 count];

    if (v22 >= v25)
    {
      long long v26 = [(MNLocation *)self->_location routeMatch];
      v28 = [v26 leg];
    }
    else
    {
      long long v26 = [(MNActiveRouteInfo *)v6 route];
      uint64_t v27 = [v26 legs];
      v28 = [v27 objectAtIndexedSubscript:v22];
    }
    uint64_t v29 = [v28 startRouteCoordinate];
    uint64_t v30 = [v28 endRouteCoordinate];
    int IsInvalid = GEOPolylineCoordinateIsInvalid();
    __int16 v32 = (int *)MEMORY[0x1E4F64198];
    if (IsInvalid)
    {
      unsigned int v33 = *MEMORY[0x1E4F64198];
      float v34 = *(float *)(MEMORY[0x1E4F64198] + 4);
    }
    else
    {
      float v34 = *((float *)&v29 + 1) - floorf(*((float *)&v29 + 1));
      unsigned int v33 = vcvtms_u32_f32(*((float *)&v29 + 1)) + v29;
    }
    unint64_t v35 = v33 | ((unint64_t)LODWORD(v34) << 32);
    if (GEOPolylineCoordinateIsInvalid())
    {
      unsigned int v36 = *v32;
      float v37 = *((float *)v32 + 1);
    }
    else
    {
      float v37 = *((float *)&v30 + 1) - floorf(*((float *)&v30 + 1));
      unsigned int v36 = vcvtms_u32_f32(*((float *)&v30 + 1)) + v30;
    }
    unint64_t v38 = v36 | ((unint64_t)LODWORD(v37) << 32);
    int IsABeforeB = GEOPolylineCoordinateIsABeforeB();
    if (IsABeforeB) {
      unint64_t v40 = v38;
    }
    else {
      unint64_t v40 = v35;
    }
    if (IsABeforeB) {
      unint64_t v38 = v35;
    }
    if (!GEOPolylineCoordinateIsABeforeB()) {
      uint64_t v8 = v40;
    }
    if (!GEOPolylineCoordinateIsABeforeB()) {
      uint64_t v8 = v38;
    }
    v41 = [(MNLocation *)self->_location routeMatch];
    v42 = [v41 step];

    [(MNLocation *)self->_location speed];
    double v44 = v43;
    if ([(MNLocation *)self->_location state] == 1)
    {
      v45 = [(MNActiveRouteInfo *)v6 route];
      objc_msgSend(v45, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v8, objc_msgSend(v42, "maneuverStartRouteCoordinate"));
      double v47 = v46;

      if (v47 < 0.0) {
        double v47 = 0.0;
      }
    }
    else
    {
      v48 = [(MNLocation *)self->_location routeMatch];
      [v48 distanceFromRoute];
      double v47 = v49;
    }
    if (v44 <= 0.0) {
      double v50 = 0.0;
    }
    else {
      double v50 = v47 / v44;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timeAndDistanceUpdater:currentStepIndex:didUpdateDistanceUntilManeuver:timeUntilManeuver:", self, objc_msgSend(v42, "stepIndex"), v47, v50);
  }
  v20 = +[MNDisplayETAInfo displayETAInfoForRouteInfo:v6 routeCoordinate:v8];
  if (v20)
  {
    if (self->_mainRoute == v6) {
      [(MNTimeAndDistanceUpdater *)self _logDisplayETAInfo:v20];
    }
    v52 = [(MNActiveRouteInfo *)v6 displayETAInfo];
    int v53 = [v52 isEqual:v20];

    if ((v53 & 1) == 0) {
      [(MNActiveRouteInfo *)v6 setDisplayETAInfo:v20];
    }
    v21 = [(MNTimeAndDistanceUpdater *)self _routeDistanceInfoForRoute:v6 routeCoordinate:v8];
    if (v21)
    {
      v54 = [(MNActiveRouteInfo *)v6 remainingDistanceInfo];
      char v55 = [v54 isEqual:v21];

      if (v55)
      {
        int v56 = v53 ^ 1;
      }
      else
      {
        [(MNActiveRouteInfo *)v6 setRemainingDistanceInfo:v21];
        int v56 = 1;
      }
      v57 = [(MNTimeAndDistanceUpdater *)self _batteryChargeInfoForRoute:v6 routeCoordinate:v8];
      unint64_t v58 = [(MNActiveRouteInfo *)v6 batteryChargeInfo];
      unint64_t v59 = v57;
      if (v59 | v58)
      {
        char v60 = [(id)v58 isEqual:v59];

        if ((v60 & 1) == 0)
        {
          [(MNActiveRouteInfo *)v6 setBatteryChargeInfo:v59];
          int v56 = 1;
        }
      }
      if (a4 == 1) {
        int v61 = v56;
      }
      else {
        int v61 = 0;
      }
      if (a4 == 2 || v61)
      {
        id v62 = objc_loadWeakRetained((id *)&self->_delegate);
        v63 = [(MNActiveRouteInfo *)v6 displayETAInfo];
        v64 = [(MNActiveRouteInfo *)v6 remainingDistanceInfo];
        v65 = [(MNActiveRouteInfo *)v6 batteryChargeInfo];
        [v62 timeAndDistanceUpdater:self didUpdateDisplayETA:v63 remainingDistance:v64 batteryChargeInfo:v65];
      }
    }
LABEL_61:
  }
}

- (id)_routeDistanceInfoForRoute:(id)a3 routeCoordinate:(id)a4
{
  id v5 = a3;
  v6 = [v5 route];
  uint64_t v7 = [v6 legIndexForRouteCoordinate:a4];

  uint64_t v8 = [v5 route];
  v9 = [v8 legs];
  objc_super v10 = [v9 objectAtIndexedSubscript:v7];

  id v11 = [v5 route];
  objc_msgSend(v11, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a4, objc_msgSend(v10, "endRouteCoordinate"));
  double v13 = v12;

  uint64_t v14 = [v5 route];
  id v15 = [v5 route];
  objc_msgSend(v14, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a4, objc_msgSend(v15, "endRouteCoordinate"));
  double v17 = v16;

  uint64_t v18 = [MNRouteDistanceInfo alloc];
  v19 = [v5 routeID];

  v20 = [(MNRouteDistanceInfo *)v18 initWithDistanceRemainingToEndOfLeg:v7 distanceRemainingToEndOfRoute:v19 forLegIndex:v13 forRouteID:v17];
  return v20;
}

- (id)_batteryChargeInfoForRoute:(id)a3 routeCoordinate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 route];
  int v7 = [v6 isEVRoute];

  if (v7)
  {
    uint64_t v8 = [v5 route];
    uint64_t v9 = [v8 legIndexForRouteCoordinate:a4];

    objc_super v10 = [v5 route];
    id v11 = [v10 lastEVStepInLegWithIndex:v9];
    double v12 = [v11 evInfo];

    double v13 = [v5 route];
    uint64_t v14 = [v13 lastEVStep];
    id v15 = [v14 evInfo];

    if (v12 && v15)
    {
      double v16 = [MNBatteryChargeInfo alloc];
      double v17 = (double)[v12 remainingBatteryPercentage];
      double v18 = (double)[v15 remainingBatteryPercentage];
      v19 = [v5 routeID];
      v20 = [(MNBatteryChargeInfo *)v16 initWithBatteryChargeRemainingAtEndOfLeg:v9 batteryChargeRemainingAtEndOfRoute:v19 forLegIndex:v17 forRouteID:v18];
    }
    else {
      v21 = {;
    }
      unint64_t v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136316162;
        unint64_t v25 = "-[MNTimeAndDistanceUpdater _batteryChargeInfoForRoute:routeCoordinate:]";
        __int16 v26 = 2080;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
        __int16 v28 = 1024;
        int v29 = 231;
        __int16 v30 = 2080;
        v31 = "endOfLegEvInfo && endOfRouteEvInfo";
        __int16 v32 = 2112;
        unsigned int v33 = v21;
        _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v24, 0x30u);
      }

      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_startTimerToNextMinute
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(NSTimer *)self->_minuteTimer invalidate];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = 60.0 - (double)((unint64_t)v3 % 0x3C);
  if (v4 < 0.0 || v4 > 60.0)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid update time interval"];
    objc_super v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[MNTimeAndDistanceUpdater _startTimerToNextMinute]";
      __int16 v14 = 2080;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTimeAndDistanceUpdater.m";
      __int16 v16 = 1024;
      int v17 = 249;
      __int16 v18 = 2080;
      v19 = "remainingSecondsToNextMinute >= 0 && remainingSecondsToNextMinute <= 60";
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", location, 0x30u);
    }
  }
  objc_initWeak((id *)location, self);
  v6 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MNTimeAndDistanceUpdater__startTimerToNextMinute__block_invoke;
  v11[3] = &unk_1E60F6AC8;
  objc_copyWeak(&v12, (id *)location);
  int v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v11 block:v4];
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

void __51__MNTimeAndDistanceUpdater__startTimerToNextMinute__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = WeakRetained[3];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "updateDisplayETAForRoute:notificationType:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), 1, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [v2 _startTimerToNextMinute];
  }
}

- (void)_logDisplayETAInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mainRoute = self->_mainRoute;
  if (mainRoute)
  {
    uint64_t v6 = [(MNActiveRouteInfo *)mainRoute routeID];
    uint64_t v7 = [v4 routeID];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      int v9 = [v4 isUsingServerDisplayETA];
      unint64_t v10 = 1;
      if (v9) {
        unint64_t v10 = 2;
      }
      if (v10 != self->_currentLogType)
      {
        int v11 = v9;
        self->_currentLogType = v10;
        id v12 = MNGetMNTimeAndDistanceUpdaterLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          if (v11) {
            uint64_t v13 = @"server";
          }
          else {
            uint64_t v13 = @"client";
          }
          __int16 v14 = [v4 routeID];
          int v15 = 138412802;
          __int16 v16 = v13;
          __int16 v17 = 2112;
          __int16 v18 = v14;
          __int16 v19 = 2112;
          id v20 = v4;
          _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "Calculating %@ display ETA for route %@: %@", (uint8_t *)&v15, 0x20u);
        }
      }
    }
  }
}

- (MNTimeAndDistanceUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNTimeAndDistanceUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_storeStrong((id *)&self->_mainRoute, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end