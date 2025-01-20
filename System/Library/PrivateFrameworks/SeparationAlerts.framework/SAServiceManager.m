@interface SAServiceManager
+ (unint64_t)convertBeaconToDeviceType:(id)a3;
+ (unint64_t)convertCLReferenceFrameToSAReferenceFrame:(int)a3;
- (BOOL)beaconGroupComplete;
- (BOOL)beaconGroupSafeLocationsMatch;
- (BOOL)hasAttemptedToIngestLastVisitAtStartup;
- (NSDate)nextAnalyticsSubmission;
- (NSHashTable)clients;
- (OS_dispatch_queue)queue;
- (RTRoutineManager)routineManager;
- (SAAnalytics)analytics;
- (SAAudioAccessory)audioAcccessory;
- (SAService)service;
- (SAServiceManager)initWithQueue:(id)a3;
- (id)scheduledMetricSubmissionBlock;
- (int)beaconGroupSizeForDeviceType:(unint64_t)a3 isAppleAudioAccessory:(BOOL)a4;
- (void)_fetchAndIngestLastVisit;
- (void)_ingestVisit:(id)a3;
- (void)addClient:(id)a3;
- (void)dealloc;
- (void)didFetchAllDevices:(id)a3;
- (void)didFetchAllSafeLocations:(id)a3;
- (void)ingestTAEvent:(id)a3;
- (void)removeClient:(id)a3;
- (void)scheduleBeaconGroupMetricSubmission;
- (void)separationAlertsService:(id)a3 addGeofence:(id)a4;
- (void)separationAlertsService:(id)a3 cancelSATimeEventForAlarm:(id)a4;
- (void)separationAlertsService:(id)a3 enableMonitoringForSeparations:(BOOL)a4;
- (void)separationAlertsService:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6;
- (void)separationAlertsService:(id)a3 removeGeofence:(id)a4;
- (void)separationAlertsService:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4;
- (void)separationAlertsService:(id)a3 requestLocationForType:(unint64_t)a4;
- (void)separationAlertsService:(id)a3 requestStateForRegion:(id)a4;
- (void)separationAlertsService:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5;
- (void)separationAlertsServiceFetchLastVisit:(id)a3;
- (void)separationAlertsServiceStartBackgroundScanning:(id)a3;
- (void)separationAlertsServiceStopBackgroundScanning:(id)a3;
- (void)separationAlertsServiceStopLongAggressiveScan:(id)a3;
- (void)setAnalytics:(id)a3;
- (void)setAudioAcccessory:(id)a3;
- (void)setBeaconGroupComplete:(BOOL)a3;
- (void)setBeaconGroupSafeLocationsMatch:(BOOL)a3;
- (void)setClients:(id)a3;
- (void)setHasAttemptedToIngestLastVisitAtStartup:(BOOL)a3;
- (void)setNextAnalyticsSubmission:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)setScheduledMetricSubmissionBlock:(id)a3;
- (void)setService:(id)a3;
@end

@implementation SAServiceManager

- (void)ingestTAEvent:(id)a3
{
  id v4 = a3;
  service = self->_service;
  id v18 = v4;
  if (service)
  {
    [(SAService *)service ingestTAEvent:v4];
    BOOL v6 = [(SAServiceManager *)self hasAttemptedToIngestLastVisitAtStartup];
    id v4 = v18;
    if (!v6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v4 = v18;
      if (isKindOfClass)
      {
        id v8 = v18;
        if ([v8 systemStateType] == 11 && objc_msgSend(v8, "isOn"))
        {
          [(SAServiceManager *)self _fetchAndIngestLastVisit];
          [(SAServiceManager *)self setHasAttemptedToIngestLastVisitAtStartup:1];
        }

        id v4 = v18;
      }
    }
  }
  v9 = [v4 getDate];
  v10 = [(SAServiceManager *)self nextAnalyticsSubmission];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 >= 0.0)
  {
    v13 = [(SAServiceManager *)self analytics];
    [v13 submitDefaultAlertRateEvent];

    v14 = [(SAServiceManager *)self analytics];
    [v14 publishAndResetAggregation];

    id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v16 = [(SAServiceManager *)self analytics];
    [v16 publishingInterval];
    v17 = objc_msgSend(v15, "initWithTimeIntervalSinceNow:");
    [(SAServiceManager *)self setNextAnalyticsSubmission:v17];
  }
}

- (NSDate)nextAnalyticsSubmission
{
  return self->_nextAnalyticsSubmission;
}

- (BOOL)hasAttemptedToIngestLastVisitAtStartup
{
  return self->_hasAttemptedToIngestLastVisitAtStartup;
}

- (SAServiceManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)SAServiceManager;
  BOOL v6 = [(SAServiceManager *)&v49 init];
  if (v6)
  {
    TARegisterLogs();
    objc_storeStrong((id *)&v6->_queue, a3);
    v7 = [[SAAudioAccessory alloc] initWithQueue:v5];
    audioAcccessory = v6->_audioAcccessory;
    v6->_audioAcccessory = v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v6->_clients;
    v6->_clients = (NSHashTable *)v9;

    double v11 = [SAAnalytics alloc];
    double v12 = [[SAAnalyticsSettings alloc] initWithEnableSubmission:1];
    uint64_t v13 = [(SAAnalytics *)v11 initWithSettings:v12];
    analytics = v6->_analytics;
    v6->_analytics = (SAAnalytics *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v16 = [(SAServiceManager *)v6 analytics];
    [v16 publishingInterval];
    uint64_t v17 = objc_msgSend(v15, "initWithTimeIntervalSinceNow:");
    nextAnalyticsSubmission = v6->_nextAnalyticsSubmission;
    v6->_nextAnalyticsSubmission = (NSDate *)v17;

    v19 = [SAService alloc];
    v20 = [(SAServiceManager *)v6 analytics];
    uint64_t v21 = [(SAService *)v19 initWithAnalytics:v20 isReplay:0 audioAccessoryManager:v6->_audioAcccessory];
    service = v6->_service;
    v6->_service = (SAService *)v21;

    [(SAService *)v6->_service addClient:v6];
    v23 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E4F5CEB8]);
    routineManager = v6->_routineManager;
    v6->_routineManager = v23;

    *(_WORD *)&v6->_hasAttemptedToIngestLastVisitAtStartup = 256;
    v6->_beaconGroupSafeLocationsMatch = 1;
    id scheduledMetricSubmissionBlock = v6->_scheduledMetricSubmissionBlock;
    v6->_id scheduledMetricSubmissionBlock = 0;

    uint64_t v26 = objc_opt_new();
    ownerSession = v6->_ownerSession;
    v6->_ownerSession = (SPOwnerSession *)v26;

    id v28 = objc_alloc_init(MEMORY[0x1E4F97C50]);
    uint64_t v29 = [v28 performSelector:sel_separationMonitoringSession];
    separationMonitoringSession = v6->_separationMonitoringSession;
    v6->_separationMonitoringSession = (SPSeparationMonitoringProtocol *)v29;

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __34__SAServiceManager_initWithQueue___block_invoke;
    v47[3] = &unk_1E68D7478;
    v31 = v6;
    v48 = v31;
    v32 = (void *)MEMORY[0x1D25F7E90](v47);
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __34__SAServiceManager_initWithQueue___block_invoke_3;
    v45 = &unk_1E68D7478;
    v46 = v31;
    v33 = (void *)MEMORY[0x1D25F7E90](&v42);
    v34 = v6->_separationMonitoringSession;
    v38 = (void *)MEMORY[0x1D25F7E90](v33, v35, v36, v37);
    -[SPSeparationMonitoringProtocol performSelector:withObject:](v34, "performSelector:withObject:", sel_startRefreshingSafeLocationWithBlock_, v38, v42, v43, v44, v45);

    v39 = v6->_separationMonitoringSession;
    v40 = (void *)MEMORY[0x1D25F7E90](v32);
    [(SPSeparationMonitoringProtocol *)v39 performSelector:sel_startRefreshingBeaconsForSeparationMonitoringWithBlock_ withObject:v40];
  }
  return v6;
}

void __34__SAServiceManager_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SAServiceManager_initWithQueue___block_invoke_2;
  v6[3] = &unk_1E68D7450;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __34__SAServiceManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFetchAllDevices:*(void *)(a1 + 40)];
}

void __34__SAServiceManager_initWithQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SAServiceManager_initWithQueue___block_invoke_4;
  v6[3] = &unk_1E68D7450;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __34__SAServiceManager_initWithQueue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFetchAllSafeLocations:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(SAService *)self->_service removeClient:self];
  separationMonitoringSession = self->_separationMonitoringSession;
  self->_separationMonitoringSession = 0;

  ownerSession = self->_ownerSession;
  self->_ownerSession = 0;

  v5.receiver = self;
  v5.super_class = (Class)SAServiceManager;
  [(SAServiceManager *)&v5 dealloc];
}

- (void)addClient:(id)a3
{
}

- (void)removeClient:(id)a3
{
}

+ (unint64_t)convertBeaconToDeviceType:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if ([v4 isEqual:*MEMORY[0x1E4F97DA0]])
  {
    unint64_t v5 = 2;
  }
  else if ([v4 isEqual:*MEMORY[0x1E4F97D98]])
  {
    unint64_t v5 = 4;
  }
  else if ([v4 isEqual:*MEMORY[0x1E4F97DA8]])
  {
    unint64_t v5 = 16;
  }
  else
  {
    BOOL v6 = [v3 model];
    char v7 = [v6 hasPrefix:@"Watch"];

    if (v7)
    {
      unint64_t v5 = 8;
    }
    else if ([v4 isEqual:*MEMORY[0x1E4F97DC0]])
    {
      unint64_t v5 = 1;
    }
    else
    {
      id v8 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT)) {
        +[SAServiceManager convertBeaconToDeviceType:]((uint64_t)v4, v8);
      }
      unint64_t v5 = 0;
    }
  }

  return v5;
}

+ (unint64_t)convertCLReferenceFrameToSAReferenceFrame:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)didFetchAllSafeLocations:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v50 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v51;
    uint64_t v45 = *(void *)v51;
    id v46 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v48 = v6;
      do
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v50 + 1) + 8 * v8);
        if ([v9 approvalState] == 1)
        {
          objc_super v49 = [SASafeLocation alloc];
          v10 = [v9 identifier];
          double v11 = [v9 location];
          [v11 coordinate];
          double v13 = v12;
          v14 = [v9 location];
          [v14 coordinate];
          double v16 = v15;
          uint64_t v17 = [v9 location];
          [v17 horizontalAccuracy];
          double v19 = v18;
          v20 = [v9 location];
          unint64_t v21 = +[SAServiceManager convertCLReferenceFrameToSAReferenceFrame:](SAServiceManager, "convertCLReferenceFrameToSAReferenceFrame:", [v20 referenceFrame]);
          v22 = [v9 name];
          v23 = [MEMORY[0x1E4F1C9C8] now];
          v24 = [(SASafeLocation *)v49 initWithLocationUUID:v10 latitude:v21 longitude:v22 radius:v23 referenceFrame:v13 name:v16 date:v19];

          v25 = [v9 identifier];
          [v47 setObject:v24 forKeyedSubscript:v25];

          uint64_t v26 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            id v28 = [(SASafeLocation *)v24 identifier];
            uint64_t v29 = [(SASafeLocation *)v24 name];
            [(SASafeLocation *)v24 latitude];
            uint64_t v31 = v30;
            [(SASafeLocation *)v24 longitude];
            uint64_t v33 = v32;
            [(SASafeLocation *)v24 radius];
            uint64_t v35 = v34;
            uint64_t v36 = [(SASafeLocation *)v24 referenceFrame];
            *(_DWORD *)buf = 68290563;
            int v55 = 0;
            __int16 v56 = 2082;
            v57 = "";
            __int16 v58 = 2113;
            v59 = v28;
            __int16 v60 = 2113;
            v61 = v29;
            __int16 v62 = 2049;
            uint64_t v63 = v31;
            __int16 v64 = 2049;
            uint64_t v65 = v33;
            __int16 v66 = 2050;
            uint64_t v67 = v35;
            __int16 v68 = 2049;
            uint64_t v69 = v36;
            _os_log_impl(&dword_1D15FC000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchSafe\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"radius\":\"%{public}f\", \"refFrame\":%{private}lu}", buf, 0x4Eu);
          }
          uint64_t v7 = v45;
          id v4 = v46;
          uint64_t v6 = v48;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v50 objects:v70 count:16];
    }
    while (v6);
  }

  uint64_t v37 = [SASafeLocationsEvent alloc];
  v38 = [MEMORY[0x1E4F1C9C8] now];
  v39 = [(SASafeLocationsEvent *)v37 initWithSafeLocations:v47 date:v38];

  [(SAServiceManager *)self ingestTAEvent:v39];
  v40 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    int v42 = [v4 count];
    *(_DWORD *)buf = 67240192;
    int v55 = v42;
    _os_log_impl(&dword_1D15FC000, v41, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchSafe, %{public}d", buf, 8u);
  }
  uint64_t v43 = [(SAServiceManager *)self analytics];
  objc_msgSend(v43, "addSafeLocationFetchResultCount:", objc_msgSend(v4, "count"));
}

- (void)didFetchAllDevices:(id)a3
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v152 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v161 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v154 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v151 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  obuint64_t j = v3;
  v149 = v4;
  uint64_t v153 = [obj countByEnumeratingWithState:&v189 objects:v214 count:16];
  if (v153)
  {
    int v141 = 0;
    int v142 = 0;
    int v136 = 0;
    int v137 = 0;
    int v138 = 0;
    int v139 = 0;
    int v143 = 0;
    int v150 = 0;
    uint64_t v148 = *(void *)v190;
    uint64_t v147 = *MEMORY[0x1E4F97DA0];
    uint64_t v144 = *MEMORY[0x1E4F97D98];
    uint64_t v140 = *MEMORY[0x1E4F97DA8];
    BOOL v5 = 1;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v190 != v148) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v189 + 1) + 8 * v6);
        uint64_t v8 = [v7 groupIdentifier];

        v160 = v7;
        if (v8)
        {
          uint64_t v9 = [v7 groupIdentifier];
          v10 = [v4 objectForKey:v9];

          if (v10)
          {
            double v11 = [v7 groupIdentifier];
            double v12 = [v4 objectForKeyedSubscript:v11];

            double v13 = [v7 identifier];
            [v12 addObject:v13];
          }
          else
          {
            v14 = (void *)MEMORY[0x1E4F1CA80];
            double v15 = [v7 identifier];
            double v12 = [v14 setWithObject:v15];
          }
          double v16 = [v7 groupIdentifier];
          [v4 setObject:v12 forKeyedSubscript:v16];
        }
        uint64_t v17 = [v7 type];
        int v18 = [v17 isEqual:v147];

        BOOL v157 = v5;
        uint64_t v155 = v6;
        if (v18)
        {
          ++v150;
        }
        else
        {
          v75 = [v7 type];
          int v76 = [v75 isEqual:v144];

          if (v76)
          {
            if ([v7 isAppleAudioAccessory]) {
              ++v141;
            }
            else {
              ++v142;
            }
          }
          else
          {
            v77 = [v7 type];
            int v78 = [v77 isEqual:v140];

            if (v78)
            {
              ++v143;
            }
            else
            {
              v79 = [v7 model];
              int v80 = [v79 hasPrefix:@"iPhone"];

              if (v80)
              {
                ++v139;
              }
              else
              {
                v81 = [v7 model];
                int v82 = [v81 hasPrefix:@"iPad"];

                if (v82)
                {
                  ++v138;
                }
                else
                {
                  v83 = [v7 model];
                  int v84 = [v83 hasPrefix:@"MacBook"];

                  if (v84) {
                    ++v136;
                  }
                  else {
                    ++v137;
                  }
                }
              }
            }
          }
        }
        v172 = [SADevice alloc];
        id v169 = [v7 identifier];
        double v19 = [v7 groupIdentifier];
        id v166 = (id)[v7 partIdentifier];
        v20 = [v7 name];
        unint64_t v21 = [v7 model];
        v22 = [v7 systemVersion];
        uint64_t v23 = [v7 vendorId];
        uint64_t v24 = [v7 productId];
        unint64_t v25 = +[SAServiceManager convertBeaconToDeviceType:v7];
        char v26 = [v7 isAppleAudioAccessory];
        v27 = [MEMORY[0x1E4F1C9C8] date];
        BYTE1(v135) = v26;
        LOBYTE(v135) = 1;
        v158 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](v172, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v169, v19, 0, v166, v20, v21, v22, v23, v24, v25, v135, v27);

        if ([v7 isAppleAudioAccessory])
        {
          id v28 = [v7 groupIdentifier];

          if (v28)
          {
            ownerSession = self->_ownerSession;
            uint64_t v30 = [v7 groupIdentifier];
            v187[0] = MEMORY[0x1E4F143A8];
            v187[1] = 3221225472;
            v187[2] = __39__SAServiceManager_didFetchAllDevices___block_invoke;
            v187[3] = &unk_1E68D74A0;
            v187[4] = self;
            v188 = v158;
            [(SPOwnerSession *)ownerSession beaconGroupForIdentifier:v30 completion:v187];
          }
        }
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        id v170 = [v7 safeLocations];
        uint64_t v32 = [v170 countByEnumeratingWithState:&v183 objects:v213 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v184;
          uint64_t v162 = *(void *)v184;
          id v164 = v31;
          do
          {
            uint64_t v35 = 0;
            id v167 = (id)v33;
            do
            {
              if (*(void *)v184 != v34) {
                objc_enumerationMutation(v170);
              }
              uint64_t v36 = *(void **)(*((void *)&v183 + 1) + 8 * v35);
              uint64_t v37 = [v36 identifier];
              [v31 addObject:v37];

              if ([v36 approvalState] == 1)
              {
                v38 = [SASafeLocation alloc];
                v39 = [v36 identifier];
                v173 = [v36 location];
                [v173 coordinate];
                double v41 = v40;
                int v42 = [v36 location];
                [v42 coordinate];
                double v44 = v43;
                uint64_t v45 = [v36 location];
                [v45 horizontalAccuracy];
                double v47 = v46;
                uint64_t v48 = [v36 location];
                unint64_t v49 = +[SAServiceManager convertCLReferenceFrameToSAReferenceFrame:](SAServiceManager, "convertCLReferenceFrameToSAReferenceFrame:", [v48 referenceFrame]);
                long long v50 = [v36 name];
                long long v51 = [MEMORY[0x1E4F1C9C8] now];
                long long v52 = [(SASafeLocation *)v38 initWithLocationUUID:v39 latitude:v49 longitude:v50 radius:v51 referenceFrame:v41 name:v44 date:v47];

                long long v53 = [v36 identifier];
                [v161 setObject:v52 forKeyedSubscript:v53];

                v54 = (void *)TASALog;
                if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
                {
                  int v55 = v54;
                  __int16 v56 = [v160 identifier];
                  v57 = [(SASafeLocation *)v52 identifier];
                  __int16 v58 = [(SASafeLocation *)v52 name];
                  [(SASafeLocation *)v52 latitude];
                  __int16 v60 = v59;
                  [(SASafeLocation *)v52 longitude];
                  uint64_t v62 = v61;
                  [(SASafeLocation *)v52 radius];
                  uint64_t v64 = v63;
                  uint64_t v65 = [(SASafeLocation *)v52 referenceFrame];
                  *(_DWORD *)buf = 68290819;
                  int v196 = 0;
                  __int16 v197 = 2082;
                  v198 = "";
                  __int16 v199 = 2113;
                  v200 = v56;
                  __int16 v201 = 2113;
                  uint64_t v202 = (uint64_t)v57;
                  __int16 v203 = 2113;
                  v204 = v58;
                  __int16 v205 = 2049;
                  v206 = v60;
                  __int16 v207 = 2049;
                  uint64_t v208 = v62;
                  __int16 v209 = 2050;
                  uint64_t v210 = v64;
                  __int16 v211 = 2049;
                  uint64_t v212 = v65;
                  _os_log_impl(&dword_1D15FC000, v55, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchSafeForBeacon\", \"device\":\"%{private}@\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"radius\":\"%{public}f\", \"refFrame\":%{private}lu}", buf, 0x58u);
                }
                uint64_t v34 = v162;
                id v31 = v164;
                uint64_t v33 = (uint64_t)v167;
              }
              ++v35;
            }
            while (v33 != v35);
            uint64_t v33 = [v170 countByEnumeratingWithState:&v183 objects:v213 count:16];
          }
          while (v33);
        }

        __int16 v66 = [v160 identifier];
        [v152 setObject:v158 forKeyedSubscript:v66];

        uint64_t v67 = [v160 identifier];
        [v154 setObject:v31 forKeyedSubscript:v67];

        __int16 v68 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v69 = v68;
          v70 = [v160 name];
          uint64_t v71 = [v160 identifier];
          v72 = [v160 type];
          *(_DWORD *)buf = 68290051;
          int v196 = 0;
          __int16 v197 = 2082;
          v198 = "";
          __int16 v199 = 2113;
          v200 = v70;
          __int16 v201 = 2113;
          uint64_t v202 = (uint64_t)v71;
          __int16 v203 = 2113;
          v204 = v72;
          __int16 v205 = 2113;
          v206 = (const char *)v31;
          _os_log_impl(&dword_1D15FC000, v69, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchAll\", \"name\":\"%{private}@\", \"device\":\"%{private}@\", \"type\":\"%{private}@\", \"safes\":\"%{private}@\"}", buf, 0x3Au);
        }
        id v73 = (id)[v151 setByAddingObjectsFromSet:v31];
        id v4 = v149;
        if (v157)
        {
          uint64_t v74 = [v151 count];
          BOOL v5 = v74 == [v31 count];
        }
        else
        {
          BOOL v5 = 0;
        }

        uint64_t v6 = v155 + 1;
      }
      while (v155 + 1 != v153);
      uint64_t v85 = [obj countByEnumeratingWithState:&v189 objects:v214 count:16];
      uint64_t v153 = v85;
    }
    while (v85);
  }
  else
  {
    int v141 = 0;
    int v142 = 0;
    int v136 = 0;
    int v137 = 0;
    int v138 = 0;
    int v139 = 0;
    int v143 = 0;
    int v150 = 0;
    BOOL v5 = 1;
  }

  v86 = [SASafeLocationsEvent alloc];
  v87 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v88 = [(SASafeLocationsEvent *)v86 initWithSafeLocations:v161 date:v87];

  v159 = (void *)v88;
  [(SAServiceManager *)self ingestTAEvent:v88];
  v89 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v90 = v89;
    int v91 = [v161 count];
    *(_DWORD *)buf = 67240192;
    int v196 = v91;
    _os_log_impl(&dword_1D15FC000, v90, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchBeaconsSafe, %{public}d", buf, 8u);
  }
  v92 = [(SAServiceManager *)self analytics];
  objc_msgSend(v92, "addSafeLocationFetchResultCount:", objc_msgSend(v161, "count"));

  v93 = [SADevicesWithSafeLocationsEvent alloc];
  v94 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v95 = [(SADevicesWithSafeLocationsEvent *)v93 initWithDevices:v152 safeLocationUUIDs:v154 date:v94];

  v156 = (void *)v95;
  [(SAServiceManager *)self ingestTAEvent:v95];
  v96 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v97 = v96;
    int v98 = [obj count];
    *(_DWORD *)buf = 67240448;
    int v196 = v98;
    __int16 v197 = 1026;
    LODWORD(v198) = 100 * v142 + 10000 * (v143 + v137) + v150;
    _os_log_impl(&dword_1D15FC000, v97, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchAll %{public}d, types, %{public}d", buf, 0xEu);
  }
  v99 = [(SAServiceManager *)self analytics];
  LOBYTE(v135) = v5;
  objc_msgSend(v99, "addDeviceFetchResultCount:type1count:type2count:type3count:type4count:type5count:type6count:type7count:type8count:safeCount:usingSameSafe:", objc_msgSend(obj, "count"), v150, v142, v143, v137, v139, v138, v136, v141, objc_msgSend(v151, "count"), v135);

  [(SAServiceManager *)self setBeaconGroupComplete:1];
  [(SAServiceManager *)self setBeaconGroupSafeLocationsMatch:1];
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id v168 = v149;
  uint64_t v165 = [v168 countByEnumeratingWithState:&v179 objects:v194 count:16];
  if (v165)
  {
    uint64_t v163 = *(void *)v180;
    while (2)
    {
      for (uint64_t i = 0; i != v165; ++i)
      {
        if (*(void *)v180 != v163) {
          objc_enumerationMutation(v168);
        }
        v174 = *(void **)(*((void *)&v179 + 1) + 8 * i);
        v101 = objc_msgSend(v168, "objectForKeyedSubscript:");
        v102 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v103 = v102;
          uint64_t v104 = [v101 count];
          v105 = [v101 description];
          if ([(SAServiceManager *)self beaconGroupComplete]) {
            v106 = "YES";
          }
          else {
            v106 = "NO";
          }
          BOOL v107 = [(SAServiceManager *)self beaconGroupSafeLocationsMatch];
          *(_DWORD *)buf = 68290307;
          if (v107) {
            v108 = "YES";
          }
          else {
            v108 = "NO";
          }
          int v196 = 0;
          __int16 v197 = 2082;
          v198 = "";
          __int16 v199 = 2113;
          v200 = v174;
          __int16 v201 = 2050;
          uint64_t v202 = v104;
          __int16 v203 = 2113;
          v204 = v105;
          __int16 v205 = 2082;
          v206 = v106;
          __int16 v207 = 2082;
          uint64_t v208 = (uint64_t)v108;
          _os_log_impl(&dword_1D15FC000, v103, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring for group\", \"groupIdentifier\":\"%{private}@\", \"beaconGroup.count\":%{public}lu, \"beacons\":\"%{private}@\", \"beaconGroupCompletePartialResult\":\"%{public}s\", \"safeLocationsMatchPartialResult\":\"%{public}s\"}", buf, 0x44u);
        }
        if (![(SAServiceManager *)self beaconGroupComplete]
          && ![(SAServiceManager *)self beaconGroupSafeLocationsMatch])
        {
          goto LABEL_97;
        }
        uint64_t v109 = [v101 anyObject];
        if (!v109)
        {
          [(SAServiceManager *)self setBeaconGroupComplete:0];
          [(SAServiceManager *)self setBeaconGroupSafeLocationsMatch:0];
          v130 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
          {
            v131 = v130;
            if ([(SAServiceManager *)self beaconGroupComplete]) {
              v132 = "YES";
            }
            else {
              v132 = "NO";
            }
            BOOL v133 = [(SAServiceManager *)self beaconGroupSafeLocationsMatch];
            *(_DWORD *)buf = 68289795;
            if (v133) {
              v134 = "YES";
            }
            else {
              v134 = "NO";
            }
            int v196 = 0;
            __int16 v197 = 2082;
            v198 = "";
            __int16 v199 = 2113;
            v200 = v174;
            __int16 v201 = 2082;
            uint64_t v202 = (uint64_t)v132;
            __int16 v203 = 2082;
            v204 = v134;
            _os_log_impl(&dword_1D15FC000, v131, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring beacon group is empty\", \"groupIdentifier\":\"%{private}@\", \"beaconGroupComplete\":\"%{public}s\", \"safeLocationsMatch\":\"%{public}s\"}", buf, 0x30u);
          }
LABEL_97:

          goto LABEL_98;
        }
        v110 = (void *)v109;
        v111 = [v152 objectForKeyedSubscript:v109];
        int v112 = -[SAServiceManager beaconGroupSizeForDeviceType:isAppleAudioAccessory:](self, "beaconGroupSizeForDeviceType:isAppleAudioAccessory:", [v111 deviceType], objc_msgSend(v111, "isAppleAudioAccessory"));
        if ([v101 count] != v112)
        {
          v113 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            v114 = (const char *)v112;
            v115 = (void *)MEMORY[0x1E4F28ED0];
            v116 = v113;
            objc_msgSend(v115, "numberWithInteger:", objc_msgSend(v111, "deviceType"));
            v117 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v118 = [v101 count];
            *(_DWORD *)buf = 68290307;
            int v196 = 0;
            __int16 v197 = 2082;
            v198 = "";
            __int16 v199 = 2113;
            v200 = v174;
            __int16 v201 = 2113;
            uint64_t v202 = (uint64_t)v110;
            __int16 v203 = 2114;
            v204 = v117;
            __int16 v205 = 2050;
            v206 = v114;
            __int16 v207 = 2050;
            uint64_t v208 = v118;
            _os_log_impl(&dword_1D15FC000, v116, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring incorrect beacon group size\", \"groupIdentifier\":\"%{private}@\", \"beaconIdentifier\":\"%{private}@\", \"deviceType\":\"%{public}@\", \"expectedBeaconGroupSize\":%{public}lu, \"beaconGroup.count\":%{public}lu}", buf, 0x44u);
          }
          [(SAServiceManager *)self setBeaconGroupComplete:0];
        }
        id v171 = v111;
        v119 = [v154 objectForKeyedSubscript:v110];
        long long v175 = 0u;
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        id v120 = v101;
        uint64_t v121 = [v120 countByEnumeratingWithState:&v175 objects:v193 count:16];
        if (v121)
        {
          uint64_t v122 = v121;
          uint64_t v123 = *(void *)v176;
          while (2)
          {
            for (uint64_t j = 0; j != v122; ++j)
            {
              if (*(void *)v176 != v123) {
                objc_enumerationMutation(v120);
              }
              v125 = *(void **)(*((void *)&v175 + 1) + 8 * j);
              if (v125 != v110)
              {
                v126 = [v154 objectForKeyedSubscript:*(void *)(*((void *)&v175 + 1) + 8 * j)];
                -[SAServiceManager setBeaconGroupSafeLocationsMatch:](self, "setBeaconGroupSafeLocationsMatch:", [v119 isEqualToSet:v126]);

                if (![(SAServiceManager *)self beaconGroupSafeLocationsMatch])
                {
                  v127 = (void *)TASALog;
                  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
                  {
                    v128 = v127;
                    v129 = [v154 objectForKeyedSubscript:v125];
                    *(_DWORD *)buf = 68290051;
                    int v196 = 0;
                    __int16 v197 = 2082;
                    v198 = "";
                    __int16 v199 = 2113;
                    v200 = v174;
                    __int16 v201 = 2113;
                    uint64_t v202 = (uint64_t)v125;
                    __int16 v203 = 2114;
                    v204 = (const char *)v119;
                    __int16 v205 = 2114;
                    v206 = v129;
                    _os_log_impl(&dword_1D15FC000, v128, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring safe location mismatch\", \"groupIdentifier\":\"%{private}@\", \"beaconIdentifier\":\"%{private}@\", \"safelocationsBaseline\":\"%{public}@\", \"safelocationsCompared\":\"%{public}@\"}", buf, 0x3Au);
                  }
                  goto LABEL_86;
                }
              }
            }
            uint64_t v122 = [v120 countByEnumeratingWithState:&v175 objects:v193 count:16];
            if (v122) {
              continue;
            }
            break;
          }
        }
LABEL_86:
      }
      uint64_t v165 = [v168 countByEnumeratingWithState:&v179 objects:v194 count:16];
      if (v165) {
        continue;
      }
      break;
    }
  }
LABEL_98:

  [(SAServiceManager *)self scheduleBeaconGroupMetricSubmission];
}

void __39__SAServiceManager_didFetchAllDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SAServiceManager_didFetchAllDevices___block_invoke_2;
  v6[3] = &unk_1E68D7450;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __39__SAServiceManager_didFetchAllDevices___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 identifier];
    uint64_t v6 = [*(id *)(a1 + 40) macAddress];
    id v7 = objc_msgSend(v6, "fm_hexString");
    v11[0] = 68289539;
    v11[1] = 0;
    __int16 v12 = 2082;
    double v13 = "";
    __int16 v14 = 2113;
    double v15 = v5;
    __int16 v16 = 2113;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchBeaconGroup\", \"device\":\"%{private}@\", \"macAddress\":\"%{private}@\"}", (uint8_t *)v11, 0x26u);
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) macAddress];
  v10 = objc_msgSend(v9, "fm_hexString");
  [v8 setMacAddress:v10];
}

- (void)scheduleBeaconGroupMetricSubmission
{
  id v3 = [(SAServiceManager *)self scheduledMetricSubmissionBlock];

  if (v3)
  {
    id v4 = [(SAServiceManager *)self scheduledMetricSubmissionBlock];
    dispatch_block_cancel(v4);

    [(SAServiceManager *)self setScheduledMetricSubmissionBlock:0];
  }
  dispatch_time_t v5 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SAServiceManager_scheduleBeaconGroupMetricSubmission__block_invoke;
  block[3] = &unk_1E68D74C8;
  block[4] = self;
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_after(v5, (dispatch_queue_t)self->_queue, v6);
  [(SAServiceManager *)self setScheduledMetricSubmissionBlock:v6];
  id v7 = (id)MEMORY[0x1D25F7E90](v6);
  _Block_release(v7);
}

uint64_t __55__SAServiceManager_scheduleBeaconGroupMetricSubmission__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    if ([v3 beaconGroupComplete]) {
      dispatch_time_t v5 = "YES";
    }
    else {
      dispatch_time_t v5 = "NO";
    }
    int v6 = [*(id *)(a1 + 32) beaconGroupSafeLocationsMatch];
    LODWORD(v10) = 68289538;
    if (v6) {
      id v7 = "YES";
    }
    else {
      id v7 = "NO";
    }
    HIDWORD(v10) = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    __int16 v14 = v5;
    __int16 v15 = 2082;
    __int16 v16 = v7;
    _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring timed-out submitting metrics\", \"beaconGroupComplete\":\"%{public}s\", \"beaconGroupSafeLocationsMatch\":\"%{public}s\"}", (uint8_t *)&v10, 0x26u);
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "analytics", v10);
  objc_msgSend(v8, "submitBeaconMonitoringEvent:safeLocationsMatch:", objc_msgSend(*(id *)(a1 + 32), "beaconGroupComplete"), objc_msgSend(*(id *)(a1 + 32), "beaconGroupSafeLocationsMatch"));

  return [*(id *)(a1 + 32) setScheduledMetricSubmissionBlock:0];
}

- (int)beaconGroupSizeForDeviceType:(unint64_t)a3 isAppleAudioAccessory:(BOOL)a4
{
  if (a4) {
    int v4 = 3;
  }
  else {
    int v4 = 1;
  }
  if (a3 != 4) {
    int v4 = 0;
  }
  if (a3 == 16) {
    int v5 = 2;
  }
  else {
    int v5 = v4;
  }
  if (a3 - 1 >= 2) {
    return v5;
  }
  else {
    return 1;
  }
}

- (void)_ingestVisit:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SAServiceManager *)self service];

  if (v5)
  {
    int v6 = [v4 location];
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    uint64_t v9 = [v4 location];
    [v9 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v8, v10);

    id v12 = objc_alloc(MEMORY[0x1E4FAFF20]);
    __int16 v13 = [v4 location];
    [v13 horizontalUncertainty];
    double v15 = v14;
    __int16 v16 = [v4 entry];
    uint64_t v17 = [v4 exit];
    uint64_t v18 = [v4 date];
    double v19 = objc_msgSend(v12, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v16, v17, v18, 2, v11.latitude, v11.longitude, v15);

    v20 = [(SAServiceManager *)self service];
    [v20 ingestTAEvent:v19];
  }
  else
  {
    unint64_t v21 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 68289026;
      v22[1] = 0;
      __int16 v23 = 2082;
      uint64_t v24 = "";
      _os_log_impl(&dword_1D15FC000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:visit not ingesting TAEvent as SA service is down\"}", (uint8_t *)v22, 0x12u);
    }
  }
}

- (void)_fetchAndIngestLastVisit
{
  id v3 = objc_alloc(MEMORY[0x1E4F5CF58]);
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4F5D010]];
  int v5 = (void *)[v3 initWithAscending:0 confidence:v4 dateInterval:0 labelVisit:1 limit:&unk_1F27FBFC0];

  int v6 = [(SAServiceManager *)self routineManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke;
  v7[3] = &unk_1E68D7540;
  v7[4] = self;
  [v6 fetchStoredVisitsWithOptions:v5 handler:v7];
}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2;
  v7[3] = &unk_1E68D7450;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 count])
  {
    id v3 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2113;
      uint64_t v25 = v4;
      _os_log_impl(&dword_1D15FC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit got last visit\", \"visits\":\"%{private}@\"}", buf, 0x1Cu);
    }
    uint64_t v5 = [*(id *)(a1 + 32) firstObject];
    id v6 = v5;
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v7 = [v5 entry];
    if (!v7) {
      goto LABEL_16;
    }
    id v8 = (void *)v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    CLLocationDegrees v10 = [v6 entry];
    [v9 timeIntervalSinceDate:v10];
    if (v11 <= 0.0)
    {
    }
    else
    {
      id v12 = [v6 location];

      if (!v12)
      {
LABEL_16:

        return;
      }
      __int16 v13 = [v6 placeInference];
      id v8 = [v13 loiIdentifier];

      if (v8 && ([v6 exit], double v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        __int16 v16 = [*(id *)(a1 + 40) routineManager];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_43;
        v17[3] = &unk_1E68D7518;
        v17[4] = *(void *)(a1 + 40);
        id v18 = v6;
        id v19 = v8;
        [v16 fetchLocationOfInterestWithIdentifier:v19 withHandler:v17];
      }
      else
      {
        [*(id *)(a1 + 40) _ingestVisit:v6];
      }
    }

    goto LABEL_16;
  }
  double v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v21 = 0;
    __int16 v22 = 2082;
    __int16 v23 = "";
    _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit no last visit to bootstrap onto\"}", buf, 0x12u);
  }
}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_43(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2_44;
  block[3] = &unk_1E68D74F0;
  id v13 = v6;
  id v8 = a1[5];
  id v9 = a1[4];
  id v14 = v8;
  id v15 = v9;
  id v16 = v5;
  id v17 = a1[6];
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2_44(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 48), "_ingestVisit:", *(void *)(a1 + 40), v31, *(_OWORD *)v32, *(_OWORD *)&v32[16], v33);
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v31 = 68289539;
    *(_WORD *)uint64_t v32 = 2082;
    *(void *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(void *)&v32[12] = v3;
    *(_WORD *)&v32[20] = 2114;
    *(void *)&v32[22] = v4;
    id v5 = "{\"msg%{public}.0s\":\"#sa #loi error fetching LOI\", \"visit\":\"%{private}@\", \"error\":\"%{public}@\"}";
    id v6 = v2;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_4:
    _os_log_impl(&dword_1D15FC000, v6, v7, v5, (uint8_t *)&v31, 0x26u);
    goto LABEL_5;
  }
  id v8 = TASALog;
  if (!*(void *)(a1 + 56))
  {
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 64);
    uint64_t v31 = 68289539;
    *(_WORD *)uint64_t v32 = 2082;
    *(void *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(void *)&v32[12] = v29;
    *(_WORD *)&v32[20] = 2113;
    *(void *)&v32[22] = v30;
    id v5 = "{\"msg%{public}.0s\":\"#sa #loi received nil in return when fetching LOI\", \"visit\":\"%{private}@\", \"loiIde"
         "ntifier\":\"%{private}@\"}";
    id v6 = v8;
    os_log_type_t v7 = OS_LOG_TYPE_FAULT;
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v31 = 68289539;
    *(_WORD *)uint64_t v32 = 2082;
    *(void *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(void *)&v32[12] = v9;
    *(_WORD *)&v32[20] = 2113;
    *(void *)&v32[22] = v10;
    _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #loi received LOI\", \"loi\":\"%{private}@\", \"loiIdentifier\":\"%{private}@\"}", (uint8_t *)&v31, 0x26u);
  }
  uint64_t v11 = [*(id *)(a1 + 56) type];
  id v12 = [*(id *)(a1 + 48) service];

  if (v12)
  {
    if (v11) {
      uint64_t v13 = 2 * (v11 == 1);
    }
    else {
      uint64_t v13 = 1;
    }
    id v14 = objc_alloc(MEMORY[0x1E4FAFF40]);
    id v15 = [*(id *)(a1 + 56) location];
    [v15 latitude];
    double v17 = v16;
    id v18 = [*(id *)(a1 + 56) location];
    [v18 longitude];
    double v20 = v19;
    int v21 = [*(id *)(a1 + 56) location];
    [v21 horizontalUncertainty];
    double v23 = v22;
    __int16 v24 = [*(id *)(a1 + 56) location];
    uint64_t v25 = [v24 referenceFrame];
    uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
    v27 = (void *)[v14 initWithType:v13 latitude:v25 longitude:v26 horizontalAccuracy:v17 referenceFrame:v20 date:v23];

    id v28 = [*(id *)(a1 + 48) service];
    [v28 ingestTAEvent:v27];
  }
}

- (void)separationAlertsService:(id)a3 enableMonitoringForSeparations:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_log_type_t v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v20 = v4;
    _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr enableMonitoringForSeparations: %{public}d", buf, 8u);
  }
  id v8 = [(NSHashTable *)self->_clients allObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 separationAlertsServiceManager:self enableMonitoringForSeparations:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)separationAlertsService:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SAServiceManager *)self service];
  long long v15 = (void *)v14;
  if (v11 && (id)v14 == v10 && [v11 count])
  {

    if (v13)
    {
      long long v16 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = v16;
        *(_DWORD *)buf = 134283521;
        uint64_t v33 = [v11 count];
        _os_log_impl(&dword_1D15FC000, v17, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr notifyAboutDevices:%{private}ld", buf, 0xCu);
      }
      id v26 = v10;
      if ([v11 count])
      {
        unint64_t v18 = 0;
        do
        {
          double v19 = [(SAServiceManager *)self analytics];
          [v19 addAlertWithContext:v13];

          ++v18;
        }
        while (v18 < [v11 count]);
      }
      BOOL v20 = [(NSHashTable *)self->_clients allObjects];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v28;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * v24);
            if (objc_opt_respondsToSelector()) {
              [v25 separationAlertsServiceManager:self notifySeparationsForDevices:v11 withLocation:v12 withContext:v13];
            }
            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v22);
      }

      id v10 = v26;
    }
  }
  else
  {
  }
}

- (void)separationAlertsService:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SAServiceManager *)self service];

  if (v7 == v6)
  {
    id v8 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134283521;
      unint64_t v22 = a4;
      _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestBluetoothScan:%{private}#lx", buf, 0xCu);
    }
    uint64_t v9 = [(SAServiceManager *)self analytics];
    [v9 addAggressiveScanRequest:a4 == 1];

    id v10 = [(NSHashTable *)self->_clients allObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 separationAlertsServiceManager:self requestBluetoothScanForTypes:a4];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)separationAlertsService:(id)a3 requestLocationForType:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SAServiceManager *)self service];

  if (v7 == v6)
  {
    id v8 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134283521;
      unint64_t v23 = a4;
      _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestLocationForType:%{private}#lx", buf, 0xCu);
    }
    uint64_t v9 = [(SAServiceManager *)self analytics];
    id v10 = v9;
    if (a4) {
      [v9 addWifiLocationRequest:1];
    }
    else {
      [v9 addGpsLocationRequest:1];
    }

    uint64_t v11 = [(NSHashTable *)self->_clients allObjects];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v16 separationAlertsServiceManager:self requestLocationForType:a4];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)separationAlertsService:(id)a3 addGeofence:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAServiceManager *)self service];

  if (v7 && v8 == v6)
  {
    uint64_t v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr addGeofence", buf, 2u);
    }
    id v10 = [(NSHashTable *)self->_clients allObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 separationAlertsServiceManager:self addGeofence:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)separationAlertsService:(id)a3 removeGeofence:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAServiceManager *)self service];

  if (v7 && v8 == v6)
  {
    uint64_t v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr removeGeofence", buf, 2u);
    }
    id v10 = [(NSHashTable *)self->_clients allObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 separationAlertsServiceManager:self removeGeofence:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)separationAlertsService:(id)a3 requestStateForRegion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAServiceManager *)self service];

  if (v7 && v8 == v6)
  {
    uint64_t v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestStateForRegion", buf, 2u);
    }
    id v10 = [(NSHashTable *)self->_clients allObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 separationAlertsServiceManager:self requestStateForRegion:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)separationAlertsService:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SAServiceManager *)self service];

  if (v10 == v8)
  {
    uint64_t v11 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v25 = a4;
      _os_log_impl(&dword_1D15FC000, v11, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr scheduleSATimeEvent:%{public}#lf", buf, 0xCu);
    }
    uint64_t v12 = [(SAServiceManager *)self analytics];
    [v12 addWakeTimerRequest];

    uint64_t v13 = [(NSHashTable *)self->_clients allObjects];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 separationAlertsServiceManager:self scheduleSATimeEvent:v9 forAlarm:a4];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)separationAlertsService:(id)a3 cancelSATimeEventForAlarm:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SAServiceManager *)self service];

  if (v8 == v6)
  {
    id v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289282;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr cancelSATimeEventForAlarm\", \"uuid\":\"%{public}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
    id v10 = [(NSHashTable *)self->_clients allObjects];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 separationAlertsServiceManager:self cancelSATimeEventForAlarm:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)separationAlertsServiceStartBackgroundScanning:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAServiceManager *)self service];

  if (v5 == v4)
  {
    id v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v19 = 2082;
      long long v20 = "";
      _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr startBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
    }
    id v7 = [(NSHashTable *)self->_clients allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 separationAlertsServiceManagerStartBackgroundScanning:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)separationAlertsServiceStopBackgroundScanning:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAServiceManager *)self service];

  if (v5 == v4)
  {
    id v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v19 = 2082;
      long long v20 = "";
      _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr stopBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
    }
    id v7 = [(NSHashTable *)self->_clients allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 separationAlertsServiceManagerStopBackgroundScanning:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)separationAlertsServiceStopLongAggressiveScan:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAServiceManager *)self service];

  if (v5 == v4)
  {
    id v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v19 = 2082;
      long long v20 = "";
      _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr stopLongAggressiveScan\"}", (uint8_t *)&buf, 0x12u);
    }
    id v7 = [(NSHashTable *)self->_clients allObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 separationAlertsServiceManagerStopLongAggressiveScan:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)separationAlertsServiceFetchLastVisit:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAServiceManager *)self service];

  if (v5 == v4)
  {
    id v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      uint64_t v9 = "";
      _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr fetchLastVisit\"}", (uint8_t *)v7, 0x12u);
    }
    [(SAServiceManager *)self _fetchAndIngestLastVisit];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (SAService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (SAAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (SAAudioAccessory)audioAcccessory
{
  return self->_audioAcccessory;
}

- (void)setAudioAcccessory:(id)a3
{
}

- (void)setNextAnalyticsSubmission:(id)a3
{
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (void)setHasAttemptedToIngestLastVisitAtStartup:(BOOL)a3
{
  self->_hasAttemptedToIngestLastVisitAtStartup = a3;
}

- (BOOL)beaconGroupComplete
{
  return self->_beaconGroupComplete;
}

- (void)setBeaconGroupComplete:(BOOL)a3
{
  self->_beaconGroupComplete = a3;
}

- (BOOL)beaconGroupSafeLocationsMatch
{
  return self->_beaconGroupSafeLocationsMatch;
}

- (void)setBeaconGroupSafeLocationsMatch:(BOOL)a3
{
  self->_beaconGroupSafeLocationsMatch = a3;
}

- (id)scheduledMetricSubmissionBlock
{
  return self->_scheduledMetricSubmissionBlock;
}

- (void)setScheduledMetricSubmissionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduledMetricSubmissionBlock, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_nextAnalyticsSubmission, 0);
  objc_storeStrong((id *)&self->_audioAcccessory, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_separationMonitoringSession, 0);
  objc_storeStrong((id *)&self->_ownerSession, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
}

+ (void)convertBeaconToDeviceType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D15FC000, a2, OS_LOG_TYPE_FAULT, "#sa ServiceMgr received unknown device type, %{private}@", (uint8_t *)&v2, 0xCu);
}

@end