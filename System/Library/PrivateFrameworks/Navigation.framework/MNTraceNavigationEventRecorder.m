@interface MNTraceNavigationEventRecorder
- (MNTraceNavigationEventRecorder)initWithTraceRecorder:(id)a3;
- (id)_descriptionForARInfo:(id)a3;
- (id)_descriptionForWaypoint:(id)a3;
- (id)_stringForSignDescription:(id)a3;
- (void)_didUpdateArrivalInfo:(id)a3;
- (void)_recordDebugSettings;
- (void)_recordEvent:(int64_t)a3 description:(id)a4;
- (void)_userGotOnRoute;
- (void)_userWentOffRoute;
- (void)dealloc;
- (void)navigationSession:(id)a3 didAnnounce:(id)a4 stage:(unint64_t)a5;
- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4;
- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5;
- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4;
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
- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4;
- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4;
- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationSession:(id)a3 showJunctionView:(id)a4;
- (void)navigationSession:(id)a3 showLaneDirections:(id)a4;
- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4;
- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4;
- (void)setLastMatchedLocation:(id)a3;
@end

@implementation MNTraceNavigationEventRecorder

- (MNTraceNavigationEventRecorder)initWithTraceRecorder:(id)a3
{
  id v5 = a3;
  if (v5
    && (v13.receiver = self,
        v13.super_class = (Class)MNTraceNavigationEventRecorder,
        v6 = [(MNTraceNavigationEventRecorder *)&v13 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_traceRecorder, a3);
    objc_initWeak(&location, self);
    v7 = dispatch_get_global_queue(21, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__MNTraceNavigationEventRecorder_initWithTraceRecorder___block_invoke;
    v10[3] = &unk_1E60F7738;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", &self->_sysdiagnoseStartedToken, v7, v10);

    self = self;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __56__MNTraceNavigationEventRecorder_initWithTraceRecorder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _recordEvent:30 description:0];
}

- (void)dealloc
{
  notify_cancel(self->_sysdiagnoseStartedToken);
  v3.receiver = self;
  v3.super_class = (Class)MNTraceNavigationEventRecorder;
  [(MNTraceNavigationEventRecorder *)&v3 dealloc];
}

- (void)setLastMatchedLocation:(id)a3
{
  id v5 = a3;
  lastMatchedLocation = self->_lastMatchedLocation;
  id v11 = v5;
  if (lastMatchedLocation)
  {
    uint64_t v7 = [(MNLocation *)lastMatchedLocation state];
    id v5 = v11;
    int v8 = v7 == 1;
  }
  else
  {
    int v8 = 0;
  }
  int v9 = [v5 state] == 1;
  objc_storeStrong((id *)&self->_lastMatchedLocation, a3);
  v10 = v11;
  if (v8 != v9)
  {
    if ([v11 state] == 1) {
      [(MNTraceNavigationEventRecorder *)self _userGotOnRoute];
    }
    else {
      [(MNTraceNavigationEventRecorder *)self _userWentOffRoute];
    }
    v10 = v11;
  }
}

- (void)_recordDebugSettings
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (_GEOConfigHasValue())
  {
    uint64_t v82 = MEMORY[0x1E4F143A8];
    uint64_t v83 = 3221225472;
    v84 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke;
    v85 = &unk_1E60FB310;
    id v86 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v77 = MEMORY[0x1E4F143A8];
    uint64_t v78 = 3221225472;
    v79 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_2;
    v80 = &unk_1E60FB310;
    id v81 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v72 = MEMORY[0x1E4F143A8];
    uint64_t v73 = 3221225472;
    v74 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_3;
    v75 = &unk_1E60FB310;
    id v76 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v67 = MEMORY[0x1E4F143A8];
    uint64_t v68 = 3221225472;
    v69 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_4;
    v70 = &unk_1E60FB310;
    id v71 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v62 = MEMORY[0x1E4F143A8];
    uint64_t v63 = 3221225472;
    v64 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_5;
    v65 = &unk_1E60FB310;
    id v66 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v57 = MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_6;
    v60 = &unk_1E60FB310;
    id v61 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v52 = MEMORY[0x1E4F143A8];
    uint64_t v53 = 3221225472;
    v54 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_7;
    v55 = &unk_1E60FB310;
    id v56 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_8;
    v50 = &unk_1E60FB310;
    id v51 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_9;
    v45 = &unk_1E60FB310;
    id v46 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_10;
    v40 = &unk_1E60FB310;
    id v41 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_11;
    v35 = &unk_1E60FB310;
    id v36 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_12;
    v30 = &unk_1E60FB310;
    id v31 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_13;
    v25 = &unk_1E60FB310;
    id v26 = v3;
    GEOConfigGetPropertiesForKey();
  }
  if (_GEOConfigHasValue())
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_14;
    v20 = &unk_1E60FB310;
    id v21 = v3;
    GEOConfigGetPropertiesForKey();
  }
  v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v87 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v3, "objectForKeyedSubscript:", v11, (void)v13);
        [(MNTraceRecorder *)self->_traceRecorder recordDebugSetting:v11 settingValue:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v87 count:16];
    }
    while (v8);
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

void __54__MNTraceNavigationEventRecorder__recordDebugSettings__block_invoke_14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = a2;
    id v8 = [a5 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)_recordEvent:(int64_t)a3 description:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = MNTraceNavigationEventTypeAsString(a3);
    uint64_t v9 = (void *)v8;
    if (v6) {
      v10 = v6;
    }
    else {
      v10 = &stru_1F0E08010;
    }
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    long long v15 = v10;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "Recording event [%@] %@", (uint8_t *)&v12, 0x16u);
  }
  if (v6) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = &stru_1F0E08010;
  }
  [(MNTraceRecorder *)self->_traceRecorder recordNavigationEvent:a3 forLocation:self->_lastMatchedLocation description:v11];
}

- (void)_userGotOnRoute
{
  [(MNTraceNavigationEventRecorder *)self _recordEvent:5 description:0];
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;
}

- (void)_userWentOffRoute
{
  unint64_t v3 = [(MNLocation *)self->_lastMatchedLocation state];
  if (v3 == 2)
  {
    v4 = @"on road";
  }
  else
  {
    if (v3) {
      return;
    }
    v4 = @"off road";
  }
  [(MNTraceNavigationEventRecorder *)self _recordEvent:6 description:v4];
}

- (id)_descriptionForWaypoint:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 geoMapItem];
  if (v4
    && (id v5 = (void *)v4,
        [v3 geoMapItem],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 contactAddressType],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [v3 navDisplayNameWithSpecialContacts:0];
    v10 = [v3 navDisplayNameWithSpecialContacts:1];
    uint64_t v11 = [v3 navDisplayAddress];
    int v12 = [v8 stringWithFormat:@"%@ (%@) | %@", v9, v10, v11];
  }
  else
  {
    uint64_t v13 = NSString;
    uint64_t v9 = [v3 navDisplayName];
    v10 = [v3 navDisplayAddress];
    int v12 = [v13 stringWithFormat:@"%@ | %@", v9, v10];
  }

  return v12;
}

- (id)_stringForSignDescription:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = [v3 junction];

  if (v5)
  {
    id v6 = [v3 junction];
    uint64_t v7 = [v6 maneuverType];
    uint64_t v8 = @"NO_TURN";
    switch((int)v7)
    {
      case 0:
        break;
      case 1:
        uint64_t v8 = @"LEFT_TURN";
        break;
      case 2:
        uint64_t v8 = @"RIGHT_TURN";
        break;
      case 3:
        uint64_t v8 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        uint64_t v8 = @"U_TURN";
        break;
      case 5:
        uint64_t v8 = @"FOLLOW_ROAD";
        break;
      case 6:
        uint64_t v8 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        uint64_t v8 = @"EXIT_ROUNDABOUT";
        break;
      case 11:
        uint64_t v8 = @"OFF_RAMP";
        break;
      case 12:
        uint64_t v8 = @"ON_RAMP";
        break;
      case 16:
        uint64_t v8 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 17:
        uint64_t v8 = @"START_ROUTE";
        break;
      case 18:
        uint64_t v8 = @"ARRIVE_AT_DESTINATION";
        break;
      case 20:
        uint64_t v8 = @"KEEP_LEFT";
        break;
      case 21:
        uint64_t v8 = @"KEEP_RIGHT";
        break;
      case 22:
        uint64_t v8 = @"ENTER_FERRY";
        break;
      case 23:
        uint64_t v8 = @"EXIT_FERRY";
        break;
      case 24:
        uint64_t v8 = @"CHANGE_FERRY";
        break;
      case 25:
        uint64_t v8 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 26:
        uint64_t v8 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 27:
        uint64_t v8 = @"LEFT_TURN_AT_END";
        break;
      case 28:
        uint64_t v8 = @"RIGHT_TURN_AT_END";
        break;
      case 29:
        uint64_t v8 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 30:
        uint64_t v8 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 33:
        uint64_t v8 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 34:
        uint64_t v8 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 35:
        uint64_t v8 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 39:
        uint64_t v8 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 41:
        uint64_t v8 = @"ROUNDABOUT_EXIT_1";
        break;
      case 42:
        uint64_t v8 = @"ROUNDABOUT_EXIT_2";
        break;
      case 43:
        uint64_t v8 = @"ROUNDABOUT_EXIT_3";
        break;
      case 44:
        uint64_t v8 = @"ROUNDABOUT_EXIT_4";
        break;
      case 45:
        uint64_t v8 = @"ROUNDABOUT_EXIT_5";
        break;
      case 46:
        uint64_t v8 = @"ROUNDABOUT_EXIT_6";
        break;
      case 47:
        uint64_t v8 = @"ROUNDABOUT_EXIT_7";
        break;
      case 48:
        uint64_t v8 = @"ROUNDABOUT_EXIT_8";
        break;
      case 49:
        uint64_t v8 = @"ROUNDABOUT_EXIT_9";
        break;
      case 50:
        uint64_t v8 = @"ROUNDABOUT_EXIT_10";
        break;
      case 51:
        uint64_t v8 = @"ROUNDABOUT_EXIT_11";
        break;
      case 52:
        uint64_t v8 = @"ROUNDABOUT_EXIT_12";
        break;
      case 53:
        uint64_t v8 = @"ROUNDABOUT_EXIT_13";
        break;
      case 54:
        uint64_t v8 = @"ROUNDABOUT_EXIT_14";
        break;
      case 55:
        uint64_t v8 = @"ROUNDABOUT_EXIT_15";
        break;
      case 56:
        uint64_t v8 = @"ROUNDABOUT_EXIT_16";
        break;
      case 57:
        uint64_t v8 = @"ROUNDABOUT_EXIT_17";
        break;
      case 58:
        uint64_t v8 = @"ROUNDABOUT_EXIT_18";
        break;
      case 59:
        uint64_t v8 = @"ROUNDABOUT_EXIT_19";
        break;
      case 60:
        uint64_t v8 = @"SHARP_LEFT_TURN";
        break;
      case 61:
        uint64_t v8 = @"SHARP_RIGHT_TURN";
        break;
      case 62:
        uint64_t v8 = @"SLIGHT_LEFT_TURN";
        break;
      case 63:
        uint64_t v8 = @"SLIGHT_RIGHT_TURN";
        break;
      case 64:
        uint64_t v8 = @"CHANGE_HIGHWAY";
        break;
      case 65:
        uint64_t v8 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 66:
        uint64_t v8 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 80:
        uint64_t v8 = @"TOLL_STATION";
        break;
      case 81:
        uint64_t v8 = @"ENTER_TUNNEL";
        break;
      case 82:
        uint64_t v8 = @"WAYPOINT_STOP";
        break;
      case 83:
        uint64_t v8 = @"WAYPOINT_STOP_LEFT";
        break;
      case 84:
        uint64_t v8 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 85:
        uint64_t v8 = @"RESUME_ROUTE";
        break;
      case 86:
        uint64_t v8 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 87:
        uint64_t v8 = @"CUSTOM";
        break;
      case 88:
        uint64_t v8 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }

    uint64_t v9 = [(__CFString *)v8 capitalizedString];
    v10 = [v9 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1F0E08010];

    [v4 appendFormat:@"(%@)", v10];
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  int v12 = [v3 primaryStrings];
  uint64_t v13 = [v12 firstObject];

  __int16 v14 = [v13 optionsWithArgumentHandler:&__block_literal_global_39];
  long long v15 = [v13 stringWithOptions:v14];
  if (v15) {
    [v11 addObject:v15];
  }
  uint64_t v16 = [v3 secondaryStrings];
  uint64_t v17 = [v16 firstObject];

  uint64_t v18 = [v17 optionsWithArgumentHandler:&__block_literal_global_40_0];
  [v18 setCreateAttributedString:1];
  v19 = [v17 stringWithOptions:v18];
  if (v19) {
    [v11 addObject:v19];
  }
  v20 = [v11 componentsJoinedByString:@" | "];
  [v4 appendFormat:@" %@", v20];

  return v4;
}

void __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 distanceFormat];
  [v2 setFormatOptions:1];
}

void __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 artworkFormat];
  [v3 setAttributedStringHandler:&__block_literal_global_43];

  id v4 = [v2 distanceFormat];

  [v4 setFormatOptions:1];
}

id __60__MNTraceNavigationEventRecorder__stringForSignDescription___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = [NSString stringWithFormat:@"{%@}", a4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];

  return v5;
}

- (id)_descriptionForARInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = [v3 arrowLabel];
  uint64_t v6 = [v3 maneuverType];
  uint64_t v7 = @"NO_TURN";
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      uint64_t v7 = @"LEFT_TURN";
      break;
    case 2:
      uint64_t v7 = @"RIGHT_TURN";
      break;
    case 3:
      uint64_t v7 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      uint64_t v7 = @"U_TURN";
      break;
    case 5:
      uint64_t v7 = @"FOLLOW_ROAD";
      break;
    case 6:
      uint64_t v7 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      uint64_t v7 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      uint64_t v7 = @"OFF_RAMP";
      break;
    case 12:
      uint64_t v7 = @"ON_RAMP";
      break;
    case 16:
      uint64_t v7 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      uint64_t v7 = @"START_ROUTE";
      break;
    case 18:
      uint64_t v7 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      uint64_t v7 = @"KEEP_LEFT";
      break;
    case 21:
      uint64_t v7 = @"KEEP_RIGHT";
      break;
    case 22:
      uint64_t v7 = @"ENTER_FERRY";
      break;
    case 23:
      uint64_t v7 = @"EXIT_FERRY";
      break;
    case 24:
      uint64_t v7 = @"CHANGE_FERRY";
      break;
    case 25:
      uint64_t v7 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      uint64_t v7 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      uint64_t v7 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      uint64_t v7 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      uint64_t v7 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      uint64_t v7 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      uint64_t v7 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      uint64_t v7 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      uint64_t v7 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      uint64_t v7 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      uint64_t v7 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      uint64_t v7 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      uint64_t v7 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      uint64_t v7 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      uint64_t v7 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      uint64_t v7 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      uint64_t v7 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      uint64_t v7 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      uint64_t v7 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      uint64_t v7 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      uint64_t v7 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      uint64_t v7 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      uint64_t v7 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      uint64_t v7 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      uint64_t v7 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      uint64_t v7 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      uint64_t v7 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      uint64_t v7 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      uint64_t v7 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      uint64_t v7 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      uint64_t v7 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      uint64_t v7 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      uint64_t v7 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      uint64_t v7 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      uint64_t v7 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      uint64_t v7 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      uint64_t v7 = @"TOLL_STATION";
      break;
    case 81:
      uint64_t v7 = @"ENTER_TUNNEL";
      break;
    case 82:
      uint64_t v7 = @"WAYPOINT_STOP";
      break;
    case 83:
      uint64_t v7 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      uint64_t v7 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      uint64_t v7 = @"RESUME_ROUTE";
      break;
    case 86:
      uint64_t v7 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      uint64_t v7 = @"CUSTOM";
      break;
    case 88:
      uint64_t v7 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  uint64_t v8 = [v4 stringWithFormat:@"[%@ | %@]", v5, v7];

  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  [v3 locationCoordinate];
  if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
  {
    int v12 = NSString;
    [v3 locationCoordinate];
    uint64_t v14 = v13;
    [v3 locationCoordinate];
    uint64_t v16 = v15;
    [v3 locationCoordinate];
    uint64_t v18 = [v12 stringWithFormat:@"%f, %f | %dm", v14, v16, (int)v17];
    [v9 addObject:v18];
  }
  [v3 heading];
  if (v19 >= 0.0)
  {
    v20 = NSString;
    [v3 heading];
    LODWORD(v22) = llround(v21);
    uint64_t v23 = objc_msgSend(v20, "stringWithFormat:", @"%d°", v22);
    [v9 addObject:v23];
  }
  if ([v9 count])
  {
    v24 = [v9 componentsJoinedByString:@" | "];
    [v8 appendFormat:@" (%@)", v24];
  }
  return v8;
}

- (void)_didUpdateArrivalInfo:(id)a3
{
  id v17 = a3;
  id v4 = [v17 vehicleParkingInfo];

  if (v4)
  {
    id v5 = [v17 vehicleParkingInfo];
    uint64_t v6 = [v5 walkingRouteDisplayETAInfo];

    if (v6)
    {
      uint64_t v7 = [v17 vehicleParkingInfo];
      uint64_t v8 = [v7 walkingRouteDisplayETAInfo];
      [v8 remainingMinutesToEndOfRoute];

      GEOStringForDuration();
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = @"(none)";
    }
    uint64_t v13 = NSString;
    unint64_t v14 = [v17 arrivalState];
    if (v14 > 6) {
      uint64_t v15 = @"MNArrivalState_Unknown";
    }
    else {
      uint64_t v15 = off_1E60FB378[v14];
    }
    uint64_t v16 = [v13 stringWithFormat:@"%@, leg: %d, walking duration: %@", v15, objc_msgSend(v17, "legIndex"), v9];
  }
  else
  {
    double v10 = NSString;
    unint64_t v11 = [v17 arrivalState];
    if (v11 > 6) {
      int v12 = @"MNArrivalState_Unknown";
    }
    else {
      int v12 = off_1E60FB378[v11];
    }
    uint64_t v16 = [v10 stringWithFormat:@"%@, leg: %d", v12, objc_msgSend(v17, "legIndex")];
  }
  [(MNTraceNavigationEventRecorder *)self _recordEvent:18 description:v16];
}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  unint64_t v11 = objc_msgSend(a4, "route", a3);
  id v23 = v11;
  if (v7)
  {
    [(MNTraceNavigationEventRecorder *)self _recordEvent:2 description:0];
  }
  else
  {
    int v12 = [v11 destination];
    uint64_t v13 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v14 = [v23 transportType];
    if (v14 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = off_1E60FB400[(int)v14];
    }
    uint64_t v16 = [(__CFString *)v15 capitalizedString];
    if ((unint64_t)(a5 - 1) > 3) {
      id v17 = @"None";
    }
    else {
      id v17 = off_1E60FB3B0[a5 - 1];
    }
    uint64_t v18 = [v12 humanDescriptionWithAddressAndLatLng];
    double v19 = [v23 name];
    v20 = [v13 stringWithFormat:@"%@ %@ to [%@] via %@", v16, v17, v18, v19];

    if (v8) {
      [v20 appendFormat:@", isResumingMultipointRoute: %d", 1];
    }
    [(MNTraceNavigationEventRecorder *)self _recordEvent:1 description:v20];
    [(MNTraceNavigationEventRecorder *)self _recordDebugSettings];
    traceRecorder = self->_traceRecorder;
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
    [(MNTraceRecorder *)traceRecorder setNavigationStartDate:v22];
  }
}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  if (a4 == -1) {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v6 = (a4 + 1);
  }
  id v7 = [NSString stringWithFormat:@"Step #%d (step index: %d, segment index: %d)", v6, a4, a5];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:7 description:v7];
}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  if (a6 - 1 > 5) {
    id v7 = @"Unknown";
  }
  else {
    id v7 = off_1E60FB3D0[a6 - 1];
  }
  id v8 = [NSString stringWithFormat:@"From waypoint: %d reason: %@", a4, a5, v7];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:19 description:v8];
}

- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MNTraceNavigationEventRecorder *)self _recordEvent:8 description:v5];
}

- (void)navigationSession:(id)a3 didSuppressReroute:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    if (!previousSuppressedRerouteError
      || (uint64_t v8 = -[NSError code](previousSuppressedRerouteError, "code"), v8 != [v6 code]))
    {
      uint64_t v9 = [v6 userInfo];
      double v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
      [(MNTraceNavigationEventRecorder *)self _recordEvent:11 description:v10];

      objc_storeStrong((id *)&self->_previousSuppressedRerouteError, a4);
    }
  }
}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  uint64_t v9 = NSString;
  id v10 = a4;
  id v11 = [v10 route];
  int v12 = [v11 name];
  if (a7 - 1 > 0xE) {
    uint64_t v13 = @"Unknown";
  }
  else {
    uint64_t v13 = off_1E60FB438[a7 - 1];
  }
  uint64_t v14 = [v10 route];
  uint64_t v15 = [v14 serverRouteID];
  uint64_t v16 = [v10 route];

  id v17 = [v16 uniqueRouteID];
  id v19 = [v9 stringWithFormat:@"%@ | %@ | %@ | %@", v12, v13, v15, v17];

  [(MNTraceNavigationEventRecorder *)self _recordEvent:12 description:v19];
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a4;
  id v20 = (id)NSString;
  id v9 = a5;
  id v10 = [v9 route];
  id v11 = [v10 name];
  if (v7 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v12 = off_1E60FB400[(int)v7];
  }
  uint64_t v13 = [(__CFString *)v12 capitalizedString];
  if (a6 - 1 > 0xE) {
    uint64_t v14 = @"Unknown";
  }
  else {
    uint64_t v14 = off_1E60FB438[a6 - 1];
  }
  uint64_t v15 = [v9 route];
  uint64_t v16 = [v15 serverRouteID];
  id v17 = [v9 route];

  uint64_t v18 = [v17 uniqueRouteID];
  id v21 = [v20 stringWithFormat:@"%@ | ChangedTransportType: %@ | %@ | %@ | %@", v11, v13, v14, v16, v18];

  [(MNTraceNavigationEventRecorder *)self _recordEvent:12 description:v21];
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;
}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    id v19 = self;
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v12 = NSString;
          uint64_t v13 = [v11 route];
          uint64_t v14 = [v13 name];
          uint64_t v15 = [v11 route];
          uint64_t v16 = [v15 uniqueRouteID];
          id v17 = [v12 stringWithFormat:@"%@ (%@)", v14, v16];

          [v6 addObject:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    self = v19;
    id v5 = v20;
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v18 = [v6 componentsJoinedByString:@", "];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:13 description:v18];
}

- (void)navigationSession:(id)a3 didUpdateDestination:(id)a4
{
  id v5 = [(MNTraceNavigationEventRecorder *)self _descriptionForWaypoint:a4];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:14 description:v5];
}

- (void)navigationSession:(id)a3 didRerouteWithWaypoints:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = -[MNTraceNavigationEventRecorder _descriptionForWaypoint:](self, "_descriptionForWaypoint:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 componentsJoinedByString:@", "];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:15 description:v13];
}

- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4
{
  id v5 = [(MNTraceNavigationEventRecorder *)self _descriptionForWaypoint:a4];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:16 description:v5];
}

- (void)navigationSession:(id)a3 didRemoveWaypoint:(id)a4
{
  id v5 = [(MNTraceNavigationEventRecorder *)self _descriptionForWaypoint:a4];
  [(MNTraceNavigationEventRecorder *)self _recordEvent:17 description:v5];
}

- (void)navigationSession:(id)a3 didAnnounce:(id)a4 stage:(unint64_t)a5
{
}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  id v27 = a4;
  id v5 = [v27 primarySign];
  id v6 = [v5 uniqueID];
  currentPrimarySignID = self->_currentPrimarySignID;
  unint64_t v8 = v6;
  id v9 = currentPrimarySignID;
  if (v8 | (unint64_t)v9)
  {
    uint64_t v10 = v9;
    char v11 = [(id)v8 isEqual:v9];

    if ((v11 & 1) == 0)
    {
      int v12 = [v27 primarySign];
      uint64_t v13 = [(MNTraceNavigationEventRecorder *)self _stringForSignDescription:v12];

      [(MNTraceNavigationEventRecorder *)self _recordEvent:22 description:v13];
      long long v14 = [v5 uniqueID];
      long long v15 = self->_currentPrimarySignID;
      self->_currentPrimarySignID = v14;
    }
  }
  long long v16 = [v27 secondarySign];
  long long v17 = [v16 uniqueID];
  currentSecondarySignID = self->_currentSecondarySignID;
  unint64_t v19 = v17;
  id v20 = currentSecondarySignID;
  if (v19 | (unint64_t)v20)
  {
    id v21 = v20;
    char v22 = [(id)v19 isEqual:v20];

    if ((v22 & 1) == 0)
    {
      if (v16)
      {
        long long v23 = [v27 secondarySign];
        long long v24 = [(MNTraceNavigationEventRecorder *)self _stringForSignDescription:v23];

        [(MNTraceNavigationEventRecorder *)self _recordEvent:23 description:v24];
      }
      else
      {
        [(MNTraceNavigationEventRecorder *)self _recordEvent:24 description:0];
      }
      long long v25 = [v16 uniqueID];
      id v26 = self->_currentSecondarySignID;
      self->_currentSecondarySignID = v25;
    }
  }
}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7 == [(NSArray *)self->_lastARInfos count])
  {
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = [(NSArray *)self->_lastARInfos objectAtIndexedSubscript:v8];
        uint64_t v10 = [v9 guidanceEventID];
        char v11 = [v6 objectAtIndexedSubscript:v8];
        int v12 = [v11 guidanceEventID];
        unint64_t v13 = v10;
        unint64_t v14 = v12;
        if (v13 | v14)
        {
          long long v15 = (void *)v14;
          char v16 = [(id)v13 isEqual:v14];

          if ((v16 & 1) == 0) {
            goto LABEL_9;
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v8 < [v6 count]);
    }
  }
  else
  {
LABEL_9:
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__MNTraceNavigationEventRecorder_navigationSession_updateSignsWithARInfo___block_invoke;
    v19[3] = &unk_1E60FB358;
    v19[4] = self;
    long long v17 = objc_msgSend(v6, "_geo_map:", v19);
    uint64_t v18 = [v17 componentsJoinedByString:@" /// "];
    [(MNTraceNavigationEventRecorder *)self _recordEvent:29 description:v18];
    objc_storeStrong((id *)&self->_lastARInfos, a4);
  }
}

uint64_t __74__MNTraceNavigationEventRecorder_navigationSession_updateSignsWithARInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _descriptionForARInfo:a2];
}

- (void)navigationSession:(id)a3 showLaneDirections:(id)a4
{
  id v14 = a4;
  id v5 = [v14 uniqueID];
  laneGuidanceID = self->_laneGuidanceID;
  unint64_t v7 = v5;
  id v8 = laneGuidanceID;
  if (v7 | (unint64_t)v8)
  {
    id v9 = v8;
    char v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      char v11 = [v14 description];
      [(MNTraceNavigationEventRecorder *)self _recordEvent:25 description:v11];

      int v12 = [v14 uniqueID];
      unint64_t v13 = self->_laneGuidanceID;
      self->_laneGuidanceID = v12;
    }
  }
}

- (void)navigationSession:(id)a3 hideLaneDirectionsForId:(id)a4
{
}

- (void)navigationSession:(id)a3 showJunctionView:(id)a4
{
  id v14 = a4;
  id v5 = [v14 uniqueID];
  junctionViewID = self->_junctionViewID;
  unint64_t v7 = v5;
  id v8 = junctionViewID;
  if (v7 | (unint64_t)v8)
  {
    id v9 = v8;
    char v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      char v11 = [v14 description];
      [(MNTraceNavigationEventRecorder *)self _recordEvent:27 description:v11];

      int v12 = [v14 uniqueID];
      unint64_t v13 = self->_junctionViewID;
      self->_junctionViewID = v12;
    }
  }
}

- (void)navigationSession:(id)a3 hideJunctionViewForId:(id)a4
{
}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  objc_msgSend(a4, "description", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MNTraceNavigationEventRecorder *)self _recordEvent:10 description:v6];
}

- (void)navigationSession:(id)a3 didReceiveTransitAlert:(id)a4
{
  objc_msgSend(a4, "description", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MNTraceNavigationEventRecorder *)self _recordEvent:20 description:v5];
}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 type];
  if (v5 == 4)
  {
    id v8 = [v10 arrivalInfo];
    [(MNTraceNavigationEventRecorder *)self _didUpdateArrivalInfo:v8];
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    unint64_t v6 = [v10 reason] - 1;
    if (v6 > 9) {
      unint64_t v7 = @"Unknown";
    }
    else {
      unint64_t v7 = off_1E60FB4B0[v6];
    }
    [(MNTraceNavigationEventRecorder *)self _recordEvent:3 description:v7];
    traceRecorder = self->_traceRecorder;
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    [(MNTraceRecorder *)traceRecorder setNavigationEndDate:v8];
  }

LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastARInfos, 0);
  objc_storeStrong((id *)&self->_junctionViewID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceID, 0);
  objc_storeStrong((id *)&self->_currentSecondarySignID, 0);
  objc_storeStrong((id *)&self->_currentPrimarySignID, 0);
  objc_storeStrong((id *)&self->_previousSuppressedRerouteError, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
}

@end