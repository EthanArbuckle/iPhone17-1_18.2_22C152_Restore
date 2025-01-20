@interface MNNavigationDetails
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)lastOriginalRouteCoordinate;
- (BOOL)guidancePromptsEnabled;
- (BOOL)isApproachingWaypoint;
- (BOOL)isDetour;
- (BOOL)isFollowingOriginalRoute;
- (BOOL)isInPreArrivalState;
- (BOOL)isResumingMultipointRoute;
- (BOOL)isServer;
- (BOOL)traceIsPlaying;
- (GEOComposedRoute)currentRoute;
- (GEOComposedRoute)originalRoute;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (GEONavigationGuidanceState)guidanceState;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (MNActiveRouteInfo)backgroundWalkingRouteInfo;
- (MNArrivalInfo)arrivalInfo;
- (MNBatteryChargeInfo)batteryChargeInfo;
- (MNDisplayETAInfo)displayETAInfo;
- (MNGuidanceLaneInfo)activeLaneInfo;
- (MNLocation)location;
- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent;
- (MNNavigationDetails)initWithCoder:(id)a3;
- (MNRouteDistanceInfo)remainingDistanceInfo;
- (MNVehicleParkingInfo)vehicleParkingInfo;
- (NSArray)alternateRoutes;
- (NSArray)previewRoutes;
- (NSArray)spokenAnnouncements;
- (NSArray)traceBookmarks;
- (NSMapTable)routeIDLookup;
- (NSMutableDictionary)routeLookup;
- (NSString)currentVoiceLanguage;
- (NSString)displayString;
- (NSString)tracePath;
- (double)distanceUntilManeuver;
- (double)distanceUntilSign;
- (double)proceedToRouteDistance;
- (double)timeUntilManeuver;
- (double)timeUntilSign;
- (double)traceDuration;
- (double)tracePosition;
- (id)description;
- (id)initForServer:(BOOL)a3;
- (id)removeTrafficIncidentAlert:(id)a3;
- (id)routeInfoForID:(id)a3;
- (id)routeInfoForRoute:(id)a3;
- (id)routeLookupIDs;
- (id)updateWithTrafficIncidentAlert:(id)a3;
- (int)desiredTransportType;
- (int)headingOrientation;
- (int)navigationState;
- (int64_t)desiredNavigationType;
- (int64_t)navigationType;
- (int64_t)simulationType;
- (int64_t)upcomingAnchorPointIndex;
- (unint64_t)closestStepIndex;
- (unint64_t)displayedStepIndex;
- (unint64_t)initialRouteSource;
- (unint64_t)reconnectionRouteIndex;
- (unint64_t)routeIndex;
- (unint64_t)segmentIndex;
- (unint64_t)selectedPreviewRouteIndex;
- (unint64_t)state;
- (unint64_t)stepIndex;
- (unint64_t)targetLegIndex;
- (unint64_t)voiceGuidanceLevel;
- (void)_updateRouteIDLookup;
- (void)copySerializableValuesFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markAnnouncementSpoken:(id)a3;
- (void)setActiveLaneInfo:(id)a3;
- (void)setActiveNavTrayGuidanceEvent:(id)a3;
- (void)setAlternateRoutes:(id)a3;
- (void)setArrivalInfo:(id)a3;
- (void)setBackgroundWalkingRouteInfo:(id)a3;
- (void)setClosestStepIndex:(unint64_t)a3;
- (void)setCurrentRoute:(id)a3 withAlternateRoutes:(id)a4;
- (void)setCurrentVoiceLanguage:(id)a3;
- (void)setDesiredNavigationType:(int64_t)a3;
- (void)setDesiredTransportType:(int)a3;
- (void)setDirectionsRequest:(id)a3;
- (void)setDirectionsResponse:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setDistanceUntilManeuver:(double)a3;
- (void)setDistanceUntilSign:(double)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setGuidanceState:(id)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setInitialRouteSource:(unint64_t)a3;
- (void)setIsApproachingWaypoint:(BOOL)a3;
- (void)setIsDetour:(BOOL)a3;
- (void)setIsInPreArrivalState:(BOOL)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setNavigationState:(int)a3;
- (void)setNavigationType:(int64_t)a3;
- (void)setPreviewRoutes:(id)a3 withSelectedRouteIndex:(unint64_t)a4;
- (void)setProceedToRouteDistance:(double)a3;
- (void)setResumeRouteHandle:(id)a3;
- (void)setSimulationType:(int64_t)a3;
- (void)setSpokenAnnouncements:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
- (void)setTimeUntilManeuver:(double)a3;
- (void)setTimeUntilSign:(double)a3;
- (void)setTraceBookmarks:(id)a3;
- (void)setTraceDuration:(double)a3;
- (void)setTraceIsPlaying:(BOOL)a3;
- (void)setTracePath:(id)a3;
- (void)setTracePosition:(double)a3;
- (void)setVehicleParkingInfo:(id)a3;
- (void)setVoiceGuidanceLevel:(unint64_t)a3;
- (void)updateETATrafficForRoute:(id)a3;
- (void)updateWithNavigationServiceCallbackParameters:(id)a3;
@end

@implementation MNNavigationDetails

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (unint64_t)stepIndex
{
  return [(MNLocation *)self->_location stepIndex];
}

- (GEOComposedRoute)currentRoute
{
  return [(MNActiveRouteInfo *)self->_currentRoute route];
}

- (int)navigationState
{
  return self->_navigationState;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)routeLookupIDs
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15;
  v8 = __Block_byref_object_dispose__15;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceBookmarks, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_vehicleParkingInfo, 0);
  objc_storeStrong((id *)&self->_backgroundWalkingRouteInfo, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_activeLaneInfo, 0);
  objc_storeStrong((id *)&self->_currentVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeLookupLock, 0);
  objc_storeStrong((id *)&self->_spokenAnnouncements, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlerts, 0);
  objc_storeStrong((id *)&self->_routeLookup, 0);
  objc_storeStrong((id *)&self->_routeIDLookup, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NavigationDetailsEncoding", "", buf, 2u);
  }

  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails state](self, "state"), @"State");
  [v4 encodeInteger:self->_desiredNavigationType forKey:@"_desiredNavigationType"];
  [v4 encodeInteger:self->_navigationType forKey:@"_navigationType"];
  [v4 encodeInteger:self->_desiredTransportType forKey:@"_desiredTransportType"];
  [v4 encodeInteger:self->_initialRouteSource forKey:@"_initialRouteSource"];
  objc_msgSend(v4, "encodeBool:forKey:", -[MNNavigationDetails guidancePromptsEnabled](self, "guidancePromptsEnabled"), @"GuidancePromptsEnabled");
  objc_msgSend(v4, "encodeInt32:forKey:", -[MNNavigationDetails navigationState](self, "navigationState"), @"NavigationState");
  [(MNNavigationDetails *)self proceedToRouteDistance];
  objc_msgSend(v4, "encodeDouble:forKey:", @"ProceedToRouteDistance");
  id v9 = [(MNNavigationDetails *)self displayString];

  if (v9)
  {
    v10 = [(MNNavigationDetails *)self displayString];
    [v4 encodeObject:v10 forKey:@"DisplayString"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails closestStepIndex](self, "closestStepIndex"), @"ClosestStepIndex");
  [(MNNavigationDetails *)self distanceUntilSign];
  objc_msgSend(v4, "encodeDouble:forKey:", @"DistanceUntilSign");
  [(MNNavigationDetails *)self timeUntilSign];
  objc_msgSend(v4, "encodeDouble:forKey:", @"TimeUntilSign");
  [(MNNavigationDetails *)self distanceUntilManeuver];
  objc_msgSend(v4, "encodeDouble:forKey:", @"DistanceUntilManeuver");
  [(MNNavigationDetails *)self timeUntilManeuver];
  objc_msgSend(v4, "encodeDouble:forKey:", @"TimeUntilManeuver");
  v11 = [(MNNavigationDetails *)self currentVoiceLanguage];

  if (v11)
  {
    v12 = [(MNNavigationDetails *)self currentVoiceLanguage];
    [v4 encodeObject:v12 forKey:@"CurrentVoiceLanguage"];
  }
  [v4 encodeInteger:self->_voiceGuidanceLevel forKey:@"_voiceGuidanceLevel"];
  currentRoute = self->_currentRoute;
  if (currentRoute) {
    [v4 encodeObject:currentRoute forKey:@"CurrentRoute"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails routeIndex](self, "routeIndex"), @"RouteIndex");
  [v4 encodeObject:self->_alternateRoutes forKey:@"AlternateRoutes"];
  [v4 encodeObject:self->_previewRoutes forKey:@"PreviewRoutes"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails selectedPreviewRouteIndex](self, "selectedPreviewRouteIndex"), @"SelectePreviewRouteIndex");
  [v4 encodeBytes:&self->_lastOriginalRouteCoordinate length:8 forKey:@"_lastOriginalRouteCoordinate"];
  [v4 encodeInteger:self->_targetLegIndex forKey:@"_targetLegIndex"];
  [v4 encodeInteger:self->_upcomingAnchorPointIndex forKey:@"_upcomingAnchorPointIndex"];
  if ([(MNNavigationDetails *)self displayedStepIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = -1;
  }
  else {
    unint64_t v14 = [(MNNavigationDetails *)self displayedStepIndex];
  }
  [v4 encodeInteger:v14 forKey:@"DisplayedStepIndex"];
  [v4 encodeObject:self->_activeLaneInfo forKey:@"_activeLaneInfo"];
  [v4 encodeObject:self->_activeNavTrayGuidanceEvent forKey:@"_activeNavTrayGuidanceEvent"];
  [v4 encodeObject:self->_arrivalInfo forKey:@"_arrivalInfo"];
  [v4 encodeObject:self->_backgroundWalkingRouteInfo forKey:@"_backgroundWalkingRouteInfo"];
  [v4 encodeObject:self->_vehicleParkingInfo forKey:@"_vehicleParkingInfo"];
  [v4 encodeObject:self->_resumeRouteHandle forKey:@"_resumeRouteHandle"];
  [v4 encodeObject:self->_tracePath forKey:@"_tracePath"];
  [v4 encodeObject:self->_traceBookmarks forKey:@"_traceBookmarks"];
  [v4 encodeDouble:@"_traceDuration" forKey:self->_traceDuration];
  [v4 encodeDouble:@"_tracePosition" forKey:self->_tracePosition];
  [v4 encodeBool:self->_traceIsPlaying forKey:@"_traceIsPlaying"];
  [v4 encodeInteger:self->_simulationType forKey:@"_simulationType"];
  [v4 encodeBool:self->_isResumingMultipointRoute forKey:@"_isResumingMultipointRoute"];
  [v4 encodeBool:self->_isApproachingWaypoint forKey:@"_isApproachingWaypoint"];
  v15 = v8;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v16, OS_SIGNPOST_INTERVAL_END, v6, "NavigationDetailsEncoding", "", v17, 2u);
  }
}

- (MNNavigationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NavigationDetailsDecoding", "", buf, 2u);
  }

  v61.receiver = self;
  v61.super_class = (Class)MNNavigationDetails;
  id v9 = [(MNNavigationDetails *)&v61 init];
  if (v9)
  {
    v9->_state = [v4 decodeIntegerForKey:@"State"];
    v9->_desiredNavigationType = [v4 decodeIntegerForKey:@"_desiredNavigationType"];
    v9->_navigationType = [v4 decodeIntegerForKey:@"_navigationType"];
    v9->_desiredTransportType = [v4 decodeIntegerForKey:@"_desiredTransportType"];
    v9->_initialRouteSource = [v4 decodeIntegerForKey:@"_initialRouteSource"];
    v9->_guidancePromptsEnabled = [v4 decodeBoolForKey:@"GuidancePromptsEnabled"];
    v9->_navigationState = [v4 decodeInt32ForKey:@"NavigationState"];
    [v4 decodeDoubleForKey:@"ProceedToRouteDistance"];
    v9->_proceedToRouteDistance = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayString"];
    displayString = v9->_displayString;
    v9->_displayString = (NSString *)v11;

    v9->_closestStepIndex = [v4 decodeIntegerForKey:@"ClosestStepIndex"];
    [v4 decodeDoubleForKey:@"DistanceUntilSign"];
    v9->_distanceUntilSign = v13;
    [v4 decodeDoubleForKey:@"TimeUntilSign"];
    v9->_timeUntilSign = v14;
    [v4 decodeDoubleForKey:@"DistanceUntilManeuver"];
    v9->_distanceUntilManeuver = v15;
    [v4 decodeDoubleForKey:@"TimeUntilManeuver"];
    v9->_timeUntilManeuver = v16;
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentVoiceLanguage"];
    currentVoiceLanguage = v9->_currentVoiceLanguage;
    v9->_currentVoiceLanguage = (NSString *)v17;

    v9->_voiceGuidanceLevel = [v4 decodeIntegerForKey:@"_voiceGuidanceLevel"];
    v9->_routeIndex = [v4 decodeIntegerForKey:@"RouteIndex"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentRoute"];
    currentRoute = v9->_currentRoute;
    v9->_currentRoute = (MNActiveRouteInfo *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"AlternateRoutes"];
    alternateRoutes = v9->_alternateRoutes;
    v9->_alternateRoutes = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"AlternateRoutes"];
    previewRoutes = v9->_previewRoutes;
    v9->_previewRoutes = (NSArray *)v29;

    v9->_selectedPreviewRouteIndex = [v4 decodeIntegerForKey:@"SelectePreviewRouteIndex"];
    *(void *)buf = 0;
    id v31 = v4;
    v32 = (const void *)[v31 decodeBytesForKey:@"_lastOriginalRouteCoordinate" returnedLength:buf];
    if (*(void *)buf && v32)
    {
      if (*(void *)buf >= 8uLL) {
        size_t v33 = 8;
      }
      else {
        size_t v33 = *(void *)buf;
      }
      memcpy(&v9->_lastOriginalRouteCoordinate, v32, v33);
    }
    v9->_targetLegIndex = [v31 decodeIntegerForKey:@"_targetLegIndex"];
    v9->_upcomingAnchorPointIndex = [v31 decodeIntegerForKey:@"_upcomingAnchorPointIndex"];
    uint64_t v34 = [v31 decodeIntegerForKey:@"DisplayedStepIndex"];
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
    if (v34 >= 0) {
      uint64_t v35 = v34;
    }
    v9->_displayedStepIndex = v35;
    uint64_t v36 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_activeLaneInfo"];
    activeLaneInfo = v9->_activeLaneInfo;
    v9->_activeLaneInfo = (MNGuidanceLaneInfo *)v36;

    uint64_t v38 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_activeNavTrayGuidanceEvent"];
    activeNavTrayGuidanceEvent = v9->_activeNavTrayGuidanceEvent;
    v9->_activeNavTrayGuidanceEvent = (MNNavTrayGuidanceEvent *)v38;

    uint64_t v40 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_arrivalInfo"];
    arrivalInfo = v9->_arrivalInfo;
    v9->_arrivalInfo = (MNArrivalInfo *)v40;

    uint64_t v42 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundWalkingRouteInfo"];
    backgroundWalkingRouteInfo = v9->_backgroundWalkingRouteInfo;
    v9->_backgroundWalkingRouteInfo = (MNActiveRouteInfo *)v42;

    uint64_t v44 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_vehicleParkingInfo"];
    vehicleParkingInfo = v9->_vehicleParkingInfo;
    v9->_vehicleParkingInfo = (MNVehicleParkingInfo *)v44;

    uint64_t v46 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_resumeRouteHandle"];
    resumeRouteHandle = v9->_resumeRouteHandle;
    v9->_resumeRouteHandle = (GEOResumeRouteHandle *)v46;

    uint64_t v48 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"_tracePath"];
    tracePath = v9->_tracePath;
    v9->_tracePath = (NSString *)v48;

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    uint64_t v53 = [v31 decodeObjectOfClasses:v52 forKey:@"_traceBookmarks"];
    traceBookmarks = v9->_traceBookmarks;
    v9->_traceBookmarks = (NSArray *)v53;

    [v31 decodeDoubleForKey:@"_traceDuration"];
    v9->_traceDuration = v55;
    [v31 decodeDoubleForKey:@"_tracePosition"];
    v9->_tracePosition = v56;
    v9->_traceIsPlaying = [v31 decodeBoolForKey:@"_traceIsPlaying"];
    v9->_simulationType = [v31 decodeIntegerForKey:@"_simulationType"];
    v9->_isResumingMultipointRoute = [v31 decodeBoolForKey:@"_isResumingMultipointRoute"];
    v9->_isApproachingWaypoint = [v31 decodeBoolForKey:@"_isApproachingWaypoint"];
  }
  v57 = v8;
  v58 = v57;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v58, OS_SIGNPOST_INTERVAL_END, v6, "NavigationDetailsDecoding", "", buf, 2u);
  }

  return v9;
}

- (unint64_t)displayedStepIndex
{
  return self->_displayedStepIndex;
}

- (void)copySerializableValuesFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    self->_state = [v4 state];
    self->_navigationType = [v5 navigationType];
    self->_desiredNavigationType = [v5 desiredNavigationType];
    self->_desiredTransportType = [v5 desiredTransportType];
    self->_initialRouteSource = [v5 initialRouteSource];
    self->_guidancePromptsEnabled = [v5 guidancePromptsEnabled];
    self->_navigationState = [v5 navigationState];
    [v5 proceedToRouteDistance];
    self->_proceedToRouteDistance = v6;
    v7 = [v5 displayString];
    displayString = self->_displayString;
    self->_displayString = v7;

    self->_closestStepIndex = [v5 closestStepIndex];
    [v5 distanceUntilSign];
    self->_distanceUntilSign = v9;
    [v5 timeUntilSign];
    self->_timeUntilSign = v10;
    [v5 distanceUntilManeuver];
    self->_distanceUntilManeuver = v11;
    [v5 timeUntilManeuver];
    self->_timeUntilManeuver = v12;
    double v13 = [v5 currentVoiceLanguage];
    currentVoiceLanguage = self->_currentVoiceLanguage;
    self->_currentVoiceLanguage = v13;

    self->_voiceGuidanceLevel = *((void *)v5 + 38);
    self->_routeIndex = [v5 routeIndex];
    self->_selectedPreviewRouteIndex = [v5 selectedPreviewRouteIndex];
    objc_storeStrong((id *)&self->_previewRoutes, *((id *)v5 + 10));
    self->_lastOriginalRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)*((void *)v5 + 27);
    self->_targetLegIndex = *((void *)v5 + 12);
    self->_upcomingAnchorPointIndex = *((void *)v5 + 28);
    self->_displayedStepIndex = *((void *)v5 + 29);
    self->_isResumingMultipointRoute = *((unsigned char *)v5 + 153);
    self->_isApproachingWaypoint = *((unsigned char *)v5 + 154);
    objc_storeStrong((id *)&self->_activeLaneInfo, *((id *)v5 + 39));
    objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, *((id *)v5 + 40));
    objc_storeStrong((id *)&self->_arrivalInfo, *((id *)v5 + 41));
    objc_storeStrong((id *)&self->_backgroundWalkingRouteInfo, *((id *)v5 + 42));
    objc_storeStrong((id *)&self->_vehicleParkingInfo, *((id *)v5 + 43));
    objc_storeStrong((id *)&self->_resumeRouteHandle, *((id *)v5 + 13));
    uint64_t v15 = *((void *)v5 + 9);
    if (v15)
    {
      [(MNNavigationDetails *)self setCurrentRoute:v15 withAlternateRoutes:*((void *)v5 + 11)];
    }
    else
    {
      currentRoute = self->_currentRoute;
      self->_currentRoute = 0;

      alternateRoutes = self->_alternateRoutes;
      self->_alternateRoutes = 0;

      [(NSMapTable *)self->_routeIDLookup removeAllObjects];
    }
    objc_storeStrong((id *)&self->_tracePath, *((id *)v5 + 44));
    objc_storeStrong((id *)&self->_traceBookmarks, *((id *)v5 + 47));
    self->_traceDuration = *((double *)v5 + 45);
    self->_tracePosition = *((double *)v5 + 46);
    self->_traceIsPlaying = *((unsigned char *)v5 + 157);
    self->_simulationType = *((void *)v5 + 48);
  }
  else
  {
    v18 = [NSString stringWithFormat:@"Attempting to copy nil navigation details"];
    uint64_t v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      v21 = "-[MNNavigationDetails copySerializableValuesFrom:]";
      __int16 v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v24 = 1024;
      int v25 = 237;
      __int16 v26 = 2080;
      uint64_t v27 = "other";
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v20, 0x30u);
    }
  }
}

- (double)timeUntilSign
{
  return self->_timeUntilSign;
}

- (double)timeUntilManeuver
{
  return self->_timeUntilManeuver;
}

- (unint64_t)selectedPreviewRouteIndex
{
  return self->_selectedPreviewRouteIndex;
}

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (double)proceedToRouteDistance
{
  return self->_proceedToRouteDistance;
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (double)distanceUntilSign
{
  return self->_distanceUntilSign;
}

- (double)distanceUntilManeuver
{
  return self->_distanceUntilManeuver;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)currentVoiceLanguage
{
  return self->_currentVoiceLanguage;
}

- (unint64_t)closestStepIndex
{
  return self->_closestStepIndex;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (int)desiredTransportType
{
  return self->_desiredTransportType;
}

- (int64_t)desiredNavigationType
{
  return self->_desiredNavigationType;
}

void __37__MNNavigationDetails_routeLookupIDs__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)routeLookup
{
  return self->_routeLookup;
}

- (id)initForServer:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MNNavigationDetails;
  id v4 = [(MNNavigationDetails *)&v12 init];
  id v5 = (int64x2_t *)v4;
  if (v4)
  {
    v4->_isServer = a3;
    v4->_navigationType = 0;
    v4->_desiredNavigationType = 0;
    v4->_state = 0;
    v4->_desiredTransportType = 4;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)v5[7].i64[1];
    v5[7].i64[1] = v6;

    uint64_t v8 = geo_isolater_create();
    double v9 = (void *)v5[9].i64[0];
    v5[9].i64[0] = v8;

    v5[13].i64[1] = *MEMORY[0x1E4F64198];
    v5[6].i64[0] = 0x7FFFFFFFFFFFFFFFLL;
    v5[14] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v5[24].i64[0] = 0;
    double v10 = v5;
  }

  return v5;
}

- (void)updateWithNavigationServiceCallbackParameters:(id)a3
{
  id v21 = a3;
  switch([v21 type])
  {
    case 1:
      self->_voiceGuidanceLevel = [v21 voiceGuidanceLevel];
      break;
    case 7:
      id v4 = [v21 location];
      [(MNNavigationDetails *)self setLocation:v4];
      goto LABEL_12;
    case 8:
      id v5 = [v21 navTrayGuidanceEvent];
      activeNavTrayGuidanceEvent = self->_activeNavTrayGuidanceEvent;
      self->_activeNavTrayGuidanceEvent = v5;
      goto LABEL_6;
    case 9:
      v7 = [v21 resumeRouteHandle];
      activeNavTrayGuidanceEvent = self->_resumeRouteHandle;
      self->_resumeRouteHandle = v7;
LABEL_6:

      break;
    case 11:
      id v8 = v21;
      self->_targetLegIndex = [v8 targetLegIndex];
      uint64_t v9 = [v8 targetLegIndex];

      [(MNArrivalInfo *)self->_arrivalInfo setLegIndex:v9];
      break;
    case 12:
      self->_upcomingAnchorPointIndex = [v21 anchorPointIndex];
      break;
    case 15:
      id v4 = v21;
      double v10 = [v4 routeInfo];
      double v11 = [v10 route];
      [(MNNavigationDetails *)self setCurrentRoute:v10 withAlternateRoutes:0];
      self->_desiredNavigationType = [v4 navigationType];
      self->_navigationType = [v4 navigationType];
      self->_simulationType = [v4 simulationType];
      self->_initialRouteSource = [v4 initialRouteSource];
      objc_super v12 = [v11 routeInitializerData];
      double v13 = [v12 directionsRequest];
      directionsRequest = self->_directionsRequest;
      self->_directionsRequest = v13;

      uint64_t v15 = [v11 routeInitializerData];
      double v16 = [v15 directionsResponse];
      directionsResponse = self->_directionsResponse;
      self->_directionsResponse = v16;

      if (!self->_isServer) {
        objc_storeStrong((id *)&self->_originalRoute, v11);
      }
      v18 = [v4 voiceLanguage];
      uint64_t v19 = (NSString *)[v18 copy];
      currentVoiceLanguage = self->_currentVoiceLanguage;
      self->_currentVoiceLanguage = v19;

      self->_isResumingMultipointRoute = [v4 isResumingMultiStopRoute];
LABEL_12:

      break;
    default:
      break;
  }
}

- (void)setLocation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (MNLocation *)a3;
  uint64_t v5 = [(MNLocation *)v4 routeID];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = [(MNLocation *)v4 routeMatch];

    if (v7)
    {
      id v8 = [(MNLocation *)v4 routeID];
      uint64_t v9 = [(MNNavigationDetails *)self routeInfoForID:v8];

      if (!v9
        || ([v9 route], double v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
      {
        double v11 = [NSString stringWithFormat:@"Error finding route for matched location"];
        objc_super v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          int v20 = "-[MNNavigationDetails setLocation:]";
          __int16 v21 = 2080;
          __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
          __int16 v23 = 1024;
          int v24 = 372;
          __int16 v25 = 2080;
          __int16 v26 = "routeInfo != nil && routeInfo.route != nil";
          __int16 v27 = 2112;
          __int16 v28 = v11;
          _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
        }
      }
      double v13 = [v9 route];
      double v14 = [(MNLocation *)v4 routeMatch];
      [v14 setRoute:v13];

      uint64_t v15 = [(MNLocation *)v4 routeID];
      double v16 = [(GEOComposedRoute *)self->_originalRoute uniqueRouteID];
      if ([v15 isEqual:v16])
      {
        uint64_t v17 = [(MNLocation *)v4 state];

        if (v17 != 1)
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v15 = [(MNLocation *)v4 routeMatch];
        self->_lastOriginalRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)[v15 routeCoordinate];
      }
      else
      {
      }
      goto LABEL_13;
    }
  }
LABEL_14:
  location = self->_location;
  self->_location = v4;
}

- (MNDisplayETAInfo)displayETAInfo
{
  return [(MNActiveRouteInfo *)self->_currentRoute displayETAInfo];
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  return [(MNActiveRouteInfo *)self->_currentRoute remainingDistanceInfo];
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return [(MNActiveRouteInfo *)self->_currentRoute batteryChargeInfo];
}

- (NSArray)previewRoutes
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_previewRoutes count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_previewRoutes, "count"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_previewRoutes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    unint64_t v8 = 0x1E4F29000uLL;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v6 = 136316162;
    long long v20 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        objc_super v12 = objc_msgSend(v11, "route", v20, (void)v21);

        if (!v12)
        {
          unint64_t v15 = v8;
          double v16 = [*(id *)(v8 + 24) stringWithFormat:@"No route in preview route info."];
          uint64_t v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            __int16 v26 = "-[MNNavigationDetails previewRoutes]";
            __int16 v27 = 2080;
            __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            __int16 v29 = 1024;
            int v30 = 407;
            __int16 v31 = 2080;
            v32 = "previewRouteInfo.route != nil";
            __int16 v33 = 2112;
            uint64_t v34 = v16;
            _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          unint64_t v8 = v15;
        }
        double v13 = [v11 route];

        if (v13)
        {
          double v14 = [v11 route];
          [v3 addObject:v14];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v18 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }

  return (NSArray *)v3;
}

- (NSArray)alternateRoutes
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_alternateRoutes count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_alternateRoutes, "count"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_alternateRoutes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    unint64_t v8 = 0x1E4F29000uLL;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v6 = 136316162;
    long long v20 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        objc_super v12 = objc_msgSend(v11, "route", v20, (void)v21);

        if (!v12)
        {
          unint64_t v15 = v8;
          double v16 = [*(id *)(v8 + 24) stringWithFormat:@"No route in alternate route info."];
          uint64_t v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            __int16 v26 = "-[MNNavigationDetails alternateRoutes]";
            __int16 v27 = 2080;
            __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            __int16 v29 = 1024;
            int v30 = 419;
            __int16 v31 = 2080;
            v32 = "alternateRouteInfo.route != nil";
            __int16 v33 = 2112;
            uint64_t v34 = v16;
            _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          unint64_t v8 = v15;
        }
        double v13 = [v11 route];

        if (v13)
        {
          double v14 = [v11 route];
          [v3 addObject:v14];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v18 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v35 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }

  return (NSArray *)v3;
}

- (unint64_t)segmentIndex
{
  unint64_t v3 = [(MNNavigationDetails *)self stepIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v3;
  long long v6 = [(MNActiveRouteInfo *)self->_currentRoute route];
  unint64_t v7 = [v6 segmentIndexForStepIndex:v5];

  return v7;
}

- (void)setPreviewRoutes:(id)a3 withSelectedRouteIndex:(unint64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a3;
  unint64_t v5 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  unint64_t v7 = v5;
  unint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetPreviewRoutes", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;
  __int16 v33 = v8;

  self->_navigationType = 1;
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v34 = self;
  p_previewRoutes = &self->_previewRoutes;
  uint64_t v10 = self->_previewRoutes;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "routeID", spid, p_previewRoutes, v31, v32, v33);
        if (v15)
        {
          [v9 addObject:v15];
        }
        else
        {
          double v16 = [NSString stringWithFormat:@"Route ID of existing preview route is missing."];
          uint64_t v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v46 = "-[MNNavigationDetails setPreviewRoutes:withSelectedRouteIndex:]";
            __int16 v47 = 2080;
            uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            __int16 v49 = 1024;
            int v50 = 454;
            __int16 v51 = 2080;
            v52 = "routeID";
            __int16 v53 = 2112;
            v54 = v16;
            _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
    }
    while (v12);
  }

  uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = v32;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "routeID", spid);
        if (v24)
        {
          [v18 addObject:v24];
        }
        else
        {
          __int16 v25 = [NSString stringWithFormat:@"Route ID of new preview route is missing."];
          __int16 v26 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v46 = "-[MNNavigationDetails setPreviewRoutes:withSelectedRouteIndex:]";
            __int16 v47 = 2080;
            uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            __int16 v49 = 1024;
            int v50 = 464;
            __int16 v51 = 2080;
            v52 = "routeID";
            __int16 v53 = 2112;
            v54 = v25;
            _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v21);
  }

  if (([v9 isEqualToSet:v18] & 1) == 0) {
    objc_storeStrong((id *)p_previewRoutes, v31);
  }
  v34->_selectedPreviewRouteIndex = a4;
  __int16 v27 = v33;
  __int16 v28 = v27;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v28, OS_SIGNPOST_INTERVAL_END, spid, "SetPreviewRoutes", "", buf, 2u);
  }
}

- (void)setCurrentRoute:(id)a3 withAlternateRoutes:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v6 = (MNActiveRouteInfo *)a3;
  id v79 = a4;
  unint64_t v7 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  unint64_t v78 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SetCurrentRoute", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;
  v77 = v10;

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v82 = self;
  uint64_t v11 = self->_alternateRoutes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v98 objects:v113 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v99;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v99 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v98 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(v16, "routeID", spid);

        if (!v17)
        {
          uint64_t v22 = [NSString stringWithFormat:@"Alternate route ID is nil"];
          long long v23 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
            __int16 v105 = 2080;
            v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            __int16 v107 = 1024;
            int v108 = 485;
            __int16 v109 = 2080;
            v110 = "alternateRoute.routeID";
            __int16 v111 = 2112;
            v112 = v22;
            _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }
        }
        uint64_t v18 = [v16 routeID];
        id v19 = v6;
        uint64_t v20 = [(MNActiveRouteInfo *)v6 routeID];
        char v21 = [v18 isEqual:v20];

        if (v21)
        {
          id v25 = v16;

          os_signpost_id_t v6 = v19;
          if (!v25) {
            goto LABEL_28;
          }
          __int16 v26 = [(MNActiveRouteInfo *)v19 displayETAInfo];
          [v25 setDisplayETAInfo:v26];

          __int16 v27 = [(MNActiveRouteInfo *)v19 remainingDistanceInfo];
          [v25 setRemainingDistanceInfo:v27];

          __int16 v28 = (MNActiveRouteInfo *)v25;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v29 = v79;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v83 objects:v102 count:16];
          id v31 = v82;
          v76 = v28;
          if (v30)
          {
            uint64_t v32 = v30;
            uint64_t v33 = *(void *)v84;
            while (2)
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v84 != v33) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v35 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                long long v36 = [(MNActiveRouteInfo *)v82->_currentRoute routeID];
                long long v37 = [v35 routeID];
                char v38 = [v36 isEqual:v37];

                if (v38)
                {

                  goto LABEL_42;
                }
              }
              uint64_t v32 = [v29 countByEnumeratingWithState:&v83 objects:v102 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }

          geo_isolate_sync();
LABEL_42:
          os_signpost_id_t v6 = v28;
          goto LABEL_43;
        }
        ++v15;
        os_signpost_id_t v6 = v19;
      }
      while (v13 != v15);
      uint64_t v24 = [(NSArray *)v11 countByEnumeratingWithState:&v98 objects:v113 count:16];
      uint64_t v13 = v24;
      if (v24) {
        continue;
      }
      break;
    }
  }

LABEL_28:
  id v31 = v82;
  long long v39 = [(MNActiveRouteInfo *)v82->_currentRoute routeID];

  if (v39)
  {
    uint64_t v93 = MEMORY[0x1E4F143A8];
    uint64_t v94 = 3221225472;
    v95 = __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke;
    v96 = &unk_1E60F6B98;
    v97 = v82;
    geo_isolate_sync();
  }
  if (!v6
    || ([(MNActiveRouteInfo *)v6 routeID],
        long long v40 = objc_claimAutoreleasedReturnValue(),
        v40,
        !v40))
  {
    long long v41 = [NSString stringWithFormat:@"New route is nil or new route ID is nil! Try re-installing navd."];
    long long v42 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
      __int16 v105 = 2080;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v107 = 1024;
      int v108 = 500;
      __int16 v109 = 2080;
      v110 = "currentRoute != nil && currentRoute.routeID != nil";
      __int16 v111 = 2112;
      v112 = v41;
      _os_log_impl(&dword_1B542B000, v42, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    id v31 = v82;
    if (!v6) {
      goto LABEL_37;
    }
  }
  long long v43 = [(MNActiveRouteInfo *)v6 routeID];

  if (v43)
  {
    uint64_t v87 = MEMORY[0x1E4F143A8];
    uint64_t v88 = 3221225472;
    v89 = __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_179;
    v90 = &unk_1E60F6668;
    v91 = v31;
    os_signpost_id_t v6 = v6;
    v92 = v6;
    geo_isolate_sync();
  }
  else
  {
LABEL_37:
    uint64_t v44 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
      __int16 v105 = 2080;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v107 = 1024;
      int v108 = 506;
      _os_log_impl(&dword_1B542B000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }
  }
  v76 = 0;
LABEL_43:
  p_currentRoute = (id *)&v31->_currentRoute;
  if (v31->_currentRoute != v6)
  {
    spokenAnnouncements = v31->_spokenAnnouncements;
    v31->_spokenAnnouncements = 0;

    __int16 v47 = [(MNActiveRouteInfo *)v31->_currentRoute route];
    uint64_t v48 = [v47 waypoints];
    uint64_t v49 = [v48 count];
    int v50 = [(MNActiveRouteInfo *)v6 route];
    __int16 v51 = [v50 waypoints];
    uint64_t v52 = [v51 count];

    if (v49 == v52)
    {
      __int16 v53 = [*p_currentRoute route];
      v54 = [v53 waypoints];
      unint64_t v55 = [v54 count];

      if (v55 >= 2)
      {
        unint64_t v56 = 1;
        v80 = (id *)&v31->_currentRoute;
        v81 = v6;
        do
        {
          v57 = [*p_currentRoute route];
          v58 = [v57 waypoints];
          v59 = [v58 objectAtIndexedSubscript:v56];
          v60 = [v59 uniqueWaypointID];
          objc_super v61 = [(MNActiveRouteInfo *)v6 route];
          v62 = [v61 waypoints];
          v63 = [v62 objectAtIndexedSubscript:v56];
          v64 = [v63 uniqueWaypointID];
          char v65 = [v60 isEqualToData:v64];

          id v31 = v82;
          if ((v65 & 1) == 0) {
            v82->_isApproachingWaypoint = 0;
          }
          ++v56;
          p_currentRoute = v80;
          v66 = [*v80 route];
          v67 = [v66 waypoints];
          unint64_t v68 = [v67 count];

          os_signpost_id_t v6 = v81;
        }
        while (v56 < v68);
      }
    }
  }
  objc_storeStrong(p_currentRoute, v6);
  v69 = [(MNActiveRouteInfo *)v6 route];
  v70 = [v69 routeInitializerData];
  uint64_t v71 = [v70 directionsResponse];
  directionsResponse = v31->_directionsResponse;
  v31->_directionsResponse = (GEODirectionsResponse *)v71;

  [(MNNavigationDetails *)v31 _updateRouteIDLookup];
  [(MNNavigationDetails *)v31 setAlternateRoutes:v79];
  v73 = v77;
  v74 = v73;
  if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v74, OS_SIGNPOST_INTERVAL_END, spid, "SetCurrentRoute", "", buf, 2u);
  }
}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) routeID];
  [v3 removeObjectForKey:v2];
}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_179(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 routeID];
  [v4 setObject:v2 forKey:v3];
}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_180(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) routeID];
  [v3 removeObjectForKey:v2];
}

- (void)setAlternateRoutes:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = MNGetMNNavigationDetailsLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  unint64_t v7 = v5;
  os_signpost_id_t v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v41 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetAlternateRoute", "", buf, 2u);
  }
  long long v40 = v8;

  *(void *)buf = 0;
  id v79 = buf;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__15;
  v82 = __Block_byref_object_dispose__15;
  id v83 = 0;
  uint64_t v72 = MEMORY[0x1E4F143A8];
  uint64_t v73 = 3221225472;
  v74 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke;
  v75 = &unk_1E60F6A78;
  v77 = buf;
  v76 = self;
  geo_isolate_sync();
  uint64_t v9 = [(MNActiveRouteInfo *)self->_currentRoute routeID];

  if (v9)
  {
    uint64_t v10 = (void *)*((void *)v79 + 5);
    uint64_t v11 = [(MNActiveRouteInfo *)self->_currentRoute routeID];
    [v10 removeObject:v11];
  }
  else
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v91 = 136315650;
      *(void *)&v91[4] = "-[MNNavigationDetails setAlternateRoutes:]";
      *(_WORD *)&v91[12] = 2080;
      *(void *)&v91[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      *(_WORD *)&v91[22] = 1024;
      LODWORD(v92) = 568;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", v91, 0x1Cu);
    }
  }

  uint64_t v44 = [MEMORY[0x1E4F1CA80] set];
  id v43 = [MEMORY[0x1E4F1CA48] array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v4;
  uint64_t v12 = [obj countByEnumeratingWithState:&v68 objects:v94 count:16];
  if (v12)
  {
    uint64_t v14 = *(void *)v69;
    *(void *)&long long v13 = 136316162;
    long long v38 = v13;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v69 != v14) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v68 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(v16, "routeID", v38);
        BOOL v18 = v17 == 0;

        if (v18)
        {
          id v25 = [v16 routeID];
          BOOL v26 = v25 == 0;

          if (v26)
          {
            id v29 = [NSString stringWithFormat:@"Alternate route ID is nil"];
            uint64_t v30 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v91 = v38;
              *(void *)&v91[4] = "-[MNNavigationDetails setAlternateRoutes:]";
              *(_WORD *)&v91[12] = 2080;
              *(void *)&v91[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
              *(_WORD *)&v91[22] = 1024;
              LODWORD(v92) = 575;
              WORD2(v92) = 2080;
              *(void *)((char *)&v92 + 6) = "alternateRoute.routeID";
              HIWORD(v92) = 2112;
              id v93 = v29;
              _os_log_impl(&dword_1B542B000, v30, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v91, 0x30u);
            }
          }
          __int16 v27 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v91 = 0;
            _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_ERROR, "Alternate route ID is nil. This probably means a route failed to load from disk.", v91, 2u);
          }
        }
        else
        {
          id v19 = [v16 routeID];
          [v44 addObject:v19];

          *(void *)v91 = 0;
          *(void *)&v91[8] = v91;
          *(void *)&v91[16] = 0x3032000000;
          *(void *)&long long v92 = __Block_byref_object_copy__15;
          *((void *)&v92 + 1) = __Block_byref_object_dispose__15;
          id v93 = 0;
          uint64_t v61 = MEMORY[0x1E4F143A8];
          uint64_t v62 = 3221225472;
          v63 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_181;
          v64 = &unk_1E60F7EF0;
          v66 = v16;
          v67 = v91;
          char v65 = self;
          geo_isolate_sync();
          if (*(void *)(*(void *)&v91[8] + 40))
          {
            uint64_t v20 = [v16 etaRoute];
            [*(id *)(*(void *)&v91[8] + 40) setEtaRoute:v20];

            char v21 = [v16 etaResponse];
            [*(id *)(*(void *)&v91[8] + 40) setEtaResponse:v21];

            uint64_t v22 = [v16 displayETAInfo];
            [*(id *)(*(void *)&v91[8] + 40) setDisplayETAInfo:v22];

            long long v23 = [v16 remainingDistanceInfo];
            [*(id *)(*(void *)&v91[8] + 40) setRemainingDistanceInfo:v23];

            uint64_t v24 = [v16 alternateRouteIndex];
            [*(id *)(*(void *)&v91[8] + 40) setAlternateRouteIndex:v24];
          }
          else
          {
            objc_storeStrong((id *)(*(void *)&v91[8] + 40), v16);
            if (v16)
            {
              uint64_t v55 = MEMORY[0x1E4F143A8];
              uint64_t v56 = 3221225472;
              v57 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2;
              v58 = &unk_1E60F6668;
              v59 = self;
              v60 = v16;
              geo_isolate_sync();
            }
            else
            {
              __int16 v28 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long v85 = 136315650;
                long long v86 = "-[MNNavigationDetails setAlternateRoutes:]";
                __int16 v87 = 2080;
                uint64_t v88 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
                __int16 v89 = 1024;
                int v90 = 599;
                _os_log_impl(&dword_1B542B000, v28, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", v85, 0x1Cu);
              }
            }
          }
          [v43 addObject:*(void *)(*(void *)&v91[8] + 40)];
          _Block_object_dispose(v91, 8);
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v31 = [obj countByEnumeratingWithState:&v68 objects:v94 count:16];
      uint64_t v12 = v31;
    }
    while (v31);
  }

  [*((id *)v79 + 5) minusSet:v44];
  uint64_t v49 = MEMORY[0x1E4F143A8];
  uint64_t v50 = 3221225472;
  __int16 v51 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_182;
  uint64_t v52 = &unk_1E60F6488;
  __int16 v53 = self;
  v54 = buf;
  geo_isolate_sync();
  objc_storeStrong((id *)&self->_alternateRoutes, v43);
  long long v48 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  uint64_t v32 = self->_alternateRoutes;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v45 objects:v84 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v32);
        }
        geo_isolate_sync();
      }
      uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v45 objects:v84 count:16];
    }
    while (v33);
  }

  geo_isolate_sync();
  [(MNNavigationDetails *)self _updateRouteIDLookup];
  long long v36 = v40;
  long long v37 = v36;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)v91 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v37, OS_SIGNPOST_INTERVAL_END, spid, "SetAlternateRoute", "", v91, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = [*(id *)(a1 + 32) routeLookup];
  id v3 = [v7 allKeys];
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_181(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [*(id *)(a1 + 40) routeID];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 routeID];
  [v4 setObject:v2 forKey:v3];
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_182(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allObjects];
  [v3 removeObjectsForKeys:v2];
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2_183(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) routeLookup];
  id v3 = [*(id *)(a1 + 40) routeID];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void **)(a1 + 40);

  if (v4 != v5)
  {
    id v6 = [NSString stringWithFormat:@"Unexpected alternate route in lookup"];
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      uint64_t v9 = "-[MNNavigationDetails setAlternateRoutes:]_block_invoke_2";
      __int16 v10 = 2080;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v12 = 1024;
      int v13 = 615;
      __int16 v14 = 2080;
      uint64_t v15 = "self.routeLookup[alternateRoute.routeID] == alternateRoute";
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }
  }
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_188(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v3 = [v2 count];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) count] + 1;

  if (v3 != v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Unexpected number of routes in lookup"];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      int v8 = "-[MNNavigationDetails setAlternateRoutes:]_block_invoke";
      __int16 v9 = 2080;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v11 = 1024;
      int v12 = 620;
      __int16 v13 = 2080;
      __int16 v14 = "self.routeLookup.count == (_alternateRoutes.count + 1)";
      __int16 v15 = 2112;
      __int16 v16 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }
  }
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
  self->_desiredNavigationType = a3;
}

- (void)updateETATrafficForRoute:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 routeID];
  id v6 = [(MNNavigationDetails *)self routeInfoForID:v5];

  if (v6)
  {
    int v7 = [v4 etaResponse];
    [v6 setEtaResponse:v7];

    int v8 = [v4 etaRoute];
    [v6 setEtaRoute:v8];

    __int16 v9 = [v4 route];
    __int16 v10 = [v9 mutableData];
    __int16 v11 = [v6 route];
    [v11 setMutableData:v10];
  }
  else
  {
    __int16 v9 = [NSString stringWithFormat:@"Expected an existing route but did not find it"];
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      __int16 v13 = "-[MNNavigationDetails updateETATrafficForRoute:]";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v16 = 1024;
      int v17 = 637;
      __int16 v18 = 2080;
      id v19 = "existingRoute != nil";
      __int16 v20 = 2112;
      char v21 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v12, 0x30u);
    }
  }
}

- (id)routeInfoForID:(id)a3
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__15;
  __int16 v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  id v5 = a3;
  geo_isolate_sync();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__MNNavigationDetails_routeInfoForID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)routeInfoForRoute:(id)a3
{
  id v4 = [(NSMapTable *)self->_routeIDLookup objectForKey:a3];
  id v5 = [(MNNavigationDetails *)self routeInfoForID:v4];

  return v5;
}

- (BOOL)isFollowingOriginalRoute
{
  uint64_t v3 = [(MNNavigationDetails *)self originalRoute];
  id v4 = [v3 uniqueRouteID];
  id v5 = [(MNNavigationDetails *)self currentRoute];
  uint64_t v6 = [v5 uniqueRouteID];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (void)markAnnouncementSpoken:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    spokenAnnouncements = self->_spokenAnnouncements;
    id v9 = v5;
    if (!spokenAnnouncements)
    {
      char v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = self->_spokenAnnouncements;
      self->_spokenAnnouncements = v7;

      spokenAnnouncements = self->_spokenAnnouncements;
    }
    id v4 = (id)[(NSMutableArray *)spokenAnnouncements addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (id)updateWithTrafficIncidentAlert:(id)a3
{
  id v4 = a3;
  trafficIncidentAlerts = self->_trafficIncidentAlerts;
  if (!trafficIncidentAlerts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    char v7 = self->_trafficIncidentAlerts;
    self->_trafficIncidentAlerts = v6;

    trafficIncidentAlerts = self->_trafficIncidentAlerts;
  }
  uint64_t v8 = [v4 alertID];
  id v9 = [(NSMutableDictionary *)trafficIncidentAlerts objectForKeyedSubscript:v8];

  if (!v9)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Attempting to update a traffic incident alert that does not exist. Creating a new alert.", v17, 2u);
    }
  }
  id v11 = self->_trafficIncidentAlerts;
  int v12 = [v4 alertID];
  [(NSMutableDictionary *)v11 setObject:v4 forKeyedSubscript:v12];

  __int16 v13 = self->_trafficIncidentAlerts;
  __int16 v14 = [v4 alertID];
  __int16 v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];

  return v15;
}

- (id)removeTrafficIncidentAlert:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  trafficIncidentAlerts = self->_trafficIncidentAlerts;
  uint64_t v6 = [v4 alertID];
  char v7 = [(NSMutableDictionary *)trafficIncidentAlerts objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = self->_trafficIncidentAlerts;
    id v9 = [v4 alertID];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    id v10 = v7;
  }
  else
  {
    int v12 = [NSString stringWithFormat:@"Couldn't find traffic incident alert to invalidate"];
    __int16 v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136316162;
      __int16 v15 = "-[MNNavigationDetails removeTrafficIncidentAlert:]";
      __int16 v16 = 2080;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v18 = 1024;
      int v19 = 702;
      __int16 v20 = 2080;
      char v21 = "(existingAlert != nil)";
      __int16 v22 = 2112;
      long long v23 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v14, 0x30u);
    }
  }
  return v7;
}

- (void)_updateRouteIDLookup
{
  uint64_t v3 = [(MNNavigationDetails *)self routeIDLookup];
  [v3 removeAllObjects];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__15;
  __int16 v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __43__MNNavigationDetails__updateRouteIDLookup__block_invoke;
  id v11 = &unk_1E60F6A78;
  int v12 = self;
  __int16 v13 = &v14;
  geo_isolate_sync();
  id v4 = (void *)v15[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MNNavigationDetails__updateRouteIDLookup__block_invoke_2;
  v6[3] = &unk_1E60FB6D0;
  id v5 = v3;
  id v7 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  _Block_object_dispose(&v14, 8);
}

void __43__MNNavigationDetails__updateRouteIDLookup__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) routeLookup];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__MNNavigationDetails__updateRouteIDLookup__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5 && a3)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [a3 route];
    [v6 setObject:v5 forKey:v7];
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315650;
      uint64_t v9 = "-[MNNavigationDetails _updateRouteIDLookup]_block_invoke_2";
      __int16 v10 = 2080;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      __int16 v12 = 1024;
      int v13 = 723;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (NSMapTable)routeIDLookup
{
  routeIDLookup = self->_routeIDLookup;
  if (!routeIDLookup)
  {
    id v4 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    id v5 = self->_routeIDLookup;
    self->_routeIDLookup = v4;

    routeIDLookup = self->_routeIDLookup;
  }
  return routeIDLookup;
}

- (id)description
{
  __int16 v18 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)MNNavigationDetails;
  uint64_t v3 = [(MNNavigationDetails *)&v19 description];
  unint64_t v17 = [(MNNavigationDetails *)self state];
  int64_t v4 = [(MNNavigationDetails *)self desiredNavigationType];
  if ((unint64_t)(v4 - 1) > 3) {
    id v5 = @"None";
  }
  else {
    id v5 = *(&off_1E60FB6F0 + v4 - 1);
  }
  uint64_t v16 = v5;
  unint64_t v6 = [(MNNavigationDetails *)self navigationType] - 1;
  if (v6 > 3) {
    id v7 = @"None";
  }
  else {
    id v7 = *(&off_1E60FB6F0 + v6);
  }
  int v8 = [(MNNavigationDetails *)self location];
  BOOL v9 = [(MNNavigationDetails *)self guidancePromptsEnabled];
  BOOL v10 = [(MNNavigationDetails *)self isDetour];
  uint64_t v11 = [(MNNavigationDetails *)self navigationState];
  if (v11 >= 9)
  {
    __int16 v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
  }
  else
  {
    __int16 v12 = *(&off_1E60FB710 + (int)v11);
  }
  int v13 = [(MNNavigationDetails *)self guidanceState];
  uint64_t v14 = [v18 stringWithFormat:@"%@ [state=%lu,\n             desiredNavigationType:%@,\n             navigationType=%@,\n             location=%@,\n             guidancePromptsEnabled=%d,\n             isDetour=%d,\n             navigationState=%@,\n             guidanceState=%@,\n             reconnectionRouteIndex=%lu,\n             stepIndex=%lu,\n             segmentIndex=%lu]", v3, v17, v16, v7, v8, v9, v10, v12, v13, -[MNNavigationDetails reconnectionRouteIndex](self, "reconnectionRouteIndex"), -[MNNavigationDetails stepIndex](self, "stepIndex"), -[MNNavigationDetails segmentIndex](self, "segmentIndex")];

  return v14;
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setDesiredNavigationType:(int64_t)a3
{
  self->_desiredNavigationType = a3;
}

- (void)setDesiredTransportType:(int)a3
{
  self->_desiredTransportType = a3;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (BOOL)isApproachingWaypoint
{
  return self->_isApproachingWaypoint;
}

- (void)setIsApproachingWaypoint:(BOOL)a3
{
  self->_isApproachingWaypoint = a3;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
}

- (void)setDirectionsResponse:(id)a3
{
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  self->_guidancePromptsEnabled = a3;
}

- (BOOL)isDetour
{
  return self->_isDetour;
}

- (void)setIsDetour:(BOOL)a3
{
  self->_isDetour = a3;
}

- (int)headingOrientation
{
  return self->_headingOrientation;
}

- (void)setHeadingOrientation:(int)a3
{
  self->_headingOrientation = a3;
}

- (void)setNavigationState:(int)a3
{
  self->_navigationState = a3;
}

- (GEONavigationGuidanceState)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(id)a3
{
}

- (BOOL)isInPreArrivalState
{
  return self->_isInPreArrivalState;
}

- (void)setIsInPreArrivalState:(BOOL)a3
{
  self->_isInPreArrivalState = a3;
}

- (unint64_t)reconnectionRouteIndex
{
  return self->_reconnectionRouteIndex;
}

- (GEOComposedRoute)originalRoute
{
  return self->_originalRoute;
}

- ($212C09783140BCCD23384160D545CE0D)lastOriginalRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_lastOriginalRouteCoordinate;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_targetLegIndex = a3;
}

- (int64_t)upcomingAnchorPointIndex
{
  return self->_upcomingAnchorPointIndex;
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  self->_displayedStepIndex = a3;
}

- (void)setProceedToRouteDistance:(double)a3
{
  self->_proceedToRouteDistance = a3;
}

- (void)setDisplayString:(id)a3
{
}

- (void)setClosestStepIndex:(unint64_t)a3
{
  self->_closestStepIndex = a3;
}

- (void)setDistanceUntilSign:(double)a3
{
  self->_distanceUntilSign = a3;
}

- (void)setTimeUntilSign:(double)a3
{
  self->_timeUntilSign = a3;
}

- (void)setDistanceUntilManeuver:(double)a3
{
  self->_distanceUntilManeuver = a3;
}

- (void)setTimeUntilManeuver:(double)a3
{
  self->_timeUntilManeuver = a3;
}

- (void)setCurrentVoiceLanguage:(id)a3
{
}

- (unint64_t)voiceGuidanceLevel
{
  return self->_voiceGuidanceLevel;
}

- (void)setVoiceGuidanceLevel:(unint64_t)a3
{
  self->_voiceGuidanceLevel = a3;
}

- (MNGuidanceLaneInfo)activeLaneInfo
{
  return self->_activeLaneInfo;
}

- (void)setActiveLaneInfo:(id)a3
{
}

- (NSArray)spokenAnnouncements
{
  return &self->_spokenAnnouncements->super;
}

- (void)setSpokenAnnouncements:(id)a3
{
}

- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent
{
  return self->_activeNavTrayGuidanceEvent;
}

- (void)setActiveNavTrayGuidanceEvent:(id)a3
{
}

- (void)setArrivalInfo:(id)a3
{
}

- (MNActiveRouteInfo)backgroundWalkingRouteInfo
{
  return self->_backgroundWalkingRouteInfo;
}

- (void)setBackgroundWalkingRouteInfo:(id)a3
{
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void)setVehicleParkingInfo:(id)a3
{
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (BOOL)traceIsPlaying
{
  return self->_traceIsPlaying;
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  self->_traceIsPlaying = a3;
}

- (double)traceDuration
{
  return self->_traceDuration;
}

- (void)setTraceDuration:(double)a3
{
  self->_traceDuration = a3;
}

- (double)tracePosition
{
  return self->_tracePosition;
}

- (void)setTracePosition:(double)a3
{
  self->_tracePosition = a3;
}

- (NSArray)traceBookmarks
{
  return self->_traceBookmarks;
}

- (void)setTraceBookmarks:(id)a3
{
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

@end