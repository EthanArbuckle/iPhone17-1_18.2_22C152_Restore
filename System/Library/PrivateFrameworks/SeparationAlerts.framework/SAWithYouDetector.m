@interface SAWithYouDetector
+ (id)convertSAWithYouLongScanContextToString:(unint64_t)a3;
+ (id)convertSAWithYouStatusToString:(unint64_t)a3;
- (BOOL)_deviceIsWatch:(id)a3;
- (BOOL)_enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:(id)a3;
- (BOOL)_isOnlyMonitoringLeashOnlyDevices;
- (BOOL)_isRecentEnoughAdvertisement:(id)a3 forCurrentDate:(id)a4;
- (BOOL)_isStatusBitSetForRelatedDeviceWithShiftIndex:(unint64_t)a3 fromAdvertisement:(id)a4;
- (BOOL)_isValidPartID:(int64_t)a3;
- (BOOL)allRelevantDevicesToFindAreFound;
- (BOOL)allSAEnabledDevicesAreFound;
- (BOOL)isExtraDeviceFound:(id)a3 onDate:(id)a4;
- (BOOL)isFindingRelevantDevices;
- (BOOL)isInVehicularTravel;
- (BOOL)isNotifyWhileTravelingEnabled;
- (BOOL)isPeriodicScansAllowed;
- (BOOL)isPeriodicScansNeeded;
- (BOOL)longScanIsOngoing;
- (BOOL)requestedShortScan;
- (NSDate)initializationTime;
- (NSDate)lastEndOfScan;
- (NSDate)lastExtraHELEFoundTime;
- (NSDate)lastExtraNonHELEFoundTime;
- (NSDate)lastLongScanRequest;
- (NSDate)lastRelevantDeviceFoundTime;
- (NSDate)lastStartOfScan;
- (NSDate)nextOpportunisticScanDate;
- (NSDate)previousBufferEmptyTime;
- (NSHashTable)clients;
- (NSMutableDictionary)foundDevicesDuringCurrentScan;
- (NSMutableSet)relevantDevicesToFindDuringLongScan;
- (NSUUID)nextScheduledAlarm;
- (SAAnalyticsServiceProtocol)analytics;
- (SABluetoothScanRequestProtocol)bluetoothScanner;
- (SADeviceRecord)deviceRecord;
- (SALocationRequestProtocol)locationRequester;
- (SATimeServiceProtocol)clock;
- (SAWithYouDetector)initWithBluetoothScanner:(id)a3 locationRequester:(id)a4 deviceRecord:(id)a5 clock:(id)a6 analytics:(id)a7;
- (double)_maxAgeOfWithYouAdvertisementForDeviceUUID:(id)a3;
- (unint64_t)_finalizeToBeVerifiedStatus:(unint64_t)a3;
- (unint64_t)extraFoundHELECount;
- (unint64_t)extraFoundNonHELECount;
- (unint64_t)lastLongScanContext;
- (unint64_t)statusForDeviceWithUUID:(id)a3;
- (void)_deviceWithUUID:(id)a3 isWithYouDuringLongScanOnAdvertisement:(id)a4;
- (void)_notifyAllClientsOfWithYouStatusUpdate:(unint64_t)a3 forDeviceWithUUID:(id)a4;
- (void)_scheduleNextAlarmForScanAfterDate:(id)a3;
- (void)_updateAllWithYouStatusOnScanEndedEvent:(id)a3;
- (void)_updateLastWithYouDateAndLocation:(id)a3 forCurrentDate:(id)a4;
- (void)_updateWithYouStatusIfNecessaryOnAdvertisement:(id)a3;
- (void)_updateWithYouStatusIfNecessaryOnConnectionEvent:(id)a3;
- (void)_updateWithYouStatusOfRelatedDevices:(id)a3;
- (void)_updateWithYouStatusOnAdvBufferEmptyEvent:(id)a3;
- (void)addClient:(id)a3;
- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5;
- (void)forceUpdateWithYouStatus;
- (void)forceUpdateWithYouStatusToFindDevices:(id)a3 withContext:(unint64_t)a4;
- (void)forceUpdateWithYouStatusWithShortScan:(BOOL)a3;
- (void)ingestTAEvent:(id)a3;
- (void)pausePeriodicScan;
- (void)removeClient:(id)a3;
- (void)requestScanIfNeeded;
- (void)resetAllWithYouStatusAndScanStates;
- (void)resumePeriodicScan;
- (void)sendScanContextToCoreAnalytics:(unint64_t)a3 isPartOfLongScan:(BOOL)a4 scanDuration:(double)a5 relevantOnlyScanDuration:(double)a6 foundExtraHELECount:(unint64_t)a7 extraHELEScanDuration:(double)a8 foundExtraNonHELECount:(unint64_t)a9 extraNonHELEScanDuration:(double)a10 longScanContext:(unint64_t)a11;
- (void)setAnalytics:(id)a3;
- (void)setBluetoothScanner:(id)a3;
- (void)setClients:(id)a3;
- (void)setClock:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setExtraFoundHELECount:(unint64_t)a3;
- (void)setExtraFoundNonHELECount:(unint64_t)a3;
- (void)setFoundDevicesDuringCurrentScan:(id)a3;
- (void)setInitializationTime:(id)a3;
- (void)setIsFindingRelevantDevices:(BOOL)a3;
- (void)setIsInVehicularTravel:(BOOL)a3;
- (void)setIsNotifyWhileTravelingEnabled:(BOOL)a3;
- (void)setIsPeriodicScansNeeded:(BOOL)a3;
- (void)setLastEndOfScan:(id)a3;
- (void)setLastExtraHELEFoundTime:(id)a3;
- (void)setLastExtraNonHELEFoundTime:(id)a3;
- (void)setLastLongScanContext:(unint64_t)a3;
- (void)setLastLongScanRequest:(id)a3;
- (void)setLastRelevantDeviceFoundTime:(id)a3;
- (void)setLastStartOfScan:(id)a3;
- (void)setLocationRequester:(id)a3;
- (void)setLongScanIsOngoing:(BOOL)a3;
- (void)setNextOpportunisticScanDate:(id)a3;
- (void)setNextScheduledAlarm:(id)a3;
- (void)setPreviousBufferEmptyTime:(id)a3;
- (void)setRelevantDevicesToFindDuringLongScan:(id)a3;
- (void)setRequestedShortScan:(BOOL)a3;
- (void)updateExtraDeviceInformation:(id)a3;
@end

@implementation SAWithYouDetector

- (void)ingestTAEvent:(id)a3
{
  id v43 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SAWithYouDetector *)self _updateWithYouStatusIfNecessaryOnAdvertisement:v43];
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v43;
      if ([v4 state] == 1)
      {
        v5 = [(SAWithYouDetector *)self lastLongScanRequest];

        if (v5)
        {
          id v6 = v4;
          if ([(SAWithYouDetector *)self isFindingRelevantDevices])
          {
            v7 = [v6 date];
            [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:v7];

            v8 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
            [v8 removeAllObjects];

            [(SAWithYouDetector *)self setIsFindingRelevantDevices:0];
          }
          v9 = [v6 date];
          v10 = [(SAWithYouDetector *)self lastLongScanRequest];
          [v9 timeIntervalSinceDate:v10];
          double v12 = v11;

          v13 = [(SAWithYouDetector *)self lastRelevantDeviceFoundTime];
          if (v13)
          {
            v14 = [(SAWithYouDetector *)self lastRelevantDeviceFoundTime];
            v15 = [(SAWithYouDetector *)self lastLongScanRequest];
            [v14 timeIntervalSinceDate:v15];
            double v17 = v16;
          }
          else
          {
            double v17 = 0.0;
          }

          v25 = [(SAWithYouDetector *)self lastExtraHELEFoundTime];
          v26 = [(SAWithYouDetector *)self lastLongScanRequest];
          [v25 timeIntervalSinceDate:v26];
          double v28 = v27;

          v29 = [(SAWithYouDetector *)self lastExtraNonHELEFoundTime];
          v30 = [(SAWithYouDetector *)self lastLongScanRequest];
          [v29 timeIntervalSinceDate:v30];
          double v32 = v31;

          [(SAWithYouDetector *)self sendScanContextToCoreAnalytics:2 isPartOfLongScan:1 scanDuration:[(SAWithYouDetector *)self extraFoundHELECount] relevantOnlyScanDuration:[(SAWithYouDetector *)self extraFoundNonHELECount] foundExtraHELECount:[(SAWithYouDetector *)self lastLongScanContext] extraHELEScanDuration:v12 foundExtraNonHELECount:v17 extraNonHELEScanDuration:v28 longScanContext:v32];
          v33 = [(SAWithYouDetector *)self analytics];
          [v33 addScanDuration:v12];

          v34 = [(SAWithYouDetector *)self analytics];
          v35 = v34;
          double v36 = 6.0;
          if (v17 >= 6.0) {
            double v36 = v17;
          }
          [v34 addScanDurationForFindingRelevantItemsOnly:v36];

          [(SAWithYouDetector *)self setLastLongScanRequest:0];
          [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:0];
          [(SAWithYouDetector *)self setExtraFoundHELECount:0];
          [(SAWithYouDetector *)self setExtraFoundNonHELECount:0];
          [(SAWithYouDetector *)self setLastExtraHELEFoundTime:0];
          [(SAWithYouDetector *)self setLastExtraNonHELEFoundTime:0];
        }
        [(SAWithYouDetector *)self _updateAllWithYouStatusOnScanEndedEvent:v4];
        goto LABEL_26;
      }
      if ([v4 state] == 2)
      {
        v18 = [v4 date];
        v19 = [v18 dateByAddingTimeInterval:-1.0];
        [(SAWithYouDetector *)self setLastStartOfScan:v19];

LABEL_20:
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      id v4 = v43;
      if ([v4 systemStateType] != 15)
      {
        if ([v4 systemStateType] != 11 || !objc_msgSend(v4, "isOn")) {
          goto LABEL_26;
        }
        v18 = [(SAWithYouDetector *)self clock];
        id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        v21 = [(SAWithYouDetector *)self clock];
        v22 = [v21 getCurrentTime];
        v23 = (void *)[v20 initWithTimeInterval:v22 sinceDate:30.0];
        v24 = [v18 setupAlarmFireAt:v23 forClient:self];
        [(SAWithYouDetector *)self setNextScheduledAlarm:v24];

        goto LABEL_20;
      }
      [(SAWithYouDetector *)self _updateWithYouStatusOnAdvBufferEmptyEvent:v4];
    }
LABEL_26:

    goto LABEL_27;
  }
  [(SAWithYouDetector *)self _updateWithYouStatusIfNecessaryOnConnectionEvent:v43];
LABEL_27:
  if ([(SAWithYouDetector *)self isInVehicularTravel])
  {
    uint64_t v37 = [(SAWithYouDetector *)self nextOpportunisticScanDate];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v43 getDate];
      v40 = [(SAWithYouDetector *)self nextOpportunisticScanDate];
      [v39 timeIntervalSinceDate:v40];
      double v42 = v41;

      if (v42 >= 0.0) {
        [(SAWithYouDetector *)self requestScanIfNeeded];
      }
    }
  }
}

- (BOOL)isInVehicularTravel
{
  return self->_isInVehicularTravel;
}

- (SAWithYouDetector)initWithBluetoothScanner:(id)a3 locationRequester:(id)a4 deviceRecord:(id)a5 clock:(id)a6 analytics:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)SAWithYouDetector;
  double v17 = [(SAWithYouDetector *)&v39 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_6;
  }
  v19 = 0;
  if (v14 && v12 && v15)
  {
    [(SAWithYouDetector *)v17 setClock:v15];
    [(SAWithYouDetector *)v18 setBluetoothScanner:v12];
    [(SAWithYouDetector *)v18 setLocationRequester:v13];
    id v20 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(SAWithYouDetector *)v18 setClients:v20];

    [(SAWithYouDetector *)v18 setDeviceRecord:v14];
    [(SAWithYouDetector *)v18 setLongScanIsOngoing:0];
    [(SAWithYouDetector *)v18 setRequestedShortScan:0];
    [(SAWithYouDetector *)v18 setLastStartOfScan:0];
    [(SAWithYouDetector *)v18 setLastEndOfScan:0];
    id v21 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v22 = [(SAWithYouDetector *)v18 clock];
    v23 = [v22 getCurrentTime];
    v24 = (void *)[v21 initWithTimeInterval:v23 sinceDate:30.0];
    [v15 setupAlarmFireAt:v24 forClient:v18];
    v25 = id v38 = v16;
    [(SAWithYouDetector *)v18 setNextScheduledAlarm:v25];

    [(SAWithYouDetector *)v18 setLastLongScanRequest:0];
    [(SAWithYouDetector *)v18 setIsNotifyWhileTravelingEnabled:1];
    [(SAWithYouDetector *)v18 setPreviousBufferEmptyTime:0];
    *(_WORD *)&v18->_isPeriodicScansNeeded = 0;
    nextOpportunisticScanDate = v18->_nextOpportunisticScanDate;
    v18->_nextOpportunisticScanDate = 0;

    double v27 = [(SAWithYouDetector *)v18 clock];
    uint64_t v28 = [v27 getCurrentTime];
    initializationTime = v18->_initializationTime;
    v18->_initializationTime = (NSDate *)v28;

    id v16 = v38;
    v30 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    relevantDevicesToFindDuringLongScan = v18->_relevantDevicesToFindDuringLongScan;
    v18->_relevantDevicesToFindDuringLongScan = v30;

    double v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    foundDevicesDuringCurrentScan = v18->_foundDevicesDuringCurrentScan;
    v18->_foundDevicesDuringCurrentScan = v32;

    [(SAWithYouDetector *)v18 setIsFindingRelevantDevices:0];
    lastRelevantDeviceFoundTime = v18->_lastRelevantDeviceFoundTime;
    v18->_lastRelevantDeviceFoundTime = 0;

    v18->_lastLongScanContext = 0;
    objc_storeStrong((id *)&v18->_analytics, a7);
    v18->_extraFoundHELECount = 0;
    v18->_extraFoundNonHELECount = 0;
    lastExtraHELEFoundTime = v18->_lastExtraHELEFoundTime;
    v18->_lastExtraHELEFoundTime = 0;

    lastExtraNonHELEFoundTime = v18->_lastExtraNonHELEFoundTime;
    v18->_lastExtraNonHELEFoundTime = 0;

LABEL_6:
    v19 = v18;
  }

  return v19;
}

- (void)sendScanContextToCoreAnalytics:(unint64_t)a3 isPartOfLongScan:(BOOL)a4 scanDuration:(double)a5 relevantOnlyScanDuration:(double)a6 foundExtraHELECount:(unint64_t)a7 extraHELEScanDuration:(double)a8 foundExtraNonHELECount:(unint64_t)a9 extraNonHELEScanDuration:(double)a10 longScanContext:(unint64_t)a11
{
  BOOL v14 = a4;
  v32[9] = *MEMORY[0x1E4F143B8];
  v31[0] = @"scanType";
  v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v32[0] = v19;
  v31[1] = @"isPartOfLongScan";
  id v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v14];
  v32[1] = v20;
  v31[2] = @"scanDuration";
  id v21 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
  v32[2] = v21;
  v31[3] = @"relevantOnlyScanDuration";
  v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:a6];
  v32[3] = v22;
  v31[4] = @"foundExtraHELECount";
  v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
  v32[4] = v23;
  v31[5] = @"extraHELEScanDuration";
  v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:a8];
  v32[5] = v24;
  v31[6] = @"foundExtraNonHELECount";
  v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a9];
  v32[6] = v25;
  v31[7] = @"extraNonHELEScanDuration";
  v26 = [MEMORY[0x1E4F28ED0] numberWithDouble:a10];
  v32[7] = v26;
  v31[8] = @"longScanContext";
  double v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a11];
  v32[8] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:9];

  v29 = [(SAWithYouDetector *)self analytics];
  [v29 submitEvent:@"com.apple.clx.separationalerts.scan" content:v28];
}

- (BOOL)allRelevantDevicesToFindAreFound
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
  id v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        v10 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
        double v11 = [v10 objectForKeyedSubscript:v9];

        if (!v11)
        {
          BOOL v14 = TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289283;
            int v20 = 0;
            __int16 v21 = 2082;
            v22 = "";
            __int16 v23 = 2113;
            uint64_t v24 = v9;
            _os_log_impl(&dword_1D15FC000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou at least one device not found yet\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
          }

          return 0;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v12 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou all devices found\"}", buf, 0x12u);
  }
  return 1;
}

- (BOOL)allSAEnabledDevicesAreFound
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(SAWithYouDetector *)self deviceRecord];
  id v4 = [v3 getAllUUIDs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        v10 = [(SAWithYouDetector *)self deviceRecord];
        uint64_t v11 = [v10 getSADevice:v9];
        if (v11)
        {
          id v12 = (void *)v11;
          id v13 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
          BOOL v14 = [v13 objectForKeyedSubscript:v9];

          if (!v14)
          {
            long long v17 = TASALog;
            if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289283;
              int v24 = 0;
              __int16 v25 = 2082;
              uint64_t v26 = "";
              __int16 v27 = 2113;
              uint64_t v28 = v9;
              _os_log_impl(&dword_1D15FC000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou at least one sa enabled device not found yet\", \"uuid\":\"%{private}@\"}", buf, 0x1Cu);
            }

            return 0;
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v24 = 0;
    __int16 v25 = 2082;
    uint64_t v26 = "";
    _os_log_impl(&dword_1D15FC000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou all sa enabled devices found\"}", buf, 0x12u);
  }
  return 1;
}

- (void)forceUpdateWithYouStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(SAWithYouDetector *)self longScanIsOngoing])
  {
    [(SAWithYouDetector *)self setLongScanIsOngoing:1];
    [(SAWithYouDetector *)self setRequestedShortScan:1];
    BOOL v3 = [(SAWithYouDetector *)self _isOnlyMonitoringLeashOnlyDevices];
    id v4 = TASALog;
    BOOL v5 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        id v13 = "";
        _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou skip requesting scan - leash-only\"}", (uint8_t *)&v10, 0x12u);
      }
      id v6 = objc_alloc(MEMORY[0x1E4FAFF18]);
      uint64_t v7 = [(SAWithYouDetector *)self clock];
      uint64_t v8 = [v7 getCurrentTime];
      id WeakRetained = (id)[v6 initWithState:1 date:v8];

      [(SAWithYouDetector *)self _updateAllWithYouStatusOnScanEndedEvent:WeakRetained];
    }
    else
    {
      if (v5)
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        id v13 = "";
        _os_log_impl(&dword_1D15FC000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou requesting scan to force update withyou status\"}", (uint8_t *)&v10, 0x12u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothScanner);
      [WeakRetained requestBluetoothScanForTypes:2];
    }
  }
}

- (void)forceUpdateWithYouStatusToFindDevices:(id)a3 withContext:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v7;
    id v9 = +[SAWithYouDetector convertSAWithYouLongScanContextToString:a4];
    uint64_t buf = 68289539;
    __int16 v40 = 2082;
    double v41 = "";
    __int16 v42 = 2113;
    id v43 = v6;
    __int16 v44 = 2081;
    uint64_t v45 = [v9 UTF8String];
    _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou force update to find devices\", \"device list\":\"%{private}@\", \"context\":\"%{private}s\"}", (uint8_t *)&buf, 0x26u);
  }
  [(SAWithYouDetector *)self setLastLongScanContext:a4];
  if ([(SAWithYouDetector *)self _isOnlyMonitoringLeashOnlyDevices]) {
    goto LABEL_31;
  }
  [(SAWithYouDetector *)self forceUpdateWithYouStatusWithShortScan:1];
  int v10 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
  [v10 addObjectsFromArray:v6];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if ((-[SADeviceRecord getConnectionState:](self->_deviceRecord, "getConnectionState:", v16, (void)v34) & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          long long v17 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
          [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v16 forCurrentDate:v17];

          long long v18 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
          long long v19 = [v18 objectForKeyedSubscript:v16];

          if (!v19)
          {
            long long v20 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
            long long v21 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
            [v21 setObject:v20 forKeyedSubscript:v16];

            long long v22 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
            [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:v22];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }

  __int16 v23 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
  {
    int v24 = v23;
    __int16 v25 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
    uint64_t v26 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
    uint64_t buf = 68289539;
    __int16 v40 = 2082;
    double v41 = "";
    __int16 v42 = 2113;
    id v43 = v25;
    __int16 v44 = 2113;
    uint64_t v45 = (uint64_t)v26;
    _os_log_impl(&dword_1D15FC000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou devices to find\", \"devices to find\":\"%{private}@\", \"devices found\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);
  }
  if (![(SAWithYouDetector *)self allRelevantDevicesToFindAreFound])
  {
    [(SAWithYouDetector *)self setIsFindingRelevantDevices:1];
    double v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289026;
      __int16 v40 = 2082;
      double v41 = "";
      v33 = "{\"msg%{public}.0s\":\"#sa #withyou some remaining devices to find, requesting long aggressive scan if not a"
            "lready ongoing\"}";
LABEL_30:
      _os_log_impl(&dword_1D15FC000, v32, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&buf, 0x12u);
    }
LABEL_31:
    [(SAWithYouDetector *)self forceUpdateWithYouStatus];
    goto LABEL_32;
  }
  if ([(SAWithYouDetector *)self isFindingRelevantDevices])
  {
    __int16 v27 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
    [v27 removeAllObjects];

    uint64_t v28 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v40 = 2082;
      double v41 = "";
      _os_log_impl(&dword_1D15FC000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more devices to find, recording time of last device found for metrics\"}", (uint8_t *)&buf, 0x12u);
    }
    v29 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:v29];

    [(SAWithYouDetector *)self setIsFindingRelevantDevices:0];
  }
  if (![(SAWithYouDetector *)self allSAEnabledDevicesAreFound])
  {
    double v32 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289026;
      __int16 v40 = 2082;
      double v41 = "";
      v33 = "{\"msg%{public}.0s\":\"#sa #withyou some remaining sa enabled devices to find, requesting long aggressive sc"
            "an if not already ongoing\"}";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if ([(SAWithYouDetector *)self longScanIsOngoing])
  {
    uint64_t v30 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v40 = 2082;
      double v41 = "";
      _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more sa enabled devices to find while long scan is ongoing, requesting to stop long aggressive scan\"}", (uint8_t *)&buf, 0x12u);
    }
    [(SAWithYouDetector *)self setLongScanIsOngoing:0];
    double v31 = [(SAWithYouDetector *)self bluetoothScanner];
    [v31 stopLongAggressiveScan];
  }
LABEL_32:
}

- (void)forceUpdateWithYouStatusWithShortScan:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SAWithYouDetector *)self lastLongScanRequest];

  if (!v5 && v3)
  {
    id v6 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    [(SAWithYouDetector *)self setLastLongScanRequest:v6];

    uint64_t v7 = [(SAWithYouDetector *)self lastLongScanRequest];
    uint64_t v8 = (void *)[v7 copy];
    [(SAWithYouDetector *)self setLastExtraHELEFoundTime:v8];

    id v9 = [(SAWithYouDetector *)self lastLongScanRequest];
    int v10 = (void *)[v9 copy];
    [(SAWithYouDetector *)self setLastExtraNonHELEFoundTime:v10];
  }
  if (![(SAWithYouDetector *)self requestedShortScan])
  {
    [(SAWithYouDetector *)self setRequestedShortScan:1];
    BOOL v11 = [(SAWithYouDetector *)self _isOnlyMonitoringLeashOnlyDevices];
    uint64_t v12 = TASALog;
    BOOL v13 = os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v20 = 68289026;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou skip requesting short scan - leash-only\"}", (uint8_t *)&v20, 0x12u);
      }
      id v14 = objc_alloc(MEMORY[0x1E4FAFF18]);
      long long v15 = [(SAWithYouDetector *)self clock];
      uint64_t v16 = [v15 getCurrentTime];
      long long v17 = (void *)[v14 initWithState:1 date:v16];

      [(SAWithYouDetector *)self _updateAllWithYouStatusOnScanEndedEvent:v17];
      goto LABEL_13;
    }
    if (v13)
    {
      int v20 = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      _os_log_impl(&dword_1D15FC000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou requesting short scan to force update withyou status\"}", (uint8_t *)&v20, 0x12u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothScanner);
    [WeakRetained requestBluetoothScanForTypes:1];

    [(SAWithYouDetector *)self sendScanContextToCoreAnalytics:1 isPartOfLongScan:v3 scanDuration:0 relevantOnlyScanDuration:0 foundExtraHELECount:0 extraHELEScanDuration:6.0 foundExtraNonHELECount:0.0 extraNonHELEScanDuration:0.0 longScanContext:0.0];
    if (!v3)
    {
      long long v19 = [(SAWithYouDetector *)self analytics];
      [v19 addScanDuration:6.0];

      long long v17 = [(SAWithYouDetector *)self analytics];
      [v17 addScanDurationForFindingRelevantItemsOnly:6.0];
LABEL_13:
    }
  }
}

- (BOOL)_isOnlyMonitoringLeashOnlyDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(SADeviceRecord *)self->_deviceRecord getAllUUIDs];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = -[SADeviceRecord getSADevice:](self->_deviceRecord, "getSADevice:", v8, (void)v12);

        if (v9 && ![(SAWithYouDetector *)self _deviceIsWatch:v8])
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (void)resetAllWithYouStatusAndScanStates
{
  [(SADeviceRecord *)self->_deviceRecord resetAllWithYouStatus];
  [(SAWithYouDetector *)self setLongScanIsOngoing:0];
  [(SAWithYouDetector *)self setRequestedShortScan:0];
  [(SAWithYouDetector *)self setLastStartOfScan:0];
  [(SAWithYouDetector *)self setLastEndOfScan:0];
  [(SAWithYouDetector *)self setPreviousBufferEmptyTime:0];
  [(SAWithYouDetector *)self setIsFindingRelevantDevices:0];
  [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:0];
  [(SAWithYouDetector *)self setLastLongScanContext:0];
  [(SAWithYouDetector *)self setExtraFoundHELECount:0];
  [(SAWithYouDetector *)self setExtraFoundNonHELECount:0];
  [(SAWithYouDetector *)self setLastExtraHELEFoundTime:0];
  [(SAWithYouDetector *)self setLastExtraNonHELEFoundTime:0];
}

- (unint64_t)statusForDeviceWithUUID:(id)a3
{
  return [(SADeviceRecord *)self->_deviceRecord getWithYouStatus:a3];
}

- (BOOL)isPeriodicScansAllowed
{
  BOOL v3 = [(SAWithYouDetector *)self isNotifyWhileTravelingEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(SAWithYouDetector *)self isPeriodicScansNeeded];
  }
  return v3;
}

- (void)resumePeriodicScan
{
  [(SAWithYouDetector *)self setIsPeriodicScansNeeded:1];
  [(SAWithYouDetector *)self requestScanIfNeeded];
}

- (void)pausePeriodicScan
{
}

- (void)addClient:(id)a3
{
}

- (void)removeClient:(id)a3
{
}

- (void)_notifyAllClientsOfWithYouStatusUpdate:(unint64_t)a3 forDeviceWithUUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v6];
  [(SADeviceRecord *)self->_deviceRecord updatedWithYouStatusFrom:v7 to:a3 forDeviceWithUUID:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_clients;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "updatedWithYouStatusFrom:to:forDeviceWithUUID:", v7, a3, v6, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_updateWithYouStatusIfNecessaryOnConnectionEvent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  deviceRecord = self->_deviceRecord;
  id v6 = [v4 identifier];
  unint64_t v7 = [(SADeviceRecord *)deviceRecord getSADevice:v6];

  if (v7)
  {
    uint64_t v8 = [v4 identifier];
    unint64_t v9 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v8];

    uint64_t v10 = [v4 state];
    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1) {
        goto LABEL_12;
      }
      long long v14 = [v4 identifier];
      BOOL v15 = [(SAWithYouDetector *)self _deviceIsWatch:v14];

      if (v15) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 4;
      }
    }
    else
    {
      uint64_t v11 = [v4 identifier];
      uint64_t v12 = [v4 date];
      [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v11 forCurrentDate:v12];

      uint64_t v13 = 1;
    }
    if (v9 != v13)
    {
      long long v16 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v16;
        uint64_t v18 = [v4 identifier];
        long long v19 = +[SAWithYouDetector convertSAWithYouStatusToString:v9];
        int v20 = +[SAWithYouDetector convertSAWithYouStatusToString:v13];
        v22[0] = 68289795;
        v22[1] = 0;
        __int16 v23 = 2082;
        uint64_t v24 = "";
        __int16 v25 = 2113;
        uint64_t v26 = v18;
        __int16 v27 = 2113;
        uint64_t v28 = v19;
        __int16 v29 = 2113;
        uint64_t v30 = v20;
        _os_log_impl(&dword_1D15FC000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated connection state changed\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", (uint8_t *)v22, 0x30u);
      }
      int v21 = [v4 identifier];
      [(SAWithYouDetector *)self _notifyAllClientsOfWithYouStatusUpdate:v13 forDeviceWithUUID:v21];
    }
  }
LABEL_12:
}

- (double)_maxAgeOfWithYouAdvertisementForDeviceUUID:(id)a3
{
  deviceRecord = self->_deviceRecord;
  id v5 = a3;
  id v6 = [(SADeviceRecord *)deviceRecord getSADevice:v5];
  uint64_t v7 = [v6 deviceType];
  unint64_t v8 = [(SADeviceRecord *)self->_deviceRecord getMonitoringSessionState:v5];

  if (![v6 isAppleAudioAccessory]) {
    goto LABEL_9;
  }
  if (v8 > 4 || ((1 << v8) & 0x1A) == 0)
  {
    if (v7 == 16)
    {
      double v10 = 120.0;
      goto LABEL_10;
    }
LABEL_9:
    double v10 = 30.0;
    goto LABEL_10;
  }
  double v10 = 360.0;
LABEL_10:

  return v10;
}

- (void)_updateLastWithYouDateAndLocation:(id)a3 forCurrentDate:(id)a4
{
  deviceRecord = self->_deviceRecord;
  id v7 = a3;
  [(SADeviceRecord *)deviceRecord updateLastWithYouDate:a4 forDeviceWithUUID:v7];
  [(SADeviceRecord *)self->_deviceRecord updateLastWithYouLocation:0 forDeviceWithUUID:v7];
}

- (BOOL)_isRecentEnoughAdvertisement:(id)a3 forCurrentDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 scanDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  uint64_t v11 = [v7 uuid];

  [(SAWithYouDetector *)self _maxAgeOfWithYouAdvertisementForDeviceUUID:v11];
  LOBYTE(v7) = v10 <= v12;

  return (char)v7;
}

- (BOOL)isExtraDeviceFound:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SAWithYouDetector *)self isFindingRelevantDevices]
    || ([(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v6],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = [(SAWithYouDetector *)self lastStartOfScan];
    double v12 = [v11 dateByAddingTimeInterval:7.0];

    uint64_t v13 = [(SAWithYouDetector *)self lastRelevantDeviceFoundTime];

    if (v13)
    {
      long long v14 = [(SAWithYouDetector *)self lastRelevantDeviceFoundTime];
      uint64_t v15 = [v12 laterDate:v14];

      double v12 = (void *)v15;
    }
    if ([v12 compare:v7] == -1)
    {
      long long v16 = [(SAWithYouDetector *)self deviceRecord];
      uint64_t v17 = [v16 getMonitoringSessionState:v6];

      uint64_t v18 = [(SAWithYouDetector *)self deviceRecord];
      uint64_t v19 = [v18 getScenarioClass:v6];

      BOOL v10 = v17 == 2 && (v19 & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (void)updateExtraDeviceInformation:(id)a3
{
  id v11 = a3;
  id v4 = [(SAWithYouDetector *)self deviceRecord];
  id v5 = [v4 getSADevice:v11];
  uint64_t v6 = [v5 deviceType];

  if (v6 == 16)
  {
    [(SAWithYouDetector *)self setExtraFoundHELECount:[(SAWithYouDetector *)self extraFoundHELECount] + 1];
    id v7 = [(SAWithYouDetector *)self lastExtraHELEFoundTime];
    unint64_t v8 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
    char v9 = [v8 objectForKeyedSubscript:v11];
    BOOL v10 = [v7 laterDate:v9];
    [(SAWithYouDetector *)self setLastExtraHELEFoundTime:v10];
  }
  else
  {
    [(SAWithYouDetector *)self setExtraFoundNonHELECount:[(SAWithYouDetector *)self extraFoundNonHELECount] + 1];
    id v7 = [(SAWithYouDetector *)self lastExtraNonHELEFoundTime];
    unint64_t v8 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
    char v9 = [v8 objectForKeyedSubscript:v11];
    BOOL v10 = [v7 laterDate:v9];
    [(SAWithYouDetector *)self setLastExtraNonHELEFoundTime:v10];
  }
}

- (void)_deviceWithUUID:(id)a3 isWithYouDuringLongScanOnAdvertisement:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
  char v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v10 = [(SAWithYouDetector *)self lastStartOfScan];
    if (!v10) {
      goto LABEL_4;
    }
    id v11 = (void *)v10;
    double v12 = [v7 getDate];
    uint64_t v13 = [(SAWithYouDetector *)self lastStartOfScan];
    [v12 timeIntervalSinceDate:v13];
    double v15 = v14;

    if (v15 >= 0.0)
    {
LABEL_4:
      long long v16 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        int v32 = 68289283;
        int v33 = 0;
        __int16 v34 = 2082;
        long long v35 = "";
        __int16 v36 = 2113;
        id v37 = v6;
        _os_log_impl(&dword_1D15FC000, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou found new device\", \"uuid\":\"%{private}@\"}", (uint8_t *)&v32, 0x1Cu);
      }
      uint64_t v17 = [v7 getDate];
      uint64_t v18 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
      [v18 setObject:v17 forKeyedSubscript:v6];

      uint64_t v19 = [v7 uuid];
      int v20 = [v7 getDate];
      BOOL v21 = [(SAWithYouDetector *)self isExtraDeviceFound:v19 onDate:v20];

      if (v21)
      {
        __int16 v22 = [v7 uuid];
        [(SAWithYouDetector *)self updateExtraDeviceInformation:v22];
      }
    }
    __int16 v23 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = v23;
      __int16 v25 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
      uint64_t v26 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
      int v32 = 68289539;
      int v33 = 0;
      __int16 v34 = 2082;
      long long v35 = "";
      __int16 v36 = 2113;
      id v37 = v25;
      __int16 v38 = 2113;
      objc_super v39 = v26;
      _os_log_impl(&dword_1D15FC000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #withyou devices to find\", \"devices to find\":\"%{private}@\", \"devices found\":\"%{private}@\"}", (uint8_t *)&v32, 0x26u);
    }
    if ([(SAWithYouDetector *)self isFindingRelevantDevices]
      && [(SAWithYouDetector *)self allRelevantDevicesToFindAreFound])
    {
      __int16 v27 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
      [v27 removeAllObjects];

      uint64_t v28 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 68289026;
        int v33 = 0;
        __int16 v34 = 2082;
        long long v35 = "";
        _os_log_impl(&dword_1D15FC000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more devices to find while long scan is ongoing, recording time of last device found for metrics\"}", (uint8_t *)&v32, 0x12u);
      }
      __int16 v29 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
      [(SAWithYouDetector *)self setLastRelevantDeviceFoundTime:v29];

      [(SAWithYouDetector *)self setIsFindingRelevantDevices:0];
    }
    if ([(SAWithYouDetector *)self allSAEnabledDevicesAreFound])
    {
      uint64_t v30 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 68289026;
        int v33 = 0;
        __int16 v34 = 2082;
        long long v35 = "";
        _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou no more sa enabled devices to find while long scan is ongoing, requesting to stop long aggressive scan\"}", (uint8_t *)&v32, 0x12u);
      }
      [(SAWithYouDetector *)self setLongScanIsOngoing:0];
      uint64_t v31 = [(SAWithYouDetector *)self bluetoothScanner];
      [v31 stopLongAggressiveScan];
    }
  }
}

- (void)_updateWithYouStatusIfNecessaryOnAdvertisement:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  if (v5)
  {
    id v6 = (void *)v5;
    deviceRecord = self->_deviceRecord;
    unint64_t v8 = [v4 uuid];
    char v9 = [(SADeviceRecord *)deviceRecord getSADevice:v8];

    if (v9)
    {
      uint64_t v10 = [v4 uuid];
      uint64_t v11 = [v4 scanDate];
      [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v10 forCurrentDate:v11];

      double v12 = [v4 uuid];
      LOBYTE(v11) = [(SAWithYouDetector *)self _deviceIsWatch:v12];

      if ((v11 & 1) == 0)
      {
        uint64_t v13 = [v4 uuid];
        unint64_t v14 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v13];

        double v15 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
        BOOL v16 = [(SAWithYouDetector *)self _isRecentEnoughAdvertisement:v4 forCurrentDate:v15];

        uint64_t v17 = v16;
        if ([(SAWithYouDetector *)self longScanIsOngoing] && v16)
        {
          uint64_t v18 = [v4 uuid];
          [(SAWithYouDetector *)self _deviceWithUUID:v18 isWithYouDuringLongScanOnAdvertisement:v4];
        }
        if (v17 && v14 != v17)
        {
          uint64_t v19 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = v19;
            BOOL v21 = [v4 uuid];
            __int16 v22 = +[SAWithYouDetector convertSAWithYouStatusToString:v14];
            __int16 v23 = +[SAWithYouDetector convertSAWithYouStatusToString:1];
            v25[0] = 68289795;
            v25[1] = 0;
            __int16 v26 = 2082;
            __int16 v27 = "";
            __int16 v28 = 2113;
            __int16 v29 = v21;
            __int16 v30 = 2113;
            uint64_t v31 = v22;
            __int16 v32 = 2113;
            int v33 = v23;
            _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated observed advertisement\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", (uint8_t *)v25, 0x30u);
          }
          uint64_t v24 = [v4 uuid];
          [(SAWithYouDetector *)self _notifyAllClientsOfWithYouStatusUpdate:1 forDeviceWithUUID:v24];
        }
        [(SAWithYouDetector *)self _updateWithYouStatusOfRelatedDevices:v4];
      }
    }
  }
}

- (void)_updateWithYouStatusOfRelatedDevices:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  deviceRecord = self->_deviceRecord;
  id v6 = [v4 uuid];
  id v7 = [(SADeviceRecord *)deviceRecord getRelatedDevices:v6];

  if (v7)
  {
    unint64_t v8 = [v7 count];
    unint64_t v10 = v8;
    if (v8 > 3)
    {
      __int16 v29 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      {
        __int16 v30 = v29;
        uint64_t v31 = [v4 uuid];
        *(_DWORD *)uint64_t buf = 68289539;
        int v34 = 0;
        __int16 v35 = 2082;
        __int16 v36 = "";
        __int16 v37 = 2113;
        __int16 v38 = v31;
        __int16 v39 = 2049;
        unint64_t v40 = v10;
        _os_log_impl(&dword_1D15FC000, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa #withyou detected a device with more than maximum allowable related beacons\", \"uuid\":\"%{private}@\", \"count\":%{private}ld}", buf, 0x26u);
      }
    }
    else if (v8)
    {
      uint64_t v11 = 0;
      *(void *)&long long v9 = 68289795;
      long long v32 = v9;
      do
      {
        double v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v11, v32);
        uint64_t v13 = [(SAWithYouDetector *)self deviceRecord];
        unint64_t v14 = [v4 uuid];
        double v15 = [v13 getSADevice:v14];
        uint64_t v16 = [v15 partIdentifier];

        uint64_t v17 = [(SAWithYouDetector *)self deviceRecord];
        uint64_t v18 = [v17 getSADevice:v12];
        uint64_t v19 = [v18 partIdentifier];

        if ([(SAWithYouDetector *)self _isValidPartID:v16]
          && [(SAWithYouDetector *)self _isValidPartID:v19]
          && v19 != v16)
        {
          uint64_t v20 = v19 <= v16 ? v19 - v16 + 3 : v19 + ~v16;
          if ([(SAWithYouDetector *)self _isStatusBitSetForRelatedDeviceWithShiftIndex:v20 fromAdvertisement:v4])
          {
            BOOL v21 = [v4 scanDate];
            [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v12 forCurrentDate:v21];

            unint64_t v22 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v12];
            __int16 v23 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
            int v24 = [(SAWithYouDetector *)self _isRecentEnoughAdvertisement:v4 forCurrentDate:v23];

            [(SADeviceRecord *)self->_deviceRecord updateLatestAdvertisement:v4 forDeviceWithUUID:v12];
            if ([(SAWithYouDetector *)self longScanIsOngoing] && v24) {
              [(SAWithYouDetector *)self _deviceWithUUID:v12 isWithYouDuringLongScanOnAdvertisement:v4];
            }
            if (v24 && v22 != v24)
            {
              __int16 v25 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v26 = v25;
                __int16 v27 = +[SAWithYouDetector convertSAWithYouStatusToString:v22];
                __int16 v28 = +[SAWithYouDetector convertSAWithYouStatusToString:1];
                *(_DWORD *)uint64_t buf = v32;
                int v34 = 0;
                __int16 v35 = 2082;
                __int16 v36 = "";
                __int16 v37 = 2113;
                __int16 v38 = v12;
                __int16 v39 = 2113;
                unint64_t v40 = (unint64_t)v27;
                __int16 v41 = 2113;
                __int16 v42 = v28;
                _os_log_impl(&dword_1D15FC000, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated observed advertisement from related device\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);
              }
              [(SAWithYouDetector *)self _notifyAllClientsOfWithYouStatusUpdate:1 forDeviceWithUUID:v12];
            }
          }
        }

        ++v11;
      }
      while (v10 != v11);
    }
  }
}

- (BOOL)_isValidPartID:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

- (BOOL)_isStatusBitSetForRelatedDeviceWithShiftIndex:(unint64_t)a3 fromAdvertisement:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (a3 < 3)
  {
    int v9 = dword_1D162E580[a3];
    unsigned int v8 = ([v5 status] >> v9) & 1;
  }
  else
  {
    id v7 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
    {
      v11[0] = 68289026;
      v11[1] = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      _os_log_impl(&dword_1D15FC000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#sa #withyou trying to get status bit of related device at out of bound index\"}", (uint8_t *)v11, 0x12u);
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)_finalizeToBeVerifiedStatus:(unint64_t)a3
{
  unint64_t v3 = 1;
  if (a3 != 3) {
    unint64_t v3 = a3;
  }
  if (a3 == 4) {
    return 2;
  }
  else {
    return v3;
  }
}

- (BOOL)_enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:(id)a3
{
  deviceRecord = self->_deviceRecord;
  id v5 = a3;
  id v6 = [(SADeviceRecord *)deviceRecord getSADevice:v5];
  unint64_t v7 = [(SADeviceRecord *)self->_deviceRecord getMonitoringSessionState:v5];

  if (![v6 isAppleAudioAccessory]) {
    goto LABEL_10;
  }
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    if ([v6 deviceType] == 16)
    {
      int v9 = [(SAWithYouDetector *)self clock];
      unint64_t v10 = [v9 getCurrentTime];
      uint64_t v11 = [(SAWithYouDetector *)self initializationTime];
      [v10 timeIntervalSinceDate:v11];
      double v13 = 120.0;
      goto LABEL_7;
    }
LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  int v9 = [(SAWithYouDetector *)self clock];
  unint64_t v10 = [v9 getCurrentTime];
  uint64_t v11 = [(SAWithYouDetector *)self initializationTime];
  [v10 timeIntervalSinceDate:v11];
  double v13 = 360.0;
LABEL_7:
  BOOL v14 = v12 >= v13;

LABEL_11:
  return v14;
}

- (void)_updateAllWithYouStatusOnScanEndedEvent:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v4 = [v42 date];
  [(SAWithYouDetector *)self setLastEndOfScan:v4];

  id v5 = [(SADeviceRecord *)self->_deviceRecord getAllUUIDs];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v62 count:16];
  __int16 v41 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v47 + 1) + 8 * v9);
        uint64_t v11 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v10];

        if (v11)
        {
          int64_t v12 = [(SADeviceRecord *)self->_deviceRecord getConnectionState:v10];
          unint64_t v13 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v10];
          if ([(SAWithYouDetector *)self _deviceIsWatch:v10])
          {
            if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              BOOL v14 = [v42 date];
              [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v10 forCurrentDate:v14];

              unint64_t v17 = 1;
            }
            else
            {
              unint64_t v17 = 2;
            }
            goto LABEL_24;
          }
          if ((v12 & 0xFFFFFFFFFFFFFFFELL) != 2)
          {
            uint64_t v18 = [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v10];

            if (!v18)
            {
              if ([(SAWithYouDetector *)self _enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:v10])
              {
                uint64_t v16 = 2;
              }
              else
              {
                uint64_t v16 = v13;
              }
              goto LABEL_23;
            }
            uint64_t v19 = [(SAWithYouDetector *)self lastStartOfScan];

            uint64_t v16 = v13;
            if (v19)
            {
              uint64_t v20 = [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v10];
              BOOL v21 = [v20 scanDate];
              unint64_t v22 = [(SAWithYouDetector *)self lastStartOfScan];
              [v21 timeIntervalSinceDate:v22];
              if (v23 >= 0.0)
              {
              }
              else
              {
                int v24 = [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v10];
                [v42 date];
                __int16 v25 = v40 = v20;
                BOOL v39 = [(SAWithYouDetector *)self _isRecentEnoughAdvertisement:v24 forCurrentDate:v25];

                id v5 = v41;
                if (!v39)
                {
                  uint64_t v16 = 2;
                  goto LABEL_23;
                }
              }
LABEL_14:
              uint64_t v16 = 1;
            }
LABEL_23:
            unint64_t v17 = [(SAWithYouDetector *)self _finalizeToBeVerifiedStatus:v16];
LABEL_24:
            if (v13 != v17 && v17 != 0)
            {
              __int16 v27 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v28 = v27;
                __int16 v29 = +[SAWithYouDetector convertSAWithYouStatusToString:v13];
                __int16 v30 = +[SAWithYouDetector convertSAWithYouStatusToString:v17];
                *(_DWORD *)uint64_t buf = 68289795;
                int v53 = 0;
                __int16 v54 = 2082;
                v55 = "";
                __int16 v56 = 2113;
                uint64_t v57 = v10;
                __int16 v58 = 2113;
                v59 = v29;
                __int16 v60 = 2113;
                v61 = v30;
                _os_log_impl(&dword_1D15FC000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated end of scan\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);

                id v5 = v41;
              }
              [(SAWithYouDetector *)self _notifyAllClientsOfWithYouStatusUpdate:v17 forDeviceWithUUID:v10];
            }
            goto LABEL_31;
          }
          double v15 = [v42 date];
          [(SAWithYouDetector *)self _updateLastWithYouDateAndLocation:v10 forCurrentDate:v15];

          goto LABEL_14;
        }
LABEL_31:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v31 = [v5 countByEnumeratingWithState:&v47 objects:v62 count:16];
      uint64_t v7 = v31;
    }
    while (v31);
  }
  long long v32 = [(SAWithYouDetector *)self foundDevicesDuringCurrentScan];
  [v32 removeAllObjects];

  int v33 = [(SAWithYouDetector *)self relevantDevicesToFindDuringLongScan];
  [v33 removeAllObjects];

  [(SAWithYouDetector *)self setIsFindingRelevantDevices:0];
  if ([(SAWithYouDetector *)self longScanIsOngoing]
    || [(SAWithYouDetector *)self requestedShortScan])
  {
    [(SAWithYouDetector *)self setLongScanIsOngoing:0];
    [(SAWithYouDetector *)self setRequestedShortScan:0];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v34 = self->_clients;
    uint64_t v35 = [(NSHashTable *)v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v44 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) didForceUpdateWithYouStatus];
        }
        uint64_t v36 = [(NSHashTable *)v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v36);
    }

    id v5 = v41;
  }
  [(SAWithYouDetector *)self requestScanIfNeeded];
}

- (void)_updateWithYouStatusOnAdvBufferEmptyEvent:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SAWithYouDetector *)self previousBufferEmptyTime];

  if (!v5)
  {
    __int16 v30 = [v4 date];
    [(SAWithYouDetector *)self setPreviousBufferEmptyTime:v30];

    goto LABEL_28;
  }
  uint64_t v31 = v4;
  [(SADeviceRecord *)self->_deviceRecord getAllUUIDs];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
      uint64_t v11 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v10];

      if (v11)
      {
        int64_t v12 = [(SADeviceRecord *)self->_deviceRecord getSADevice:v10];
        uint64_t v13 = [v12 deviceType];

        if (v13 == 16)
        {
          unint64_t v14 = [(SAWithYouDetector *)self statusForDeviceWithUUID:v10];
          double v15 = [(SAWithYouDetector *)self previousBufferEmptyTime];
          uint64_t v16 = [(SAWithYouDetector *)self lastEndOfScan];

          if (v16)
          {
            unint64_t v17 = [(SAWithYouDetector *)self previousBufferEmptyTime];
            uint64_t v18 = [(SAWithYouDetector *)self lastEndOfScan];
            uint64_t v19 = [v17 laterDate:v18];

            double v15 = (void *)v19;
          }
          uint64_t v20 = [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v10];
          if (v20
            && (BOOL v21 = (void *)v20,
                [(SADeviceRecord *)self->_deviceRecord getLatestAdvertisement:v10],
                unint64_t v22 = objc_claimAutoreleasedReturnValue(),
                BOOL v23 = [(SAWithYouDetector *)self _isRecentEnoughAdvertisement:v22 forCurrentDate:v15], v22, v21, v23))
          {
            uint64_t v24 = 1;
LABEL_18:
            if (v14 != v24 && v24)
            {
              __int16 v25 = (void *)TASALog;
              if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v26 = v25;
                __int16 v27 = +[SAWithYouDetector convertSAWithYouStatusToString:v14];
                __int16 v28 = +[SAWithYouDetector convertSAWithYouStatusToString:v24];
                *(_DWORD *)uint64_t buf = 68289795;
                int v38 = 0;
                __int16 v39 = 2082;
                unint64_t v40 = "";
                __int16 v41 = 2113;
                uint64_t v42 = v10;
                __int16 v43 = 2113;
                long long v44 = v27;
                __int16 v45 = 2113;
                long long v46 = v28;
                _os_log_impl(&dword_1D15FC000, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou status updated on adv buffer empty event\", \"uuid\":\"%{private}@\", \"oldStatus\":\"%{private}@\", \"newStatus\":\"%{private}@\"}", buf, 0x30u);
              }
              [(SAWithYouDetector *)self _notifyAllClientsOfWithYouStatusUpdate:v24 forDeviceWithUUID:v10];
            }
          }
          else if (v14 != 2)
          {
            if ([(SAWithYouDetector *)self _enoughTimeHasPassedSinceInitializationToMarkNotWithYouForDeviceUUID:v10])
            {
              uint64_t v24 = 4;
            }
            else
            {
              uint64_t v24 = v14;
            }
            goto LABEL_18;
          }

          continue;
        }
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  }
  while (v7);
LABEL_26:
  id v4 = v31;
  __int16 v29 = [v31 date];
  [(SAWithYouDetector *)self setPreviousBufferEmptyTime:v29];

LABEL_28:
}

- (void)_scheduleNextAlarmForScanAfterDate:(id)a3
{
  id v12 = a3;
  if ([(SAWithYouDetector *)self isPeriodicScansAllowed])
  {
    id v4 = [(SAWithYouDetector *)self nextScheduledAlarm];

    if (v4)
    {
      id v5 = [(SAWithYouDetector *)self clock];
      uint64_t v6 = [(SAWithYouDetector *)self nextScheduledAlarm];
      [v5 cancelAlarmWithUUID:v6];

      [(SAWithYouDetector *)self setNextScheduledAlarm:0];
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v12 sinceDate:300.0];
    BOOL v8 = [(SAWithYouDetector *)self isInVehicularTravel];
    uint64_t v9 = v7;
    if (!v8)
    {
      uint64_t v10 = [(SAWithYouDetector *)self clock];
      uint64_t v11 = [v10 setupAlarmFireAt:v7 forClient:self];
      [(SAWithYouDetector *)self setNextScheduledAlarm:v11];

      uint64_t v9 = 0;
    }
    [(SAWithYouDetector *)self setNextOpportunisticScanDate:v9];
  }
  else
  {
    [(SAWithYouDetector *)self setNextOpportunisticScanDate:0];
  }
}

- (void)requestScanIfNeeded
{
  unint64_t v3 = [(SAWithYouDetector *)self deviceRecord];
  id v4 = [v3 getAllUUIDs];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v14 = [(SAWithYouDetector *)self lastEndOfScan];
    if (!v14) {
      goto LABEL_5;
    }
    uint64_t v6 = [(SAWithYouDetector *)self clock];
    uint64_t v7 = [v6 getCurrentTime];
    [v7 timeIntervalSinceDate:v14];
    double v9 = v8;

    if (v9 < 300.0)
    {
      int v10 = 0;
    }
    else
    {
LABEL_5:
      uint64_t v11 = [(SAWithYouDetector *)self clock];
      uint64_t v12 = [v11 getCurrentTime];

      int v10 = 1;
      id v14 = (id)v12;
    }
    if ([(SAWithYouDetector *)self isPeriodicScansAllowed])
    {
      [(SAWithYouDetector *)self _scheduleNextAlarmForScanAfterDate:v14];
      if (!v10) {
        goto LABEL_15;
      }
    }
    else
    {
      [(SAWithYouDetector *)self setNextOpportunisticScanDate:0];
      if (!v10)
      {
LABEL_15:

        return;
      }
    }
    [(SAWithYouDetector *)self forceUpdateWithYouStatusWithShortScan:0];
    if (![(SAWithYouDetector *)self isInVehicularTravel])
    {
      uint64_t v13 = [(SAWithYouDetector *)self locationRequester];
      [v13 requestLocationForType:0];
    }
    goto LABEL_15;
  }
  [(SAWithYouDetector *)self setNextOpportunisticScanDate:0];
}

- (BOOL)_deviceIsWatch:(id)a3
{
  unint64_t v3 = [(SADeviceRecord *)self->_deviceRecord getSADevice:a3];
  BOOL v4 = [v3 deviceType] == 8;

  return v4;
}

+ (id)convertSAWithYouStatusToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E68D73D8[a3 - 1];
  }
}

+ (id)convertSAWithYouLongScanContextToString:(unint64_t)a3
{
  if (a3 - 1 > 9) {
    return @"Unknown";
  }
  else {
    return off_1E68D73F8[a3 - 1];
  }
}

- (void)didChangeTravelTypeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v8 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v8;
    int v10 = +[SATravelTypeClassifier convertSATravelTypeToString:a3];
    uint64_t v11 = +[SATravelTypeClassifier convertSATravelTypeToString:a4];
    v12[0] = 68289539;
    v12[1] = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2113;
    uint64_t v16 = v10;
    __int16 v17 = 2113;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D15FC000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #withyou travel type change\", \"from\":\"%{private}@\", \"to\":\"%{private}@\"}", (uint8_t *)v12, 0x26u);
  }
  if (a4 == 2)
  {
    [(SAWithYouDetector *)self setIsInVehicularTravel:0];
    if ([(SAWithYouDetector *)self isPeriodicScansAllowed]) {
      [(SAWithYouDetector *)self requestScanIfNeeded];
    }
  }
  else if (a4 == 1)
  {
    [(SAWithYouDetector *)self setIsInVehicularTravel:1];
  }
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (SABluetoothScanRequestProtocol)bluetoothScanner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothScanner);
  return (SABluetoothScanRequestProtocol *)WeakRetained;
}

- (void)setBluetoothScanner:(id)a3
{
}

- (SALocationRequestProtocol)locationRequester
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationRequester);
  return (SALocationRequestProtocol *)WeakRetained;
}

- (void)setLocationRequester:(id)a3
{
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (SADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
}

- (BOOL)longScanIsOngoing
{
  return self->_longScanIsOngoing;
}

- (void)setLongScanIsOngoing:(BOOL)a3
{
  self->_longScanIsOngoing = a3;
}

- (BOOL)requestedShortScan
{
  return self->_requestedShortScan;
}

- (void)setRequestedShortScan:(BOOL)a3
{
  self->_requestedShortScan = a3;
}

- (NSDate)lastLongScanRequest
{
  return self->_lastLongScanRequest;
}

- (void)setLastLongScanRequest:(id)a3
{
}

- (NSDate)lastStartOfScan
{
  return self->_lastStartOfScan;
}

- (void)setLastStartOfScan:(id)a3
{
}

- (NSDate)lastEndOfScan
{
  return self->_lastEndOfScan;
}

- (void)setLastEndOfScan:(id)a3
{
}

- (BOOL)isNotifyWhileTravelingEnabled
{
  return self->_isNotifyWhileTravelingEnabled;
}

- (void)setIsNotifyWhileTravelingEnabled:(BOOL)a3
{
  self->_isNotifyWhileTravelingEnabled = a3;
}

- (BOOL)isPeriodicScansNeeded
{
  return self->_isPeriodicScansNeeded;
}

- (void)setIsPeriodicScansNeeded:(BOOL)a3
{
  self->_isPeriodicScansNeeded = a3;
}

- (void)setIsInVehicularTravel:(BOOL)a3
{
  self->_isInVehicularTravel = a3;
}

- (NSDate)nextOpportunisticScanDate
{
  return self->_nextOpportunisticScanDate;
}

- (void)setNextOpportunisticScanDate:(id)a3
{
}

- (NSUUID)nextScheduledAlarm
{
  return self->_nextScheduledAlarm;
}

- (void)setNextScheduledAlarm:(id)a3
{
}

- (NSDate)previousBufferEmptyTime
{
  return self->_previousBufferEmptyTime;
}

- (void)setPreviousBufferEmptyTime:(id)a3
{
}

- (NSDate)initializationTime
{
  return self->_initializationTime;
}

- (void)setInitializationTime:(id)a3
{
}

- (NSMutableSet)relevantDevicesToFindDuringLongScan
{
  return self->_relevantDevicesToFindDuringLongScan;
}

- (void)setRelevantDevicesToFindDuringLongScan:(id)a3
{
}

- (NSMutableDictionary)foundDevicesDuringCurrentScan
{
  return self->_foundDevicesDuringCurrentScan;
}

- (void)setFoundDevicesDuringCurrentScan:(id)a3
{
}

- (BOOL)isFindingRelevantDevices
{
  return self->_isFindingRelevantDevices;
}

- (void)setIsFindingRelevantDevices:(BOOL)a3
{
  self->_isFindingRelevantDevices = a3;
}

- (NSDate)lastRelevantDeviceFoundTime
{
  return self->_lastRelevantDeviceFoundTime;
}

- (void)setLastRelevantDeviceFoundTime:(id)a3
{
}

- (unint64_t)lastLongScanContext
{
  return self->_lastLongScanContext;
}

- (void)setLastLongScanContext:(unint64_t)a3
{
  self->_lastLongScanContext = a3;
}

- (unint64_t)extraFoundHELECount
{
  return self->_extraFoundHELECount;
}

- (void)setExtraFoundHELECount:(unint64_t)a3
{
  self->_extraFoundHELECount = a3;
}

- (unint64_t)extraFoundNonHELECount
{
  return self->_extraFoundNonHELECount;
}

- (void)setExtraFoundNonHELECount:(unint64_t)a3
{
  self->_extraFoundNonHELECount = a3;
}

- (NSDate)lastExtraHELEFoundTime
{
  return self->_lastExtraHELEFoundTime;
}

- (void)setLastExtraHELEFoundTime:(id)a3
{
}

- (NSDate)lastExtraNonHELEFoundTime
{
  return self->_lastExtraNonHELEFoundTime;
}

- (void)setLastExtraNonHELEFoundTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExtraNonHELEFoundTime, 0);
  objc_storeStrong((id *)&self->_lastExtraHELEFoundTime, 0);
  objc_storeStrong((id *)&self->_lastRelevantDeviceFoundTime, 0);
  objc_storeStrong((id *)&self->_foundDevicesDuringCurrentScan, 0);
  objc_storeStrong((id *)&self->_relevantDevicesToFindDuringLongScan, 0);
  objc_storeStrong((id *)&self->_initializationTime, 0);
  objc_storeStrong((id *)&self->_previousBufferEmptyTime, 0);
  objc_storeStrong((id *)&self->_nextScheduledAlarm, 0);
  objc_storeStrong((id *)&self->_nextOpportunisticScanDate, 0);
  objc_storeStrong((id *)&self->_lastEndOfScan, 0);
  objc_storeStrong((id *)&self->_lastStartOfScan, 0);
  objc_storeStrong((id *)&self->_lastLongScanRequest, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_destroyWeak((id *)&self->_locationRequester);
  objc_destroyWeak((id *)&self->_bluetoothScanner);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end