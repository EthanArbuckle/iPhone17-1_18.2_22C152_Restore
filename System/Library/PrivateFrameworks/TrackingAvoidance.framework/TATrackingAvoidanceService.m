@interface TATrackingAvoidanceService
+ (id)createRandomBytes:(unint64_t)a3;
- (BOOL)shouldPerformDetection;
- (NSDate)latestClassificationDate;
- (NSHashTable)observers;
- (TAOutgoingRequests)stagedIntervisitMetrics;
- (TASettings)settings;
- (TAStore)store;
- (TATrackingAvoidanceService)init;
- (TATrackingAvoidanceService)initWithSettings:(id)a3;
- (TATrackingAvoidanceService)initWithTASettings:(id)a3;
- (TATrackingAvoidanceServiceSettings)serviceSettings;
- (id)sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:(id)a3;
- (void)_performDetection;
- (void)_performUpdateIfNecessary:(id)a3;
- (void)addObserver:(id)a3;
- (void)bootstrapDeviceRecord:(id)a3;
- (void)bootstrapVisitState:(id)a3;
- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5;
- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5;
- (void)didRequestAIS:(id)a3;
- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4;
- (void)filterAndStageDetectionResults:(id)a3;
- (void)ingestTAEvent:(id)a3;
- (void)notifyObserversOfRequests:(id)a3;
- (void)notifyObserversOfStagedSuspiciousDevices:(id)a3;
- (void)notifyObserversOfSuspiciousDeviceUpdate:(id)a3;
- (void)notifyObserversOfSuspiciousDevices:(id)a3;
- (void)notifyObserversOfUnstagedSuspiciousDevices:(id)a3;
- (void)notifyObserversOfVisitStateChange;
- (void)removeObserver:(id)a3;
- (void)setLatestClassificationDate:(id)a3;
- (void)setObservers:(id)a3;
- (void)setServiceSettings:(id)a3;
- (void)setStagedIntervisitMetrics:(id)a3;
- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5;
- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4;
@end

@implementation TATrackingAvoidanceService

- (void)ingestTAEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      id v5 = v4;
      if ([v5 isPosh])
      {
        v6 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          v8 = [v5 descriptionDictionary];
          int v14 = 68289283;
          *(_DWORD *)v15 = 0;
          *(_WORD *)&v15[4] = 2082;
          *(void *)&v15[6] = "";
          __int16 v16 = 2113;
          v17 = v8;
          _os_log_impl(&dword_22345C000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService skip adv ff not enabled\", \"adv\":\"%{private}@\"}", (uint8_t *)&v14, 0x1Cu);
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = TAEventsLog;
    if (os_log_type_enabled((os_log_t)TAEventsLog, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      *(void *)v15 = v4;
      _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v14, 0xCu);
    }
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(TAStore *)self->_store addTAEvent:v4 andAppendOutgoingRequestsTo:v5];
    v10 = [(TATrackingAvoidanceService *)self sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:v5];
    if ([(TATrackingAvoidanceService *)self shouldPerformDetection])
    {
      v11 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_22345C000, v11, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService significant time elapsed, performing classification now", (uint8_t *)&v14, 2u);
      }
      [(TATrackingAvoidanceService *)self _performDetection];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TATrackingAvoidanceService *)self _performUpdateIfNecessary:v4];
    }
    v12 = [(TAStore *)self->_store deviceRecord];
    v13 = +[TAFilterKnownDevices removeMetricsFromKnownDevices:v10 deviceRecord:v12];

    [(TATrackingAvoidanceService *)self notifyObserversOfRequests:v13];
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TATrackingAvoidanceService ingestTAEvent:]();
  }
LABEL_20:
}

- (void)notifyObserversOfRequests:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v13 = v11;
            int v14 = [v12 description];
            *(_DWORD *)buf = 138477827;
            v32 = v14;
            _os_log_impl(&dword_22345C000, v13, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService requesting:%{private}@", buf, 0xCu);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v8);
    }

    v15 = [(NSHashTable *)self->_observers allObjects];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v22 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v20 trackingAvoidanceService:self requestingAdditionalInformation:v6];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    id v5 = v21;
  }
}

- (BOOL)shouldPerformDetection
{
  v3 = [(TAStore *)self->_store clock];
  [v3 timeIntervalSinceDate:self->_latestClassificationDate];
  double v5 = v4;

  [(TATrackingAvoidanceServiceSettings *)self->_serviceSettings classificationTimeInterval];
  return v5 > v6;
}

- (id)sendUnstagingUpdatesAndRemoveUnstagingUpdatesRequests:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = [MEMORY[0x263EFF980] array];
  double v5 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 key];
        int v13 = [v12 isEqualToString:@"UnstagingUpdate"];

        if (v13)
        {
          int v14 = [v11 additionalInformation];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"UnstagingUpdate"];
          uint64_t v16 = (void *)v15;
          if (v15) {
            uint64_t v17 = v15;
          }
          else {
            uint64_t v17 = MEMORY[0x263EFFA68];
          }
          [v5 addObjectsFromArray:v17];
        }
        else
        {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  [(TATrackingAvoidanceService *)self notifyObserversOfUnstagedSuspiciousDevices:v5];
  uint64_t v18 = (void *)[v4 copy];

  return v18;
}

- (void)notifyObserversOfUnstagedSuspiciousDevices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(NSHashTable *)self->_observers allObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 trackingAvoidanceService:self didUnstageSuspiciousDevices:v5];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_performUpdateIfNecessary:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(TAStore *)self->_store deviceRecord];
  id v6 = [v4 address];
  int v7 = [v5 hasSurfacedNotificationFor:v6];

  if (v7)
  {
    uint64_t v8 = [(TAStore *)self->_store eventBuffer];
    uint64_t v9 = [v8 getLatestElementOf:objc_opt_class()];

    if (v9)
    {
      uint64_t v10 = [v4 scanDate];
      v11 = [v9 timestamp];
      [v10 timeIntervalSinceDate:v11];
      double v13 = v12;

      long long v14 = [(TASettings *)self->_settings filterGeneralSettings];
      [v14 thresholdOfLocationRelevance];
      double v16 = v15;

      if (v13 <= v16)
      {
        uint64_t v18 = [TASuspiciousDevice alloc];
        v19 = [v4 getDate];
        uint64_t v26 = v9;
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
        long long v21 = [[TAMetricsDetection alloc] initWithDetectionType:0 visitDetectionMetrics:0 generalDetectionMetrics:0 singleVisitDetectionMetrics:0 latestAdvertisement:v4];
        long long v22 = [(TAStore *)self->_store deviceRecord];
        long long v23 = [v4 address];
        long long v24 = [v22 getAccessoryInfo:v23];
        long long v25 = [(TASuspiciousDevice *)v18 initWithLatestAdv:v4 detectionSummary:&unk_26D684398 date:v19 locHistory:v20 detectionMetrics:v21 detectionType:0 immediacyType:0 accessoryInfo:v24 forceSurfaceReason:0];

        [(TATrackingAvoidanceService *)self notifyObserversOfSuspiciousDeviceUpdate:v25];
      }
      else
      {
        uint64_t v17 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289539;
          int v28 = 0;
          __int16 v29 = 2082;
          v30 = "";
          __int16 v31 = 2113;
          id v32 = v4;
          __int16 v33 = 2113;
          uint64_t v34 = v9;
          _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService location too stale to update\", \"advertisement\":\"%{private}@\", \"latestLocation\":\"%{private}@\"}", buf, 0x26u);
        }
      }
    }
  }
}

- (void)_performDetection
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v5 = [(TAStore *)self->_store visitState];
  uint64_t v6 = [v5 state];

  if (v6)
  {
    if (v6 == 2)
    {
      int v7 = [MEMORY[0x263EFF8C0] array];
      uint64_t v8 = [MEMORY[0x263EFF8C0] array];
      if ([(TATrackingAvoidanceServiceSettings *)self->_serviceSettings enableTAFilterGeneral])
      {
        uint64_t v18 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22345C000, v18, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterGeneral detector", buf, 2u);
        }
        store = self->_store;
        v20 = [(TASettings *)self->_settings filterGeneralSettings];
        uint64_t v21 = +[TAFilterGeneral filterSuspiciousDeviceWithStore:store settings:v20 andAppendOutgoingRequestsTo:v3];

        int v7 = (void *)v21;
      }
      if (![(TATrackingAvoidanceServiceSettings *)self->_serviceSettings enableTAFilterLeavingLOI])goto LABEL_23; {
      long long v22 = TAStatusLog;
      }
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterLeavingLOI detector", buf, 2u);
      }
      long long v23 = self->_store;
      double v15 = [(TASettings *)self->_settings filterLeavingLOISettings];
      uint64_t v16 = +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:v23 leavingLOISettings:v15 andAppendOutgoingRequestsTo:v3];
      goto LABEL_22;
    }
    if (v6 == 1)
    {
      int v7 = [MEMORY[0x263EFF8C0] array];
      uint64_t v8 = [MEMORY[0x263EFF8C0] array];
      if ([(TATrackingAvoidanceServiceSettings *)self->_serviceSettings enableTAFilterVisits])
      {
        uint64_t v9 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterVisits detector", buf, 2u);
        }
        uint64_t v10 = self->_store;
        v11 = [(TASettings *)self->_settings filterVisitsSettings];
        uint64_t v12 = +[TAFilterVisits filterSuspiciousDeviceWithStore:v10 settings:v11 andAppendOutgoingRequestsTo:v3];

        int v7 = (void *)v12;
      }
      if (![(TATrackingAvoidanceServiceSettings *)self->_serviceSettings enableTAFilterSingleVisit])goto LABEL_23; {
      double v13 = TAStatusLog;
      }
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22345C000, v13, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService running TAFilterSingleVisit detector", buf, 2u);
      }
      long long v14 = self->_store;
      double v15 = [(TASettings *)self->_settings filterSingleVisitSettings];
      uint64_t v16 = +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:v14 singleVisitSettings:v15 andAppendOutgoingRequestsTo:v3];
LABEL_22:
      long long v24 = (void *)v16;

      uint64_t v8 = v24;
LABEL_23:
      [v4 addObjectsFromArray:v7];
      [v4 addObjectsFromArray:v8];
    }
  }
  else
  {
    uint64_t v17 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService not running detection in the unknown visit state", buf, 2u);
    }
  }
  v52 = v3;
  long long v25 = [(TAStore *)self->_store clock];
  latestClassificationDate = self->_latestClassificationDate;
  self->_latestClassificationDate = v25;

  [(TATrackingAvoidanceService *)self filterAndStageDetectionResults:v4];
  long long v27 = [(TAStore *)self->_store deviceRecord];
  v51 = [v27 getDetectionResultsToPush];

  uint64_t v28 = +[TAFilterKnownDevices removeDuplicateSuspiciousDevices:v51];
  __int16 v29 = [(TATrackingAvoidanceService *)self store];
  v30 = [v29 deviceRecord];
  __int16 v31 = +[TAFilterKnownDevices removeIssuedDevices:v28 deviceRecord:v30];

  id v32 = [(TAStore *)self->_store visitState];
  __int16 v33 = [v32 visitSnapshotBuffer];
  [(TAStore *)self->_store visitState];
  v35 = id v34 = v4;
  v36 = [v35 interVisitMetricSnapshotBuffer];
  v37 = [(TAStore *)self->_store clock];
  v38 = +[TAFilterObservationAggregator aggregateObservationsThroughHistoryForDetectionResults:v31 visitSnapshotBuffer:v33 intervisitSnapshotBuffer:v36 clock:v37];

  v39 = v34;
  v40 = (void *)v28;

  v41 = v51;
  v42 = [(TAStore *)self->_store deviceRecord];
  +[TAFilterObservationAggregator attachAISInfo:v38 deviceRecord:v42];

  if ([v38 count])
  {
    v43 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v44 = v43;
      uint64_t v45 = [v51 count];
      uint64_t v46 = [v40 count];
      uint64_t v47 = [v31 count];
      uint64_t v48 = [v39 count];
      *(_DWORD *)buf = 68290051;
      int v54 = 0;
      __int16 v55 = 2082;
      v56 = "";
      __int16 v57 = 2049;
      uint64_t v58 = v45;
      __int16 v59 = 2049;
      uint64_t v60 = v46;
      __int16 v61 = 2049;
      uint64_t v62 = v47;
      __int16 v63 = 2049;
      uint64_t v64 = v48;
      _os_log_impl(&dword_22345C000, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TATrackingAvoidanceService reporting suspicious devices\", \"stagedDetectionsReadyForSubmission\":%{private}lu, \"dedupedStagedDetectionsReadyForSubmission\":%{private}lu, \"nonIssuedDedupedStagedDetectionsReadyForSubmission\":%{private}lu, \"allUnfilteredSuspiciousDevices\":%{private}lu}", buf, 0x3Au);
    }
  }
  v49 = [(TATrackingAvoidanceService *)self store];
  v50 = [v49 deviceRecord];
  [v50 processSurfacedAlerts:v38];

  [(TATrackingAvoidanceService *)self notifyObserversOfRequests:v52];
  [(TATrackingAvoidanceService *)self notifyObserversOfSuspiciousDevices:v38];
}

- (TAStore)store
{
  return self->_store;
}

- (void)notifyObserversOfSuspiciousDevices:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 count])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    __int16 v31 = v5;
    obuint64_t j = v5;
    uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v46;
      id v34 = self;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v6;
          int v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
          uint64_t v8 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = v8;
            uint64_t v10 = [v7 description];
            *(_DWORD *)buf = 138477827;
            v51 = v10;
            _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService found:%{private}@", buf, 0xCu);
          }
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v11 = [v7 locationHistory];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v42;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v42 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
                  uint64_t v18 = v16;
                  v19 = [v7 address];
                  v20 = [v17 description];
                  *(_DWORD *)buf = 138478083;
                  v51 = v19;
                  __int16 v52 = 2113;
                  v53 = v20;
                  _os_log_debug_impl(&dword_22345C000, v18, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService detection location associated with %{private}@:%{private}@", buf, 0x16u);
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v13);
          }

          self = v34;
          uint64_t v21 = [(TAStore *)v34->_store deviceRecord];
          long long v22 = [TADeviceInformation alloc];
          long long v23 = [v7 latestAdvertisement];
          long long v24 = [v7 date];
          long long v25 = [(TADeviceInformation *)v22 initWithTASPAdvertisement:v23 deviceType:0 notificationState:1 date:v24];
          [v21 ingestTAEvent:v25 andAppendOutgoingRequestsTo:0];

          uint64_t v6 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v35);
    }

    uint64_t v26 = [(NSHashTable *)self->_observers allObjects];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * i) trackingAvoidanceService:self didFindSuspiciousDevices:obj];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v28);
    }

    double v5 = v31;
  }
}

- (void)filterAndStageDetectionResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(TAStore *)self->_store deviceRecord];
  uint64_t v21 = v4;
  uint64_t v6 = +[TAFilterKnownDevices removeAndProcessBackgroundDetections:v4 deviceRecord:v5];

  int v7 = [(TAStore *)self->_store deviceRecord];
  v20 = (void *)v6;
  uint64_t v8 = +[TAFilterKnownDevices removeKnownSuspiciousDevices:v6 deviceRecord:v7];

  uint64_t v9 = +[TAFilterKnownDevices removeDuplicateSuspiciousDevices:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = [(TAStore *)self->_store deviceRecord];
        uint64_t v16 = [v14 latestAdvertisement];
        uint64_t v17 = [(TAStore *)self->_store clock];
        [v15 stageDevice:v16 withCurrentDate:v17];

        uint64_t v18 = [(TAStore *)self->_store deviceRecord];
        uint64_t v26 = v14;
        v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
        [v18 stageDetectionResults:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v11);
  }
  [(TATrackingAvoidanceService *)self notifyObserversOfStagedSuspiciousDevices:v9];
}

- (void)notifyObserversOfStagedSuspiciousDevices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 trackingAvoidanceService:self didStageSuspiciousDevices:v5];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (TATrackingAvoidanceService)init
{
  return [(TATrackingAvoidanceService *)self initWithSettings:MEMORY[0x263EFFA78]];
}

- (TATrackingAvoidanceService)initWithSettings:(id)a3
{
  id v4 = a3;
  double v5 = [[TASettings alloc] initWithSettings:v4];

  uint64_t v6 = [(TATrackingAvoidanceService *)self initWithTASettings:v5];
  return v6;
}

- (TATrackingAvoidanceService)initWithTASettings:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TATrackingAvoidanceService;
  uint64_t v6 = [(TATrackingAvoidanceService *)&v24 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    TARegisterLogs();
    uint64_t v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      -[TATrackingAvoidanceService initWithTASettings:]((uint64_t *)&v7->_settings, v8);
    }
    uint64_t v9 = [(TASettings *)v7->_settings serviceSettings];
    serviceSettings = v7->_serviceSettings;
    v7->_serviceSettings = (TATrackingAvoidanceServiceSettings *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v11;

    long long v13 = [TAStore alloc];
    long long v14 = [(TASettings *)v7->_settings eventBufferSettings];
    long long v15 = [(TASettings *)v7->_settings scanRequestSettings];
    uint64_t v16 = [(TASettings *)v7->_settings visitStateSettings];
    uint64_t v17 = [(TASettings *)v7->_settings deviceRecordSettings];
    uint64_t v18 = [(TAStore *)v13 initWithEventBufferSettings:v14 scanRequestSettings:v15 visitStateSettings:v16 deviceRecordSettings:v17];
    store = v7->_store;
    v7->_store = (TAStore *)v18;

    uint64_t v20 = [MEMORY[0x263EFF910] distantPast];
    latestClassificationDate = v7->_latestClassificationDate;
    v7->_latestClassificationDate = (NSDate *)v20;

    [(TAStore *)v7->_store addObserver:v7];
    stagedIntervisitMetrics = v7->_stagedIntervisitMetrics;
    v7->_stagedIntervisitMetrics = 0;
  }
  return v7;
}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    uint64_t v8 = [(TAStore *)self->_store fetchTAUnknownBeacon:v6];
    uint64_t v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      -[TATrackingAvoidanceService fetchTAUnknownBeacon:withCompletion:]((uint64_t)v6, v9);
    }
    v7[2](v7, v8);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService fetchTAUnknownBeacon:withCompletion:]();
  }
}

- (void)didRequestAIS:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v7 = 138477827;
    long long v20 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          if ([(TASettings *)self->_settings aisFetchEnabled])
          {
            [v11 trackingAvoidanceService:self didRequestAIS:v4];
            continue;
          }
          uint64_t v17 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = v17;
            long long v14 = [v4 description];
            *(_DWORD *)buf = v20;
            uint64_t v26 = v14;
            long long v15 = v13;
            uint64_t v16 = "#TATrackingAvoidanceService AIS fetch disabled :%{private}@";
            goto LABEL_13;
          }
        }
        else
        {
          long long v12 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = v12;
            long long v14 = [v4 description];
            *(_DWORD *)buf = v20;
            uint64_t v26 = v14;
            long long v15 = v13;
            uint64_t v16 = "#TATrackingAvoidanceService AIS fetch not implemented on connection stack :%{private}@";
LABEL_13:
            _os_log_impl(&dword_22345C000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          }
        }
        uint64_t v18 = [(TAStore *)self->_store deviceRecord];
        v19 = [v4 address];
        [v18 forceUpdateAISFetchState:v19 state:8];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)bootstrapDeviceRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TAStore *)self->_store deviceRecord];
    [v5 mergeWithAnotherDeviceRecord:v4];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService bootstrapDeviceRecord:]();
  }
}

- (void)bootstrapVisitState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TAStore *)self->_store visitState];
    [v5 mergeWithAnotherTAVisitState:v4];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService bootstrapVisitState:]();
  }
}

- (void)notifyObserversOfSuspiciousDeviceUpdate:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      long long v7 = [v4 description];
      *(_DWORD *)buf = 138477827;
      long long v38 = v7;
      _os_log_impl(&dword_22345C000, v6, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService update:%{private}@", buf, 0xCu);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [v4 locationHistory];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v32;
      *(void *)&long long v10 = 138478083;
      long long v26 = v10;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          {
            long long v15 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
            uint64_t v16 = v14;
            uint64_t v17 = [v4 address];
            uint64_t v18 = [v15 description];
            *(_DWORD *)buf = v26;
            long long v38 = v17;
            __int16 v39 = 2113;
            long long v40 = v18;
            _os_log_debug_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService update location associated with %{private}@:%{private}@", buf, 0x16u);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v11);
    }

    v19 = [(NSHashTable *)self->_observers allObjects];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v35 = v4;
          long long v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v35, 1, v26);
          [v24 trackingAvoidanceService:self didUpdateSuspiciousDevices:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (void)notifyObserversOfVisitStateChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(NSHashTable *)self->_observers allObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 visitStateChangedForTrackingAvoidanceService:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TATrackingAvoidanceService visitState:didChangeStateFromType:toType:]();
  }
  [(TATrackingAvoidanceService *)self _performDetection];
  [(TATrackingAvoidanceService *)self notifyObserversOfVisitStateChange];
}

- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  switch(a4)
  {
    case 2uLL:
      if (self->_stagedIntervisitMetrics)
      {
        long long v15 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v25 = 0;
          _os_log_impl(&dword_22345C000, v15, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService reporting the previous intervisit-based metrics", v25, 2u);
        }
        stagedIntervisitMetrics = self->_stagedIntervisitMetrics;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&stagedIntervisitMetrics count:1];
        [(TATrackingAvoidanceService *)self notifyObserversOfRequests:v16];

        uint64_t v17 = self->_stagedIntervisitMetrics;
        self->_stagedIntervisitMetrics = 0;
      }
      break;
    case 1uLL:
      uint64_t v18 = +[TACoreAnalyticMetricManager computeMetricsInterVisit:self->_store];
      long long v9 = v18;
      if (v18 && [v18 count])
      {
        v19 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v25 = 0;
          _os_log_impl(&dword_22345C000, v19, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService staging previous inter-visit metrics", v25, 2u);
        }
        uint64_t v20 = [TAOutgoingRequests alloc];
        uint64_t v21 = [(TAStore *)self->_store clock];
        uint64_t v22 = [(TAOutgoingRequests *)v20 initWithRequestKey:@"DonatingInterVisitMetrics" additionalInformation:v9 date:v21];
        long long v23 = self->_stagedIntervisitMetrics;
        self->_stagedIntervisitMetrics = v22;
      }
      goto LABEL_18;
    case 0uLL:
      store = self->_store;
      uint64_t v8 = [(TASettings *)self->_settings filterVisitsSettings];
      long long v9 = +[TACoreAnalyticMetricManager computeMetricsVisit:store withFilterVisitsSettings:v8];

      if (v9 && [v9 count])
      {
        long long v10 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v25 = 0;
          _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService reporting the previous visit-based metrics", v25, 2u);
        }
        long long v11 = [TAOutgoingRequests alloc];
        long long v12 = [(TAStore *)self->_store clock];
        uint64_t v13 = [(TAOutgoingRequests *)v11 initWithRequestKey:@"DonatingVisitMetrics" additionalInformation:v9 date:v12];

        v27[0] = v13;
        uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
        [(TATrackingAvoidanceService *)self notifyObserversOfRequests:v14];
      }
LABEL_18:

      break;
    default:
      long long v24 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
        -[TATrackingAvoidanceService visitState:didIssueMetricsSubmissionHint:](a4, v24);
      }
      break;
  }
}

+ (id)createRandomBytes:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)v7 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0);
  arc4random_buf(v4, a3);
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:a3];
  return v5;
}

- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = (void *)TAStatusLog;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = v9;
      long long v11 = [v8 hexString];
      *(_DWORD *)buf = 138477827;
      v51 = v11;
      _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService start stageTADetection for address: %{private}@ ", buf, 0xCu);
    }
    long long v12 = [(TAStore *)self->_store deviceRecord];
    [v12 removeDevice:v8];

    if (a4 >= 4) {
      __int16 v13 = 0;
    }
    else {
      __int16 v13 = 0xF4E4D400 >> (8 * a4);
    }
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    long long v15 = &unk_26D684260;
    if (a5 == 3) {
      long long v15 = &unk_26D684290;
    }
    if (a5 == 1) {
      uint64_t v16 = &unk_26D684278;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v17 = [TASPAdvertisement alloc];
    uint64_t v18 = +[TATrackingAvoidanceService createRandomBytes:22];
    v19 = +[TATrackingAvoidanceService createRandomBytes:2];
    uint64_t v20 = v13 & 0x3FC;
    LODWORD(v44) = a5;
    long long v46 = (void *)v14;
    uint64_t v21 = [(TASPAdvertisement *)v17 initWithAddress:v8 advertisementData:v18 status:v20 reserved:v19 rssi:-55 scanDate:v14 detailsBitmask:v44 uuid:0 protocolID:v16];

    uint64_t v22 = [(TAStore *)self->_store deviceRecord];
    long long v23 = [(TASPAdvertisement *)v21 getDate];
    [v22 stageDevice:v21 withCurrentDate:v23];

    long long v24 = [(TAStore *)self->_store deviceRecord];
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v24 ingestTAEvent:v21 andAppendOutgoingRequestsTo:v25];

    long long v26 = [MEMORY[0x263EFF910] dateWithTimeInterval:v14 sinceDate:-5400.0];
    long long v27 = [TASPAdvertisement alloc];
    long long v28 = +[TATrackingAvoidanceService createRandomBytes:22];
    long long v29 = +[TATrackingAvoidanceService createRandomBytes:2];
    LODWORD(v45) = a5;
    long long v30 = [(TASPAdvertisement *)v27 initWithAddress:v8 advertisementData:v28 status:v20 reserved:v29 rssi:-55 scanDate:v26 detailsBitmask:v45 uuid:0 protocolID:v16];

    long long v31 = [(TAStore *)self->_store deviceRecord];
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v31 ingestTAEvent:v30 andAppendOutgoingRequestsTo:v32];

    long long v33 = [[TALocationLite alloc] initWithTimestamp:v26 latitude:37.3348314 longitude:-122.008961 horizontalAccuracy:100.0];
    long long v34 = [TASuspiciousDevice alloc];
    v49 = v33;
    id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    uint64_t v36 = [[TAMetricsDetection alloc] initWithDetectionType:1 visitDetectionMetrics:0 generalDetectionMetrics:0 singleVisitDetectionMetrics:0 latestAdvertisement:v21];
    long long v37 = [(TASuspiciousDevice *)v34 initWithLatestAdv:v21 detectionSummary:&unk_26D6843C0 date:v46 locHistory:v35 detectionMetrics:v36 detectionType:1 immediacyType:1 accessoryInfo:0 forceSurfaceReason:0];

    long long v38 = [(TAStore *)self->_store deviceRecord];
    long long v48 = v37;
    __int16 v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
    [v38 stageDetectionResults:v39];

    long long v47 = v37;
    long long v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    [(TATrackingAvoidanceService *)self notifyObserversOfStagedSuspiciousDevices:v40];

    long long v41 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = v41;
      long long v43 = [v8 hexString];
      *(_DWORD *)buf = 138477827;
      v51 = v43;
      _os_log_impl(&dword_22345C000, v42, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService end stageDevice %{private}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TATrackingAvoidanceService debugStageTADetection:deviceType:detailsBitmask:]();
  }
}

- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = v9;
    long long v11 = [v8 hexString];
    *(_DWORD *)buf = 138477827;
    long long v23 = v11;
    _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TATrackingAvoidanceService forceSurfaceStagedDetections for address: %{private}@", buf, 0xCu);
  }
  if (a4 >= 4) {
    __int16 v12 = 0;
  }
  else {
    __int16 v12 = 0xF4E4D400 >> (8 * a4);
  }
  __int16 v13 = [TASPAdvertisement alloc];
  uint64_t v14 = +[TATrackingAvoidanceService createRandomBytes:22];
  long long v15 = +[TATrackingAvoidanceService createRandomBytes:2];
  uint64_t v16 = [MEMORY[0x263EFF910] now];
  LODWORD(v21) = a5;
  uint64_t v17 = [(TASPAdvertisement *)v13 initWithAddress:v8 advertisementData:v14 status:v12 & 0x3FC reserved:v15 rssi:-55 scanDate:v16 detailsBitmask:v21 uuid:0 protocolID:0];

  uint64_t v18 = [(TAStore *)self->_store deviceRecord];
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v18 ingestTAEvent:v17 andAppendOutgoingRequestsTo:v19];

  uint64_t v20 = [(TAStore *)self->_store deviceRecord];
  [v20 forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:v17 withReason:0];

  [(TATrackingAvoidanceService *)self _performDetection];
}

- (TASettings)settings
{
  return self->_settings;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSDate)latestClassificationDate
{
  return self->_latestClassificationDate;
}

- (void)setLatestClassificationDate:(id)a3
{
}

- (TATrackingAvoidanceServiceSettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
}

- (TAOutgoingRequests)stagedIntervisitMetrics
{
  return self->_stagedIntervisitMetrics;
}

- (void)setStagedIntervisitMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedIntervisitMetrics, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_latestClassificationDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)initWithTASettings:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22345C000, a2, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService settings %{private}@", (uint8_t *)&v3, 0xCu);
}

- (void)fetchTAUnknownBeacon:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TATrackingAvoidanceService received nil uuid for beacon fetch", v2, v3, v4, v5, v6);
}

- (void)fetchTAUnknownBeacon:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22345C000, a2, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService fetch unknown beacon successfully %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)bootstrapDeviceRecord:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TATrackingAvoidanceService received nil device record for bootstrap", v2, v3, v4, v5, v6);
}

- (void)bootstrapVisitState:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TATrackingAvoidanceService received nil visit state for bootstrap", v2, v3, v4, v5, v6);
}

- (void)visitState:didChangeStateFromType:toType:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_22345C000, v0, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService received state change notification", v1, 2u);
}

- (void)visitState:(uint64_t)a1 didIssueMetricsSubmissionHint:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22345C000, a2, OS_LOG_TYPE_ERROR, "#TATrackingAvoidanceService unrecognized metrics hint %lu", (uint8_t *)&v2, 0xCu);
}

- (void)ingestTAEvent:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_22345C000, v0, OS_LOG_TYPE_DEBUG, "#TATrackingAvoidanceService nil event given, not ingesting", v1, 2u);
}

- (void)debugStageTADetection:deviceType:detailsBitmask:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TATrackingAvoidanceService received nil address for debugStageTAUnknownBeacon", v2, v3, v4, v5, v6);
}

@end