@interface MNNavigationTraceManager
+ (void)_clearOldTracesInDirectory:(id)a3 matchingExpression:(id)a4 beforeDate:(id)a5;
+ (void)clearOldTraces;
- (BOOL)_isNavigating;
- (BOOL)assumesFullCharge;
- (BOOL)coarseModeEnabled;
- (BOOL)isAuthorized;
- (BOOL)isStarted;
- (BOOL)isTracePlayer;
- (GEOMotionContextProviderDelegate)motionDelegate;
- (MNLocationProviderDelegate)delegate;
- (MNNavigationTraceManagerDelegate)traceManagerDelegate;
- (MNTracePlayer)tracePlayer;
- (MNTraceRecorder)traceRecorder;
- (MNVirtualGarageProviderDelegate)virtualGarageDelegate;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)expectedGpsUpdateInterval;
- (double)timeScale;
- (id)_defaultTraceNameForDestination:(id)a3 isSimulation:(BOOL)a4;
- (id)hardwareModel;
- (int)headingOrientation;
- (int64_t)navigationType;
- (unint64_t)_startIndexForNavigation;
- (unint64_t)traceVersion;
- (unint64_t)vehiclesCount;
- (void)_copyTraceToCrashReporterDirectory:(id)a3;
- (void)_createSymlinkForTracePath:(id)a3;
- (void)_recordEnvironmentInfo:(id)a3;
- (void)_recordStylesheet:(id)a3;
- (void)close;
- (void)dealloc;
- (void)openForPlaybackWithTracePath:(id)a3;
- (void)openForRecordingWithTraceRecordingData:(id)a3 traceName:(id)a4 selectedRouteIndex:(unint64_t)a5 isReconnecting:(BOOL)a6 isSimulation:(BOOL)a7;
- (void)openForSimulationWithRoute:(id)a3 traceRecordingData:(id)a4 traceNameOverride:(id)a5;
- (void)saveRoutePlanningTrace:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMotionDelegate:(id)a3;
- (void)setNavigationType:(int64_t)a3;
- (void)setTraceManagerDelegate:(id)a3;
- (void)setVirtualGarageDelegate:(id)a3;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4;
- (void)tracePlayer:(id)a3 didReceiveLocationError:(id)a4;
- (void)tracePlayer:(id)a3 didRecieveNetworkEvent:(id)a4;
- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6;
- (void)tracePlayer:(id)a3 didUpdateEVData:(id)a4;
- (void)tracePlayer:(id)a3 didUpdateHeading:(id)a4;
- (void)tracePlayer:(id)a3 didUpdateLocation:(id)a4;
- (void)tracePlayer:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6;
- (void)tracePlayer:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5;
- (void)tracePlayer:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5;
- (void)tracePlayerDidPause:(id)a3;
- (void)tracePlayerDidPauseLocationUpdates:(id)a3;
- (void)tracePlayerDidResume:(id)a3;
- (void)tracePlayerDidResumeLocationUpdates:(id)a3;
- (void)updatedVehicleStateWithHandler:(id)a3;
@end

@implementation MNNavigationTraceManager

- (void)dealloc
{
  [(MNTracePlayer *)self->_tracePlayer unregisterObserver:self];
  if (self->_initialNetworkState) {
    +[MNTraceNetworkConditionHelper setCurrentState:](MNTraceNetworkConditionHelper, "setCurrentState:");
  }
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationTraceManager;
  [(MNNavigationTraceManager *)&v3 dealloc];
}

- (void)openForPlaybackWithTracePath:(id)a3
{
  id v4 = a3;
  v5 = +[MNTraceNetworkConditionHelper getCurrentState];
  initialNetworkState = self->_initialNetworkState;
  self->_initialNetworkState = v5;

  v7 = [[MNTracePlayer alloc] initWithPath:v4];
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = v7;

  GEOConfigGetDouble();
  -[MNTracePlayer setSpeedMultiplier:](self->_tracePlayer, "setSpeedMultiplier:");
  [(MNTracePlayer *)self->_tracePlayer setShouldUpdateRouteWhenJumping:GEOConfigGetBOOL()];
  [(MNTracePlayer *)self->_tracePlayer setShouldPlayETARequests:GEOConfigGetBOOL()];
  [(MNTracePlayer *)self->_tracePlayer setShouldPlayNetworkEvents:GEOConfigGetBOOL()];
  [(MNTracePlayer *)self->_tracePlayer registerObserver:self];
  id v25 = [(MNTracePlayer *)self->_tracePlayer trace];
  v9 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v9 setEventType:1];
  [(MNTracePlaybackDetails *)v9 setTracePath:v4];

  [(MNTracePlayer *)self->_tracePlayer duration];
  -[MNTracePlaybackDetails setTraceDuration:](v9, "setTraceDuration:");
  v10 = [v25 serializableBookmarks];
  [(MNTracePlaybackDetails *)v9 setBookmarks:v10];

  v11 = [v25 locations];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [v25 miscInfo];
    v14 = [v13 objectForKeyedSubscript:@"pedestrian_trace_path"];

    v15 = [v25 miscInfo];
    v16 = [v15 objectForKeyedSubscript:@"pedestrian_trace_relative_timestamp"];

    if (v14 && v16)
    {
      v17 = [v14 stringValue];
      [(MNTracePlaybackDetails *)v9 setPedestrianTracePath:v17];

      v18 = [v25 locations];
      v19 = [v18 objectAtIndexedSubscript:1];

      [v16 doubleValue];
      double v21 = v20;
      [v19 timestamp];
      [(MNTracePlaybackDetails *)v9 setPedestrianTraceStartRelativeTimestamp:v21 - v22];
    }
  }
  v23 = +[MNVirtualGarageManager sharedManager];
  [v23 setProvider:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v9];
}

- (void)openForRecordingWithTraceRecordingData:(id)a3 traceName:(id)a4 selectedRouteIndex:(unint64_t)a5 isReconnecting:(BOOL)a6 isSimulation:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if (self->_traceRecorder)
  {
    v15 = [NSString stringWithFormat:@"Trace recording already in progress"];
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v54 = "-[MNNavigationTraceManager openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnectin"
            "g:isSimulation:]";
      __int16 v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      __int16 v57 = 1024;
      int v58 = 124;
      __int16 v59 = 2080;
      v60 = "NO";
      __int16 v61 = 2112;
      v62 = v15;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  else
  {
    if (v13)
    {
      id v17 = v13;
    }
    else
    {
      v18 = [v12 waypoints];
      v19 = [v18 lastObject];
      id v17 = [(MNNavigationTraceManager *)self _defaultTraceNameForDestination:v19 isSimulation:v7];
    }
    double v20 = +[MNFilePaths navTraceExtension];
    double v21 = +[MNFilePaths navTracesDirectoryPath];
    double v22 = +[MNFilePaths tracePathForTraceName:v17 extension:v20 directoryPath:v21];

    if (!a6)
    {
      v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v23 fileExistsAtPath:v22]) {
        [v23 removeItemAtPath:v22 error:0];
      }
    }
    [(MNNavigationTraceManager *)self _createSymlinkForTracePath:v22];
    self->_isSimulation = v7;
    v24 = objc_alloc_init(MNTraceRecorder);
    traceRecorder = self->_traceRecorder;
    self->_traceRecorder = v24;

    [v12 initialDirectionsRequestTimestamp];
    if (v26 > 0.0)
    {
      v27 = (void *)MEMORY[0x1E4F1C9C8];
      [v12 initialDirectionsRequestTimestamp];
      v28 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
      [(MNTraceRecorder *)self->_traceRecorder setRecordingStartDate:v28];
    }
    v52 = v17;
    [(MNTraceRecorder *)self->_traceRecorder startWritingTraceToPath:v22 traceType:0 withErrorHandler:0];
    [(MNTraceRecorder *)self->_traceRecorder setIsSimulation:v7];
    if (!a6)
    {
      [(MNNavigationTraceManager *)self _recordEnvironmentInfo:self->_traceRecorder];
      [(MNNavigationTraceManager *)self _recordStylesheet:self->_traceRecorder];
      v29 = [(MNTraceRecorder *)self->_traceRecorder recordingStartDate];
      [v29 timeIntervalSinceReferenceDate];
      double v31 = v30;

      [v12 initialDirectionsRequestTimestamp];
      double v32 = 0.0;
      double v33 = 0.0;
      if (v34 > 0.0)
      {
        [v12 initialDirectionsRequestTimestamp];
        double v33 = v35 - v31;
      }
      [v12 initialDirectionsResponseTimestamp];
      if (v36 > 0.0)
      {
        [v12 initialDirectionsResponseTimestamp];
        double v32 = v37 - v31;
      }
      v38 = self->_traceRecorder;
      v39 = [v12 initialDirectionsRequest];
      v40 = [v12 initialDirectionsResponse];
      v41 = [v12 initialDirectionsRequestError];
      v42 = [v12 waypoints];
      [(MNTraceRecorder *)v38 recordDirectionsRequest:v39 response:v40 error:v41 waypoints:v42 selectedRouteIndex:v51 requestTimestamp:v33 responseTimestamp:v32];

      v43 = self->_traceRecorder;
      v44 = [v12 initialDirectionsResponse];
      v45 = [v44 directionsResponseID];
      [(MNTraceRecorder *)v43 recordRouteChangeWithIndex:v51 directionsResponseID:v45 etauResponseID:0 rerouteReason:0];
    }
    v46 = self->_traceRecorder;
    v47 = +[MNLocationManager sharedLocationManager];
    [v47 setLocationRecorder:v46];

    v48 = +[MNVirtualGarageManager sharedManager];
    [v48 setTraceRecorder:self->_traceRecorder];

    v49 = objc_alloc_init(MNTracePlaybackDetails);
    [(MNTracePlaybackDetails *)v49 setEventType:7];
    [(MNTracePlaybackDetails *)v49 setTracePath:v22];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
    [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v49];
  }
}

- (void)openForSimulationWithRoute:(id)a3 traceRecordingData:(id)a4 traceNameOverride:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  if (self->_traceRecorder)
  {
    id v12 = [NSString stringWithFormat:@"Trace recording already in progress."];
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v58 = "-[MNNavigationTraceManager openForSimulationWithRoute:traceRecordingData:traceNameOverride:]";
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      __int16 v61 = 1024;
      int v62 = 185;
      __int16 v63 = 2080;
      v64 = "NO";
      __int16 v65 = 2112;
      v66 = v12;
LABEL_7:
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_tracePlayer)
  {
    id v12 = [NSString stringWithFormat:@"Trace playback already in progress."];
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v58 = "-[MNNavigationTraceManager openForSimulationWithRoute:traceRecordingData:traceNameOverride:]";
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      __int16 v61 = 1024;
      int v62 = 190;
      __int16 v63 = 2080;
      v64 = "NO";
      __int16 v65 = 2112;
      v66 = v12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v14 = @"LatestSimulation";
  v56 = v10;
  if (v10) {
    v14 = v10;
  }
  v15 = v14;
  v16 = +[MNFilePaths navTraceExtension];
  id v17 = +[MNFilePaths navTracesDirectoryPath];
  __int16 v55 = v15;
  uint64_t v18 = +[MNFilePaths tracePathForTraceName:v15 extension:v16 directoryPath:v17];

  v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v19 fileExistsAtPath:v18]) {
    [v19 removeItemAtPath:v18 error:0];
  }
  -[MNNavigationTraceManager _createSymlinkForTracePath:](self, "_createSymlinkForTracePath:", v18, v19);
  self->_isSimulation = 1;
  double v20 = objc_alloc_init(MNTraceRecorder);
  traceRecorder = self->_traceRecorder;
  self->_traceRecorder = v20;

  v54 = (void *)v18;
  [(MNTraceRecorder *)self->_traceRecorder startWritingTraceToPath:v18 traceType:0 withErrorHandler:0];
  [(MNTraceRecorder *)self->_traceRecorder setIsSimulation:1];
  [(MNTraceRecorder *)self->_traceRecorder resetLocationsForSimulation];
  [(MNNavigationTraceManager *)self _recordEnvironmentInfo:self->_traceRecorder];
  [(MNNavigationTraceManager *)self _recordStylesheet:self->_traceRecorder];
  double v22 = [(MNTraceRecorder *)self->_traceRecorder recordingStartDate];
  [v22 timeIntervalSinceReferenceDate];
  double v24 = v23;

  id v25 = self->_traceRecorder;
  double v26 = [v9 initialDirectionsRequest];
  v27 = [v9 initialDirectionsResponse];
  v28 = [v9 initialDirectionsRequestError];
  v29 = [v9 waypoints];
  double v30 = [v8 route];
  uint64_t v31 = [v30 indexInResponse];
  [v9 initialDirectionsRequestTimestamp];
  double v33 = v32 - v24;
  [v9 initialDirectionsResponseTimestamp];
  [(MNTraceRecorder *)v25 recordDirectionsRequest:v26 response:v27 error:v28 waypoints:v29 selectedRouteIndex:v31 requestTimestamp:v33 responseTimestamp:v34 - v24];

  double v35 = self->_traceRecorder;
  double v36 = [v8 route];
  uint64_t v37 = [v36 indexInResponse];
  v38 = [v9 initialDirectionsResponse];
  v39 = [v38 directionsResponseID];
  [(MNTraceRecorder *)v35 recordRouteChangeWithIndex:v37 directionsResponseID:v39 etauResponseID:0 rerouteReason:0];

  [(MNTraceRecorder *)self->_traceRecorder beginTransaction];
  v40 = objc_opt_new();
  [v40 setSimulationType:1];
  [v40 setInitialRoute:v8];
  v41 = [[MNSimulatedLocationGenerator alloc] initWithSimulationParameters:v40];
  v42 = [(MNSimulatedLocationGenerator *)v41 nextSimulatedLocationWithElapsedTime:0.0];
  [(MNTraceRecorder *)self->_traceRecorder timeSinceRecordingBegan];
  if (v42)
  {
    double v44 = v43;
    do
    {
      [(MNTraceRecorder *)self->_traceRecorder recordLocation:v42 rawLocation:v42 timestamp:v44];
      double v44 = v44 + 1.0;
      uint64_t v45 = [(MNSimulatedLocationGenerator *)v41 nextSimulatedLocationWithElapsedTime:1.0];

      v42 = (void *)v45;
    }
    while (v45);
  }

  [(MNTraceRecorder *)self->_traceRecorder endTransaction];
  [(MNTraceRecorder *)self->_traceRecorder saveTraceSynchronously];
  v46 = self->_traceRecorder;
  self->_traceRecorder = 0;

  v47 = [[MNTracePlayer alloc] initWithPath:v54];
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = v47;

  GEOConfigGetDouble();
  -[MNTracePlayer setSpeedMultiplier:](self->_tracePlayer, "setSpeedMultiplier:");
  [(MNTracePlayer *)self->_tracePlayer setShouldPlayETARequests:GEOConfigGetBOOL()];
  [(MNTracePlayer *)self->_tracePlayer setShouldUpdateRouteWhenJumping:0];
  [(MNTracePlayer *)self->_tracePlayer registerObserver:self];
  v49 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v49 setEventType:1];
  [(MNTracePlaybackDetails *)v49 setTracePath:v54];
  [(MNTracePlayer *)self->_tracePlayer duration];
  -[MNTracePlaybackDetails setTraceDuration:](v49, "setTraceDuration:");
  v50 = [(MNTracePlayer *)self->_tracePlayer trace];
  uint64_t v51 = [v50 serializableBookmarks];
  [(MNTracePlaybackDetails *)v49 setBookmarks:v51];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v49];

  v11 = v56;
LABEL_9:
}

- (void)saveRoutePlanningTrace:(id)a3
{
  id v37 = a3;
  if (GEOConfigGetBOOL())
  {
    id v4 = [v37 waypoints];
    v5 = [v4 lastObject];
    uint64_t v6 = [(MNNavigationTraceManager *)self _defaultTraceNameForDestination:v5 isSimulation:0];

    BOOL v7 = +[MNFilePaths routePlanningTraceExtension];
    id v8 = +[MNFilePaths routePlanningTracesDirectoryPath];
    double v36 = (void *)v6;
    id v9 = +[MNFilePaths tracePathForTraceName:v6 extension:v7 directoryPath:v8];

    id v10 = v9;
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = v10;
    if ([v11 fileExistsAtPath:v10])
    {
      uint64_t v13 = 2;
      id v12 = v10;
      do
      {
        v14 = [v10 stringByDeletingPathExtension];
        v15 = objc_msgSend(v14, "stringByAppendingFormat:", @" %u", v13);

        v16 = +[MNFilePaths routePlanningTraceExtension];
        id v12 = [v15 stringByAppendingPathExtension:v16];

        uint64_t v13 = (v13 + 1);
      }
      while (([v11 fileExistsAtPath:v12] & 1) != 0);
    }
    id v17 = objc_alloc_init(MNTraceRecorder);
    traceRecorder = self->_traceRecorder;
    self->_traceRecorder = v17;

    [(MNTraceRecorder *)self->_traceRecorder startWritingTraceToPath:v12 traceType:1 withErrorHandler:0];
    double v35 = [v37 initialUserLocation];
    v19 = [v35 timestamp];
    [(MNTraceRecorder *)self->_traceRecorder setRecordingStartDate:v19];

    double v20 = [(MNTraceRecorder *)self->_traceRecorder recordingStartDate];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    [v37 initialDirectionsRequestTimestamp];
    double v23 = 0.0;
    double v24 = 0.0;
    if (v25 > 0.0)
    {
      [v37 initialDirectionsRequestTimestamp];
      double v24 = v26 - v22;
    }
    [v37 initialDirectionsResponseTimestamp];
    if (v27 > 0.0)
    {
      [v37 initialDirectionsResponseTimestamp];
      double v23 = v28 - v22;
    }
    v29 = self->_traceRecorder;
    double v30 = [v37 initialDirectionsRequest];
    uint64_t v31 = [v37 initialDirectionsResponse];
    double v32 = [v37 initialDirectionsRequestError];
    double v33 = [v37 waypoints];
    double v34 = [v37 initialDirectionsResponse];
    -[MNTraceRecorder recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:](v29, "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v30, v31, v32, v33, [v34 selectedRouteIndex], v24, v23);

    [(MNTraceRecorder *)self->_traceRecorder recordLocation:v35 timestamp:0.0];
    [(MNNavigationTraceManager *)self close];
  }
}

- (void)close
{
  objc_super v3 = +[MNLocationManager sharedLocationManager];
  traceRecorder = self->_traceRecorder;
  if (traceRecorder)
  {
    v5 = [(MNTraceRecorder *)traceRecorder tracePath];
    uint64_t v6 = self->_traceRecorder;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __33__MNNavigationTraceManager_close__block_invoke;
    v16 = &unk_1E60F6668;
    id v17 = self;
    id v18 = v5;
    id v7 = v5;
    [(MNTraceRecorder *)v6 saveTraceWithCompletionHandler:&v13];
    objc_msgSend(v3, "setLocationRecorder:", 0, v13, v14, v15, v16, v17);
    id v8 = +[MNVirtualGarageManager sharedManager];
    [v8 setTraceRecorder:0];

    id v9 = self->_traceRecorder;
    self->_traceRecorder = 0;
  }
  else if (self->_tracePlayer)
  {
    id v10 = +[MNVirtualGarageManager sharedManager];
    [v10 setProvider:0];

    [(MNTracePlayer *)self->_tracePlayer stop];
    [(MNTracePlayer *)self->_tracePlayer unregisterObserver:self];
    tracePlayer = self->_tracePlayer;
    self->_tracePlayer = 0;

    if (self->_initialNetworkState)
    {
      +[MNTraceNetworkConditionHelper setCurrentState:](MNTraceNetworkConditionHelper, "setCurrentState:");
      initialNetworkState = self->_initialNetworkState;
      self->_initialNetworkState = 0;
    }
  }
}

void __33__MNNavigationTraceManager_close__block_invoke(uint64_t a1)
{
  *(void *)&v13[5] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24) && GEOConfigGetBOOL()) {
    [*(id *)(a1 + 32) _copyTraceToCrashReporterDirectory:*(void *)(a1 + 40)];
  }
  uint64_t v11 = 66053;
  int v2 = fsctl((const char *)[*(id *)(a1 + 40) fileSystemRepresentation], 0xC0084A44uLL, &v11, 0);
  objc_super v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67109378;
      v13[0] = v2;
      LOWORD(v13[1]) = 2114;
      *(void *)((char *)&v13[1] + 2) = v5;
      uint64_t v6 = "Error: Failed to mark nav trace as purgeable: %i -- %{public}@";
      id v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 18;
LABEL_9:
      _os_log_impl(&dword_1B542B000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(void *)uint64_t v13 = v10;
    uint64_t v6 = "Successfully marked nav trace as purgeable: %{public}@";
    id v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_9;
  }
}

- (BOOL)_isNavigating
{
  return (self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (unint64_t)_startIndexForNavigation
{
  int v2 = [(MNTracePlayer *)self->_tracePlayer trace];
  objc_super v3 = [v2 locations];
  unint64_t v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (id)_defaultTraceNameForDestination:(id)a3 isSimulation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28C10];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  os_log_type_t v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v7 setTimeZone:v8];

  uint32_t v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [v7 stringFromDate:v9];

  uint64_t v11 = [v6 navDisplayName];

  id v12 = [v11 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  if (!v12) {
    id v12 = @"Unknown";
  }
  if (v4) {
    uint64_t v13 = @"%@_%@_(Simulation)";
  }
  else {
    uint64_t v13 = @"%@_%@";
  }
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v10, v12);

  return v14;
}

- (id)hardwareModel
{
  hardwareModel = self->_hardwareModel;
  if (!hardwareModel)
  {
    BOOL v4 = (NSString *)MGCopyAnswer();
    uint64_t v5 = self->_hardwareModel;
    self->_hardwareModel = v4;

    hardwareModel = self->_hardwareModel;
  }
  return hardwareModel;
}

- (void)_recordEnvironmentInfo:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F64860];
  id v5 = a3;
  id v14 = [v4 sharedPlatform];
  id v6 = GEOConfigGetString();
  id v7 = [MEMORY[0x1E4F64918] modernManager];
  os_log_type_t v8 = [v7 activeTileGroup];
  uint32_t v9 = [v8 releaseInfo];

  uint64_t v10 = [v14 productName];
  [v5 recordEnvironmentInfo:@"ProductName" value:v10];

  uint64_t v11 = [v14 buildVersion];
  [v5 recordEnvironmentInfo:@"BuildVersion" value:v11];

  id v12 = [v14 hardwareIdentifier];
  [v5 recordEnvironmentInfo:@"HardwareIdentifier" value:v12];

  uint64_t v13 = [(MNNavigationTraceManager *)self hardwareModel];
  [v5 recordEnvironmentInfo:@"HardwareModel" value:v13];

  [v5 recordEnvironmentInfo:@"EnvironmentName" value:v6];
  [v5 recordEnvironmentInfo:@"EnvironmentReleaseName" value:v9];
}

- (void)_recordStylesheet:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = GEOResourcesPath();
  uint64_t v13 = v3;
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 hasPrefix:@"scene"]
          && [v10 hasSuffix:@".styl"])
        {
          uint64_t v11 = [v4 stringByAppendingPathComponent:v10];
          id v12 = [v13 contentsAtPath:v11];

          [v14 recordStylesheet:v10 data:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_createSymlinkForTracePath:(id)a3
{
  id v9 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_super v3 = +[MNFilePaths navTracesDirectoryPath];
    BOOL v4 = [v3 stringByAppendingPathComponent:@"LatestTrace.navtrace"];

    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = [v5 attributesOfItemAtPath:v4 error:0];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
    uint64_t v8 = (void *)*MEMORY[0x1E4F283D0];

    if (v7 == v8) {
      [v5 removeItemAtPath:v4 error:0];
    }
    [v5 createSymbolicLinkAtPath:v4 withDestinationPath:v9 error:0];
  }
}

- (void)_copyTraceToCrashReporterDirectory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v14 = 0;
    char v5 = [v4 createDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces" withIntermediateDirectories:1 attributes:0 error:&v14];
    uint64_t v6 = v14;
    if (v5)
    {
      uint64_t v7 = [v3 lastPathComponent];
      uint64_t v8 = [@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces" stringByAppendingPathComponent:v7];

      if ([v4 fileExistsAtPath:v8])
      {
        uint64_t v13 = v6;
        [v4 removeItemAtPath:v8 error:&v13];
        id v9 = v13;

        uint64_t v6 = v9;
      }
      if (v6
        || (id v12 = 0,
            [v4 copyItemAtPath:v3 toPath:v8 error:&v12],
            (uint64_t v6 = v12) != 0))
      {
        uint64_t v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v16 = v6;
          _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error copying trace to CrashReporter directory: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v6 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v16 = v3;
          __int16 v17 = 2112;
          long long v18 = v8;
          _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%@ successfully copied to %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v16 = v6;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Error creating NavTraces directory in CrashReporter: %@", buf, 0xCu);
      }

      uint64_t v8 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces";
    }
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v16 = v3;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Error copying trace to CrashReporter directory because origin trace does not exist: %@", buf, 0xCu);
    }
  }
}

- (void)tracePlayerDidPause:(id)a3
{
  char v5 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v5 setEventType:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v5];
}

- (void)tracePlayerDidResume:(id)a3
{
  char v5 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v5 setEventType:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v5];
}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id v9 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v9 setEventType:5];
  [(MNTracePlaybackDetails *)v9 setCurrentPosition:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v9];
}

- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4
{
  uint64_t v7 = objc_alloc_init(MNTracePlaybackDetails);
  [(MNTracePlaybackDetails *)v7 setEventType:4];
  [(MNTracePlaybackDetails *)v7 setCurrentPosition:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  [WeakRetained navigationTraceManager:self didUpdateTracePlaybackDetails:v7];
}

- (void)tracePlayer:(id)a3 didUpdateLocation:(id)a4
{
  p_locationProviderDelegate = &self->_locationProviderDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  [WeakRetained locationProvider:self didUpdateLocation:v6];
}

- (void)tracePlayer:(id)a3 didReceiveLocationError:(id)a4
{
  p_locationProviderDelegate = &self->_locationProviderDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  [WeakRetained locationProvider:self didReceiveError:v6];
}

- (void)tracePlayerDidPauseLocationUpdates:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
  [WeakRetained locationProviderDidPauseLocationUpdates:self];
}

- (void)tracePlayerDidResumeLocationUpdates:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
  [WeakRetained locationProviderDidResumeLocationUpdates:self];
}

- (void)tracePlayer:(id)a3 didUpdateHeading:(id)a4
{
  p_locationProviderDelegate = &self->_locationProviderDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  [WeakRetained locationProvider:self didUpdateHeading:v6];
}

- (void)tracePlayer:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionContextProviderDelegate);
  [WeakRetained motionContextProvider:self didUpdateMotion:a4 exitType:a5 confidence:a6];
}

- (void)tracePlayer:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  p_locationProviderDelegate = &self->_locationProviderDelegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  [WeakRetained locationProvider:self didUpdateVehicleHeading:v8 timestamp:a4];
}

- (void)tracePlayer:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  p_locationProviderDelegate = &self->_locationProviderDelegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  [WeakRetained locationProvider:self didUpdateVehicleSpeed:v8 timestamp:a4];
}

- (void)tracePlayer:(id)a3 didUpdateEVData:(id)a4
{
  p_virtualGarageProviderDelegate = &self->_virtualGarageProviderDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_virtualGarageProviderDelegate);
  [WeakRetained virtualGarageProvider:self didUpdateSelectedVehicle:v6];
}

- (void)tracePlayer:(id)a3 didRecieveNetworkEvent:(id)a4
{
}

- (void)startUpdatingLocation
{
  if ((self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    unint64_t v3 = [(MNNavigationTraceManager *)self _startIndexForNavigation];
    tracePlayer = self->_tracePlayer;
    [(MNTracePlayer *)tracePlayer startAtLocationIndex:v3];
  }
  else
  {
    [(MNTracePlayer *)self->_tracePlayer start];
    char v5 = self->_tracePlayer;
    [(MNTracePlayer *)v5 pause];
  }
}

- (void)stopUpdatingLocation
{
}

- (NSBundle)effectiveBundle
{
  return 0;
}

- (NSString)effectiveBundleIdentifier
{
  return 0;
}

- (BOOL)isAuthorized
{
  return 1;
}

- (int)headingOrientation
{
  return 0;
}

- (double)expectedGpsUpdateInterval
{
  return 1.0;
}

- (BOOL)coarseModeEnabled
{
  return 0;
}

- (BOOL)isTracePlayer
{
  return 1;
}

- (unint64_t)traceVersion
{
  int v2 = [(MNTracePlayer *)self->_tracePlayer trace];
  unint64_t v3 = [v2 originalVersion];

  return v3;
}

- (double)timeScale
{
  [(MNTracePlayer *)self->_tracePlayer speedMultiplier];
  return result;
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    if (self->_tracePlayer)
    {
      char v5 = objc_alloc_init(MNTraceEVDataRow);
      [(MNTracePlayer *)self->_tracePlayer position];
      -[MNTraceEVDataRow setTimestamp:](v5, "setTimestamp:");
      id v6 = [(MNTracePlayer *)self->_tracePlayer trace];
      uint64_t v7 = [v6 evData];

      unint64_t v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_12);
      if (v8 >= [v7 count])
      {
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      }
      else
      {
        id v9 = [v7 objectAtIndexedSubscript:v8];
        uint64_t v10 = [v9 vehicle];
        (*((void (**)(id, void *, void))v12 + 2))(v12, v10, 0);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_virtualGarageProviderDelegate);
        [WeakRetained virtualGarageProvider:self didUpdateSelectedVehicle:v10];
      }
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    id v4 = v12;
  }
}

uint64_t __59__MNNavigationTraceManager_updatedVehicleStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (unint64_t)vehiclesCount
{
  return 1;
}

- (BOOL)assumesFullCharge
{
  return 0;
}

- (MNLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
  return (MNLocationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOMotionContextProviderDelegate)motionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionContextProviderDelegate);
  return (GEOMotionContextProviderDelegate *)WeakRetained;
}

- (void)setMotionDelegate:(id)a3
{
}

- (MNVirtualGarageProviderDelegate)virtualGarageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_virtualGarageProviderDelegate);
  return (MNVirtualGarageProviderDelegate *)WeakRetained;
}

- (void)setVirtualGarageDelegate:(id)a3
{
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (MNNavigationTraceManagerDelegate)traceManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  return (MNNavigationTraceManagerDelegate *)WeakRetained;
}

- (void)setTraceManagerDelegate:(id)a3
{
}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (MNTraceRecorder)traceRecorder
{
  return self->_traceRecorder;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_destroyWeak((id *)&self->_virtualGarageProviderDelegate);
  objc_destroyWeak((id *)&self->_motionContextProviderDelegate);
  objc_destroyWeak((id *)&self->_locationProviderDelegate);
  objc_destroyWeak((id *)&self->_traceManagerDelegate);
  objc_storeStrong((id *)&self->_initialNetworkState, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_tracePlayer, 0);
}

+ (void)clearOldTraces
{
  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MNNavigationTraceManager_CleanTracesDirectory__clearOldTraces__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(global_queue, block);
}

void __64__MNNavigationTraceManager_CleanTracesDirectory__clearOldTraces__block_invoke(uint64_t a1)
{
  int v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "Cleaning traces directory.", v20, 2u);
  }

  unint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [v3 dateByAddingUnit:16 value:-1 toDate:v4 options:1];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = +[MNFilePaths navTracesDirectoryPath];
  [v6 _clearOldTracesInDirectory:v7 matchingExpression:@"*-journal" beforeDate:v5];

  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v10 = [v8 dateByAddingUnit:0x2000 value:-1 toDate:v9 options:1];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = +[MNFilePaths routePlanningTracesDirectoryPath];
  [v11 _clearOldTracesInDirectory:v12 matchingExpression:@"*" beforeDate:v10];

  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = +[MNFilePaths routeCreationTracesDirectoryPath];
  [v13 _clearOldTracesInDirectory:v14 matchingExpression:@"*" beforeDate:v10];

  long long v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v16 = [MEMORY[0x1E4F1C9C8] now];
  __int16 v17 = [v15 dateByAddingUnit:8 value:-3 toDate:v16 options:1];

  long long v18 = *(void **)(a1 + 32);
  uint64_t v19 = +[MNFilePaths navTracesDirectoryPath];
  [v18 _clearOldTracesInDirectory:v19 matchingExpression:@"*" beforeDate:v17];
}

+ (void)_clearOldTracesInDirectory:(id)a3 matchingExpression:(id)a4 beforeDate:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v34 = a5;
  double v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v39 = v7;
  uint64_t v10 = [v9 contentsOfDirectoryAtPath:v7 error:0];
  double v32 = v8;
  uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self like %@", v8];
  uint64_t v11 = objc_msgSend(v10, "filteredArrayUsingPredicate:");

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v38 = *(void *)v42;
    uint64_t v37 = *MEMORY[0x1E4F283B8];
    double v36 = (void *)*MEMORY[0x1E4F283C0];
    uint64_t v35 = *MEMORY[0x1E4F282C0];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        long long v16 = [v39 stringByAppendingPathComponent:v15];
        __int16 v17 = [v9 attributesOfItemAtPath:v16 error:0];
        long long v18 = [v17 objectForKeyedSubscript:v37];

        if (v18 != v36)
        {
          uint64_t v19 = [v17 objectForKeyedSubscript:v35];
          uint64_t v20 = v19;
          if (!v19
            || ([v19 earlierDate:v34],
                double v21 = objc_claimAutoreleasedReturnValue(),
                int v22 = [v21 isEqualToDate:v20],
                v21,
                v22))
          {
            id v40 = 0;
            int v23 = [v9 removeItemAtPath:v16 error:&v40];
            id v24 = v40;
            double v25 = GEOFindOrCreateLog();
            double v26 = v25;
            if (v23)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v46 = v15;
                double v27 = v26;
                os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
                v29 = "Removed trace \"%@\" because it is too old.";
                uint32_t v30 = 12;
                goto LABEL_14;
              }
            }
            else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v46 = v15;
              __int16 v47 = 2112;
              id v48 = v24;
              double v27 = v26;
              os_log_type_t v28 = OS_LOG_TYPE_ERROR;
              v29 = "Error removing trace \"%@\": %@";
              uint32_t v30 = 22;
LABEL_14:
              _os_log_impl(&dword_1B542B000, v27, v28, v29, buf, v30);
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v13);
  }
}

@end