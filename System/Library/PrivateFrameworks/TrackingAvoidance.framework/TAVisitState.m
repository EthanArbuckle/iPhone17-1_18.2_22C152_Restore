@interface TAVisitState
+ (BOOL)supportsSecureCoding;
+ (id)visitStateTypeToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInSensitiveVisit;
- (BOOL)setState:(unint64_t)a3;
- (BOOL)shouldCreateNewVisitSnapshotFromUnknownState:(id)a3;
- (NSHashTable)observers;
- (NSMutableArray)nextPredictedLOIs;
- (NSMutableDictionary)importantLois;
- (TACircularBuffer)interVisitMetricSnapshotBuffer;
- (TACircularBuffer)visitSnapshotBuffer;
- (TAInterVisitMetricsSnapshot)interVisitMetricsSnapshotBackup;
- (TAScanRequest)scanRequest;
- (TAVisitState)initWithCoder:(id)a3;
- (TAVisitState)initWithSettings:(id)a3 scanRequestSettings:(id)a4;
- (TAVisitStateSettings)settings;
- (id)description;
- (id)getDisplayEventsWithFirstPrecedingInInterval:(id)a3 store:(id)a4;
- (id)getLatestValidVisit;
- (id)getLatestValidVisitArrivalDate;
- (id)getLatestValidVisitDepartureDate;
- (unint64_t)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (unint64_t)lastStateTransition;
- (unint64_t)state;
- (unint64_t)stateTransitionDecisionGivenTACLVisit:(id)a3;
- (void)addObserver:(id)a3;
- (void)closeLatestInterVisitSnapshotWithStore:(id)a3 arrivalVisit:(id)a4;
- (void)closeVisitSnapshotWithStore:(id)a3 visit:(id)a4;
- (void)description;
- (void)encodeWithCoder:(id)a3;
- (void)ingestTAEvent:(id)a3 store:(id)a4 appendOutgoingRequestsTo:(id)a5;
- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:(id)a3 store:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
- (void)issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:(id)a3 clock:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
- (void)labelLoiTypeForLastVisitSnapshot:(id)a3;
- (void)mergeWithAnotherTAVisitState:(id)a3;
- (void)notifyObserversOfMetricsHint:(unint64_t)a3;
- (void)notifyObserversOfStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)openInterVisitBackupSnapshotWithArrivalVisit:(id)a3;
- (void)openInterVisitSnapshotWithStore:(id)a3 departureVisit:(id)a4;
- (void)openVisitSnapshotWithStore:(id)a3 visit:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
- (void)performStateTransitionDecision:(unint64_t)a3 store:(id)a4 visit:(id)a5 andAppendOutgoingRequestsTo:(id)a6;
- (void)purgeInterVisitSnapshotBufferWithCurrentDate:(id)a3;
- (void)purgeVisitSnapshotBufferWithCurrentDate:(id)a3;
- (void)purgeWithClock:(id)a3;
- (void)recoverInterVisitSnapshotWithArrivalVisit:(id)a3 store:(id)a4;
- (void)removeObserver:(id)a3;
- (void)resetInterVisitBackupSnapshot;
- (void)setInterVisitMetricsSnapshotBackup:(id)a3;
- (void)setNextPredictedLOIs:(id)a3;
- (void)setObservers:(id)a3;
- (void)setScanRequest:(id)a3;
- (void)setSettings:(id)a3;
- (void)updateImportantLOIs:(id)a3 currentDate:(id)a4;
- (void)updateInterVisitBackupSnapshotWithStore:(id)a3;
- (void)updateInterVisitSnapshot:(id)a3 store:(id)a4;
- (void)updateInterVisitSnapshotWithStore:(id)a3;
@end

@implementation TAVisitState

- (void)ingestTAEvent:(id)a3 store:(id)a4 appendOutgoingRequestsTo:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v48 = v10;
    v49 = self;
    v50 = v9;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v11 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
    v12 = [v11 reverseObjectEnumerator];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v18 = [v8 getDate];
          v19 = [v17 representativeVisit];
          v20 = [v19 arrivalDate];
          uint64_t v21 = [v18 compare:v20];

          if (v21 == 1)
          {
            v29 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
              -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:](v29, v8);
            }
            [v17 addUTAdvertisement:v8];
            goto LABEL_21;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    self = v49;
    id v9 = v50;
    id v10 = v48;
    if ([(TACircularBuffer *)v49->_interVisitMetricSnapshotBuffer count])
    {
      v30 = [(TACircularBuffer *)v49->_interVisitMetricSnapshotBuffer lastObject];
      char v31 = [v30 isClosed];

      if ((v31 & 1) == 0)
      {
        scanRequest = v49->_scanRequest;
        v22 = [v50 deviceRecord];
        v33 = [v50 clock];
        [(TAScanRequest *)scanRequest scheduleInterVisitScanForAdvertisement:v8 deviceRecord:v22 clock:v33];

LABEL_24:
      }
    }
  }
  else
  {
    if ([v8 isMemberOfClass:objc_opt_class()])
    {
      if (![(TACircularBuffer *)self->_visitSnapshotBuffer count]) {
        goto LABEL_47;
      }
      v22 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      if (([v22 isClosed] & 1) == 0)
      {
        v23 = [v8 getDate];
        v24 = [v22 latestLocation];
        [v24 getDate];
        v26 = id v25 = v10;
        uint64_t v27 = [v23 compare:v26];

        id v10 = v25;
        if (v27 == 1)
        {
          v28 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
            -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:](v28, v8);
          }
          [v22 updateLatestLocation:v8];
        }
      }
      goto LABEL_24;
    }
    if ([v8 isMemberOfClass:objc_opt_class()])
    {
      v34 = [v9 clock];
      [(TAVisitState *)self updateImportantLOIs:v8 currentDate:v34];
    }
    else if ([v8 isMemberOfClass:objc_opt_class()])
    {
      if ([v8 isTemporalOrderSensical])
      {
        unint64_t v35 = [(TAVisitState *)self stateTransitionDecisionGivenTACLVisit:v8];
        self->_lastStateTransition = v35;
        [(TAVisitState *)self performStateTransitionDecision:v35 store:v9 visit:v8 andAppendOutgoingRequestsTo:v10];
      }
      else
      {
        v37 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
          -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:](v37);
        }
      }
    }
    else if ([v8 isMemberOfClass:objc_opt_class()])
    {
      if ([v8 systemStateType] == 2)
      {
        v36 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        v22 = v36;
        if (v36) {
          [v36 addSystemState:v8];
        }
        goto LABEL_24;
      }
    }
    else if ([v8 isMemberOfClass:objc_opt_class()])
    {
      if ([(TACircularBuffer *)self->_visitSnapshotBuffer count])
      {
        v22 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        if (([v22 isClosed] & 1) == 0)
        {
          v38 = [v8 getDate];
          v39 = [v22 representativeVisit];
          [v39 arrivalDate];
          v41 = id v40 = v10;
          uint64_t v42 = [v38 compare:v41];

          id v10 = v40;
          if (v42 == 1)
          {
            v43 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
              -[TAVisitState ingestTAEvent:store:appendOutgoingRequestsTo:].cold.4(v43, v8);
            }
            [v22 addScanState:v8];
          }
        }
        goto LABEL_24;
      }
    }
    else if ([v8 isMemberOfClass:objc_opt_class()])
    {
      v44 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        int v56 = 0;
        __int16 v57 = 2082;
        v58 = "";
        __int16 v59 = 2113;
        id v60 = v8;
        _os_log_impl(&dword_22345C000, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState adding PLOI\", \"PLOI\":\"%{private}@\"}", buf, 0x1Cu);
      }
      [(NSMutableArray *)self->_nextPredictedLOIs addObject:v8];
    }
  }
LABEL_47:
  v45 = self->_scanRequest;
  v46 = [v9 clock];
  v47 = [(TAScanRequest *)v45 evictScheduledInterVisitScanWithClock:v46];

  if (v47) {
    [v10 addObject:v47];
  }
  [(TAVisitState *)self updateInterVisitSnapshotWithStore:v9];
  [(TAVisitState *)self updateInterVisitBackupSnapshotWithStore:v9];
}

- (void)purgeWithClock:(id)a3
{
  id v4 = a3;
  [(TAVisitState *)self purgeVisitSnapshotBufferWithCurrentDate:v4];
  [(TAVisitState *)self purgeInterVisitSnapshotBufferWithCurrentDate:v4];
}

- (void)purgeInterVisitSnapshotBufferWithCurrentDate:(id)a3
{
  id v4 = a3;
  if ([(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer count])
  {
    v5 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer firstObject];
    if ([v5 isClosed])
    {
      v6 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer firstObject];
      v7 = [v6 lastUpdateTime];
      [v4 timeIntervalSinceDate:v7];
      double v9 = v8;
      [(TAVisitStateSettings *)self->_settings snapshotBufferTimeIntervalOfRetention];
      double v11 = v10;

      if (v9 >= v11)
      {
        v12 = (void *)MEMORY[0x263F08A98];
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        v17 = __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke;
        v18 = &unk_2646AAFC8;
        id v19 = v4;
        v20 = self;
        uint64_t v13 = [v12 predicateWithBlock:&v15];
        id v14 = -[TACircularBuffer removeUntilFirstPredicateFail:](self->_interVisitMetricSnapshotBuffer, "removeUntilFirstPredicateFail:", v13, v15, v16, v17, v18);
      }
    }
    else
    {
    }
  }
}

- (void)purgeVisitSnapshotBufferWithCurrentDate:(id)a3
{
  id v4 = a3;
  if ([(TACircularBuffer *)self->_visitSnapshotBuffer count])
  {
    v5 = [(TACircularBuffer *)self->_visitSnapshotBuffer firstObject];
    if ([v5 isClosed])
    {
      v6 = [(TACircularBuffer *)self->_visitSnapshotBuffer firstObject];
      v7 = [v6 representativeVisit];
      double v8 = [v7 departureDate];
      [v4 timeIntervalSinceDate:v8];
      double v10 = v9;
      [(TAVisitStateSettings *)self->_settings snapshotBufferTimeIntervalOfRetention];
      double v12 = v11;

      if (v10 >= v12)
      {
        uint64_t v13 = (void *)MEMORY[0x263F08A98];
        uint64_t v16 = MEMORY[0x263EF8330];
        uint64_t v17 = 3221225472;
        v18 = __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke;
        id v19 = &unk_2646AAFC8;
        id v20 = v4;
        uint64_t v21 = self;
        id v14 = [v13 predicateWithBlock:&v16];
        id v15 = -[TACircularBuffer removeUntilFirstPredicateFail:](self->_visitSnapshotBuffer, "removeUntilFirstPredicateFail:", v14, v16, v17, v18, v19);
      }
    }
    else
    {
    }
  }
}

- (void)updateInterVisitSnapshotWithStore:(id)a3
{
  id v4 = a3;
  if (self->_state == 2)
  {
    if ([(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer count]
      && ([(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject],
          v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isClosed],
          v5,
          !v6))
    {
      v7 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject];
      [(TAVisitState *)self updateInterVisitSnapshot:v7 store:v4];
    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      -[TAVisitState updateInterVisitSnapshotWithStore:]();
    }
  }
}

- (void)updateInterVisitBackupSnapshotWithStore:(id)a3
{
  id v4 = a3;
  if (self->_state == 1)
  {
    interVisitMetricsSnapshotBackup = self->_interVisitMetricsSnapshotBackup;
    if (interVisitMetricsSnapshotBackup
      && ![(TAInterVisitMetricsSnapshot *)interVisitMetricsSnapshotBackup isClosed])
    {
      [(TAVisitState *)self updateInterVisitSnapshot:self->_interVisitMetricsSnapshotBackup store:v4];
    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      -[TAVisitState updateInterVisitBackupSnapshotWithStore:]();
    }
  }
}

- (void)updateInterVisitSnapshot:(id)a3 store:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFF910]);
  [(TAVisitStateSettings *)self->_settings interVisitSnapshotUpdateInterval];
  double v10 = v9;
  double v11 = [v6 lastUpdateTime];
  double v12 = (void *)[v8 initWithTimeInterval:v11 sinceDate:v10];

  uint64_t v13 = [v7 clock];
  uint64_t v14 = [v12 compare:v13];

  if (v14 == -1)
  {
    id v15 = (void *)MEMORY[0x263F08798];
    uint64_t v16 = [v6 lastUpdateTime];
    uint64_t v17 = [v7 clock];
    v18 = [v15 createIntervalSafelyWithStartDate:v16 endDate:v17];

    [(TAVisitStateSettings *)self->_settings thresholdOfLocationRelevance];
    id v19 = +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v18);
    id v20 = [v18 endDate];
    [v6 updateInterVisitMetric:v19 store:v7 withUpdatedTime:v20 andCloseSnapshot:0];

    uint64_t v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = [v6 accumulatedDeviceMetrics];
      int v24 = 134283521;
      uint64_t v25 = [v23 count];
      _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "#TAVisitState inter-visit snapshot updated; tracking %{private}lu devices",
        (uint8_t *)&v24,
        0xCu);
    }
  }
}

- (BOOL)isInSensitiveVisit
{
  if (self->_state != 1) {
    return 0;
  }
  v3 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
  if (v3)
  {
    id v4 = [(TAVisitStateSettings *)self->_settings sensitiveLOITypes];
    if (v4)
    {
      v5 = [(TAVisitStateSettings *)self->_settings sensitiveLOITypes];
      id v6 = NSNumber;
      id v7 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "loiType"));
      char v9 = [v5 containsObject:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)getLatestValidVisitDepartureDate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
  v3 = [v2 reverseObjectEnumerator];

  id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isClosed])
        {
          id v8 = [v7 representativeVisit];
          id v4 = [v8 departureDate];

          goto LABEL_11;
        }
      }
      id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (TACircularBuffer)visitSnapshotBuffer
{
  return self->_visitSnapshotBuffer;
}

- (unint64_t)state
{
  return self->_state;
}

- (TACircularBuffer)interVisitMetricSnapshotBuffer
{
  return self->_interVisitMetricSnapshotBuffer;
}

- (TAVisitState)initWithSettings:(id)a3 scanRequestSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)TAVisitState;
  char v9 = [(TAVisitState *)&v25 init];
  long long v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    objc_storeStrong((id *)&v9->_settings, a3);
    long long v11 = [[TACircularBuffer alloc] initWithCapacity:[(TAVisitStateSettings *)v10->_settings visitSnapshotCapacity]];
    visitSnapshotBuffer = v10->_visitSnapshotBuffer;
    v10->_visitSnapshotBuffer = v11;

    long long v13 = [[TACircularBuffer alloc] initWithCapacity:[(TAVisitStateSettings *)v10->_settings interVisitMetricSnapshotCapacity]];
    interVisitMetricSnapshotBuffer = v10->_interVisitMetricSnapshotBuffer;
    v10->_interVisitMetricSnapshotBuffer = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    importantLois = v10->_importantLois;
    v10->_importantLois = v15;

    uint64_t v17 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v17;

    id v19 = [[TAScanRequest alloc] initWithSettings:v8];
    scanRequest = v10->_scanRequest;
    v10->_scanRequest = v19;

    interVisitMetricsSnapshotBackup = v10->_interVisitMetricsSnapshotBackup;
    v10->_interVisitMetricsSnapshotBackup = 0;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    nextPredictedLOIs = v10->_nextPredictedLOIs;
    v10->_nextPredictedLOIs = v22;
  }
  return v10;
}

+ (id)visitStateTypeToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_2646AAFE8[a3];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObserversOfStateChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(NSHashTable *)self->_observers allObjects];
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
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 visitState:self didChangeStateFromType:a3 toType:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)notifyObserversOfMetricsHint:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 visitState:self didIssueMetricsSubmissionHint:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)setState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  uint64_t v5 = (void *)TAStatusLog;
  if (state == a3)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitState setState:]();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v5;
      uint64_t v8 = +[TAVisitState visitStateTypeToString:state];
      uint64_t v9 = +[TAVisitState visitStateTypeToString:self->_state];
      int v11 = 138412546;
      long long v12 = v8;
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_22345C000, v7, OS_LOG_TYPE_DEFAULT, "#TAVisitState changing state from %@ to %@", (uint8_t *)&v11, 0x16u);
    }
    [(NSMutableArray *)self->_nextPredictedLOIs removeAllObjects];
    [(TAVisitState *)self notifyObserversOfStateChangeFromState:state toState:self->_state];
  }
  return state != a3;
}

- (unint64_t)stateTransitionDecisionGivenTACLVisit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unint64_t state = self->_state;
  if (state != 2)
  {
    if (state == 1)
    {
      if ([(TACircularBuffer *)self->_visitSnapshotBuffer count])
      {
        uint64_t v16 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        int v17 = [v16 isClosed];

        if (v17)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
            -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.4();
          }
        }
        else if ([v5 isTemporalOrderSensical])
        {
          if ([v5 hasDepartureDate])
          {
            unint64_t v7 = 1;
            goto LABEL_41;
          }
          id v19 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
            -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.5(v19);
          }
        }
        else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.6();
        }
      }
      else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      {
        -[TAVisitState stateTransitionDecisionGivenTACLVisit:]();
      }
    }
    else
    {
      if (state)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TAVisitState stateTransitionDecisionGivenTACLVisit:]();
        }
        goto LABEL_40;
      }
      if [v4 hasArrivalDate] && (objc_msgSend(v5, "hasDepartureDate"))
      {
        unint64_t v7 = 4;
        goto LABEL_41;
      }
      if ([v5 hasArrivalDate])
      {
        unint64_t v7 = 3;
        goto LABEL_41;
      }
      uint64_t v18 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
    }
    goto LABEL_40;
  }
  uint64_t v8 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
  if ([v8 count])
  {
    uint64_t v9 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
    uint64_t v10 = [v9 lastObject];
    int v11 = [v10 representativeVisit];
    long long v12 = [v11 arrivalDate];
    __int16 v13 = [v5 arrivalDate];
    uint64_t v14 = [v12 compare:v13];

    if (v14 == 1)
    {
      uint64_t v15 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
        -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.9(v15);
      }
      goto LABEL_40;
    }
  }
  else
  {
  }
  if (![v5 hasArrivalDate] || !objc_msgSend(v5, "hasDepartureDate"))
  {
    if ([v5 hasArrivalDate])
    {
      unint64_t v7 = 2;
      goto LABEL_41;
    }
    uint64_t v18 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
LABEL_30:
    }
      -[TAVisitState stateTransitionDecisionGivenTACLVisit:](v18);
LABEL_40:
    unint64_t v7 = 0;
    goto LABEL_41;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
    -[TAVisitState stateTransitionDecisionGivenTACLVisit:].cold.7();
  }
  unint64_t v7 = 5;
LABEL_41:

  return v7;
}

- (void)performStateTransitionDecision:(unint64_t)a3 store:(id)a4 visit:(id)a5 andAppendOutgoingRequestsTo:(id)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  switch(a3)
  {
    case 0uLL:
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAVisitState performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:]();
      }
      break;
    case 1uLL:
      [(TAVisitState *)self closeVisitSnapshotWithStore:v10 visit:v11];
      if ([(TAVisitState *)self evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:v10 andAppendOutgoingRequestsTo:v12] == 1)
      {
        [(TAVisitState *)self openInterVisitSnapshotWithStore:v10 departureVisit:v11];
        __int16 v13 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        [(TAVisitState *)self issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:v13 store:v10 andAppendOutgoingRequestsTo:v12];

        [(TAVisitState *)self notifyObserversOfMetricsHint:0];
        [(TAVisitState *)self notifyObserversOfMetricsHint:2];
      }
      goto LABEL_36;
    case 2uLL:
      [(TAVisitState *)self openVisitSnapshotWithStore:v10 visit:v11 andAppendOutgoingRequestsTo:v12];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v14 = [(NSMutableDictionary *)self->_importantLois allValues];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v60;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v59 + 1) + 8 * v18) bufferCopy];
            [(TAVisitState *)self labelLoiTypeForLastVisitSnapshot:v19];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v66 count:16];
        }
        while (v16);
      }

      id v20 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      uint64_t v21 = [v10 clock];
      [(TAVisitState *)self issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:v20 clock:v21 andAppendOutgoingRequestsTo:v12];

      [(TAVisitState *)self closeLatestInterVisitSnapshotWithStore:v10 arrivalVisit:v11];
      [(TAVisitState *)self notifyObserversOfMetricsHint:1];
      goto LABEL_24;
    case 3uLL:
      [(TAVisitState *)self openVisitSnapshotWithStore:v10 visit:v11 andAppendOutgoingRequestsTo:v12];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v22 = [(NSMutableDictionary *)self->_importantLois allValues];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v56;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v56 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [*(id *)(*((void *)&v55 + 1) + 8 * v26) bufferCopy];
            [(TAVisitState *)self labelLoiTypeForLastVisitSnapshot:v27];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v24);
      }

      v28 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      v29 = [v10 clock];
      [(TAVisitState *)self issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:v28 clock:v29 andAppendOutgoingRequestsTo:v12];

LABEL_24:
      [(TAVisitState *)self openInterVisitBackupSnapshotWithArrivalVisit:v11];
      v30 = self;
      uint64_t v31 = 1;
      goto LABEL_37;
    case 4uLL:
      if ([(TAVisitState *)self shouldCreateNewVisitSnapshotFromUnknownState:v11])
      {
        [(TAVisitState *)self openVisitSnapshotWithStore:v10 visit:v11 andAppendOutgoingRequestsTo:v12];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v32 = [(NSMutableDictionary *)self->_importantLois allValues];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v52;
          do
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v52 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = [*(id *)(*((void *)&v51 + 1) + 8 * v36) bufferCopy];
              [(TAVisitState *)self labelLoiTypeForLastVisitSnapshot:v37];

              ++v36;
            }
            while (v34 != v36);
            uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v34);
        }

        [(TAVisitState *)self closeVisitSnapshotWithStore:v10 visit:v11];
      }
      [(TAVisitState *)self openInterVisitSnapshotWithStore:v10 departureVisit:v11];
      v38 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];

      if (v38)
      {
        v39 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        [(TAVisitState *)self issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:v39 store:v10 andAppendOutgoingRequestsTo:v12];
      }
LABEL_36:
      v30 = self;
      uint64_t v31 = 2;
LABEL_37:
      [(TAVisitState *)v30 setState:v31];
      break;
    case 5uLL:
      [(TAVisitState *)self closeLatestInterVisitSnapshotWithStore:v10 arrivalVisit:v11];
      [(TAVisitState *)self notifyObserversOfMetricsHint:1];
      [(TAVisitState *)self openVisitSnapshotWithStore:v10 visit:v11 andAppendOutgoingRequestsTo:v12];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v40 = [(NSMutableDictionary *)self->_importantLois allValues];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v47 objects:v63 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v48;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v48 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [*(id *)(*((void *)&v47 + 1) + 8 * v44) bufferCopy];
            [(TAVisitState *)self labelLoiTypeForLastVisitSnapshot:v45];

            ++v44;
          }
          while (v42 != v44);
          uint64_t v42 = [v40 countByEnumeratingWithState:&v47 objects:v63 count:16];
        }
        while (v42);
      }

      [(TAVisitState *)self openInterVisitBackupSnapshotWithArrivalVisit:v11];
      [(TAVisitState *)self closeVisitSnapshotWithStore:v10 visit:v11];
      if ([(TAVisitState *)self evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:v10 andAppendOutgoingRequestsTo:v12] == 1)
      {
        [(TAVisitState *)self openInterVisitSnapshotWithStore:v10 departureVisit:v11];
        v46 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        [(TAVisitState *)self issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:v46 store:v10 andAppendOutgoingRequestsTo:v12];

        [(TAVisitState *)self notifyObserversOfMetricsHint:0];
        [(TAVisitState *)self notifyObserversOfMetricsHint:2];
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
        -[TAVisitState performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:]();
      }
      break;
  }
}

- (void)openVisitSnapshotWithStore:(id)a3 visit:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  id v10 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TAVisitState creating new snapshot", buf, 2u);
  }
  id v11 = [[TAVisitSnapshot alloc] initWithTACLVisit:v9 uniqueUTBufferCap:[(TAVisitStateSettings *)self->_settings uniqueUTObservationCapPerVisit] displayEventBufferSizeCap:[(TAVisitStateSettings *)self->_settings visitDisplayBufferCapacity] maxNSigmaBetweenLastLocationAndVisit:[(TAVisitStateSettings *)self->_settings maxNSigmaBetweenLastLocationAndVisit]];
  id v12 = (void *)MEMORY[0x263F08798];
  __int16 v13 = [v9 arrivalDate];
  uint64_t v14 = [v9 departureDate];
  uint64_t v15 = [v12 createIntervalSafelyWithStartDate:v13 endDate:v14];

  uint64_t v16 = [v8 eventBuffer];
  uint64_t v17 = [v16 getAllTAEventsOf:objc_opt_class() between:v15];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        [(TAVisitSnapshot *)v11 addUTAdvertisement:*(void *)(*((void *)&v34 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [(TAVisitState *)self getDisplayEventsWithFirstPrecedingInInterval:v15 store:v8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        [(TAVisitSnapshot *)v11 addSystemState:*(void *)(*((void *)&v30 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v25);
  }
  id v28 = [(TACircularBuffer *)self->_visitSnapshotBuffer add:v11];
}

- (void)closeVisitSnapshotWithStore:(id)a3 visit:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 hasDepartureDate])
  {
    uint64_t v6 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];

    if (v6)
    {
      unint64_t v7 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      int v8 = [v7 isClosed];

      if (v8)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TAVisitState closeVisitSnapshotWithStore:visit:]();
        }
      }
      else
      {
        id v9 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        int v10 = [v9 setDepartureVisit:v5];

        if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TAVisitState closeVisitSnapshotWithStore:visit:]();
        }
        id v27 = v5;
        id v11 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          visitSnapshotBuffer = self->_visitSnapshotBuffer;
          __int16 v13 = v11;
          uint64_t v14 = [(TACircularBuffer *)visitSnapshotBuffer lastObject];
          uint64_t v15 = [v14 latestUtAdvertisements];
          *(_DWORD *)buf = 134349056;
          uint64_t v34 = [v15 count];
          _os_log_impl(&dword_22345C000, v13, OS_LOG_TYPE_DEFAULT, "#TAVisitState closing snapshot. Closed snapshot has %{public}lu objects.", buf, 0xCu);
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v16 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        uint64_t v17 = [v16 latestUtAdvertisements];
        id v18 = [v17 allKeys];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                uint64_t v25 = v23;
                uint64_t v26 = [v24 hexString];
                *(_DWORD *)buf = 138477827;
                uint64_t v34 = (uint64_t)v26;
                _os_log_impl(&dword_22345C000, v25, OS_LOG_TYPE_DEFAULT, "#TAVisitState keys in snapshot:%{private}@", buf, 0xCu);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v20);
        }

        id v5 = v27;
      }
    }
    else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      -[TAVisitState closeVisitSnapshotWithStore:visit:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState closeVisitSnapshotWithStore:visit:].cold.4();
  }
}

- (void)updateImportantLOIs:(id)a3 currentDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  importantLois = self->_importantLois;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  int v10 = [(NSMutableDictionary *)importantLois objectForKey:v9];

  if (!v10)
  {
    int v10 = [[TACircularBuffer alloc] initWithCapacity:[(TAVisitStateSettings *)self->_settings loiBufferPerTypeCapacity]];
    id v11 = self->_importantLois;
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
    [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];
  }
  __int16 v13 = [(TACircularBuffer *)v10 bufferCopy];
  unint64_t v14 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[TACircularBuffer count](v10, "count"), 1024, &__block_literal_global_3);

  if (v14 >= [(TACircularBuffer *)v10 count]) {
    id v16 = [(TACircularBuffer *)v10 add:v6];
  }
  else {
    id v15 = [(TACircularBuffer *)v10 insert:v6 at:v14];
  }
  uint64_t v17 = [(TACircularBuffer *)v10 firstObject];
  id v18 = [v17 getDate];
  [v7 timeIntervalSinceDate:v18];
  double v20 = v19;
  [(TAVisitStateSettings *)self->_settings loiBufferTimeIntervalOfRetention];
  double v22 = v21;

  if (v20 >= v22)
  {
    uint64_t v23 = (void *)MEMORY[0x263F08A98];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    long long v29 = __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke_2;
    long long v30 = &unk_2646AAFC8;
    id v31 = v7;
    long long v32 = self;
    uint64_t v24 = [v23 predicateWithBlock:&v27];
    id v25 = -[TACircularBuffer removeUntilFirstPredicateFail:](v10, "removeUntilFirstPredicateFail:", v24, v27, v28, v29, v30);
  }
  uint64_t v26 = [(TACircularBuffer *)v10 bufferCopy];
  [(TAVisitState *)self labelLoiTypeForLastVisitSnapshot:v26];
}

uint64_t __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 getDate];
  id v6 = [v4 getDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __48__TAVisitState_updateImportantLOIs_currentDate___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a2 getDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 40) + 56) loiBufferTimeIntervalOfRetention];
  BOOL v8 = v6 > v7;

  return v8;
}

- (void)labelLoiTypeForLastVisitSnapshot:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TACircularBuffer *)self->_visitSnapshotBuffer count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
          id v11 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
          [v11 updateLoiType:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)issueVisitEntryScanRequestIfNecessaryWithOpenSnapshot:(id)a3 clock:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v9 = a5;
  uint64_t v8 = [(TAScanRequest *)self->_scanRequest evaluateVisitEntry:a3 clock:a4];
  if (v8) {
    [v9 addObject:v8];
  }
}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:(id)a3 store:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isClosed])
  {
    id v11 = [v8 representativeVisit];
    long long v12 = [v11 departureDate];

    long long v13 = [v9 clock];
    uint64_t v14 = [v13 compare:v12];

    if (v14 == -1)
    {
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
        -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:]();
      }
    }
    else
    {
      long long v15 = (void *)MEMORY[0x263F08798];
      id v16 = [v9 clock];
      uint64_t v26 = v12;
      uint64_t v17 = [v15 createIntervalSafelyWithStartDate:v12 endDate:v16];

      scanRequest = self->_scanRequest;
      double v19 = [(TAVisitState *)self getDisplayEventsWithFirstPrecedingInInterval:v17 store:v9];
      double v20 = [v9 eventBuffer];
      double v21 = [v20 getAllTAEventsOf:objc_opt_class() between:v17];
      double v22 = [v9 deviceRecord];
      [v9 clock];
      uint64_t v24 = v23 = v10;
      id v25 = [(TAScanRequest *)scanRequest evaluateInterVisitAfterVisitExit:v8 displayEvents:v19 advertisements:v21 deviceRecord:v22 clock:v24];

      id v10 = v23;
      if (v25) {
        [v23 addObject:v25];
      }

      long long v12 = v26;
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:]();
  }
}

- (void)openInterVisitSnapshotWithStore:(id)a3 departureVisit:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [v6 departureDate];
  id v8 = (void *)MEMORY[0x263F08798];
  id v9 = [v6 departureDate];
  id v10 = [v6 detectionDate];

  id v11 = [v8 createIntervalSafelyWithStartDate:v9 endDate:v10];

  long long v12 = [[TAInterVisitMetricsSnapshot alloc] initWithTime:v16 maxUniqueAddresses:[(TAVisitStateSettings *)self->_settings uniqueUTObservationCapPerVisit]];
  [(TAVisitStateSettings *)self->_settings thresholdOfLocationRelevance];
  long long v13 = +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v11);
  uint64_t v14 = [v11 endDate];
  [(TAInterVisitMetricsSnapshot *)v12 updateInterVisitMetric:v13 store:v7 withUpdatedTime:v14 andCloseSnapshot:0];

  id v15 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer add:v12];
}

- (void)closeLatestInterVisitSnapshotWithStore:(id)a3 arrivalVisit:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ([(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer count])
  {
    id v7 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject];
    char v8 = [v7 isClosed];

    if ((v8 & 1) == 0)
    {
      id v9 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject];
      id v10 = [v9 lastUpdateTime];
      id v11 = [v6 arrivalDate];
      long long v12 = [v10 laterDate:v11];

      long long v13 = (void *)MEMORY[0x263F08798];
      uint64_t v14 = [v9 lastUpdateTime];
      id v15 = [v13 createIntervalSafelyWithStartDate:v14 endDate:v12];

      [(TAVisitStateSettings *)self->_settings thresholdOfLocationRelevance];
      id v16 = +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v17, v15);
      [v9 updateInterVisitMetric:v16 store:v17 withUpdatedTime:v12 andCloseSnapshot:1];

      [v9 visitEntryDelayCorrection:v6 store:v17];
    }
  }
}

- (void)openInterVisitBackupSnapshotWithArrivalVisit:(id)a3
{
  id v6 = [a3 arrivalDate];
  id v4 = [[TAInterVisitMetricsSnapshot alloc] initWithTime:v6 maxUniqueAddresses:[(TAVisitStateSettings *)self->_settings uniqueUTObservationCapPerVisit]];
  interVisitMetricsSnapshotBackup = self->_interVisitMetricsSnapshotBackup;
  self->_interVisitMetricsSnapshotBackup = v4;
}

- (void)resetInterVisitBackupSnapshot
{
  self->_interVisitMetricsSnapshotBackup = 0;
  MEMORY[0x270F9A758]();
}

- (unint64_t)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  *(void *)&v28[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(TACircularBuffer *)self->_visitSnapshotBuffer count])
  {
    char v8 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
    char v9 = [v8 isClosed];

    if (v9)
    {
      id v10 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
      [(TAVisitStateSettings *)self->_settings qualitySnapshotDwellDuration];
      double v12 = v11;
      [(TAVisitStateSettings *)self->_settings qualitySnapshotDisplayOnDuration];
      uint64_t v14 = [v10 evaluateSnapshotQualityWithMinDwellDuration:v12 minDisplayOnDuration:v13];
      unint64_t v15 = v14;
      if (v14 == 1)
      {
        double v22 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_22345C000, v22, OS_LOG_TYPE_DEFAULT, "#TAVisitState Visit snapshot quality is good.", (uint8_t *)&v27, 2u);
        }
        goto LABEL_24;
      }
      if (v14 != 2)
      {
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
          -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:]();
        }
        goto LABEL_24;
      }
      id v16 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = [v10 representativeVisit];
        double v19 = [v18 description];
        int v27 = 138477827;
        *(void *)uint64_t v28 = v19;
        _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEFAULT, "#TAVisitState Visit snapshot quality is bad. Performing operations to remove bad visit: %{private}@", (uint8_t *)&v27, 0xCu);
      }
      double v20 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject];

      if (v20)
      {
        double v21 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer lastObject];
        [v21 updateWithInterVisitMetricsSnapshot:self->_interVisitMetricsSnapshotBackup store:v6];
      }
      else
      {
        if (!self->_interVisitMetricsSnapshotBackup)
        {
LABEL_23:
          id v25 = [(TACircularBuffer *)self->_visitSnapshotBuffer removeLastObject];
LABEL_24:
          [(TAVisitState *)self resetInterVisitBackupSnapshot];

          goto LABEL_25;
        }
        uint64_t v23 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 68289026;
          v28[0] = 0;
          LOWORD(v28[1]) = 2082;
          *(void *)((char *)&v28[1] + 2) = "";
          _os_log_impl(&dword_22345C000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState using intervisit backup for first intervisit snapshot\"}", (uint8_t *)&v27, 0x12u);
        }
        id v24 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer add:self->_interVisitMetricsSnapshotBackup];
        double v21 = [(TACircularBuffer *)self->_visitSnapshotBuffer lastObject];
        [(TAVisitState *)self issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:v21 store:v6 andAppendOutgoingRequestsTo:v7];
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
      -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitState evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:]();
  }
  unint64_t v15 = 0;
LABEL_25:

  return v15;
}

- (id)getDisplayEventsWithFirstPrecedingInInterval:(id)a3 store:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 eventBuffer];
  char v8 = [v7 getAllTAEventsOf:objc_opt_class() andEventSubtype:2 between:v6];

  char v9 = (void *)MEMORY[0x263F08798];
  id v10 = [MEMORY[0x263EFF910] distantPast];
  double v11 = [v6 startDate];

  double v12 = [v9 createIntervalSafelyWithStartDate:v10 endDate:v11];

  double v13 = [v5 eventBuffer];

  uint64_t v14 = [v13 getAllTAEventsOf:objc_opt_class() andEventSubtype:2 between:v12];

  if (![v14 count]
    || [v14 count]
    && [v8 count]
    && ([v14 lastObject],
        unint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v8 firstObject],
        id v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 isEqual:v16],
        v16,
        v15,
        v17))
  {
    id v18 = v8;
  }
  else
  {
    double v19 = (void *)MEMORY[0x263EFF980];
    double v20 = [v14 lastObject];
    id v18 = [v19 arrayWithObject:v20];

    [v18 addObjectsFromArray:v8];
  }

  return v18;
}

BOOL __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = v3;
    if ([v4 isClosed])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v4 representativeVisit];
      id v7 = [v6 departureDate];
      [v5 timeIntervalSinceDate:v7];
      double v9 = v8;
      [*(id *)(*(void *)(a1 + 40) + 56) snapshotBufferTimeIntervalOfRetention];
      BOOL v11 = v9 > v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    double v12 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(v12);
    }
    BOOL v11 = 1;
  }

  return v11;
}

BOOL __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = v3;
    if ([v4 isClosed])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v4 lastUpdateTime];
      [v5 timeIntervalSinceDate:v6];
      double v8 = v7;
      [*(id *)(*(void *)(a1 + 40) + 56) snapshotBufferTimeIntervalOfRetention];
      BOOL v10 = v8 > v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v11 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(v11);
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (id)getLatestValidVisitArrivalDate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
  id v3 = [v2 reverseObjectEnumerator];

  id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isClosed])
        {
          double v8 = [v7 representativeVisit];
          id v4 = [v8 arrivalDate];

          goto LABEL_11;
        }
      }
      id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)getLatestValidVisit
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  v2 = [(TACircularBuffer *)self->_visitSnapshotBuffer bufferCopy];
  id v3 = [v2 reverseObjectEnumerator];

  if ([v3 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    id v4 = [**((id **)&v6[0] + 1) representativeVisit];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)mergeWithAnotherTAVisitState:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v47 = a3;
  id v4 = [v47 visitSnapshotBuffer];
  uint64_t v5 = [v4 bufferCopy];
  id v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ([v12 isClosed])
        {
          id v13 = [(TACircularBuffer *)self->_visitSnapshotBuffer insert:v12 at:0];
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v14 = [v47 interVisitMetricSnapshotBuffer];
  uint64_t v15 = [v14 bufferCopy];
  id v16 = [v15 reverseObjectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v80 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(v16);
        }
        double v22 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        if ([v22 isClosed])
        {
          id v23 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer insert:v22 at:0];
          ++v19;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v80 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v43 = v19;
  uint64_t v44 = v9;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = [v47 importantLois];
  uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v79 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v46 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v53 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v52 + 1) + 8 * k);
        uint64_t v28 = [v47 importantLois];
        long long v29 = [v28 objectForKeyedSubscript:v27];

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v30 = [v29 bufferCopy];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v78 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v49;
          do
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              if (*(void *)v49 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void **)(*((void *)&v48 + 1) + 8 * m);
              long long v36 = [v35 getDate];
              [(TAVisitState *)self updateImportantLOIs:v35 currentDate:v36];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v78 count:16];
          }
          while (v32);
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v79 count:16];
    }
    while (v25);
  }

  long long v37 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    visitSnapshotBuffer = self->_visitSnapshotBuffer;
    v39 = v37;
    uint64_t v40 = [(TACircularBuffer *)visitSnapshotBuffer count];
    unint64_t v41 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer count];
    uint64_t v42 = [(TAVisitState *)self importantLois];
    *(_DWORD *)buf = 68290307;
    int v65 = 0;
    __int16 v66 = 2082;
    uint64_t v67 = "";
    __int16 v68 = 2049;
    uint64_t v69 = v44;
    __int16 v70 = 2049;
    uint64_t v71 = v43;
    __int16 v72 = 2049;
    uint64_t v73 = v40;
    __int16 v74 = 2049;
    unint64_t v75 = v41;
    __int16 v76 = 2113;
    v77 = v42;
    _os_log_impl(&dword_22345C000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState merging with other TAVisitState\", \"numVisitSnapshotsAttemptedToAdd\":%{private}llu, \"numInterVisitSnapshotsAttemptedToAdded\":%{private}llu, \"self.numVisitSnapshot\":%{private}lu, \"self.numInterVisitSnapshot\":%{private}lu, \"self.importantLois\":\"%{private}@\"}", buf, 0x44u);
  }
}

- (BOOL)shouldCreateNewVisitSnapshotFromUnknownState:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isTemporalOrderSensical] && objc_msgSend(v4, "hasDepartureDate"))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(TAVisitState *)self visitSnapshotBuffer];
    id v6 = [v5 bufferCopy];
    uint64_t v7 = [v6 reverseObjectEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) representativeVisit];
          id v13 = [v12 dateInterval];
          uint64_t v14 = [v4 dateInterval];
          char v15 = [v13 intersectsDateInterval:v14];

          if (v15)
          {
            BOOL v16 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_14:
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)recoverInterVisitSnapshotWithArrivalVisit:(id)a3 store:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 eventBuffer];
  uint64_t v9 = [v8 getEarliestEventDate];

  uint64_t v10 = [v6 arrivalDate];
  long long v11 = v10;
  if (v9 && v10 && [v10 compare:v9] != -1)
  {
    long long v12 = [MEMORY[0x263F08798] createIntervalSafelyWithStartDate:v9 endDate:v11];
    id v13 = [TAInterVisitMetricsSnapshot alloc];
    uint64_t v14 = [v12 startDate];
    char v15 = [(TAInterVisitMetricsSnapshot *)v13 initWithTime:v14 maxUniqueAddresses:[(TAVisitStateSettings *)self->_settings uniqueUTObservationCapPerVisit]];

    [(TAVisitStateSettings *)self->_settings thresholdOfLocationRelevance];
    BOOL v16 = +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v7, v12);
    uint64_t v17 = [v12 endDate];
    [(TAInterVisitMetricsSnapshot *)v15 updateInterVisitMetric:v16 store:v7 withUpdatedTime:v17 andCloseSnapshot:1];

    id v18 = [(TACircularBuffer *)self->_interVisitMetricSnapshotBuffer add:v15];
    long long v19 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      uint64_t v24 = "";
      __int16 v25 = 2113;
      uint64_t v26 = v12;
      __int16 v27 = 2113;
      id v28 = v6;
      _os_log_impl(&dword_22345C000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState recovered intervisit snapshot\", \"interval\":\"%{private}@\", \"arrivalVisit\":\"%{private}@\"}", (uint8_t *)&v21, 0x26u);
    }
  }
  else
  {
    long long v20 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289026;
      int v22 = 0;
      __int16 v23 = 2082;
      uint64_t v24 = "";
      _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAVisitState aborting intervisit snapshot recovery due unreasonable dates\"}", (uint8_t *)&v21, 0x12u);
    }
  }
}

- (id)description
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"StateType";
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v14[1] = @"State";
  v15[0] = v4;
  uint64_t v5 = +[TAVisitState visitStateTypeToString:self->_state];
  v15[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  id v13 = 0;
  id v7 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    uint64_t v9 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAVisitState *)v9 description];
    }
    id v10 = [NSString string];
  }
  else
  {
    id v10 = v7;
  }
  long long v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (TAVisitState *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      unint64_t v7 = [(TAVisitState *)self state];
      if (v7 != [(TAVisitState *)v6 state])
      {
        char v11 = 0;
LABEL_40:

        goto LABEL_41;
      }
      id v8 = [(TAVisitState *)self visitSnapshotBuffer];
      uint64_t v9 = [(TAVisitState *)v6 visitSnapshotBuffer];
      if (v8 != v9)
      {
        id v10 = [(TAVisitState *)self visitSnapshotBuffer];
        long long v49 = [(TAVisitState *)v6 visitSnapshotBuffer];
        long long v50 = v10;
        if (!objc_msgSend(v10, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_38;
        }
      }
      long long v12 = [(TAVisitState *)self interVisitMetricSnapshotBuffer];
      id v13 = [(TAVisitState *)v6 interVisitMetricSnapshotBuffer];
      if (v12 != v13)
      {
        id v3 = [(TAVisitState *)self interVisitMetricSnapshotBuffer];
        long long v48 = [(TAVisitState *)v6 interVisitMetricSnapshotBuffer];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v11 = 0;
LABEL_36:

LABEL_37:
          if (v8 == v9)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
      }
      uint64_t v14 = [(TAVisitState *)self importantLois];
      uint64_t v15 = [(TAVisitState *)v6 importantLois];
      id v47 = (void *)v14;
      BOOL v16 = v14 == v15;
      uint64_t v17 = (void *)v15;
      if (!v16)
      {
        id v18 = [(TAVisitState *)self importantLois];
        uint64_t v42 = [(TAVisitState *)v6 importantLois];
        uint64_t v43 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v11 = 0;
          long long v19 = v47;
LABEL_34:

LABEL_35:
          if (v12 == v13) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }
      uint64_t v20 = [(TAVisitState *)self settings];
      uint64_t v45 = [(TAVisitState *)v6 settings];
      uint64_t v46 = (void *)v20;
      uint64_t v44 = v17;
      if (v20 == v45)
      {
        v38 = v13;
      }
      else
      {
        int v21 = v3;
        int v22 = [(TAVisitState *)self settings];
        uint64_t v40 = [(TAVisitState *)v6 settings];
        unint64_t v41 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          char v11 = 0;
          __int16 v25 = (void *)v45;
          id v3 = v21;
LABEL_32:

LABEL_33:
          uint64_t v17 = v44;
          long long v19 = v47;
          if (v47 == v44) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        v38 = v13;
        id v3 = v21;
      }
      __int16 v23 = [(TAVisitState *)self scanRequest];
      uint64_t v39 = [(TAVisitState *)v6 scanRequest];
      if (v23 == (void *)v39)
      {
        uint64_t v34 = v3;
        uint64_t v35 = v12;
      }
      else
      {
        uint64_t v24 = [(TAVisitState *)self scanRequest];
        long long v36 = [(TAVisitState *)v6 scanRequest];
        long long v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          char v11 = 0;
          id v13 = v38;
          uint64_t v31 = (void *)v39;
          goto LABEL_30;
        }
        uint64_t v34 = v3;
        uint64_t v35 = v12;
      }
      uint64_t v26 = [(TAVisitState *)self interVisitMetricsSnapshotBackup];
      uint64_t v27 = [(TAVisitState *)v6 interVisitMetricsSnapshotBackup];
      if (v26 == (void *)v27)
      {

        char v11 = 1;
      }
      else
      {
        id v28 = (void *)v27;
        [(TAVisitState *)self interVisitMetricsSnapshotBackup];
        v29 = uint64_t v33 = v23;
        long long v30 = [(TAVisitState *)v6 interVisitMetricsSnapshotBackup];
        char v11 = [v29 isEqual:v30];

        __int16 v23 = v33;
      }
      id v13 = v38;
      uint64_t v31 = (void *)v39;
      id v3 = v34;
      long long v12 = v35;
      if (v23 == (void *)v39)
      {
LABEL_31:

        __int16 v25 = (void *)v45;
        if (v46 == (void *)v45) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_41:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitState)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TAVisitState;
  uint64_t v5 = [(TAVisitState *)&v35 init];
  if (v5)
  {
    v5->_unint64_t state = [v4 decodeIntegerForKey:@"State"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (TAVisitStateSettings *)v6;

    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    char v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"VisitBuffer"];
    visitSnapshotBuffer = v5->_visitSnapshotBuffer;
    v5->_visitSnapshotBuffer = (TACircularBuffer *)v12;

    uint64_t v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"InterVisitBuffer"];
    interVisitMetricSnapshotBuffer = v5->_interVisitMetricSnapshotBuffer;
    v5->_interVisitMetricSnapshotBuffer = (TACircularBuffer *)v18;

    uint64_t v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    __int16 v25 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"LOIs"];
    importantLois = v5->_importantLois;
    v5->_importantLois = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScanReq"];
    scanRequest = v5->_scanRequest;
    v5->_scanRequest = (TAScanRequest *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InterBackup"];
    interVisitMetricsSnapshotBackup = v5->_interVisitMetricsSnapshotBackup;
    v5->_interVisitMetricsSnapshotBackup = (TAInterVisitMetricsSnapshot *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"State"];
  [v5 encodeObject:self->_settings forKey:@"Settings"];
  [v5 encodeObject:self->_visitSnapshotBuffer forKey:@"VisitBuffer"];
  [v5 encodeObject:self->_interVisitMetricSnapshotBuffer forKey:@"InterVisitBuffer"];
  [v5 encodeObject:self->_importantLois forKey:@"LOIs"];
  [v5 encodeObject:self->_scanRequest forKey:@"ScanReq"];
  [v5 encodeObject:self->_interVisitMetricsSnapshotBackup forKey:@"InterBackup"];
}

- (unint64_t)lastStateTransition
{
  return self->_lastStateTransition;
}

- (NSMutableDictionary)importantLois
{
  return self->_importantLois;
}

- (NSMutableArray)nextPredictedLOIs
{
  return self->_nextPredictedLOIs;
}

- (void)setNextPredictedLOIs:(id)a3
{
}

- (TAVisitStateSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (TAScanRequest)scanRequest
{
  return self->_scanRequest;
}

- (void)setScanRequest:(id)a3
{
}

- (TAInterVisitMetricsSnapshot)interVisitMetricsSnapshotBackup
{
  return self->_interVisitMetricsSnapshotBackup;
}

- (void)setInterVisitMetricsSnapshotBackup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interVisitMetricsSnapshotBackup, 0);
  objc_storeStrong((id *)&self->_scanRequest, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_nextPredictedLOIs, 0);
  objc_storeStrong((id *)&self->_importantLois, 0);
  objc_storeStrong((id *)&self->_interVisitMetricSnapshotBuffer, 0);
  objc_storeStrong((id *)&self->_visitSnapshotBuffer, 0);
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22345C000, v5, v6, "#TAVisitState Considering to add %{private}s for snapshot", v7, v8, v9, v10, v11);
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22345C000, v5, v6, "Updating %{private}s to snapshot", v7, v8, v9, v10, v11);
}

- (void)ingestTAEvent:(void *)a1 store:appendOutgoingRequestsTo:.cold.3(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = [(id)OUTLINED_FUNCTION_8() description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_22345C000, v6, v7, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)ingestTAEvent:(void *)a1 store:(void *)a2 appendOutgoingRequestsTo:.cold.4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22345C000, v5, v6, "#TAVisitState Adding %{private}s to snapshot", v7, v8, v9, v10, v11);
}

- (void)setState:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState update did not change state on update", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState unexpected state", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = [(id)OUTLINED_FUNCTION_8() description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_22345C000, v6, v7, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState inside visit state without snapshot", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState inside visit state with a closed snapshot", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.5(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = [(id)OUTLINED_FUNCTION_8() description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_22345C000, v6, v7, "#TAVisitState not considering %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState received out of order departure and arrival date", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:.cold.7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState got a departure visit while outside a visit", v2, v3, v4, v5, v6);
}

- (void)stateTransitionDecisionGivenTACLVisit:(void *)a1 .cold.9(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = [(id)OUTLINED_FUNCTION_8() description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_22345C000, v6, v7, "#TAVisitState not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState unrecognizable transition decision", v2, v3, v4, v5, v6);
}

- (void)performStateTransitionDecision:store:visit:andAppendOutgoingRequestsTo:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_22345C000, v0, OS_LOG_TYPE_DEBUG, "#TAVisitState maintaining current state", v1, 2u);
}

- (void)closeVisitSnapshotWithStore:visit:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState attempted to close visit snapshot that doesnt exist!", v2, v3, v4, v5, v6);
}

- (void)closeVisitSnapshotWithStore:visit:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState attempted to close visit snapshot that is already closed", v2, v3, v4, v5, v6);
}

- (void)closeVisitSnapshotWithStore:visit:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState failed to set departure visit", v2, v3, v4, v5, v6);
}

- (void)closeVisitSnapshotWithStore:visit:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState attempted to close visit snapshot without valid visit departure date", v2, v3, v4, v5, v6);
}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot called with a date in the future", v2, v3, v4, v5, v6);
}

- (void)issueInterVisitScanRequestIfNecessaryWithClosedSnapshot:store:andAppendOutgoingRequestsTo:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState issueInterVisitScanRequestIfNecessaryWithClosedSnapshot called with an open snapshot", v2, v3, v4, v5, v6);
}

- (void)updateInterVisitSnapshotWithStore:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState Attempted to update inter-visit snapshot but there is no viable one. Something is wrong.", v2, v3, v4, v5, v6);
}

- (void)updateInterVisitBackupSnapshotWithStore:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState Attempted to update inter-visit backup snapshot but there is no viable one.", v2, v3, v4, v5, v6);
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState attempting to evaluate visit snapshot quality without visit snapshot", v2, v3, v4, v5, v6);
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitState snapshot evaluation error.", v2, v3, v4, v5, v6);
}

- (void)evaluateLatestVisitSnapshotAndRecoverIfNecessaryWithStore:andAppendOutgoingRequestsTo:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitState attempting to evaluate visit snapshot quality with an open visit snapshot", v2, v3, v4, v5, v6);
}

void __56__TAVisitState_purgeVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22345C000, v4, v5, "#TAVisitState seeing class type %@ in a predicate supposed to be used for TAVisitSnapshot object only", v6, v7, v8, v9, v10);
}

void __61__TAVisitState_purgeInterVisitSnapshotBufferWithCurrentDate___block_invoke_cold_1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22345C000, v4, v5, "#TAVisitState seeing class type %@ in a predicate supposed to be used for TAInterVisitMetricsSnapshot object only", v6, v7, v8, v9, v10);
}

- (void)description
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_3();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_22345C000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", v7, 0x16u);
}

@end