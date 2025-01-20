@interface RAPGraphDirectionsRecorder
- (BOOL)_bucketHasOnlyMissedStep:(id)a3;
- (BOOL)_bucketHasOnlyStoredSteps:(id)a3;
- (BOOL)isRecording;
- (GEOComposedRoute)observedRoute;
- (GEORouteMatch)lastGoodLocation;
- (NSUUID)historyItemIdentifier;
- (RAPGraphDirectionsRecorder)init;
- (id)_userPathEntryWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4;
- (id)_userSearchInputForWaypoint:(id)a3;
- (id)copyCurrentPartialRecording;
- (void)_dispatch:(id)a3;
- (void)_handleNewRoute:(id)a3 fromStepIndex:(unint64_t)a4;
- (void)_immediatelyUpdateRecording:(id)a3 withAuxiliaryControlsRecording:(id)a4;
- (void)_optimizeRecordingData;
- (void)_replaceUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4 traversal:(int)a5;
- (void)_savePartialRecording;
- (void)_storeUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4;
- (void)_updateRideSelectionsWithComposedRoute:(id)a3;
- (void)clearAll;
- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)dealloc;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationServiceWillReroute:(id)a3;
- (void)recordNewRequest:(id)a3;
- (void)recordNewResponse:(id)a3;
- (void)recordNewRoute:(id)a3;
- (void)recordNewRoute:(id)a3 fromStepIndex:(unint64_t)a4;
- (void)recordNewSessionID:(GEOSessionID)a3;
- (void)recordWaypoints:(id)a3 startWaypointSearchTicket:(id)a4 endWaypointSearchTicket:(id)a5;
- (void)savePartialRecordingWithCompletion:(id)a3;
- (void)setHistoryItemIdentifier:(id)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setLastGoodLocation:(id)a3;
- (void)setObservedRoute:(id)a3;
- (void)setOriginatingDeviceFromOrigin:(int64_t)a3;
- (void)setSelectedRoute:(id)a3 fromRouteList:(id)a4;
- (void)startRecording;
- (void)stopRecording;
- (void)updateRideSelectionsWithComposedRoute:(id)a3;
@end

@implementation RAPGraphDirectionsRecorder

- (RAPGraphDirectionsRecorder)init
{
  v8.receiver = self;
  v8.super_class = (Class)RAPGraphDirectionsRecorder;
  v2 = [(RAPGraphDirectionsRecorder *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.RAPDirectionsRecorder", v3);
    recordingQueue = v2->_recordingQueue;
    v2->_recordingQueue = (OS_dispatch_queue *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_savePartialRecording" name:UIApplicationWillResignActiveNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  if ([(RAPGraphDirectionsRecorder *)self isRecording]) {
    [(RAPGraphDirectionsRecorder *)self stopRecording];
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RAPGraphDirectionsRecorder;
  [(RAPGraphDirectionsRecorder *)&v4 dealloc];
}

- (void)startRecording
{
  v3 = objc_alloc_init(RAPDirectionsRecording);
  recording = self->_recording;
  self->_recording = v3;

  [(RAPGraphDirectionsRecorder *)self setIsRecording:1];
  v5 = objc_alloc_init(RAPAuxiliaryControlsRecorder);
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  self->_auxiliaryControlsRecorder = v5;

  [(RAPAuxiliaryControlsRecorder *)self->_auxiliaryControlsRecorder start];
  if (self->_hasAuxiliaryControlsOrigin) {
    [(RAPAuxiliaryControlsRecorder *)self->_auxiliaryControlsRecorder setOriginatingDeviceFromOrigin:self->_auxiliaryControlsOrigin];
  }
  id v7 = +[MNNavigationService sharedService];
  [v7 registerObserver:self];
}

- (id)copyCurrentPartialRecording
{
  if (![(RAPGraphDirectionsRecorder *)self isRecording]) {
    return 0;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100103D8C;
  v23 = sub_100104750;
  id v24 = 0;
  recordingQueue = self->_recordingQueue;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1005CE070;
  v16 = &unk_1012E73F0;
  v17 = self;
  v18 = &v19;
  objc_super v4 = recordingQueue;
  v5 = &v13;
  label = dispatch_queue_get_label(v4);
  id v7 = dispatch_queue_get_label(0);
  if (label == v7 || label && v7 && !strcmp(label, v7))
  {
    v15((uint64_t)v5);
  }
  else
  {
    dispatch_sync(v4, v5);
  }

  uint64_t v10 = v20[5];
  v11 = [(RAPAuxiliaryControlsRecorder *)self->_auxiliaryControlsRecorder copyCurrentPartialRecording];
  [(RAPGraphDirectionsRecorder *)self _immediatelyUpdateRecording:v10 withAuxiliaryControlsRecording:v11];

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)_immediatelyUpdateRecording:(id)a3 withAuxiliaryControlsRecording:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 auxiliaryControls];
    id v8 = [v7 mutableCopy];
    [v9 setAuxiliaryControls:v8];

    if ([v6 hasOriginatingAuxiliaryControlIndex]) {
      [v9 setOriginatingAuxiliaryControlIndex:[v6 originatingAuxiliaryControlIndex]];
    }
    else {
      [v9 setHasOriginatingAuxiliaryControlIndex:0];
    }
  }
}

- (void)setOriginatingDeviceFromOrigin:(int64_t)a3
{
  self->_auxiliaryControlsOrigin = a3;
  self->_hasAuxiliaryControlsOrigin = 1;
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  if (auxiliaryControlsRecorder) {
    -[RAPAuxiliaryControlsRecorder setOriginatingDeviceFromOrigin:](auxiliaryControlsRecorder, "setOriginatingDeviceFromOrigin:");
  }
}

- (void)_savePartialRecording
{
}

- (void)savePartialRecordingWithCompletion:(id)a3
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1005CE3E0;
  v25[3] = &unk_1012F0C00;
  id v4 = a3;
  id v26 = v4;
  id v5 = objc_retainBlock(v25);
  if (![(RAPGraphDirectionsRecorder *)self isRecording])
  {
    CFStringRef v16 = @"not recording";
LABEL_10:
    uint64_t v10 = +[NSError GEOErrorWithCode:-13 reason:v16];
    ((void (*)(void *, void, RAPAuxiliaryControlsRecording *))v5[2])(v5, 0, v10);
    goto LABEL_13;
  }
  v6 = [(RAPGraphDirectionsRecorder *)self historyItemIdentifier];

  if (!v6)
  {
    CFStringRef v16 = @"historyItemIdentifier wasn't set when trying to save partial recording";
    goto LABEL_10;
  }
  id v7 = [(RAPAuxiliaryControlsRecorder *)self->_auxiliaryControlsRecorder copyCurrentPartialRecording];
  id v8 = +[RAPStorageHistoryContainer directionsRecordingStorage];
  recordingQueue = self->_recordingQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  uint64_t v19 = sub_1005CE4D0;
  v20 = &unk_1012ED778;
  uint64_t v21 = self;
  uint64_t v10 = v7;
  v22 = v10;
  id v11 = v8;
  id v23 = v11;
  id v24 = v5;
  id v12 = recordingQueue;
  v13 = v18;
  label = dispatch_queue_get_label(v12);
  v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && !strcmp(label, v15))
  {
    v19((uint64_t)v13);
  }
  else
  {
    dispatch_sync(v12, v13);
  }

LABEL_13:
}

- (void)stopRecording
{
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  [(RAPGraphDirectionsRecorder *)self _savePartialRecording];
  [(RAPAuxiliaryControlsRecorder *)self->_auxiliaryControlsRecorder stop];
  auxiliaryControlsRecorder = self->_auxiliaryControlsRecorder;
  self->_auxiliaryControlsRecorder = 0;

  [(RAPGraphDirectionsRecorder *)self setIsRecording:0];
}

- (void)_optimizeRecordingData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v54 = [(RAPDirectionsRecording *)self->_recording directionsResponses];
  if ([v54 count] == (id)1)
  {
  }
  else
  {
    v3 = [(RAPDirectionsRecording *)self->_recording userPaths];
    id v4 = [v3 count];

    if (v4)
    {
      v52 = self;
      unint64_t v5 = [(RAPDirectionsRecording *)self->_recording directionsResponsesCount];
      id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
      if (v5)
      {
        unint64_t v7 = v5;
        do
        {
          id v8 = +[NSMutableArray array];
          [v6 addObject:v8];

          --v7;
        }
        while (v7);
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v9 = [(RAPDirectionsRecording *)v52->_recording userPaths];
      id v10 = [v9 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v69;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v69 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if (v5 <= [v14 routeIndex])
            {
              v15 = sub_10057670C();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                unsigned int v16 = [v14 routeIndex];
                *(_DWORD *)buf = 67109120;
                LODWORD(v75) = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Route index: %u out of bounds for RAP user path entry.", buf, 8u);
              }
            }
            else
            {
              v15 = [v6 objectAtIndexedSubscript:[v14 routeIndex]];
              [v15 addObject:v14];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v68 objects:v77 count:16];
        }
        while (v11);
      }

      v50 = objc_opt_new();
      v17 = v52;
      v49 = objc_opt_new();
      v18 = +[NSMutableArray array];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v19 = v6;
      id v53 = [v19 countByEnumeratingWithState:&v64 objects:v76 count:16];
      if (v53)
      {
        v20 = 0;
        uint64_t v51 = *(void *)v65;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v65 != v51) {
              objc_enumerationMutation(v19);
            }
            v22 = *(void **)(*((void *)&v64 + 1) + 8 * v21);
            uint64_t v55 = v21;
            if ([(RAPGraphDirectionsRecorder *)v17 _bucketHasOnlyStoredSteps:v22]
              || [(RAPGraphDirectionsRecorder *)v17 _bucketHasOnlyMissedStep:v22])
            {
              id v23 = sub_10057670C();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v75 = v20;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Removing route #%lu", buf, 0xCu);
              }

              id v24 = sub_10057670C();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = [(RAPDirectionsRecording *)v17->_recording directionsRequests];
                id v26 = [v25 objectAtIndexedSubscript:v20];
                *(_DWORD *)buf = 134217984;
                v75 = v26;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "\t Request: %p", buf, 0xCu);
              }
              [v50 addIndex:v20];
              v27 = sub_10057670C();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v28 = [(RAPDirectionsRecording *)v17->_recording directionsResponses];
                v29 = [v28 objectAtIndexedSubscript:v20];
                *(_DWORD *)buf = 134217984;
                v75 = v29;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "\tResponse: %p", buf, 0xCu);
              }
              [v49 addIndex:v20];
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              id v30 = v22;
              id v31 = [v30 countByEnumeratingWithState:&v60 objects:v73 count:16];
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = *(void *)v61;
                do
                {
                  for (j = 0; j != v32; j = (char *)j + 1)
                  {
                    if (*(void *)v61 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    [v18 addObject:*(void *)(*((void *)&v60 + 1) + 8 * (void)j)];
                  }
                  id v32 = [v30 countByEnumeratingWithState:&v60 objects:v73 count:16];
                }
                while (v32);
              }

              for (unint64_t k = (unint64_t)(v20 + 1); k < v5; ++k)
              {
                v36 = [v19 objectAtIndexedSubscript:k];
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                id v37 = [v36 countByEnumeratingWithState:&v56 objects:v72 count:16];
                if (v37)
                {
                  id v38 = v37;
                  uint64_t v39 = *(void *)v57;
                  do
                  {
                    for (m = 0; m != v38; m = (char *)m + 1)
                    {
                      if (*(void *)v57 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      [*(id *)(*((void *)&v56 + 1) + 8 * (void)m) setRouteIndex:[*(id *)(*((void *)&v56 + 1) + 8 * (void)m) routeIndex] - 1];
                    }
                    id v38 = [v36 countByEnumeratingWithState:&v56 objects:v72 count:16];
                  }
                  while (v38);
                }
              }
            }
            else
            {
              v41 = (char *)[v22 count];
              v42 = v41 - 1;
              if (v41 != (char *)1)
              {
                while (1)
                {
                  v43 = [v22 objectAtIndexedSubscript:v42];
                  if ([v43 traversal]) {
                    break;
                  }
                  [v18 addObject:v43];

                  if (!--v42) {
                    goto LABEL_55;
                  }
                }
              }
            }
LABEL_55:
            ++v20;
            uint64_t v21 = v55 + 1;
            v17 = v52;
          }
          while ((id)(v55 + 1) != v53);
          id v53 = [v19 countByEnumeratingWithState:&v64 objects:v76 count:16];
        }
        while (v53);
      }

      v44 = [(RAPDirectionsRecording *)v17->_recording directionsRequests];
      [v44 removeObjectsAtIndexes:v50];

      v45 = [(RAPDirectionsRecording *)v17->_recording directionsResponses];
      [v45 removeObjectsAtIndexes:v49];

      v46 = [(RAPDirectionsRecording *)v17->_recording userPaths];
      [v46 removeObjectsInArray:v18];

      v17->_numRecordedRoutes = [(RAPDirectionsRecording *)v17->_recording directionsResponsesCount];
      v47 = sub_10057670C();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        numRecordedRoutes = (char *)v17->_numRecordedRoutes;
        *(_DWORD *)buf = 134217984;
        v75 = numRecordedRoutes;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "_optimizeRecordingData _numRecordedRoutes %lu", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_bucketHasOnlyStoredSteps:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "traversal", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_bucketHasOnlyMissedStep:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        BOOL v8 = v5;
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "traversal", (void)v11) == 2
          && (![v9 stepIndex] || v8 && !objc_msgSend(v8, "traversal")))
        {
          LOBYTE(v4) = 1;
          goto LABEL_14;
        }
        id v5 = v9;
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    BOOL v8 = v5;
LABEL_14:
  }
  return (char)v4;
}

- (void)setSelectedRoute:(id)a3 fromRouteList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 transportType] == 1;
  [(RAPGraphDirectionsRecorder *)self setObservedRoute:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005CF0DC;
  v11[3] = &unk_1012E8138;
  BOOL v15 = v8;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(RAPGraphDirectionsRecorder *)self _dispatch:v11];
}

- (void)_updateRideSelectionsWithComposedRoute:(id)a3
{
  id v4 = a3;
  id v5 = [v4 rideSelectionsAsNSData];
  id v6 = [v5 bytes];

  id v7 = [v4 rideSelections];

  id v8 = [v7 count];
  recording = self->_recording;

  [(RAPDirectionsRecording *)recording setClusteredRouteRideSelections:v6 count:v8];
}

- (void)updateRideSelectionsWithComposedRoute:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005CF3DC;
  v4[3] = &unk_1012E5D58;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RAPGraphDirectionsRecorder *)v5 _dispatch:v4];
}

- (id)_userSearchInputForWaypoint:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(RAPUserSearchInput);
  id v5 = [v3 requestSearchString];
  [(RAPUserSearchInput *)v4 setSearchString:v5];

  id v6 = [v3 requestAddress];

  if (v6)
  {
    id v7 = [v3 requestAddress];
    id v8 = [v7 singleLineAddress];
    [(RAPUserSearchInput *)v4 setSingleLineAddressString:v8];
  }
  id v9 = [v3 requestSearch];
  id v10 = [v9 mapItem];

  long long v11 = [v10 _geoMapItem];

  if (v11)
  {
    id v12 = [v10 _geoMapItemStorageForPersistence];
    [(RAPUserSearchInput *)v4 setPlaceMapItemStorage:v12];
  }
  long long v13 = [v3 completion];
  id v14 = [v13 copyStorage];
  [(RAPUserSearchInput *)v4 setCompletionStorage:v14];

  BOOL v15 = [v3 requestSearch];
  unsigned int v16 = v15;
  if (v15)
  {
    unsigned int v17 = [v15 type];
    if (v17 == 3) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2 * (v17 == 4);
    }
    [(RAPUserSearchInput *)v4 setOrigin:v18];
    id v19 = objc_alloc_init((Class)GEOLatLng);
    [v16 coordinate];
    [v19 setLat:];
    [v16 coordinate];
    [v19 setLng:v20];
    [(RAPUserSearchInput *)v4 setCoordinate:v19];
    uint64_t v21 = [v16 findMyHandle];

    if (v21)
    {
      v22 = [v16 findMyHandle];
      id v23 = [v22 identifier];
      [(RAPUserSearchInput *)v4 setFindMyHandleID:v23];
    }
  }

  return v4;
}

- (void)recordWaypoints:(id)a3 startWaypointSearchTicket:(id)a4 endWaypointSearchTicket:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005CF73C;
  v17[3] = &unk_1012F1598;
  v17[4] = self;
  sub_100099700(a3, v17);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005CF7B8;
  v13[3] = &unk_1012E85E0;
  v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  [(RAPGraphDirectionsRecorder *)self _dispatch:v13];
}

- (void)recordNewRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1005CF958;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    [(RAPGraphDirectionsRecorder *)self _dispatch:v6];
  }
}

- (void)recordNewResponse:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1005CFAA8;
    v6[3] = &unk_1012E5D58;
    v6[4] = self;
    id v7 = v4;
    [(RAPGraphDirectionsRecorder *)self _dispatch:v6];
  }
}

- (void)recordNewRoute:(id)a3
{
}

- (void)recordNewRoute:(id)a3 fromStepIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 geoWaypointRoute];

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1005CFC40;
    v8[3] = &unk_1012EA9E0;
    v8[4] = self;
    id v9 = v6;
    unint64_t v10 = a4;
    [(RAPGraphDirectionsRecorder *)self _dispatch:v8];
  }
}

- (void)clearAll
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1005CFDF0;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  [(RAPGraphDirectionsRecorder *)self _dispatch:v2];
}

- (void)recordNewSessionID:(GEOSessionID)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005CFF3C;
  v3[3] = &unk_1012E8160;
  v3[4] = self;
  GEOSessionID v4 = a3;
  [(RAPGraphDirectionsRecorder *)self _dispatch:v3];
}

- (void)_dispatch:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  recordingQueue = self->_recordingQueue;
  if (recordingQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005CFFE8;
    block[3] = &unk_1012E6EA8;
    id v8 = v4;
    dispatch_async(recordingQueue, block);
  }
}

- (void)setObservedRoute:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedRoute);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_observedRoute);
    [v5 unregisterObserver:self];

    id v6 = objc_storeWeak((id *)&self->_observedRoute, obj);
    [obj registerObserver:self];
  }
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v9 = a3;
  id v7 = [(RAPGraphDirectionsRecorder *)self observedRoute];

  id v8 = v9;
  if (v7 == v9)
  {
    [(RAPGraphDirectionsRecorder *)self updateRideSelectionsWithComposedRoute:v9];
    id v8 = v9;
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 routeMatch];
  if (v8)
  {
    id v9 = (void *)v8;
    unint64_t v10 = [v7 routeMatch];
    unsigned int v11 = [v10 isGoodMatch];

    if (v11)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1005D0280;
      v13[3] = &unk_1012E5D58;
      v13[4] = self;
      id v14 = v7;
      [(RAPGraphDirectionsRecorder *)self _dispatch:v13];
    }
  }
  if (self->_switchedTransportTypeWaitingForLocation)
  {
    self->_switchedTransportTypeWaitingForLocation = 0;
    id v12 = [v6 route];
    -[RAPGraphDirectionsRecorder _handleNewRoute:fromStepIndex:](self, "_handleNewRoute:fromStepIndex:", v12, [v7 stepIndex]);
  }
}

- (void)setLastGoodLocation:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  p_lastGoodLocation = &self->_lastGoodLocation;
  objc_storeStrong((id *)p_lastGoodLocation, a3);
  id v7 = sub_10057670C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(GEORouteMatch *)*p_lastGoodLocation stepIndex];
    int v9 = 134217984;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Changing last good location:\tcurr step: %lu\n", (uint8_t *)&v9, 0xCu);
  }
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  if (a4 <= 0x7FFFFFFFFFFFFFFELL && self->_numRecordedRoutes != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1005D0438;
    v6[3] = &unk_1012E8160;
    v6[4] = self;
    void v6[5] = a4;
    v6[6] = a5;
    [(RAPGraphDirectionsRecorder *)self _dispatch:v6];
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005D05B0;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(RAPGraphDirectionsRecorder *)self _dispatch:v3];
}

- (void)_storeUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4
{
  id v7 = objc_alloc_init(RAPUserPathEntry);
  [(RAPUserPathEntry *)v7 setRouteIndex:a3];
  [(RAPUserPathEntry *)v7 setStepIndex:a4];
  [(RAPUserPathEntry *)v7 setTraversal:0];
  id v8 = sub_10057670C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(RAPUserPathEntry *)v7 routeIndex];
    uint64_t v10 = [(RAPUserPathEntry *)v7 stepIndex];
    id v11 = (id)[(RAPUserPathEntry *)v7 traversal];
    if (v11 >= 3)
    {
      id v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
    }
    else
    {
      id v12 = off_1012F15B8[(int)v11];
    }
    *(_DWORD *)buf = 134218754;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    double v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "\nStoring path entry %p:\n\trte: %lu\n\tstp: %lu\n\ttrv: %@\n", buf, 0x2Au);
  }
  [(RAPDirectionsRecording *)self->_recording addUserPath:v7];
}

- (void)_replaceUserPathWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4 traversal:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = [(RAPGraphDirectionsRecorder *)self _userPathEntryWithRouteIndex:a3 stepIndex:a4];
  id v8 = v7;
  if (v7)
  {
    [v7 setTraversal:v5];
    if ([v8 traversal] == 2)
    {
      id v9 = objc_alloc((Class)GEOLatLng);
      [(GEORouteMatch *)self->_lastGoodLocation locationCoordinate3D];
      double v11 = v10;
      [(GEORouteMatch *)self->_lastGoodLocation locationCoordinate3D];
      id v12 = [v9 initWithLatitude:v11];
      [v8 setRerouteLocation:v12];

      [(GEORouteMatch *)self->_lastGoodLocation locationCoordinate3D];
      double v14 = v13;
      __int16 v15 = [v8 rerouteLocation];
      [v15 setElevationM:v14];
    }
    uint64_t v16 = sub_10057670C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v8 routeIndex];
      uint64_t v18 = [v8 stepIndex];
      id v19 = [v8 traversal];
      if (v19 >= 3)
      {
        double v20 = +[NSString stringWithFormat:@"(unknown: %i)", v19];
      }
      else
      {
        double v20 = off_1012F15B8[(int)v19];
      }
      *(_DWORD *)buf = 134218754;
      v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "\nReplaced path entry %p:\n\trte: %lu\n\tstp: %lu\n\ttrv: %@\n", buf, 0x2Au);
    }
  }
}

- (id)_userPathEntryWithRouteIndex:(unint64_t)a3 stepIndex:(unint64_t)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(RAPDirectionsRecording *)self->_recording userPaths];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 routeIndex] == a3 && objc_msgSend(v11, "stepIndex") == a4)
        {
          id v12 = v11;
          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (void)_handleNewRoute:(id)a3 fromStepIndex:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [v10 routeInitializerData];
  id v7 = [v6 directionsRequest];
  [(RAPGraphDirectionsRecorder *)self recordNewRequest:v7];

  id v8 = [v10 routeInitializerData];
  uint64_t v9 = [v8 directionsResponse];
  [(RAPGraphDirectionsRecorder *)self recordNewResponse:v9];

  [(RAPGraphDirectionsRecorder *)self recordNewRoute:v10 fromStepIndex:a4];
  [(RAPGraphDirectionsRecorder *)self setObservedRoute:v10];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  id v7 = sub_10057670C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did reroute", v8, 2u);
  }

  [(RAPGraphDirectionsRecorder *)self _handleNewRoute:v6 fromStepIndex:0];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v7 = sub_10057670C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didSwitchToNewTransportType", v8, 2u);
  }

  self->_switchedTransportTypeWaitingForLocation = 1;
}

- (NSUUID)historyItemIdentifier
{
  return self->_historyItemIdentifier;
}

- (void)setHistoryItemIdentifier:(id)a3
{
}

- (GEOComposedRoute)observedRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedRoute);

  return (GEOComposedRoute *)WeakRetained;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (GEORouteMatch)lastGoodLocation
{
  return self->_lastGoodLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGoodLocation, 0);
  objc_destroyWeak((id *)&self->_observedRoute);
  objc_storeStrong((id *)&self->_historyItemIdentifier, 0);
  objc_storeStrong((id *)&self->_recording, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsRecorder, 0);

  objc_storeStrong((id *)&self->_recordingQueue, 0);
}

@end