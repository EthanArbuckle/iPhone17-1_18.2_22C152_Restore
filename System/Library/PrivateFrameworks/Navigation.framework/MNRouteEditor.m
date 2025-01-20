@interface MNRouteEditor
+ (id)convertToNavigableRoute:(id)a3 finishedHandler:(id)a4;
+ (void)_addressForRoute:(id)a3 traits:(id)a4 handler:(id)a5;
+ (void)_convertAnchorPointsToWaypoints:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5;
+ (void)_fetchWaypointsFromRouteGeometry:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5;
+ (void)_handleWaypointStepFinishedWithOrigin:(id)a3 destination:(id)a4 address:(id)a5 error:(id)a6 finishedHandler:(id)a7;
+ (void)_requestFinalizedRouteWithWaypoints:(id)a3 address:(id)a4 routeEditorRequest:(id)a5 finishedHandler:(id)a6;
+ (void)_waypointForAnchorPoint:(id)a3 traits:(id)a4 clientAttributes:(id)a5 handler:(id)a6;
- (BOOL)_checkAnchorPointCount:(unint64_t)a3 action:(unint64_t)a4 finishedHandler:(id)a5;
- (MNRouteEditor)init;
- (MNRouteEditor)initWithTraceRecordingEnabled:(BOOL)a3;
- (MNTraceRecorder)_traceRecorder;
- (id)requestRouteGeometry:(id)a3 finishedHandler:(id)a4;
- (void)_requestRouteGeometry:(id)a3 finishedHandler:(id)a4;
- (void)_validateAnchorPoints:(id)a3 finishedHandler:(id)a4;
- (void)_validateCountrySupportedForAnchorPoint:(id)a3 finishedHandler:(id)a4;
- (void)_validateRoadProximityForAnchorPoint:(id)a3 finishedHandler:(id)a4;
- (void)dealloc;
- (void)endSession;
- (void)validateAnchorPoint:(id)a3 handler:(id)a4;
@end

@implementation MNRouteEditor

- (MNRouteEditor)init
{
  v10.receiver = self;
  v10.super_class = (Class)MNRouteEditor;
  v2 = [(MNRouteEditor *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F64690]);
    global_queue = (void *)geo_get_global_queue();
    uint64_t v5 = [v3 initWithQueue:global_queue];
    mapFeatureAccess = v2->_mapFeatureAccess;
    v2->_mapFeatureAccess = (GEOMapFeatureAccess *)v5;

    [(GEOMapFeatureAccess *)v2->_mapFeatureAccess setAllowNetworkTileLoad:1];
    [(GEOMapFeatureAccess *)v2->_mapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:0];
    [(GEOMapFeatureAccess *)v2->_mapFeatureAccess setAllowStaleData:1];
    GEOConfigGetDouble();
    v2->_maxDistanceFromRoads = v7;
    v8 = v2;
  }

  return v2;
}

- (MNRouteEditor)initWithTraceRecordingEnabled:(BOOL)a3
{
  v4 = [(MNRouteEditor *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_isTraceRecordingEnabled = a3;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
    sessionStartDate = v5->_sessionStartDate;
    v5->_sessionStartDate = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(MNRouteEditor *)self endSession];
  v3.receiver = self;
  v3.super_class = (Class)MNRouteEditor;
  [(MNRouteEditor *)&v3 dealloc];
}

- (void)endSession
{
  [(MNTraceRecorder *)self->_traceRecorder saveTraceWithCompletionHandler:0];
  traceRecorder = self->_traceRecorder;
  self->_traceRecorder = 0;
}

- (MNTraceRecorder)_traceRecorder
{
  if (self->_isTraceRecordingEnabled)
  {
    traceRecorder = self->_traceRecorder;
    if (traceRecorder)
    {
      v4 = traceRecorder;
    }
    else
    {
      uint64_t v5 = (MNTraceRecorder *)objc_opt_new();
      uint64_t v6 = self->_traceRecorder;
      self->_traceRecorder = v5;

      [(MNTraceRecorder *)self->_traceRecorder setRecordingStartDate:self->_sessionStartDate];
      double v7 = objc_opt_new();
      [v7 setDateFormat:@"yyyy-MM-dd-HHmmss"];
      v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      [v7 setTimeZone:v8];

      v9 = [(MNTraceRecorder *)self->_traceRecorder recordingStartDate];
      objc_super v10 = [v7 stringFromDate:v9];

      v11 = [NSString stringWithFormat:@"RouteCreation_%@", v10];
      v12 = +[MNFilePaths customRouteCreationTraceExtension];
      v13 = +[MNFilePaths routeCreationTracesDirectoryPath];
      v14 = +[MNFilePaths tracePathForTraceName:v11 extension:v12 directoryPath:v13];

      [(MNTraceRecorder *)self->_traceRecorder startWritingTraceToPath:v14 traceType:2 withErrorHandler:0];
      v4 = self->_traceRecorder;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)validateAnchorPoint:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MNSequence alloc];
    global_queue = (void *)geo_get_global_queue();
    objc_super v10 = [(MNSequence *)v8 initWithQueue:global_queue];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke;
    v16[3] = &unk_1E60F6030;
    v16[4] = self;
    id v11 = v6;
    id v17 = v11;
    [(MNSequence *)v10 addStep:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_2;
    v14[3] = &unk_1E60F6030;
    v14[4] = self;
    id v15 = v11;
    [(MNSequence *)v10 addStep:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_3;
    v12[3] = &unk_1E60F6080;
    id v13 = v7;
    [(MNSequence *)v10 setSequenceFinalizeHandler:v12];
    [(MNSequence *)v10 start];
  }
}

uint64_t __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _validateCountrySupportedForAnchorPoint:*(void *)(a1 + 40) finishedHandler:a3];
}

uint64_t __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _validateRoadProximityForAnchorPoint:*(void *)(a1 + 40) finishedHandler:a3];
}

void __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_4;
  v6[3] = &unk_1E60F6058;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_validateCountrySupportedForAnchorPoint:(id)a3 finishedHandler:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F64660];
  id v7 = a3;
  id v8 = [v6 alloc];
  [v7 locationCoordinate];
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_msgSend(v8, "initWithGEOCoordinate:", v10, v12);
  v14 = (void *)MEMORY[0x1E4F64540];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__MNRouteEditor__validateCountrySupportedForAnchorPoint_finishedHandler___block_invoke;
  v16[3] = &unk_1E60F60A8;
  id v17 = v5;
  id v15 = v5;
  [v14 customRouteCreationSupportedForLocation:v13 queue:MEMORY[0x1E4F14428] handler:v16];
}

void __73__MNRouteEditor__validateCountrySupportedForAnchorPoint_finishedHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  if ((a2 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    double v11 = @"MNRouteEditorErrorUnsupportedCountriesKey";
    id v8 = v5;
    if (!v5)
    {
      id v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    v12[0] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    double v10 = objc_msgSend(v7, "_navigation_errorWithCode:userInfo:", 9, v9);
    [v6 setError:v10];

    if (!v5) {
  }
    }
  [v6 error];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_validateRoadProximityForAnchorPoint:(id)a3 finishedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 coordinate];
  double v9 = v8;
  double v11 = v10;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  mapFeatureAccess = self->_mapFeatureAccess;
  double maxDistanceFromRoads = self->_maxDistanceFromRoads;
  v20 = v22;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke;
  v21[3] = &unk_1E60F60D0;
  v21[4] = v22;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke_2;
  v17[3] = &unk_1E60F60F8;
  id v14 = v6;
  id v18 = v14;
  id v15 = v7;
  id v19 = v15;
  id v16 = (id)-[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v21, v17, v9, v11, maxDistanceFromRoads);

  _Block_object_dispose(v22, 8);
}

uint64_t __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke(uint64_t result)
{
  return result;
}

void __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke_2(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  if (!*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:", 8, @"Too far from roads.");
    [v2 setError:v3];

    id v4 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "No nearby road found for anchor point: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [v2 error];

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)requestRouteGeometry:(id)a3 finishedHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != ((void *)0)", buf, 2u);
    }
    goto LABEL_18;
  }
  uint64_t v8 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [v6 anchorPoints];
    *(_DWORD *)buf = 67109120;
    int v50 = [v9 count];
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting route geometry with %d anchor points.", buf, 8u);
  }
  double v10 = [v6 anchorPoints];
  unint64_t v11 = [v10 count];

  if (v11 > 1)
  {
    if (([v6 action] == 1001 || objc_msgSend(v6, "action") == 1002)
      && ([v6 undoRedoRouteData],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      int v14 = 1;
    }
    else
    {
      id v15 = [v6 anchorPoints];
      BOOL v16 = -[MNRouteEditor _checkAnchorPointCount:action:finishedHandler:](self, "_checkAnchorPointCount:action:finishedHandler:", [v15 count], objc_msgSend(v6, "action"), v7);

      if (!v16) {
        goto LABEL_18;
      }
      int v14 = 0;
    }
    id v17 = objc_opt_new();
    id v18 = [(MNRouteEditor *)self _traceRecorder];
    id v19 = [MEMORY[0x1E4F1C9C8] now];
    v20 = [MNSequence alloc];
    global_queue = (void *)geo_get_global_queue();
    v22 = [(MNSequence *)v20 initWithQueue:global_queue];

    if (v14)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke;
      v46[3] = &unk_1E60F6030;
      v23 = &v47;
      id v47 = v17;
      id v48 = v6;
      [(MNSequence *)v22 addStep:v46];
      v24 = v48;
    }
    else
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_2;
      v43[3] = &unk_1E60F6120;
      v23 = (id *)v44;
      id v25 = v17;
      v44[0] = v25;
      v44[1] = self;
      id v26 = v6;
      id v45 = v26;
      [(MNSequence *)v22 addStep:v43];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_3;
      v39[3] = &unk_1E60F6148;
      id v40 = v25;
      v41 = self;
      id v42 = v26;
      [(MNSequence *)v22 addStep:v39];

      v24 = v45;
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_4;
    v33[3] = &unk_1E60F6198;
    id v27 = v17;
    id v34 = v27;
    id v35 = v18;
    id v36 = v6;
    id v37 = v19;
    id v38 = v7;
    id v28 = v19;
    id v29 = v18;
    [(MNSequence *)v22 setSequenceFinalizeHandler:v33];
    [(MNSequence *)v22 start];
    v30 = v38;
    id v31 = v27;

    goto LABEL_19;
  }
  double v12 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, @"MNRouteEditorRequest needs at least two anchor points.", 0);
  (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v12, 0);

LABEL_18:
  id v31 = 0;
LABEL_19:

  return v31;
}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v9 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v4 = objc_opt_new();
    id v5 = objc_alloc(MEMORY[0x1E4F649B0]);
    id v6 = [*(id *)(a1 + 40) undoRedoRouteData];
    id v7 = (void *)[v5 initWithPersistentData:v6];

    uint64_t v8 = [v7 buildRoute];
    [v4 setRoute:v8];

    v9[2](v9, v4, 1);
  }
}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    [*(id *)(a1 + 40) _validateAnchorPoints:*(void *)(a1 + 48) finishedHandler:v4];
  }
}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    [*(id *)(a1 + 40) _requestRouteGeometry:*(void *)(a1 + 48) finishedHandler:v4];
  }
}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v4 = [v3 route];
    id v5 = [v3 error];
    uint64_t v6 = [v3 directionsError];
    id v7 = MNGetMNRouteEditorLog();
    uint64_t v8 = v7;
    if (!v4 || v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v5;
        __int16 v36 = 2112;
        uint64_t v37 = v6;
        double v9 = "Error getting route with anchors: %@\nDirections error: %@";
        double v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v9 = "Successfully got route with anchors.";
      double v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl(&dword_1B542B000, v10, v11, v9, buf, v12);
    }

    id v25 = *(void **)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 48) action];
    int v14 = [v3 directionsRequest];
    id v15 = [v4 routeInitializerData];
    BOOL v16 = [v15 directionsResponse];
    [*(id *)(a1 + 48) anchorPoints];
    id v17 = v27 = (void *)v6;
    [v17 anchorPoints];
    id v18 = v28 = v3;
    id v26 = v4;
    uint64_t v19 = *(void *)(a1 + 56);
    v20 = [MEMORY[0x1E4F1C9C8] now];
    [v25 recordRouteCreationAction:v13 request:v14 response:v16 error:v5 anchorPoints:v18 requestDate:v19 responseDate:v20];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_127;
    block[3] = &unk_1E60F6170;
    id v21 = *(id *)(a1 + 64);
    id v30 = v26;
    id v31 = v5;
    id v32 = v27;
    id v33 = v21;
    id v22 = v27;
    id v23 = v5;
    id v24 = v26;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v3 = v28;
  }
}

uint64_t __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_127(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (BOOL)_checkAnchorPointCount:(unint64_t)a3 action:(unint64_t)a4 finishedHandler:(id)a5
{
  id v7 = (void (**)(id, void, void *, void *))a5;
  uint64_t UInteger = GEOConfigGetUInteger();
  uint64_t v9 = 2 * UInteger - 1;
  if (a4 != 102) {
    uint64_t v9 = UInteger;
  }
  if (a4 == 103) {
    unint64_t v10 = UInteger + 1;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 < a3)
  {
    os_log_type_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F64518]) initWithSingleProblemType:21];
    uint32_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "_geo_errorWithDirectionsError:", v11);
    v7[2](v7, 0, v12, v11);
  }
  return v10 >= a3;
}

- (void)_validateAnchorPoints:(id)a3 finishedHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)[v6 newAnchorPoints];
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  int v14 = v7;
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke;
        v19[3] = &unk_1E60F61C0;
        id v21 = v26;
        v20 = v8;
        [(MNRouteEditor *)self validateAnchorPoint:v12 handler:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke_2;
  block[3] = &unk_1E60F61E8;
  id v18 = v26;
  id v17 = v14;
  id v13 = v14;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v26, 8);
}

void __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_opt_new();
  [v2 setError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  (*(void (**)(void, id, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0);
}

- (void)_requestRouteGeometry:(id)a3 finishedHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 routeAttributes];
  id v8 = objc_opt_new();
  [v8 setRequestType:2];
  uint64_t v9 = [v5 anchorPoints];
  [v8 setAnchorPoints:v9];

  objc_msgSend(v8, "setTransportType:", objc_msgSend(v7, "mainTransportType"));
  [v8 setMaxRouteCount:1];
  [v8 setRouteAttributes:v7];
  uint64_t v10 = [v5 currentRoute];
  [v8 setCurrentRoute:v10];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke;
  v17[3] = &unk_1E60F6210;
  void v17[4] = v18;
  [v8 setRequestCallback:v17];
  os_log_type_t v11 = [MEMORY[0x1E4F64540] sharedService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke_2;
  v14[3] = &unk_1E60F6238;
  BOOL v16 = v18;
  id v12 = v6;
  id v15 = v12;
  id v13 = [v11 requestRoutes:v8 handler:v14];
  [v5 setDirectionsServiceRequest:v13];

  _Block_object_dispose(v18, 8);
}

void __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v11 = (id)objc_opt_new();
  uint64_t v10 = [v9 firstObject];

  [v11 setRoute:v10];
  [v11 setDirectionsRequest:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v11 setError:v8];

  [v11 setDirectionsError:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)convertToNavigableRoute:(id)a3 finishedHandler:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 currentRoute];
    if (!v8)
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, @"MNRouteEditorRequest.currentRoute is missing.", 0);
      (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v12, 0);

LABEL_10:
      id v13 = 0;
LABEL_25:

      goto LABEL_26;
    }
    id v9 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 uniqueRouteID];
      *(_DWORD *)buf = 138412290;
      v61 = v10;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "Converting route to navigable route. RouteID: %@", buf, 0xCu);
    }
    if ([v8 isNavigable])
    {
      id v11 = MNGetMNRouteEditorLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Passed in route is already navigable.", buf, 2u);
      }

      (*((void (**)(id, void *, void, void))v7 + 2))(v7, v8, 0, 0);
      goto LABEL_10;
    }
    int v14 = [v6 routeAttributes];
    char v15 = [v14 supportsDirections];

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [request.routeAttributes supportsDirections]", buf, 2u);
      }
      v43 = (void *)MEMORY[0x1E4F649A0];
      v44 = [v6 routeAttributes];
      id v45 = objc_msgSend(v43, "defaultRouteAttributesForTransportType:", objc_msgSend(v44, "mainTransportType"));
      [v6 setRouteAttributes:v45];
    }
    BOOL v16 = (void *)MEMORY[0x1E4F649A0];
    uint64_t v17 = [v6 routeAttributes];
    id v18 = objc_msgSend(v16, "defaultRouteAttributesForTransportType:", objc_msgSend((id)v17, "mainTransportType"));
    [v6 setRouteAttributes:v18];

    id v19 = [v6 routeAttributes];
    LOBYTE(v17) = [v19 supportsDirections];

    if (v17)
    {
      v20 = objc_opt_new();
      global_queue = (void *)geo_get_global_queue();
      long long v22 = [[MNSequence alloc] initWithQueue:global_queue];
      long long v23 = [v6 waypoints];
      uint64_t v24 = [v23 count];

      if (v24 == 2)
      {
        long long v25 = MNGetMNRouteEditorLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v6 waypoints];
          int v27 = [v26 count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v61) = v27;
          _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_DEFAULT, "Converting to navigable route using %d waypoints.", buf, 8u);
        }
        id v28 = v59;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        uint64_t v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke;
      }
      else
      {
        id v30 = [v8 anchorPoints];
        unint64_t v31 = [v30 count];

        id v32 = MNGetMNRouteEditorLog();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v31 < 2)
        {
          if (v33)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_DEFAULT, "Converting to navigable route with no provided waypoints or anchor points. Creating waypoints from route geometry.", buf, 2u);
          }

          id v28 = v57;
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          uint64_t v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_140;
        }
        else
        {
          if (v33)
          {
            id v34 = [v8 anchorPoints];
            int v35 = [v34 count];
            *(_DWORD *)buf = 67109120;
            LODWORD(v61) = v35;
            _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_DEFAULT, "Converting to navigable route using %d anchor points.", buf, 8u);
          }
          id v28 = v58;
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          uint64_t v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_139;
        }
      }
      v28[2] = v29;
      v28[3] = &unk_1E60F6288;
      id v36 = v20;
      v28[4] = v36;
      v28[7] = a1;
      v28[5] = v8;
      id v37 = v6;
      v28[6] = v37;
      [(MNSequence *)v22 addStep:v28];

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2_141;
      v52[3] = &unk_1E60F62B0;
      id v38 = v36;
      id v53 = v38;
      id v56 = a1;
      id v54 = v37;
      id v39 = v7;
      id v55 = v39;
      [(MNSequence *)v22 addStep:v52];
      uint64_t v46 = MEMORY[0x1E4F143A8];
      uint64_t v47 = 3221225472;
      id v48 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_3;
      v49 = &unk_1E60F62D8;
      id v40 = v38;
      id v50 = v40;
      id v51 = v39;
      [(MNSequence *)v22 addStep:&v46];
      [(MNSequence *)v22 start];
      v41 = v51;
      id v13 = v40;

      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [request.routeAttributes supportsDirections]", buf, 2u);
    }
    __break(1u);
    goto LABEL_37;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
LABEL_37:
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != ((void *)0)", buf, 2u);
  }
  id v13 = 0;
LABEL_26:

  return v13;
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) traits];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2;
    v8[3] = &unk_1E60F6260;
    id v9 = *(id *)(a1 + 48);
    id v10 = v4;
    [v5 _addressForRoute:v6 traits:v7 handler:v8];
  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v11 = [v5 waypoints];
  id v8 = [v11 firstObject];
  id v9 = [*(id *)(a1 + 32) waypoints];
  id v10 = [v9 lastObject];
  +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:v8 destination:v10 address:v7 error:v6 finishedHandler:*(void *)(a1 + 40)];
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_139(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 56);
    id v5 = [*(id *)(a1 + 40) anchorPoints];
    [v4 _convertAnchorPointsToWaypoints:v5 routeEditorRequest:*(void *)(a1 + 48) finishedHandler:v6];
  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_140(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    [*(id *)(a1 + 56) _fetchWaypointsFromRouteGeometry:*(void *)(a1 + 40) routeEditorRequest:*(void *)(a1 + 48) finishedHandler:v4];
  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2_141(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v6 = [v9 waypoints];
    id v7 = [v9 address];
    id v8 = [v9 stepError];
    if (v8)
    {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      [*(id *)(a1 + 56) _requestFinalizedRouteWithWaypoints:v6 address:v7 routeEditorRequest:*(void *)(a1 + 40) finishedHandler:v5];
    }
  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v3 = [v6 finalizedRoute];
    id v4 = [v6 stepError];
    id v5 = [v6 directionsError];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)_waypointForAnchorPoint:(id)a3 traits:(id)a4 clientAttributes:(id)a5 handler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12) {
    goto LABEL_24;
  }
  id v13 = [v9 geoLocation];
  int v14 = [v9 mapItemIdentifier];
  int v15 = [v14 isValid];

  uint64_t v16 = [MEMORY[0x1E4F647B8] sharedNoCreate];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    id v18 = [MEMORY[0x1E4F647B8] sharedNoCreate];
    unsigned int v19 = [v18 state];
    if (v19 >= 2)
    {
      if (v19 == 2)
      {

        uint64_t v17 = [v9 mapItemIdentifier];
        int v15 = [v17 isValidForOfflineUse];
LABEL_10:

        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v19;
        _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Requesting route geometry with %d anchor points.", buf, 8u);
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if (([v9 isCoordinate] & 1) != 0 || !v15)
  {
    int v28 = [v9 isCurrentLocation];
    uint64_t v29 = MNGetMNRouteEditorLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        unint64_t v31 = [v9 loggingDescription];
        *(_DWORD *)buf = 138412290;
        v49 = v31;
        _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "Creating waypoint from current location for anchor point %@.", buf, 0xCu);
      }
      id v32 = (void *)MEMORY[0x1E4F644F0];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_146;
      v40[3] = &unk_1E60F6300;
      long long v25 = &v41;
      id v41 = v9;
      id v26 = &v42;
      id v42 = v12;
      id v33 = (id)[v32 composedWaypointForCurrentLocation:v13 traits:v10 completionHandler:v40 networkActivityHandler:0];
    }
    else
    {
      if (v30)
      {
        id v34 = [v9 loggingDescription];
        *(_DWORD *)buf = 138412290;
        v49 = v34;
        _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "Creating waypoint from location for anchor point %@.", buf, 0xCu);
      }
      int v35 = (void *)MEMORY[0x1E4F644F0];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_147;
      v37[3] = &unk_1E60F6300;
      long long v25 = &v38;
      id v38 = v9;
      id v26 = &v39;
      id v39 = v12;
      id v36 = (id)[v35 composedWaypointForLocation:v13 mapItem:0 traits:v10 completionHandler:v37 networkActivityHandler:0];
    }
  }
  else
  {
    id v21 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v9 loggingDescription];
      *(_DWORD *)buf = 138412290;
      v49 = v22;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_DEFAULT, "Creating waypoint from identifier for anchor point %@.", buf, 0xCu);
    }
    long long v23 = (void *)MEMORY[0x1E4F644F0];
    uint64_t v24 = [v9 mapItemIdentifier];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke;
    v43[3] = &unk_1E60F6328;
    long long v25 = &v44;
    id v44 = v9;
    id v26 = &v47;
    id v47 = v12;
    id v45 = v13;
    id v46 = v10;
    id v27 = (id)[v23 composedWaypointForIdentifier:v24 traits:v46 clientAttributes:v11 completionHandler:v43 networkActivityHandler:0];
  }
LABEL_24:
}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) loggingDescription];
      id v12 = [*(id *)(a1 + 32) mapItemIdentifier];
      *(_DWORD *)buf = 138412802;
      id v21 = v11;
      __int16 v22 = 2112;
      long long v23 = v12;
      __int16 v24 = 2112;
      long long v25 = v7;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from identifier for anchor point %@. Falling back to location waypoint.\n\tIdentifier: %@\n\tError: %@", buf, 0x20u);
    }
    id v13 = (void *)MEMORY[0x1E4F644F0];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_144;
    v17[3] = &unk_1E60F6300;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 56);
    id v16 = (id)[v13 composedWaypointForLocation:v14 mapItem:0 traits:v15 completionHandler:v17 networkActivityHandler:0];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [v5 geoMapItem];
    [v8 refineWithMapItem:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) loggingDescription];
      id v12 = [*(id *)(a1 + 32) mapItemIdentifier];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) styleAttributes];
    [v5 setStyleAttributes:v8];

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) loggingDescription];
      id v12 = [*(id *)(a1 + 32) mapItemIdentifier];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from current location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) styleAttributes];
    [v5 setStyleAttributes:v8];

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) loggingDescription];
      id v12 = [*(id *)(a1 + 32) mapItemIdentifier];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) styleAttributes];
    [v5 setStyleAttributes:v8];

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

+ (void)_addressForRoute:(id)a3 traits:(id)a4 handler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nil", buf, 2u);
    }
    __break(1u);
  }
  id v10 = (void (**)(void, void, void))v9;
  uint64_t v11 = [MEMORY[0x1E4F647B8] sharedNoCreate];
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = (void *)v11;
  int v13 = [MEMORY[0x1E4F647B8] sharedNoCreate];
  unsigned int v14 = [v13 state];
  if (v14 < 2)
  {
LABEL_11:

LABEL_12:
    [v7 distance];
    objc_msgSend(v7, "pointAtRouteCoordinate:", objc_msgSend(v7, "routeCoordinateForDistanceAfterStart:", v17 * 0.5));
    double v19 = v18;
    double v21 = v20;
    uint64_t v23 = v22;
    __int16 v24 = [MEMORY[0x1E4F64710] sharedService];
    long long v25 = objc_msgSend(v24, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", 0, v8, v19, v21);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__MNRouteEditor__addressForRoute_traits_handler___block_invoke;
    v26[3] = &unk_1E60F6350;
    double v28 = v19;
    double v29 = v21;
    double v30 = v19;
    double v31 = v21;
    uint64_t v32 = v23;
    id v27 = v10;
    [v25 submitWithHandler:v26 networkActivity:0];

    goto LABEL_13;
  }
  if (v14 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v34 = v14;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Requesting route geometry with %d anchor points.", buf, 8u);
    }
    goto LABEL_11;
  }

  __int16 v15 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Skipping address lookup.", buf, 2u);
  }

  v10[2](v10, 0, 0);
LABEL_13:
}

void __49__MNRouteEditor__addressForRoute_traits_handler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  id v7 = (void *)v6;
  if (v5 || !v6)
  {
    id v8 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[5];
      uint64_t v10 = a1[8];
      int v13 = 134218498;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "Error resolving address for point: %f, %f\n%@", (uint8_t *)&v13, 0x20u);
    }
  }
  uint64_t v11 = a1[4];
  id v12 = [v7 addressObject];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v5);
}

+ (void)_fetchWaypointsFromRouteGeometry:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    double v31 = v10;
    uint64_t v11 = dispatch_group_create();
    *(void *)buf = 0;
    v59 = buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    uint64_t v62 = __Block_byref_object_dispose_;
    id v63 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy_;
    v56[4] = __Block_byref_object_dispose_;
    id v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy_;
    v54[4] = __Block_byref_object_dispose_;
    id v55 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy_;
    void v52[4] = __Block_byref_object_dispose_;
    id v53 = 0;
    dispatch_group_enter(v11);
    id v12 = objc_alloc(MEMORY[0x1E4F64660]);
    [v8 pointAt:0];
    int v13 = objc_msgSend(v12, "initWithGEOCoordinate:");
    uint64_t v14 = (void *)MEMORY[0x1E4F644F0];
    __int16 v15 = [v9 traits];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke;
    v47[3] = &unk_1E60F6378;
    uint64_t v50 = buf;
    id v16 = v13;
    id v48 = v16;
    id v51 = v52;
    __int16 v17 = v11;
    v49 = v17;
    id v18 = (id)[v14 composedWaypointForLocation:v16 mapItem:0 traits:v15 completionHandler:v47 networkActivityHandler:0];

    dispatch_group_enter(v17);
    id v19 = objc_alloc(MEMORY[0x1E4F64660]);
    objc_msgSend(v8, "pointAt:", objc_msgSend(v8, "pointCount") - 1);
    double v20 = objc_msgSend(v19, "initWithGEOCoordinate:");
    double v21 = (void *)MEMORY[0x1E4F644F0];
    uint64_t v22 = [v9 traits];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_149;
    v42[3] = &unk_1E60F6378;
    id v45 = v56;
    id v23 = v20;
    id v43 = v23;
    id v46 = v52;
    __int16 v24 = v17;
    id v44 = v24;
    id v25 = (id)[v21 composedWaypointForLocation:v23 mapItem:0 traits:v22 completionHandler:v42 networkActivityHandler:0];

    dispatch_group_enter(v24);
    uint64_t v26 = [v9 currentRoute];
    id v27 = [v9 traits];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_150;
    v38[3] = &unk_1E60F63A0;
    id v40 = v54;
    id v41 = v52;
    double v28 = v24;
    id v39 = v28;
    [a1 _addressForRoute:v26 traits:v27 handler:v38];

    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_151;
    block[3] = &unk_1E60F63C8;
    uint64_t v35 = v56;
    id v36 = v54;
    id v37 = v52;
    unsigned int v34 = buf;
    id v33 = v31;
    id v30 = v31;
    dispatch_group_notify(v28, global_queue, block);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(v54, 8);

    _Block_object_dispose(v56, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != nil", buf, 2u);
    }
    __break(1u);
  }
}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for origin.", (uint8_t *)&v20, 2u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) latLng];
      [v10 lat];
      uint64_t v12 = v11;
      int v13 = [*(id *)(a1 + 32) latLng];
      [v13 lng];
      int v20 = 134284035;
      uint64_t v21 = v12;
      __int16 v22 = 2049;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error resolving origin for location: %{private}f, %{private}f\n%{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v18 = *(void **)(v15 + 40);
  id v16 = (id *)(v15 + 40);
  __int16 v17 = v18;
  if (v18) {
    id v19 = v17;
  }
  else {
    id v19 = v7;
  }
  objc_storeStrong(v16, v19);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for destination.", (uint8_t *)&v20, 2u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) latLng];
      [v10 lat];
      uint64_t v12 = v11;
      int v13 = [*(id *)(a1 + 32) latLng];
      [v13 lng];
      int v20 = 134284035;
      uint64_t v21 = v12;
      __int16 v22 = 2049;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error resolving destination for location: %{private}f, %{private}f\n%{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v18 = *(void **)(v15 + 40);
  id v16 = (id *)(v15 + 40);
  __int16 v17 = v18;
  if (v18) {
    id v19 = v17;
  }
  else {
    id v19 = v7;
  }
  objc_storeStrong(v16, v19);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got address.", (uint8_t *)&v16, 2u);
    }

    id v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = v5;
LABEL_10:
    id v14 = v10;
    uint64_t v15 = *v9;
    NSObject *v9 = v14;

    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v11 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      __int16 v17 = v7;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Error resolving address for anchor points: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    int v13 = *(void **)(v12 + 40);
    id v9 = (void **)(v12 + 40);
    id v10 = v13;
    if (!v13) {
      id v10 = v7;
    }
    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_151(void *a1)
{
  return +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:*(void *)(*(void *)(a1[5] + 8) + 40) destination:*(void *)(*(void *)(a1[6] + 8) + 40) address:*(void *)(*(void *)(a1[7] + 8) + 40) error:*(void *)(*(void *)(a1[8] + 8) + 40) finishedHandler:a1[4]];
}

+ (void)_convertAnchorPointsToWaypoints:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = v10;
    if ((unint64_t)[v8 count] > 1)
    {
      uint64_t v12 = dispatch_group_create();
      *(void *)buf = 0;
      id v57 = buf;
      uint64_t v58 = 0x3032000000;
      v59 = __Block_byref_object_copy_;
      uint64_t v60 = __Block_byref_object_dispose_;
      id v61 = 0;
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x3032000000;
      v54[3] = __Block_byref_object_copy_;
      v54[4] = __Block_byref_object_dispose_;
      id v55 = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = __Block_byref_object_copy_;
      void v52[4] = __Block_byref_object_dispose_;
      id v53 = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy_;
      v50[4] = __Block_byref_object_dispose_;
      id v51 = 0;
      dispatch_group_enter(v12);
      int v13 = [v8 firstObject];
      id v14 = [v9 traits];
      uint64_t v15 = [v9 clientAttributes];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke;
      v45[3] = &unk_1E60F6378;
      id v48 = buf;
      id v16 = v8;
      id v46 = v16;
      v49 = v50;
      __int16 v17 = v12;
      id v47 = v17;
      [a1 _waypointForAnchorPoint:v13 traits:v14 clientAttributes:v15 handler:v45];

      dispatch_group_enter(v17);
      uint64_t v18 = [v16 lastObject];
      id v19 = [v9 traits];
      int v20 = [v9 clientAttributes];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_152;
      v40[3] = &unk_1E60F6378;
      id v43 = v54;
      id v21 = v16;
      id v41 = v21;
      id v44 = v50;
      __int16 v22 = v17;
      id v42 = v22;
      [a1 _waypointForAnchorPoint:v18 traits:v19 clientAttributes:v20 handler:v40];

      dispatch_group_enter(v22);
      uint64_t v23 = [v9 currentRoute];
      __int16 v24 = [v9 traits];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_153;
      v36[3] = &unk_1E60F63A0;
      id v38 = v52;
      id v39 = v50;
      id v25 = v22;
      id v37 = v25;
      [a1 _addressForRoute:v23 traits:v24 handler:v36];

      global_queue = geo_get_global_queue();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_154;
      v30[3] = &unk_1E60F63C8;
      id v33 = v54;
      unsigned int v34 = v52;
      uint64_t v35 = v50;
      id v31 = v11;
      uint64_t v32 = buf;
      id v27 = v11;
      dispatch_group_notify(v25, global_queue, v30);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);

      _Block_object_dispose(v54, 8);
      _Block_object_dispose(buf, 8);

      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      double v28 = MEMORY[0x1E4F14500];
      double v29 = "Assertion failed: anchorPoints.count >= 2";
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    double v28 = MEMORY[0x1E4F14500];
    double v29 = "Assertion failed: finishedHandler != nil";
LABEL_8:
    _os_log_fault_impl(&dword_1B542B000, v28, OS_LOG_TYPE_FAULT, v29, buf, 2u);
  }
  __break(1u);
}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for origin.", (uint8_t *)&v16, 2u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) firstObject];
      int v16 = 138412546;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error resolving origin for anchor point: %@\n%@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v11 + 40);
  uint64_t v12 = (id *)(v11 + 40);
  int v13 = v14;
  if (v14) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v7;
  }
  objc_storeStrong(v12, v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for destination.", (uint8_t *)&v16, 2u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) lastObject];
      int v16 = 138412546;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "Error resolving destination for anchor point: %@\n%@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v11 + 40);
  uint64_t v12 = (id *)(v11 + 40);
  int v13 = v14;
  if (v14) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v7;
  }
  objc_storeStrong(v12, v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got address.", (uint8_t *)&v16, 2u);
    }

    id v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = v5;
LABEL_10:
    id v14 = v10;
    uint64_t v15 = *v9;
    NSObject *v9 = v14;

    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v11 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      __int16 v17 = v7;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Error resolving address for anchor points: %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    int v13 = *(void **)(v12 + 40);
    id v9 = (void **)(v12 + 40);
    id v10 = v13;
    if (!v13) {
      id v10 = v7;
    }
    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_154(void *a1)
{
  return +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:*(void *)(*(void *)(a1[5] + 8) + 40) destination:*(void *)(*(void *)(a1[6] + 8) + 40) address:*(void *)(*(void *)(a1[7] + 8) + 40) error:*(void *)(*(void *)(a1[8] + 8) + 40) finishedHandler:a1[4]];
}

+ (void)_handleWaypointStepFinishedWithOrigin:(id)a3 destination:(id)a4 address:(id)a5 error:(id)a6 finishedHandler:(id)a7
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *, uint64_t))a7;
  int v16 = objc_opt_new();
  __int16 v17 = MNGetMNRouteEditorLog();
  uint64_t v18 = v17;
  if (v11 && v12)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfully got waypoints.", (uint8_t *)&v22, 2u);
    }

    v24[0] = v11;
    v24[1] = v12;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    [v16 setWaypoints:v19];

    if (v13)
    {
      uint64_t v20 = MNGetMNRouteEditorLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfully got address.", (uint8_t *)&v22, 2u);
      }

      [v16 setAddress:v13];
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v14;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "convertToNavigableRoute: Error getting origin or destination: %@", (uint8_t *)&v22, 0xCu);
    }

    if (!v14)
    {
      id v21 = MNGetMNRouteEditorLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_FAULT, "Unable to resolve waypoints and no error was found.", (uint8_t *)&v22, 2u);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:", 3);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v16 setStepError:v14];
  }
  v15[2](v15, v16, 1);
}

+ (void)_requestFinalizedRouteWithWaypoints:(id)a3 address:(id)a4 routeEditorRequest:(id)a5 finishedHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v24 = MEMORY[0x1E4F14500];
    id v25 = "Assertion failed: finishedHandler != nil";
LABEL_16:
    _os_log_fault_impl(&dword_1B542B000, v24, OS_LOG_TYPE_FAULT, v25, buf, 2u);
    goto LABEL_17;
  }
  id v13 = v12;
  if ([v9 count] != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v24 = MEMORY[0x1E4F14500];
    id v25 = "Assertion failed: waypoints.count == 2";
    goto LABEL_16;
  }
  id v14 = [v11 currentRoute];
  uint64_t v15 = [v11 routeAttributes];
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v24 = MEMORY[0x1E4F14500];
    id v25 = "Assertion failed: routeGeometry != nil";
    goto LABEL_16;
  }
  int v16 = (void *)v15;
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v24 = MEMORY[0x1E4F14500];
      id v25 = "Assertion failed: routeAttributes != nil";
      goto LABEL_16;
    }
LABEL_17:
    __break(1u);
    return;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F64548]);
  [v17 setRequestType:3];
  [v17 setWaypoints:v9];
  objc_msgSend(v17, "setTransportType:", objc_msgSend(v14, "transportType"));
  [v17 setMaxRouteCount:1];
  [v17 setRouteAttributes:v16];
  uint64_t v18 = [v11 commonOptions];
  [v17 setCommonOptions:v18];

  [v17 setCurrentRoute:v14];
  id v19 = [v11 traits];
  [v17 setTraits:v19];

  uint64_t v20 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Getting finalized route.", buf, 2u);
  }

  id v21 = [MEMORY[0x1E4F64540] sharedService];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__MNRouteEditor__requestFinalizedRouteWithWaypoints_address_routeEditorRequest_finishedHandler___block_invoke;
  v26[3] = &unk_1E60F63F0;
  id v27 = v13;
  id v22 = v13;
  id v23 = (id)[v21 requestRoutes:v17 handler:v26];
}

void __96__MNRouteEditor__requestFinalizedRouteWithWaypoints_address_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a2 firstObject];
  id v10 = objc_opt_new();
  if (!v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, @"MNRouteEditorRequest got an unknown error when trying to convert to navigable route.", 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7) {
        goto LABEL_11;
      }
    }
    goto LABEL_8;
  }
  id v11 = MNGetMNRouteEditorLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfuly got route.", (uint8_t *)&v13, 2u);
  }

  [v10 setFinalizedRoute:v9];
  if (v7)
  {
LABEL_8:
    id v12 = MNGetMNRouteEditorLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "convertToNavigableRoute: Error getting finalized route: %@", (uint8_t *)&v13, 0xCu);
    }

    [v10 setStepError:v7];
  }
LABEL_11:
  [v10 setDirectionsError:v8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end