@interface TAStore
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAddTACLVisit:(id)a3;
- (BOOL)shouldAddTALocationLite:(id)a3;
- (BOOL)shouldAddTASPAdvertisement:(id)a3;
- (NSDate)clock;
- (NSHashTable)observers;
- (NSString)description;
- (TADeviceRecord)deviceRecord;
- (TAEventBuffer)eventBuffer;
- (TAStore)initWithEventBufferSettings:(id)a3 scanRequestSettings:(id)a4 visitStateSettings:(id)a5 deviceRecordSettings:(id)a6;
- (TAVisitState)visitState;
- (id)fetchTAUnknownBeacon:(id)a3;
- (unint64_t)hash;
- (void)addObserver:(id)a3;
- (void)addTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)requestAIS:(id)a3;
- (void)setObservers:(id)a3;
- (void)updateClock:(id)a3;
- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5;
- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4;
@end

@implementation TAStore

- (void)addTAEvent:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TAStore *)self updateClock:v6];
  if (!v7)
  {
    v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
      -[TAStore addTAEvent:andAppendOutgoingRequestsTo:](v8);
    }
  }
  if ([v6 isMemberOfClass:objc_opt_class()])
  {
    if (![(TAStore *)self shouldAddTASPAdvertisement:v6]) {
      goto LABEL_15;
    }
  }
  else if ([v6 isMemberOfClass:objc_opt_class()])
  {
    if (![(TAStore *)self shouldAddTALocationLite:v6]) {
      goto LABEL_15;
    }
  }
  else if ([v6 isMemberOfClass:objc_opt_class()] {
         && ![(TAStore *)self shouldAddTACLVisit:v6])
  }
  {
    goto LABEL_15;
  }
  [(TAEventBuffer *)self->_eventBuffer ingestTAEvent:v6];
  [(TADeviceRecord *)self->_deviceRecord ingestTAEvent:v6 andAppendOutgoingRequestsTo:v7];
  [(TAVisitState *)self->_visitState ingestTAEvent:v6 store:self appendOutgoingRequestsTo:v7];
  if ([(TAVisitState *)self->_visitState isInSensitiveVisit]
    && [v6 isMemberOfClass:objc_opt_class()])
  {
    [(TADeviceRecord *)self->_deviceRecord forceStagedDetectionsToSurfaceImmediatelyWithAdvertisement:v6 withReason:1];
  }
LABEL_15:
  [(TAEventBuffer *)self->_eventBuffer purgeWithClock:self->_clock];
  [(TAVisitState *)self->_visitState purgeWithClock:self->_clock];
  [(TADeviceRecord *)self->_deviceRecord purgeWithClock:self->_clock andAppendOutgoingRequestsTo:v7];
  [(TADeviceRecord *)self->_deviceRecord checkForScanRequestsWithClock:self->_clock andAppendOutgoingRequestsTo:v7];
}

- (TADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (NSDate)clock
{
  return self->_clock;
}

- (void)updateClock:(id)a3
{
  clock = self->_clock;
  id v7 = [a3 getDate];
  v5 = [(NSDate *)clock laterDate:v7];
  id v6 = self->_clock;
  self->_clock = v5;
}

- (BOOL)shouldAddTALocationLite:(id)a3
{
  id v4 = a3;
  [v4 horizontalAccuracy];
  if (v5 >= 0.0)
  {
    [v4 horizontalAccuracy];
    if (v7 > 70.0)
    {
      v8 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAStore shouldAddTALocationLite:](v8);
      }
      goto LABEL_10;
    }
    if ([v4 isSimulatedOrSpoofed])
    {
      v9 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAStore shouldAddTALocationLite:](v9);
      }
      goto LABEL_10;
    }
    lastLocationDate = self->_lastLocationDate;
    v13 = [v4 getDate];
    v14 = v13;
    if (lastLocationDate)
    {
      uint64_t v15 = [(NSDate *)lastLocationDate compare:v13];

      if (v15 != -1)
      {
LABEL_20:
        BOOL v10 = 1;
        goto LABEL_11;
      }
      v16 = [v4 getDate];
      [v16 timeIntervalSinceDate:self->_lastLocationDate];
      double v18 = v17;

      if (v18 < 15.0)
      {
        v19 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
          -[TAStore shouldAddTALocationLite:].cold.4(v19, v4);
        }
        goto LABEL_10;
      }
      v21 = [v4 getDate];
      v20 = self->_lastLocationDate;
      self->_lastLocationDate = v21;
    }
    else
    {
      v20 = self->_lastLocationDate;
      self->_lastLocationDate = v13;
    }

    goto LABEL_20;
  }
  id v6 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TAStore shouldAddTALocationLite:](v6);
  }
LABEL_10:
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)shouldAddTASPAdvertisement:(id)a3
{
  id v3 = a3;
  if ([v3 getDeviceType] != 1
    && [v3 getDeviceType] != 2
    && [v3 getDeviceType] != 3
    && [v3 getDeviceType] != 4)
  {
    v9 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      -[TAStore shouldAddTASPAdvertisement:].cold.4(v9);
    }
    goto LABEL_17;
  }
  uint64_t v4 = [v3 getType];
  switch(v4)
  {
    case 2:
      id v6 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAStore shouldAddTASPAdvertisement:](v6);
      }
      break;
    case 1:
      v8 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAStore shouldAddTASPAdvertisement:](v8);
      }
      goto LABEL_17;
    case 0:
      double v5 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
        -[TAStore shouldAddTASPAdvertisement:](v5);
      }
LABEL_17:
      BOOL v7 = 0;
      goto LABEL_18;
  }
  BOOL v7 = 1;
LABEL_18:

  return v7;
}

- (TAEventBuffer)eventBuffer
{
  return self->_eventBuffer;
}

- (TAVisitState)visitState
{
  return self->_visitState;
}

- (TAStore)initWithEventBufferSettings:(id)a3 scanRequestSettings:(id)a4 visitStateSettings:(id)a5 deviceRecordSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAStore;
  v14 = [(TAStore *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263EFF910] distantPast];
    clock = v14->_clock;
    v14->_clock = (NSDate *)v15;

    double v17 = [[TAVisitState alloc] initWithSettings:v12 scanRequestSettings:v11];
    visitState = v14->_visitState;
    v14->_visitState = v17;

    v19 = [[TADeviceRecord alloc] initWithSettings:v13];
    deviceRecord = v14->_deviceRecord;
    v14->_deviceRecord = v19;

    [(TADeviceRecord *)v14->_deviceRecord setDelegate:v14];
    v21 = [[TAEventBuffer alloc] initWithSettings:v10];
    eventBuffer = v14->_eventBuffer;
    v14->_eventBuffer = v21;

    uint64_t v23 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v23;

    [(TAVisitState *)v14->_visitState addObserver:v14];
  }

  return v14;
}

- (id)fetchTAUnknownBeacon:(id)a3
{
  return [(TADeviceRecord *)self->_deviceRecord getUnknownBeacon:a3];
}

- (void)requestAIS:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    BOOL v7 = [v4 identifier];
    id v8 = [v7 UUIDString];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = [v8 UTF8String];
    _os_log_impl(&dword_22345C000, v6, OS_LOG_TYPE_DEFAULT, "#TAStore request for AIS fetch %{public}s", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = [(TAStore *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 didRequestAIS:v4];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)visitState:(id)a3 didChangeStateFromType:(unint64_t)a4 toType:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TAStore visitState:didChangeStateFromType:toType:](v9);
  }
  [(TADeviceRecord *)self->_deviceRecord updateDeviceRecordOnSessionChange:v8 WithCurrentDate:self->_clock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(NSHashTable *)self->_observers allObjects];
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
          [v15 visitState:v8 didChangeStateFromType:a4 toType:a5];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)visitState:(id)a3 didIssueMetricsSubmissionHint:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = [(NSHashTable *)self->_observers allObjects];
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
          [v12 visitState:v6 didIssueMetricsSubmissionHint:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)shouldAddTACLVisit:(id)a3
{
  id v3 = a3;
  if ([v3 confidence] != 2)
  {
    double v5 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      -[TAStore shouldAddTACLVisit:](v5);
    }
    goto LABEL_8;
  }
  if (([v3 isTemporalOrderSensical] & 1) == 0)
  {
    id v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAStore shouldAddTACLVisit:](v6);
    }
LABEL_8:
    BOOL v4 = 0;
    goto LABEL_9;
  }
  BOOL v4 = 1;
LABEL_9:

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_clock hash];
  uint64_t v4 = [(TAEventBuffer *)self->_eventBuffer hash] ^ v3;
  uint64_t v5 = [(TADeviceRecord *)self->_deviceRecord hash];
  return v4 ^ v5 ^ [(TAVisitState *)self->_visitState hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = [(TAStore *)self eventBuffer];
    uint64_t v8 = [v6 eventBuffer];
    if (v7 != v8)
    {
      uint64_t v9 = [(TAStore *)self eventBuffer];
      uint64_t v3 = [v6 eventBuffer];
      v32 = v9;
      if (![v9 isEqual:v3])
      {
        char v10 = 0;
        goto LABEL_23;
      }
    }
    uint64_t v11 = [(TAStore *)self deviceRecord];
    uint64_t v12 = [v6 deviceRecord];
    if (v11 != v12)
    {
      long long v13 = [(TAStore *)self deviceRecord];
      v30 = [v6 deviceRecord];
      if (!objc_msgSend(v13, "isEqual:"))
      {
        char v10 = 0;
LABEL_21:

LABEL_22:
        if (v7 == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        goto LABEL_24;
      }
      v29 = v13;
    }
    uint64_t v14 = [(TAStore *)self visitState];
    long long v15 = [v6 visitState];
    v31 = (void *)v14;
    if ((void *)v14 == v15)
    {
      v25 = v12;
      objc_super v26 = v11;
    }
    else
    {
      long long v16 = [(TAStore *)self visitState];
      v27 = [v6 visitState];
      v28 = v16;
      if (!objc_msgSend(v16, "isEqual:"))
      {
        char v10 = 0;
        uint64_t v22 = v31;
        goto LABEL_19;
      }
      v25 = v12;
      objc_super v26 = v11;
    }
    long long v17 = [(TAStore *)self clock];
    uint64_t v18 = [v6 clock];
    if (v17 == (void *)v18)
    {

      char v10 = 1;
    }
    else
    {
      long long v19 = (void *)v18;
      [(TAStore *)self clock];
      v20 = v24 = v3;
      uint64_t v21 = [v6 clock];
      char v10 = [v20 isEqual:v21];

      uint64_t v3 = v24;
    }
    uint64_t v22 = v31;
    uint64_t v12 = v25;
    uint64_t v11 = v26;
    if (v31 == v15)
    {
LABEL_20:

      long long v13 = v29;
      if (v11 == v12) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  char v10 = 0;
LABEL_25:

  return v10;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TAStore *)self clock];
  id v6 = [v3 stringWithFormat:@"<%@: %p; clock: '%@'>", v4, self, v5];

  return (NSString *)v6;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
  objc_storeStrong((id *)&self->_visitState, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_lastLocationDate, 0);
}

- (void)visitState:(os_log_t)log didChangeStateFromType:toType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22345C000, log, OS_LOG_TYPE_DEBUG, "#TAStore received visit state update", v1, 2u);
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTASPAdvertisement:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22345C000, log, OS_LOG_TYPE_DEBUG, "#TAStore WILD advertisement found, adding to store", v1, 2u);
}

- (void)shouldAddTASPAdvertisement:(void *)a1 .cold.4(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.3(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)shouldAddTALocationLite:(void *)a1 .cold.4(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 UTF8String];
  objc_msgSend(NSString, "stringWithFormat:", @"sampling policy at one location every %.2lf seconds", 0x402E000000000000);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 UTF8String];
  id v9 = [a2 description];
  *(_DWORD *)buf = 136446723;
  uint64_t v11 = v6;
  __int16 v12 = 2081;
  uint64_t v13 = v8;
  __int16 v14 = 2081;
  uint64_t v15 = [v9 UTF8String];
  _os_log_debug_impl(&dword_22345C000, v3, OS_LOG_TYPE_DEBUG, "#TAStore not adding %{public}s due to %{private}s:%{private}s", buf, 0x20u);
}

- (void)shouldAddTACLVisit:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_9();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  [v4 UTF8String];
  id v5 = [(id)OUTLINED_FUNCTION_8() description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_22345C000, v1, OS_LOG_TYPE_ERROR, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v6, 0x20u);
}

- (void)shouldAddTACLVisit:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_2_2(&dword_22345C000, v6, v7, "#TAStore not adding %{public}s due to %{public}s:%{private}s", v8, v9, v10, v11, v12);
}

- (void)addTAEvent:(os_log_t)log andAppendOutgoingRequestsTo:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22345C000, log, OS_LOG_TYPE_FAULT, "#TAStore addTAEvent called with nil requests parameter", v1, 2u);
}

@end