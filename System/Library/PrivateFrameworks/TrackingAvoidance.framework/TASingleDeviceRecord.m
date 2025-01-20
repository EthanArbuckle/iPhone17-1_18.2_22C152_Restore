@interface TASingleDeviceRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)_isAISFetchComplete;
- (BOOL)_isKeepInStagingUntilComplete:(id)a3;
- (BOOL)_shouldPushStagedDetection:(id)a3;
- (BOOL)hasStagedImmediateDetections;
- (BOOL)hasSurfacedNotification;
- (BOOL)isEqual:(id)a3;
- (NSData)address;
- (NSDate)creationDate;
- (NSDate)earliestObservationDate;
- (NSDate)firstBeepOnMoveDate;
- (NSDate)firstStagedDetectionDate;
- (NSDate)firstSurfacedAlertDate;
- (NSDate)keepStagedDetectionAliveUntilDate;
- (NSDate)lastAISAttemptDate;
- (NSDate)lastSurfacedAlertDate;
- (NSDate)latestBeepOnMoveDate;
- (NSDate)latestPlaySoundAttemptDate;
- (NSMutableArray)stagedDetectionResults;
- (NSMutableDictionary)backgroundDetectionCount;
- (NSMutableDictionary)firstBackgroundDetectionDate;
- (NSMutableSet)backgroundDetectionTypesInTravelSession;
- (NSUUID)uuid;
- (TAAccessoryInformation)accessoryInfo;
- (TASPAdvertisement)latestAdvertisement;
- (TASingleDeviceRecord)initWithCoder:(id)a3;
- (TASingleDeviceRecord)initWithDeviceAdvertisement:(id)a3 state:(unint64_t)a4 type:(unint64_t)a5 date:(id)a6 keepAliveInterval:(double)a7;
- (double)keepAliveInterval;
- (id)_generateTAUUID:(id)a3;
- (id)description;
- (id)descriptionDictionary;
- (id)firstDetectionDateForDetectionType:(unint64_t)a3;
- (id)getDetectionsReadyToPushAndCheckForAISFetch;
- (id)getStagedDetections;
- (id)prepareAISFetchTAOutgoingRequest:(id)a3 lastAISFetchDate:(id)a4;
- (id)preparePlaySoundTAOutgoingRequest:(id)a3 lastPlaySoundDate:(id)a4;
- (id)productName;
- (id)purgeStagedDetectionsWithClock:(id)a3;
- (unint64_t)AISFetchCount;
- (unint64_t)AISFetchState;
- (unint64_t)backgroundDetectionCountForDetectionType:(unint64_t)a3;
- (unint64_t)firstSurfacedAlertType;
- (unint64_t)getDeviceType;
- (unint64_t)numBeepOnMove;
- (unint64_t)numStagedDetections;
- (unint64_t)numSurfacedAlerts;
- (unint64_t)playSoundAttemptCount;
- (unint64_t)playSoundFailureCount;
- (unint64_t)playSoundSuccessCount;
- (unint64_t)state;
- (unint64_t)type;
- (void)_isAISFetchComplete;
- (void)_updateEarliestObservationDateWithDate:(id)a3;
- (void)clearAllStagedDetections;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithAnotherSingleDeviceRecord:(id)a3;
- (void)processAISFetchEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)processBackgroundDetection:(id)a3;
- (void)processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)processSurfacedAlert:(id)a3;
- (void)setAISFetchCount:(unint64_t)a3;
- (void)setAISFetchState:(unint64_t)a3;
- (void)setAccessoryInfo:(id)a3;
- (void)setBackgroundDetectionCount:(id)a3;
- (void)setBackgroundDetectionTypesInTravelSession:(id)a3;
- (void)setFirstBackgroundDetectionDate:(id)a3;
- (void)setHasSurfacedNotification:(BOOL)a3;
- (void)setKeepAliveInterval:(double)a3;
- (void)setStagedDetectionResults:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)stageDetection:(id)a3;
- (void)updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)updateSingleDeviceRecordOnSessionChangeWithCurrentDate:(id)a3;
@end

@implementation TASingleDeviceRecord

- (TASingleDeviceRecord)initWithDeviceAdvertisement:(id)a3 state:(unint64_t)a4 type:(unint64_t)a5 date:(id)a6 keepAliveInterval:(double)a7
{
  id v13 = a3;
  id v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)TASingleDeviceRecord;
  v15 = [(TASingleDeviceRecord *)&v51 init];
  if (!v15)
  {
LABEL_7:
    v16 = v15;
    goto LABEL_8;
  }
  v16 = 0;
  if (v13 && v14)
  {
    v17 = [v13 address];
    uint64_t v18 = [v17 copy];
    address = v15->_address;
    v15->_address = (NSData *)v18;

    uint64_t v20 = [(TASingleDeviceRecord *)v15 _generateTAUUID:v13];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v20;

    v15->_state = a4;
    v15->_type = a5;
    uint64_t v22 = [v14 copy];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v22;

    double v24 = 0.0;
    if (a7 >= 0.0) {
      double v24 = a7;
    }
    v15->_keepAliveInterval = v24;
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stagedDetectionResults = v15->_stagedDetectionResults;
    v15->_stagedDetectionResults = v25;

    objc_storeStrong((id *)&v15->_latestAdvertisement, a3);
    v27 = [v13 scanDate];
    uint64_t v28 = [v14 earlierDate:v27];
    earliestObservationDate = v15->_earliestObservationDate;
    v15->_earliestObservationDate = (NSDate *)v28;

    v15->_hasSurfacedNotification = 0;
    v15->_numStagedDetections = 0;
    uint64_t v30 = [MEMORY[0x263EFF910] distantFuture];
    firstStagedDetectionDate = v15->_firstStagedDetectionDate;
    v15->_firstStagedDetectionDate = (NSDate *)v30;

    v15->_numSurfacedAlerts = 0;
    uint64_t v32 = [MEMORY[0x263EFF910] distantFuture];
    firstSurfacedAlertDate = v15->_firstSurfacedAlertDate;
    v15->_firstSurfacedAlertDate = (NSDate *)v32;

    v15->_firstSurfacedAlertType = 0;
    uint64_t v34 = [MEMORY[0x263EFF910] distantPast];
    lastSurfacedAlertDate = v15->_lastSurfacedAlertDate;
    v15->_lastSurfacedAlertDate = (NSDate *)v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    backgroundDetectionTypesInTravelSession = v15->_backgroundDetectionTypesInTravelSession;
    v15->_backgroundDetectionTypesInTravelSession = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    backgroundDetectionCount = v15->_backgroundDetectionCount;
    v15->_backgroundDetectionCount = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    firstBackgroundDetectionDate = v15->_firstBackgroundDetectionDate;
    v15->_firstBackgroundDetectionDate = v40;

    uint64_t v42 = [MEMORY[0x263EFF910] distantPast];
    latestBeepOnMoveDate = v15->_latestBeepOnMoveDate;
    v15->_latestBeepOnMoveDate = (NSDate *)v42;

    uint64_t v44 = [MEMORY[0x263EFF910] distantFuture];
    firstBeepOnMoveDate = v15->_firstBeepOnMoveDate;
    v15->_firstBeepOnMoveDate = (NSDate *)v44;

    v15->_numBeepOnMove = 0;
    v15->_playSoundSuccessCount = 0;
    v15->_playSoundFailureCount = 0;
    uint64_t v46 = [MEMORY[0x263EFF910] distantPast];
    latestPlaySoundAttemptDate = v15->_latestPlaySoundAttemptDate;
    v15->_latestPlaySoundAttemptDate = (NSDate *)v46;

    uint64_t v48 = [MEMORY[0x263EFF910] distantPast];
    lastAISAttemptDate = v15->_lastAISAttemptDate;
    v15->_lastAISAttemptDate = (NSDate *)v48;

    v15->_AISFetchState = 0;
    v15->_AISFetchCount = 0;
    goto LABEL_7;
  }
LABEL_8:

  return v16;
}

- (void)stageDetection:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 detection];
    v7 = [v6 latestAdvertisement];
    [(TASingleDeviceRecord *)self updateAdvertisement:v7 andAppendOutgoingRequestsTo:0];

    v8 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [v5 description];
      *(_DWORD *)buf = 138477827;
      v29 = v10;
      _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord staging detection:%{private}@", buf, 0xCu);
    }
    [(NSMutableArray *)self->_stagedDetectionResults addObject:v5];
    firstStagedDetectionDate = self->_firstStagedDetectionDate;
    ++self->_numStagedDetections;
    v12 = [MEMORY[0x263EFF910] distantFuture];
    LODWORD(firstStagedDetectionDate) = [(NSDate *)firstStagedDetectionDate isEqual:v12];

    if (firstStagedDetectionDate)
    {
      id v13 = [v5 detection];
      id v14 = [v13 date];
      v15 = self->_firstStagedDetectionDate;
      self->_firstStagedDetectionDate = v14;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = objc_msgSend(v5, "detection", 0);
    v17 = [v16 locationHistory];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v23 + 1) + 8 * v21) timestamp];
          [(TASingleDeviceRecord *)self _updateEarliestObservationDateWithDate:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }
}

- (id)getStagedDetections
{
  v2 = (void *)[(NSMutableArray *)self->_stagedDetectionResults copy];
  return v2;
}

- (void)clearAllStagedDetections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_stagedDetectionResults;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = v8;
          v11 = [v9 description];
          *(_DWORD *)buf = 138477827;
          v17 = v11;
          _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord removing staged detection:%{private}@", buf, 0xCu);
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_stagedDetectionResults removeAllObjects];
}

- (NSDate)keepStagedDetectionAliveUntilDate
{
  latestAdvertisement = self->_latestAdvertisement;
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  if (latestAdvertisement)
  {
    double keepAliveInterval = self->_keepAliveInterval;
    uint64_t v6 = [(TASPAdvertisement *)latestAdvertisement scanDate];
    v7 = [v4 dateWithTimeInterval:v6 sinceDate:keepAliveInterval];
  }
  else
  {
    v7 = [MEMORY[0x263EFF910] distantFuture];
  }
  return (NSDate *)v7;
}

- (id)_generateTAUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF990];
    uint64_t v6 = [v3 address];
    v7 = [v5 dataWithData:v6];

    v8 = [v4 advertisementData];
    uint64_t v9 = [v8 length];

    if (v9 == 22)
    {
      v10 = [v4 advertisementData];
      v11 = [v4 address];
      long long v12 = objc_msgSend(v10, "subdataWithRange:", 0, 16 - objc_msgSend(v11, "length"));
      [v7 appendData:v12];
    }
    else
    {
      v10 = [v4 address];
      objc_msgSend(v7, "increaseLengthBy:", 16 - objc_msgSend(v10, "length"));
    }

    long long v13 = [MEMORY[0x263F08C38] UUID];
    if ([v7 length] == 16)
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));

      long long v13 = (void *)v14;
    }
  }
  else
  {
    long long v13 = [MEMORY[0x263F08C38] UUID];
  }

  return v13;
}

- (BOOL)_shouldPushStagedDetection:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(TASingleDeviceRecord *)self _isAISFetchComplete];
  BOOL v6 = [(TASingleDeviceRecord *)self _isKeepInStagingUntilComplete:v4];

  v7 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    uint64_t v9 = [(TASingleDeviceRecord *)self address];
    v10 = [v9 hexString];
    v12[0] = 67240707;
    v12[1] = v5;
    __int16 v13 = 1026;
    BOOL v14 = v6;
    __int16 v15 = 2113;
    v16 = v10;
    _os_log_impl(&dword_22345C000, v8, OS_LOG_TYPE_DEFAULT, "#TASingleDeviceRecord shouldPushStagedDetection _isAISFetchComplete:%{public}d _isKeepInStagingUntilComplete:%{public}d for address, %{private}@", (uint8_t *)v12, 0x18u);
  }
  return v5 && v6;
}

- (BOOL)_isKeepInStagingUntilComplete:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TASingleDeviceRecord _isKeepInStagingUntilComplete:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_6;
  }
  latestAdvertisement = self->_latestAdvertisement;
  if (!latestAdvertisement)
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  BOOL v6 = [(TASPAdvertisement *)latestAdvertisement scanDate];
  v7 = [v4 keepInStagingUntil];
  BOOL v8 = [v6 compare:v7] != -1;

LABEL_7:
  return v8;
}

- (BOOL)_isAISFetchComplete
{
  if ([(TASingleDeviceRecord *)self getDeviceType] == 1
    && ![(TASPAdvertisement *)self->_latestAdvertisement isPosh])
  {
    BOOL v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TASingleDeviceRecord *)v5 _isAISFetchComplete];
    }
    goto LABEL_11;
  }
  if ([(TASPAdvertisement *)self->_latestAdvertisement isPosh] && (_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v13 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TASingleDeviceRecord *)v13 _isAISFetchComplete];
    }
LABEL_11:
    LOBYTE(v4) = 1;
    return v4;
  }
  p_AISFetchState = (uint64_t *)&self->_AISFetchState;
  LOBYTE(v4) = 1;
  switch(self->_AISFetchState)
  {
    case 0uLL:
      LOBYTE(v4) = 0;
      uint64_t v22 = 1;
      goto LABEL_18;
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 6uLL:
      goto LABEL_6;
    case 3uLL:
    case 7uLL:
    case 8uLL:
      return v4;
    case 4uLL:
      if (self->_AISFetchCount <= 9)
      {
        LOBYTE(v4) = 0;
        uint64_t v22 = 5;
LABEL_18:
        uint64_t *p_AISFetchState = v22;
      }
      return v4;
    default:
      uint64_t v21 = TAStatusLog;
      BOOL v4 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      [(TASingleDeviceRecord *)p_AISFetchState _isAISFetchComplete];
LABEL_6:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (id)purgeStagedDetectionsWithClock:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v5 = self->_stagedDetectionResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= -[TASingleDeviceRecord _shouldPushStagedDetection:](self, "_shouldPushStagedDetection:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  uint64_t v11 = [(TASingleDeviceRecord *)self keepStagedDetectionAliveUntilDate];
  uint64_t v12 = [v11 compare:v4];

  uint64_t v13 = [(NSMutableArray *)self->_stagedDetectionResults count];
  uint64_t v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240704;
    BOOL v25 = v13 != 0;
    __int16 v26 = 1026;
    int v27 = v8 & 1;
    __int16 v28 = 1026;
    BOOL v29 = v12 == 1;
    _os_log_debug_impl(&dword_22345C000, v14, OS_LOG_TYPE_DEBUG, "#TASingleDeviceRecord purgeStagedDetetionsWithClock hasStagedDevices:%{public}d hasStagedDetectionReadyToPush:%{public}d shouldKeepStagedDetectionsAlive:%{public}d", buf, 0x14u);
  }
  BOOL v15 = v13 == 0;
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (((v15 | v8) & 1) == 0 && v12 != 1)
  {
    uint64_t v17 = [(TASingleDeviceRecord *)self getStagedDetections];
    [v16 addObjectsFromArray:v17];

    [(TASingleDeviceRecord *)self clearAllStagedDetections];
  }
  uint64_t v18 = objc_msgSend(v16, "copy", (void)v20);

  return v18;
}

- (id)getDetectionsReadyToPushAndCheckForAISFetch
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = self->_stagedDetectionResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        if (-[TASingleDeviceRecord _isKeepInStagingUntilComplete:](self, "_isKeepInStagingUntilComplete:", v10, (void)v15)&& [(TASingleDeviceRecord *)self _isAISFetchComplete])
        {
          uint64_t v11 = [v10 detection];
          [v4 addObject:v11];
        }
        else
        {
          [(NSMutableArray *)v3 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  stagedDetectionResults = self->_stagedDetectionResults;
  self->_stagedDetectionResults = v3;

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

- (void)_updateEarliestObservationDateWithDate:(id)a3
{
  id v5 = a3;
  earliestObservationDate = self->_earliestObservationDate;
  p_earliestObservationDate = &self->_earliestObservationDate;
  id v8 = v5;
  if (-[NSDate compare:](earliestObservationDate, "compare:") == NSOrderedDescending) {
    objc_storeStrong((id *)p_earliestObservationDate, a3);
  }
}

- (void)updateAdvertisement:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  v38[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  latestAdvertisement = self->_latestAdvertisement;
  if (latestAdvertisement)
  {
    uint64_t v10 = [(TASPAdvertisement *)latestAdvertisement scanDate];
    uint64_t v11 = [v7 scanDate];
    uint64_t v12 = [v10 compare:v11];

    if (v12 != -1) {
      goto LABEL_5;
    }
    uint64_t v13 = [v7 scanDate];
    id v14 = [(TASingleDeviceRecord *)self purgeStagedDetectionsWithClock:v13];
  }
  objc_storeStrong((id *)&self->_latestAdvertisement, a3);
LABEL_5:
  if ([v7 beepOnMoveHigh])
  {
    long long v15 = [v7 scanDate];
    [v15 timeIntervalSinceDate:self->_latestBeepOnMoveDate];
    double v17 = v16;

    latestBeepOnMoveDate = self->_latestBeepOnMoveDate;
    uint64_t v19 = [MEMORY[0x263EFF910] distantPast];
    char v20 = [(NSDate *)latestBeepOnMoveDate isEqual:v19];

    if (v17 > 3600.0)
    {
      ++self->_numBeepOnMove;
      if ((v20 & 1) == 0)
      {
        v37[0] = @"timeSinceBOM";
        long long v21 = [NSNumber numberWithDouble:v17];
        v37[1] = @"productInfo";
        v38[0] = v21;
        long long v22 = [(TASingleDeviceRecord *)self productName];
        v38[1] = v22;
        long long v23 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

        long long v24 = [TAOutgoingRequests alloc];
        BOOL v25 = [v7 scanDate];
        __int16 v26 = [(TAOutgoingRequests *)v24 initWithRequestKey:@"BOMObservationMetrics" additionalInformation:v23 date:v25];

        [v8 addObject:v26];
      }
    }
    int v27 = self->_latestBeepOnMoveDate;
    __int16 v28 = [v7 scanDate];
    uint64_t v29 = [(NSDate *)v27 compare:v28];

    if (v29 == -1)
    {
      uint64_t v30 = [v7 scanDate];
      uint64_t v31 = self->_latestBeepOnMoveDate;
      self->_latestBeepOnMoveDate = v30;
    }
    firstBeepOnMoveDate = self->_firstBeepOnMoveDate;
    v33 = [MEMORY[0x263EFF910] distantFuture];
    LODWORD(firstBeepOnMoveDate) = [(NSDate *)firstBeepOnMoveDate isEqual:v33];

    if (firstBeepOnMoveDate)
    {
      uint64_t v34 = [v7 scanDate];
      v35 = self->_firstBeepOnMoveDate;
      self->_firstBeepOnMoveDate = v34;
    }
  }
  v36 = [v7 scanDate];
  [(TASingleDeviceRecord *)self _updateEarliestObservationDateWithDate:v36];
}

- (void)mergeWithAnotherSingleDeviceRecord:(id)a3
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v4 = a3;
  address = self->_address;
  uint64_t v6 = [v4 address];

  if (address != v6) {
    goto LABEL_53;
  }
  id v7 = [v4 uuid];
  uuid = self->_uuid;
  self->_uuid = v7;

  self->_AISFetchState = [v4 AISFetchState];
  self->_AISFetchCount += [v4 AISFetchCount];
  uint64_t v9 = [v4 accessoryInfo];
  accessoryInfo = self->_accessoryInfo;
  self->_accessoryInfo = v9;

  self->_state = [v4 state];
  self->_type = [v4 type];
  creationDate = self->_creationDate;
  uint64_t v12 = [v4 creationDate];
  uint64_t v13 = [(NSDate *)creationDate earlierDate:v12];
  id v14 = self->_creationDate;
  self->_creationDate = v13;

  stagedDetectionResults = self->_stagedDetectionResults;
  double v16 = [v4 stagedDetectionResults];
  [(NSMutableArray *)stagedDetectionResults addObjectsFromArray:v16];

  double v17 = [v4 latestAdvertisement];
  if (v17)
  {
    latestAdvertisement = self->_latestAdvertisement;

    if (latestAdvertisement)
    {
      uint64_t v19 = [(TASPAdvertisement *)self->_latestAdvertisement scanDate];
      char v20 = [v4 latestAdvertisement];
      long long v21 = [v20 scanDate];
      uint64_t v22 = [v19 compare:v21];

      if (v22 != -1)
      {
        long long v23 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
        {
          long long v24 = self->_address;
          BOOL v25 = v23;
          id v26 = [(NSData *)v24 hexString];
          uint64_t buf = 68289283;
          __int16 v118 = 2082;
          v119 = "";
          __int16 v120 = 2081;
          uint64_t v121 = [v26 UTF8String];
          int v27 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord retaining latest advertisement as it is more recent\", \"ad"
                "dress\":\"%{private}s\"}";
LABEL_11:
          _os_log_impl(&dword_22345C000, v25, OS_LOG_TYPE_DEBUG, v27, (uint8_t *)&buf, 0x1Cu);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v32 = [v4 latestAdvertisement];
      v33 = self->_latestAdvertisement;
      self->_latestAdvertisement = v32;

      goto LABEL_13;
    }
  }
  __int16 v28 = [v4 latestAdvertisement];
  if (v28)
  {
    uint64_t v29 = self->_latestAdvertisement;

    if (!v29) {
      goto LABEL_12;
    }
  }
  uint64_t v30 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = self->_address;
    BOOL v25 = v30;
    id v26 = [(NSData *)v31 hexString];
    uint64_t buf = 68289283;
    __int16 v118 = 2082;
    v119 = "";
    __int16 v120 = 2081;
    uint64_t v121 = [v26 UTF8String];
    int v27 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord other record has no latest advertisement\", \"address\":\"%{private}s\"}";
    goto LABEL_11;
  }
LABEL_13:
  backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
  v35 = [v4 backgroundDetectionTypesInTravelSession];
  [(NSMutableSet *)backgroundDetectionTypesInTravelSession unionSet:v35];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obuint64_t j = [v4 backgroundDetectionCount];
  uint64_t v36 = [obj countByEnumeratingWithState:&v111 objects:v116 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v112 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v111 + 1) + 8 * i);
        v41 = [v4 backgroundDetectionCount];
        uint64_t v42 = [v41 objectForKeyedSubscript:v40];

        v43 = [(NSMutableDictionary *)self->_backgroundDetectionCount objectForKeyedSubscript:v40];

        if (v43)
        {
          uint64_t v44 = NSNumber;
          v45 = [(NSMutableDictionary *)self->_backgroundDetectionCount objectForKeyedSubscript:v40];
          id v46 = v4;
          uint64_t v47 = [v45 unsignedIntegerValue];
          uint64_t v48 = [v42 unsignedIntegerValue] + v47;
          id v4 = v46;
          v49 = [v44 numberWithUnsignedInteger:v48];

          [(NSMutableDictionary *)self->_backgroundDetectionCount setObject:v49 forKey:v40];
        }
        else
        {
          [(NSMutableDictionary *)self->_backgroundDetectionCount setObject:v42 forKey:v40];
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v111 objects:v116 count:16];
    }
    while (v37);
  }

  v50 = [v4 latestBeepOnMoveDate];
  if (v50 && (objc_super v51 = self->_latestBeepOnMoveDate, v50, v51))
  {
    latestBeepOnMoveDate = self->_latestBeepOnMoveDate;
    v53 = [v4 latestBeepOnMoveDate];
    uint64_t v54 = [(NSDate *)latestBeepOnMoveDate compare:v53];

    if (v54 == -1)
    {
      v55 = [v4 latestBeepOnMoveDate];
      v56 = self->_latestBeepOnMoveDate;
      self->_latestBeepOnMoveDate = v55;
    }
  }
  else
  {
    v57 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v58 = self->_address;
      v59 = v57;
      id v60 = [(NSData *)v58 hexString];
      uint64_t v61 = [v60 UTF8String];
      uint64_t buf = 68289283;
      __int16 v118 = 2082;
      v119 = "";
      __int16 v120 = 2081;
      uint64_t v121 = v61;
      _os_log_impl(&dword_22345C000, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord merging nil latestBeepOnMoveDate\", \"address\":\"%{private}s\"}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  v62 = [v4 firstBeepOnMoveDate];
  if (v62)
  {
    firstBeepOnMoveDate = self->_firstBeepOnMoveDate;

    if (firstBeepOnMoveDate)
    {
      v64 = self->_firstBeepOnMoveDate;
      v65 = [v4 firstBeepOnMoveDate];
      uint64_t v66 = [(NSDate *)v64 compare:v65];

      if (v66 == 1)
      {
        v67 = [v4 firstBeepOnMoveDate];
        v68 = self->_firstBeepOnMoveDate;
        self->_firstBeepOnMoveDate = v67;
      }
    }
  }
  self->_numBeepOnMove += [v4 numBeepOnMove];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v69 = [v4 firstBackgroundDetectionDate];
  uint64_t v70 = [v69 countByEnumeratingWithState:&v107 objects:v115 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v108;
    do
    {
      for (uint64_t j = 0; j != v71; ++j)
      {
        if (*(void *)v108 != v72) {
          objc_enumerationMutation(v69);
        }
        uint64_t v74 = *(void *)(*((void *)&v107 + 1) + 8 * j);
        v75 = [v4 firstBackgroundDetectionDate];
        v76 = [v75 objectForKeyedSubscript:v74];

        v77 = [(NSMutableDictionary *)self->_firstBackgroundDetectionDate objectForKeyedSubscript:v74];
        v78 = v77;
        if (!v77 || [v77 compare:v76] == 1) {
          [(NSMutableDictionary *)self->_firstBackgroundDetectionDate setObject:v76 forKey:v74];
        }
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v107 objects:v115 count:16];
    }
    while (v71);
  }

  firstStagedDetectionDate = self->_firstStagedDetectionDate;
  v80 = [v4 firstStagedDetectionDate];
  uint64_t v81 = [(NSDate *)firstStagedDetectionDate compare:v80];

  if (v81 == 1)
  {
    v82 = [v4 firstStagedDetectionDate];
    v83 = self->_firstStagedDetectionDate;
    self->_firstStagedDetectionDate = v82;
  }
  self->_numStagedDetections += [v4 numStagedDetections];
  firstSurfacedAlertDate = self->_firstSurfacedAlertDate;
  v85 = [v4 firstSurfacedAlertDate];
  uint64_t v86 = [(NSDate *)firstSurfacedAlertDate compare:v85];

  if (v86 == 1)
  {
    v87 = [v4 firstSurfacedAlertDate];
    v88 = self->_firstSurfacedAlertDate;
    self->_firstSurfacedAlertDate = v87;

    self->_firstSurfacedAlertType = [v4 firstSurfacedAlertType];
  }
  lastSurfacedAlertDate = self->_lastSurfacedAlertDate;
  v90 = [v4 lastSurfacedAlertDate];
  uint64_t v91 = [(NSDate *)lastSurfacedAlertDate compare:v90];

  if (v91 == -1)
  {
    v92 = [v4 lastSurfacedAlertDate];
    v93 = self->_lastSurfacedAlertDate;
    self->_lastSurfacedAlertDate = v92;
  }
  self->_numSurfacedAlerts += [v4 numSurfacedAlerts];
  v94 = [v4 earliestObservationDate];
  [(TASingleDeviceRecord *)self _updateEarliestObservationDateWithDate:v94];

  self->_playSoundSuccessCount += [v4 playSoundSuccessCount];
  uint64_t v95 = [v4 playSoundFailureCount];
  latestPlaySoundAttemptDate = self->_latestPlaySoundAttemptDate;
  self->_playSoundFailureCount += v95;
  v97 = [v4 latestPlaySoundAttemptDate];
  uint64_t v98 = [(NSDate *)latestPlaySoundAttemptDate compare:v97];

  if (v98 == -1)
  {
    v99 = [v4 latestPlaySoundAttemptDate];
    v100 = self->_latestPlaySoundAttemptDate;
    self->_latestPlaySoundAttemptDate = v99;
  }
  lastAISAttemptDate = self->_lastAISAttemptDate;
  v102 = [v4 lastAISAttemptDate];
  uint64_t v103 = [(NSDate *)lastAISAttemptDate compare:v102];

  if (v103 == -1)
  {
    v104 = [v4 lastAISAttemptDate];
    v105 = self->_lastAISAttemptDate;
    self->_lastAISAttemptDate = v104;
  }
LABEL_53:
}

- (BOOL)hasStagedImmediateDetections
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TASingleDeviceRecord *)self stagedDetectionResults];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) detection];
        uint64_t v7 = [v6 immediacyType];

        if (v7 == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateSingleDeviceRecordOnSessionChangeWithCurrentDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2113;
    long long v10 = backgroundDetectionTypesInTravelSession;
    _os_log_impl(&dword_22345C000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord session changed\", \"prevSessionTypes\":\"%{private}@\"}", (uint8_t *)v6, 0x1Cu);
  }
  [(NSMutableSet *)self->_backgroundDetectionTypesInTravelSession removeAllObjects];
}

- (unint64_t)getDeviceType
{
  return [(TASPAdvertisement *)self->_latestAdvertisement getDeviceType];
}

- (id)productName
{
  uint64_t v3 = [(TASingleDeviceRecord *)self accessoryInfo];

  if (v3)
  {
    uint64_t v4 = [(TASingleDeviceRecord *)self accessoryInfo];
    id v5 = [(TASPAdvertisement *)self->_latestAdvertisement getLatestAdvTypeToString:0];
    uint64_t v6 = [v4 accessoryTypeNameWithAdvTypeString:v5];
  }
  else
  {
    latestAdvertisement = self->_latestAdvertisement;
    uint64_t v4 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:[(TASPAdvertisement *)latestAdvertisement getDeviceType]];
    uint64_t v6 = [(TASPAdvertisement *)latestAdvertisement getLatestAdvTypeToString:v4];
  }

  return v6;
}

- (void)processSurfacedAlert:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  firstSurfacedAlertDate = self->_firstSurfacedAlertDate;
  uint64_t v6 = [MEMORY[0x263EFF910] distantFuture];
  LODWORD(firstSurfacedAlertDate) = [(NSDate *)firstSurfacedAlertDate isEqual:v6];

  if (firstSurfacedAlertDate)
  {
    __int16 v7 = [v4 date];
    id v8 = self->_firstSurfacedAlertDate;
    self->_firstSurfacedAlertDate = v7;

    self->_firstSurfacedAlertType = [v4 detectionType];
  }
  lastSurfacedAlertDate = self->_lastSurfacedAlertDate;
  long long v10 = [v4 date];
  uint64_t v11 = [(NSDate *)lastSurfacedAlertDate compare:v10];

  if (v11 == -1)
  {
    long long v12 = [v4 date];
    uint64_t v13 = self->_lastSurfacedAlertDate;
    self->_lastSurfacedAlertDate = v12;
  }
  ++self->_numSurfacedAlerts;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = objc_msgSend(v4, "locationHistory", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v20 + 1) + 8 * v18) timestamp];
        [(TASingleDeviceRecord *)self _updateEarliestObservationDateWithDate:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (void)processBackgroundDetection:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    backgroundDetectionTypesInTravelSession = self->_backgroundDetectionTypesInTravelSession;
    __int16 v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "detectionType"));
    if (([(NSMutableSet *)backgroundDetectionTypesInTravelSession containsObject:v7] & 1) == 0
      && [(TASingleDeviceRecord *)self state] != 2)
    {
      unint64_t v8 = [(TASingleDeviceRecord *)self state];

      if (v8 == 1) {
        goto LABEL_11;
      }
      __int16 v9 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = 68289283;
        *(_WORD *)uint64_t v31 = 2082;
        *(void *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(void *)&v31[12] = v5;
        _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord adding background detection to record\", \"detection\":\"%{private}@\"}", (uint8_t *)&v30, 0x1Cu);
      }
      long long v10 = self->_backgroundDetectionTypesInTravelSession;
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      [(NSMutableSet *)v10 addObject:v11];

      backgroundDetectionCount = self->_backgroundDetectionCount;
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      uint64_t v14 = [(NSMutableDictionary *)backgroundDetectionCount objectForKeyedSubscript:v13];

      uint64_t v15 = self->_backgroundDetectionCount;
      uint64_t v16 = NSNumber;
      __int16 v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
      if (v14)
      {
        uint64_t v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v7];
        uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + 1);
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
        [(NSMutableDictionary *)v15 setObject:v18 forKey:v19];
      }
      else
      {
        [(NSMutableDictionary *)v15 setObject:&unk_26D684308 forKey:v7];
      }
    }

LABEL_11:
    firstBackgroundDetectionDate = self->_firstBackgroundDetectionDate;
    long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
    long long v22 = [(NSMutableDictionary *)firstBackgroundDetectionDate objectForKeyedSubscript:v21];

    if (v22)
    {
      long long v23 = [v5 date];
      uint64_t v24 = [v22 compare:v23];

      if (v24 != 1)
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = 68289283;
        *(_WORD *)uint64_t v31 = 2082;
        *(void *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(void *)&v31[12] = v5;
        id v26 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord updating first background detection date\", \"detection\":\"%{private}@\"}";
LABEL_17:
        _os_log_impl(&dword_22345C000, v25, OS_LOG_TYPE_DEBUG, v26, (uint8_t *)&v30, 0x1Cu);
      }
    }
    else
    {
      uint64_t v25 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = 68289283;
        *(_WORD *)uint64_t v31 = 2082;
        *(void *)&v31[2] = "";
        *(_WORD *)&v31[10] = 2113;
        *(void *)&v31[12] = v5;
        id v26 = "{\"msg%{public}.0s\":\"#TASingleDeviceRecord setting first background detection date\", \"detection\":\"%{private}@\"}";
        goto LABEL_17;
      }
    }
    int v27 = self->_firstBackgroundDetectionDate;
    __int16 v28 = objc_msgSend(v5, "date", v30, *(_OWORD *)v31, *(void *)&v31[16]);
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "detectionType"));
    [(NSMutableDictionary *)v27 setObject:v28 forKey:v29];

    goto LABEL_19;
  }
LABEL_20:
}

- (unint64_t)backgroundDetectionCountForDetectionType:(unint64_t)a3
{
  backgroundDetectionCount = self->_backgroundDetectionCount;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  __int16 v7 = [(NSMutableDictionary *)backgroundDetectionCount objectForKeyedSubscript:v6];

  if (!v7) {
    return 0;
  }
  unint64_t v8 = self->_backgroundDetectionCount;
  __int16 v9 = [NSNumber numberWithUnsignedInteger:a3];
  long long v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  unint64_t v11 = [v10 unsignedIntegerValue];

  return v11;
}

- (id)firstDetectionDateForDetectionType:(unint64_t)a3
{
  firstBackgroundDetectionDate = self->_firstBackgroundDetectionDate;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)firstBackgroundDetectionDate objectForKeyedSubscript:v4];

  return v5;
}

- (id)preparePlaySoundTAOutgoingRequest:(id)a3 lastPlaySoundDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:&unk_26D684320 forKey:@"firstSeenMinutes"];
  [v8 setObject:&unk_26D684320 forKey:@"firstAlertMinutes"];
  [v8 setObject:&unk_26D684320 forKey:@"lastAlertMinutes"];
  [v8 setObject:&unk_26D684320 forKey:@"lastAttemptMinutes"];
  [v8 setObject:&unk_26D684320 forKey:@"soundMinutes"];
  [v8 setObject:&stru_26D677430 forKey:@"productInfo"];
  [v8 setObject:&unk_26D684338 forKey:@"soundCount"];
  [v8 setObject:MEMORY[0x263EFFA80] forKey:@"success"];
  __int16 v9 = NSNumber;
  long long v10 = [(TASingleDeviceRecord *)self earliestObservationDate];
  unint64_t v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "getMinutesSinceStartOfDay"));
  [v8 setObject:v11 forKey:@"firstSeenMinutes"];

  uint64_t v12 = [(TASingleDeviceRecord *)self firstSurfacedAlertDate];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(TASingleDeviceRecord *)self firstSurfacedAlertDate];
    uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
    char v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = NSNumber;
      uint64_t v18 = [(TASingleDeviceRecord *)self firstSurfacedAlertDate];
      uint64_t v19 = [(TASingleDeviceRecord *)self earliestObservationDate];
      [v18 timeIntervalSinceDate:v19];
      long long v21 = [v17 numberWithInt:((int)v20 / 60)];
      [v8 setObject:v21 forKey:@"firstAlertMinutes"];
    }
  }
  uint64_t v22 = [(TASingleDeviceRecord *)self lastSurfacedAlertDate];
  if (v22)
  {
    long long v23 = (void *)v22;
    uint64_t v24 = [(TASingleDeviceRecord *)self lastSurfacedAlertDate];
    uint64_t v25 = [MEMORY[0x263EFF910] distantPast];
    char v26 = [v24 isEqual:v25];

    if ((v26 & 1) == 0)
    {
      int v27 = NSNumber;
      __int16 v28 = [(TASingleDeviceRecord *)self lastSurfacedAlertDate];
      uint64_t v29 = [(TASingleDeviceRecord *)self earliestObservationDate];
      [v28 timeIntervalSinceDate:v29];
      uint64_t v31 = [v27 numberWithInt:((int)v30 / 60)];
      [v8 setObject:v31 forKey:@"lastAlertMinutes"];
    }
  }
  if (v7)
  {
    uint64_t v32 = [MEMORY[0x263EFF910] distantPast];
    if (([v7 isEqual:v32] & 1) == 0)
    {
      v33 = [MEMORY[0x263EFF910] distantFuture];
      char v34 = [v7 isEqual:v33];

      if (v34) {
        goto LABEL_12;
      }
      v35 = NSNumber;
      uint64_t v32 = [(TASingleDeviceRecord *)self earliestObservationDate];
      [v7 timeIntervalSinceDate:v32];
      uint64_t v37 = [v35 numberWithInt:((int)v36 / 60)];
      [v8 setObject:v37 forKey:@"lastAttemptMinutes"];
    }
  }
LABEL_12:
  uint64_t v38 = [v6 date];
  if (!v38) {
    goto LABEL_17;
  }
  v39 = (void *)v38;
  uint64_t v40 = [v6 date];
  v41 = [MEMORY[0x263EFF910] distantPast];
  if (([v40 isEqual:v41] & 1) == 0)
  {
    uint64_t v42 = [v6 date];
    v43 = [MEMORY[0x263EFF910] distantFuture];
    char v44 = [v42 isEqual:v43];

    if (v44) {
      goto LABEL_17;
    }
    v45 = NSNumber;
    v39 = [v6 date];
    uint64_t v40 = [(TASingleDeviceRecord *)self earliestObservationDate];
    [v39 timeIntervalSinceDate:v40];
    v41 = [v45 numberWithInt:((int)v46 / 60)];
    [v8 setObject:v41 forKey:@"soundMinutes"];
  }

LABEL_17:
  uint64_t v47 = [(TASingleDeviceRecord *)self productName];
  [v8 setObject:v47 forKey:@"productInfo"];

  uint64_t v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TASingleDeviceRecord playSoundAttemptCount](self, "playSoundAttemptCount"));
  [v8 setObject:v48 forKey:@"soundCount"];

  BOOL v49 = [v6 successType] == 1;
  v50 = [NSNumber numberWithBool:v49];
  [v8 setObject:v50 forKey:@"success"];

  objc_super v51 = [TAOutgoingRequests alloc];
  v52 = [v6 date];
  v53 = [(TAOutgoingRequests *)v51 initWithRequestKey:@"PlaySoundWithDetectionMetrics" additionalInformation:v8 date:v52];

  return v53;
}

- (void)processPlaySoundSuccess:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  id v8 = [v6 address];

  if (!v8) {
    goto LABEL_14;
  }
  __int16 v9 = [v6 address];
  long long v10 = [(TASingleDeviceRecord *)self address];
  char v11 = [v9 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [v6 successType];
    if (v12 == 1)
    {
      uint64_t v13 = 160;
    }
    else
    {
      if (v12)
      {
LABEL_11:
        uint64_t v15 = self->_latestPlaySoundAttemptDate;
        latestPlaySoundAttemptDate = self->_latestPlaySoundAttemptDate;
        uint64_t v17 = [v6 date];
        uint64_t v18 = [(NSDate *)latestPlaySoundAttemptDate compare:v17];

        if (v18 == -1)
        {
          uint64_t v19 = [v6 date];
          double v20 = self->_latestPlaySoundAttemptDate;
          self->_latestPlaySoundAttemptDate = v19;
        }
        long long v21 = [(TASingleDeviceRecord *)self preparePlaySoundTAOutgoingRequest:v6 lastPlaySoundDate:v15];
        [v7 addObject:v21];

        goto LABEL_14;
      }
      uint64_t v13 = 168;
    }
    ++*(Class *)((char *)&self->super.isa + v13);
    goto LABEL_11;
  }
  uint64_t v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    v22[0] = 68289283;
    v22[1] = 0;
    __int16 v23 = 2082;
    uint64_t v24 = "";
    __int16 v25 = 2113;
    id v26 = v6;
    _os_log_impl(&dword_22345C000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord mismatched address\", \"playsoundSuccess\":\"%{private}@\"}", (uint8_t *)v22, 0x1Cu);
  }
LABEL_14:
}

- (id)prepareAISFetchTAOutgoingRequest:(id)a3 lastAISFetchDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v9 = [v6 successType] == 1;
  long long v10 = [NSNumber numberWithUnsignedInteger:v9];
  [v8 setObject:v10 forKey:@"success"];

  char v11 = [(TASingleDeviceRecord *)self productName];
  [v8 setObject:v11 forKey:@"deviceType"];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_AISFetchCount];
  [v8 setObject:v12 forKey:@"fetchCount"];

  uint64_t v13 = NSNumber;
  uint64_t v14 = [v6 date];
  uint64_t v15 = [(TASingleDeviceRecord *)self earliestObservationDate];
  [v14 timeIntervalSinceDate:v15];
  char v16 = objc_msgSend(v13, "numberWithDouble:");
  [v8 setObject:v16 forKey:@"firstSeenSeconds"];

  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v17 = [MEMORY[0x263EFF910] distantPast];
  if ([v7 isEqual:v17])
  {

LABEL_5:
    [v8 setObject:&unk_26D684320 forKey:@"lastAttemptMinutes"];
    goto LABEL_6;
  }
  uint64_t v18 = [MEMORY[0x263EFF910] distantFuture];
  char v19 = [v7 isEqual:v18];

  if (v19) {
    goto LABEL_5;
  }
  uint64_t v24 = NSNumber;
  __int16 v25 = [v6 date];
  [v25 timeIntervalSinceDate:v7];
  uint64_t v27 = [v24 numberWithInt:((int)v26 / 60)];
  [v8 setObject:v27 forKey:@"lastAttemptMinutes"];

LABEL_6:
  double v20 = [TAOutgoingRequests alloc];
  long long v21 = [v6 date];
  uint64_t v22 = [(TAOutgoingRequests *)v20 initWithRequestKey:@"AISFetchMetrics" additionalInformation:v8 date:v21];

  return v22;
}

- (void)processAISFetchEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_19;
  }
  id v8 = [v6 uuid];

  if (!v8) {
    goto LABEL_19;
  }
  BOOL v9 = [v6 uuid];
  long long v10 = [(TASingleDeviceRecord *)self uuid];
  char v11 = [v9 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [v6 info];
    [(TASingleDeviceRecord *)self setAccessoryInfo:v12];

    uint64_t v13 = [v6 successType];
    unint64_t AISFetchState = self->_AISFetchState;
    if (v13 == 1)
    {
      if (AISFetchState == 2)
      {
        unint64_t v15 = 3;
        goto LABEL_15;
      }
      if (AISFetchState == 6)
      {
        unint64_t v15 = 7;
LABEL_15:
        self->_unint64_t AISFetchState = v15;
      }
    }
    else
    {
      if (AISFetchState == 2)
      {
        unint64_t v15 = 4;
        goto LABEL_15;
      }
      if (AISFetchState == 6)
      {
        unint64_t v15 = 8;
        goto LABEL_15;
      }
    }
    char v19 = self->_lastAISAttemptDate;
    lastAISAttemptDate = self->_lastAISAttemptDate;
    long long v21 = [v6 date];
    uint64_t v22 = [(NSDate *)lastAISAttemptDate compare:v21];

    if (v22 == -1)
    {
      __int16 v23 = [v6 date];
      uint64_t v24 = self->_lastAISAttemptDate;
      self->_lastAISAttemptDate = v23;
    }
    __int16 v25 = [(TASingleDeviceRecord *)self prepareAISFetchTAOutgoingRequest:v6 lastAISFetchDate:v19];
    [v7 addObject:v25];

    goto LABEL_19;
  }
  char v16 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = v16;
    uint64_t v18 = [v6 description];
    v26[0] = 68289283;
    v26[1] = 0;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2113;
    double v30 = v18;
    _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TASingleDeviceRecord mismatched uuid\", \"AISFetchEvent\":\"%{private}@\"}", (uint8_t *)v26, 0x1Cu);
  }
LABEL_19:
}

- (unint64_t)playSoundAttemptCount
{
  unint64_t v3 = [(TASingleDeviceRecord *)self playSoundSuccessCount];
  return [(TASingleDeviceRecord *)self playSoundFailureCount] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (TASingleDeviceRecord *)a3;
  if (self == v5)
  {
    char v14 = 1;
    goto LABEL_72;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = 0;
    goto LABEL_72;
  }
  id v6 = v5;
  id v7 = [(TASingleDeviceRecord *)self address];
  id v8 = [(TASingleDeviceRecord *)v6 address];
  if (v7 == v8
    || ([(TASingleDeviceRecord *)self address],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(TASingleDeviceRecord *)v6 address],
        v97 = objc_claimAutoreleasedReturnValue(),
        uint64_t v98 = (void *)v9,
        objc_msgSend((id)v9, "isEqual:")))
  {
    uint64_t v15 = [(TASingleDeviceRecord *)self uuid];
    uint64_t v95 = [(TASingleDeviceRecord *)v6 uuid];
    v96 = (void *)v15;
    BOOL v16 = v15 != (void)v95;
    if ((void *)v15 == v95
      || ([(TASingleDeviceRecord *)self uuid],
          unint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [(TASingleDeviceRecord *)v6 uuid],
          v93 = objc_claimAutoreleasedReturnValue(),
          v94 = (void *)v9,
          objc_msgSend((id)v9, "isEqual:")))
    {
      unint64_t v9 = [(TASingleDeviceRecord *)self state];
      HIDWORD(v100[6]) = v16;
      if (v9 == [(TASingleDeviceRecord *)v6 state]
        && (unint64_t v9 = [(TASingleDeviceRecord *)self type], v9 == [(TASingleDeviceRecord *)v6 type]))
      {
        unint64_t v9 = [(TASingleDeviceRecord *)self creationDate];
        uint64_t v91 = [(TASingleDeviceRecord *)v6 creationDate];
        v92 = (void *)v9;
        uint64_t v3 = v9 != (void)v91;
        if ((void *)v9 == v91
          || ([(TASingleDeviceRecord *)self creationDate],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              [(TASingleDeviceRecord *)v6 creationDate],
              v89 = objc_claimAutoreleasedReturnValue(),
              v90 = v17,
              objc_msgSend(v17, "isEqual:")))
        {
          [(TASingleDeviceRecord *)self keepAliveInterval];
          double v25 = v24;
          [(TASingleDeviceRecord *)v6 keepAliveInterval];
          LODWORD(v100[6]) = v9 != (void)v91;
          if (v25 == v26)
          {
            uint64_t v27 = [(TASingleDeviceRecord *)self stagedDetectionResults];
            v87 = [(TASingleDeviceRecord *)v6 stagedDetectionResults];
            v88 = (void *)v27;
            BOOL v28 = v27 == (void)v87;
            BOOL v29 = v27 != (void)v87;
            if (v28
              || ([(TASingleDeviceRecord *)self stagedDetectionResults],
                  double v30 = objc_claimAutoreleasedReturnValue(),
                  [(TASingleDeviceRecord *)v6 stagedDetectionResults],
                  v83 = objc_claimAutoreleasedReturnValue(),
                  v84 = v30,
                  objc_msgSend(v30, "isEqual:")))
            {
              uint64_t v31 = [(TASingleDeviceRecord *)self latestAdvertisement];
              v85 = [(TASingleDeviceRecord *)v6 latestAdvertisement];
              uint64_t v86 = (void *)v31;
              HIDWORD(v101[2]) = v31 != (void)v85;
              HIDWORD(v100[5]) = v29;
              if ((void *)v31 == v85
                || ([(TASingleDeviceRecord *)self latestAdvertisement],
                    uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                    [(TASingleDeviceRecord *)v6 latestAdvertisement],
                    v79 = objc_claimAutoreleasedReturnValue(),
                    v80 = v32,
                    objc_msgSend(v32, "isEqual:")))
              {
                uint64_t v33 = [(TASingleDeviceRecord *)self earliestObservationDate];
                uint64_t v81 = [(TASingleDeviceRecord *)v6 earliestObservationDate];
                LODWORD(v101[2]) = v33 != (void)v81;
                v82 = (void *)v33;
                if ((void *)v33 == v81
                  || ([(TASingleDeviceRecord *)self earliestObservationDate],
                      char v34 = objc_claimAutoreleasedReturnValue(),
                      [(TASingleDeviceRecord *)v6 earliestObservationDate],
                      v77 = objc_claimAutoreleasedReturnValue(),
                      v78 = v34,
                      objc_msgSend(v34, "isEqual:")))
                {
                  unint64_t v9 = [(TASingleDeviceRecord *)self hasSurfacedNotification];
                  if (v9 == [(TASingleDeviceRecord *)v6 hasSurfacedNotification])
                  {
                    uint64_t v35 = [(TASingleDeviceRecord *)self backgroundDetectionCount];
                    v75 = [(TASingleDeviceRecord *)v6 backgroundDetectionCount];
                    v76 = (void *)v35;
                    if ((void *)v35 == v75
                      || ([(TASingleDeviceRecord *)self backgroundDetectionCount],
                          unint64_t v9 = objc_claimAutoreleasedReturnValue(),
                          [(TASingleDeviceRecord *)v6 backgroundDetectionCount],
                          uint64_t v71 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v72 = (void *)v9,
                          objc_msgSend((id)v9, "isEqual:")))
                    {
                      unint64_t v9 = [(TASingleDeviceRecord *)self firstBackgroundDetectionDate];
                      v73 = [(TASingleDeviceRecord *)v6 firstBackgroundDetectionDate];
                      HIDWORD(v101[1]) = v9 != (void)v73;
                      LODWORD(v100[5]) = v35 != (void)v75;
                      uint64_t v74 = (void *)v9;
                      if ((void *)v9 == v73
                        || ([(TASingleDeviceRecord *)self firstBackgroundDetectionDate],
                            double v36 = objc_claimAutoreleasedReturnValue(),
                            [(TASingleDeviceRecord *)v6 firstBackgroundDetectionDate],
                            v67 = objc_claimAutoreleasedReturnValue(),
                            v68 = v36,
                            objc_msgSend(v36, "isEqual:")))
                      {
                        uint64_t v37 = [(TASingleDeviceRecord *)self backgroundDetectionTypesInTravelSession];
                        v69 = [(TASingleDeviceRecord *)v6 backgroundDetectionTypesInTravelSession];
                        uint64_t v70 = (void *)v37;
                        LODWORD(v101[1]) = v37 != (void)v69;
                        if ((void *)v37 == v69
                          || (-[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](self, "backgroundDetectionTypesInTravelSession"), uint64_t v38 = objc_claimAutoreleasedReturnValue(), -[TASingleDeviceRecord backgroundDetectionTypesInTravelSession](v6, "backgroundDetectionTypesInTravelSession"), v63 = objc_claimAutoreleasedReturnValue(), v64 = v38, objc_msgSend(v38, "isEqual:")))
                        {
                          uint64_t v39 = [(TASingleDeviceRecord *)self latestBeepOnMoveDate];
                          v65 = [(TASingleDeviceRecord *)v6 latestBeepOnMoveDate];
                          uint64_t v66 = (void *)v39;
                          HIDWORD(v101[0]) = v39 != (void)v65;
                          if ((void *)v39 == v65
                            || ([(TASingleDeviceRecord *)self latestBeepOnMoveDate],
                                uint64_t v40 = objc_claimAutoreleasedReturnValue(),
                                [(TASingleDeviceRecord *)v6 latestBeepOnMoveDate],
                                v59 = objc_claimAutoreleasedReturnValue(),
                                id v60 = v40,
                                objc_msgSend(v40, "isEqual:")))
                          {
                            uint64_t v41 = [(TASingleDeviceRecord *)self firstBeepOnMoveDate];
                            uint64_t v61 = [(TASingleDeviceRecord *)v6 firstBeepOnMoveDate];
                            v62 = (void *)v41;
                            BOOL v28 = v41 == (void)v61;
                            unint64_t v9 = v41 != (void)v61;
                            if (v28)
                            {
                              HIDWORD(v100[4]) = v9;
                            }
                            else
                            {
                              uint64_t v42 = [(TASingleDeviceRecord *)self firstBeepOnMoveDate];
                              v57 = [(TASingleDeviceRecord *)v6 firstBeepOnMoveDate];
                              v58 = v42;
                              if (!objc_msgSend(v42, "isEqual:"))
                              {
                                int v11 = 0;
                                LODWORD(v101[0]) = 0;
                                int v12 = 0;
                                int v13 = 0;
                                char v14 = 0;
                                v100[4] = 0x100000000;
                                v100[3] = 0x100000001;
                                v100[2] = 0x100000001;
                                int v10 = 1;
                                v100[1] = 0x100000001;
                                v100[0] = 0x100000000;
                                uint64_t v99 = 0x100000001;
                                goto LABEL_17;
                              }
                              HIDWORD(v100[4]) = v9;
                            }
                            unint64_t v9 = [(TASingleDeviceRecord *)self numBeepOnMove];
                            if (v9 == [(TASingleDeviceRecord *)v6 numBeepOnMove])
                            {
                              uint64_t v43 = [(TASingleDeviceRecord *)self firstStagedDetectionDate];
                              v55 = [(TASingleDeviceRecord *)v6 firstStagedDetectionDate];
                              v56 = (void *)v43;
                              BOOL v28 = v43 == (void)v55;
                              unint64_t v9 = v43 != (void)v55;
                              if (v28)
                              {
                                LODWORD(v100[4]) = v9;
                              }
                              else
                              {
                                char v44 = [(TASingleDeviceRecord *)self firstStagedDetectionDate];
                                v53 = [(TASingleDeviceRecord *)v6 firstStagedDetectionDate];
                                uint64_t v54 = v44;
                                if (!objc_msgSend(v44, "isEqual:"))
                                {
                                  int v11 = 0;
                                  LODWORD(v101[0]) = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  char v14 = 0;
                                  v100[3] = 0x100000001;
                                  v100[2] = 0x100000001;
                                  v100[1] = 0x100000001;
                                  int v10 = 1;
                                  v100[0] = 0x100000001;
                                  uint64_t v99 = 0x100000001;
                                  LODWORD(v100[4]) = 1;
                                  goto LABEL_17;
                                }
                                LODWORD(v100[4]) = v9;
                              }
                              unint64_t v9 = [(TASingleDeviceRecord *)self numStagedDetections];
                              if (v9 == [(TASingleDeviceRecord *)v6 numStagedDetections])
                              {
                                uint64_t v45 = [(TASingleDeviceRecord *)self firstSurfacedAlertDate];
                                objc_super v51 = [(TASingleDeviceRecord *)v6 firstSurfacedAlertDate];
                                v52 = (void *)v45;
                                LODWORD(v101[0]) = v45 != (void)v51;
                                if ((void *)v45 == v51
                                  || ([(TASingleDeviceRecord *)self firstSurfacedAlertDate],
                                      unint64_t v9 = objc_claimAutoreleasedReturnValue(),
                                      [(TASingleDeviceRecord *)v6 firstSurfacedAlertDate],
                                      BOOL v49 = objc_claimAutoreleasedReturnValue(),
                                      v50 = (void *)v9,
                                      objc_msgSend((id)v9, "isEqual:")))
                                {
                                  unint64_t v9 = [(TASingleDeviceRecord *)self firstSurfacedAlertType];
                                  if (v9 == [(TASingleDeviceRecord *)v6 firstSurfacedAlertType])
                                  {
                                    unint64_t v9 = [(TASingleDeviceRecord *)self accessoryInfo];
                                    uint64_t v47 = [(TASingleDeviceRecord *)v6 accessoryInfo];
                                    uint64_t v48 = (void *)v9;
                                    if (v9 == v47)
                                    {
                                      int v13 = 0;
                                      v100[3] = 0x100000001;
                                      v100[2] = 0x100000001;
                                      v100[1] = 0x100000001;
                                      int v10 = 1;
                                      v100[0] = 0x100000001;
                                      uint64_t v99 = 0x100000001;
                                      int v11 = 1;
                                      double v46 = (void *)v9;
                                      int v12 = 1;
                                      char v14 = 1;
                                    }
                                    else
                                    {
                                      uint64_t v3 = [(TASingleDeviceRecord *)self accessoryInfo];
                                      unint64_t v9 = [(TASingleDeviceRecord *)v6 accessoryInfo];
                                      char v14 = [(id)v3 isEqual:v9];
                                      int v13 = 1;
                                      v100[3] = 0x100000001;
                                      v100[2] = 0x100000001;
                                      v100[1] = 0x100000001;
                                      int v10 = 1;
                                      v100[0] = 0x100000001;
                                      uint64_t v99 = 0x100000001;
                                      int v11 = 1;
                                      int v12 = 1;
                                    }
                                  }
                                  else
                                  {
                                    int v12 = 0;
                                    int v13 = 0;
                                    char v14 = 0;
                                    v100[3] = 0x100000001;
                                    v100[2] = 0x100000001;
                                    v100[1] = 0x100000001;
                                    int v10 = 1;
                                    v100[0] = 0x100000001;
                                    uint64_t v99 = 0x100000001;
                                    int v11 = 1;
                                  }
                                }
                                else
                                {
                                  int v12 = 0;
                                  int v13 = 0;
                                  char v14 = 0;
                                  v100[3] = 0x100000001;
                                  v100[2] = 0x100000001;
                                  v100[1] = 0x100000001;
                                  int v10 = 1;
                                  v100[0] = 0x100000001;
                                  uint64_t v99 = 0x100000001;
                                  int v11 = 1;
                                  LODWORD(v101[0]) = 1;
                                }
                              }
                              else
                              {
                                int v11 = 0;
                                LODWORD(v101[0]) = 0;
                                int v12 = 0;
                                int v13 = 0;
                                char v14 = 0;
                                v100[3] = 0x100000001;
                                v100[2] = 0x100000001;
                                v100[1] = 0x100000001;
                                int v10 = 1;
                                uint64_t v99 = 0x100000001;
                                v100[0] = 0x100000001;
                              }
                              goto LABEL_17;
                            }
                            int v11 = 0;
                            LODWORD(v101[0]) = 0;
                            int v12 = 0;
                            int v13 = 0;
                            char v14 = 0;
                            *(void *)((char *)&v100[3] + 4) = 1;
                            LODWORD(v100[3]) = 1;
                            v100[2] = 0x100000001;
                            int v10 = 1;
                            v100[1] = 0x100000001;
                            v100[0] = 0x100000000;
                            uint64_t v99 = 0x100000001;
                          }
                          else
                          {
                            v100[4] = 0;
                            int v11 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            char v14 = 0;
                            v100[3] = 0x100000001;
                            v100[2] = 0x100000001;
                            v100[1] = 0x100000001;
                            int v10 = 1;
                            v100[0] = 0x100000000;
                            uint64_t v99 = 0x100000000;
                            v101[0] = 0x100000000;
                          }
                        }
                        else
                        {
                          uint64_t v99 = 0;
                          v101[0] = 0;
                          v100[4] = 0;
                          int v11 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          char v14 = 0;
                          v100[3] = 0x100000001;
                          v100[2] = 0x100000001;
                          v100[1] = 0x100000001;
                          int v10 = 1;
                          v100[0] = 0x100000000;
                          LODWORD(v101[1]) = 1;
                        }
                      }
                      else
                      {
                        uint64_t v99 = 0;
                        v100[0] = 0;
                        *(void *)((char *)v101 + 4) = 0;
                        v100[4] = 0;
                        int v11 = 0;
                        LODWORD(v101[0]) = 0;
                        int v12 = 0;
                        int v13 = 0;
                        char v14 = 0;
                        v100[3] = 0x100000001;
                        v100[2] = 0x100000001;
                        v100[1] = 0x100000001;
                        int v10 = 1;
                        HIDWORD(v101[1]) = 1;
                      }
                    }
                    else
                    {
                      *(void *)((char *)v100 + 4) = 0;
                      v101[0] = 0;
                      v101[1] = 0;
                      uint64_t v99 = 0;
                      v100[4] = 0;
                      LODWORD(v100[0]) = 0;
                      int v11 = 0;
                      int v12 = 0;
                      int v13 = 0;
                      char v14 = 0;
                      v100[3] = 0x100000001;
                      v100[2] = 0x100000001;
                      HIDWORD(v100[1]) = 1;
                      int v10 = 1;
                      LODWORD(v100[5]) = 1;
                    }
                  }
                  else
                  {
                    int v10 = 0;
                    *(void *)((char *)v100 + 4) = 0;
                    v101[0] = 0;
                    v101[1] = 0;
                    uint64_t v99 = 0;
                    LODWORD(v100[0]) = 0;
                    int v11 = 0;
                    int v12 = 0;
                    int v13 = 0;
                    char v14 = 0;
                    *(_OWORD *)((char *)&v100[3] + 4) = 1uLL;
                    LODWORD(v100[3]) = 1;
                    HIDWORD(v100[1]) = 1;
                    v100[2] = 0x100000001;
                  }
                }
                else
                {
                  int v10 = 0;
                  *(void *)((char *)&v100[4] + 4) = 0;
                  *(void *)((char *)v100 + 4) = 0;
                  v101[0] = 0;
                  v101[1] = 0;
                  uint64_t v99 = 0;
                  LODWORD(v100[0]) = 0;
                  int v11 = 0;
                  int v12 = 0;
                  int v13 = 0;
                  char v14 = 0;
                  LODWORD(v100[4]) = 0;
                  v100[3] = 0x100000001;
                  HIDWORD(v100[1]) = 1;
                  v100[2] = 0x100000001;
                  LODWORD(v101[2]) = 1;
                }
              }
              else
              {
                v100[0] = 0;
                v100[1] = 0;
                int v10 = 0;
                *(void *)((char *)&v100[4] + 4) = 0;
                uint64_t v99 = 0;
                int v11 = 0;
                memset(v101, 0, 20);
                int v12 = 0;
                int v13 = 0;
                char v14 = 0;
                LODWORD(v100[4]) = 0;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                HIDWORD(v101[2]) = 1;
              }
            }
            else
            {
              int v10 = 0;
              *(void *)((char *)&v100[4] + 4) = 0;
              uint64_t v99 = 0;
              memset(v101, 0, sizeof(v101));
              memset(v100, 0, 20);
              int v11 = 0;
              int v12 = 0;
              int v13 = 0;
              char v14 = 0;
              LODWORD(v100[4]) = 0;
              HIDWORD(v100[2]) = 1;
              v100[3] = 0x100000001;
              HIDWORD(v100[5]) = 1;
            }
          }
          else
          {
            v100[4] = 0;
            v100[5] = 0;
            int v10 = 0;
            uint64_t v99 = 0;
            memset(v100, 0, 24);
            memset(v101, 0, sizeof(v101));
            int v11 = 0;
            int v12 = 0;
            int v13 = 0;
            char v14 = 0;
            v100[3] = 0x100000001;
          }
        }
        else
        {
          v100[4] = 0;
          v100[5] = 0;
          int v10 = 0;
          uint64_t v99 = 0;
          memset(v100, 0, 24);
          memset(v101, 0, sizeof(v101));
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
          char v14 = 0;
          v100[3] = 0x100000001;
          LODWORD(v100[6]) = 1;
        }
      }
      else
      {
        int v10 = 0;
        *(_OWORD *)((char *)&v100[4] + 4) = 0uLL;
        uint64_t v99 = 0;
        memset(v101, 0, sizeof(v101));
        memset(v100, 0, 28);
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        char v14 = 0;
        *(void *)((char *)&v100[3] + 4) = 1;
      }
    }
    else
    {
      int v10 = 0;
      uint64_t v99 = 0;
      memset(v101, 0, sizeof(v101));
      memset(v100, 0, 28);
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      char v14 = 0;
      HIDWORD(v100[3]) = 1;
      memset(&v100[4], 0, 20);
      HIDWORD(v100[6]) = 1;
    }
  }
  else
  {
    memset(v100, 0, sizeof(v100));
    int v10 = 0;
    uint64_t v99 = 0;
    memset(v101, 0, sizeof(v101));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    char v14 = 0;
  }
LABEL_17:
  if (v13)
  {
    int v18 = v11;
    char v19 = v8;
    double v20 = v7;
    int v21 = v10;
    int v22 = v12;

    int v12 = v22;
    int v10 = v21;
    id v7 = v20;
    id v8 = v19;
    int v11 = v18;
  }
  if (v12)
  {
  }
  if (LODWORD(v101[0]))
  {
  }
  if (v11)
  {
  }
  if (LODWORD(v100[4]))
  {
  }
  if (LODWORD(v100[0]))
  {
  }
  if (HIDWORD(v100[4]))
  {
  }
  if (v99)
  {
  }
  if (HIDWORD(v101[0]))
  {
  }
  if (HIDWORD(v99))
  {
  }
  if (LODWORD(v101[1]))
  {
  }
  if (HIDWORD(v100[0]))
  {
  }
  if (HIDWORD(v101[1]))
  {
  }
  if (LODWORD(v100[1]))
  {
  }
  if (LODWORD(v100[5]))
  {
  }
  if (v10)
  {
  }
  if (LODWORD(v101[2]))
  {
  }
  if (HIDWORD(v100[1]))
  {
  }
  if (HIDWORD(v101[2]))
  {
  }
  if (LODWORD(v100[2]))
  {
  }
  if (HIDWORD(v100[5]))
  {
  }
  if (HIDWORD(v100[2]))
  {
  }
  if (LODWORD(v100[6]))
  {
  }
  if (LODWORD(v100[3]))
  {
  }
  if (HIDWORD(v100[6]))
  {
  }
  if (HIDWORD(v100[3]))
  {
  }
  if (v7 != v8)
  {
  }
LABEL_72:

  return v14;
}

- (id)descriptionDictionary
{
  v12[6] = *MEMORY[0x263EF8340];
  v11[0] = @"Address";
  uint64_t v3 = [(NSData *)self->_address hexString];
  v12[0] = v3;
  v11[1] = @"State";
  id v4 = +[TADeviceRecord notificationInternalStateToString:self->_state];
  v12[1] = v4;
  v11[2] = @"Type";
  id v5 = +[TADeviceInformation deviceTypeToString:self->_type];
  _DWORD v12[2] = v5;
  v11[3] = @"CreationDate";
  id v6 = [(NSDate *)self->_creationDate getDateString];
  v12[3] = v6;
  v11[4] = @"Surfaced";
  id v7 = [NSNumber numberWithBool:self->_hasSurfacedNotification];
  v12[4] = v7;
  v11[5] = @"AISState";
  id v8 = [NSNumber numberWithUnsignedInteger:self->_AISFetchState];
  v12[5] = v8;
  unint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)description
{
  uint64_t v3 = [(TASingleDeviceRecord *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = (void *)TAStatusLog;
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

- (TASingleDeviceRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)TASingleDeviceRecord;
  id v5 = [(TASingleDeviceRecord *)&v58 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
    address = v5->_address;
    v5->_address = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v5->_state = [v4 decodeIntegerForKey:@"State"];
    v5->_type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    [v4 decodeDoubleForKey:@"KeepAliveInterval"];
    v5->_double keepAliveInterval = v12;
    int v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"StagedResults"];
    stagedDetectionResults = v5->_stagedDetectionResults;
    v5->_stagedDetectionResults = (NSMutableArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatestAdvert"];
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v18;

    if (!v5->_uuid)
    {
      uint64_t v20 = [(TASingleDeviceRecord *)v5 _generateTAUUID:v5->_latestAdvertisement];
      int v21 = v5->_uuid;
      v5->_uuid = (NSUUID *)v20;
    }
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstObsDate"];
    earliestObservationDate = v5->_earliestObservationDate;
    v5->_earliestObservationDate = (NSDate *)v22;

    v5->_hasSurfacedNotification = [v4 decodeBoolForKey:@"Surfaced"];
    double v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    double v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"BackgroundSet"];
    backgroundDetectionTypesInTravelSession = v5->_backgroundDetectionTypesInTravelSession;
    v5->_backgroundDetectionTypesInTravelSession = (NSMutableSet *)v27;

    BOOL v29 = (void *)MEMORY[0x263EFFA08];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"BackgroundCount"];
    backgroundDetectionCount = v5->_backgroundDetectionCount;
    v5->_backgroundDetectionCount = (NSMutableDictionary *)v32;

    char v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"BackgroundDate"];
    firstBackgroundDetectionDate = v5->_firstBackgroundDetectionDate;
    v5->_firstBackgroundDetectionDate = (NSMutableDictionary *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beepOnMove"];
    latestBeepOnMoveDate = v5->_latestBeepOnMoveDate;
    v5->_latestBeepOnMoveDate = (NSDate *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fBOM"];
    firstBeepOnMoveDate = v5->_firstBeepOnMoveDate;
    v5->_firstBeepOnMoveDate = (NSDate *)v42;

    v5->_numBeepOnMove = [v4 decodeIntegerForKey:@"nBOM"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedDate"];
    firstStagedDetectionDate = v5->_firstStagedDetectionDate;
    v5->_firstStagedDetectionDate = (NSDate *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstSurfaceDate"];
    firstSurfacedAlertDate = v5->_firstSurfacedAlertDate;
    v5->_firstSurfacedAlertDate = (NSDate *)v46;

    v5->_firstSurfacedAlertType = [v4 decodeIntegerForKey:@"fsat"];
    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsad"];
    lastSurfacedAlertDate = v5->_lastSurfacedAlertDate;
    v5->_lastSurfacedAlertDate = (NSDate *)v48;

    v5->_numStagedDetections = [v4 decodeIntegerForKey:@"nStaged"];
    v5->_numSurfacedAlerts = [v4 decodeIntegerForKey:@"nSurfaced"];
    v5->_playSoundSuccessCount = [v4 decodeIntegerForKey:@"nPSS"];
    v5->_playSoundFailureCount = [v4 decodeIntegerForKey:@"nPSF"];
    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lpsad"];
    latestPlaySoundAttemptDate = v5->_latestPlaySoundAttemptDate;
    v5->_latestPlaySoundAttemptDate = (NSDate *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"laisad"];
    lastAISAttemptDate = v5->_lastAISAttemptDate;
    v5->_lastAISAttemptDate = (NSDate *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AISInfo"];
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = (TAAccessoryInformation *)v54;

    uint64_t v56 = [v4 decodeIntegerForKey:@"AISState"];
    v5->_unint64_t AISFetchState = v56;
    if ((v56 | 4) == 6) {
      v5->_unint64_t AISFetchState = 0;
    }
    v5->_AISFetchCount = [v4 decodeIntegerForKey:@"AISCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v5 = a3;
  [v5 encodeObject:address forKey:@"Address"];
  [v5 encodeObject:self->_uuid forKey:@"UUID"];
  [v5 encodeInteger:self->_state forKey:@"State"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeDouble:@"KeepAliveInterval" forKey:self->_keepAliveInterval];
  [v5 encodeObject:self->_stagedDetectionResults forKey:@"StagedResults"];
  [v5 encodeObject:self->_latestAdvertisement forKey:@"LatestAdvert"];
  [v5 encodeObject:self->_earliestObservationDate forKey:@"firstObsDate"];
  [v5 encodeBool:self->_hasSurfacedNotification forKey:@"Surfaced"];
  [v5 encodeObject:self->_backgroundDetectionTypesInTravelSession forKey:@"BackgroundSet"];
  [v5 encodeObject:self->_backgroundDetectionCount forKey:@"BackgroundCount"];
  [v5 encodeObject:self->_firstBackgroundDetectionDate forKey:@"BackgroundDate"];
  [v5 encodeObject:self->_latestBeepOnMoveDate forKey:@"beepOnMove"];
  [v5 encodeObject:self->_firstBeepOnMoveDate forKey:@"fBOM"];
  [v5 encodeInteger:self->_numBeepOnMove forKey:@"nBOM"];
  [v5 encodeObject:self->_firstStagedDetectionDate forKey:@"stagedDate"];
  [v5 encodeObject:self->_firstSurfacedAlertDate forKey:@"firstSurfaceDate"];
  [v5 encodeInteger:self->_firstSurfacedAlertType forKey:@"fsat"];
  [v5 encodeObject:self->_lastSurfacedAlertDate forKey:@"lsad"];
  [v5 encodeInteger:self->_numStagedDetections forKey:@"nStaged"];
  [v5 encodeInteger:self->_numSurfacedAlerts forKey:@"nSurfaced"];
  [v5 encodeInteger:self->_playSoundSuccessCount forKey:@"nPSS"];
  [v5 encodeInteger:self->_playSoundFailureCount forKey:@"nPSF"];
  [v5 encodeObject:self->_latestPlaySoundAttemptDate forKey:@"lpsad"];
  [v5 encodeObject:self->_accessoryInfo forKey:@"AISInfo"];
  [v5 encodeInteger:self->_AISFetchState forKey:@"AISState"];
  [v5 encodeInteger:self->_AISFetchCount forKey:@"AISCount"];
  [v5 encodeObject:self->_lastAISAttemptDate forKey:@"laisad"];
}

- (NSData)address
{
  return self->_address;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TAAccessoryInformation)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void)setAccessoryInfo:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)AISFetchState
{
  return self->_AISFetchState;
}

- (void)setAISFetchState:(unint64_t)a3
{
  self->_unint64_t AISFetchState = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (NSDate)earliestObservationDate
{
  return self->_earliestObservationDate;
}

- (BOOL)hasSurfacedNotification
{
  return self->_hasSurfacedNotification;
}

- (void)setHasSurfacedNotification:(BOOL)a3
{
  self->_hasSurfacedNotification = a3;
}

- (unint64_t)numStagedDetections
{
  return self->_numStagedDetections;
}

- (NSDate)firstStagedDetectionDate
{
  return self->_firstStagedDetectionDate;
}

- (NSDate)latestBeepOnMoveDate
{
  return self->_latestBeepOnMoveDate;
}

- (NSDate)firstBeepOnMoveDate
{
  return self->_firstBeepOnMoveDate;
}

- (unint64_t)numBeepOnMove
{
  return self->_numBeepOnMove;
}

- (unint64_t)numSurfacedAlerts
{
  return self->_numSurfacedAlerts;
}

- (NSDate)firstSurfacedAlertDate
{
  return self->_firstSurfacedAlertDate;
}

- (unint64_t)firstSurfacedAlertType
{
  return self->_firstSurfacedAlertType;
}

- (NSDate)lastSurfacedAlertDate
{
  return self->_lastSurfacedAlertDate;
}

- (unint64_t)playSoundSuccessCount
{
  return self->_playSoundSuccessCount;
}

- (unint64_t)playSoundFailureCount
{
  return self->_playSoundFailureCount;
}

- (NSDate)latestPlaySoundAttemptDate
{
  return self->_latestPlaySoundAttemptDate;
}

- (unint64_t)AISFetchCount
{
  return self->_AISFetchCount;
}

- (void)setAISFetchCount:(unint64_t)a3
{
  self->_AISFetchCount = a3;
}

- (NSDate)lastAISAttemptDate
{
  return self->_lastAISAttemptDate;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(double)a3
{
  self->_double keepAliveInterval = a3;
}

- (NSMutableArray)stagedDetectionResults
{
  return self->_stagedDetectionResults;
}

- (void)setStagedDetectionResults:(id)a3
{
}

- (NSMutableSet)backgroundDetectionTypesInTravelSession
{
  return self->_backgroundDetectionTypesInTravelSession;
}

- (void)setBackgroundDetectionTypesInTravelSession:(id)a3
{
}

- (NSMutableDictionary)backgroundDetectionCount
{
  return self->_backgroundDetectionCount;
}

- (void)setBackgroundDetectionCount:(id)a3
{
}

- (NSMutableDictionary)firstBackgroundDetectionDate
{
  return self->_firstBackgroundDetectionDate;
}

- (void)setFirstBackgroundDetectionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstBackgroundDetectionDate, 0);
  objc_storeStrong((id *)&self->_backgroundDetectionCount, 0);
  objc_storeStrong((id *)&self->_backgroundDetectionTypesInTravelSession, 0);
  objc_storeStrong((id *)&self->_stagedDetectionResults, 0);
  objc_storeStrong((id *)&self->_lastAISAttemptDate, 0);
  objc_storeStrong((id *)&self->_latestPlaySoundAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastSurfacedAlertDate, 0);
  objc_storeStrong((id *)&self->_firstSurfacedAlertDate, 0);
  objc_storeStrong((id *)&self->_firstBeepOnMoveDate, 0);
  objc_storeStrong((id *)&self->_latestBeepOnMoveDate, 0);
  objc_storeStrong((id *)&self->_firstStagedDetectionDate, 0);
  objc_storeStrong((id *)&self->_earliestObservationDate, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)_isKeepInStagingUntilComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isAISFetchComplete
{
}

@end