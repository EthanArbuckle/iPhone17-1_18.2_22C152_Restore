@interface MNLocationTracker
- (BOOL)hasArrived;
- (BOOL)hasVisitedFirstStop;
- (BOOL)isRerouting;
- (BOOL)paused;
- (BOOL)shouldAllowPause;
- (BOOL)shouldProjectAlongRoute;
- (GEOApplicationAuditToken)_auditToken;
- (MNArrivalInfo)arrivalInfo;
- (MNLocation)lastMatchedLocation;
- (MNLocationTracker)init;
- (MNLocationTracker)initWithNavigationSession:(id)a3;
- (MNNavigationSession)navigationSession;
- (MNNavigationSessionState)navigationSessionState;
- (MNObserverHashTable)safeDelegate;
- (id)_matchedLocationForLocation:(id)a3;
- (id)matchedLocationForLocation:(id)a3;
- (int)state;
- (int)transportType;
- (unint64_t)navigationCapabilities;
- (unint64_t)targetLegIndex;
- (void)_roadFeaturesForFeature:(id)a3 outRoadName:(id *)a4 outShieldText:(id *)a5 outShieldType:(int64_t *)a6;
- (void)_setAuditToken:(id)a3;
- (void)_setState:(int)a3;
- (void)_setTargetLegIndex:(unint64_t)a3;
- (void)_updateArrivalInfo:(id)a3;
- (void)_updateMatchedLocation:(id)a3;
- (void)_updateShouldLocalizeRoadNames;
- (void)dealloc;
- (void)insertWaypoint:(id)a3 completionHandler:(id)a4;
- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNavigationCapabilities:(unint64_t)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4;
- (void)updateDestination:(id)a3 completionHandler:(id)a4;
@end

@implementation MNLocationTracker

- (MNLocationTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNLocationTracker;
  v2 = [(MNLocationTracker *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MNLocationTracker *)v2 _updateShouldLocalizeRoadNames];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__defaultsDidChange name:*MEMORY[0x1E4F28AC8] object:0];
  }
  return v3;
}

- (MNLocationTracker)initWithNavigationSession:(id)a3
{
  id v4 = a3;
  v5 = [(MNLocationTracker *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    objc_storeWeak((id *)&v5->_navigationSession, v4);
    v6->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = [v4 auditToken];
    auditToken = v6->_auditToken;
    v6->_auditToken = (GEOApplicationAuditToken *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F28AC8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MNLocationTracker;
  [(MNLocationTracker *)&v4 dealloc];
}

- (int)transportType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    v5 = NSStringFromSelector(a2);
    int v7 = 136316162;
    v8 = "-[MNLocationTracker transportType]";
    __int16 v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
    __int16 v11 = 1024;
    int v12 = 73;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v7, 0x30u);
  }
  return 4;
}

- (BOOL)isRerouting
{
  return 0;
}

- (BOOL)hasArrived
{
  return (self->_state & 0xFFFFFFFE) == 6;
}

- (BOOL)shouldProjectAlongRoute
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = [[MNObserverHashTable alloc] initWithProtocol:&unk_1F0E524C0];
    safeDelegate = self->_safeDelegate;
    self->_safeDelegate = v4;

    [(MNObserverHashTable *)self->_safeDelegate registerObserver:v7];
  }
  else
  {
    objc_super v6 = self->_safeDelegate;
    self->_safeDelegate = 0;
  }
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  v5 = [(MNNavigationSessionState *)self->_navigationSessionState currentRouteInfo];
  id v10 = [v5 route];

  objc_super v6 = [v10 routeInitializerData];
  id v7 = [v6 directionsRequest];
  v8 = [v7 tripInfo];
  int v9 = [v8 hasVisitedFirstStop];

  if (v9) {
    self->_hasVisitedFirstStop = 1;
  }
}

- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)insertWaypoint:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)matchedLocationForLocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = [v4 uuid];
    int v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationTracker::matchedLocationForLocation:", (uint8_t *)&v17, 0xCu);
  }
  id v7 = MNGetMNLocationTrackerLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  int v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedLocationForLocation", "", (uint8_t *)&v17, 2u);
  }

  __int16 v11 = [(MNLocationTracker *)self _matchedLocationForLocation:v4];
  if (v11)
  {
    objc_storeStrong((id *)&self->_lastMatchedLocation, v11);
    int v12 = MNGetPuckTrackingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = [v11 uuid];
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling didUpdateMatchedLocation:", (uint8_t *)&v17, 0xCu);
    }
    [(MNObserverHashTable *)self->_safeDelegate locationTracker:self didUpdateMatchedLocation:v11];
  }
  uint64_t v14 = v10;
  __int16 v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v15, OS_SIGNPOST_INTERVAL_END, v8, "MatchedLocationForLocation", "", (uint8_t *)&v17, 2u);
  }

  return v11;
}

- (BOOL)shouldAllowPause
{
  return 0;
}

- (BOOL)paused
{
  return 0;
}

- (void)_setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MNObserverHashTable locationTracker:didChangeState:](self->_safeDelegate, "locationTracker:didChangeState:", self);
  }
}

- (void)_setTargetLegIndex:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_targetLegIndex != a3)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t targetLegIndex = self->_targetLegIndex;
      v7[0] = 67109376;
      v7[1] = targetLegIndex;
      __int16 v8 = 1024;
      int v9 = a3;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Changing target leg index from %d to %d.", (uint8_t *)v7, 0xEu);
    }

    self->_unint64_t targetLegIndex = a3;
    [(MNObserverHashTable *)self->_safeDelegate locationTracker:self didUpdateTargetLegIndex:a3];
  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  return 0;
}

- (void)_updateMatchedLocation:(id)a3
{
}

- (void)_updateArrivalInfo:(id)a3
{
  v5 = (MNArrivalInfo *)a3;
  p_arrivalInfo = &self->_arrivalInfo;
  if (self->_arrivalInfo != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_arrivalInfo, a3);
    if ([(MNArrivalInfo *)v7 isInArrivalState]) {
      self->_hasVisitedFirstStop = 1;
    }
    p_arrivalInfo = (MNArrivalInfo **)[(MNObserverHashTable *)self->_safeDelegate locationTracker:self didUpdateArrivalInfo:v7];
  }
  MEMORY[0x1F4181820](p_arrivalInfo);
}

- (void)_roadFeaturesForFeature:(id)a3 outRoadName:(id *)a4 outShieldText:(id *)a5 outShieldType:(int64_t *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __int16 v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 feature];
    if (v12)
    {
      __int16 v13 = (void *)v12;
      if (self->_localizeRoadNames) {
        GEOFeatureGetLocalizedLabel();
      }
      else {
        GEOFeatureGetNativeLabel();
      }
      GEOFeatureGetLocalizedShield();
      uint64_t v14 = [v13 attributes];
      int v15 = [v14 isRamp];

      if (v15)
      {
        v16 = [v13 attributes];
        int v17 = [v16 rampType];

        switch(v17)
        {
          case 2:
            v23 = [v13 attributes];
            int v24 = [v23 rampDirection];

            v21 = @"Freeway Ramp";
            switch(v24)
            {
              case 0:
                v25 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
                  __int16 v29 = 2080;
                  v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
                  __int16 v31 = 1024;
                  int v32 = 335;
                  _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
                }

                v21 = @"Freeway Ramp";
                break;
              case 1:
                v21 = @"Freeway On Ramp";
                break;
              case 2:
                v21 = @"Freeway Off Ramp";
                break;
              case 3:
                break;
              default:
                goto LABEL_27;
            }
LABEL_39:
            v26 = _MNLocalizedStringFromThisBundle(v21);
            if (!a4) {
              goto LABEL_29;
            }
            goto LABEL_28;
          case 1:
            goto LABEL_19;
          case 0:
            v18 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
              __int16 v29 = 2080;
              v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
              __int16 v31 = 1024;
              int v32 = 314;
              _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
            }

LABEL_19:
            uint64_t v19 = [v13 attributes];
            int v20 = [v19 rampDirection];

            v21 = @"Ramp";
            switch(v20)
            {
              case 0:
                v22 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
                  __int16 v29 = 2080;
                  v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
                  __int16 v31 = 1024;
                  int v32 = 319;
                  _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
                }

                v21 = @"Ramp";
                goto LABEL_39;
              case 1:
                v21 = @"On Ramp";
                goto LABEL_39;
              case 2:
                v21 = @"Off Ramp";
                goto LABEL_39;
              case 3:
                goto LABEL_39;
              default:
                goto LABEL_27;
            }
        }
      }
LABEL_27:
      v26 = 0;
      if (!a4)
      {
LABEL_29:
        if (a5) {
          *a5 = 0;
        }
        if (a6) {
          *a6 = 0;
        }

        goto LABEL_34;
      }
LABEL_28:
      *a4 = v26;
      goto LABEL_29;
    }
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
LABEL_34:
}

- (void)_updateShouldLocalizeRoadNames
{
  self->_localizeRoadNames = GEOConfigGetBOOL();
}

- (unint64_t)navigationCapabilities
{
  return self->_navigationCapabilities;
}

- (void)setNavigationCapabilities:(unint64_t)a3
{
  self->_navigationCapabilities = a3;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (MNLocation)lastMatchedLocation
{
  return self->_lastMatchedLocation;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (MNObserverHashTable)safeDelegate
{
  return self->_safeDelegate;
}

- (MNNavigationSession)navigationSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);
  return (MNNavigationSession *)WeakRetained;
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

- (void)_setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_safeDelegate, 0);
}

@end