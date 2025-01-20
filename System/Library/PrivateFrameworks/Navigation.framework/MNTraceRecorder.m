@interface MNTraceRecorder
- (BOOL)_isTracePathValid:(id)a3;
- (BOOL)_recordInfo;
- (MNTrace)trace;
- (MNTraceRecorder)init;
- (NSDate)recordingStartDate;
- (NSString)tracePath;
- (double)timeSinceRecordingBegan;
- (void)_closeTraceDB;
- (void)_dispatchWrite:(id)a3;
- (void)_executeStatementForQuery:(id)a3 handler:(id)a4;
- (void)_initializeTraceDB;
- (void)_logError:(id)a3 resultCode:(int)a4;
- (void)_logSqliteErrorWithResult:(int)a3 file:(const char *)a4 line:(int)a5;
- (void)_prepareStatements;
- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 coordinate:(CLLocationCoordinate2D)a5 rawCoordinate:(CLLocationCoordinate2D)a6 timestamp:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 altitude:(double)a10 speed:(double)a11 speedAccuracy:(double)a12 course:(double)a13 rawCourse:(double)a14 type:(int)a15 courseAccuracy:(double)a16 correctedCoordinate:(CLLocationCoordinate2D)a17 correctedCourse:(double)a18 matchType:(int)a19 activeTransportType:(int)a20 matchInfo:(id)a21 correctedLocation:(id)a22 speedLimit:(int)a23 shieldText:(id)a24 shieldType:(int)a25;
- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 location:(id)a5 correctedLocation:(id)a6;
- (void)_recordLocationMatchInfoOnWriteQueue:(id)a3 forLocationID:(int)a4;
- (void)_recordNavigationUpdate:(int64_t)a3 parameters:(id)a4;
- (void)_updateForExistingTrace;
- (void)_updateNavigationEventsWithLocationReference:(id)a3;
- (void)beginTransaction;
- (void)endTransaction;
- (void)recordAudioSetting:(BOOL)a3 voiceGuidance:(int64_t)a4;
- (void)recordCompassHeading:(double)a3 magneticHeading:(double)a4 accuracy:(double)a5 timestamp:(id)a6;
- (void)recordDebugSetting:(id)a3 settingValue:(id)a4;
- (void)recordDepartWaypoint:(id)a3 legIndex:(unint64_t)a4 departureReason:(unint64_t)a5;
- (void)recordDirectionsRequest:(id)a3 response:(id)a4 error:(id)a5 waypoints:(id)a6 selectedRouteIndex:(unint64_t)a7 requestTimestamp:(double)a8 responseTimestamp:(double)a9;
- (void)recordETAURequest:(id)a3 response:(id)a4 error:(id)a5 destinationName:(id)a6 requestTimestamp:(double)a7 responseTimestamp:(double)a8;
- (void)recordEnvironmentInfo:(id)a3 value:(id)a4;
- (void)recordError:(id)a3;
- (void)recordInitialCourse:(double)a3;
- (void)recordLocation:(id)a3 correctedLocation:(id)a4;
- (void)recordLocation:(id)a3 rawLocation:(id)a4;
- (void)recordLocation:(id)a3 rawLocation:(id)a4 timestamp:(double)a5;
- (void)recordLocation:(id)a3 timestamp:(double)a4;
- (void)recordLocationUpdatePause;
- (void)recordLocationUpdateResume;
- (void)recordMiscInfo:(id)a3 value:(id)a4;
- (void)recordMotionUpdate:(unint64_t)a3 exitType:(unint64_t)a4 confidence:(unint64_t)a5;
- (void)recordNavigationEvent:(int64_t)a3 forLocation:(id)a4 description:(id)a5;
- (void)recordRouteChangeWithIndex:(unint64_t)a3 directionsResponseID:(id)a4 etauResponseID:(id)a5 rerouteReason:(unint64_t)a6;
- (void)recordRouteCreationAction:(unint64_t)a3 request:(id)a4 response:(id)a5 error:(id)a6 anchorPoints:(id)a7 requestDate:(id)a8 responseDate:(id)a9;
- (void)recordSimulatedCoordinate:(CLLocationCoordinate2D)a3 course:(double)a4 altitude:(double)a5 speed:(double)a6 timestamp:(double)a7 activeTransportType:(int)a8;
- (void)recordStylesheet:(id)a3 data:(id)a4;
- (void)recordTransitUpdateError:(id)a3;
- (void)recordTransitUpdateRequest:(id)a3 withTimestamp:(double)a4;
- (void)recordTransitUpdateResponse:(id)a3;
- (void)recordVehicleHeading:(double)a3 timestamp:(id)a4;
- (void)recordVehicleSpeed:(double)a3 timestamp:(id)a4;
- (void)recordVirtualGarageVehicleState:(id)a3 isDifferentVehicle:(BOOL)a4;
- (void)resetLocationsForSimulation;
- (void)saveTraceSynchronously;
- (void)saveTraceWithCompletionHandler:(id)a3;
- (void)setIsSimulation:(BOOL)a3;
- (void)setNavigationEndDate:(id)a3;
- (void)setNavigationStartDate:(id)a3;
- (void)setRecordingStartDate:(id)a3;
- (void)setRouteGenius:(BOOL)a3;
- (void)startWritingTraceToPath:(id)a3 traceType:(int64_t)a4 withErrorHandler:(id)a5;
@end

@implementation MNTraceRecorder

- (MNTraceRecorder)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNTraceRecorder;
  v2 = [(MNTraceRecorder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastPauseSpokenAudio = 0;
    v2->_lastVoiceGuidanceSetting = -1;
    v2->_lastLaneEventHash = 0;
    v4 = v2;
  }

  return v3;
}

- (void)startWritingTraceToPath:(id)a3 traceType:(int64_t)a4 withErrorHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v9 = (char *)a3;
  id v10 = a5;
  if (self->_trace)
  {
    v22 = [NSString stringWithFormat:@"startWritingTraceToPath: called when trace was already created"];
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "_trace == nil";
      __int16 v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  BOOL v11 = [(MNTraceRecorder *)self _isTracePathValid:v9];
  v12 = GEOFindOrCreateLog();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v31 = v9;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Start writing trace to path: %{private}@", buf, 0xCu);
    }

    v14 = objc_alloc_init(MNTrace);
    trace = self->_trace;
    self->_trace = v14;

    objc_storeStrong((id *)&self->_tracePath, a3);
    self->_traceType = a4;
    if (!self->_recordingStartDate)
    {
      v16 = [MEMORY[0x1E4F1C9C8] now];
      recordingStartDate = self->_recordingStartDate;
      self->_recordingStartDate = v16;
    }
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "Setting recording start time to current time", buf, 2u);
    }

    v19 = [(MNTrace *)self->_trace writeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke;
    block[3] = &unk_1E60F7020;
    v25 = v9;
    v26 = self;
    id v27 = v10;
    dispatch_async(v19, block);

    v20 = v25;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v31 = v9;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Error opening trace recorder due to invalid path: %{private}@", buf, 0xCu);
  }

  if (v10)
  {
    v28[0] = *MEMORY[0x1E4F28568];
    v28[1] = @"path";
    v29[0] = @"Invalid path";
    v29[1] = v9;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNTraceErrorDomain" code:10 userInfo:v20];
    (*((void (**)(id, void *))v10 + 2))(v10, v21);

LABEL_14:
  }
}

void __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v3)
  {
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v20 = v5;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "File already exists at path: %{private}@. Attempting to append", buf, 0xCu);
    }
  }
  if ([*(id *)(*(void *)(a1 + 40) + 8) startWritingTraceToPath:*(void *)(a1 + 32)])
  {
    objc_super v6 = *(void **)(a1 + 40);
    if (v3)
    {
      [v6 _updateForExistingTrace];
    }
    else
    {
      [v6 _initializeTraceDB];
      uint64_t v12 = *(void *)(a1 + 40);
      v13 = *(void **)(v12 + 56);
      [*(id *)(v12 + 32) timeIntervalSinceReferenceDate];
      objc_msgSend(v13, "bindParameter:double:", @":recording_start_time");
      [*(id *)(*(void *)(a1 + 40) + 56) execute];
    }
    [*(id *)(a1 + 40) _prepareStatements];
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"Failed to begin writing trace to file.";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MNTraceErrorDomain" code:8 userInfo:v7];
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke_37;
    v14[3] = &unk_1E60F6058;
    id v10 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = v10;
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __70__MNTraceRecorder_startWritingTraceToPath_traceType_withErrorHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveTraceWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_closed)
  {
    v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "!_closed";
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    tracePath = self->_tracePath;
    *(_DWORD *)buf = 138477827;
    v14 = (const char *)tracePath;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Closing trace: %{private}@", buf, 0xCu);
  }

  self->_closed = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MNTraceRecorder_saveTraceWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60F6640;
  v11[4] = self;
  id v12 = v4;
  id v7 = v4;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;
}

void __50__MNTraceRecorder_saveTraceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _closeTraceDB];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  int v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    uint64_t v6 = *MEMORY[0x1E4F1C580];
    uint64_t v7 = *MEMORY[0x1E4F1C590];
    id v16 = 0;
    int v8 = [v5 setResourceValue:v6 forKey:v7 error:&v16];
    id v9 = v16;
    id v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v18 = v10;
        __int16 v19 = 2113;
        id v20 = v2;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Failed applying file protection to %{public}@, error: %{private}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v2;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Failed applying file protection to %{public}@, error: File not found", buf, 0xCu);
    }
  }

  v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138477827;
    id v18 = v14;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Finished closing trace: %{private}@", buf, 0xCu);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

- (void)saveTraceSynchronously
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    v5 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      int v8 = "!_closed";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v7, 0x16u);
    }
  }
  [(MNTraceRecorder *)self saveTraceWithCompletionHandler:0];
  int v3 = [(MNTraceRecorder *)self trace];
  int v4 = [v3 writeGroup];
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_dispatchWrite:(id)a3
{
  id v4 = a3;
  v5 = [(MNTraceRecorder *)self trace];
  uint64_t v6 = [v5 writeGroup];
  int v7 = [(MNTraceRecorder *)self trace];
  int v8 = [v7 writeQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__MNTraceRecorder__dispatchWrite___block_invoke;
  v10[3] = &unk_1E60F6640;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_async(v6, v8, v10);
}

void __34__MNTraceRecorder__dispatchWrite___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trace];
  uint64_t v3 = [v2 db];

  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)_logSqliteErrorWithResult:(int)a3 file:(const char *)a4 line:(int)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [(MNTraceRecorder *)self trace];
    int v12 = 136446978;
    v13 = a4;
    __int16 v14 = 1024;
    int v15 = a5;
    __int16 v16 = 1024;
    int v17 = a3;
    __int16 v18 = 2082;
    __int16 v19 = sqlite3_errmsg((sqlite3 *)[v10 db]);
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%d  SQL error: (%d) %{public}s", (uint8_t *)&v12, 0x22u);
  }
  if (!self->_corrupted)
  {
    self->_corrupted = 1;
    id errorHandler = self->_errorHandler;
    if (errorHandler) {
      dispatch_async(MEMORY[0x1E4F14428], errorHandler);
    }
  }
}

- (BOOL)_isTracePathValid:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28FD8];
  id v4 = a3;
  v5 = [v3 regularExpressionWithPattern:@"[\n\x00\\\\]+" options:0 error:0];
  uint64_t v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v6 == 0;
}

- (void)_initializeTraceDB
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_corrupted)
  {
    uint64_t v3 = +[MNTrace mainSchema];
    if (!v3)
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Failed to load SQL setup script.", buf, 2u);
      }
    }
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Trace DB successfully initialized.", buf, 2u);
    }

    id v6 = v3;
    int v7 = (const char *)[v6 UTF8String];
    int v8 = [(MNTraceRecorder *)self trace];
    LODWORD(v7) = sqlite3_exec((sqlite3 *)[v8 db], v7, 0, 0, 0);

    if (v7)
    {
      id v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
        *(_DWORD *)buf = 136315138;
        v29 = v10;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error executing trace schema: \"%s\"", buf, 0xCu);
      }
    }
    id v11 = [(MNTraceRecorder *)self trace];
    sqlite3_db_config((sqlite3 *)[v11 db], 1002, 1, 0);

    if ([(MNTraceRecorder *)self _recordInfo])
    {
      ppStmt = 0;
      int v12 = [(MNTraceRecorder *)self trace];
      int v13 = sqlite3_prepare_v2((sqlite3 *)[v12 db], "INSERT OR IGNORE INTO navigation_event_types (event_id, event_name) VALUES (?, ?)", 81, &ppStmt, 0);

      if (v13)
      {
        __int16 v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
          *(_DWORD *)buf = 136315138;
          v29 = v15;
        }

LABEL_17:
        sqlite3_finalize(ppStmt);
      }
      else
      {
        unint64_t v16 = 0;
        while (1)
        {
          int v17 = MNTraceNavigationEventTypeAsString(v16);
          uint64_t v18 = sqlite3_bind_int(ppStmt, 1, v16);
          if (v18)
          {
            uint64_t v24 = v18;
            v25 = self;
            uint64_t v26 = 284;
            goto LABEL_29;
          }
          __int16 v19 = ppStmt;
          id v20 = v17;
          uint64_t v21 = sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, 0);
          if (v21) {
            break;
          }
          if (sqlite3_step(ppStmt) != 101)
          {
            v22 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
              *(_DWORD *)buf = 136315138;
              v29 = v23;
            }
          }
          sqlite3_reset(ppStmt);

          if (++v16 == 31) {
            goto LABEL_17;
          }
        }
        uint64_t v24 = v21;
        v25 = self;
        uint64_t v26 = 285;
LABEL_29:
        [(MNTraceRecorder *)v25 _logSqliteErrorWithResult:v24 file:"/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m" line:v26];
      }
    }
  }
}

- (void)_updateForExistingTrace
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  if (sqlite3_prepare_v2([(MNTrace *)self->_trace db], "SELECT cl_timestamp FROM locations ORDER BY db_timestamp ASC LIMIT 1", -1, &ppStmt, 0))
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return;
    }
    id v4 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
    *(_DWORD *)buf = 136315138;
    v23 = (void *)v4;
LABEL_4:
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
    goto LABEL_5;
  }
  if ((sqlite3_step(ppStmt) - 102) > 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(ppStmt, 0));
    id v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    recordingStartDate = self->_recordingStartDate;
    self->_recordingStartDate = v9;

    sqlite3_finalize(ppStmt);
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = self->_recordingStartDate;
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Trace recorder updating existing trace file. Recording start time set to: %@", buf, 0xCu);
    }

    pStmt = 0;
    if (sqlite3_prepare_v2([(MNTrace *)self->_trace db], "SELECT id FROM directions ORDER BY id DESC LIMIT 1", -1, &pStmt, 0))
    {
      uint64_t v3 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      int v13 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
      *(_DWORD *)buf = 136315138;
      v23 = (void *)v13;
      goto LABEL_4;
    }
    if ((sqlite3_step(pStmt) - 102) > 0xFFFFFFFD)
    {
      self->_routeRequestCount = sqlite3_column_int(pStmt, 0);
      sqlite3_finalize(pStmt);
      __int16 v19 = 0;
      if (sqlite3_prepare_v2([(MNTrace *)self->_trace db], "SELECT id FROM eta_traffic_updates ORDER BY id DESC LIMIT 1", -1, &v19, 0))
      {
        uint64_t v3 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          goto LABEL_5;
        }
        unint64_t v16 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
        *(_DWORD *)buf = 136315138;
        v23 = (void *)v16;
        goto LABEL_4;
      }
      if ((sqlite3_step(v19) - 102) > 0xFFFFFFFD)
      {
        self->_etaTrafficUpdateCount = sqlite3_column_int(v19, 0);
      }
      else
      {
        int v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
          *(_DWORD *)buf = 136315138;
          v23 = (void *)v18;
        }
      }
      int v8 = v19;
    }
    else
    {
      __int16 v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
        *(_DWORD *)buf = 136315138;
        v23 = (void *)v15;
      }

      int v8 = pStmt;
    }
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = sqlite3_errmsg([(MNTrace *)self->_trace db]);
      *(_DWORD *)buf = 136315138;
      v23 = (void *)v7;
    }

    int v8 = ppStmt;
  }
  sqlite3_finalize(v8);
}

- (BOOL)_recordInfo
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  trace = self->_trace;
  id v13 = 0;
  id v4 = [(MNTrace *)trace prepareStatement:@"INSERT INTO info (trace_type, version, original_version, recording_start_time, directions_url) VALUES (:trace_type, :version, :original_version, :recording_start_time, :directions_url)" outError:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"%@", v5];
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v15 = "-[MNTraceRecorder _recordInfo]";
      __int16 v16 = 2080;
      int v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      __int16 v18 = 1024;
      int v19 = 361;
      __int16 v20 = 2080;
      uint64_t v21 = "NO";
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
    char v8 = 0;
  }
  else
  {
    [v4 bindParameter:@":trace_type" int:LODWORD(self->_traceType)];
    objc_msgSend(v4, "bindParameter:int:", @":version", +[MNTrace currentVersion](MNTrace, "currentVersion"));
    objc_msgSend(v4, "bindParameter:int:", @":original_version", +[MNTrace currentVersion](MNTrace, "currentVersion"));
    [(NSDate *)self->_recordingStartDate timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "bindParameter:double:", @":recording_start_time");
    id v9 = [MEMORY[0x1E4F64540] sharedService];
    id v6 = [v9 directionsURL];

    int v7 = [v6 absoluteString];
    if ([v7 length]) {
      [v4 bindParameter:@":directions_url" string:v7];
    }
    char v8 = [v4 execute];
    if ((v8 & 1) == 0)
    {
      id v11 = [NSString stringWithFormat:@"Error recording info statement."];
      int v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v15 = "-[MNTraceRecorder _recordInfo]";
        __int16 v16 = 2080;
        int v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
        __int16 v18 = 1024;
        int v19 = 377;
        __int16 v20 = 2080;
        uint64_t v21 = "success";
        __int16 v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    [v4 finalize];
  }

  return v8;
}

- (void)_prepareStatements
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  if (!self->_corrupted)
  {
    trace = self->_trace;
    id v101 = 0;
    [(MNTrace *)trace prepareStatement:@"UPDATE info SET recording_start_time = :recording_start_time" outError:&v101];
    id v4 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
    id v5 = v101;
    updateRecordingStartTimeStatement = self->_updateRecordingStartTimeStatement;
    self->_updateRecordingStartTimeStatement = v4;

    if (v5)
    {
      int v7 = [NSString stringWithFormat:@"%@", v5];
      char v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v103 = "-[MNTraceRecorder _prepareStatements]";
        __int16 v104 = 2080;
        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
        __int16 v106 = 1024;
        int v107 = 395;
        __int16 v108 = 2080;
        v109 = "NO";
        __int16 v110 = 2112;
        v111 = v7;
LABEL_74:
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    else
    {
      id v9 = self->_trace;
      id v100 = 0;
      [(MNTrace *)v9 prepareStatement:@"UPDATE info SET directions_start_time = :directions_start_time" outError:&v100];
      id v10 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
      id v5 = v100;
      updateDirectionsStartTimeStatement = self->_updateDirectionsStartTimeStatement;
      self->_updateDirectionsStartTimeStatement = v10;

      if (v5)
      {
        int v7 = [NSString stringWithFormat:@"%@", v5];
        char v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v103 = "-[MNTraceRecorder _prepareStatements]";
          __int16 v104 = 2080;
          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
          __int16 v106 = 1024;
          int v107 = 396;
          __int16 v108 = 2080;
          v109 = "NO";
          __int16 v110 = 2112;
          v111 = v7;
          goto LABEL_74;
        }
      }
      else
      {
        int v12 = self->_trace;
        id v99 = 0;
        [(MNTrace *)v12 prepareStatement:@"UPDATE info SET navigation_start_time = :navigation_start_time" outError:&v99];
        id v13 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
        id v5 = v99;
        updateNavigationStartTimeStatement = self->_updateNavigationStartTimeStatement;
        self->_updateNavigationStartTimeStatement = v13;

        if (v5)
        {
          int v7 = [NSString stringWithFormat:@"%@", v5];
          char v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v103 = "-[MNTraceRecorder _prepareStatements]";
            __int16 v104 = 2080;
            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
            __int16 v106 = 1024;
            int v107 = 397;
            __int16 v108 = 2080;
            v109 = "NO";
            __int16 v110 = 2112;
            v111 = v7;
            goto LABEL_74;
          }
        }
        else
        {
          int v15 = self->_trace;
          id v98 = 0;
          [(MNTrace *)v15 prepareStatement:@"UPDATE info SET navigation_end_time = :navigation_end_time" outError:&v98];
          __int16 v16 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
          id v5 = v98;
          updateNavigationEndTimeStatement = self->_updateNavigationEndTimeStatement;
          self->_updateNavigationEndTimeStatement = v16;

          if (v5)
          {
            int v7 = [NSString stringWithFormat:@"%@", v5];
            char v8 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v103 = "-[MNTraceRecorder _prepareStatements]";
              __int16 v104 = 2080;
              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
              __int16 v106 = 1024;
              int v107 = 398;
              __int16 v108 = 2080;
              v109 = "NO";
              __int16 v110 = 2112;
              v111 = v7;
              goto LABEL_74;
            }
          }
          else
          {
            __int16 v18 = self->_trace;
            id v97 = 0;
            int v19 = [(MNTrace *)v18 prepareStatement:@"INSERT INTO environment_info (name, value) VALUES (?, ?)" outError:&v97];
            id v5 = v97;
            recordEnvironmentInfoStatement = self->_recordEnvironmentInfoStatement;
            self->_recordEnvironmentInfoStatement = v19;

            if (v5)
            {
              int v7 = [NSString stringWithFormat:@"%@", v5];
              char v8 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v103 = "-[MNTraceRecorder _prepareStatements]";
                __int16 v104 = 2080;
                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                __int16 v106 = 1024;
                int v107 = 399;
                __int16 v108 = 2080;
                v109 = "NO";
                __int16 v110 = 2112;
                v111 = v7;
                goto LABEL_74;
              }
            }
            else
            {
              uint64_t v21 = self->_trace;
              id v96 = 0;
              __int16 v22 = [(MNTrace *)v21 prepareStatement:@"INSERT INTO debug_settings (setting_name, setting_value) VALUES (?, ?)" outError:&v96];
              id v5 = v96;
              recordDebugSettingStatement = self->_recordDebugSettingStatement;
              self->_recordDebugSettingStatement = v22;

              if (v5)
              {
                int v7 = [NSString stringWithFormat:@"%@", v5];
                char v8 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v103 = "-[MNTraceRecorder _prepareStatements]";
                  __int16 v104 = 2080;
                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                  __int16 v106 = 1024;
                  int v107 = 400;
                  __int16 v108 = 2080;
                  v109 = "NO";
                  __int16 v110 = 2112;
                  v111 = v7;
                  goto LABEL_74;
                }
              }
              else
              {
                uint64_t v24 = self->_trace;
                id v95 = 0;
                v25 = [(MNTrace *)v24 prepareStatement:@"INSERT INTO audio_settings (db_timestamp, pause_spoken_audio, volume_setting) VALUES (?, ?, ?)" outError:&v95];
                id v5 = v95;
                recordAudioSettingStatement = self->_recordAudioSettingStatement;
                self->_recordAudioSettingStatement = v25;

                if (v5)
                {
                  int v7 = [NSString stringWithFormat:@"%@", v5];
                  char v8 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v103 = "-[MNTraceRecorder _prepareStatements]";
                    __int16 v104 = 2080;
                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                    __int16 v106 = 1024;
                    int v107 = 401;
                    __int16 v108 = 2080;
                    v109 = "NO";
                    __int16 v110 = 2112;
                    v111 = v7;
                    goto LABEL_74;
                  }
                }
                else
                {
                  id v27 = self->_trace;
                  id v94 = 0;
                  v28 = [(MNTrace *)v27 prepareStatement:@"INSERT INTO stylesheets (stylesheet_name, stylesheet_data) VALUES (?, ?)" outError:&v94];
                  id v5 = v94;
                  recordStylesheetStatement = self->_recordStylesheetStatement;
                  self->_recordStylesheetStatement = v28;

                  if (v5)
                  {
                    int v7 = [NSString stringWithFormat:@"%@", v5];
                    char v8 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v103 = "-[MNTraceRecorder _prepareStatements]";
                      __int16 v104 = 2080;
                      v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                      __int16 v106 = 1024;
                      int v107 = 402;
                      __int16 v108 = 2080;
                      v109 = "NO";
                      __int16 v110 = 2112;
                      v111 = v7;
                      goto LABEL_74;
                    }
                  }
                  else
                  {
                    uint64_t v30 = self->_trace;
                    id v93 = 0;
                    v31 = [(MNTrace *)v30 prepareStatement:@"INSERT INTO locations (db_timestamp, cl_timestamp, latitude, longitude, raw_latitude, raw_longitude, horizontal_accuracy, vertical_accuracy, altitude, speed, speed_accuracy, course, raw_course, course_accuracy, type, reference_frame, raw_reference_frame, event_type, corrected_latitude, corrected_longitude, corrected_course, match_type, active_transport_type, speed_limit, shield_text, shield_type, match_info_quality, match_info_latitude, match_info_longitude, match_info_course, match_info_form_of_way, match_info_road_class, match_info_shifted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" outError:&v93];
                    id v5 = v93;
                    recordLocationStatement = self->_recordLocationStatement;
                    self->_recordLocationStatement = v31;

                    if (v5)
                    {
                      int v7 = [NSString stringWithFormat:@"%@", v5];
                      char v8 = GEOFindOrCreateLog();
                      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        v103 = "-[MNTraceRecorder _prepareStatements]";
                        __int16 v104 = 2080;
                        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                        __int16 v106 = 1024;
                        int v107 = 403;
                        __int16 v108 = 2080;
                        v109 = "NO";
                        __int16 v110 = 2112;
                        v111 = v7;
                        goto LABEL_74;
                      }
                    }
                    else
                    {
                      v33 = self->_trace;
                      id v92 = 0;
                      uint64_t v34 = [(MNTrace *)v33 prepareStatement:@"INSERT INTO locations (db_timestamp, error_data) VALUES (?, ?)" outError:&v92];
                      id v5 = v92;
                      recordLocationErrorStatement = self->_recordLocationErrorStatement;
                      self->_recordLocationErrorStatement = v34;

                      if (v5)
                      {
                        int v7 = [NSString stringWithFormat:@"%@", v5];
                        char v8 = GEOFindOrCreateLog();
                        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136316162;
                          v103 = "-[MNTraceRecorder _prepareStatements]";
                          __int16 v104 = 2080;
                          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                          __int16 v106 = 1024;
                          int v107 = 404;
                          __int16 v108 = 2080;
                          v109 = "NO";
                          __int16 v110 = 2112;
                          v111 = v7;
                          goto LABEL_74;
                        }
                      }
                      else
                      {
                        v36 = self->_trace;
                        id v91 = 0;
                        v37 = [(MNTrace *)v36 prepareStatement:@"INSERT INTO location_match_info (location_id, route_coordinate, step_index, form_of_way, route_match_score, distance_from_route, max_route_distance, route_distance_match_score, route_distance_weight, route_course_delta, max_route_course_delta, route_course_match_score, route_course_weight, road_width_on_route, distance_from_road, road_course_delta, distance_from_nearest_junction) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" outError:&v91];
                        id v5 = v91;
                        recordMatchInfoStatement = self->_recordMatchInfoStatement;
                        self->_recordMatchInfoStatement = v37;

                        if (v5)
                        {
                          int v7 = [NSString stringWithFormat:@"%@", v5];
                          char v8 = GEOFindOrCreateLog();
                          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 136316162;
                            v103 = "-[MNTraceRecorder _prepareStatements]";
                            __int16 v104 = 2080;
                            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                            __int16 v106 = 1024;
                            int v107 = 405;
                            __int16 v108 = 2080;
                            v109 = "NO";
                            __int16 v110 = 2112;
                            v111 = v7;
                            goto LABEL_74;
                          }
                        }
                        else
                        {
                          v39 = self->_trace;
                          id v90 = 0;
                          v40 = [(MNTrace *)v39 prepareStatement:@"INSERT INTO directions (id, request_timestamp, response_timestamp, request_data, response_data, response_error_data, waypoints_data, selected_route_index) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" outError:&v90];
                          id v5 = v90;
                          recordDirectionsStatement = self->_recordDirectionsStatement;
                          self->_recordDirectionsStatement = v40;

                          if (v5)
                          {
                            int v7 = [NSString stringWithFormat:@"%@", v5];
                            char v8 = GEOFindOrCreateLog();
                            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 136316162;
                              v103 = "-[MNTraceRecorder _prepareStatements]";
                              __int16 v104 = 2080;
                              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                              __int16 v106 = 1024;
                              int v107 = 406;
                              __int16 v108 = 2080;
                              v109 = "NO";
                              __int16 v110 = 2112;
                              v111 = v7;
                              goto LABEL_74;
                            }
                          }
                          else
                          {
                            v42 = self->_trace;
                            id v89 = 0;
                            v43 = [(MNTrace *)v42 prepareStatement:@"INSERT INTO eta_traffic_updates (request_timestamp, response_timestamp, request_data, response_data, response_error_data, destination_name) VALUES (?, ?, ?, ?, ?, ?)" outError:&v89];
                            id v5 = v89;
                            recordETAUStatement = self->_recordETAUStatement;
                            self->_recordETAUStatement = v43;

                            if (v5)
                            {
                              int v7 = [NSString stringWithFormat:@"%@", v5];
                              char v8 = GEOFindOrCreateLog();
                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 136316162;
                                v103 = "-[MNTraceRecorder _prepareStatements]";
                                __int16 v104 = 2080;
                                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                __int16 v106 = 1024;
                                int v107 = 407;
                                __int16 v108 = 2080;
                                v109 = "NO";
                                __int16 v110 = 2112;
                                v111 = v7;
                                goto LABEL_74;
                              }
                            }
                            else
                            {
                              v45 = self->_trace;
                              id v88 = 0;
                              v46 = [(MNTrace *)v45 prepareStatement:@"INSERT INTO realtime_transit_updates (timestamp, request_data) VALUES (?, ?)" outError:&v88];
                              id v5 = v88;
                              recordRealtimeTransitUpdateRequest = self->_recordRealtimeTransitUpdateRequest;
                              self->_recordRealtimeTransitUpdateRequest = v46;

                              if (v5)
                              {
                                int v7 = [NSString stringWithFormat:@"%@", v5];
                                char v8 = GEOFindOrCreateLog();
                                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 136316162;
                                  v103 = "-[MNTraceRecorder _prepareStatements]";
                                  __int16 v104 = 2080;
                                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                  __int16 v106 = 1024;
                                  int v107 = 408;
                                  __int16 v108 = 2080;
                                  v109 = "NO";
                                  __int16 v110 = 2112;
                                  v111 = v7;
                                  goto LABEL_74;
                                }
                              }
                              else
                              {
                                v48 = self->_trace;
                                id v87 = 0;
                                v49 = [(MNTrace *)v48 prepareStatement:@"INSERT INTO realtime_transit_updates (timestamp, response_data) VALUES (?, ?)" outError:&v87];
                                id v5 = v87;
                                recordRealtimeTransitUpdateResponse = self->_recordRealtimeTransitUpdateResponse;
                                self->_recordRealtimeTransitUpdateResponse = v49;

                                if (v5)
                                {
                                  int v7 = [NSString stringWithFormat:@"%@", v5];
                                  char v8 = GEOFindOrCreateLog();
                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = 136316162;
                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                    __int16 v104 = 2080;
                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                    __int16 v106 = 1024;
                                    int v107 = 409;
                                    __int16 v108 = 2080;
                                    v109 = "NO";
                                    __int16 v110 = 2112;
                                    v111 = v7;
                                    goto LABEL_74;
                                  }
                                }
                                else
                                {
                                  v51 = self->_trace;
                                  id v86 = 0;
                                  v52 = [(MNTrace *)v51 prepareStatement:@"INSERT INTO realtime_transit_updates (timestamp, response_error_data) VALUES (?, ?)" outError:&v86];
                                  id v5 = v86;
                                  recordRealtimeTransitUpdateResponseError = self->_recordRealtimeTransitUpdateResponseError;
                                  self->_recordRealtimeTransitUpdateResponseError = v52;

                                  if (v5)
                                  {
                                    int v7 = [NSString stringWithFormat:@"%@", v5];
                                    char v8 = GEOFindOrCreateLog();
                                    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_DWORD *)buf = 136316162;
                                      v103 = "-[MNTraceRecorder _prepareStatements]";
                                      __int16 v104 = 2080;
                                      v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                      __int16 v106 = 1024;
                                      int v107 = 410;
                                      __int16 v108 = 2080;
                                      v109 = "NO";
                                      __int16 v110 = 2112;
                                      v111 = v7;
                                      goto LABEL_74;
                                    }
                                  }
                                  else
                                  {
                                    v54 = self->_trace;
                                    id v85 = 0;
                                    v55 = [(MNTrace *)v54 prepareStatement:@"INSERT INTO vehicle_speed_data (relative_timestamp, absolute_timestamp, speed) VALUES (?, ?, ?)" outError:&v85];
                                    id v5 = v85;
                                    recordVehicleSpeed = self->_recordVehicleSpeed;
                                    self->_recordVehicleSpeed = v55;

                                    if (v5)
                                    {
                                      int v7 = [NSString stringWithFormat:@"%@", v5];
                                      char v8 = GEOFindOrCreateLog();
                                      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                      {
                                        *(_DWORD *)buf = 136316162;
                                        v103 = "-[MNTraceRecorder _prepareStatements]";
                                        __int16 v104 = 2080;
                                        v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                        __int16 v106 = 1024;
                                        int v107 = 411;
                                        __int16 v108 = 2080;
                                        v109 = "NO";
                                        __int16 v110 = 2112;
                                        v111 = v7;
                                        goto LABEL_74;
                                      }
                                    }
                                    else
                                    {
                                      v57 = self->_trace;
                                      id v84 = 0;
                                      v58 = [(MNTrace *)v57 prepareStatement:@"INSERT INTO vehicle_heading_data (relative_timestamp, absolute_timestamp, heading) VALUES(?, ?, ?)" outError:&v84];
                                      id v5 = v84;
                                      recordVehicleHeading = self->_recordVehicleHeading;
                                      self->_recordVehicleHeading = v58;

                                      if (v5)
                                      {
                                        int v7 = [NSString stringWithFormat:@"%@", v5];
                                        char v8 = GEOFindOrCreateLog();
                                        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_DWORD *)buf = 136316162;
                                          v103 = "-[MNTraceRecorder _prepareStatements]";
                                          __int16 v104 = 2080;
                                          v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                          __int16 v106 = 1024;
                                          int v107 = 412;
                                          __int16 v108 = 2080;
                                          v109 = "NO";
                                          __int16 v110 = 2112;
                                          v111 = v7;
                                          goto LABEL_74;
                                        }
                                      }
                                      else
                                      {
                                        v60 = self->_trace;
                                        id v83 = 0;
                                        v61 = [(MNTrace *)v60 prepareStatement:@"INSERT INTO motion_data (relative_timestamp, absolute_timestamp, type, exit_type, confidence) VALUES(?, ?, ?, ?, ?)" outError:&v83];
                                        id v5 = v83;
                                        recordMotionData = self->_recordMotionData;
                                        self->_recordMotionData = v61;

                                        if (v5)
                                        {
                                          int v7 = [NSString stringWithFormat:@"%@", v5];
                                          char v8 = GEOFindOrCreateLog();
                                          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                          {
                                            *(_DWORD *)buf = 136316162;
                                            v103 = "-[MNTraceRecorder _prepareStatements]";
                                            __int16 v104 = 2080;
                                            v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                            __int16 v106 = 1024;
                                            int v107 = 413;
                                            __int16 v108 = 2080;
                                            v109 = "NO";
                                            __int16 v110 = 2112;
                                            v111 = v7;
                                            goto LABEL_74;
                                          }
                                        }
                                        else
                                        {
                                          v63 = self->_trace;
                                          id v82 = 0;
                                          v64 = [(MNTrace *)v63 prepareStatement:@"INSERT INTO compass_heading_data (relative_timestamp, absolute_timestamp, true_heading, magnetic_heading, accuracy) VALUES(?, ?, ?, ?, ?)" outError:&v82];
                                          id v5 = v82;
                                          recordCompassHeading = self->_recordCompassHeading;
                                          self->_recordCompassHeading = v64;

                                          if (v5)
                                          {
                                            int v7 = [NSString stringWithFormat:@"%@", v5];
                                            char v8 = GEOFindOrCreateLog();
                                            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                            {
                                              *(_DWORD *)buf = 136316162;
                                              v103 = "-[MNTraceRecorder _prepareStatements]";
                                              __int16 v104 = 2080;
                                              v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                              __int16 v106 = 1024;
                                              int v107 = 414;
                                              __int16 v108 = 2080;
                                              v109 = "NO";
                                              __int16 v110 = 2112;
                                              v111 = v7;
                                              goto LABEL_74;
                                            }
                                          }
                                          else
                                          {
                                            v66 = self->_trace;
                                            id v81 = 0;
                                            v67 = [(MNTrace *)v66 prepareStatement:@"INSERT INTO ev_data (relative_timestamp, absolute_timestamp, identifier, current_range_m, max_range_m, battery_percentage, min_battery_capacity_kwh, current_battery_capacity_kwh, max_battery_capacity_kwh, consumption_arguments, charging_arguments, is_charging, active_connector, vehicle_state_origin, vehicle_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" outError:&v81];
                                            id v5 = v81;
                                            recordVirtualGarageVehicleState = self->_recordVirtualGarageVehicleState;
                                            self->_recordVirtualGarageVehicleState = v67;

                                            if (v5)
                                            {
                                              int v7 = [NSString stringWithFormat:@"%@", v5];
                                              char v8 = GEOFindOrCreateLog();
                                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                              {
                                                *(_DWORD *)buf = 136316162;
                                                v103 = "-[MNTraceRecorder _prepareStatements]";
                                                __int16 v104 = 2080;
                                                v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                __int16 v106 = 1024;
                                                int v107 = 415;
                                                __int16 v108 = 2080;
                                                v109 = "NO";
                                                __int16 v110 = 2112;
                                                v111 = v7;
                                                goto LABEL_74;
                                              }
                                            }
                                            else
                                            {
                                              v69 = self->_trace;
                                              id v80 = 0;
                                              v70 = [(MNTrace *)v69 prepareStatement:@"INSERT INTO navigation_events (relative_timestamp, absolute_timestamp, last_location_id, event_id, event_description) VALUES (?, ?, ?, ?, ?)" outError:&v80];
                                              id v5 = v80;
                                              recordNavigationEvent = self->_recordNavigationEvent;
                                              self->_recordNavigationEvent = v70;

                                              if (v5)
                                              {
                                                int v7 = [NSString stringWithFormat:@"%@", v5];
                                                char v8 = GEOFindOrCreateLog();
                                                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                {
                                                  *(_DWORD *)buf = 136316162;
                                                  v103 = "-[MNTraceRecorder _prepareStatements]";
                                                  __int16 v104 = 2080;
                                                  v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                  __int16 v106 = 1024;
                                                  int v107 = 416;
                                                  __int16 v108 = 2080;
                                                  v109 = "NO";
                                                  __int16 v110 = 2112;
                                                  v111 = v7;
                                                  goto LABEL_74;
                                                }
                                              }
                                              else
                                              {
                                                v72 = self->_trace;
                                                id v79 = 0;
                                                v73 = [(MNTrace *)v72 prepareStatement:@"INSERT INTO navigation_updates (timestamp, type, parameters) VALUES (?, ?, ?)" outError:&v79];
                                                id v5 = v79;
                                                recordNavigationUpdate = self->_recordNavigationUpdate;
                                                self->_recordNavigationUpdate = v73;

                                                if (v5)
                                                {
                                                  int v7 = [NSString stringWithFormat:@"%@", v5];
                                                  char v8 = GEOFindOrCreateLog();
                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                  {
                                                    *(_DWORD *)buf = 136316162;
                                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                                    __int16 v104 = 2080;
                                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                    __int16 v106 = 1024;
                                                    int v107 = 417;
                                                    __int16 v108 = 2080;
                                                    v109 = "NO";
                                                    __int16 v110 = 2112;
                                                    v111 = v7;
                                                    goto LABEL_74;
                                                  }
                                                }
                                                else
                                                {
                                                  v75 = self->_trace;
                                                  id v78 = 0;
                                                  [(MNTrace *)v75 prepareStatement:@"UPDATE navigation_events SET last_location_id = ? WHERE rowid = ?" outError:&v78];
                                                  v76 = (MNTracePreparedStatement *)objc_claimAutoreleasedReturnValue();
                                                  id v5 = v78;
                                                  updateNavigationEventLocationID = self->_updateNavigationEventLocationID;
                                                  self->_updateNavigationEventLocationID = v76;

                                                  if (!v5)
                                                  {
LABEL_76:

                                                    return;
                                                  }
                                                  int v7 = [NSString stringWithFormat:@"%@", v5];
                                                  char v8 = GEOFindOrCreateLog();
                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                  {
                                                    *(_DWORD *)buf = 136316162;
                                                    v103 = "-[MNTraceRecorder _prepareStatements]";
                                                    __int16 v104 = 2080;
                                                    v105 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
                                                    __int16 v106 = 1024;
                                                    int v107 = 418;
                                                    __int16 v108 = 2080;
                                                    v109 = "NO";
                                                    __int16 v110 = 2112;
                                                    v111 = v7;
                                                    goto LABEL_74;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_76;
  }
}

- (void)_closeTraceDB
{
  uint64_t v3 = [(MNTraceRecorder *)self trace];
  uint64_t v4 = [v3 db];

  if (v4)
  {
    id v6 = [(MNTraceRecorder *)self trace];
    [v6 closeTrace];
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "We are trying to close a trace when there is no trace db.", buf, 2u);
    }
  }
}

- (double)timeSinceRecordingBegan
{
  recordingStartDate = self->_recordingStartDate;
  if (!recordingStartDate) {
    return 0.0;
  }
  [(NSDate *)recordingStartDate timeIntervalSinceNow];
  return -v3;
}

- (void)setRecordingStartDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    int v7 = "Setting recording start time to %@";
    char v8 = v6;
    uint32_t v9 = 12;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] now];
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v7 = "Setting recording start time to current time";
    char v8 = v6;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_7:

  objc_storeStrong((id *)&self->_recordingStartDate, v5);
  if (self->_trace)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MNTraceRecorder_setRecordingStartDate___block_invoke;
    v10[3] = &unk_1E60F6668;
    v10[4] = self;
    id v11 = v5;
    [(MNTraceRecorder *)self _dispatchWrite:v10];
  }
}

uint64_t __41__MNTraceRecorder_setRecordingStartDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "bindParameter:double:", @":recording_start_time");
  double v3 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v3 execute];
}

- (void)recordEnvironmentInfo:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__MNTraceRecorder_recordEnvironmentInfo_value___block_invoke;
    v9[3] = &unk_1E60F7048;
    v9[4] = self;
    id v10 = v6;
    id v11 = v8;
    [(MNTraceRecorder *)self _dispatchWrite:v9];
  }
}

void __47__MNTraceRecorder_recordEnvironmentInfo_value___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 88) bind:1 string:a1[5]];
  [*(id *)(a1[4] + 88) bind:2 string:a1[6]];
  if (([*(id *)(a1[4] + 88) execute] & 1) == 0)
  {
    id v2 = [NSString stringWithFormat:@"Error recording environment info"];
    double v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "result";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)recordDebugSetting:(id)a3 settingValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MNTraceRecorder_recordDebugSetting_settingValue___block_invoke;
    v9[3] = &unk_1E60F7048;
    v9[4] = self;
    id v10 = v6;
    id v11 = v8;
    [(MNTraceRecorder *)self _dispatchWrite:v9];
  }
}

void __51__MNTraceRecorder_recordDebugSetting_settingValue___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 96) bind:1 string:a1[5]];
  [*(id *)(a1[4] + 96) bind:2 string:a1[6]];
  if (([*(id *)(a1[4] + 96) execute] & 1) == 0)
  {
    id v2 = [NSString stringWithFormat:@"Error recording debug setting"];
    double v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "result";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)recordAudioSetting:(BOOL)a3 voiceGuidance:(int64_t)a4
{
  if (self->_lastPauseSpokenAudio != a3 || self->_lastVoiceGuidanceSetting != a4)
  {
    self->_lastPauseSpokenAudio = a3;
    self->_lastVoiceGuidanceSetting = a4;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__MNTraceRecorder_recordAudioSetting_voiceGuidance___block_invoke;
    v4[3] = &unk_1E60F7070;
    BOOL v5 = a3;
    v4[4] = self;
    v4[5] = a4;
    [(MNTraceRecorder *)self _dispatchWrite:v4];
  }
}

void __52__MNTraceRecorder_recordAudioSetting_voiceGuidance___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[13];
  [v2 timeSinceRecordingBegan];
  objc_msgSend(v3, "bind:double:", 1);
  [*(id *)(*(void *)(a1 + 32) + 104) bind:2 int:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 104) bind:3 int:*(unsigned int *)(a1 + 40)];
  if (([*(id *)(*(void *)(a1 + 32) + 104) execute] & 1) == 0)
  {
    int v4 = [NSString stringWithFormat:@"Error recording audio setting"];
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "result";
      __int16 v8 = 2112;
      uint32_t v9 = v4;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)recordStylesheet:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__MNTraceRecorder_recordStylesheet_data___block_invoke;
    v8[3] = &unk_1E60F7048;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(MNTraceRecorder *)self _dispatchWrite:v8];
  }
}

void __41__MNTraceRecorder_recordStylesheet_data___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1[4] + 112) bind:1 string:a1[5]];
  [*(id *)(a1[4] + 112) bind:2 data:a1[6]];
  if (([*(id *)(a1[4] + 112) execute] & 1) == 0)
  {
    id v2 = [NSString stringWithFormat:@"Error recording debug setting"];
    double v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      BOOL v5 = "result";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)recordMiscInfo:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__MNTraceRecorder_recordMiscInfo_value___block_invoke;
    v9[3] = &unk_1E60F7098;
    id v10 = v7;
    id v11 = v6;
    int v12 = self;
    [(MNTraceRecorder *)self _executeStatementForQuery:@"INSERT INTO misc_info (key, value) VALUES (?, ?)" handler:v9];
  }
}

void __40__MNTraceRecorder_recordMiscInfo_value___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = *(id *)(a1 + 32);
    uint64_t v4 = sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = *(void **)(a1 + 48);
      uint64_t v7 = 530;
LABEL_17:
      [v6 _logSqliteErrorWithResult:v5 file:"/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m" line:v7];
      goto LABEL_18;
    }
    id v12 = v17;
    uint64_t v13 = sqlite3_bind_text(a2, 2, (const char *)[v12 UTF8String], objc_msgSend(v12, "length"), 0);
    if (v13)
    {
      uint64_t v5 = v13;
      id v6 = *(void **)(a1 + 48);
      uint64_t v7 = 531;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = *(id *)(a1 + 32);
    uint64_t v8 = sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    if (v8)
    {
      uint64_t v5 = v8;
      id v6 = *(void **)(a1 + 48);
      uint64_t v7 = 534;
      goto LABEL_17;
    }
    if (CFNumberIsFloatType((CFNumberRef)v17))
    {
      [v17 doubleValue];
      uint64_t v15 = sqlite3_bind_double(a2, 2, v14);
      if (v15)
      {
        uint64_t v5 = v15;
        id v6 = *(void **)(a1 + 48);
        uint64_t v7 = 536;
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v16 = sqlite3_bind_int(a2, 2, [v17 intValue]);
      if (v16)
      {
        uint64_t v5 = v16;
        id v6 = *(void **)(a1 + 48);
        uint64_t v7 = 538;
        goto LABEL_17;
      }
    }
LABEL_18:

    return;
  }
  id v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error recording \"%@\" to misc_info: Invalid type: %@", buf, 0x16u);
  }
}

- (void)recordNavigationEvent:(int64_t)a3 forLocation:(id)a4 description:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self->_closed)
  {
    id v17 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    __int16 v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "!_closed";
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  uint64_t v11 = v10;
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__MNTraceRecorder_recordNavigationEvent_forLocation_description___block_invoke;
  v19[3] = &unk_1E60F70C0;
  uint64_t v22 = v11;
  uint64_t v23 = v14;
  v19[4] = self;
  id v20 = v8;
  int64_t v24 = a3;
  id v21 = v9;
  id v15 = v9;
  id v16 = v8;
  [(MNTraceRecorder *)self _dispatchWrite:v19];
}

void __65__MNTraceRecorder_recordNavigationEvent_forLocation_description___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 224) bind:1 double:*(double *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 224) bind:2 double:*(double *)(a1 + 64)];
    double v3 = *(void **)(a1 + 40);
    if (v3 && [v3 traceIndex] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "bind:int:", 3, objc_msgSend(*(id *)(a1 + 40), "traceIndex"));
    }
    else {
      [*(id *)(*(void *)(a1 + 32) + 224) bindNull:3];
    }
    [*(id *)(*(void *)(a1 + 32) + 224) bind:4 int:*(unsigned int *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 32) + 224) bind:5 string:*(void *)(a1 + 48)];
    if (([*(id *)(*(void *)(a1 + 32) + 224) execute] & 1) == 0)
    {
      uint64_t v11 = [NSString stringWithFormat:@"Error recording navigation event"];
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        uint64_t v14 = "result";
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v4 = *(void **)(a1 + 40);
    if (v4 && [v4 traceIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 272);
      if (!v5)
      {
        uint64_t v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(v7 + 272);
        *(void *)(v7 + 272) = v6;

        uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 272);
      }
      id v9 = [v5 objectForKey:*(void *)(a1 + 40)];
      if (!v9)
      {
        id v9 = [MEMORY[0x1E4F1CA48] array];
        [*(id *)(*(void *)(a1 + 32) + 272) setObject:v9 forKey:*(void *)(a1 + 40)];
      }
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "db")));
      [v9 addObject:v10];
    }
  }
}

- (void)_recordLocationMatchInfoOnWriteQueue:(id)a3 forLocationID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "_navigation_detailedMatchInfo");

  if (!v7)
  {
    __int16 v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136315906;
      v31 = "-[MNTraceRecorder _recordLocationMatchInfoOnWriteQueue:forLocationID:]";
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      __int16 v34 = 1024;
      int v35 = 591;
      __int16 v36 = 2080;
      v37 = "correctedLocation.detailedMatchInfo != nil";
      _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v30, 0x26u);
    }
  }
  id v8 = objc_msgSend(v6, "_navigation_detailedMatchInfo");

  if (v8)
  {
    id v9 = objc_msgSend(v6, "_navigation_routeMatch");
    uint64_t v10 = objc_msgSend(v6, "_navigation_detailedMatchInfo");
    [(MNTracePreparedStatement *)self->_recordMatchInfoStatement bind:1 int:v4];
    -[MNTracePreparedStatement bind:double:](self->_recordMatchInfoStatement, "bind:double:", 2, (double)[v9 routeCoordinate]+ COERCE_FLOAT((unint64_t)objc_msgSend(v9, "routeCoordinate") >> 32));
    -[MNTracePreparedStatement bind:int:](self->_recordMatchInfoStatement, "bind:int:", 3, [v9 stepIndex]);
    uint64_t v11 = [v9 road];
    if (v11)
    {
      id v12 = [v9 road];
      uint64_t v13 = [v12 formOfWay];
    }
    else
    {
      uint64_t v13 = 0;
    }

    [(MNTracePreparedStatement *)self->_recordMatchInfoStatement bind:4 int:v13];
    recordMatchInfoStatement = self->_recordMatchInfoStatement;
    [v10 routeMatchScore];
    -[MNTracePreparedStatement bind:double:](recordMatchInfoStatement, "bind:double:", 5);
    __int16 v15 = self->_recordMatchInfoStatement;
    [v10 distanceFromRoute];
    -[MNTracePreparedStatement bind:double:](v15, "bind:double:", 6);
    id v16 = self->_recordMatchInfoStatement;
    [v10 maxDistance];
    -[MNTracePreparedStatement bind:double:](v16, "bind:double:", 7);
    uint64_t v17 = self->_recordMatchInfoStatement;
    [v10 distanceMatchScore];
    -[MNTracePreparedStatement bind:double:](v17, "bind:double:", 8);
    __int16 v18 = self->_recordMatchInfoStatement;
    [v10 distanceWeight];
    -[MNTracePreparedStatement bind:double:](v18, "bind:double:", 9);
    uint64_t v19 = self->_recordMatchInfoStatement;
    [v10 courseDelta];
    -[MNTracePreparedStatement bind:double:](v19, "bind:double:", 10);
    id v20 = self->_recordMatchInfoStatement;
    [v10 maxCourseDelta];
    -[MNTracePreparedStatement bind:double:](v20, "bind:double:", 11);
    id v21 = self->_recordMatchInfoStatement;
    [v10 courseMatchScore];
    -[MNTracePreparedStatement bind:double:](v21, "bind:double:", 12);
    uint64_t v22 = self->_recordMatchInfoStatement;
    [v10 courseWeight];
    -[MNTracePreparedStatement bind:double:](v22, "bind:double:", 13);
    uint64_t v23 = self->_recordMatchInfoStatement;
    [v10 roadWidthOnRoute];
    -[MNTracePreparedStatement bind:double:](v23, "bind:double:", 14);
    int64_t v24 = self->_recordMatchInfoStatement;
    [v10 distanceFromRoad];
    -[MNTracePreparedStatement bind:double:](v24, "bind:double:", 15);
    v25 = self->_recordMatchInfoStatement;
    [v10 roadCourseDelta];
    -[MNTracePreparedStatement bind:double:](v25, "bind:double:", 16);
    uint64_t v26 = self->_recordMatchInfoStatement;
    [v10 distanceFromNearestJunction];
    -[MNTracePreparedStatement bind:double:](v26, "bind:double:", 17);
    if (![(MNTracePreparedStatement *)self->_recordMatchInfoStatement execute])
    {
      v28 = [NSString stringWithFormat:@"Error recording location"];
      uint64_t v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136315394;
        v31 = "result";
        __int16 v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v30, 0x16u);
      }
    }
  }
}

- (void)recordLocation:(id)a3 rawLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  -[MNTraceRecorder recordLocation:rawLocation:timestamp:](self, "recordLocation:rawLocation:timestamp:", v7, v6);
}

- (void)recordLocation:(id)a3 rawLocation:(id)a4 timestamp:(double)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_closed)
  {
    id v12 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "!_closed";
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__MNTraceRecorder_recordLocation_rawLocation_timestamp___block_invoke;
  v14[3] = &unk_1E60F70E8;
  double v17 = a5;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MNTraceRecorder *)self _dispatchWrite:v14];
}

void __56__MNTraceRecorder_recordLocation_rawLocation_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 120) bind:1 double:*(double *)(a1 + 56)];
    double v3 = *(void **)(*(void *)(a1 + 32) + 120);
    uint64_t v4 = [*(id *)(a1 + 40) timestamp];
    [v4 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "bind:double:", 2);

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) coordinate];
    objc_msgSend(v5, "bind:double:", 3);
    id v6 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) coordinate];
    [v6 bind:4 double:v7];
    id v8 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) rawCoordinate];
    objc_msgSend(v8, "bind:double:", 5);
    id v9 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) rawCoordinate];
    [v9 bind:6 double:v10];
    id v11 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) horizontalAccuracy];
    objc_msgSend(v11, "bind:double:", 7);
    id v12 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) verticalAccuracy];
    objc_msgSend(v12, "bind:double:", 8);
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) altitude];
    objc_msgSend(v13, "bind:double:", 9);
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) speed];
    objc_msgSend(v14, "bind:double:", 10);
    id v15 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) speedAccuracy];
    objc_msgSend(v15, "bind:double:", 11);
    id v16 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) course];
    objc_msgSend(v16, "bind:double:", 12);
    double v17 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) rawCourse];
    objc_msgSend(v17, "bind:double:", 13);
    __int16 v18 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) courseAccuracy];
    objc_msgSend(v18, "bind:double:", 14);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 15, objc_msgSend(*(id *)(a1 + 48), "type"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 16, objc_msgSend(*(id *)(a1 + 48), "referenceFrame"));
    uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 120);
    __int16 v20 = *(void **)(a1 + 48);
    if (v20)
    {
      [v20 clientLocation];
      uint64_t v21 = DWORD2(v45);
    }
    else
    {
      uint64_t v21 = 0;
      *(long long *)((char *)&v46 - 4) = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v37 = 0u;
    }
    objc_msgSend(v19, "bind:int:", 17, v21, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46);
    [*(id *)(*(void *)(a1 + 32) + 120) bind:18 int:0];
    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 40) coordinate];
    objc_msgSend(v22, "bind:double:", 19);
    uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 40) coordinate];
    [v23 bind:20 double:v24];
    v25 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 40) course];
    objc_msgSend(v25, "bind:double:", 21);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:double:", 22, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "state"));
    [*(id *)(*(void *)(a1 + 32) + 120) bind:23 int:4];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 24, objc_msgSend(*(id *)(a1 + 40), "speedLimit"));
    uint64_t v26 = *(void **)(*(void *)(a1 + 32) + 120);
    __int16 v27 = [*(id *)(a1 + 40) shieldText];
    [v26 bind:25 string:v27];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 26, objc_msgSend(*(id *)(a1 + 40), "shieldType"));
    v28 = [*(id *)(a1 + 48) matchInfo];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 27, objc_msgSend(v28, "matchQuality"));
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 120);
    [v28 matchCoordinate];
    objc_msgSend(v29, "bind:double:", 28);
    int v30 = *(void **)(*(void *)(a1 + 32) + 120);
    [v28 matchCoordinate];
    [v30 bind:29 double:v31];
    __int16 v32 = *(void **)(*(void *)(a1 + 32) + 120);
    [v28 matchCourse];
    objc_msgSend(v32, "bind:double:", 30);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 31, objc_msgSend(v28, "matchFormOfWay"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 32, objc_msgSend(v28, "matchRoadClass"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 33, objc_msgSend(v28, "isMatchShifted"));
    if (([*(id *)(*(void *)(a1 + 32) + 120) execute] & 1) == 0)
    {
      int v35 = [NSString stringWithFormat:@"Error recording location"];
      __int16 v36 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "result";
        __int16 v49 = 2112;
        v50 = v35;
        _os_log_impl(&dword_1B542B000, v36, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }
    }
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) db]);
    [*(id *)(a1 + 40) setTraceIndex:insert_rowid];
    __int16 v34 = [*(id *)(a1 + 40) detailedMatchInfo];

    if (v34) {
      [*(id *)(a1 + 32) _recordLocationMatchInfoOnWriteQueue:*(void *)(a1 + 40) forLocationID:insert_rowid];
    }
    [*(id *)(a1 + 32) _updateNavigationEventsWithLocationReference:*(void *)(a1 + 40)];
  }
}

- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 coordinate:(CLLocationCoordinate2D)a5 rawCoordinate:(CLLocationCoordinate2D)a6 timestamp:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 altitude:(double)a10 speed:(double)a11 speedAccuracy:(double)a12 course:(double)a13 rawCourse:(double)a14 type:(int)a15 courseAccuracy:(double)a16 correctedCoordinate:(CLLocationCoordinate2D)a17 correctedCourse:(double)a18 matchType:(int)a19 activeTransportType:(int)a20 matchInfo:(id)a21 correctedLocation:(id)a22 speedLimit:(int)a23 shieldText:(id)a24 shieldType:(int)a25
{
  v25 = *(void **)&a20;
  int longitude_low = LODWORD(a17.longitude);
  int latitude_low = LODWORD(a17.latitude);
  CLLocationDegrees longitude = a6.longitude;
  CLLocationDegrees latitude = a6.latitude;
  double v31 = a16;
  int v32 = a23;
  double v33 = a11;
  double v34 = a10;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v35 = *(id *)&a19;
  id v36 = v25;
  id v37 = a24;
  double v38 = a12;
  double v39 = a13;
  double v40 = a14;
  double v41 = a4;
  CLLocationDegrees v42 = a5.longitude;
  CLLocationDegrees v43 = a5.latitude;
  id v44 = a22;
  double v45 = a7;
  double v46 = a8;
  id v47 = a21;
  double v48 = a9;
  int v49 = latitude_low;
  int v50 = longitude_low;
  id v51 = v37;
  if (self->_closed)
  {
    int v55 = v49;
    int v56 = v50;
    v58 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    v57 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v94 = "!_closed";
      __int16 v95 = 2112;
      id v96 = v58;
      _os_log_impl(&dword_1B542B000, v57, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }

    int v50 = v56;
    int v49 = v55;
    double v48 = a9;
    id v47 = a21;
    double v46 = a8;
    int v32 = a23;
    double v31 = a16;
    id v44 = a22;
    double v45 = a7;
    CLLocationDegrees v43 = a5.latitude;
    CLLocationDegrees v42 = a5.longitude;
    double v41 = a4;
    double v39 = a13;
    double v40 = a14;
    double v33 = a11;
    double v38 = a12;
    double v34 = a10;
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __323__MNTraceRecorder__recordLocationEvent_recordingTimestamp_coordinate_rawCoordinate_timestamp_horizontalAccuracy_verticalAccuracy_altitude_speed_speedAccuracy_course_rawCourse_type_courseAccuracy_correctedCoordinate_correctedCourse_matchType_activeTransportType_matchInfo_correctedLocation_speedLimit_shieldText_shieldType___block_invoke;
  v66[3] = &unk_1E60F7110;
  double v70 = v41;
  double v71 = v45;
  CLLocationDegrees v72 = v43;
  CLLocationDegrees v73 = v42;
  CLLocationDegrees v74 = latitude;
  CLLocationDegrees v75 = longitude;
  double v76 = v46;
  double v77 = v48;
  double v78 = v34;
  double v79 = v33;
  double v80 = v38;
  double v81 = v39;
  double v82 = v40;
  double v83 = v31;
  int64_t v84 = a3;
  double v85 = a18;
  id v86 = v47;
  id v87 = v44;
  int v88 = a15;
  int v89 = v49;
  int v90 = v50;
  int v91 = v32;
  v66[4] = self;
  id v67 = v51;
  int v92 = a25;
  id v68 = v35;
  id v69 = v36;
  id v52 = v36;
  id v53 = v35;
  id v54 = v51;
  [(MNTraceRecorder *)self _dispatchWrite:v66];
}

void __323__MNTraceRecorder__recordLocationEvent_recordingTimestamp_coordinate_rawCoordinate_timestamp_horizontalAccuracy_verticalAccuracy_altitude_speed_speedAccuracy_course_rawCourse_type_courseAccuracy_correctedCoordinate_correctedCourse_matchType_activeTransportType_matchInfo_correctedLocation_speedLimit_shieldText_shieldType___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 120) bind:1 double:*(double *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:2 double:*(double *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:3 double:*(double *)(a1 + 80)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:4 double:*(double *)(a1 + 88)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:5 double:*(double *)(a1 + 96)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:6 double:*(double *)(a1 + 104)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:7 double:*(double *)(a1 + 112)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:8 double:*(double *)(a1 + 120)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:9 double:*(double *)(a1 + 128)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:10 double:*(double *)(a1 + 136)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:11 double:*(double *)(a1 + 144)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:12 double:*(double *)(a1 + 152)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:13 double:*(double *)(a1 + 160)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:14 double:*(double *)(a1 + 168)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:15 int:*(unsigned int *)(a1 + 208)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:16 int:0];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:17 int:0];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:18 int:*(unsigned int *)(a1 + 176)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:19 double:*(double *)(a1 + 184)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:20 double:*(double *)(a1 + 192)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:21 double:*(double *)(a1 + 200)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:22 double:(double)*(int *)(a1 + 212)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:23 int:*(unsigned int *)(a1 + 216)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:24 int:*(unsigned int *)(a1 + 220)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:25 string:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 120) bind:26 int:*(unsigned int *)(a1 + 224)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 27, objc_msgSend(*(id *)(a1 + 48), "matchQuality"));
    double v3 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) matchCoordinate];
    objc_msgSend(v3, "bind:double:", 28);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) matchCoordinate];
    [v4 bind:29 double:v5];
    id v6 = *(void **)(*(void *)(a1 + 32) + 120);
    [*(id *)(a1 + 48) matchCourse];
    objc_msgSend(v6, "bind:double:", 30);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 31, objc_msgSend(*(id *)(a1 + 48), "matchFormOfWay"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 32, objc_msgSend(*(id *)(a1 + 48), "matchRoadClass"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "bind:int:", 33, objc_msgSend(*(id *)(a1 + 48), "isMatchShifted"));
    if (([*(id *)(*(void *)(a1 + 32) + 120) execute] & 1) == 0)
    {
      id v8 = [NSString stringWithFormat:@"Error recording location"];
      id v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        id v11 = "result";
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v10, 0x16u);
      }
    }
    double v7 = objc_msgSend(*(id *)(a1 + 56), "_navigation_detailedMatchInfo");

    if (v7) {
      objc_msgSend(*(id *)(a1 + 32), "_recordLocationMatchInfoOnWriteQueue:forLocationID:", *(void *)(a1 + 56), sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "db")));
    }
  }
}

- (void)_recordLocationEvent:(int64_t)a3 recordingTimestamp:(double)a4 location:(id)a5 correctedLocation:(id)a6
{
  id v55 = a5;
  id v9 = a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v55)
  {
    [v55 coordinate];
    double longitude = v12;
    double latitude = v11;
    [v55 rawCoordinate];
  }
  else
  {
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(0.0, 0.0);
    double longitude = v15.longitude;
    double latitude = v15.latitude;
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(0.0, 0.0);
    CLLocationDegrees v14 = v16.longitude;
    CLLocationDegrees v13 = v16.latitude;
  }
  double v50 = v14;
  double v51 = v13;
  double v17 = [v55 timestamp];
  [v17 timeIntervalSinceReferenceDate];
  double v49 = v18;
  if (v55)
  {
    [v55 horizontalAccuracy];
    double v48 = v19;
    [v55 verticalAccuracy];
    double v47 = v20;
    [v55 altitude];
    uint64_t v46 = v21;
    [v55 speed];
    uint64_t v23 = v22;
    objc_msgSend(v55, "_navigation_speedAccuracy");
    uint64_t v25 = v24;
    [v55 course];
    uint64_t v27 = v26;
    [v55 rawCourse];
    uint64_t v29 = v28;
    uint64_t v30 = [v55 type];
    [v55 courseAccuracy];
    uint64_t v32 = v31;
    if (v9) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v38 = 0;
    CLLocationCoordinate2D v43 = CLLocationCoordinate2DMake(0.0, 0.0);
    CLLocationDegrees v34 = v43.latitude;
    CLLocationDegrees v36 = v43.longitude;
    if (isKindOfClass) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v30 = [0 type];
  uint64_t v29 = 0;
  uint64_t v25 = 0;
  uint64_t v46 = 0;
  double v47 = 0.0;
  double v48 = 0.0;
  uint64_t v23 = 0;
  uint64_t v27 = 0;
  uint64_t v32 = 0;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_6:
  [v9 coordinate];
  CLLocationDegrees v34 = v33;
  CLLocationDegrees v36 = v35;
  [v9 course];
  uint64_t v38 = v37;
  if (isKindOfClass)
  {
LABEL_7:
    uint64_t v39 = [v9 state];
    double v40 = [v55 matchInfo];
    int v41 = [v9 speedLimit];
    CLLocationDegrees v42 = [v9 shieldText];
    LODWORD(v45) = [v9 shieldType];
    LODWORD(v44) = v41;
    -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", a3, v30, v39, 4, v40, v9, a4, latitude, longitude, v51, v50, v49, v48, v47, v46,
      v23,
      v25,
      v27,
      v29,
      v32,
      *(void *)&v34,
      *(void *)&v36,
      v38,
      v44,
      v42,
      v45);

    goto LABEL_11;
  }
LABEL_10:
  double v40 = [v55 matchInfo];
  LODWORD(v45) = -1;
  LODWORD(v44) = -1;
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", a3, v30, 0xFFFFFFFFLL, 4, v40, v9, a4, latitude, longitude, v51, v50, v49, v48, v47, v46,
    v23,
    v25,
    v27,
    v29,
    v32,
    *(void *)&v34,
    *(void *)&v36,
    v38,
    v44,
    0,
    v45);
LABEL_11:
}

- (void)recordLocation:(id)a3 timestamp:(double)a4
{
}

- (void)recordSimulatedCoordinate:(CLLocationCoordinate2D)a3 course:(double)a4 altitude:(double)a5 speed:(double)a6 timestamp:(double)a7 activeTransportType:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  LODWORD(v16) = -1;
  LODWORD(v15) = -1;
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:](self, "_recordLocationEvent:recordingTimestamp:coordinate:rawCoordinate:timestamp:horizontalAccuracy:verticalAccuracy:altitude:speed:speedAccuracy:course:rawCourse:type:courseAccuracy:correctedCoordinate:correctedCourse:matchType:activeTransportType:matchInfo:correctedLocation:speedLimit:shieldText:shieldType:", 0, 1, 0xFFFFFFFFLL, v8, 0, 0, *(void *)&a5, *(void *)&a6, 0, *(void *)&a4, *(void *)&a4, 0x4024000000000000, *(void *)&latitude, *(void *)&longitude, *(void *)&a4,
    v15,
    0,
    v16);
}

- (void)recordLocation:(id)a3 correctedLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 0, v7, v6);
}

- (void)recordLocationUpdatePause
{
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 1, 0, 0);
}

- (void)recordLocationUpdateResume
{
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  -[MNTraceRecorder _recordLocationEvent:recordingTimestamp:location:correctedLocation:](self, "_recordLocationEvent:recordingTimestamp:location:correctedLocation:", 2, 0, 0);
}

- (void)recordError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_closed)
  {
    id v7 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CLLocationDegrees v13 = "!_closed";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__MNTraceRecorder_recordError___block_invoke;
  v9[3] = &unk_1E60F7138;
  uint64_t v11 = v5;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  [(MNTraceRecorder *)self _dispatchWrite:v9];
}

void __31__MNTraceRecorder_recordError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 128) bind:1 double:*(double *)(a1 + 48)];
    double v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 40) requiringSecureCoding:0 error:0];
    [*(id *)(*(void *)(a1 + 32) + 128) bind:2 data:v3];
    if (([*(id *)(*(void *)(a1 + 32) + 128) execute] & 1) == 0)
    {
      id v4 = [NSString stringWithFormat:@"Error recording location error."];
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "result";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)setIsSimulation:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "!_closed";
      __int16 v11 = 2112;
      double v12 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MNTraceRecorder_setIsSimulation___block_invoke;
  v7[3] = &unk_1E60F6D08;
  v7[4] = self;
  BOOL v8 = a3;
  [(MNTraceRecorder *)self _dispatchWrite:v7];
}

void __35__MNTraceRecorder_setIsSimulation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t v6 = 0;
    id v4 = +[MNTracePreparedStatement preparedStatementForTrace:v3 statement:@"UPDATE info SET simulation = ?" outError:&v6];
    uint64_t v5 = v4;
    if (!v6)
    {
      [v4 bind:1 int:*(unsigned __int8 *)(a1 + 40)];
      [v5 execute];
      [v5 finalize];
    }
  }
}

- (void)setRouteGenius:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "!_closed";
      __int16 v11 = 2112;
      double v12 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__MNTraceRecorder_setRouteGenius___block_invoke;
  v7[3] = &unk_1E60F6D08;
  v7[4] = self;
  BOOL v8 = a3;
  [(MNTraceRecorder *)self _dispatchWrite:v7];
}

void __34__MNTraceRecorder_setRouteGenius___block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[48])
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v6 = [v2 trace];
    id v4 = (sqlite3 *)[v6 db];
    if (v3) {
      uint64_t v5 = "UPDATE info SET route_genius = 1;";
    }
    else {
      uint64_t v5 = "UPDATE info SET route_genius = 0;";
    }
    sqlite3_exec(v4, v5, 0, 0, 0);
  }
}

- (void)resetLocationsForSimulation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    int v3 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "!_closed";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MNTraceRecorder_resetLocationsForSimulation__block_invoke;
  v5[3] = &unk_1E60F6B98;
  v5[4] = self;
  [(MNTraceRecorder *)self _dispatchWrite:v5];
}

void __46__MNTraceRecorder_resetLocationsForSimulation__block_invoke(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[48])
  {
    int v3 = [v2 trace];
    sqlite3_exec((sqlite3 *)[v3 db], "DELETE FROM locations;", 0, 0, 0);

    id v4 = [*(id *)(a1 + 32) trace];
    sqlite3_exec((sqlite3 *)[v4 db], "UPDATE info SET simulation = 1;", 0, 0, 0);

    id v5 = [*(id *)(a1 + 32) trace];
    sqlite3_exec((sqlite3 *)[v5 db], "UPDATE info SET cl_mapmatch = 0;", 0, 0, 0);
  }
}

- (void)beginTransaction
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    int v3 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "!_closed";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MNTraceRecorder_beginTransaction__block_invoke;
  v5[3] = &unk_1E60F6B98;
  v5[4] = self;
  [(MNTraceRecorder *)self _dispatchWrite:v5];
}

void __35__MNTraceRecorder_beginTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (!v1[48])
  {
    id v2 = [v1 trace];
    sqlite3_exec((sqlite3 *)[v2 db], "BEGIN TRANSACTION;", 0, 0, 0);
  }
}

- (void)endTransaction
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    int v3 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "!_closed";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MNTraceRecorder_endTransaction__block_invoke;
  v5[3] = &unk_1E60F6B98;
  v5[4] = self;
  [(MNTraceRecorder *)self _dispatchWrite:v5];
}

void __33__MNTraceRecorder_endTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (!v1[48])
  {
    id v2 = [v1 trace];
    sqlite3_exec((sqlite3 *)[v2 db], "COMMIT;", 0, 0, 0);
  }
}

- (void)setNavigationStartDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__MNTraceRecorder_setNavigationStartDate___block_invoke;
    v6[3] = &unk_1E60F6668;
    v6[4] = self;
    id v7 = v4;
    [(MNTraceRecorder *)self _dispatchWrite:v6];
  }
}

uint64_t __42__MNTraceRecorder_setNavigationStartDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "bindParameter:double:", @":navigation_start_time");
  int v3 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v3 execute];
}

- (void)setNavigationEndDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__MNTraceRecorder_setNavigationEndDate___block_invoke;
    v6[3] = &unk_1E60F6668;
    v6[4] = self;
    id v7 = v4;
    [(MNTraceRecorder *)self _dispatchWrite:v6];
  }
}

uint64_t __40__MNTraceRecorder_setNavigationEndDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "bindParameter:double:", @":navigation_end_time");
  int v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 execute];
}

- (void)recordRouteChangeWithIndex:(unint64_t)a3 directionsResponseID:(id)a4 etauResponseID:(id)a5 rerouteReason:(unint64_t)a6
{
  id v14 = a4;
  id v10 = a5;
  __int16 v11 = objc_opt_new();
  if (v14) {
    [v11 setObject:v14 forKeyedSubscript:@"directionsResponseID"];
  }
  if (v10) {
    [v11 setObject:v10 forKeyedSubscript:@"etauResponseID"];
  }
  double v12 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v12 forKeyedSubscript:@"routeIndex"];

  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a6];
  [v11 setObject:v13 forKeyedSubscript:@"reason"];

  [(MNTraceRecorder *)self _recordNavigationUpdate:1 parameters:v11];
}

- (void)recordDepartWaypoint:(id)a3 legIndex:(unint64_t)a4 departureReason:(unint64_t)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v14[0] = a3;
  v13[0] = @"waypoint";
  v13[1] = @"legIndex";
  __int16 v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithUnsignedInteger:a4];
  v14[1] = v10;
  v13[2] = @"reason";
  __int16 v11 = [NSNumber numberWithUnsignedInteger:a5];
  v14[2] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  [(MNTraceRecorder *)self _recordNavigationUpdate:2 parameters:v12];
}

- (void)recordDirectionsRequest:(id)a3 response:(id)a4 error:(id)a5 waypoints:(id)a6 selectedRouteIndex:(unint64_t)a7 requestTimestamp:(double)a8 responseTimestamp:(double)a9
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  if (self->_closed)
  {
    uint64_t v25 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "!_closed";
      __int16 v38 = 2112;
      uint64_t v39 = v25;
      _os_log_impl(&dword_1B542B000, v26, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  unint64_t routeRequestCount = self->_routeRequestCount;
  self->_unint64_t routeRequestCount = routeRequestCount + 1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __122__MNTraceRecorder_recordDirectionsRequest_response_error_waypoints_selectedRouteIndex_requestTimestamp_responseTimestamp___block_invoke;
  v27[3] = &unk_1E60F7160;
  double v32 = a8;
  double v33 = a9;
  v27[4] = self;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  unint64_t v34 = a7;
  BOOL v35 = routeRequestCount == 0;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  [(MNTraceRecorder *)self _dispatchWrite:v27];
}

void __122__MNTraceRecorder_recordDirectionsRequest_response_error_waypoints_selectedRouteIndex_requestTimestamp_responseTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 144) bind:1 int:*(unsigned int *)(v1 + 256)];
    [*(id *)(*(void *)(a1 + 32) + 144) bind:2 double:*(double *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 32) + 144) bind:3 double:*(double *)(a1 + 80)];
    int v3 = [*(id *)(a1 + 40) data];
    [*(id *)(*(void *)(a1 + 32) + 144) bind:4 data:v3];
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      id v5 = (void *)[v4 copy];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = objc_msgSend(v5, "routes", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * v10++) setUnpackedLatLngVertices:0];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v8);
      }

      __int16 v11 = [v5 data];
      [*(id *)(*(void *)(a1 + 32) + 144) bind:5 data:v11];
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:0 error:0];
      [*(id *)(*(void *)(a1 + 32) + 144) bind:6 data:v13];
    }
    id v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 64) requiringSecureCoding:0 error:0];
    [*(id *)(*(void *)(a1 + 32) + 144) bind:7 data:v14];
    [*(id *)(*(void *)(a1 + 32) + 144) bind:8 int:*(unsigned int *)(a1 + 88)];
    if (([*(id *)(*(void *)(a1 + 32) + 144) execute] & 1) == 0)
    {
      id v16 = [NSString stringWithFormat:@"Error recording directions request"];
      id v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "result";
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }
    }
    if (*(unsigned char *)(a1 + 96))
    {
      [*(id *)(*(void *)(a1 + 32) + 32) timeIntervalSinceReferenceDate];
      [*(id *)(*(void *)(a1 + 32) + 64) bindParameter:@":directions_start_time" double:v15 + *(double *)(a1 + 72)];
      [*(id *)(*(void *)(a1 + 32) + 64) execute];
    }
  }
}

- (void)recordInitialCourse:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    id v5 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "!_closed";
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MNTraceRecorder_recordInitialCourse___block_invoke;
  v7[3] = &unk_1E60F6BC0;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  [(MNTraceRecorder *)self _dispatchWrite:v7];
}

unsigned char *__39__MNTraceRecorder_recordInitialCourse___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  result = *(unsigned char **)(a1 + 32);
  if (!result[48])
  {
    ppStmt = 0;
    int v3 = [result trace];
    int v4 = sqlite3_prepare_v2((sqlite3 *)[v3 db], "UPDATE info SET initial_course = ?", 34, &ppStmt, 0);

    if (v4)
    {
      id v6 = [NSString stringWithFormat:@"Error preparing statement to record initial course"];
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v12 = "result == SQLITE_OK";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }
    }
    uint64_t v5 = sqlite3_bind_double(ppStmt, 1, *(double *)(a1 + 40));
    if (v5)
    {
      return (unsigned char *)[*(id *)(a1 + 32) _logSqliteErrorWithResult:v5 file:"/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m" line:1053];
    }
    else
    {
      if (sqlite3_step(ppStmt) != 101)
      {
        uint64_t v8 = [NSString stringWithFormat:@"Error recording initial course"];
        uint64_t v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v12 = "result == SQLITE_DONE";
          __int16 v13 = 2112;
          id v14 = v8;
          _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
        }
      }
      return (unsigned char *)sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

- (void)recordETAURequest:(id)a3 response:(id)a4 error:(id)a5 destinationName:(id)a6 requestTimestamp:(double)a7 responseTimestamp:(double)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (self->_closed)
  {
    id v22 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v32 = "!_closed";
      __int16 v33 = 2112;
      unint64_t v34 = v22;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__MNTraceRecorder_recordETAURequest_response_error_destinationName_requestTimestamp_responseTimestamp___block_invoke;
  v24[3] = &unk_1E60F7188;
  double v29 = a7;
  double v30 = a8;
  v24[4] = self;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [(MNTraceRecorder *)self _dispatchWrite:v24];
}

void __103__MNTraceRecorder_recordETAURequest_response_error_destinationName_requestTimestamp_responseTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 152) bind:1 double:*(double *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 32) + 152) bind:2 double:*(double *)(a1 + 80)];
    int v3 = *(void **)(*(void *)(a1 + 32) + 152);
    int v4 = [*(id *)(a1 + 40) data];
    [v3 bind:3 data:v4];

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 152);
    id v6 = [*(id *)(a1 + 48) data];
    [v5 bind:4 data:v6];

    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:0 error:0];
      [*(id *)(*(void *)(a1 + 32) + 152) bind:5 data:v8];
    }
    [*(id *)(*(void *)(a1 + 32) + 152) bind:6 string:*(void *)(a1 + 64)];
    if (([*(id *)(*(void *)(a1 + 32) + 152) execute] & 1) == 0)
    {
      uint64_t v9 = [NSString stringWithFormat:@"Error recording ETA update"];
      __int16 v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        uint64_t v12 = "result";
        __int16 v13 = 2112;
        id v14 = v9;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)recordTransitUpdateRequest:(id)a3 withTimestamp:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_closed)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "!_closed";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  uint64_t v7 = [v6 data];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MNTraceRecorder_recordTransitUpdateRequest_withTimestamp___block_invoke;
  v11[3] = &unk_1E60F7138;
  double v13 = a4;
  v11[4] = self;
  id v12 = v7;
  id v8 = v7;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __60__MNTraceRecorder_recordTransitUpdateRequest_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 160) bind:1 double:*(double *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 160) bind:2 data:*(void *)(a1 + 40)];
    if (([*(id *)(*(void *)(a1 + 32) + 160) execute] & 1) == 0)
    {
      int v3 = [NSString stringWithFormat:@"Error recording realtime transit update request"];
      int v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        id v6 = "result";
        __int16 v7 = 2112;
        id v8 = v3;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)recordTransitUpdateResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_closed)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "!_closed";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  uint64_t v6 = v5;
  __int16 v7 = [v4 data];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MNTraceRecorder_recordTransitUpdateResponse___block_invoke;
  v11[3] = &unk_1E60F7138;
  uint64_t v13 = v6;
  v11[4] = self;
  id v12 = v7;
  id v8 = v7;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __47__MNTraceRecorder_recordTransitUpdateResponse___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 168) bind:1 double:*(double *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 168) bind:2 data:*(void *)(a1 + 40)];
    if (([*(id *)(*(void *)(a1 + 32) + 168) execute] & 1) == 0)
    {
      int v3 = [NSString stringWithFormat:@"Error recording realtime transit update response"];
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        uint64_t v6 = "result";
        __int16 v7 = 2112;
        id v8 = v3;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)recordTransitUpdateError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_closed)
  {
    __int16 v7 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "!_closed";
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MNTraceRecorder_recordTransitUpdateError___block_invoke;
  v9[3] = &unk_1E60F7138;
  uint64_t v11 = v5;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  [(MNTraceRecorder *)self _dispatchWrite:v9];
}

void __44__MNTraceRecorder_recordTransitUpdateError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 176) bind:1 double:*(double *)(a1 + 48)];
    int v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 40) requiringSecureCoding:0 error:0];
    [*(id *)(*(void *)(a1 + 32) + 176) bind:2 data:v3];
    if (([*(id *)(*(void *)(a1 + 32) + 176) execute] & 1) == 0)
    {
      id v4 = [NSString stringWithFormat:@"Error recording realtime transit update error"];
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        __int16 v7 = "result";
        __int16 v8 = 2112;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)recordVehicleSpeed:(double)a3 timestamp:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_closed)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "!_closed";
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__MNTraceRecorder_recordVehicleSpeed_timestamp___block_invoke;
  v11[3] = &unk_1E60F71B0;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = v7;
  double v14 = a3;
  id v8 = v6;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __48__MNTraceRecorder_recordVehicleSpeed_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 184) bind:1 double:*(double *)(a1 + 48)];
    int v3 = *(void **)(*(void *)(a1 + 32) + 184);
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "bind:double:", 2);
    [*(id *)(*(void *)(a1 + 32) + 184) bind:3 double:*(double *)(a1 + 56)];
    if (([*(id *)(*(void *)(a1 + 32) + 184) execute] & 1) == 0)
    {
      id v4 = [NSString stringWithFormat:@"Error recording vehicle speed"];
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        uint64_t v7 = "result";
        __int16 v8 = 2112;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)recordVehicleHeading:(double)a3 timestamp:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_closed)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "!_closed";
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MNTraceRecorder_recordVehicleHeading_timestamp___block_invoke;
  v11[3] = &unk_1E60F71B0;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = v7;
  double v14 = a3;
  id v8 = v6;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __50__MNTraceRecorder_recordVehicleHeading_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 192) bind:1 double:*(double *)(a1 + 48)];
    int v3 = *(void **)(*(void *)(a1 + 32) + 192);
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "bind:double:", 2);
    [*(id *)(*(void *)(a1 + 32) + 192) bind:3 double:*(double *)(a1 + 56)];
    if (([*(id *)(*(void *)(a1 + 32) + 192) execute] & 1) == 0)
    {
      id v4 = [NSString stringWithFormat:@"Error recording vehicle heading"];
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        uint64_t v7 = "result";
        __int16 v8 = 2112;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)recordMotionUpdate:(unint64_t)a3 exitType:(unint64_t)a4 confidence:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_closed)
  {
    double v14 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "!_closed";
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  uint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceReferenceDate];
  uint64_t v13 = v12;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__MNTraceRecorder_recordMotionUpdate_exitType_confidence___block_invoke;
  v16[3] = &unk_1E60F71D8;
  v16[4] = self;
  v16[5] = v10;
  v16[6] = v13;
  v16[7] = a3;
  v16[8] = a4;
  v16[9] = a5;
  [(MNTraceRecorder *)self _dispatchWrite:v16];
}

void __58__MNTraceRecorder_recordMotionUpdate_exitType_confidence___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 200) bind:1 double:*(double *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 200) bind:2 double:*(double *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 200) bind:3 int:*(unsigned int *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 200) bind:4 int:*(unsigned int *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 200) bind:5 int:*(unsigned int *)(a1 + 72)];
    if (([*(id *)(*(void *)(a1 + 32) + 200) execute] & 1) == 0)
    {
      int v3 = [NSString stringWithFormat:@"Error recording motion update"];
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        int v6 = "result";
        __int16 v7 = 2112;
        __int16 v8 = v3;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)recordCompassHeading:(double)a3 magneticHeading:(double)a4 accuracy:(double)a5 timestamp:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (self->_closed)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "!_closed";
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = v11;
  if (!self->_recordingCompassHeadingLastDate || (objc_msgSend(v11, "timeIntervalSinceDate:"), v13 >= 1.0))
  {
    objc_storeStrong((id *)&self->_recordingCompassHeadingLastDate, v12);
    [(MNTraceRecorder *)self timeSinceRecordingBegan];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__MNTraceRecorder_recordCompassHeading_magneticHeading_accuracy_timestamp___block_invoke;
    v17[3] = &unk_1E60F7200;
    v17[4] = self;
    uint64_t v19 = v14;
    id v18 = v10;
    double v20 = a3;
    double v21 = a4;
    double v22 = a5;
    [(MNTraceRecorder *)self _dispatchWrite:v17];
  }
}

void __75__MNTraceRecorder_recordCompassHeading_magneticHeading_accuracy_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 208) bind:1 double:*(double *)(a1 + 48)];
    int v3 = *(void **)(*(void *)(a1 + 32) + 208);
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "bind:double:", 2);
    [*(id *)(*(void *)(a1 + 32) + 208) bind:3 double:*(double *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 208) bind:4 double:*(double *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 208) bind:5 double:*(double *)(a1 + 72)];
    if (([*(id *)(*(void *)(a1 + 32) + 208) execute] & 1) == 0)
    {
      id v4 = [NSString stringWithFormat:@"Error recording compass heading"];
      int v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        __int16 v7 = "result";
        __int16 v8 = 2112;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)recordVirtualGarageVehicleState:(id)a3 isDifferentVehicle:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_closed)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = "!_closed";
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__MNTraceRecorder_recordVirtualGarageVehicleState_isDifferentVehicle___block_invoke;
  v11[3] = &unk_1E60F7228;
  id v12 = v6;
  double v13 = self;
  uint64_t v14 = v7;
  BOOL v15 = a4;
  id v8 = v6;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __70__MNTraceRecorder_recordVirtualGarageVehicleState_isDifferentVehicle___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentVehicleState];
  [*(id *)(*(void *)(a1 + 40) + 216) bind:1 double:*(double *)(a1 + 48)];
  int v3 = *(void **)(*(void *)(a1 + 40) + 216);
  id v4 = [*(id *)(a1 + 32) lastStateUpdateDate];
  [v4 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "bind:double:", 2);

  int v5 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v6 = [v2 identifier];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"(unknown)";
  }
  [v5 bind:3 string:v8];

  uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v10 = [v2 currentEVRange];
  uint64_t v11 = [MEMORY[0x1E4F291E0] meters];
  id v12 = [v10 measurementByConvertingToUnit:v11];
  [v12 doubleValue];
  objc_msgSend(v9, "bind:double:", 4);

  double v13 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v14 = [v2 maxEVRange];
  BOOL v15 = [MEMORY[0x1E4F291E0] meters];
  uint64_t v16 = [v14 measurementByConvertingToUnit:v15];
  [v16 doubleValue];
  objc_msgSend(v13, "bind:double:", 5);

  __int16 v17 = *(void **)(*(void *)(a1 + 40) + 216);
  __int16 v18 = [v2 batteryPercentage];
  [v18 doubleValue];
  objc_msgSend(v17, "bind:double:", 6);

  uint64_t v19 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v20 = [v2 minBatteryCapacity];
  double v21 = [MEMORY[0x1E4F291B0] kilowattHours];
  double v22 = [v20 measurementByConvertingToUnit:v21];
  [v22 doubleValue];
  objc_msgSend(v19, "bind:double:", 7);

  id v23 = *(void **)(*(void *)(a1 + 40) + 216);
  __int16 v24 = [v2 currentBatteryCapacity];
  __int16 v25 = [MEMORY[0x1E4F291B0] kilowattHours];
  id v26 = [v24 measurementByConvertingToUnit:v25];
  [v26 doubleValue];
  objc_msgSend(v23, "bind:double:", 8);

  uint64_t v27 = *(void **)(*(void *)(a1 + 40) + 216);
  id v28 = [v2 maxBatteryCapacity];
  double v29 = [MEMORY[0x1E4F291B0] kilowattHours];
  double v30 = [v28 measurementByConvertingToUnit:v29];
  [v30 doubleValue];
  objc_msgSend(v27, "bind:double:", 9);

  id v31 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v32 = [v2 consumptionArguments];
  __int16 v33 = (void *)v32;
  if (v32) {
    unint64_t v34 = (__CFString *)v32;
  }
  else {
    unint64_t v34 = @"(unknown)";
  }
  [v31 bind:10 string:v34];

  uint64_t v35 = *(void **)(*(void *)(a1 + 40) + 216);
  uint64_t v36 = [v2 chargingArguments];
  uint64_t v37 = (void *)v36;
  if (v36) {
    __int16 v38 = (__CFString *)v36;
  }
  else {
    __int16 v38 = @"(unknown)";
  }
  [v35 bind:11 string:v38];

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 216), "bind:int:", 12, objc_msgSend(v2, "isCharging"));
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 216), "bind:int:", 13, objc_msgSend(v2, "activeConnector"));
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 216), "bind:int:", 14, objc_msgSend(v2, "origin"));
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v39 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
    if (v39) {
      [*(id *)(*(void *)(a1 + 40) + 216) bind:15 data:v39];
    }
  }
  if (([*(id *)(*(void *)(a1 + 40) + 216) execute] & 1) == 0)
  {
    uint64_t v40 = [NSString stringWithFormat:@"Error recording EV data"];
    int v41 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v42 = 136315394;
      CLLocationCoordinate2D v43 = "result";
      __int16 v44 = 2112;
      uint64_t v45 = v40;
      _os_log_impl(&dword_1B542B000, v41, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v42, 0x16u);
    }
  }
}

- (void)_logError:(id)a3 resultCode:(int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 != 101)
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      id v8 = v5;
      __int16 v9 = 1024;
      int v10 = a4;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "%{public}@: %d", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (void)recordRouteCreationAction:(unint64_t)a3 request:(id)a4 response:(id)a5 error:(id)a6 anchorPoints:(id)a7 requestDate:(id)a8 responseDate:(id)a9
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (self->_traceType != 2) {
    id v28 = {;
  }
    double v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v41 = "-[MNTraceRecorder recordRouteCreationAction:request:response:error:anchorPoints:requestDate:responseDate:]";
      __int16 v42 = 2080;
      CLLocationCoordinate2D v43 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
      __int16 v44 = 1024;
      int v45 = 1258;
      __int16 v46 = 2080;
      double v47 = "_traceType == MNTraceTypeCustomRouteCreation";
      __int16 v48 = 2112;
      double v49 = v28;
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  if (self->_closed)
  {
    double v30 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    id v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v41 = "!_closed";
      __int16 v42 = 2112;
      CLLocationCoordinate2D v43 = v30;
      _os_log_impl(&dword_1B542B000, v31, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [v19 timeIntervalSinceDate:self->_recordingStartDate];
  uint64_t v22 = v21;
  [v20 timeIntervalSinceDate:self->_recordingStartDate];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __106__MNTraceRecorder_recordRouteCreationAction_request_response_error_anchorPoints_requestDate_responseDate___block_invoke;
  v32[3] = &unk_1E60F7250;
  uint64_t v37 = v22;
  uint64_t v38 = v23;
  v32[4] = self;
  id v33 = v15;
  unint64_t v39 = a3;
  id v34 = v16;
  id v35 = v18;
  id v36 = v17;
  id v24 = v17;
  id v25 = v18;
  id v26 = v16;
  id v27 = v15;
  [(MNTraceRecorder *)self _dispatchWrite:v32];
}

void __106__MNTraceRecorder_recordRouteCreationAction_request_response_error_anchorPoints_requestDate_responseDate___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    int v3 = *(void **)(v1 + 248);
    if (!v3)
    {
      id v4 = *(void **)(v1 + 8);
      id v22 = 0;
      uint64_t v5 = [v4 prepareStatement:@"INSERT INTO custom_route_creation_actions (request_timestamp, response_timestamp, request_data, response_data, response_error_data, anchor_points_data, action) VALUES (:request_time, :response_time, :request, :response, :error, :anchor_points, :action)", &v22 outError];
      id v6 = v22;
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 248);
      *(void *)(v7 + 248) = v5;

      if (v6)
      {
        __int16 v9 = [NSString stringWithFormat:@"Error creating record route creation action statement: %@", v6];
        int v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          id v24 = "-[MNTraceRecorder recordRouteCreationAction:request:response:error:anchorPoints:requestDate:responseDate:]_block_invoke";
          __int16 v25 = 2080;
          id v26 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTraceRecorder.m";
          __int16 v27 = 1024;
          int v28 = 1273;
          __int16 v29 = 2080;
          double v30 = "NO";
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }

        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(v11 + 248);
        *(void *)(v11 + 248) = 0;

        *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
      }

      int v3 = *(void **)(*(void *)(a1 + 32) + 248);
    }
    [v3 bindParameter:@":request_time" double:*(double *)(a1 + 72)];
    [*(id *)(*(void *)(a1 + 32) + 248) bindParameter:@":response_time" double:*(double *)(a1 + 80)];
    double v13 = *(void **)(*(void *)(a1 + 32) + 248);
    uint64_t v14 = [*(id *)(a1 + 40) data];
    [v13 bindParameter:@":request" data:v14];

    id v15 = *(void **)(*(void *)(a1 + 32) + 248);
    id v16 = [*(id *)(a1 + 48) data];
    [v15 bindParameter:@":response" data:v16];

    [*(id *)(*(void *)(a1 + 32) + 248) bindParameter:@":action" int:*(unsigned int *)(a1 + 88)];
    id v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 56) requiringSecureCoding:1 error:0];
    [*(id *)(*(void *)(a1 + 32) + 248) bindParameter:@":anchor_points" data:v17];
    uint64_t v18 = *(void *)(a1 + 64);
    if (v18)
    {
      id v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
      [*(id *)(*(void *)(a1 + 32) + 248) bindParameter:@":error" data:v19];
    }
    if (([*(id *)(*(void *)(a1 + 32) + 248) execute] & 1) == 0)
    {
      id v20 = [NSString stringWithFormat:@"Error recording route creation action."];
      uint64_t v21 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v24 = "result";
        __int16 v25 = 2112;
        id v26 = v20;
        _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }
    }
  }
}

- (void)_recordNavigationUpdate:(int64_t)a3 parameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_closed)
  {
    __int16 v9 = [NSString stringWithFormat:@"Cannot complete operation on closed trace."];
    int v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "!_closed";
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  [(MNTraceRecorder *)self timeSinceRecordingBegan];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MNTraceRecorder__recordNavigationUpdate_parameters___block_invoke;
  v11[3] = &unk_1E60F71B0;
  uint64_t v13 = v7;
  int64_t v14 = a3;
  void v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  [(MNTraceRecorder *)self _dispatchWrite:v11];
}

void __54__MNTraceRecorder__recordNavigationUpdate_parameters___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    [*(id *)(v1 + 232) bind:1 double:*(double *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 232) bind:2 int:*(unsigned int *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 232);
    if (v3)
    {
      id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
      [v5 bind:3 data:v6];
    }
    else
    {
      [*(id *)(v4 + 232) bindNull:3];
    }
    if (([*(id *)(*(void *)(a1 + 32) + 232) execute] & 1) == 0)
    {
      uint64_t v7 = [NSString stringWithFormat:@"Error recording navigation update"];
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        int v10 = "result";
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (void)_updateNavigationEventsWithLocationReference:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 traceIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [NSString stringWithFormat:@"Location does not have ID"];
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v25 = "location.traceIndex != NSNotFound";
      __int16 v26 = 2112;
      __int16 v27 = v16;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
    }
  }
  uint64_t v5 = [(NSMapTable *)self->_eventsPendingLocationReference objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v20;
      *(void *)&long long v8 = 136315394;
      long long v18 = v8;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "intValue", v18);
          -[MNTracePreparedStatement bind:int:](self->_updateNavigationEventLocationID, "bind:int:", 1, [v4 traceIndex]);
          [(MNTracePreparedStatement *)self->_updateNavigationEventLocationID bind:2 int:v12];
          if (![(MNTracePreparedStatement *)self->_updateNavigationEventLocationID execute])
          {
            uint64_t v13 = [NSString stringWithFormat:@"Error updating location ID for navigation event"];
            int64_t v14 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              __int16 v25 = "result";
              __int16 v26 = 2112;
              __int16 v27 = v13;
              _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v9 = v15;
      }
      while (v15);
    }
    [(NSMapTable *)self->_eventsPendingLocationReference removeObjectForKey:v4];
  }
}

- (void)_executeStatementForQuery:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__MNTraceRecorder__executeStatementForQuery_handler___block_invoke;
      v9[3] = &unk_1E60F7020;
      void v9[4] = self;
      id v10 = v6;
      id v11 = v7;
      [(MNTraceRecorder *)self _dispatchWrite:v9];
    }
    else
    {
      long long v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "_prepareStatementForQuery was called with a nil query.", buf, 2u);
      }
    }
  }
}

void __53__MNTraceRecorder__executeStatementForQuery_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  int v2 = sqlite3_prepare_v2((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) db], (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), objc_msgSend(*(id *)(a1 + 40), "length"), &ppStmt, 0);
  if (v2)
  {
    int v3 = v2;
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = sqlite3_errmsg((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) db]);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v5;
      __int16 v15 = 1024;
      int v16 = v3;
      __int16 v17 = 2080;
      long long v18 = v6;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Error preparing statement for query \"%@\": %d | \"%s\"", buf, 0x1Cu);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int v7 = sqlite3_step(ppStmt);
    if (v7 != 101)
    {
      int v8 = v7;
      uint64_t v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = sqlite3_errmsg((sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) db]);
        *(_DWORD *)buf = 138412802;
        uint64_t v14 = v10;
        __int16 v15 = 1024;
        int v16 = v8;
        __int16 v17 = 2080;
        long long v18 = v11;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error executing statement for query \"%@\": %d | \"%s\"", buf, 0x1Cu);
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (MNTrace)trace
{
  return self->_trace;
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_eventsPendingLocationReference, 0);
  objc_storeStrong((id *)&self->_recordRouteCreationActionStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationEventLocationID, 0);
  objc_storeStrong((id *)&self->_recordNavigationUpdate, 0);
  objc_storeStrong((id *)&self->_recordNavigationEvent, 0);
  objc_storeStrong((id *)&self->_recordVirtualGarageVehicleState, 0);
  objc_storeStrong((id *)&self->_recordCompassHeading, 0);
  objc_storeStrong((id *)&self->_recordMotionData, 0);
  objc_storeStrong((id *)&self->_recordVehicleHeading, 0);
  objc_storeStrong((id *)&self->_recordVehicleSpeed, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateResponseError, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateResponse, 0);
  objc_storeStrong((id *)&self->_recordRealtimeTransitUpdateRequest, 0);
  objc_storeStrong((id *)&self->_recordETAUStatement, 0);
  objc_storeStrong((id *)&self->_recordDirectionsStatement, 0);
  objc_storeStrong((id *)&self->_recordMatchInfoStatement, 0);
  objc_storeStrong((id *)&self->_recordLocationErrorStatement, 0);
  objc_storeStrong((id *)&self->_recordLocationStatement, 0);
  objc_storeStrong((id *)&self->_recordStylesheetStatement, 0);
  objc_storeStrong((id *)&self->_recordAudioSettingStatement, 0);
  objc_storeStrong((id *)&self->_recordDebugSettingStatement, 0);
  objc_storeStrong((id *)&self->_recordEnvironmentInfoStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationEndTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateNavigationStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateDirectionsStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_updateRecordingStartTimeStatement, 0);
  objc_storeStrong((id *)&self->_recordingCompassHeadingLastDate, 0);
  objc_storeStrong((id *)&self->_recordingStartDate, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_trace, 0);
}

@end