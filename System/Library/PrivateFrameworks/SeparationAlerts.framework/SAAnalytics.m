@interface SAAnalytics
- (BOOL)isAllUsingSameSafe;
- (NSDate)lastActivated;
- (NSDate)lastSafeEntry;
- (NSDate)lastTravelStart;
- (NSDate)lastUnsafeEntry;
- (NSMutableDictionary)numEnabledPerType;
- (SAAnalytics)init;
- (SAAnalytics)initWithSettings:(id)a3;
- (double)aggScanDuration;
- (double)aggScanDurationForFindingRelevantItemsOnly;
- (double)publishingInterval;
- (unint64_t)aggActiveDuration;
- (unint64_t)aggInSafeDuration;
- (unint64_t)aggInTravelDuration;
- (unint64_t)aggInUnsafeDuration;
- (unint64_t)numAlerts;
- (unint64_t)numAlertsLeftBehind;
- (unint64_t)numAlertsTraveling;
- (unint64_t)numBTLeftBehindRequests;
- (unint64_t)numBTRequests;
- (unint64_t)numBTTravelingRequests;
- (unint64_t)numDevicesAtSafeExit;
- (unint64_t)numEnabled;
- (unint64_t)numGpsRequests;
- (unint64_t)numSafe;
- (unint64_t)numSafeInUse;
- (unint64_t)numTimers;
- (unint64_t)numUnsafe;
- (unint64_t)numUnsafeWithLOI;
- (unint64_t)numUnsafeWithoutLOI;
- (unint64_t)numWifiRequests;
- (void)addAggressiveScanRequest:(BOOL)a3;
- (void)addAlertWithContext:(id)a3;
- (void)addDeviceFetchResultCount:(unint64_t)a3 type1count:(unint64_t)a4 type2count:(unint64_t)a5 type3count:(unint64_t)a6 type4count:(unint64_t)a7 type5count:(unint64_t)a8 type6count:(unint64_t)a9 type7count:(unint64_t)a10 type8count:(unint64_t)a11 safeCount:(unint64_t)a12 usingSameSafe:(BOOL)a13;
- (void)addGpsLocationRequest:(BOOL)a3;
- (void)addScanDuration:(double)a3;
- (void)addScanDurationForFindingRelevantItemsOnly:(double)a3;
- (void)addVisit:(BOOL)a3 withRadius:(unint64_t)a4;
- (void)addWakeTimerRequest;
- (void)addWifiLocationRequest:(BOOL)a3;
- (void)publishAndResetAggregation;
- (void)resetAggregation;
- (void)setActiveState:(BOOL)a3;
- (void)setAggActiveDuration:(unint64_t)a3;
- (void)setAggInSafeDuration:(unint64_t)a3;
- (void)setAggInTravelDuration:(unint64_t)a3;
- (void)setAggInUnsafeDuration:(unint64_t)a3;
- (void)setAggScanDuration:(double)a3;
- (void)setAggScanDurationForFindingRelevantItemsOnly:(double)a3;
- (void)setInSafeLocationState:(BOOL)a3;
- (void)setInTravelState:(BOOL)a3;
- (void)setInUnsafeLocationState:(BOOL)a3;
- (void)setIsAllUsingSameSafe:(BOOL)a3;
- (void)setLastActivated:(id)a3;
- (void)setLastSafeEntry:(id)a3;
- (void)setLastTravelStart:(id)a3;
- (void)setLastUnsafeEntry:(id)a3;
- (void)setNumAlerts:(unint64_t)a3;
- (void)setNumAlertsLeftBehind:(unint64_t)a3;
- (void)setNumAlertsTraveling:(unint64_t)a3;
- (void)setNumBTLeftBehindRequests:(unint64_t)a3;
- (void)setNumBTRequests:(unint64_t)a3;
- (void)setNumBTTravelingRequests:(unint64_t)a3;
- (void)setNumDevicesAtSafeExit:(unint64_t)a3;
- (void)setNumEnabled:(unint64_t)a3;
- (void)setNumEnabledPerType:(id)a3;
- (void)setNumGpsRequests:(unint64_t)a3;
- (void)setNumSafe:(unint64_t)a3;
- (void)setNumSafeInUse:(unint64_t)a3;
- (void)setNumTimers:(unint64_t)a3;
- (void)setNumUnsafe:(unint64_t)a3;
- (void)setNumUnsafeWithLOI:(unint64_t)a3;
- (void)setNumUnsafeWithoutLOI:(unint64_t)a3;
- (void)setNumWifiRequests:(unint64_t)a3;
- (void)submitAlertRateEvent:(id)a3 alertType:(id)a4;
- (void)submitBeaconMonitoringEvent:(BOOL)a3 safeLocationsMatch:(BOOL)a4;
- (void)submitDefaultAlertRateEvent;
- (void)submitEvent:(id)a3 content:(id)a4;
@end

@implementation SAAnalytics

- (SAAnalytics)init
{
  v3 = objc_alloc_init(SAAnalyticsSettings);
  v4 = [(SAAnalytics *)self initWithSettings:v3];

  return v4;
}

- (SAAnalytics)initWithSettings:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAAnalytics;
  v6 = [(SAAnalytics *)&v14 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }
  lastActivated = v7->_lastActivated;
  v7->_lastActivated = 0;

  lastSafeEntry = v7->_lastSafeEntry;
  v7->_lastSafeEntry = 0;

  lastUnsafeEntry = v7->_lastUnsafeEntry;
  v7->_lastUnsafeEntry = 0;

  lastTravelStart = v7->_lastTravelStart;
  v7->_lastTravelStart = 0;

  [(SAAnalytics *)v7 setNumDevicesAtSafeExit:-1];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(SAAnalytics *)v7 setNumEnabledPerType:v12];

  return v7;
}

- (double)publishingInterval
{
  return 14400.0;
}

- (void)submitEvent:(id)a3 content:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SAAnalyticsSettings *)self->_settings enableSubmission];
  v9 = TASALog;
  BOOL v10 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2113;
      id v17 = v6;
      __int16 v18 = 2113;
      id v19 = v7;
      _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAAnalytics Submitting analytics event\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
    }
    id v11 = v7;
    AnalyticsSendEventLazy();
  }
  else if (v10)
  {
    *(_DWORD *)buf = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2113;
    id v19 = v7;
    _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAAnalytics submission not enabled\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
  }
}

id __35__SAAnalytics_submitEvent_content___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)publishAndResetAggregation
{
  v82[31] = *MEMORY[0x1E4F143B8];
  v3 = [(SAAnalytics *)self lastActivated];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] now];
    id v5 = [(SAAnalytics *)self lastActivated];
    [v4 timeIntervalSinceDate:v5];
    [(SAAnalytics *)self setAggActiveDuration:[(SAAnalytics *)self aggActiveDuration] + (unint64_t)v6];

    id v7 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastActivated:v7];
  }
  BOOL v8 = [(SAAnalytics *)self lastSafeEntry];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] now];
    BOOL v10 = [(SAAnalytics *)self lastSafeEntry];
    [v9 timeIntervalSinceDate:v10];
    [(SAAnalytics *)self setAggInSafeDuration:[(SAAnalytics *)self aggInSafeDuration] + (unint64_t)v11];

    id v12 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastSafeEntry:v12];
  }
  int v13 = [(SAAnalytics *)self lastUnsafeEntry];

  if (v13)
  {
    __int16 v14 = [MEMORY[0x1E4F1C9C8] now];
    v15 = [(SAAnalytics *)self lastUnsafeEntry];
    [v14 timeIntervalSinceDate:v15];
    [(SAAnalytics *)self setAggInUnsafeDuration:[(SAAnalytics *)self aggInUnsafeDuration] + (unint64_t)v16];

    id v17 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastUnsafeEntry:v17];
  }
  __int16 v18 = [(SAAnalytics *)self lastTravelStart];

  if (v18)
  {
    id v19 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v20 = [(SAAnalytics *)self lastTravelStart];
    [v19 timeIntervalSinceDate:v20];
    [(SAAnalytics *)self setAggInTravelDuration:[(SAAnalytics *)self aggInTravelDuration] + (unint64_t)v21];

    v22 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastTravelStart:v22];
  }
  v81[0] = @"numAlerts";
  v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numAlerts](self, "numAlerts"));
  v82[0] = v80;
  v81[1] = @"numAlertsLeftBehind";
  v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numAlertsLeftBehind](self, "numAlertsLeftBehind"));
  v82[1] = v79;
  v81[2] = @"numAlertsTraveling";
  v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numAlertsTraveling](self, "numAlertsTraveling"));
  v82[2] = v78;
  v81[3] = @"numEnabled";
  v77 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numEnabled](self, "numEnabled"));
  v82[3] = v77;
  v81[4] = @"numItems";
  v76 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v23 = [v76 objectForKey:&unk_1F27FC008];
  v75 = (void *)v23;
  if (v23) {
    v24 = (void *)v23;
  }
  else {
    v24 = &unk_1F27FC020;
  }
  v82[4] = v24;
  v81[5] = @"numAccessories";
  v74 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v25 = [v74 objectForKey:&unk_1F27FC038];
  v73 = (void *)v25;
  if (v25) {
    v26 = (void *)v25;
  }
  else {
    v26 = &unk_1F27FC020;
  }
  v82[5] = v26;
  v81[6] = @"numBTLE";
  v72 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v27 = [v72 objectForKey:&unk_1F27FC050];
  v71 = (void *)v27;
  if (v27) {
    v28 = (void *)v27;
  }
  else {
    v28 = &unk_1F27FC020;
  }
  v82[6] = v28;
  v81[7] = @"numDevices";
  v70 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v29 = [v70 objectForKey:&unk_1F27FC068];
  v69 = (void *)v29;
  if (v29) {
    v30 = (void *)v29;
  }
  else {
    v30 = &unk_1F27FC020;
  }
  v82[7] = v30;
  v81[8] = @"numiPhone";
  v68 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v31 = [v68 objectForKey:&unk_1F27FC080];
  v67 = (void *)v31;
  if (v31) {
    v32 = (void *)v31;
  }
  else {
    v32 = &unk_1F27FC020;
  }
  v82[8] = v32;
  v81[9] = @"numiPad";
  v66 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v33 = [v66 objectForKey:&unk_1F27FC098];
  v65 = (void *)v33;
  if (v33) {
    v34 = (void *)v33;
  }
  else {
    v34 = &unk_1F27FC020;
  }
  v82[9] = v34;
  v81[10] = @"numMacBook";
  v64 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v35 = [v64 objectForKey:&unk_1F27FC0B0];
  v63 = (void *)v35;
  if (v35) {
    v36 = (void *)v35;
  }
  else {
    v36 = &unk_1F27FC020;
  }
  v82[10] = v36;
  v81[11] = @"numAirPods";
  v62 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v37 = [v62 objectForKey:&unk_1F27FC0C8];
  v61 = (void *)v37;
  if (v37) {
    v38 = (void *)v37;
  }
  else {
    v38 = &unk_1F27FC020;
  }
  v82[11] = v38;
  v81[12] = @"numSafe";
  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numSafe](self, "numSafe"));
  v82[12] = v60;
  v81[13] = @"numSafeInUse";
  v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numSafeInUse](self, "numSafeInUse"));
  v82[13] = v59;
  v81[14] = @"isAllUsingSameSafe";
  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[SAAnalytics isAllUsingSameSafe](self, "isAllUsingSameSafe"));
  v82[14] = v58;
  v81[15] = @"numBTRequests";
  v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numBTRequests](self, "numBTRequests"));
  v82[15] = v57;
  v81[16] = @"numBTLeftBehindRequests";
  v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numBTLeftBehindRequests](self, "numBTLeftBehindRequests"));
  v82[16] = v56;
  v81[17] = @"numBTTravelingRequests";
  v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numBTTravelingRequests](self, "numBTTravelingRequests"));
  v82[17] = v55;
  v81[18] = @"numGpsRequests";
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numGpsRequests](self, "numGpsRequests"));
  v82[18] = v54;
  v81[19] = @"numWifiRequests";
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numWifiRequests](self, "numWifiRequests"));
  v82[19] = v53;
  v81[20] = @"numTimers";
  v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numTimers](self, "numTimers"));
  v82[20] = v52;
  v81[21] = @"numDevicesAtSafeExit";
  v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numDevicesAtSafeExit](self, "numDevicesAtSafeExit"));
  v82[21] = v51;
  v81[22] = @"numUnsafe";
  v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numUnsafe](self, "numUnsafe"));
  v82[22] = v50;
  v81[23] = @"numUnsafeWithLOI";
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numUnsafeWithLOI](self, "numUnsafeWithLOI"));
  v82[23] = v49;
  v81[24] = @"numUnsafeWithoutLOI";
  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics numUnsafeWithoutLOI](self, "numUnsafeWithoutLOI"));
  v82[24] = v39;
  v81[25] = @"aggActiveDuration";
  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics aggActiveDuration](self, "aggActiveDuration"));
  v82[25] = v40;
  v81[26] = @"aggInSafeDuration";
  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics aggInSafeDuration](self, "aggInSafeDuration"));
  v82[26] = v41;
  v81[27] = @"aggInUnsafeDuration";
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics aggInUnsafeDuration](self, "aggInUnsafeDuration"));
  v82[27] = v42;
  v81[28] = @"aggInTravelDuration";
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SAAnalytics aggInTravelDuration](self, "aggInTravelDuration"));
  v82[28] = v43;
  v81[29] = @"totalScanDuration";
  v44 = NSNumber;
  [(SAAnalytics *)self aggScanDuration];
  v45 = objc_msgSend(v44, "numberWithDouble:");
  v82[29] = v45;
  v81[30] = @"totalScanDurationForFindingRelevantItemsOnly";
  v46 = NSNumber;
  [(SAAnalytics *)self aggScanDurationForFindingRelevantItemsOnly];
  v47 = objc_msgSend(v46, "numberWithDouble:");
  v82[30] = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:31];

  [(SAAnalytics *)self submitEvent:@"com.apple.clx.alert.heartbeats" content:v48];
  [(SAAnalytics *)self resetAggregation];
}

- (void)resetAggregation
{
  [(SAAnalytics *)self setNumAlerts:0];
  [(SAAnalytics *)self setNumAlertsLeftBehind:0];
  [(SAAnalytics *)self setNumAlertsTraveling:0];
  [(SAAnalytics *)self setNumBTRequests:0];
  [(SAAnalytics *)self setNumBTLeftBehindRequests:0];
  [(SAAnalytics *)self setNumBTTravelingRequests:0];
  [(SAAnalytics *)self setNumGpsRequests:0];
  [(SAAnalytics *)self setNumWifiRequests:0];
  [(SAAnalytics *)self setNumTimers:0];
  [(SAAnalytics *)self setNumDevicesAtSafeExit:-1];
  [(SAAnalytics *)self setNumUnsafe:0];
  [(SAAnalytics *)self setNumUnsafeWithLOI:0];
  [(SAAnalytics *)self setNumUnsafeWithoutLOI:0];
  [(SAAnalytics *)self setAggActiveDuration:0];
  [(SAAnalytics *)self setAggInSafeDuration:0];
  [(SAAnalytics *)self setAggInUnsafeDuration:0];
  [(SAAnalytics *)self setAggInTravelDuration:0];
  [(SAAnalytics *)self setAggScanDuration:0.0];
  [(SAAnalytics *)self setAggScanDurationForFindingRelevantItemsOnly:0.0];
}

- (void)submitDefaultAlertRateEvent
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v24[0] = @"numOfAlertsPerDay";
        v24[1] = @"deviceType";
        v25[0] = &unk_1F27FC020;
        v25[1] = v3;
        v24[2] = @"numEnabled";
        v4 = [(SAAnalytics *)self numEnabledPerType];
        uint64_t v5 = [v4 objectForKey:v3];
        double v6 = (void *)v5;
        if (v5) {
          id v7 = (void *)v5;
        }
        else {
          id v7 = &unk_1F27FC020;
        }
        v24[3] = @"alertType";
        v25[2] = v7;
        v25[3] = &unk_1F27FC068;
        BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

        [(SAAnalytics *)self submitEvent:@"com.apple.clx.sa.alertRate" content:v8];
        v22[0] = @"numOfAlertsPerDay";
        v22[1] = @"deviceType";
        v23[0] = &unk_1F27FC020;
        v23[1] = v3;
        v22[2] = @"numEnabled";
        v9 = [(SAAnalytics *)self numEnabledPerType];
        uint64_t v10 = [v9 objectForKey:v3];
        double v11 = (void *)v10;
        if (v10) {
          id v12 = (void *)v10;
        }
        else {
          id v12 = &unk_1F27FC020;
        }
        v22[3] = @"alertType";
        v23[2] = v12;
        v23[3] = &unk_1F27FC008;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

        [(SAAnalytics *)self submitEvent:@"com.apple.clx.sa.alertRate" content:v13];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v17);
  }
}

- (void)submitAlertRateEvent:(id)a3 alertType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SAAnalyticsSettings *)self->_settings enableSubmission])
  {
    BOOL v8 = [(SAAnalytics *)self numEnabledPerType];
    v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v15[0] = &unk_1F27FC0E0;
      v15[1] = v6;
      uint64_t v10 = [(SAAnalytics *)self numEnabledPerType];
      double v11 = [v10 objectForKey:v6];
      v14[3] = @"alertType";
      v15[2] = v11;
      v15[3] = v7;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

      [(SAAnalytics *)self submitEvent:@"com.apple.clx.sa.alertRate" content:v12];
    }
    else
    {
      int v13 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        long long v19 = "";
        _os_log_impl(&dword_1D15FC000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"surfacing alert but there is no device being monitored\"}", buf, 0x12u);
      }
    }
  }
}

- (void)submitBeaconMonitoringEvent:(BOOL)a3 safeLocationsMatch:(BOOL)a4
{
  BOOL v4 = a4;
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"beaconGroupsComplete";
  id v6 = [NSNumber numberWithBool:a3];
  v9[1] = @"safeLocationsMatch";
  v10[0] = v6;
  id v7 = [NSNumber numberWithBool:v4];
  v10[1] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(SAAnalytics *)self submitEvent:@"com.apple.clx.sa.beaconMonitoring" content:v8];
}

- (void)addAlertWithContext:(id)a3
{
  id v4 = a3;
  [(SAAnalytics *)self setNumAlerts:[(SAAnalytics *)self numAlerts] + 1];
  uint64_t v5 = [v4 objectForKeyedSubscript:&unk_1F27FC0F8];

  uint64_t v6 = [v5 integerValue];
  if (v6 == 1)
  {
    unint64_t v8 = [(SAAnalytics *)self numAlertsLeftBehind] + 1;
    [(SAAnalytics *)self setNumAlertsLeftBehind:v8];
  }
  else if (v6 == 2)
  {
    unint64_t v7 = [(SAAnalytics *)self numAlertsTraveling] + 1;
    [(SAAnalytics *)self setNumAlertsTraveling:v7];
  }
}

- (void)addScanDuration:(double)a3
{
  [(SAAnalytics *)self aggScanDuration];
  double v6 = v5 + a3;
  [(SAAnalytics *)self setAggScanDuration:v6];
}

- (void)addScanDurationForFindingRelevantItemsOnly:(double)a3
{
  [(SAAnalytics *)self aggScanDurationForFindingRelevantItemsOnly];
  double v6 = v5 + a3;
  [(SAAnalytics *)self setAggScanDurationForFindingRelevantItemsOnly:v6];
}

- (void)addDeviceFetchResultCount:(unint64_t)a3 type1count:(unint64_t)a4 type2count:(unint64_t)a5 type3count:(unint64_t)a6 type4count:(unint64_t)a7 type5count:(unint64_t)a8 type6count:(unint64_t)a9 type7count:(unint64_t)a10 type8count:(unint64_t)a11 safeCount:(unint64_t)a12 usingSameSafe:(BOOL)a13
{
  [(SAAnalytics *)self setNumEnabled:a3];
  long long v19 = [(SAAnalytics *)self numEnabledPerType];
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:a4];
  [v19 setObject:v20 forKey:&unk_1F27FC008];

  long long v21 = [(SAAnalytics *)self numEnabledPerType];
  v22 = [NSNumber numberWithUnsignedInteger:a5];
  [v21 setObject:v22 forKey:&unk_1F27FC038];

  uint64_t v23 = [(SAAnalytics *)self numEnabledPerType];
  v24 = [NSNumber numberWithUnsignedInteger:a6];
  [v23 setObject:v24 forKey:&unk_1F27FC050];

  uint64_t v25 = [(SAAnalytics *)self numEnabledPerType];
  v26 = [NSNumber numberWithUnsignedInteger:a7];
  [v25 setObject:v26 forKey:&unk_1F27FC068];

  uint64_t v27 = [(SAAnalytics *)self numEnabledPerType];
  v28 = [NSNumber numberWithUnsignedInteger:a8];
  [v27 setObject:v28 forKey:&unk_1F27FC080];

  uint64_t v29 = [(SAAnalytics *)self numEnabledPerType];
  v30 = [NSNumber numberWithUnsignedInteger:a9];
  [v29 setObject:v30 forKey:&unk_1F27FC098];

  uint64_t v31 = [(SAAnalytics *)self numEnabledPerType];
  v32 = [NSNumber numberWithUnsignedInteger:a10];
  [v31 setObject:v32 forKey:&unk_1F27FC0B0];

  uint64_t v33 = [(SAAnalytics *)self numEnabledPerType];
  v34 = [NSNumber numberWithUnsignedInteger:a11];
  [v33 setObject:v34 forKey:&unk_1F27FC0C8];

  [(SAAnalytics *)self setNumSafeInUse:a12];
  [(SAAnalytics *)self setIsAllUsingSameSafe:a13];
}

- (void)addAggressiveScanRequest:(BOOL)a3
{
  BOOL v3 = a3;
  [(SAAnalytics *)self setNumBTRequests:[(SAAnalytics *)self numBTRequests] + 1];
  if (v3)
  {
    unint64_t v5 = [(SAAnalytics *)self numBTTravelingRequests] + 1;
    [(SAAnalytics *)self setNumBTTravelingRequests:v5];
  }
  else
  {
    unint64_t v6 = [(SAAnalytics *)self numBTLeftBehindRequests] + 1;
    [(SAAnalytics *)self setNumBTLeftBehindRequests:v6];
  }
}

- (void)addGpsLocationRequest:(BOOL)a3
{
  unint64_t v4 = [(SAAnalytics *)self numGpsRequests] + 1;
  [(SAAnalytics *)self setNumGpsRequests:v4];
}

- (void)addWifiLocationRequest:(BOOL)a3
{
  unint64_t v4 = [(SAAnalytics *)self numWifiRequests] + 1;
  [(SAAnalytics *)self setNumWifiRequests:v4];
}

- (void)addWakeTimerRequest
{
  unint64_t v3 = [(SAAnalytics *)self numTimers] + 1;
  [(SAAnalytics *)self setNumTimers:v3];
}

- (void)addVisit:(BOOL)a3 withRadius:(unint64_t)a4
{
  BOOL v4 = a3;
  [(SAAnalytics *)self setNumUnsafe:[(SAAnalytics *)self numUnsafe] + 1];
  if (v4)
  {
    unint64_t v6 = [(SAAnalytics *)self numUnsafeWithLOI] + 1;
    [(SAAnalytics *)self setNumUnsafeWithLOI:v6];
  }
  else
  {
    unint64_t v7 = [(SAAnalytics *)self numUnsafeWithoutLOI] + 1;
    [(SAAnalytics *)self setNumUnsafeWithoutLOI:v7];
  }
}

- (void)setActiveState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SAAnalytics *)self lastActivated];

  if (v3)
  {
    if (v5) {
      return;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastActivated:v10];
    lastActivated = (NSDate *)v10;
  }
  else
  {
    if (!v5) {
      return;
    }
    unint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    unint64_t v8 = [(SAAnalytics *)self lastActivated];
    [v7 timeIntervalSinceDate:v8];
    [(SAAnalytics *)self setAggActiveDuration:[(SAAnalytics *)self aggActiveDuration] + (unint64_t)v9];

    lastActivated = self->_lastActivated;
    self->_lastActivated = 0;
  }
}

- (void)setInSafeLocationState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SAAnalytics *)self lastSafeEntry];

  if (v3)
  {
    if (v5) {
      return;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastSafeEntry:v10];
    lastSafeEntry = (NSDate *)v10;
  }
  else
  {
    if (!v5) {
      return;
    }
    unint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    unint64_t v8 = [(SAAnalytics *)self lastSafeEntry];
    [v7 timeIntervalSinceDate:v8];
    [(SAAnalytics *)self setAggInSafeDuration:[(SAAnalytics *)self aggInSafeDuration] + (unint64_t)v9];

    lastSafeEntry = self->_lastSafeEntry;
    self->_lastSafeEntry = 0;
  }
}

- (void)setInUnsafeLocationState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SAAnalytics *)self lastUnsafeEntry];

  if (v3)
  {
    if (v5) {
      return;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastUnsafeEntry:v10];
    lastUnsafeEntry = (NSDate *)v10;
  }
  else
  {
    if (!v5) {
      return;
    }
    unint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    unint64_t v8 = [(SAAnalytics *)self lastUnsafeEntry];
    [v7 timeIntervalSinceDate:v8];
    [(SAAnalytics *)self setAggInUnsafeDuration:[(SAAnalytics *)self aggInUnsafeDuration] + (unint64_t)v9];

    lastUnsafeEntry = self->_lastUnsafeEntry;
    self->_lastUnsafeEntry = 0;
  }
}

- (void)setInTravelState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SAAnalytics *)self lastTravelStart];

  if (v3)
  {
    if (v5) {
      return;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [(SAAnalytics *)self setLastTravelStart:v10];
    lastTravelStart = (NSDate *)v10;
  }
  else
  {
    if (!v5) {
      return;
    }
    unint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    unint64_t v8 = [(SAAnalytics *)self lastTravelStart];
    [v7 timeIntervalSinceDate:v8];
    [(SAAnalytics *)self setAggInTravelDuration:[(SAAnalytics *)self aggInTravelDuration] + (unint64_t)v9];

    lastTravelStart = self->_lastTravelStart;
    self->_lastTravelStart = 0;
  }
}

- (unint64_t)numAlerts
{
  return self->_numAlerts;
}

- (void)setNumAlerts:(unint64_t)a3
{
  self->_numAlerts = a3;
}

- (unint64_t)numAlertsLeftBehind
{
  return self->_numAlertsLeftBehind;
}

- (void)setNumAlertsLeftBehind:(unint64_t)a3
{
  self->_numAlertsLeftBehind = a3;
}

- (unint64_t)numAlertsTraveling
{
  return self->_numAlertsTraveling;
}

- (void)setNumAlertsTraveling:(unint64_t)a3
{
  self->_numAlertsTraveling = a3;
}

- (unint64_t)numEnabled
{
  return self->_numEnabled;
}

- (void)setNumEnabled:(unint64_t)a3
{
  self->_numEnabled = a3;
}

- (NSMutableDictionary)numEnabledPerType
{
  return self->_numEnabledPerType;
}

- (void)setNumEnabledPerType:(id)a3
{
}

- (unint64_t)numSafe
{
  return self->_numSafe;
}

- (void)setNumSafe:(unint64_t)a3
{
  self->_numSafe = a3;
}

- (unint64_t)numSafeInUse
{
  return self->_numSafeInUse;
}

- (void)setNumSafeInUse:(unint64_t)a3
{
  self->_numSafeInUse = a3;
}

- (BOOL)isAllUsingSameSafe
{
  return self->_isAllUsingSameSafe;
}

- (void)setIsAllUsingSameSafe:(BOOL)a3
{
  self->_isAllUsingSameSafe = a3;
}

- (unint64_t)numBTRequests
{
  return self->_numBTRequests;
}

- (void)setNumBTRequests:(unint64_t)a3
{
  self->_numBTRequests = a3;
}

- (unint64_t)numBTLeftBehindRequests
{
  return self->_numBTLeftBehindRequests;
}

- (void)setNumBTLeftBehindRequests:(unint64_t)a3
{
  self->_numBTLeftBehindRequests = a3;
}

- (unint64_t)numBTTravelingRequests
{
  return self->_numBTTravelingRequests;
}

- (void)setNumBTTravelingRequests:(unint64_t)a3
{
  self->_numBTTravelingRequests = a3;
}

- (unint64_t)numGpsRequests
{
  return self->_numGpsRequests;
}

- (void)setNumGpsRequests:(unint64_t)a3
{
  self->_numGpsRequests = a3;
}

- (unint64_t)numWifiRequests
{
  return self->_numWifiRequests;
}

- (void)setNumWifiRequests:(unint64_t)a3
{
  self->_numWifiRequests = a3;
}

- (unint64_t)numTimers
{
  return self->_numTimers;
}

- (void)setNumTimers:(unint64_t)a3
{
  self->_numTimers = a3;
}

- (unint64_t)numDevicesAtSafeExit
{
  return self->_numDevicesAtSafeExit;
}

- (void)setNumDevicesAtSafeExit:(unint64_t)a3
{
  self->_numDevicesAtSafeExit = a3;
}

- (unint64_t)numUnsafe
{
  return self->_numUnsafe;
}

- (void)setNumUnsafe:(unint64_t)a3
{
  self->_numUnsafe = a3;
}

- (unint64_t)numUnsafeWithLOI
{
  return self->_numUnsafeWithLOI;
}

- (void)setNumUnsafeWithLOI:(unint64_t)a3
{
  self->_numUnsafeWithLOI = a3;
}

- (unint64_t)numUnsafeWithoutLOI
{
  return self->_numUnsafeWithoutLOI;
}

- (void)setNumUnsafeWithoutLOI:(unint64_t)a3
{
  self->_numUnsafeWithoutLOI = a3;
}

- (unint64_t)aggActiveDuration
{
  return self->_aggActiveDuration;
}

- (void)setAggActiveDuration:(unint64_t)a3
{
  self->_aggActiveDuration = a3;
}

- (unint64_t)aggInSafeDuration
{
  return self->_aggInSafeDuration;
}

- (void)setAggInSafeDuration:(unint64_t)a3
{
  self->_aggInSafeDuration = a3;
}

- (unint64_t)aggInUnsafeDuration
{
  return self->_aggInUnsafeDuration;
}

- (void)setAggInUnsafeDuration:(unint64_t)a3
{
  self->_aggInUnsafeDuration = a3;
}

- (unint64_t)aggInTravelDuration
{
  return self->_aggInTravelDuration;
}

- (void)setAggInTravelDuration:(unint64_t)a3
{
  self->_aggInTravelDuration = a3;
}

- (double)aggScanDuration
{
  return self->_aggScanDuration;
}

- (void)setAggScanDuration:(double)a3
{
  self->_aggScanDuration = a3;
}

- (double)aggScanDurationForFindingRelevantItemsOnly
{
  return self->_aggScanDurationForFindingRelevantItemsOnly;
}

- (void)setAggScanDurationForFindingRelevantItemsOnly:(double)a3
{
  self->_aggScanDurationForFindingRelevantItemsOnly = a3;
}

- (NSDate)lastActivated
{
  return self->_lastActivated;
}

- (void)setLastActivated:(id)a3
{
}

- (NSDate)lastSafeEntry
{
  return self->_lastSafeEntry;
}

- (void)setLastSafeEntry:(id)a3
{
}

- (NSDate)lastUnsafeEntry
{
  return self->_lastUnsafeEntry;
}

- (void)setLastUnsafeEntry:(id)a3
{
}

- (NSDate)lastTravelStart
{
  return self->_lastTravelStart;
}

- (void)setLastTravelStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTravelStart, 0);
  objc_storeStrong((id *)&self->_lastUnsafeEntry, 0);
  objc_storeStrong((id *)&self->_lastSafeEntry, 0);
  objc_storeStrong((id *)&self->_lastActivated, 0);
  objc_storeStrong((id *)&self->_numEnabledPerType, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end