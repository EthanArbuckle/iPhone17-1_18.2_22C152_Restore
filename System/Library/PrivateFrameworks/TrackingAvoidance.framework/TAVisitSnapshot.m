@interface TAVisitSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isClosed;
- (BOOL)isEqual:(id)a3;
- (BOOL)latestLocationInsideVisit;
- (BOOL)setDepartureVisit:(id)a3;
- (NSDate)entryDurationOfConsiderationClosed;
- (NSDate)exitIntervalBeginning;
- (NSDate)lastLoiTypeUpdateTime;
- (NSMutableArray)displayEvents;
- (NSMutableDictionary)earliestUtAdvertisements;
- (NSMutableDictionary)latestUtAdvertisements;
- (NSMutableOrderedSet)lruUtAdvertisementCache;
- (NSNumber)distanceToClosestLoi;
- (TACLVisit)representativeVisit;
- (TADisplayOnCalculator)displayOnCalculator;
- (TALocationLite)latestLocation;
- (TAVisitSnapshot)initWithCoder:(id)a3;
- (TAVisitSnapshot)initWithTACLVisit:(id)a3 uniqueUTBufferCap:(unint64_t)a4 displayEventBufferSizeCap:(unint64_t)a5 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a6;
- (double)getDisplayOnTimeUntilEndDate:(id)a3;
- (double)getDurationOfVisitEntryConsideredWithDisplayOnBudget:(double)a3;
- (double)getDurationOfVisitExitConsideredWithDisplayOnBudget:(double)a3;
- (id)getArrivalDelay;
- (id)getDepartureDelay;
- (id)getEntryAdvertisementsWithDisplayOnBudget:(double)a3;
- (id)getEntryIntervalEvaluatedUntil;
- (id)getExitAdvertisementsWithDisplayOnBudget:(double)a3;
- (id)getLocationRepresentingSnapshot;
- (id)mostRecentAdvertisementDate;
- (unint64_t)displayEventBufferSizeCap;
- (unint64_t)evaluateSnapshotQualityWithMinDwellDuration:(double)a3 minDisplayOnDuration:(double)a4;
- (unint64_t)loiType;
- (unint64_t)maxNSigmaBetweenLastLocationAndVisit;
- (unint64_t)uniqueUTBufferSizeCap;
- (void)addScanState:(id)a3;
- (void)addSystemState:(id)a3;
- (void)addUTAdvertisement:(id)a3;
- (void)calculateExitIntervalWithDisplayOnBudget:(double)a3;
- (void)closeSnapshotCleanup;
- (void)encodeWithCoder:(id)a3;
- (void)pruneDisplayEvents;
- (void)setDisplayEventBufferSizeCap:(unint64_t)a3;
- (void)setDisplayEvents:(id)a3;
- (void)setDisplayOnCalculator:(id)a3;
- (void)setDistanceToClosestLoi:(id)a3;
- (void)setEntryDurationOfConsiderationClosed:(id)a3;
- (void)setExitIntervalBeginning:(id)a3;
- (void)setLastLoiTypeUpdateTime:(id)a3;
- (void)setLruUtAdvertisementCache:(id)a3;
- (void)setMaxNSigmaBetweenLastLocationAndVisit:(unint64_t)a3;
- (void)setRepresentativeVisit:(id)a3;
- (void)setUniqueUTBufferSizeCap:(unint64_t)a3;
- (void)updateEntryIntervalWithDisplayOnBudget:(double)a3 evaluateToEnd:(BOOL)a4;
- (void)updateLatestLocation:(id)a3;
- (void)updateLoiType:(id)a3;
@end

@implementation TAVisitSnapshot

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (unint64_t)loiType
{
  return self->_loiType;
}

- (TALocationLite)latestLocation
{
  return self->_latestLocation;
}

- (void)updateLatestLocation:(id)a3
{
  v4 = (TALocationLite *)[a3 copy];
  latestLocation = self->_latestLocation;
  self->_latestLocation = v4;

  if (self->_latestLocation)
  {
    v6 = [TALocationLite alloc];
    v7 = [(TACLVisit *)self->_representativeVisit getDate];
    [(TACLVisit *)self->_representativeVisit coordinate];
    double v9 = v8;
    [(TACLVisit *)self->_representativeVisit coordinate];
    double v11 = v10;
    [(TACLVisit *)self->_representativeVisit horizontalAccuracy];
    v13 = [(TALocationLite *)v6 initWithTimestamp:v7 latitude:v9 longitude:v11 horizontalAccuracy:v12];

    self->_latestLocationInsideVisit = ![(TALocationLite *)self->_latestLocation distanceToLocation:v13 satisfyNSigma:self->_maxNSigmaBetweenLastLocationAndVisit satisfyMinDistance:0.0];
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
  {
    -[TAVisitSnapshot updateLatestLocation:]();
  }
  v14 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    -[TAVisitSnapshot updateLatestLocation:]((uint64_t)self, v14);
  }
}

- (TAVisitSnapshot)initWithTACLVisit:(id)a3 uniqueUTBufferCap:(unint64_t)a4 displayEventBufferSizeCap:(unint64_t)a5 maxNSigmaBetweenLastLocationAndVisit:(unint64_t)a6
{
  id v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TAVisitSnapshot;
  double v11 = [(TAVisitSnapshot *)&v37 init];
  double v12 = v11;
  if (v11)
  {
    v11->_isClosed = 0;
    uint64_t v13 = [v10 copy];
    representativeVisit = v12->_representativeVisit;
    v12->_representativeVisit = (TACLVisit *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    latestUtAdvertisements = v12->_latestUtAdvertisements;
    v12->_latestUtAdvertisements = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    earliestUtAdvertisements = v12->_earliestUtAdvertisements;
    v12->_earliestUtAdvertisements = v17;

    v19 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    lruUtAdvertisementCache = v12->_lruUtAdvertisementCache;
    v12->_lruUtAdvertisementCache = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    displayEvents = v12->_displayEvents;
    v12->_displayEvents = v21;

    v12->_uniqueUTBufferSizeCap = a4;
    v12->_displayEventBufferSizeCap = a5;
    v23 = [TALocationLite alloc];
    v24 = [v10 getDate];
    [v10 coordinate];
    double v26 = v25;
    [v10 coordinate];
    double v28 = v27;
    [v10 horizontalAccuracy];
    uint64_t v30 = [(TALocationLite *)v23 initWithTimestamp:v24 latitude:v26 longitude:v28 horizontalAccuracy:v29];
    latestLocation = v12->_latestLocation;
    v12->_latestLocation = (TALocationLite *)v30;

    v12->_loiType = 0;
    uint64_t v32 = [MEMORY[0x263EFF910] distantPast];
    lastLoiTypeUpdateTime = v12->_lastLoiTypeUpdateTime;
    v12->_lastLoiTypeUpdateTime = (NSDate *)v32;

    distanceToClosestLoi = v12->_distanceToClosestLoi;
    v12->_distanceToClosestLoi = 0;

    v12->_latestLocationInsideVisit = 1;
    entryDurationOfConsiderationClosed = v12->_entryDurationOfConsiderationClosed;
    v12->_entryDurationOfConsiderationClosed = 0;

    v12->_maxNSigmaBetweenLastLocationAndVisit = a6;
  }

  return v12;
}

- (void)setRepresentativeVisit:(id)a3
{
  id v4 = a3;
  if ([(TAVisitSnapshot *)self isClosed])
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitSnapshot setRepresentativeVisit:]();
    }
  }
  else
  {
    representativeVisit = self->_representativeVisit;
    p_representativeVisit = &self->_representativeVisit;
    v7 = [(TACLVisit *)representativeVisit arrivalDate];
    double v8 = [v4 departureDate];
    double v9 = [v7 laterDate:v8];

    id v10 = [TACLVisit alloc];
    [v4 coordinate];
    double v12 = v11;
    double v14 = v13;
    [v4 horizontalAccuracy];
    double v16 = v15;
    v17 = [(TACLVisit *)*p_representativeVisit arrivalDate];
    v18 = [v4 detectionDate];
    uint64_t v19 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v10, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v17, v9, v18, [v4 confidence], v12, v14, v16);
    v20 = *p_representativeVisit;
    *p_representativeVisit = (TACLVisit *)v19;

    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      [(TAVisitSnapshot *)v21 setRepresentativeVisit:(id *)p_representativeVisit];
    }
  }
}

- (id)getEntryIntervalEvaluatedUntil
{
  displayOnCalculator = self->_displayOnCalculator;
  if (displayOnCalculator)
  {
    displayOnCalculator = [displayOnCalculator evaluatedUntil];
  }
  return displayOnCalculator;
}

- (void)addScanState:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 state] == 1)
  {
    v5 = (void *)MEMORY[0x263F08798];
    v6 = [(TACLVisit *)self->_representativeVisit arrivalDate];
    uint64_t v7 = [(TACLVisit *)self->_representativeVisit departureDate];
    double v8 = [v5 createIntervalSafelyWithStartDate:v6 endDate:v7];

    double v9 = [v4 getDate];
    LOBYTE(v7) = [v8 containsDate:v9];

    if (v7)
    {
      displayOnCalculator = self->_displayOnCalculator;
      double v11 = [v4 getDate];
      double v12 = v11;
      if (!displayOnCalculator)
      {
        entryDurationOfConsiderationClosed = self->_entryDurationOfConsiderationClosed;
        self->_entryDurationOfConsiderationClosed = v11;

        goto LABEL_9;
      }
      [(TADisplayOnCalculator *)displayOnCalculator completeDisplayOnWithEndDate:v11];
    }
    else
    {
      double v13 = (void *)TAStatusLog;
      if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      double v14 = v13;
      double v12 = [v4 description];
      int v16 = 136380931;
      uint64_t v17 = [(NSDate *)v12 UTF8String];
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      _os_log_impl(&dword_22345C000, v14, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot Scan completed: %{private}s not in valid time range %{public}@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)addUTAdvertisement:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08798];
  v6 = [(TACLVisit *)self->_representativeVisit arrivalDate];
  uint64_t v7 = [(TACLVisit *)self->_representativeVisit departureDate];
  double v8 = [v5 createIntervalSafelyWithStartDate:v6 endDate:v7];

  double v9 = [v4 getDate];
  LOBYTE(v7) = [v8 containsDate:v9];

  if (v7)
  {
    if (self->_latestLocationInsideVisit)
    {
      id v10 = [v4 address];
      if ([(NSMutableOrderedSet *)self->_lruUtAdvertisementCache containsObject:v10]) {
        [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache removeObject:v10];
      }
      while ([(NSMutableOrderedSet *)self->_lruUtAdvertisementCache count] >= self->_uniqueUTBufferSizeCap
           && [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache count])
      {
        double v11 = [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache firstObject];
        [(NSMutableDictionary *)self->_latestUtAdvertisements removeObjectForKey:v11];
        [(NSMutableDictionary *)self->_earliestUtAdvertisements removeObjectForKey:v11];
        [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache removeObject:v11];
      }
      [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache addObject:v10];
      [(NSMutableDictionary *)self->_latestUtAdvertisements setObject:v4 forKey:v10];
      double v12 = [(NSMutableDictionary *)self->_earliestUtAdvertisements objectForKey:v10];

      if (!v12) {
        [(NSMutableDictionary *)self->_earliestUtAdvertisements setObject:v4 forKey:v10];
      }
      goto LABEL_15;
    }
    __int16 v18 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = v18;
      id v10 = [v4 description];
      int v19 = 136380675;
      uint64_t v20 = [v10 UTF8String];
      double v15 = "#TAVisitSnapshot Advertisement %{private}s not added to snapshot due to latest location not inside visit";
      int v16 = v14;
      uint32_t v17 = 12;
      goto LABEL_14;
    }
  }
  else
  {
    double v13 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = v13;
      id v10 = [v4 description];
      int v19 = 136380931;
      uint64_t v20 = [v10 UTF8String];
      __int16 v21 = 2114;
      v22 = v8;
      double v15 = "#TAVisitSnapshot Advertisement %{private}s not in valid time range %{public}@";
      int v16 = v14;
      uint32_t v17 = 22;
LABEL_14:
      _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);

LABEL_15:
    }
  }
}

- (void)addSystemState:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 systemStateType] == 2)
  {
    v5 = (void *)MEMORY[0x263F08798];
    if ([(NSMutableArray *)self->_displayEvents count]) {
      [(TACLVisit *)self->_representativeVisit arrivalDate];
    }
    else {
    v6 = [MEMORY[0x263EFF910] distantPast];
    }
    uint64_t v7 = [(TACLVisit *)self->_representativeVisit departureDate];
    double v8 = [v5 createIntervalSafelyWithStartDate:v6 endDate:v7];

    double v9 = [v4 getDate];
    LOBYTE(v7) = [v8 containsDate:v9];

    if ((v7 & 1) == 0)
    {
      int v19 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        int v22 = 67240450;
        int v23 = [v4 isOn];
        __int16 v24 = 2114;
        double v25 = v8;
        _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot System display state isOn: %{public}d not in valid time range %{public}@", (uint8_t *)&v22, 0x12u);
      }
      goto LABEL_16;
    }
    id v10 = [(NSMutableArray *)self->_displayEvents lastObject];
    double v11 = v10;
    if (v10)
    {
      double v12 = [v10 getDate];
      double v13 = [v4 getDate];
      uint64_t v14 = [v12 compare:v13];

      if (v14 == 1)
      {
        double v15 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = v15;
          int v17 = [v4 isOn];
          __int16 v18 = [v11 getDate];
          int v22 = 67240450;
          int v23 = v17;
          __int16 v24 = 2114;
          double v25 = v18;
          _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot System display state isOn: %{public}d received out of order, after %{public}@", (uint8_t *)&v22, 0x12u);
        }
        goto LABEL_15;
      }
      int v21 = [v11 isOn];
      if (v21 == [v4 isOn])
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
    }
    [(NSMutableArray *)self->_displayEvents addObject:v4];
    if ([(NSMutableArray *)self->_displayEvents count] > self->_displayEventBufferSizeCap) {
      [(TAVisitSnapshot *)self pruneDisplayEvents];
    }
    goto LABEL_15;
  }
LABEL_17:
}

- (BOOL)setDepartureVisit:(id)a3
{
  id v4 = a3;
  if ([(TAVisitSnapshot *)self isClosed])
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitSnapshot setDepartureVisit:]((uint64_t)v4, v5);
    }
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }
  if (![v4 hasDepartureDate])
  {
    uint64_t v7 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitSnapshot setDepartureVisit:]((uint64_t)v4, v7);
    }
    goto LABEL_11;
  }
  if (![v4 isTemporalOrderSensical])
  {
    double v8 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitSnapshot setDepartureVisit:](v8, v4);
    }
    goto LABEL_11;
  }
  [(TAVisitSnapshot *)self setRepresentativeVisit:v4];
  [(TAVisitSnapshot *)self closeSnapshotCleanup];
  BOOL v6 = 1;
  self->_isClosed = 1;
LABEL_12:

  return v6;
}

- (void)closeSnapshotCleanup
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(NSMutableDictionary *)self->_earliestUtAdvertisements allKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v9 = [(NSMutableDictionary *)self->_earliestUtAdvertisements objectForKeyedSubscript:v8];
        id v10 = [v9 getDate];
        double v11 = [(TACLVisit *)self->_representativeVisit departureDate];
        uint64_t v12 = [v10 compare:v11];

        if (v12 == 1)
        {
          [(NSMutableDictionary *)self->_latestUtAdvertisements removeObjectForKey:v8];
          [(NSMutableDictionary *)self->_earliestUtAdvertisements removeObjectForKey:v8];
          [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache removeObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  int v13 = [(NSMutableArray *)self->_displayEvents count];
  if (v13 >= 1)
  {
    uint64_t v14 = v13 + 1;
    while (1)
    {
      double v15 = [(NSMutableArray *)self->_displayEvents objectAtIndexedSubscript:(v14 - 2)];
      int v16 = [v15 getDate];
      int v17 = [(TACLVisit *)self->_representativeVisit departureDate];
      uint64_t v18 = [v16 compare:v17];

      if (v18 != 1) {
        break;
      }
      [(NSMutableArray *)self->_displayEvents removeLastObject];

      if ((unint64_t)--v14 <= 1) {
        goto LABEL_16;
      }
    }
  }
LABEL_16:
}

- (void)calculateExitIntervalWithDisplayOnBudget:(double)a3
{
  if ([(TAVisitSnapshot *)self isClosed])
  {
    if (!self->_exitIntervalBeginning)
    {
      uint64_t v5 = [(TACLVisit *)self->_representativeVisit arrivalDate];
      exitIntervalBeginning = self->_exitIntervalBeginning;
      self->_exitIntervalBeginning = v5;

      if ([(NSMutableArray *)self->_displayEvents count])
      {
        uint64_t v7 = [(TACLVisit *)self->_representativeVisit departureDate];
        int v8 = [(NSMutableArray *)self->_displayEvents count];
        if (a3 <= 0.0 || v8 < 1)
        {
          id v16 = v7;
        }
        else
        {
          unint64_t v9 = v8;
          while (1)
          {
            id v10 = [(NSMutableArray *)self->_displayEvents objectAtIndexedSubscript:(v9 - 1)];
            if ([v10 isOn])
            {
              double v11 = [v10 getDate];
              [v7 timeIntervalSinceDate:v11];
              double v13 = v12;

              if (v13 > 0.0)
              {
                if (v13 > a3)
                {
                  uint64_t v14 = [v7 dateByAddingTimeInterval:-a3];
                  double v15 = self->_exitIntervalBeginning;
                  self->_exitIntervalBeginning = v14;
                }
                a3 = a3 - v13;
              }
            }
            id v18 = [v10 getDate];

            if (a3 <= 0.0) {
              break;
            }
            id v16 = v18;
            uint64_t v7 = v18;
            if (v9-- <= 1) {
              goto LABEL_20;
            }
          }
          id v16 = v18;
        }
LABEL_20:
        id v19 = v16;
        [(NSMutableArray *)self->_displayEvents removeAllObjects];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot calculateExitIntervalWithDisplayOnBudget:]();
  }
}

- (double)getDisplayOnTimeUntilEndDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [TADisplayOnCalculator alloc];
  uint64_t v6 = [(TACLVisit *)self->_representativeVisit arrivalDate];
  uint64_t v7 = [(TADisplayOnCalculator *)v5 initWithStartTime:v6];

  displayEvents = self->_displayEvents;
  unint64_t v9 = [(NSMutableDictionary *)self->_latestUtAdvertisements allValues];
  [(TADisplayOnCalculator *)v7 calculateDisplayOnWithEvents:displayEvents advertisements:v9 endDate:v4];
  double v11 = v10;

  return v11;
}

- (void)updateEntryIntervalWithDisplayOnBudget:(double)a3 evaluateToEnd:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->_displayOnCalculator)
  {
    uint64_t v7 = [TADisplayOnCalculator alloc];
    int v8 = [(TACLVisit *)self->_representativeVisit arrivalDate];
    unint64_t v9 = [(TADisplayOnCalculator *)v7 initWithStartTime:v8 budget:a3];
    displayOnCalculator = self->_displayOnCalculator;
    self->_displayOnCalculator = v9;
  }
  entryDurationOfConsiderationClosed = self->_entryDurationOfConsiderationClosed;
  if (entryDurationOfConsiderationClosed)
  {
    double v12 = entryDurationOfConsiderationClosed;
LABEL_5:
    double v13 = v12;
LABEL_6:
    uint64_t v14 = self->_displayOnCalculator;
    displayEvents = self->_displayEvents;
    id v16 = [(NSMutableDictionary *)self->_latestUtAdvertisements allValues];
    [(TADisplayOnCalculator *)v14 calculateDisplayOnWithEvents:displayEvents advertisements:v16 endDate:v13];

    if (self->_entryDurationOfConsiderationClosed) {
      -[TADisplayOnCalculator completeDisplayOnWithEndDate:](self->_displayOnCalculator, "completeDisplayOnWithEndDate:");
    }
    goto LABEL_8;
  }
  if (!v4)
  {
    double v13 = [(TAVisitSnapshot *)self mostRecentAdvertisementDate];
    int v17 = [(TADisplayOnCalculator *)self->_displayOnCalculator evaluatedUntil];
    uint64_t v18 = [v13 compare:v17];

    if (v18 != 1) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ([(TAVisitSnapshot *)self isClosed])
  {
    double v12 = [(TACLVisit *)self->_representativeVisit departureDate];
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
    -[TAVisitSnapshot updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:]();
  }
  double v13 = 0;
LABEL_8:
}

- (id)getEntryAdvertisementsWithDisplayOnBudget:(double)a3
{
  [(TAVisitSnapshot *)self updateEntryIntervalWithDisplayOnBudget:0 evaluateToEnd:a3];
  BOOL v4 = [(TADisplayOnCalculator *)self->_displayOnCalculator evaluatedUntil];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    earliestUtAdvertisements = self->_earliestUtAdvertisements;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__TAVisitSnapshot_getEntryAdvertisementsWithDisplayOnBudget___block_invoke;
    v11[3] = &unk_2646AB0A8;
    v11[4] = self;
    id v7 = v5;
    id v12 = v7;
    [(NSMutableDictionary *)earliestUtAdvertisements enumerateKeysAndObjectsUsingBlock:v11];
    int v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = [NSDictionary dictionary];
  }
  return v9;
}

void __61__TAVisitSnapshot_getEntryAdvertisementsWithDisplayOnBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 getDate];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 96) evaluatedUntil];
  uint64_t v8 = [v6 compare:v7];

  if (v8 != 1) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v9];
  }
}

- (id)getExitAdvertisementsWithDisplayOnBudget:(double)a3
{
  if (self->_exitIntervalBeginning
    || ([(TAVisitSnapshot *)self calculateExitIntervalWithDisplayOnBudget:a3], self->_exitIntervalBeginning))
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    latestUtAdvertisements = self->_latestUtAdvertisements;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__TAVisitSnapshot_getExitAdvertisementsWithDisplayOnBudget___block_invoke;
    v10[3] = &unk_2646AB0A8;
    v10[4] = self;
    id v6 = v4;
    id v11 = v6;
    [(NSMutableDictionary *)latestUtAdvertisements enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = objc_alloc_init(NSDictionary);
  }
  return v8;
}

void __60__TAVisitSnapshot_getExitAdvertisementsWithDisplayOnBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 88);
  id v7 = [v5 getDate];
  uint64_t v8 = [v6 compare:v7];

  if (v8 != 1) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v9];
  }
}

- (double)getDurationOfVisitExitConsideredWithDisplayOnBudget:(double)a3
{
  if ([(TAVisitSnapshot *)self isClosed])
  {
    [(TAVisitSnapshot *)self calculateExitIntervalWithDisplayOnBudget:a3];
    if (self->_exitIntervalBeginning)
    {
      id v5 = [(TACLVisit *)self->_representativeVisit departureDate];
      [v5 timeIntervalSinceDate:self->_exitIntervalBeginning];
      double v7 = v6;

      return v7;
    }
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
      -[TAVisitSnapshot getDurationOfVisitExitConsideredWithDisplayOnBudget:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot getDurationOfVisitExitConsideredWithDisplayOnBudget:]();
  }
  return 0.0;
}

- (double)getDurationOfVisitEntryConsideredWithDisplayOnBudget:(double)a3
{
  if ([(TAVisitSnapshot *)self isClosed])
  {
    [(TAVisitSnapshot *)self updateEntryIntervalWithDisplayOnBudget:1 evaluateToEnd:a3];
    displayOnCalculator = self->_displayOnCalculator;
    if (displayOnCalculator)
    {
      double v6 = [(TADisplayOnCalculator *)displayOnCalculator evaluatedUntil];
      double v7 = [(TACLVisit *)self->_representativeVisit arrivalDate];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      return v9;
    }
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
  {
    -[TAVisitSnapshot getDurationOfVisitEntryConsideredWithDisplayOnBudget:]();
  }
  return 0.0;
}

- (id)mostRecentAdvertisementDate
{
  v3 = [(NSMutableOrderedSet *)self->_lruUtAdvertisementCache lastObject];
  id v4 = [(NSMutableDictionary *)self->_latestUtAdvertisements objectForKeyedSubscript:v3];
  id v5 = [v4 getDate];

  return v5;
}

- (void)pruneDisplayEvents
{
  int v3 = [(NSMutableArray *)self->_displayEvents count] - LODWORD(self->_displayEventBufferSizeCap);
  if (v3 >= 1)
  {
    do
    {
      [(NSMutableArray *)self->_displayEvents removeObjectAtIndex:0];
      --v3;
    }
    while (v3);
  }
}

- (void)updateLoiType:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [TALocationLite alloc];
  double v6 = [(TACLVisit *)self->_representativeVisit getDate];
  [(TACLVisit *)self->_representativeVisit coordinate];
  double v8 = v7;
  [(TACLVisit *)self->_representativeVisit coordinate];
  double v10 = v9;
  [(TACLVisit *)self->_representativeVisit horizontalAccuracy];
  id v12 = [(TALocationLite *)v5 initWithTimestamp:v6 latitude:v8 longitude:v10 horizontalAccuracy:v11];

  double v13 = [TALocationLite alloc];
  uint64_t v14 = [v4 getDate];
  [v4 latitude];
  double v16 = v15;
  [v4 longitude];
  double v18 = v17;
  [v4 horizontalAccuracy];
  long long v20 = [(TALocationLite *)v13 initWithTimestamp:v14 latitude:v16 longitude:v18 horizontalAccuracy:v19];

  [(TALocationLite *)v12 distanceFromLocation:v20];
  double v22 = v21;
  if (v21 < 250.0)
  {
    p_lastLoiTypeUpdateTime = (id *)&self->_lastLoiTypeUpdateTime;
    lastLoiTypeUpdateTime = self->_lastLoiTypeUpdateTime;
    double v25 = [v4 date];
    if ([(NSDate *)lastLoiTypeUpdateTime compare:v25] != NSOrderedAscending)
    {
      id v26 = *p_lastLoiTypeUpdateTime;
      double v27 = [v4 date];
      if ([v26 compare:v27])
      {

        goto LABEL_5;
      }
      distanceToClosestLouint64_t i = self->_distanceToClosestLoi;
      if (distanceToClosestLoi)
      {
        [(NSNumber *)distanceToClosestLoi doubleValue];
        double v33 = v32;

        if (v22 >= v33)
        {
LABEL_5:
          double v28 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
            [(TAVisitSnapshot *)v28 updateLoiType:p_lastLoiTypeUpdateTime];
          }
          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
LABEL_14:
    v34 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = TALocationOfInterestTypeToString([v4 type]);
      int v41 = 138477827;
      double v42 = *(double *)&v36;
      _os_log_impl(&dword_22345C000, v35, OS_LOG_TYPE_DEFAULT, "#TAVisitSnapshot update visit snapshot with LOI type %{private}@", (uint8_t *)&v41, 0xCu);
    }
    self->_loiType = [v4 type];
    objc_super v37 = [v4 date];
    v38 = self->_lastLoiTypeUpdateTime;
    self->_lastLoiTypeUpdateTime = v37;

    v39 = (NSNumber *)[objc_alloc(NSNumber) initWithDouble:v22];
    v40 = self->_distanceToClosestLoi;
    self->_distanceToClosestLouint64_t i = v39;

    goto LABEL_17;
  }
  double v29 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = v29;
    int v41 = 134284033;
    double v42 = v22;
    __int16 v43 = 2049;
    uint64_t v44 = [v4 type];
    __int16 v45 = 2049;
    double v46 = v22 - 250.0;
    _os_log_debug_impl(&dword_22345C000, v30, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot the visit snapshot located %{private}f meters away from %{private}lu LOI type with %{private}f residual", (uint8_t *)&v41, 0x20u);
  }
LABEL_17:
}

- (id)getArrivalDelay
{
  representativeVisit = self->_representativeVisit;
  if (!representativeVisit) {
    goto LABEL_5;
  }
  uint64_t v4 = [(TACLVisit *)representativeVisit detectionDate];
  if (!v4) {
    goto LABEL_5;
  }
  id v5 = (void *)v4;
  double v6 = [(TACLVisit *)self->_representativeVisit arrivalDate];

  if (!v6) {
    goto LABEL_5;
  }
  double v7 = [(TACLVisit *)self->_representativeVisit arrivalDate];
  double v8 = [(TACLVisit *)self->_representativeVisit detectionDate];
  uint64_t v9 = [v7 compare:v8];

  if (v9 != 1)
  {
    id v12 = (void *)MEMORY[0x263F08798];
    double v13 = [(TACLVisit *)self->_representativeVisit arrivalDate];
    uint64_t v14 = [(TACLVisit *)self->_representativeVisit detectionDate];
    double v10 = [v12 createIntervalSafelyWithStartDate:v13 endDate:v14];
  }
  else
  {
LABEL_5:
    double v10 = 0;
  }
  return v10;
}

- (id)getDepartureDelay
{
  representativeVisit = self->_representativeVisit;
  if (!representativeVisit) {
    goto LABEL_5;
  }
  uint64_t v4 = [(TACLVisit *)representativeVisit detectionDate];
  if (!v4) {
    goto LABEL_5;
  }
  id v5 = (void *)v4;
  double v6 = [(TACLVisit *)self->_representativeVisit departureDate];

  if (!v6) {
    goto LABEL_5;
  }
  double v7 = [(TACLVisit *)self->_representativeVisit departureDate];
  double v8 = [(TACLVisit *)self->_representativeVisit detectionDate];
  uint64_t v9 = [v7 compare:v8];

  if (v9 != 1)
  {
    id v12 = (void *)MEMORY[0x263F08798];
    double v13 = [(TACLVisit *)self->_representativeVisit departureDate];
    uint64_t v14 = [(TACLVisit *)self->_representativeVisit detectionDate];
    double v10 = [v12 createIntervalSafelyWithStartDate:v13 endDate:v14];
  }
  else
  {
LABEL_5:
    double v10 = 0;
  }
  return v10;
}

- (unint64_t)evaluateSnapshotQualityWithMinDwellDuration:(double)a3 minDisplayOnDuration:(double)a4
{
  if ([(TAVisitSnapshot *)self isClosed])
  {
    double v7 = [(TACLVisit *)self->_representativeVisit departureDate];
    double v8 = [(TACLVisit *)self->_representativeVisit arrivalDate];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 >= a3)
    {
      id v12 = [(TACLVisit *)self->_representativeVisit departureDate];
      [(TAVisitSnapshot *)self getDisplayOnTimeUntilEndDate:v12];
      double v14 = v13;

      if (v14 >= a4) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 2;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAVisitSnapshot evaluateSnapshotQualityWithMinDwellDuration:minDisplayOnDuration:]();
    }
    return 0;
  }
}

- (id)getLocationRepresentingSnapshot
{
  int v3 = [TALocationLite alloc];
  BOOL v4 = [(TACLVisit *)self->_representativeVisit hasDepartureDate];
  representativeVisit = self->_representativeVisit;
  if (v4) {
    [(TACLVisit *)representativeVisit departureDate];
  }
  else {
  double v6 = [(TACLVisit *)representativeVisit arrivalDate];
  }
  [(TACLVisit *)self->_representativeVisit coordinate];
  double v8 = v7;
  [(TACLVisit *)self->_representativeVisit coordinate];
  double v10 = v9;
  [(TACLVisit *)self->_representativeVisit horizontalAccuracy];
  id v12 = [(TALocationLite *)v3 initWithTimestamp:v6 latitude:v8 longitude:v10 horizontalAccuracy:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  double v6 = (TAVisitSnapshot *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = v6;
      BOOL v8 = [(TAVisitSnapshot *)self isClosed];
      if (v8 != [(TAVisitSnapshot *)v7 isClosed])
      {
        char v9 = 0;
LABEL_78:

        goto LABEL_79;
      }
      double v10 = [(TAVisitSnapshot *)self representativeVisit];
      double v11 = [(TAVisitSnapshot *)v7 representativeVisit];
      if (v10 != v11)
      {
        BOOL v4 = [(TAVisitSnapshot *)self representativeVisit];
        int v3 = [(TAVisitSnapshot *)v7 representativeVisit];
        if (![v4 isEqual:v3])
        {
          char v9 = 0;
          goto LABEL_76;
        }
      }
      id v12 = [(TAVisitSnapshot *)self latestLocation];
      double v13 = [(TAVisitSnapshot *)v7 latestLocation];
      if (v12 != v13)
      {
        double v14 = [(TAVisitSnapshot *)self latestLocation];
        v96 = [(TAVisitSnapshot *)v7 latestLocation];
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v9 = 0;
          goto LABEL_74;
        }
        v95 = v14;
      }
      unint64_t v15 = [(TAVisitSnapshot *)self loiType];
      if (v15 == [(TAVisitSnapshot *)v7 loiType])
      {
        uint64_t v16 = [(TAVisitSnapshot *)self latestUtAdvertisements];
        [(TAVisitSnapshot *)v7 latestUtAdvertisements];
        v93 = v3;
        v94 = (void *)v16;
        uint64_t v92 = v91 = v13;
        v90 = v12;
        if (v16 != v92)
        {
          double v17 = [(TAVisitSnapshot *)self latestUtAdvertisements];
          v86 = [(TAVisitSnapshot *)v7 latestUtAdvertisements];
          v87 = v17;
          if (!objc_msgSend(v17, "isEqual:"))
          {
            char v9 = 0;
            double v18 = (void *)v16;
            double v19 = (void *)v92;
            double v14 = v95;
LABEL_72:

LABEL_73:
            id v12 = v90;
            double v13 = v91;
            int v3 = v93;
            if (v90 == v91) {
              goto LABEL_75;
            }
            goto LABEL_74;
          }
        }
        uint64_t v20 = [(TAVisitSnapshot *)self earliestUtAdvertisements];
        uint64_t v88 = [(TAVisitSnapshot *)v7 earliestUtAdvertisements];
        v89 = (void *)v20;
        if (v20 != v88)
        {
          double v21 = [(TAVisitSnapshot *)self earliestUtAdvertisements];
          v84 = [(TAVisitSnapshot *)v7 earliestUtAdvertisements];
          v85 = v21;
          if (!objc_msgSend(v21, "isEqual:"))
          {
            char v9 = 0;
            double v22 = (void *)v88;
            int v23 = v89;
            double v14 = v95;
            goto LABEL_70;
          }
        }
        BOOL v24 = [(TAVisitSnapshot *)self latestLocationInsideVisit];
        if (v24 != [(TAVisitSnapshot *)v7 latestLocationInsideVisit])
        {
          char v9 = 0;
          double v22 = (void *)v88;
          int v23 = v89;
          double v14 = v95;
          if (v89 == (void *)v88)
          {
LABEL_71:

            double v18 = v94;
            double v19 = (void *)v92;
            if (v94 == (void *)v92) {
              goto LABEL_73;
            }
            goto LABEL_72;
          }
LABEL_70:

          goto LABEL_71;
        }
        uint64_t v25 = [(TAVisitSnapshot *)self lruUtAdvertisementCache];
        uint64_t v82 = [(TAVisitSnapshot *)v7 lruUtAdvertisementCache];
        v83 = (void *)v25;
        if (v25 != v82)
        {
          id v26 = [(TAVisitSnapshot *)self lruUtAdvertisementCache];
          v80 = [(TAVisitSnapshot *)v7 lruUtAdvertisementCache];
          v81 = v26;
          if (!objc_msgSend(v26, "isEqual:"))
          {
            char v9 = 0;
            double v27 = v89;
            double v29 = (void *)v82;
            double v28 = v83;
LABEL_68:

LABEL_69:
            double v22 = (void *)v88;
            double v14 = v95;
            int v23 = v27;
            if (v27 == (void *)v88) {
              goto LABEL_71;
            }
            goto LABEL_70;
          }
        }
        unint64_t v30 = [(TAVisitSnapshot *)self uniqueUTBufferSizeCap];
        if (v30 != [(TAVisitSnapshot *)v7 uniqueUTBufferSizeCap]
          || (unint64_t v31 = [(TAVisitSnapshot *)self displayEventBufferSizeCap],
              v31 != [(TAVisitSnapshot *)v7 displayEventBufferSizeCap]))
        {
          char v9 = 0;
          goto LABEL_67;
        }
        uint64_t v32 = [(TAVisitSnapshot *)self displayEvents];
        v78 = [(TAVisitSnapshot *)v7 displayEvents];
        v79 = (void *)v32;
        if ((void *)v32 != v78)
        {
          uint64_t v33 = [(TAVisitSnapshot *)self displayEvents];
          uint64_t v34 = [(TAVisitSnapshot *)v7 displayEvents];
          v76 = (void *)v33;
          v35 = (void *)v33;
          v36 = (void *)v34;
          if (![v35 isEqual:v34])
          {
            char v9 = 0;
            v40 = v78;
            goto LABEL_64;
          }
          v73 = v36;
        }
        uint64_t v37 = [(TAVisitSnapshot *)self exitIntervalBeginning];
        uint64_t v75 = [(TAVisitSnapshot *)v7 exitIntervalBeginning];
        v77 = (void *)v37;
        if (v37 != v75)
        {
          v38 = [(TAVisitSnapshot *)self exitIntervalBeginning];
          v70 = [(TAVisitSnapshot *)v7 exitIntervalBeginning];
          v71 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            char v9 = 0;
            v39 = (void *)v75;
LABEL_62:

LABEL_63:
            v40 = v78;
            v36 = v73;
            if (v79 == v78)
            {

              goto LABEL_66;
            }
LABEL_64:
            v55 = v40;

LABEL_66:
LABEL_67:
            double v29 = (void *)v82;
            double v28 = v83;
            double v27 = v89;
            if (v83 == (void *)v82) {
              goto LABEL_69;
            }
            goto LABEL_68;
          }
        }
        uint64_t v41 = [(TAVisitSnapshot *)self displayOnCalculator];
        uint64_t v72 = [(TAVisitSnapshot *)v7 displayOnCalculator];
        v74 = (void *)v41;
        if (v41 != v72)
        {
          double v42 = [(TAVisitSnapshot *)self displayOnCalculator];
          v67 = [(TAVisitSnapshot *)v7 displayOnCalculator];
          v68 = v42;
          if (!objc_msgSend(v42, "isEqual:"))
          {
            char v9 = 0;
            __int16 v43 = (void *)v72;
LABEL_60:

LABEL_61:
            v39 = (void *)v75;
            if (v77 == (void *)v75) {
              goto LABEL_63;
            }
            goto LABEL_62;
          }
        }
        uint64_t v44 = [(TAVisitSnapshot *)self distanceToClosestLoi];
        uint64_t v66 = [(TAVisitSnapshot *)v7 distanceToClosestLoi];
        v69 = (void *)v44;
        if (v44 != v66)
        {
          __int16 v45 = [(TAVisitSnapshot *)self distanceToClosestLoi];
          v62 = [(TAVisitSnapshot *)v7 distanceToClosestLoi];
          v63 = v45;
          if (!objc_msgSend(v45, "isEqual:"))
          {
            char v9 = 0;
            double v46 = (void *)v66;
LABEL_58:

LABEL_59:
            __int16 v43 = (void *)v72;
            if (v74 == (void *)v72) {
              goto LABEL_61;
            }
            goto LABEL_60;
          }
        }
        uint64_t v47 = [(TAVisitSnapshot *)self entryDurationOfConsiderationClosed];
        v64 = [(TAVisitSnapshot *)v7 entryDurationOfConsiderationClosed];
        v65 = (void *)v47;
        if ((void *)v47 != v64)
        {
          uint64_t v48 = [(TAVisitSnapshot *)self entryDurationOfConsiderationClosed];
          uint64_t v49 = [(TAVisitSnapshot *)v7 entryDurationOfConsiderationClosed];
          v61 = (void *)v48;
          v50 = (void *)v48;
          v51 = (void *)v49;
          if (![v50 isEqual:v49])
          {
            char v9 = 0;
            goto LABEL_55;
          }
          v60 = v51;
        }
        unint64_t v52 = [(TAVisitSnapshot *)self maxNSigmaBetweenLastLocationAndVisit];
        if (v52 == [(TAVisitSnapshot *)v7 maxNSigmaBetweenLastLocationAndVisit])
        {
          v53 = [(TAVisitSnapshot *)self lastLoiTypeUpdateTime];
          v58 = [(TAVisitSnapshot *)v7 lastLoiTypeUpdateTime];
          v59 = v53;
          if (v53 == v58)
          {

            char v9 = 1;
          }
          else
          {
            v57 = [(TAVisitSnapshot *)self lastLoiTypeUpdateTime];
            v54 = [(TAVisitSnapshot *)v7 lastLoiTypeUpdateTime];
            char v9 = [v57 isEqual:v54];
          }
        }
        else
        {
          char v9 = 0;
        }
        v51 = v60;
        if (v65 == v64)
        {

LABEL_57:
          double v46 = (void *)v66;
          if (v69 == (void *)v66) {
            goto LABEL_59;
          }
          goto LABEL_58;
        }
LABEL_55:

        goto LABEL_57;
      }
      char v9 = 0;
      double v14 = v95;
      if (v12 == v13)
      {
LABEL_75:

        if (v10 == v11)
        {
LABEL_77:

          goto LABEL_78;
        }
LABEL_76:

        goto LABEL_77;
      }
LABEL_74:

      goto LABEL_75;
    }
    char v9 = 0;
  }
LABEL_79:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAVisitSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)TAVisitSnapshot;
  id v5 = [(TAVisitSnapshot *)&v43 init];
  if (v5)
  {
    v5->_isClosed = [v4 decodeBoolForKey:@"Closed"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RepVisit"];
    representativeVisit = v5->_representativeVisit;
    v5->_representativeVisit = (TACLVisit *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LatestLoc"];
    latestLocation = v5->_latestLocation;
    v5->_latestLocation = (TALocationLite *)v8;

    v5->_loiType = [v4 decodeIntegerForKey:@"LOI"];
    double v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    double v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"LatestAdv"];
    latestUtAdvertisements = v5->_latestUtAdvertisements;
    v5->_latestUtAdvertisements = (NSMutableDictionary *)v14;

    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    double v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"EarliestAdv"];
    earliestUtAdvertisements = v5->_earliestUtAdvertisements;
    v5->_earliestUtAdvertisements = (NSMutableDictionary *)v20;

    v5->_latestLocationInsideVisit = [v4 decodeBoolForKey:@"LatestLocInside"];
    double v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    BOOL v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"LRUAdv"];
    lruUtAdvertisementCache = v5->_lruUtAdvertisementCache;
    v5->_lruUtAdvertisementCache = (NSMutableOrderedSet *)v25;

    v5->_uniqueUTBufferSizeCap = [v4 decodeIntegerForKey:@"numUnique"];
    v5->_displayEventBufferSizeCap = [v4 decodeIntegerForKey:@"numDisplay"];
    double v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    double v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"displayEvents"];
    displayEvents = v5->_displayEvents;
    v5->_displayEvents = (NSMutableArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exitBegin"];
    exitIntervalBeginning = v5->_exitIntervalBeginning;
    v5->_exitIntervalBeginning = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayOnCalc"];
    displayOnCalculator = v5->_displayOnCalculator;
    v5->_displayOnCalculator = (TADisplayOnCalculator *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distanceToLOI"];
    distanceToClosestLouint64_t i = v5->_distanceToClosestLoi;
    v5->_distanceToClosestLouint64_t i = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryDuration"];
    entryDurationOfConsiderationClosed = v5->_entryDurationOfConsiderationClosed;
    v5->_entryDurationOfConsiderationClosed = (NSDate *)v38;

    v5->_maxNSigmaBetweenLastLocationAndVisit = [v4 decodeIntegerForKey:@"maxNSigma"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LoiUpdateTime"];
    lastLoiTypeUpdateTime = v5->_lastLoiTypeUpdateTime;
    v5->_lastLoiTypeUpdateTime = (NSDate *)v40;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isClosed = self->_isClosed;
  id v5 = a3;
  [v5 encodeBool:isClosed forKey:@"Closed"];
  [v5 encodeObject:self->_representativeVisit forKey:@"RepVisit"];
  [v5 encodeObject:self->_latestLocation forKey:@"LatestLoc"];
  [v5 encodeInteger:self->_loiType forKey:@"LOI"];
  [v5 encodeObject:self->_latestUtAdvertisements forKey:@"LatestAdv"];
  [v5 encodeObject:self->_earliestUtAdvertisements forKey:@"EarliestAdv"];
  [v5 encodeBool:self->_latestLocationInsideVisit forKey:@"LatestLocInside"];
  [v5 encodeObject:self->_lruUtAdvertisementCache forKey:@"LRUAdv"];
  [v5 encodeInteger:self->_uniqueUTBufferSizeCap forKey:@"numUnique"];
  [v5 encodeInteger:self->_displayEventBufferSizeCap forKey:@"numDisplay"];
  [v5 encodeObject:self->_displayEvents forKey:@"displayEvents"];
  [v5 encodeObject:self->_exitIntervalBeginning forKey:@"exitBegin"];
  [v5 encodeObject:self->_displayOnCalculator forKey:@"displayOnCalc"];
  [v5 encodeObject:self->_distanceToClosestLoi forKey:@"distanceToLOI"];
  [v5 encodeObject:self->_entryDurationOfConsiderationClosed forKey:@"entryDuration"];
  [v5 encodeInteger:self->_maxNSigmaBetweenLastLocationAndVisit forKey:@"maxNSigma"];
  [v5 encodeObject:self->_lastLoiTypeUpdateTime forKey:@"LoiUpdateTime"];
}

- (TACLVisit)representativeVisit
{
  return self->_representativeVisit;
}

- (NSMutableDictionary)latestUtAdvertisements
{
  return self->_latestUtAdvertisements;
}

- (NSMutableDictionary)earliestUtAdvertisements
{
  return self->_earliestUtAdvertisements;
}

- (BOOL)latestLocationInsideVisit
{
  return self->_latestLocationInsideVisit;
}

- (NSMutableOrderedSet)lruUtAdvertisementCache
{
  return self->_lruUtAdvertisementCache;
}

- (void)setLruUtAdvertisementCache:(id)a3
{
}

- (unint64_t)uniqueUTBufferSizeCap
{
  return self->_uniqueUTBufferSizeCap;
}

- (void)setUniqueUTBufferSizeCap:(unint64_t)a3
{
  self->_uniqueUTBufferSizeCap = a3;
}

- (unint64_t)displayEventBufferSizeCap
{
  return self->_displayEventBufferSizeCap;
}

- (void)setDisplayEventBufferSizeCap:(unint64_t)a3
{
  self->_displayEventBufferSizeCap = a3;
}

- (NSMutableArray)displayEvents
{
  return self->_displayEvents;
}

- (void)setDisplayEvents:(id)a3
{
}

- (NSDate)exitIntervalBeginning
{
  return self->_exitIntervalBeginning;
}

- (void)setExitIntervalBeginning:(id)a3
{
}

- (TADisplayOnCalculator)displayOnCalculator
{
  return self->_displayOnCalculator;
}

- (void)setDisplayOnCalculator:(id)a3
{
}

- (NSNumber)distanceToClosestLoi
{
  return self->_distanceToClosestLoi;
}

- (void)setDistanceToClosestLoi:(id)a3
{
}

- (NSDate)entryDurationOfConsiderationClosed
{
  return self->_entryDurationOfConsiderationClosed;
}

- (void)setEntryDurationOfConsiderationClosed:(id)a3
{
}

- (unint64_t)maxNSigmaBetweenLastLocationAndVisit
{
  return self->_maxNSigmaBetweenLastLocationAndVisit;
}

- (void)setMaxNSigmaBetweenLastLocationAndVisit:(unint64_t)a3
{
  self->_maxNSigmaBetweenLastLocationAndVisit = a3;
}

- (NSDate)lastLoiTypeUpdateTime
{
  return self->_lastLoiTypeUpdateTime;
}

- (void)setLastLoiTypeUpdateTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoiTypeUpdateTime, 0);
  objc_storeStrong((id *)&self->_entryDurationOfConsiderationClosed, 0);
  objc_storeStrong((id *)&self->_distanceToClosestLoi, 0);
  objc_storeStrong((id *)&self->_displayOnCalculator, 0);
  objc_storeStrong((id *)&self->_exitIntervalBeginning, 0);
  objc_storeStrong((id *)&self->_displayEvents, 0);
  objc_storeStrong((id *)&self->_lruUtAdvertisementCache, 0);
  objc_storeStrong((id *)&self->_earliestUtAdvertisements, 0);
  objc_storeStrong((id *)&self->_latestUtAdvertisements, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_representativeVisit, 0);
}

- (void)setRepresentativeVisit:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitSnapshot not setting representative visit because snapshot already closed", v2, v3, v4, v5, v6);
}

- (void)setRepresentativeVisit:(id *)a3 .cold.2(void *a1, void *a2, id *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 description];
  double v7 = [*a3 description];
  int v8 = 138412546;
  char v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot _setRepresentativeVisit with input %@ and adjusted representativeVisit to %@", (uint8_t *)&v8, 0x16u);
}

- (void)setDepartureVisit:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22345C000, a2, OS_LOG_TYPE_ERROR, "#TAVisitSnapshot departure POI populated already; drop TACLVisit %{private}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)setDepartureVisit:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 departureDate];
  uint64_t v5 = [a2 arrivalDate];
  int v6 = 138478083;
  double v7 = v4;
  __int16 v8 = 2113;
  char v9 = v5;
  _os_log_error_impl(&dword_22345C000, v3, OS_LOG_TYPE_ERROR, "#TAVisitSnapshot dropping departure POI b/c the departure date %{private}@ is earlier than the arrival date %{private}@ of the current snapshot", (uint8_t *)&v6, 0x16u);
}

- (void)setDepartureVisit:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22345C000, a2, OS_LOG_TYPE_ERROR, "#TAVisitSnapshot dropping departure POI b/c there is no departure date: %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)calculateExitIntervalWithDisplayOnBudget:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitSnapshot requested exit interval calculation but snapshot is not closed", v2, v3, v4, v5, v6);
}

- (void)updateEntryIntervalWithDisplayOnBudget:evaluateToEnd:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitSnapshot requested getEntryAdvertisementsWithDisplayOnBudget evaluation to end on a snapshot that isn't closed", v2, v3, v4, v5, v6);
}

- (void)getDurationOfVisitExitConsideredWithDisplayOnBudget:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitExitConsidered but interval could not be calculated", v2, v3, v4, v5, v6);
}

- (void)getDurationOfVisitExitConsideredWithDisplayOnBudget:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitExitConsidered but snapshot is not closed", v2, v3, v4, v5, v6);
}

- (void)getDurationOfVisitEntryConsideredWithDisplayOnBudget:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitSnapshot requested getDurationOfVisitEntryConsideredWithDisplayOnBudget but snapshot is not closed", v2, v3, v4, v5, v6);
}

- (void)updateLatestLocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 9)) {
    uint64_t v2 = "is";
  }
  else {
    uint64_t v2 = "not";
  }
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22345C000, a2, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot latestLocation %{public}s inside visit", (uint8_t *)&v3, 0xCu);
}

- (void)updateLatestLocation:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_22345C000, v0, v1, "#TAVisitSnapshot encountered null latestLocation", v2, v3, v4, v5, v6);
}

- (void)updateLoiType:(id *)a3 .cold.1(void *a1, void *a2, id *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = [a2 type];
  double v7 = [a2 date];
  __int16 v8 = [v7 getDateString];
  char v9 = [*a3 getDateString];
  int v10 = 134284035;
  uint64_t v11 = v6;
  __int16 v12 = 2113;
  double v13 = v8;
  __int16 v14 = 2113;
  unint64_t v15 = v9;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAVisitSnapshot skip updating LOI type %{private}lu as it was too old: incoming loi date %{private}@, current loiType update date, %{private}@", (uint8_t *)&v10, 0x20u);
}

- (void)evaluateSnapshotQualityWithMinDwellDuration:minDisplayOnDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_22345C000, v0, v1, "#TAVisitSnapshot visit snapshot quality requested when snapshot open", v2, v3, v4, v5, v6);
}

@end