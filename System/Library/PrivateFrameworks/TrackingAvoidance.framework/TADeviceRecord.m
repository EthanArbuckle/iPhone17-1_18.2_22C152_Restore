@interface TADeviceRecord
+ (BOOL)_isKnownDevice:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)notificationInternalStateToString:(unint64_t)a3;
+ (unint64_t)_convertTANotificationStateToTANotificationInternalState:(unint64_t)a3;
- (BOOL)hasStagedImmediateDetections:(id)a3;
- (BOOL)hasSurfacedNotificationFor:(id)a3;
- (BOOL)isAISFetchSuccessful:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownDevice:(id)a3;
- (NSDate)lastPurgeDate;
- (NSDate)lastScanAttemptDate;
- (NSMutableDictionary)deviceRecord;
- (NSMutableDictionary)deviceUUIDToAddress;
- (TADeviceRecord)init;
- (TADeviceRecord)initWithCoder:(id)a3;
- (TADeviceRecord)initWithSettings:(id)a3;
- (TADeviceRecordSettings)settings;
- (TAStoreRequestProtocol)delegate;
- (id)_determineFirstObservationDateWithTASuspiciousDevice:(id)a3;
- (id)_determineHELEKeepInStagingUntil:(id)a3;
- (id)_determineKeepInStagingUntil:(id)a3;
- (id)_getDeviceRecord:(id)a3;
- (id)_getDeviceRecordWithUUID:(id)a3;
- (id)createTAOutgoingRequestForUnstagingUpdateFor:(id)a3 withCurrentDate:(id)a4;
- (id)createTAOutgoingRequestWithExpiringTASingleDeviceRecord:(id)a3 withCurrentDate:(id)a4;
- (id)description;
- (id)descriptionDictionary;
- (id)getAccessoryInfo:(id)a3;
- (id)getDetectionResultsToPush;
- (id)getDeviceUUID:(id)a3;
- (id)getDeviceUUIDMapping;
- (id)getFirstStagedDetectionDate:(id)a3;
- (id)getLatestAdvertisement:(id)a3;
- (id)getLatestBeepOnMoveDate:(id)a3;
- (id)getUnknownBeacon:(id)a3;
- (unint64_t)getAISFetchState:(id)a3;
- (unint64_t)getDeviceNotificationState:(id)a3;
- (unint64_t)getDeviceOwnershipType:(id)a3;
- (unint64_t)getDeviceType:(id)a3;
- (unint64_t)getNumOfAISFetch:(id)a3;
- (unint64_t)getNumStagedDetections:(id)a3;
- (void)_beepOnMoveForceAlertIfEligableForDeviceRecord:(id)a3 andAdvertisment:(id)a4;
- (void)_clearStagedDetectionsForDevice:(id)a3;
- (void)_createRecordIfNecessaryWithAdvertisement:(id)a3 withDate:(id)a4;
- (void)_didSurfaceNotificationFor:(id)a3;
- (void)_performNotificationStateTransitionActionsForDevice:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5;
- (void)_processAISFetchSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)_processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)_setDevice:(id)a3 withExternalState:(unint64_t)a4 withDate:(id)a5;
- (void)_setDevice:(id)a3 withInternalState:(unint64_t)a4 withDate:(id)a5;
- (void)_setDevice:(id)a3 withType:(unint64_t)a4 withDate:(id)a5;
- (void)_updateAISStateOnNotificationStateChange:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5;
- (void)_updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)_updateKeepInStagingUntil:(id)a3;
- (void)checkForScanRequestsWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:(id)a3 withReason:(unint64_t)a4;
- (void)forceUpdateAISFetchState:(id)a3 state:(unint64_t)a4;
- (void)ingestTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)logDeviceRecord;
- (void)mergeWithAnotherDeviceRecord:(id)a3;
- (void)processBackgroundDetection:(id)a3;
- (void)processSurfacedAlerts:(id)a3;
- (void)purgeWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)removeDevice:(id)a3;
- (void)requestAISFetchIfNeeded:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRecord:(id)a3;
- (void)setDeviceUUIDToAddress:(id)a3;
- (void)setLastPurgeDate:(id)a3;
- (void)setLastScanAttemptDate:(id)a3;
- (void)setSettings:(id)a3;
- (void)stageDetectionResults:(id)a3;
- (void)stageDevice:(id)a3 withCurrentDate:(id)a4;
- (void)updateDeviceRecordOnSessionChange:(id)a3 WithCurrentDate:(id)a4;
@end

@implementation TADeviceRecord

- (void)purgeWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  [v7 timeIntervalSinceDate:self->_lastPurgeDate];
  double v10 = v9;
  [(TADeviceRecordSettings *)self->_settings purgeTimeInterval];
  if (v10 >= v11)
  {
    v12 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22345C000, v12, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord purging records", (uint8_t *)&buf, 2u);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(NSMutableDictionary *)self->_deviceRecord allKeys];
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v18 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v17];
          v19 = [v18 creationDate];
          [v7 timeIntervalSinceDate:v19];
          double v21 = v20;
          [(TADeviceRecordSettings *)self->_settings expiryTimeInterval];
          double v23 = v22;

          if (v21 > v23)
          {
            v24 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
              [(TADeviceRecord *)&buf purgeWithClock:v17 andAppendOutgoingRequestsTo:&v38];
            }
            v25 = [(TADeviceRecord *)self createTAOutgoingRequestWithExpiringTASingleDeviceRecord:v18 withCurrentDate:v7];
            [v8 addObject:v25];
            [(NSMutableDictionary *)self->_deviceRecord removeObjectForKey:v17];
            deviceUUIDToAddress = self->_deviceUUIDToAddress;
            v27 = [v18 uuid];
            [(NSMutableDictionary *)deviceUUIDToAddress removeObjectForKey:v27];
          }
          v28 = [v18 purgeStagedDetectionsWithClock:v7];
          if ([v28 count])
          {
            v29 = [(TADeviceRecord *)self createTAOutgoingRequestForUnstagingUpdateFor:v28 withCurrentDate:v7];
            [v8 addObject:v29];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    objc_storeStrong(v30, v31);
    [(TADeviceRecord *)self logDeviceRecord];
  }
}

- (void)checkForScanRequestsWithClock:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  [v7 timeIntervalSinceDate:self->_lastScanAttemptDate];
  double v10 = v9;
  [(TADeviceRecordSettings *)self->_settings scanInterval];
  if (v10 < v11) {
    goto LABEL_22;
  }
  v32 = v8;
  id v33 = v7;
  objc_storeStrong((id *)&self->_lastScanAttemptDate, a3);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v12 = self->_deviceRecord;
  uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (!v13)
  {
    char v15 = 0;
    char v16 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  char v15 = 0;
  char v16 = 0;
  uint64_t v17 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v35 != v17) {
        objc_enumerationMutation(v12);
      }
      v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", *(void *)(*((void *)&v34 + 1) + 8 * i), v32);
      double v20 = [v19 latestAdvertisement];
      int v21 = [v20 hasHawkeyeAdvertisementPolicy];

      if (v21)
      {
        double v22 = [v19 getStagedDetections];
        v16 |= [v22 count] != 0;
      }
      else
      {
        double v23 = [v19 latestAdvertisement];
        int v24 = [v23 hasHawkeyeLowEnergyAdvertisementPolicy];

        if (!v24) {
          goto LABEL_12;
        }
        double v22 = [v19 getStagedDetections];
        v15 |= [v22 count] != 0;
      }

LABEL_12:
    }
    uint64_t v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v34 objects:v50 count:16];
  }
  while (v14);
LABEL_16:

  v25 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 68289538;
    int v43 = 0;
    __int16 v44 = 2082;
    v45 = "";
    __int16 v46 = 1026;
    int v47 = v16 & 1;
    __int16 v48 = 1026;
    int v49 = v15 & 1;
    _os_log_impl(&dword_22345C000, v25, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord device record scan request\", \"shouldScanHawkeye\":%{public}hhd, \"shouldScanHawkeyeLowEnergy\":%{public}hhd}", buf, 0x1Eu);
  }
  if (v16)
  {
    v26 = [TAOutgoingRequests alloc];
    uint64_t v40 = @"ScanRequestReason";
    v41 = @"Updating device record";
    v27 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v28 = [(TAOutgoingRequests *)v26 initWithRequestKey:@"RequestingAdditionalScans" additionalInformation:v27 date:v33];

    [v32 addObject:v28];
  }
  id v8 = v32;
  id v7 = v33;
  if (v15)
  {
    v29 = [TAOutgoingRequests alloc];
    uint64_t v38 = @"ScanRequestReason";
    v39 = @"Updating device record";
    v30 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v31 = [(TAOutgoingRequests *)v29 initWithRequestKey:@"RequestingAdditionalHawkeyeLowEnergyScans" additionalInformation:v30 date:v33];

    [v32 addObject:v31];
  }
LABEL_22:
}

- (void)ingestTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    id v8 = v6;
    double v9 = [v8 advertisement];
    uint64_t v10 = [v8 notificationState];
    double v11 = [v8 getDate];
    [(TADeviceRecord *)self _setDevice:v9 withExternalState:v10 withDate:v11];

    v12 = [v8 advertisement];
    uint64_t v13 = [v8 deviceType];
    uint64_t v14 = [v8 getDate];
    [(TADeviceRecord *)self _setDevice:v12 withType:v13 withDate:v14];

    char v15 = [v8 advertisement];

    [(TADeviceRecord *)self _updateAdvertisement:v15 andAppendOutgoingRequestsTo:v7];
  }
  else if ([v6 isMemberOfClass:objc_opt_class()])
  {
    [(TADeviceRecord *)self _updateAdvertisement:v6 andAppendOutgoingRequestsTo:v7];
  }
  else if ([v6 isMemberOfClass:objc_opt_class()])
  {
    char v16 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      v18 = [v6 description];
      v19[0] = 68289283;
      v19[1] = 0;
      __int16 v20 = 2082;
      int v21 = "";
      __int16 v22 = 2113;
      double v23 = v18;
      _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord adding playsound\", \"playsound\":\"%{private}@\"}", (uint8_t *)v19, 0x1Cu);
    }
    [(TADeviceRecord *)self _processPlaySoundSuccess:v6 andAppendOutgoingRequestsTo:v7];
  }
  else if ([v6 isMemberOfClass:objc_opt_class()])
  {
    [(TADeviceRecord *)self _processAISFetchSuccess:v6 andAppendOutgoingRequestsTo:v7];
  }
}

- (BOOL)hasSurfacedNotificationFor:(id)a3
{
  v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 hasSurfacedNotification];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_getDeviceRecord:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)processSurfacedAlerts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          double v11 = [v10 latestAdvertisement];
          v12 = [v10 date];
          [(TADeviceRecord *)self _createRecordIfNecessaryWithAdvertisement:v11 withDate:v12];

          uint64_t v13 = [v10 address];
          uint64_t v14 = [(TADeviceRecord *)self _getDeviceRecord:v13];

          [v14 processSurfacedAlert:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (id)getDetectionResultsToPush
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_deviceRecord;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecord, "objectForKeyedSubscript:", v9, (void)v13);
        double v11 = [v10 getDetectionsReadyToPushAndCheckForAISFetch];
        [v3 addObjectsFromArray:v11];

        [(TADeviceRecord *)self requestAISFetchIfNeeded:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (TADeviceRecord)init
{
  id v3 = objc_alloc_init(TADeviceRecordSettings);
  id v4 = [(TADeviceRecord *)self initWithSettings:v3];

  return v4;
}

- (TADeviceRecord)initWithSettings:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TADeviceRecord;
  uint64_t v6 = [(TADeviceRecord *)&v16 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceRecord = v6->_deviceRecord;
    v6->_deviceRecord = v7;

    uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
    lastPurgeDate = v6->_lastPurgeDate;
    v6->_lastPurgeDate = (NSDate *)v9;

    uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
    lastScanAttemptDate = v6->_lastScanAttemptDate;
    v6->_lastScanAttemptDate = (NSDate *)v11;

    objc_storeStrong((id *)&v6->_settings, a3);
    long long v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceUUIDToAddress = v6->_deviceUUIDToAddress;
    v6->_deviceUUIDToAddress = v13;
  }
  return v6;
}

+ (id)notificationInternalStateToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Invalid";
  }
  else {
    return off_2646AB000[a3];
  }
}

- (id)_getDeviceRecordWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceUUIDToAddress objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_deviceUUIDToAddress objectForKeyedSubscript:v4];
    uint64_t v7 = [(TADeviceRecord *)self _getDeviceRecord:v6];
    uint64_t v8 = v7;
    if (v7) {
      id v9 = v7;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)getDeviceOwnershipType:(id)a3
{
  id v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 type];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)getDeviceNotificationState:(id)a3
{
  id v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 state];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)getLatestAdvertisement:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 latestAdvertisement];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)getAISFetchState:(id)a3
{
  id v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 AISFetchState];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)forceUpdateAISFetchState:(id)a3 state:(unint64_t)a4
{
  unint64_t v5 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  if (v5)
  {
    id v6 = v5;
    [v5 setAISFetchState:a4];
    unint64_t v5 = v6;
  }
}

- (id)getDeviceUUID:(id)a3
{
  id v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 uuid];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)getUnknownBeacon:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(TADeviceRecord *)self _getDeviceRecordWithUUID:v4];
    if (v5)
    {
      int v6 = +[TAUnknownBeacon instancesRespondToSelector:NSSelectorFromString(&cfstr_Initwithbeacon.isa)];
      uint64_t v7 = [TAUnknownBeacon alloc];
      uint64_t v8 = [v5 uuid];
      id v9 = [v5 address];
      uint64_t v10 = [v5 getDeviceType];
      uint64_t v11 = [v5 accessoryInfo];
      if (v6)
      {
        v12 = [v5 latestAdvertisement];
        uint64_t v13 = [v12 isPosh];
        long long v14 = [v5 latestAdvertisement];
        long long v15 = -[TAUnknownBeacon initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:](v7, "initWithBeaconUUID:address:deviceType:withAccessoryInfo:isPoshAccessory:isFindMyNetwork:", v8, v9, v10, v11, v13, [v14 isApple]);
      }
      else
      {
        long long v15 = [(TAUnknownBeacon *)v7 initWithBeaconUUID:v8 address:v9 deviceType:v10 withAccessoryInfo:v11];
      }
    }
    else
    {
      long long v17 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        int v19 = 68289026;
        int v20 = 0;
        __int16 v21 = 2082;
        __int16 v22 = "";
        _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord fetch TAUnknownBeacon receive invalid record\"}", (uint8_t *)&v19, 0x12u);
      }
      long long v15 = 0;
    }
  }
  else
  {
    objc_super v16 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      int v19 = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      __int16 v22 = "";
      _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord fetch TAUnknownBeacon receive nil uuid\"}", (uint8_t *)&v19, 0x12u);
    }
    long long v15 = 0;
  }

  return v15;
}

+ (unint64_t)_convertTANotificationStateToTANotificationInternalState:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)getDeviceUUIDMapping
{
  return self->_deviceUUIDToAddress;
}

- (void)_createRecordIfNecessaryWithAdvertisement:(id)a3 withDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    deviceRecord = self->_deviceRecord;
    id v9 = [v6 address];
    uint64_t v10 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v9];

    if (v7)
    {
      if (!v10)
      {
        uint64_t v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
          -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](v11, v6);
        }
        v12 = [TASingleDeviceRecord alloc];
        [(TADeviceRecordSettings *)self->_settings keepAliveInterval];
        uint64_t v13 = -[TASingleDeviceRecord initWithDeviceAdvertisement:state:type:date:keepAliveInterval:](v12, "initWithDeviceAdvertisement:state:type:date:keepAliveInterval:", v6, 0, 0, v7);
        if (v13)
        {
          long long v14 = self->_deviceRecord;
          long long v15 = [v6 address];
          [(NSMutableDictionary *)v14 setObject:v13 forKey:v15];

          deviceUUIDToAddress = self->_deviceUUIDToAddress;
          long long v17 = [v6 address];
          uint64_t v18 = [(TASingleDeviceRecord *)v13 uuid];
          [(NSMutableDictionary *)deviceUUIDToAddress setObject:v17 forKey:v18];
        }
        else
        {
          int v19 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
            -[TADeviceRecord _createRecordIfNecessaryWithAdvertisement:withDate:](v19);
          }
        }
      }
    }
  }
}

- (void)_setDevice:(id)a3 withType:(unint64_t)a4 withDate:(id)a5
{
  if (a4 && a3 && a5)
  {
    id v8 = a3;
    [(TADeviceRecord *)self _createRecordIfNecessaryWithAdvertisement:v8 withDate:a5];
    deviceRecord = self->_deviceRecord;
    id v11 = [v8 address];

    uint64_t v10 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v11];
    [v10 setType:a4];
  }
}

- (void)_setDevice:(id)a3 withExternalState:(unint64_t)a4 withDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(TADeviceRecord *)self _setDevice:v9 withInternalState:+[TADeviceRecord _convertTANotificationStateToTANotificationInternalState:a4] withDate:v8];
}

- (void)_setDevice:(id)a3 withInternalState:(unint64_t)a4 withDate:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (a4 && v8 && v9)
  {
    [(TADeviceRecord *)self _createRecordIfNecessaryWithAdvertisement:v8 withDate:v9];
    id v11 = [v8 address];
    uint64_t v12 = [(TADeviceRecord *)self getDeviceNotificationState:v11];

    switch(v12)
    {
      case 0:
        char v13 = a4 - 1;
        if (a4 - 1 < 4) {
          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADeviceRecord _setDevice:withInternalState:withDate:]();
        }
        goto LABEL_27;
      case 1:
        if (a4 - 1 < 4)
        {
          int v15 = ((_BYTE)a4 - 1) & 1;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADeviceRecord _setDevice:withInternalState:withDate:]();
        }
        goto LABEL_27;
      case 2:
        if (a4 - 1 < 4)
        {
          int v15 = (((_BYTE)a4 - 1) & 0xF) == 3;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.4();
        }
        goto LABEL_27;
      case 3:
        if (a4 - 1 < 4)
        {
          char v16 = (a4 - 1) & 0xF;
          unsigned int v17 = 11;
          goto LABEL_18;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.5();
        }
        goto LABEL_27;
      case 4:
        char v13 = a4 - 1;
        if (a4 - 1 >= 4)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
            -[TADeviceRecord _setDevice:withInternalState:withDate:].cold.6();
          }
LABEL_27:
          int v15 = 0;
        }
        else
        {
LABEL_17:
          char v16 = v13 & 0xF;
          unsigned int v17 = 7;
LABEL_18:
          int v15 = (v17 >> v16) & 1;
        }
LABEL_28:
        uint64_t v18 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v19 = v15 == 0;
          int v33 = v15;
          int v20 = v10;
          __int16 v21 = self;
          if (v19) {
            __int16 v22 = "not";
          }
          else {
            __int16 v22 = "is";
          }
          uint64_t v23 = v18;
          uint64_t v24 = [v8 address];
          v25 = [v24 hexString];
          +[TADeviceRecord notificationInternalStateToString:v12];
          v26 = uint64_t v34 = v12;
          v27 = +[TADeviceRecord notificationInternalStateToString:a4];
          *(_DWORD *)int buf = 136315907;
          long long v36 = v22;
          self = v21;
          uint64_t v10 = v20;
          int v15 = v33;
          __int16 v37 = 2113;
          uint64_t v38 = v25;
          __int16 v39 = 2114;
          uint64_t v40 = v26;
          __int16 v41 = 2114;
          v42 = v27;
          _os_log_impl(&dword_22345C000, v23, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord %s updating state for %{private}@ from %{public}@ to %{public}@", buf, 0x2Au);

          uint64_t v12 = v34;
        }
        if (v15)
        {
          v28 = [v8 address];
          [(TADeviceRecord *)self _performNotificationStateTransitionActionsForDevice:v28 from:v12 to:a4];

          v29 = [v8 address];
          [(TADeviceRecord *)self _updateAISStateOnNotificationStateChange:v29 from:v12 to:a4];

          deviceRecord = self->_deviceRecord;
          v31 = [v8 address];
          v32 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v31];
          [v32 setState:a4];
        }
        break;
      default:
        long long v14 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADeviceRecord _setDevice:withInternalState:withDate:](v12, v14);
        }
        goto LABEL_27;
    }
  }
}

- (void)_updateAISStateOnNotificationStateChange:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  if (a4 - 1 < 2)
  {
    if (a5 == 4)
    {
      id v17 = v8;
      uint64_t v12 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
      uint64_t v13 = [v12 AISFetchState];

      if (v13 == 8 || v13 == 4)
      {
        int v15 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v17];
        [v15 setAISFetchState:0];
      }
    }
  }
  else if ((!a4 || a4 == 4) && a5 == 3)
  {
    id v16 = v8;
    id v9 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 AISFetchState];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      id v11 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v16];
      [v11 setAISFetchState:1];
    }
    [(TADeviceRecord *)self requestAISFetchIfNeeded:v16];
  }
  MEMORY[0x270F9A758]();
}

- (void)_performNotificationStateTransitionActionsForDevice:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a5 == 2)
  {
    id v9 = v7;
    [(TADeviceRecord *)self _clearStagedDetectionsForDevice:v7];
    id v7 = (id)[(TADeviceRecord *)self _didSurfaceNotificationFor:v9];
  }
  else
  {
    if (a5 != 1) {
      goto LABEL_6;
    }
    id v9 = v7;
    id v7 = (id)[(TADeviceRecord *)self _clearStagedDetectionsForDevice:v7];
  }
  id v8 = v9;
LABEL_6:
  MEMORY[0x270F9A758](v7, v8);
}

- (void)_updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 beepOnMoveHigh])
  {
    id v7 = [v11 scanDate];
    [(TADeviceRecord *)self _createRecordIfNecessaryWithAdvertisement:v11 withDate:v7];
  }
  deviceRecord = self->_deviceRecord;
  id v9 = [v11 address];
  uint64_t v10 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v9];

  if (v10)
  {
    [v10 updateAdvertisement:v11 andAppendOutgoingRequestsTo:v6];
    [(TADeviceRecord *)self _beepOnMoveForceAlertIfEligableForDeviceRecord:v10 andAdvertisment:v11];
  }
}

- (void)_beepOnMoveForceAlertIfEligableForDeviceRecord:(id)a3 andAdvertisment:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [v8 getDeviceType];
  if ([(TADeviceRecordSettings *)self->_settings surfaceImmediatelyBeepOnMove]
    && [v6 beepOnMoveHigh]
    && v7 == 1
    && [v8 numStagedDetections])
  {
    [(TADeviceRecord *)self forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:v6 withReason:2];
  }
}

- (void)_processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 address];

    if (v8)
    {
      id v9 = [v6 address];
      uint64_t v10 = [(TADeviceRecord *)self _getDeviceRecord:v9];

      if (v10)
      {
        [v10 processPlaySoundSuccess:v6 andAppendOutgoingRequestsTo:v7];
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v13 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      uint64_t v12 = v13;
      long long v14 = [v6 description];
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      uint64_t v18 = "";
      __int16 v19 = 2113;
      int v20 = v14;
      _os_log_impl(&dword_22345C000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord no records exist for address\", \"playsound\":\"%{private}@\"}", (uint8_t *)&v15, 0x1Cu);

LABEL_7:
      goto LABEL_8;
    }
  }
  id v11 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = v11;
    uint64_t v12 = [v6 description];
    int v15 = 68289283;
    int v16 = 0;
    __int16 v17 = 2082;
    uint64_t v18 = "";
    __int16 v19 = 2113;
    int v20 = v12;
    _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord playsound success empty\", \"playsound\":\"%{private}@\"}", (uint8_t *)&v15, 0x1Cu);
    goto LABEL_7;
  }
LABEL_9:
}

- (void)requestAISFetchIfNeeded:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5)
  {
    int v15 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v15;
      uint64_t v13 = [v4 hexString];
      int v34 = 68289283;
      int v35 = 0;
      __int16 v36 = 2082;
      __int16 v37 = "";
      __int16 v38 = 2113;
      __int16 v39 = v13;
      long long v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord no records exist for AIS fetch\", \"address\":\"%{private}@\"}";
      int v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_22345C000, v16, v17, v14, (uint8_t *)&v34, 0x1Cu);
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if ([v5 getDeviceType] == 1)
  {
    id v7 = [v6 latestAdvertisement];
    char v8 = [v7 isPosh];

    if ((v8 & 1) == 0)
    {
      v26 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v26;
        uint64_t v13 = [v4 hexString];
        int v34 = 68289283;
        int v35 = 0;
        __int16 v36 = 2082;
        __int16 v37 = "";
        __int16 v38 = 2113;
        __int16 v39 = v13;
        long long v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch - non-posh durian type\", \"address\":\"%{private}@\"}";
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  id v9 = [v6 latestAdvertisement];
  if ([v9 isPosh])
  {
    char v10 = _os_feature_enabled_impl();

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [v4 hexString];
        int v34 = 68289283;
        int v35 = 0;
        __int16 v36 = 2082;
        __int16 v37 = "";
        __int16 v38 = 2113;
        __int16 v39 = v13;
        long long v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch for posh type - feature isn't enabled\", \"a"
              "ddress\":\"%{private}@\"}";
LABEL_22:
        int v16 = v12;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_23;
      }
      goto LABEL_26;
    }
  }
  else
  {
  }
  if ((unint64_t)[v6 AISFetchCount] < 0xA)
  {
    uint64_t v19 = [v6 AISFetchState];
    uint64_t v12 = [(TADeviceRecord *)self delegate];
    if (v19 == 5)
    {
      v27 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v27;
        v29 = [v4 hexString];
        int v34 = 68289539;
        int v35 = 0;
        __int16 v36 = 2082;
        __int16 v37 = "";
        __int16 v38 = 2113;
        __int16 v39 = v29;
        __int16 v40 = 2050;
        uint64_t v41 = [v6 AISFetchCount];
        _os_log_impl(&dword_22345C000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord request AIS fetch\", \"address\":\"%{private}@\", \"requestedCount\":%{public}lu}", (uint8_t *)&v34, 0x26u);
      }
      v30 = [v6 uuid];
      uint64_t v13 = [(TADeviceRecord *)self getUnknownBeacon:v30];

      if (v13)
      {
        uint64_t v24 = v6;
        uint64_t v25 = 6;
        goto LABEL_31;
      }
      v31 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v19 != 1)
      {
LABEL_25:

        goto LABEL_26;
      }
      int v20 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v20;
        __int16 v22 = [v4 hexString];
        int v34 = 68289539;
        int v35 = 0;
        __int16 v36 = 2082;
        __int16 v37 = "";
        __int16 v38 = 2113;
        __int16 v39 = v22;
        __int16 v40 = 2050;
        uint64_t v41 = [v6 AISFetchCount];
        _os_log_impl(&dword_22345C000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord request AIS fetch\", \"address\":\"%{private}@\", \"requestedCount\":%{public}lu}", (uint8_t *)&v34, 0x26u);
      }
      uint64_t v23 = [v6 uuid];
      uint64_t v13 = [(TADeviceRecord *)self getUnknownBeacon:v23];

      if (v13)
      {
        uint64_t v24 = v6;
        uint64_t v25 = 2;
LABEL_31:
        [v24 setAISFetchState:v25];
        objc_msgSend(v6, "setAISFetchCount:", objc_msgSend(v6, "AISFetchCount") + 1);
        [v12 requestAIS:v13];
        goto LABEL_24;
      }
      v31 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
    }
    v32 = v31;
    int v33 = [v4 hexString];
    int v34 = 68289283;
    int v35 = 0;
    __int16 v36 = 2082;
    __int16 v37 = "";
    __int16 v38 = 2113;
    __int16 v39 = v33;
    _os_log_impl(&dword_22345C000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord can't construct TAUnknownBeacon for AIS fetch\", \"address\":\"%{private}@\"}", (uint8_t *)&v34, 0x1Cu);

    goto LABEL_24;
  }
  uint64_t v18 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v18;
    uint64_t v13 = [v4 hexString];
    int v34 = 68289283;
    int v35 = 0;
    __int16 v36 = 2082;
    __int16 v37 = "";
    __int16 v38 = 2113;
    __int16 v39 = v13;
    long long v14 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip request AIS fetch - reach maximum attemps\", \"address\":\"%{private}@\"}";
    goto LABEL_22;
  }
LABEL_26:
}

- (void)_updateKeepInStagingUntil:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(TADeviceRecord *)self _getDeviceRecord:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v13 = v18 = 0u;
  id obj = [v13 getStagedDetections];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        char v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 keepInStagingUntil];
        char v10 = [v8 detection];
        id v11 = [(TADeviceRecord *)self _determineHELEKeepInStagingUntil:v10];

        [v8 setKeepInStagingUntil:v11];
        uint64_t v12 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 68289539;
          int v20 = 0;
          __int16 v21 = 2082;
          __int16 v22 = "";
          __int16 v23 = 2113;
          uint64_t v24 = v9;
          __int16 v25 = 2113;
          v26 = v11;
          _os_log_impl(&dword_22345C000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord update KeepInStagingUntil for new AirPods\", \"before\":\"%{private}@\", \"after\":\"%{private}@\"}", buf, 0x26u);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)_processAISFetchSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    char v8 = [v6 uuid];

    if (v8)
    {
      id v9 = [v6 uuid];
      char v10 = [(TADeviceRecord *)self _getDeviceRecordWithUUID:v9];

      id v11 = (void *)TAStatusLog;
      if (v10)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = v11;
          uint64_t v13 = [v6 description];
          int v22 = 68289283;
          int v23 = 0;
          __int16 v24 = 2082;
          __int16 v25 = "";
          __int16 v26 = 2113;
          v27 = v13;
          _os_log_impl(&dword_22345C000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord received AIS fetch info for uuid\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);
        }
        [v10 processAISFetchEvent:v6 andAppendOutgoingRequestsTo:v7];
        uint64_t v14 = [v6 info];
        if (v14)
        {
          long long v15 = (void *)v14;
          long long v16 = [v6 info];
          int v17 = [v16 isHawkeyeAudioAccessory];

          if (v17)
          {
            long long v18 = [v10 address];
            [(TADeviceRecord *)self _updateKeepInStagingUntil:v18];
          }
        }
        goto LABEL_12;
      }
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      int v20 = v11;
      __int16 v21 = [v6 description];
      int v22 = 68289283;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      __int16 v26 = 2113;
      v27 = v21;
      _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord AIS fetch no records exist for uuid\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);

LABEL_11:
      goto LABEL_12;
    }
  }
  uint64_t v19 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    char v10 = v19;
    int v20 = [v6 description];
    int v22 = 68289283;
    int v23 = 0;
    __int16 v24 = 2082;
    __int16 v25 = "";
    __int16 v26 = 2113;
    v27 = v20;
    _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TADeviceRecord AIS fetch success empty\", \"AISFetch\":\"%{private}@\"}", (uint8_t *)&v22, 0x1Cu);
    goto LABEL_11;
  }
LABEL_13:
}

- (id)createTAOutgoingRequestWithExpiringTASingleDeviceRecord:(id)a3 withCurrentDate:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 address];

    if (v7)
    {
      char v8 = [TAOutgoingRequests alloc];
      id v9 = [v5 address];
      uint64_t v12 = v9;
      v13[0] = v5;
      char v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v7 = [(TAOutgoingRequests *)v8 initWithRequestKey:@"ExpiringRecordMetrics" additionalInformation:v10 date:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)createTAOutgoingRequestForUnstagingUpdateFor:(id)a3 withCurrentDate:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "detection", (void)v18);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [TAOutgoingRequests alloc];
  int v22 = @"UnstagingUpdate";
  int v23 = v7;
  long long v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  long long v16 = [(TAOutgoingRequests *)v14 initWithRequestKey:@"UnstagingUpdate" additionalInformation:v15 date:v6];

  return v16;
}

+ (BOOL)_isKnownDevice:(unint64_t)a3
{
  return a3 == 3;
}

- (BOOL)isKnownDevice:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self getDeviceOwnershipType:a3];
  return +[TADeviceRecord _isKnownDevice:v3];
}

- (void)updateDeviceRecordOnSessionChange:(id)a3 WithCurrentDate:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_22345C000, v8, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord updateDeviceRecordOnSessionChange called", buf, 2u);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(NSMutableDictionary *)self->_deviceRecord allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    uint64_t v41 = self;
    id v44 = v7;
    uint64_t v45 = *(void *)v49;
    do
    {
      uint64_t v12 = 0;
      uint64_t v46 = v10;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
        uint64_t v14 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v13];
        [v14 updateSingleDeviceRecordOnSessionChangeWithCurrentDate:v7];
        if (!v6) {
          goto LABEL_21;
        }
        if ([v6 lastStateTransition] != 3) {
          goto LABEL_15;
        }
        uint64_t v15 = [v6 getLatestValidVisit];
        if (!v15) {
          goto LABEL_15;
        }
        long long v16 = (void *)v15;
        int v17 = [v6 getLatestValidVisit];
        long long v18 = [v17 arrivalDate];
        long long v19 = [MEMORY[0x263EFF910] distantPast];
        if (v18 == v19) {
          goto LABEL_14;
        }
        uint64_t v42 = v17;
        long long v20 = [v6 getLatestValidVisit];
        long long v21 = [v20 arrivalDate];
        int v22 = [v14 lastSurfacedAlertDate];
        if ([v21 compare:v22] != -1)
        {

          self = v41;
          int v17 = v42;
          id v7 = v44;
LABEL_14:

          uint64_t v11 = v45;
          uint64_t v10 = v46;
          goto LABEL_15;
        }
        if ([v14 state] == 2)
        {

          self = v41;
          id v7 = v44;
          uint64_t v11 = v45;
          uint64_t v10 = v46;
LABEL_36:
          int v33 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
          {
            v32 = v33;
            int v34 = [v13 hexString];
            *(_DWORD *)int buf = 68289283;
            int v55 = 0;
            __int16 v56 = 2082;
            v57 = "";
            __int16 v58 = 2113;
            v59 = v34;
            int v35 = v32;
            __int16 v36 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip reprompting since we have issued an alert upon arrival\", "
                  "\"address\":\"%{private}@\"}";
LABEL_41:
            _os_log_impl(&dword_22345C000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0x1Cu);

            id v7 = v44;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        uint64_t v39 = [v14 state];

        self = v41;
        id v7 = v44;
        uint64_t v11 = v45;
        uint64_t v10 = v46;
        if (v39 == 1) {
          goto LABEL_36;
        }
LABEL_15:
        if ([v6 lastStateTransition] != 4) {
          goto LABEL_21;
        }
        uint64_t v23 = [v6 getLatestValidVisit];
        if (!v23) {
          goto LABEL_21;
        }
        __int16 v24 = (void *)v23;
        uint64_t v25 = [v6 getLatestValidVisit];
        __int16 v26 = [v25 departureDate];
        v27 = [MEMORY[0x263EFF910] distantFuture];
        if (v26 == v27) {
          goto LABEL_20;
        }
        uint64_t v43 = v25;
        uint64_t v28 = [v6 getLatestValidVisit];
        v29 = [v28 departureDate];
        v30 = [v14 lastSurfacedAlertDate];
        if ([v29 compare:v30] != -1)
        {

          self = v41;
          uint64_t v25 = v43;
          id v7 = v44;
LABEL_20:

          uint64_t v11 = v45;
          uint64_t v10 = v46;
LABEL_21:
          if (([v14 state] == 2 || objc_msgSend(v14, "state") == 1 || objc_msgSend(v14, "state") == 3)
            && !+[TADeviceRecord _isKnownDevice:](TADeviceRecord, "_isKnownDevice:", [v14 type]))
          {
            v31 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
              [(TADeviceRecord *)&v52 updateDeviceRecordOnSessionChange:v13 WithCurrentDate:&v53];
            }
            v32 = [v14 latestAdvertisement];
            [(TADeviceRecord *)self _setDevice:v32 withInternalState:4 withDate:v7];
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        if ([v14 state] == 2)
        {

          self = v41;
          id v7 = v44;
          uint64_t v11 = v45;
          uint64_t v10 = v46;
        }
        else
        {
          uint64_t v40 = [v14 state];

          self = v41;
          id v7 = v44;
          uint64_t v11 = v45;
          uint64_t v10 = v46;
          if (v40 != 1) {
            goto LABEL_21;
          }
        }
        __int16 v37 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          v32 = v37;
          int v34 = [v13 hexString];
          *(_DWORD *)int buf = 68289283;
          int v55 = 0;
          __int16 v56 = 2082;
          v57 = "";
          __int16 v58 = 2113;
          v59 = v34;
          int v35 = v32;
          __int16 v36 = "{\"msg%{public}.0s\":\"#TADeviceRecord skip reprompting since we have issued an alert upon departure\", "
                "\"address\":\"%{private}@\"}";
          goto LABEL_41;
        }
LABEL_29:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
      uint64_t v10 = v38;
    }
    while (v38);
  }

  [(TADeviceRecord *)self logDeviceRecord];
}

- (void)stageDevice:(id)a3 withCurrentDate:(id)a4
{
}

- (void)logDeviceRecord
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = [(NSMutableDictionary *)self->_deviceRecord allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = v8;
          uint64_t v11 = [v9 hexString];
          uint64_t v12 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v9];
          uint64_t v13 = [v12 description];
          *(_DWORD *)int buf = 138478083;
          long long v19 = v11;
          __int16 v20 = 2113;
          long long v21 = v13;
          _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TADeviceRecord status for %{private}@:%{private}@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)_clearStagedDetectionsForDevice:(id)a3
{
  unint64_t v3 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 clearAllStagedDetections];
  }
  else
  {
    uint64_t v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TADeviceRecord *)v5 _clearStagedDetectionsForDevice:v7];
    }
  }
}

- (id)_determineFirstObservationDateWithTASuspiciousDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 date];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend(v4, "locationHistory", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v5;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) getDate];
        uint64_t v5 = [v11 earlierDate:v12];

        ++v10;
        uint64_t v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  deviceRecord = self->_deviceRecord;
  long long v14 = [v4 address];
  long long v15 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v14];

  long long v16 = [v15 earliestObservationDate];
  long long v17 = [v5 earlierDate:v16];

  return v17;
}

- (id)_determineHELEKeepInStagingUntil:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TADeviceRecord *)self _determineFirstObservationDateWithTASuspiciousDevice:v4];
  uint64_t v6 = (void *)MEMORY[0x263EFF910];
  uint64_t v7 = [(TADeviceRecord *)self settings];
  [v7 maxExpectedHELEWildInterval];
  uint64_t v8 = objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v5);

  uint64_t v9 = [(TADeviceRecord *)self settings];
  if ([v9 shouldAlertHELEImmediatelyForImmediateTypes])
  {
    uint64_t v10 = [v4 immediacyType];

    if (v10 == 2)
    {
      uint64_t v11 = [v4 date];
      id v12 = [v8 laterDate:v11];
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v11 = [v4 date];
  uint64_t v13 = (void *)MEMORY[0x263EFF910];
  [(TADeviceRecordSettings *)self->_settings minimumHELEStagingInterval];
  long long v14 = objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v5);
  long long v15 = [v14 laterDate:v11];

  long long v16 = [(TADeviceRecord *)self settings];
  uint64_t v17 = [v16 stagingHELEBackstopHour];

  if (v17 < 25)
  {
    long long v18 = objc_msgSend(v11, "getNextDateAtHour:", -[TADeviceRecordSettings assumedKeyRollHour](self->_settings, "assumedKeyRollHour"));
    long long v19 = objc_msgSend(v11, "getNextDateAtHour:", -[TADeviceRecordSettings stagingHELEBackstopHour](self->_settings, "stagingHELEBackstopHour"));
    if ([v19 compare:v18] == -1)
    {
      id v23 = [v15 earlierDate:v19];
    }
    else
    {
      if ([(TADeviceRecordSettings *)self->_settings surfaceHELEAfterHyperStagingIntervalBetweenBackstopAndKeyroll])
      {
        long long v20 = (void *)MEMORY[0x263EFF910];
        long long v21 = [(TADeviceRecord *)self settings];
        [v21 hyperHELEStagingInterval];
        long long v22 = objc_msgSend(v20, "dateWithTimeInterval:sinceDate:", v5);

LABEL_13:
        id v12 = [v8 laterDate:v22];

        goto LABEL_14;
      }
      id v23 = v15;
    }
    long long v22 = v23;
    goto LABEL_13;
  }
  id v12 = v15;
LABEL_14:

LABEL_15:
  return v12;
}

- (id)_determineKeepInStagingUntil:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 latestAdvertisement];
  if ([v5 getDeviceType] == 3)
  {

LABEL_5:
    uint64_t v10 = [(TADeviceRecord *)self _determineHELEKeepInStagingUntil:v4];
    goto LABEL_17;
  }
  uint64_t v6 = [v4 accessoryInfo];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [v4 accessoryInfo];
    int v9 = [v8 isHawkeyeAudioAccessory];

    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  uint64_t v11 = [(TADeviceRecord *)self _determineFirstObservationDateWithTASuspiciousDevice:v4];
  id v12 = (void *)MEMORY[0x263EFF910];
  uint64_t v13 = [(TADeviceRecord *)self settings];
  [v13 maxExpectedDurianWildInterval];
  long long v14 = objc_msgSend(v12, "dateWithTimeInterval:sinceDate:", v11);

  uint64_t v15 = [v4 immediacyType];
  long long v16 = [v4 date];
  if (v15 != 2)
  {
    uint64_t v17 = objc_msgSend(v16, "getNextDateAtHour:", -[TADeviceRecordSettings assumedKeyRollHour](self->_settings, "assumedKeyRollHour"));
    long long v18 = (void *)MEMORY[0x263EFF910];
    [(TADeviceRecordSettings *)self->_settings minimumStagingInterval];
    long long v19 = objc_msgSend(v18, "dateWithTimeInterval:sinceDate:", v11);
    long long v20 = [v19 laterDate:v16];

    long long v21 = objc_msgSend(v16, "getNextDateAtHour:", -[TADeviceRecordSettings stagingBackstopHour](self->_settings, "stagingBackstopHour"));
    if ([v21 compare:v17] == -1)
    {
      id v25 = [v20 earlierDate:v21];
    }
    else
    {
      if ([(TADeviceRecordSettings *)self->_settings surfaceAfterHyperStagingIntervalBetweenBackstopAndKeyroll])
      {
        long long v22 = (void *)MEMORY[0x263EFF910];
        id v23 = [(TADeviceRecord *)self settings];
        [v23 hyperStagingInterval];
        uint64_t v24 = objc_msgSend(v22, "dateWithTimeInterval:sinceDate:", v11);

LABEL_15:
        uint64_t v10 = [v14 laterDate:v24];

        goto LABEL_16;
      }
      id v25 = v20;
    }
    uint64_t v24 = v25;
    goto LABEL_15;
  }
  uint64_t v10 = [v14 laterDate:v16];
LABEL_16:

LABEL_17:
  return v10;
}

- (void)stageDetectionResults:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v17 = v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        deviceRecord = self->_deviceRecord;
        uint64_t v11 = objc_msgSend(v9, "address", v17);
        id v12 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v11];

        if (v12)
        {
          if ([v12 state] == 3)
          {
            uint64_t v13 = [(TADeviceRecord *)self _determineKeepInStagingUntil:v9];
            long long v14 = [[TAStagedSuspiciousDevice alloc] initWithDetection:v9 keepInStagingUntil:v13];
            [v12 stageDetection:v14];
          }
          else
          {
            long long v16 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
              [(TADeviceRecord *)&v18 stageDetectionResults:v16];
            }
          }
        }
        else
        {
          uint64_t v15 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
            [(TADeviceRecord *)&v20 stageDetectionResults:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)mergeWithAnotherDeviceRecord:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = TAStatusLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      settings = self->_settings;
      log = v5;
      id v63 = [(TADeviceRecordSettings *)settings description];
      uint64_t v57 = [v63 UTF8String];
      id v62 = [(NSDate *)self->_lastPurgeDate getDateString];
      uint64_t v55 = [v62 UTF8String];
      id v60 = [(NSDate *)self->_lastScanAttemptDate getDateString];
      uint64_t v54 = [v60 UTF8String];
      uint64_t v53 = [(NSMutableDictionary *)self->_deviceRecord count];
      uint64_t v52 = [(NSMutableDictionary *)self->_deviceUUIDToAddress count];
      v59 = [v4 settings];
      id v58 = [v59 description];
      uint64_t v51 = [v58 UTF8String];
      __int16 v56 = [v4 lastPurgeDate];
      id v7 = [v56 getDateString];
      uint64_t v8 = [v7 UTF8String];
      int v9 = [v4 lastScanAttemptDate];
      id v10 = [v9 getDateString];
      uint64_t v11 = [v10 UTF8String];
      id v12 = [v4 deviceRecord];
      uint64_t v13 = [v12 count];
      long long v14 = [v4 deviceUUIDToAddress];
      uint64_t buf = 68291586;
      __int16 v70 = 2082;
      v71 = "";
      __int16 v72 = 2082;
      uint64_t v73 = v57;
      __int16 v74 = 2082;
      uint64_t v75 = v55;
      __int16 v76 = 2082;
      uint64_t v77 = v54;
      __int16 v78 = 2050;
      uint64_t v79 = v53;
      __int16 v80 = 2050;
      uint64_t v81 = v52;
      __int16 v82 = 2082;
      uint64_t v83 = v51;
      __int16 v84 = 2082;
      uint64_t v85 = v8;
      __int16 v86 = 2082;
      uint64_t v87 = v11;
      __int16 v88 = 2050;
      uint64_t v89 = v13;
      __int16 v90 = 2050;
      uint64_t v91 = [v14 count];
      _os_log_impl(&dword_22345C000, log, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord merging with other record\", \"self.settings\":\"%{public}s\", \"self.lastPurgeDate\":\"%{public}s\", \"self.lastScanAttemptDate\":\"%{public}s\", \"self.deviceRecord.count\":%{public}lu, \"self.deviceUUIDToAddress.count\":%{public}lu, \"other.settings\":\"%{public}s\", \"other.lastPurgeDate\":\"%{public}s\", \"other.lastScanAttemptDate\":\"%{public}s\", \"other.deviceRecord.count\":%{public}lu, \"other.deviceUUIDToAddress.count\":%{public}lu}", (uint8_t *)&buf, 0x76u);
    }
    lastPurgeDate = self->_lastPurgeDate;
    long long v16 = [v4 lastPurgeDate];
    uint64_t v17 = [(NSDate *)lastPurgeDate laterDate:v16];
    uint8_t v18 = self->_lastPurgeDate;
    self->_lastPurgeDate = v17;

    lastScanAttemptDate = self->_lastScanAttemptDate;
    uint8_t v20 = [v4 lastScanAttemptDate];
    long long v21 = [(NSDate *)lastScanAttemptDate laterDate:v20];
    long long v22 = self->_lastScanAttemptDate;
    self->_lastScanAttemptDate = v21;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v23 = [v4 deviceRecord];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v65 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          v29 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v28];

          if (v29)
          {
            v30 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v28];
            v31 = [v4 deviceRecord];
            v32 = [v31 objectForKeyedSubscript:v28];

            [v30 mergeWithAnotherSingleDeviceRecord:v32];
          }
          else
          {
            v30 = [v4 deviceRecord];
            v32 = [v30 objectForKeyedSubscript:v28];
            [(NSMutableDictionary *)self->_deviceRecord setObject:v32 forKeyedSubscript:v28];
          }

          int v33 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v28];
          int v34 = [v33 uuid];

          if (v34)
          {
            deviceUUIDToAddress = self->_deviceUUIDToAddress;
            __int16 v36 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v28];
            __int16 v37 = [v36 uuid];
            [(NSMutableDictionary *)deviceUUIDToAddress setObject:v28 forKeyedSubscript:v37];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v25);
    }

    uint64_t v38 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = self->_settings;
      uint64_t v40 = v38;
      id v41 = [(TADeviceRecordSettings *)v39 description];
      uint64_t v42 = [v41 UTF8String];
      id v43 = [(NSDate *)self->_lastPurgeDate getDateString];
      uint64_t v44 = [v43 UTF8String];
      id v45 = [(NSDate *)self->_lastScanAttemptDate getDateString];
      uint64_t v46 = [v45 UTF8String];
      uint64_t v47 = [(NSMutableDictionary *)self->_deviceRecord count];
      uint64_t v48 = [(NSMutableDictionary *)self->_deviceUUIDToAddress count];
      uint64_t buf = 68290306;
      __int16 v70 = 2082;
      v71 = "";
      __int16 v72 = 2082;
      uint64_t v73 = v42;
      __int16 v74 = 2082;
      uint64_t v75 = v44;
      __int16 v76 = 2082;
      uint64_t v77 = v46;
      __int16 v78 = 2050;
      uint64_t v79 = v47;
      __int16 v80 = 2050;
      uint64_t v81 = v48;
      _os_log_impl(&dword_22345C000, v40, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TADeviceRecord new record stats\", \"self.settings\":\"%{public}s\", \"self.lastPurgeDate\":\"%{public}s\", \"self.lastScanAttemptDate\":\"%{public}s\", \"self.deviceRecord.count\":%{public}lu, \"self.deviceUUIDToAddress.count\":%{public}lu}", (uint8_t *)&buf, 0x44u);
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    [(TADeviceRecord *)v5 mergeWithAnotherDeviceRecord:v50];
  }
}

- (void)forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:(id)a3 withReason:(unint64_t)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  deviceRecord = self->_deviceRecord;
  id v7 = [v5 address];
  uint64_t v8 = [(NSMutableDictionary *)deviceRecord objectForKeyedSubscript:v7];

  if (v8)
  {
    int v9 = [v8 getStagedDetections];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      if ([v5 getDeviceType] != 3
        || [(TADeviceRecordSettings *)self->_settings shouldAlertHELEImmediatelyForImmediateTypes])
      {
        uint64_t v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = v11;
          uint64_t v13 = [v5 description];
          long long v14 = [v8 description];
          uint64_t buf = 68289539;
          __int16 v43 = 2082;
          uint64_t v44 = "";
          __int16 v45 = 2113;
          uint64_t v46 = v13;
          __int16 v47 = 2113;
          uint64_t v48 = v14;
          _os_log_impl(&dword_22345C000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord forcing staged detections to surface immediately\", \"advertisement\":\"%{private}@\", \"singleDeviceRecord\":\"%{private}@\"}", (uint8_t *)&buf, 0x26u);
        }
        id v32 = v5;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        int v34 = v8;
        id obj = [v8 getStagedDetections];
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        unint64_t v16 = a4;
        if (v15)
        {
          uint64_t v17 = v15;
          uint64_t v36 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v38 != v36) {
                objc_enumerationMutation(obj);
              }
              long long v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              uint8_t v20 = [v19 detection];
              long long v21 = [(TADeviceRecord *)self _determineFirstObservationDateWithTASuspiciousDevice:v20];

              long long v22 = [v19 detection];
              [v22 updateForceReasonWith:v16];

              long long v23 = [v19 detection];
              uint64_t v24 = [v23 latestAdvertisement];
              if ([v24 getDeviceType] == 3)
              {

LABEL_16:
                v29 = (void *)MEMORY[0x263EFF910];
                v30 = [(TADeviceRecord *)self settings];
                [v30 maxExpectedHELEWildInterval];
                goto LABEL_19;
              }
              uint64_t v25 = [v34 accessoryInfo];
              if (v25)
              {
                uint64_t v26 = (void *)v25;
                uint64_t v27 = [v34 accessoryInfo];
                int v28 = [v27 isHawkeyeAudioAccessory];

                unint64_t v16 = a4;
                if (v28) {
                  goto LABEL_16;
                }
              }
              else
              {
              }
              v29 = (void *)MEMORY[0x263EFF910];
              v30 = [(TADeviceRecord *)self settings];
              [v30 maxExpectedDurianWildInterval];
LABEL_19:
              v31 = objc_msgSend(v29, "dateWithTimeInterval:sinceDate:", v21);

              [v19 setKeepInStagingUntil:v31];
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v17);
        }

        id v5 = v32;
        uint64_t v8 = v34;
      }
    }
  }
}

- (void)_didSurfaceNotificationFor:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 setHasSurfacedNotification:1];
    uint64_t v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 68289283;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      __int16 v15 = 2113;
      unint64_t v16 = v4;
      uint64_t v6 = "{\"msg%{public}.0s\":\"#TADeviceRecord didSurfaceNotificationFor called and record updated\", \"singleDeviceR"
           "ecord\":\"%{private}@\"}";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
      uint32_t v9 = 28;
LABEL_6:
      _os_log_impl(&dword_22345C000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    uint64_t v10 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      int v11 = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      long long v14 = "";
      uint64_t v6 = "{\"msg%{public}.0s\":\"#TADeviceRecord didSurfaceNotificationFor called with non-existant record\"}";
      id v7 = v10;
      os_log_type_t v8 = OS_LOG_TYPE_FAULT;
      uint32_t v9 = 18;
      goto LABEL_6;
    }
  }
}

- (BOOL)hasStagedImmediateDetections:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 hasStagedImmediateDetections];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)getNumStagedDetections:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 numStagedDetections];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)getFirstStagedDetectionDate:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    [v3 firstStagedDetectionDate];
  }
  else {
  unint64_t v5 = [MEMORY[0x263EFF910] distantFuture];
  }

  return v5;
}

- (unint64_t)getNumOfAISFetch:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 AISFetchCount];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isAISFetchSuccessful:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 AISFetchState] == 3 || objc_msgSend(v4, "AISFetchState") == 7;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)processBackgroundDetection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [v4 latestAdvertisement];
    uint64_t v6 = [v4 date];
    [(TADeviceRecord *)self _createRecordIfNecessaryWithAdvertisement:v5 withDate:v6];

    id v7 = [v4 address];
    id v8 = [(TADeviceRecord *)self _getDeviceRecord:v7];

    [v8 processBackgroundDetection:v4];
  }
}

- (id)getLatestBeepOnMoveDate:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 latestBeepOnMoveDate];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)getDeviceType:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 getDeviceType];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)getAccessoryInfo:(id)a3
{
  unint64_t v3 = [(TADeviceRecord *)self _getDeviceRecord:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 accessoryInfo];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  [(TADeviceRecord *)self _clearStagedDetectionsForDevice:v4];
  [(NSMutableDictionary *)self->_deviceRecord removeObjectForKey:v4];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (TADeviceRecord *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      id v7 = [(TADeviceRecord *)self deviceRecord];
      id v8 = [(TADeviceRecord *)v6 deviceRecord];
      if (v7 != v8)
      {
        uint32_t v9 = [(TADeviceRecord *)self deviceRecord];
        unint64_t v3 = [(TADeviceRecord *)v6 deviceRecord];
        id v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      int v11 = [(TADeviceRecord *)self lastPurgeDate];
      int v12 = [(TADeviceRecord *)v6 lastPurgeDate];
      if (v11 != v12)
      {
        __int16 v13 = [(TADeviceRecord *)self lastPurgeDate];
        v31 = [(TADeviceRecord *)v6 lastPurgeDate];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(TADeviceRecord *)self lastScanAttemptDate];
      __int16 v15 = [(TADeviceRecord *)v6 lastScanAttemptDate];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        uint64_t v25 = v12;
        uint64_t v26 = v11;
      }
      else
      {
        unint64_t v16 = [(TADeviceRecord *)self lastScanAttemptDate];
        uint64_t v27 = [(TADeviceRecord *)v6 lastScanAttemptDate];
        int v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          long long v22 = v30;
          goto LABEL_21;
        }
        uint64_t v25 = v12;
        uint64_t v26 = v11;
      }
      uint64_t v17 = [(TADeviceRecord *)self settings];
      uint64_t v18 = [(TADeviceRecord *)v6 settings];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        long long v19 = (void *)v18;
        [(TADeviceRecord *)self settings];
        uint8_t v20 = v24 = v3;
        long long v21 = [(TADeviceRecord *)v6 settings];
        char v10 = [v20 isEqual:v21];

        unint64_t v3 = v24;
      }
      long long v22 = v30;
      int v12 = v25;
      int v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        __int16 v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)descriptionDictionary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = [(NSMutableDictionary *)self->_deviceRecord allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint32_t v9 = [(NSMutableDictionary *)self->_deviceRecord objectForKeyedSubscript:v8];
        char v10 = [v9 descriptionDictionary];
        int v11 = [v8 hexString];
        [0 setObject:v10 forKey:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  int v12 = (void *)[0 copy];
  return v12;
}

- (id)description
{
  unint64_t v3 = [(TADeviceRecord *)self descriptionDictionary];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    uint64_t v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADeviceRecord)initWithCoder:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)TADeviceRecord;
  id v5 = [(TADeviceRecord *)&v47 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint32_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"DeviceRecord"];
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (NSMutableDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastPurgeDate"];
    lastPurgeDate = v5->_lastPurgeDate;
    v5->_lastPurgeDate = (NSDate *)v12;

    long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastScanAttemptDate"];
    if (v14) {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastScanAttemptDate"];
    }
    else {
    uint64_t v15 = [MEMORY[0x263EFF910] distantPast];
    }
    lastScanAttemptDate = v5->_lastScanAttemptDate;
    v5->_lastScanAttemptDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (TADeviceRecordSettings *)v17;

    uint64_t v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    long long v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"UUIDToAddress"];
    deviceUUIDToAddress = v5->_deviceUUIDToAddress;
    v5->_deviceUUIDToAddress = (NSMutableDictionary *)v23;

    if (!v5->_deviceUUIDToAddress)
    {
      uint64_t v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v49 = 0;
        __int16 v50 = 2082;
        uint64_t v51 = "";
        _os_log_impl(&dword_22345C000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord initWithCoder doesn't have deviceUUIDToAddress key due to old version\"}", buf, 0x12u);
      }
      uint64_t v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v27 = v5->_deviceUUIDToAddress;
      v5->_deviceUUIDToAddress = v26;
    }
    id v42 = v4;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v28 = [(NSMutableDictionary *)v5->_deviceRecord allKeys];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          int v33 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          int v34 = [(NSMutableDictionary *)v5->_deviceRecord objectForKeyedSubscript:v33];
          int v35 = [v34 uuid];

          if (v35)
          {
            uint64_t v36 = v5->_deviceUUIDToAddress;
            long long v37 = [v34 uuid];
            [(NSMutableDictionary *)v36 setObject:v33 forKey:v37];
          }
          else
          {
            long long v38 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            {
              long long v39 = v38;
              long long v40 = [v33 hexString];
              *(_DWORD *)uint64_t buf = 68289283;
              int v49 = 0;
              __int16 v50 = 2082;
              uint64_t v51 = "";
              __int16 v52 = 2113;
              uint64_t v53 = v40;
              _os_log_impl(&dword_22345C000, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TADeviceRecord found a record with address but no uuid\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v30);
    }

    id v4 = v42;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceRecord = self->_deviceRecord;
  id v5 = a3;
  [v5 encodeObject:deviceRecord forKey:@"DeviceRecord"];
  [v5 encodeObject:self->_lastPurgeDate forKey:@"LastPurgeDate"];
  [v5 encodeObject:self->_lastScanAttemptDate forKey:@"LastScanAttemptDate"];
  [v5 encodeObject:self->_settings forKey:@"Settings"];
  [v5 encodeObject:self->_deviceUUIDToAddress forKey:@"UUIDToAddress"];
}

- (TAStoreRequestProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TAStoreRequestProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
}

- (NSMutableDictionary)deviceUUIDToAddress
{
  return self->_deviceUUIDToAddress;
}

- (void)setDeviceUUIDToAddress:(id)a3
{
}

- (NSDate)lastPurgeDate
{
  return self->_lastPurgeDate;
}

- (void)setLastPurgeDate:(id)a3
{
}

- (NSDate)lastScanAttemptDate
{
  return self->_lastScanAttemptDate;
}

- (void)setLastScanAttemptDate:(id)a3
{
}

- (TADeviceRecordSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_lastScanAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastPurgeDate, 0);
  objc_storeStrong((id *)&self->_deviceUUIDToAddress, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_createRecordIfNecessaryWithAdvertisement:(os_log_t)log withDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22345C000, log, OS_LOG_TYPE_FAULT, "#TADeviceRecord failed to create record in _createRecordIfNecessaryWithAddress:withDate:", v1, 2u);
}

- (void)_createRecordIfNecessaryWithAdvertisement:(void *)a1 withDate:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = [a2 address];
  id v5 = [v4 hexString];
  int v6 = 138477827;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_22345C000, v3, OS_LOG_TYPE_DEBUG, "#TADeviceRecord creating new record for %{private}@", (uint8_t *)&v6, 0xCu);
}

- (void)_setDevice:(uint64_t)a1 withInternalState:(NSObject *)a2 withDate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22345C000, a2, OS_LOG_TYPE_FAULT, "#TADeviceRecord unknown old state %lu", (uint8_t *)&v2, 0xCu);
}

- (void)_setDevice:withInternalState:withDate:.cold.2()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_22345C000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
}

- (void)_setDevice:withInternalState:withDate:.cold.3()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_22345C000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
}

- (void)_setDevice:withInternalState:withDate:.cold.4()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_22345C000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
}

- (void)_setDevice:withInternalState:withDate:.cold.5()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_22345C000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
}

- (void)_setDevice:withInternalState:withDate:.cold.6()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_22345C000, v0, v1, "#TADeviceRecord unknown new state %lu while transitioning from old state %lu", v2, v3, v4, v5, v6);
}

- (void)purgeWithClock:(void *)a3 andAppendOutgoingRequestsTo:(void *)a4 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 hexString];
  *a1 = 138412290;
  *a4 = v8;
  OUTLINED_FUNCTION_0(&dword_22345C000, v9, v10, "#TADeviceRecord expiring %@ from record");
}

- (void)updateDeviceRecordOnSessionChange:(void *)a3 WithCurrentDate:(void *)a4 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 hexString];
  *a1 = 138412290;
  *a4 = v8;
  OUTLINED_FUNCTION_0(&dword_22345C000, v9, v10, "#TADeviceRecord resetting %@ status to reprompt");
}

- (void)_clearStagedDetectionsForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_3_1(&dword_22345C000, a1, a3, "#TADeviceRecord record not found when clearing staged detections", v3);
}

- (void)stageDetectionResults:(NSObject *)a3 .cold.1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_1(&dword_22345C000, a3, (uint64_t)a3, "#TADeviceRecord no record for stageDetectionResults", a1);
}

- (void)stageDetectionResults:(NSObject *)a3 .cold.2(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_1(&dword_22345C000, a3, (uint64_t)a3, "#TADeviceRecord device not in staged state for stageDetectionResults", a1);
}

- (void)mergeWithAnotherDeviceRecord:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_3_1(&dword_22345C000, a1, a3, "#TADeviceRecord attempted to merge with nil record", v3);
}

@end