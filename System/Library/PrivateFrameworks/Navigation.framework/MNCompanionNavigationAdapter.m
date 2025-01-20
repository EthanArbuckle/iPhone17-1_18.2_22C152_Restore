@interface MNCompanionNavigationAdapter
- (BOOL)_isInvalidated;
- (MNCompanionNavigationAdapter)init;
- (MNCompanionNavigationAdapter)initWithDelegate:(id)a3;
- (MNCompanionNavigationDelegate)delegate;
- (void)_cancelScheduledRouteStatus;
- (void)_cancelScheduledRouteUpdates;
- (void)_handleNavigationServiceStopped;
- (void)_markCurrentHapticsAsTriggered;
- (void)_populateInitialDistanceToManeuver;
- (void)_reloadRouteFromNavigationService:(id)a3;
- (void)_reset;
- (void)_scheduleCoalescedRouteStatusUpdate;
- (void)_scheduleCoalescedRouteUpdates;
- (void)_sendRouteDetailsAndStatus;
- (void)_sendRouteStatus;
- (void)_sendRouteUpdates;
- (void)_setActiveStepIndex:(unint64_t)a3;
- (void)_setAnnouncementStage:(unint64_t)a3;
- (void)_setDestinationName:(id)a3;
- (void)_setDisplayedStepIndex:(unint64_t)a3;
- (void)_setGuidancePromptsEnabled:(BOOL)a3;
- (void)_setIsOfflineStatus:(BOOL)a3;
- (void)_setLastLocation:(id)a3;
- (void)_setLocationUnreliable:(BOOL)a3;
- (void)_setNavigationState:(int)a3;
- (void)_setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4;
- (void)_setPositionFromDestination:(id)a3;
- (void)_setPositionFromManeuver:(double)a3;
- (void)_setRealtimeUpdates:(id)a3;
- (void)_setRoute:(id)a3 traffic:(id)a4 isTrace:(BOOL)a5;
- (void)_setRouteMatch:(id)a3;
- (void)_setTransitAlightMessage:(id)a3;
- (void)_triggerHaptics:(int)a3;
- (void)_updateNavigationStatesOnRouteStatus;
- (void)dealloc;
- (void)invalidate;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4;
- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4;
- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4;
- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10;
- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4;
- (void)navigationService:(id)a3 triggerHaptics:(int)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)navigationService:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5;
- (void)navigationServiceDidCancelReroute:(id)a3;
- (void)navigationServiceDidSynchronize:(id)a3;
- (void)navigationServiceWillReroute:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsNavigatingInLowGuidance:(BOOL)a3;
@end

@implementation MNCompanionNavigationAdapter

- (MNCompanionNavigationAdapter)init
{
  v8.receiver = self;
  v8.super_class = (Class)MNCompanionNavigationAdapter;
  v2 = [(MNCompanionNavigationAdapter *)&v8 init];
  if (v2)
  {
    v3 = (GEONavigationGuidanceState *)objc_alloc_init(MEMORY[0x1E4F64768]);
    guidanceState = v2->_guidanceState;
    v2->_guidanceState = v3;

    v5 = objc_alloc_init(MNNanoFormattedStringFormatter);
    formatter = v2->_formatter;
    v2->_formatter = (GEOServerFormattedStepStringFormatter *)v5;
  }
  return v2;
}

- (MNCompanionNavigationAdapter)initWithDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MNCompanionNavigationAdapter *)self init];
  if (v6)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_super v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
    objc_storeWeak((id *)&v6->_delegate, v5);
    v9 = +[MNNavigationService sharedService];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __49__MNCompanionNavigationAdapter_initWithDelegate___block_invoke;
    v17 = &unk_1E60F6668;
    v10 = v6;
    v18 = v10;
    id v11 = v9;
    id v19 = v11;
    v12 = (void (**)(void))MEMORY[0x1BA99B3A0](&v14);
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v14, v15, v16, v17)) {
      v12[2](v12);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v12);
    }
    [v11 registerObserver:v10];
  }
  return v6;
}

void __49__MNCompanionNavigationAdapter_initWithDelegate___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = [*(id *)(a1 + 40) guidancePromptsEnabled];
  uint64_t v2 = [*(id *)(a1 + 40) destinationName];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = [*(id *)(a1 + 40) route];
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    id v8 = v5;
    v7 = [v5 traffic];
    objc_msgSend(v6, "_setRoute:traffic:isTrace:", v8, v7, objc_msgSend(*(id *)(a1 + 40), "traceIsPlaying"));

    id v5 = v8;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MNCompanionNavigationAdapter;
  [(MNCompanionNavigationAdapter *)&v2 dealloc];
}

- (BOOL)_isInvalidated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = WeakRetained == 0;

  return v3;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteStatus];
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteUpdates];
  [(MNCompanionNavigationAdapter *)self _reset];
}

- (void)_reset
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(a2);
    int v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v15, 0xCu);
  }
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteStatus];
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteUpdates];
  companionRouteDetails = self->_companionRouteDetails;
  self->_companionRouteDetails = 0;

  companionRouteStatus = self->_companionRouteStatus;
  self->_companionRouteStatus = 0;

  companionRouteUpdates = self->_companionRouteUpdates;
  self->_companionRouteUpdates = 0;

  self->_shouldSendRouteWithStatus = 0;
  destinationName = self->_destinationName;
  self->_destinationName = 0;

  route = self->_route;
  self->_route = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  v13 = (GEONavigationGuidanceState *)objc_alloc_init(MEMORY[0x1E4F64768]);
  guidanceState = self->_guidanceState;
  self->_guidanceState = v13;

  self->_locationUnreliable = 0;
  self->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_positionFromManeuver = -1.0;
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)*MEMORY[0x1E4F63E80];
  self->_announcementStage = 0;
  self->_nextAnnouncementStage = 0;
  self->_timeUntilNextAnnouncement = 1.79769313e308;
  self->_shouldSendRouteWithStatus = 0;
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  if (self->_isNavigatingInLowGuidance != a3)
  {
    self->_isNavigatingInLowGuidance = a3;
    -[GEOCompanionRouteStatus setLowGuidanceNavigation:](self->_companionRouteStatus, "setLowGuidanceNavigation:");
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  if (self->_isConnectedToCarplay != a3)
  {
    self->_isConnectedToCarplay = a3;
    -[GEOCompanionRouteStatus setIsConnectedToCarplay:](self->_companionRouteStatus, "setIsConnectedToCarplay:");
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_updateNavigationStatesOnRouteStatus
{
  companionRouteStatus = self->_companionRouteStatus;
  uint64_t v4 = [(GEONavigationGuidanceState *)self->_guidanceState navigationState];
  BOOL locationUnreliable = self->_locationUnreliable;
  unint64_t announcementStage = self->_announcementStage;
  unint64_t nextAnnouncementStage = self->_nextAnnouncementStage;
  double timeUntilNextAnnouncement = self->_timeUntilNextAnnouncement;
  [(GEOCompanionRouteStatus *)companionRouteStatus updateFeedbackWithNavigationState:v4 locationUnreliable:locationUnreliable announcementStage:announcementStage nextAnnouncementStage:nextAnnouncementStage nextAnnouncementTime:timeUntilNextAnnouncement];
}

- (void)_setRoute:(id)a3 traffic:(id)a4 isTrace:(BOOL)a5
{
  BOOL v5 = a5;
  v16 = (GEOComposedRoute *)a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v16 && self->_route != v16)
  {
    objc_storeStrong((id *)&self->_route, a3);
    v10 = (GEOCompanionRouteDetails *)[objc_alloc(MEMORY[0x1E4F64470]) initWithRoute:v16 destinationName:self->_destinationName stringFormatter:self->_formatter traffic:v9];
    companionRouteDetails = self->_companionRouteDetails;
    self->_companionRouteDetails = v10;

    [(GEOCompanionRouteDetails *)self->_companionRouteDetails setCanNavigate:[(GEOComposedRoute *)v16 isNavigableForWatch]];
    [(GEOCompanionRouteDetails *)self->_companionRouteDetails setIsTrace:v5];
    id v12 = objc_alloc(MEMORY[0x1E4F64478]);
    v13 = [(GEOCompanionRouteDetails *)self->_companionRouteDetails routeID];
    uint64_t v14 = (GEOCompanionRouteStatus *)[v12 initWithRoute:v16 routeID:v13];
    companionRouteStatus = self->_companionRouteStatus;
    self->_companionRouteStatus = v14;

    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setGuidancePromptsEnabled:self->_guidancePromptsEnabled];
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setIsConnectedToCarplay:self->_isConnectedToCarplay];
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setLowGuidanceNavigation:self->_isNavigatingInLowGuidance];
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setStepID:0];
    [(MNCompanionNavigationAdapter *)self _populateInitialDistanceToManeuver];
    [(MNCompanionNavigationAdapter *)self _updateNavigationStatesOnRouteStatus];
    [(MNCompanionNavigationAdapter *)self _setIsOfflineStatus:[(GEOComposedRoute *)v16 isOfflineRoute]];
    self->_displayedStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (![(GEOCompanionRouteStatus *)self->_companionRouteStatus feedbackType]) {
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setFeedbackType:1];
    }
    self->_shouldSendRouteWithStatus = 1;
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_populateInitialDistanceToManeuver
{
  unsigned int v3 = [(GEOCompanionRouteStatus *)self->_companionRouteStatus stepID];
  if ([(GEOCompanionRouteDetails *)self->_companionRouteDetails stepsCount] <= (unint64_t)v3)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v4 = [(GEOCompanionRouteDetails *)self->_companionRouteDetails steps];
    id v6 = [v4 objectAtIndexedSubscript:v3];
  }
  if ([v6 hasDistanceMeters])
  {
    [v6 distanceMeters];
    [(MNCompanionNavigationAdapter *)self _setPositionFromManeuver:v5];
  }
}

- (void)_setNavigationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(GEONavigationGuidanceState *)self->_guidanceState navigationState] != a3)
  {
    [(GEONavigationGuidanceState *)self->_guidanceState setNavigationState:v3];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [(GEONavigationGuidanceState *)self->_guidanceState navigationState];
      if (v8 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = off_1E60F7E38[(int)v8];
      }
      v10 = v9;
      if (v3 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = off_1E60F7E38[(int)v3];
      }
      *(_DWORD *)buf = 138543874;
      id v13 = v7;
      __int16 v14 = 2114;
      int v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%{public}@ navigationState is now %{public}@ / %{public}@", buf, 0x20u);
    }
    [(MNCompanionNavigationAdapter *)self _updateNavigationStatesOnRouteStatus];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setLastLocation:(id)a3
{
  id v6 = (GEOLocation *)a3;
  if (self->_lastLocation != v6)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setLocation:v6];
    float v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceReferenceDate];
    -[GEOCompanionRouteStatus setTimestamp:](self->_companionRouteStatus, "setTimestamp:");

    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setLocationUnreliable:(BOOL)a3
{
  if (self->_locationUnreliable != a3)
  {
    self->_BOOL locationUnreliable = a3;
    [(MNCompanionNavigationAdapter *)self _updateNavigationStatesOnRouteStatus];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setRouteMatch:(id)a3
{
  float v5 = (GEORouteMatch *)a3;
  p_routeMatch = &self->_routeMatch;
  if (self->_routeMatch != v5)
  {
    id v12 = v5;
    objc_storeStrong((id *)p_routeMatch, a3);
    if (self->_displayedStepIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setStepID:[(GEORouteMatch *)v12 stepIndex]];
      [(MNCompanionNavigationAdapter *)self _populateInitialDistanceToManeuver];
    }
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setRouteLocationIndex:[(GEORouteMatch *)v12 routeCoordinate]];
    LODWORD(v7) = (unint64_t)[(GEORouteMatch *)v12 routeCoordinate] >> 32;
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setRouteLocationOffset:v7];
    [(GEORouteMatch *)v12 distanceFromRoute];
    LODWORD(v9) = vcvtad_u64_f64(v8);
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setDistanceToRoute:v9];
    if (v12)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F64638]);
      [(GEORouteMatch *)v12 locationCoordinate];
      id v11 = objc_msgSend(v10, "initWithCoordinate:");
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setRouteMatchCoordinate:v11];
    }
    p_routeMatch = (GEORouteMatch **)[(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
    float v5 = v12;
  }
  MEMORY[0x1F41817F8](p_routeMatch, v5);
}

- (void)_setDestinationName:(id)a3
{
  id v4 = a3;
  destinationName = self->_destinationName;
  id v9 = v4;
  if (!destinationName
    || (uint64_t v6 = [(NSString *)destinationName isEqualToString:v4], v4 = v9, (v6 & 1) == 0))
  {
    double v7 = (NSString *)[v4 copy];
    double v8 = self->_destinationName;
    self->_destinationName = v7;

    [(GEOCompanionRouteDetails *)self->_companionRouteDetails setDestinationName:self->_destinationName];
    self->_shouldSendRouteWithStatus = 1;
    uint64_t v6 = [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
    id v4 = v9;
  }
  MEMORY[0x1F41817F8](v6, v4);
}

- (void)_setIsOfflineStatus:(BOOL)a3
{
}

- (void)_setGuidancePromptsEnabled:(BOOL)a3
{
  if (self->_guidancePromptsEnabled != a3)
  {
    self->_guidancePromptsEnabled = a3;
    -[GEOCompanionRouteStatus setGuidancePromptsEnabled:](self->_companionRouteStatus, "setGuidancePromptsEnabled:");
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setActiveStepIndex:(unint64_t)a3
{
  if (self->_activeStepIndex != a3)
  {
    self->_activeStepIndex = a3;
    if ([(GEONavigationGuidanceState *)self->_guidanceState navigationState] != 6
      && [(GEONavigationGuidanceState *)self->_guidanceState navigationState] != 7)
    {
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setFeedbackType:2];
    }
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setStepID:a3];
    [(MNCompanionNavigationAdapter *)self _populateInitialDistanceToManeuver];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setDisplayedStepIndex:(unint64_t)a3
{
  if (self->_displayedStepIndex != a3)
  {
    self->_displayedStepIndex = a3;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setDisplayedStepID:0];
      [(GEOCompanionRouteStatus *)self->_companionRouteStatus setHasDisplayedStepID:0];
    }
    else
    {
      -[GEOCompanionRouteStatus setDisplayedStepID:](self->_companionRouteStatus, "setDisplayedStepID:");
    }
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setPositionFromManeuver:(double)a3
{
  double positionFromManeuver = self->_positionFromManeuver;
  self->_double positionFromManeuver = a3;
  if (vabdd_f64(a3, positionFromManeuver) >= 2.22044605e-16)
  {
    LODWORD(v3) = vcvtad_u64_f64(a3);
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setDistanceToManeuver:v3];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setPositionFromDestination:(id)a3
{
  double var0 = a3.var0;
  double remainingTime = self->_positionFromDestination.remainingTime;
  double remainingDistance = self->_positionFromDestination.remainingDistance;
  self->_positionFromDestination.double remainingTime = var0;
  self->_positionFromDestination.double remainingDistance = a3.var1;
  if (vabdd_f64(remainingTime, var0) >= 0.01
    || (double remainingDistance = vabdd_f64(remainingDistance, a3.var1), remainingDistance >= 0.01))
  {
    LODWORD(v3) = vcvtad_u64_f64(a3.var1);
    -[GEOCompanionRouteStatus setDistanceRemainingOnRoute:](self->_companionRouteStatus, "setDistanceRemainingOnRoute:", v3, remainingDistance);
    LODWORD(v8) = vcvtmd_u64_f64(var0);
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setRemainingTime:v8];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setAnnouncementStage:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_announcementStage != a3)
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = NSStringFromSelector(a2);
      unint64_t announcementStage = self->_announcementStage;
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2048;
      unint64_t v12 = announcementStage;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%{public}@ changing announcementStage from %lu to %lu", (uint8_t *)&v9, 0x20u);
    }
    self->_unint64_t announcementStage = a3;
    [(MNCompanionNavigationAdapter *)self _updateNavigationStatesOnRouteStatus];
    [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
  }
}

- (void)_setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_nextAnnouncementStage != a3)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = NSStringFromSelector(a2);
      unint64_t nextAnnouncementStage = self->_nextAnnouncementStage;
      int v11 = 138543874;
      unint64_t v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = nextAnnouncementStage;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "%{public}@ changing nextAnnouncementStage from %lu to %lu", (uint8_t *)&v11, 0x20u);
    }
  }
  self->_unint64_t nextAnnouncementStage = a3;
  self->_double timeUntilNextAnnouncement = a4;
  [(MNCompanionNavigationAdapter *)self _updateNavigationStatesOnRouteStatus];
  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)_setRealtimeUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v12 = objc_msgSend(v11, "transitUpdate", (void)v16);
          if (v12)
          {
            __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F64480]) initWithTransitRouteUpdate:v12];
            [v5 addObject:v13];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  unint64_t v14 = (NSArray *)[v5 copy];
  companionRouteUpdates = self->_companionRouteUpdates;
  self->_companionRouteUpdates = v14;

  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteUpdates];
}

- (void)_setTransitAlightMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
  [(GEOCompanionRouteStatus *)self->_companionRouteStatus setAlightMessage:v5];
  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)_triggerHaptics:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int v8 = @"NO_TURN";
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        int v8 = @"LEFT_TURN";
        break;
      case 2:
        int v8 = @"RIGHT_TURN";
        break;
      case 3:
        int v8 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        int v8 = @"U_TURN";
        break;
      case 5:
        int v8 = @"FOLLOW_ROAD";
        break;
      case 6:
        int v8 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        int v8 = @"EXIT_ROUNDABOUT";
        break;
      case 11:
        int v8 = @"OFF_RAMP";
        break;
      case 12:
        int v8 = @"ON_RAMP";
        break;
      case 16:
        int v8 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 17:
        int v8 = @"START_ROUTE";
        break;
      case 18:
        int v8 = @"ARRIVE_AT_DESTINATION";
        break;
      case 20:
        int v8 = @"KEEP_LEFT";
        break;
      case 21:
        int v8 = @"KEEP_RIGHT";
        break;
      case 22:
        int v8 = @"ENTER_FERRY";
        break;
      case 23:
        int v8 = @"EXIT_FERRY";
        break;
      case 24:
        int v8 = @"CHANGE_FERRY";
        break;
      case 25:
        int v8 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 26:
        int v8 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 27:
        int v8 = @"LEFT_TURN_AT_END";
        break;
      case 28:
        int v8 = @"RIGHT_TURN_AT_END";
        break;
      case 29:
        int v8 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 30:
        int v8 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 33:
        int v8 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 34:
        int v8 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 35:
        int v8 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 39:
        int v8 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 41:
        int v8 = @"ROUNDABOUT_EXIT_1";
        break;
      case 42:
        int v8 = @"ROUNDABOUT_EXIT_2";
        break;
      case 43:
        int v8 = @"ROUNDABOUT_EXIT_3";
        break;
      case 44:
        int v8 = @"ROUNDABOUT_EXIT_4";
        break;
      case 45:
        int v8 = @"ROUNDABOUT_EXIT_5";
        break;
      case 46:
        int v8 = @"ROUNDABOUT_EXIT_6";
        break;
      case 47:
        int v8 = @"ROUNDABOUT_EXIT_7";
        break;
      case 48:
        int v8 = @"ROUNDABOUT_EXIT_8";
        break;
      case 49:
        int v8 = @"ROUNDABOUT_EXIT_9";
        break;
      case 50:
        int v8 = @"ROUNDABOUT_EXIT_10";
        break;
      case 51:
        int v8 = @"ROUNDABOUT_EXIT_11";
        break;
      case 52:
        int v8 = @"ROUNDABOUT_EXIT_12";
        break;
      case 53:
        int v8 = @"ROUNDABOUT_EXIT_13";
        break;
      case 54:
        int v8 = @"ROUNDABOUT_EXIT_14";
        break;
      case 55:
        int v8 = @"ROUNDABOUT_EXIT_15";
        break;
      case 56:
        int v8 = @"ROUNDABOUT_EXIT_16";
        break;
      case 57:
        int v8 = @"ROUNDABOUT_EXIT_17";
        break;
      case 58:
        int v8 = @"ROUNDABOUT_EXIT_18";
        break;
      case 59:
        int v8 = @"ROUNDABOUT_EXIT_19";
        break;
      case 60:
        int v8 = @"SHARP_LEFT_TURN";
        break;
      case 61:
        int v8 = @"SHARP_RIGHT_TURN";
        break;
      case 62:
        int v8 = @"SLIGHT_LEFT_TURN";
        break;
      case 63:
        int v8 = @"SLIGHT_RIGHT_TURN";
        break;
      case 64:
        int v8 = @"CHANGE_HIGHWAY";
        break;
      case 65:
        int v8 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 66:
        int v8 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 80:
        int v8 = @"TOLL_STATION";
        break;
      case 81:
        int v8 = @"ENTER_TUNNEL";
        break;
      case 82:
        int v8 = @"WAYPOINT_STOP";
        break;
      case 83:
        int v8 = @"WAYPOINT_STOP_LEFT";
        break;
      case 84:
        int v8 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 85:
        int v8 = @"RESUME_ROUTE";
        break;
      case 86:
        int v8 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 87:
        int v8 = @"CUSTOM";
        break;
      case 88:
        int v8 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
        int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    *(_DWORD *)buf = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
  }
  [(GEOCompanionRouteStatus *)self->_companionRouteStatus setHapticsType:v3];
  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)_scheduleCoalescedRouteStatusUpdate
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_coalescedRouteStatusTimer && ![(MNCompanionNavigationAdapter *)self _isInvalidated])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__sendRouteStatus selector:0 userInfo:0 repeats:0.1];
    coalescedRouteStatusTimer = self->_coalescedRouteStatusTimer;
    self->_coalescedRouteStatusTimer = v3;
    MEMORY[0x1F41817F8](v3, coalescedRouteStatusTimer);
  }
}

- (void)_cancelScheduledRouteStatus
{
  if (self->_coalescedRouteStatusTimer)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    [(NSTimer *)self->_coalescedRouteStatusTimer invalidate];
    coalescedRouteStatusTimer = self->_coalescedRouteStatusTimer;
    self->_coalescedRouteStatusTimer = 0;
  }
}

- (void)_scheduleCoalescedRouteUpdates
{
  if (!self->_coalescedRouteUpdatesTimer && ![(MNCompanionNavigationAdapter *)self _isInvalidated])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__sendRouteUpdates selector:0 userInfo:0 repeats:0.0];
    coalescedRouteUpdatesTimer = self->_coalescedRouteUpdatesTimer;
    self->_coalescedRouteUpdatesTimer = v3;
    MEMORY[0x1F41817F8](v3, coalescedRouteUpdatesTimer);
  }
}

- (void)_cancelScheduledRouteUpdates
{
  coalescedRouteUpdatesTimer = self->_coalescedRouteUpdatesTimer;
  if (coalescedRouteUpdatesTimer)
  {
    [(NSTimer *)coalescedRouteUpdatesTimer invalidate];
    id v4 = self->_coalescedRouteUpdatesTimer;
    self->_coalescedRouteUpdatesTimer = 0;
  }
}

- (void)_sendRouteDetailsAndStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[(GEOCompanionRouteDetails *)self->_companionRouteDetails copy];
  id v5 = (void *)[(GEOCompanionRouteStatus *)self->_companionRouteStatus copy];
  id v6 = v5;
  if (v4 && ![v5 hasFeedbackType])
  {
    BOOL v10 = 1;
  }
  else
  {
    [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteStatus];
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = NSStringFromSelector(a2);
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = [(MNCompanionNavigationAdapter *)self delegate];
    [v9 updateNavigationRouteDetails:v4 routeStatus:v6];

    BOOL v10 = 0;
  }
  self->_shouldSendRouteWithStatus = v10;
}

- (void)_sendRouteStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteStatus];
  id v4 = (void *)[(GEOCompanionRouteStatus *)self->_companionRouteStatus copy];
  if ([v4 hasFeedbackType])
  {
    if (self->_shouldSendRouteWithStatus)
    {
      [(MNCompanionNavigationAdapter *)self _sendRouteDetailsAndStatus];
    }
    else
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = NSStringFromSelector(a2);
        int v10 = 138543362;
        int v11 = v8;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v9 = [(MNCompanionNavigationAdapter *)self delegate];
      [v9 updateNavigationRouteStatus:v4];
    }
    [(MNCompanionNavigationAdapter *)self _markCurrentHapticsAsTriggered];
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(a2);
      int v10 = 138543618;
      int v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = @"early return; no feedback type";
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_sendRouteUpdates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteUpdates];
  id v4 = self->_companionRouteUpdates;
  if ([(NSArray *)v4 count])
  {
    companionRouteUpdates = self->_companionRouteUpdates;
    self->_companionRouteUpdates = 0;

    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = v4;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
          uint64_t v14 = [(MNCompanionNavigationAdapter *)self delegate];
          [v14 updateNavigationRouteWithUpdate:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)_markCurrentHapticsAsTriggered
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    int v7 = [(GEOCompanionRouteStatus *)self->_companionRouteStatus hasHapticsType];
    if (v7)
    {
      int v8 = NSString;
      uint64_t v9 = [(GEOCompanionRouteStatus *)self->_companionRouteStatus hapticsType];
      objc_super v2 = @"NO_TURN";
      switch((int)v9)
      {
        case 0:
          break;
        case 1:
          objc_super v2 = @"LEFT_TURN";
          break;
        case 2:
          objc_super v2 = @"RIGHT_TURN";
          break;
        case 3:
          objc_super v2 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          objc_super v2 = @"U_TURN";
          break;
        case 5:
          objc_super v2 = @"FOLLOW_ROAD";
          break;
        case 6:
          objc_super v2 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          objc_super v2 = @"EXIT_ROUNDABOUT";
          break;
        case 11:
          objc_super v2 = @"OFF_RAMP";
          break;
        case 12:
          objc_super v2 = @"ON_RAMP";
          break;
        case 16:
          objc_super v2 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 17:
          objc_super v2 = @"START_ROUTE";
          break;
        case 18:
          objc_super v2 = @"ARRIVE_AT_DESTINATION";
          break;
        case 20:
          objc_super v2 = @"KEEP_LEFT";
          break;
        case 21:
          objc_super v2 = @"KEEP_RIGHT";
          break;
        case 22:
          objc_super v2 = @"ENTER_FERRY";
          break;
        case 23:
          objc_super v2 = @"EXIT_FERRY";
          break;
        case 24:
          objc_super v2 = @"CHANGE_FERRY";
          break;
        case 25:
          objc_super v2 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 26:
          objc_super v2 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 27:
          objc_super v2 = @"LEFT_TURN_AT_END";
          break;
        case 28:
          objc_super v2 = @"RIGHT_TURN_AT_END";
          break;
        case 29:
          objc_super v2 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 30:
          objc_super v2 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 33:
          objc_super v2 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 34:
          objc_super v2 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 35:
          objc_super v2 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 39:
          objc_super v2 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 41:
          objc_super v2 = @"ROUNDABOUT_EXIT_1";
          break;
        case 42:
          objc_super v2 = @"ROUNDABOUT_EXIT_2";
          break;
        case 43:
          objc_super v2 = @"ROUNDABOUT_EXIT_3";
          break;
        case 44:
          objc_super v2 = @"ROUNDABOUT_EXIT_4";
          break;
        case 45:
          objc_super v2 = @"ROUNDABOUT_EXIT_5";
          break;
        case 46:
          objc_super v2 = @"ROUNDABOUT_EXIT_6";
          break;
        case 47:
          objc_super v2 = @"ROUNDABOUT_EXIT_7";
          break;
        case 48:
          objc_super v2 = @"ROUNDABOUT_EXIT_8";
          break;
        case 49:
          objc_super v2 = @"ROUNDABOUT_EXIT_9";
          break;
        case 50:
          objc_super v2 = @"ROUNDABOUT_EXIT_10";
          break;
        case 51:
          objc_super v2 = @"ROUNDABOUT_EXIT_11";
          break;
        case 52:
          objc_super v2 = @"ROUNDABOUT_EXIT_12";
          break;
        case 53:
          objc_super v2 = @"ROUNDABOUT_EXIT_13";
          break;
        case 54:
          objc_super v2 = @"ROUNDABOUT_EXIT_14";
          break;
        case 55:
          objc_super v2 = @"ROUNDABOUT_EXIT_15";
          break;
        case 56:
          objc_super v2 = @"ROUNDABOUT_EXIT_16";
          break;
        case 57:
          objc_super v2 = @"ROUNDABOUT_EXIT_17";
          break;
        case 58:
          objc_super v2 = @"ROUNDABOUT_EXIT_18";
          break;
        case 59:
          objc_super v2 = @"ROUNDABOUT_EXIT_19";
          break;
        case 60:
          objc_super v2 = @"SHARP_LEFT_TURN";
          break;
        case 61:
          objc_super v2 = @"SHARP_RIGHT_TURN";
          break;
        case 62:
          objc_super v2 = @"SLIGHT_LEFT_TURN";
          break;
        case 63:
          objc_super v2 = @"SLIGHT_RIGHT_TURN";
          break;
        case 64:
          objc_super v2 = @"CHANGE_HIGHWAY";
          break;
        case 65:
          objc_super v2 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 66:
          objc_super v2 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 80:
          objc_super v2 = @"TOLL_STATION";
          break;
        case 81:
          objc_super v2 = @"ENTER_TUNNEL";
          break;
        case 82:
          objc_super v2 = @"WAYPOINT_STOP";
          break;
        case 83:
          objc_super v2 = @"WAYPOINT_STOP_LEFT";
          break;
        case 84:
          objc_super v2 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 85:
          objc_super v2 = @"RESUME_ROUTE";
          break;
        case 86:
          objc_super v2 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 87:
          objc_super v2 = @"CUSTOM";
          break;
        case 88:
          objc_super v2 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
          objc_super v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      uint64_t v10 = [v8 stringWithFormat:@"%@ -> %@", v2, @"NO_TURN"];
    }
    else
    {
      uint64_t v10 = @"N/A";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);
    if (v7)
    {
    }
  }

  if ([(GEOCompanionRouteStatus *)self->_companionRouteStatus hasHapticsType]) {
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setHapticsType:0];
  }
}

- (void)navigationServiceDidSynchronize:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = NSStringFromSelector(a2);
    int v8 = MNNavigationServiceStateAsString([v5 state]);
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%{public}@ with state %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (![v5 state])
  {
    if (([(GEOCompanionRouteStatus *)self->_companionRouteStatus isNavigating] & 1) != 0
      || ([(GEOCompanionRouteDetails *)self->_companionRouteDetails routeID],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 length],
          v9,
          v10))
    {
      [(MNCompanionNavigationAdapter *)self _handleNavigationServiceStopped];
    }
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4 > 3 || a5 < 4)
  {
    if (a4 >= 4 && !a5) {
      [(MNCompanionNavigationAdapter *)self _handleNavigationServiceStopped];
    }
  }
  else
  {
    [(MNCompanionNavigationAdapter *)self _reloadRouteFromNavigationService:v8];
  }
  [(MNCompanionNavigationAdapter *)self setIsNavigatingInLowGuidance:a5 == 5];
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v6 = [a3 route];
  int v7 = [v6 legs];
  if ([v7 count] - 1 == a4) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 7;
  }

  [(MNCompanionNavigationAdapter *)self _setNavigationState:v8];
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  if ([(GEONavigationGuidanceState *)self->_guidanceState navigationState] == 7)
  {
    [(MNCompanionNavigationAdapter *)self _setNavigationState:1];
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MNGetPuckTrackingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 uuid];
    int v10 = 138412290;
    int v11 = v7;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNCompanionNavigationAdapter::navigationService:didUpdateMatchedLocation:", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v5];
  [(MNCompanionNavigationAdapter *)self _setLastLocation:v8];
  id v9 = [v5 routeMatch];
  [(MNCompanionNavigationAdapter *)self _setRouteMatch:v9];
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v17 = a4;
  id v8 = a5;
  id v9 = [(GEOComposedRoute *)self->_route uniqueRouteID];
  int v10 = [v17 routeID];
  unint64_t v11 = v9;
  unint64_t v12 = v10;
  if (!(v11 | v12)
    || (__int16 v13 = (void *)v12,
        int v14 = [(id)v11 isEqual:v12],
        v13,
        (id)v11,
        v13,
        (id)v11,
        v14))
  {
    double v15 = (double)(unint64_t)[v17 displayRemainingMinutesToEndOfLeg] * 60.0;
    [v8 distanceRemainingToEndOfLeg];
    -[MNCompanionNavigationAdapter _setPositionFromDestination:](self, "_setPositionFromDestination:", v15, v16);
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  [(GEOCompanionRouteStatus *)self->_companionRouteStatus setFeedbackType:5];
  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  [(GEOCompanionRouteStatus *)self->_companionRouteStatus setFeedbackType:1];
  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 destinationName];
  [(MNCompanionNavigationAdapter *)self _setDestinationName:v9];

  id v11 = [v7 traffic];
  uint64_t v10 = [v8 traceIsPlaying];

  [(MNCompanionNavigationAdapter *)self _setRoute:v7 traffic:v11 isTrace:v10];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  -[MNCompanionNavigationAdapter _setRoute:traffic:isTrace:](self, "_setRoute:traffic:isTrace:", v10, v9, [a3 traceIsPlaying]);
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = objc_msgSend(a4, "primarySign", a3);
  id v6 = [v5 displayRemainingDistance];
  id v7 = [MEMORY[0x1E4F291E0] meters];
  id v8 = [v6 measurementByConvertingToUnit:v7];

  [v8 doubleValue];
  -[MNCompanionNavigationAdapter _setPositionFromManeuver:](self, "_setPositionFromManeuver:");
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  id v9 = objc_msgSend(a3, "route", a4, a5);
  id v10 = [v9 composedGuidanceEvents];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    [(MNCompanionNavigationAdapter *)self _setDisplayedStepIndex:a6];
    [(MNCompanionNavigationAdapter *)self _setPositionFromManeuver:a4];
  }
}

- (void)navigationService:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
}

- (void)navigationService:(id)a3 triggerHaptics:(int)a4
{
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  objc_msgSend(a4, "allObjects", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MNCompanionNavigationAdapter *)self _setRealtimeUpdates:v5];
}

- (void)navigationService:(id)a3 didReceiveTransitAlert:(id)a4
{
  id v13 = a4;
  id v5 = [v13 command];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v6 = [v13 command];

    if (v6) {
      goto LABEL_5;
    }
  }
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  id v9 = [v8 UUIDString];
  [v7 setIdentifier:v9];

  objc_msgSend(v7, "setStepID:", objc_msgSend(v13, "stepIndex"));
  objc_msgSend(v7, "setStopID:", objc_msgSend(v13, "stopIndex"));
  id v10 = [v13 artwork];
  [v7 setArtwork:v10];

  uint64_t v11 = [v13 command];
  [v7 setTitle:v11];

  unint64_t v12 = [v13 detail];
  [v7 setDetail:v12];

  [(MNCompanionNavigationAdapter *)self _setTransitAlightMessage:v7];
LABEL_5:
}

- (void)navigationService:(id)a3 didUpdateRouteWithNewRideSelection:(id)a4
{
  companionRouteStatus = self->_companionRouteStatus;
  id v6 = a4;
  id v7 = [v6 uniqueRouteID];
  id v8 = objc_msgSend(v7, "_maps_data");
  [(GEOCompanionRouteStatus *)companionRouteStatus updateClusteredSectionSelectedRideIndicesFromRoute:v6 routeID:v8];

  [(MNCompanionNavigationAdapter *)self _scheduleCoalescedRouteStatusUpdate];
}

- (void)_reloadRouteFromNavigationService:(id)a3
{
  id v10 = a3;
  id v4 = [v10 route];
  if (v4)
  {
    id v5 = [v10 destinationName];
    [(MNCompanionNavigationAdapter *)self _setDestinationName:v5];

    id v6 = [v4 traffic];
    -[MNCompanionNavigationAdapter _setRoute:traffic:isTrace:](self, "_setRoute:traffic:isTrace:", v4, v6, [v10 traceIsPlaying]);

    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    id v8 = [v10 realtimeUpdatesForRoutes:v7];
    id v9 = [v8 allObjects];
    [(MNCompanionNavigationAdapter *)self _setRealtimeUpdates:v9];
  }
  else
  {
    [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteStatus];
    [(MNCompanionNavigationAdapter *)self _cancelScheduledRouteUpdates];
  }
}

- (void)_handleNavigationServiceStopped
{
  [(MNCompanionNavigationAdapter *)self _reset];
  [(MNCompanionNavigationAdapter *)self _sendRouteDetailsAndStatus];
}

- (MNCompanionNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNCompanionNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_coalescedRouteUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_coalescedRouteStatusTimer, 0);
  objc_storeStrong((id *)&self->_companionRouteUpdates, 0);
  objc_storeStrong((id *)&self->_companionRouteStatus, 0);
  objc_storeStrong((id *)&self->_companionRouteDetails, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

@end