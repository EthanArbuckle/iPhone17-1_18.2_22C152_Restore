@interface TAInterVisitMetricsSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isClosed;
- (BOOL)isEqual:(id)a3;
- (NSDate)initialTime;
- (NSDate)lastUpdateTime;
- (NSMutableDictionary)accumulatedDeviceMetrics;
- (NSMutableDictionary)firstAssociatedLocationPerDevice;
- (NSMutableDictionary)lastAdvPerDevice;
- (NSMutableDictionary)lastAssociatedLocationPerDevice;
- (TAInterVisitMetricsSnapshot)initWithCoder:(id)a3;
- (TAInterVisitMetricsSnapshot)initWithTime:(id)a3 maxUniqueAddresses:(unint64_t)a4;
- (unint64_t)maxUniqueAddresses;
- (void)encodeWithCoder:(id)a3;
- (void)updateInterVisitMetric:(id)a3 store:(id)a4 withUpdatedTime:(id)a5 andCloseSnapshot:(BOOL)a6;
- (void)updateWithInterVisitMetricsSnapshot:(id)a3 store:(id)a4;
- (void)visitEntryDelayCorrection:(id)a3 store:(id)a4;
@end

@implementation TAInterVisitMetricsSnapshot

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)updateInterVisitMetric:(id)a3 store:(id)a4 withUpdatedTime:(id)a5 andCloseSnapshot:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v61 = a4;
  id v11 = a5;
  if (self->_isClosed)
  {
    v12 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:].cold.4(v12);
    }
    goto LABEL_41;
  }
  if ([(NSDate *)self->_lastUpdateTime compare:v11] != NSOrderedDescending)
  {
    p_lastUpdateTime = &self->_lastUpdateTime;
    id v56 = a5;
    BOOL v57 = v6;
    id v58 = v11;
    id v59 = v10;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v10;
    uint64_t v64 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (!v64) {
      goto LABEL_38;
    }
    uint64_t v62 = *(void *)v71;
    v60 = self;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v71 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * v15);
        v17 = objc_msgSend(obj, "objectForKey:", v16, p_lastUpdateTime, v56);
        v18 = [(NSMutableDictionary *)self->_accumulatedDeviceMetrics objectForKey:v16];
        if (v18) {
          goto LABEL_17;
        }
        v19 = [(TAInterVisitMetricsSnapshot *)self accumulatedDeviceMetrics];
        unint64_t v20 = [v19 count];
        unint64_t v21 = [(TAInterVisitMetricsSnapshot *)self maxUniqueAddresses];

        if (v20 < v21)
        {
          v18 = objc_alloc_init(TAInterVisitMetricPerDevice);
          [(NSMutableDictionary *)self->_accumulatedDeviceMetrics setObject:v18 forKey:v16];
LABEL_17:
          v22 = [v17 deviceLocationHistory];
          v23 = (void *)[v22 mutableCopy];

          uint64_t v24 = [(NSMutableDictionary *)self->_lastAssociatedLocationPerDevice objectForKey:v16];
          if (v24) {
            [v23 insertObject:v24 atIndex:0];
          }
          v66 = (void *)v24;
          v25 = [v17 deviceObservationInterval];
          v26 = [(NSMutableDictionary *)self->_lastAdvPerDevice objectForKey:v16];
          v65 = v26;
          if (v26)
          {
            v63 = v25;
            v27 = v26;
            v28 = [v26 getDate];
            v29 = [v17 latestObservation];
            v30 = [v29 getDate];
            uint64_t v31 = [v28 compare:v30];

            if (v31 == 1)
            {
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
                -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:](&v68, v69);
              }
              v25 = v63;
            }
            else
            {
              v32 = (void *)MEMORY[0x263F08798];
              v33 = [v27 getDate];
              v34 = [v17 latestObservation];
              v35 = [v34 getDate];
              v25 = [v32 createIntervalSafelyWithStartDate:v33 endDate:v35];
            }
          }
          BOOL v36 = +[TAFilterGeneral locationSegments:v23 underMaxSpeed:50.0];
          BOOL v37 = v36;
          [(TAInterVisitMetricPerDevice *)v18 setSegmentSpeedExceedsLimit:[(TAInterVisitMetricPerDevice *)v18 segmentSpeedExceedsLimit] | !v36];
          if (!v37)
          {
            v38 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68289283;
              int v75 = 0;
              __int16 v76 = 2082;
              v77 = "";
              __int16 v78 = 2113;
              uint64_t v79 = v16;
              _os_log_impl(&dword_22345C000, v38, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot segment speed exceeds limit\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
            }
          }
          v39 = [v17 deviceLocationHistory];
          -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](v18, "accumulateNumOfAssociatedLocs:", [v39 count]);

          [v25 duration];
          -[TAInterVisitMetricPerDevice accumulateDuration:](v18, "accumulateDuration:");
          +[TAFilterGeneral distOfTravelAlong:v23];
          -[TAInterVisitMetricPerDevice accumulateDistance:](v18, "accumulateDistance:");
          [(TAInterVisitMetricPerDevice *)v18 accumulateSampledObservedLocations:v23];
          v40 = [obj objectForKeyedSubscript:v16];
          v41 = [v40 latestObservation];
          [(TAInterVisitMetricPerDevice *)v18 accumulateLatestAdvertisement:v41];

          v42 = +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:v25 store:v61];
          [(TAInterVisitMetricPerDevice *)v18 accumulateDurationPerMotionState:v42];

          self = v60;
          if ([v23 count])
          {
            v43 = [(NSMutableDictionary *)v60->_firstAssociatedLocationPerDevice objectForKeyedSubscript:v16];

            if (!v43)
            {
              firstAssociatedLocationPerDevice = v60->_firstAssociatedLocationPerDevice;
              v45 = [v23 firstObject];
              v46 = (void *)[v45 copy];
              [(NSMutableDictionary *)firstAssociatedLocationPerDevice setObject:v46 forKey:v16];
            }
            lastAssociatedLocationPerDevice = v60->_lastAssociatedLocationPerDevice;
            v48 = [v23 lastObject];
            v49 = (void *)[v48 copy];
            [(NSMutableDictionary *)lastAssociatedLocationPerDevice setObject:v49 forKey:v16];
          }
          lastAdvPerDevice = v60->_lastAdvPerDevice;
          v51 = [v17 latestObservation];
          v52 = (void *)[v51 copy];
          [(NSMutableDictionary *)lastAdvPerDevice setObject:v52 forKey:v16];

          goto LABEL_33;
        }
        v53 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          int v75 = 0;
          __int16 v76 = 2082;
          v77 = "";
          __int16 v78 = 2113;
          uint64_t v79 = v16;
          _os_log_impl(&dword_22345C000, v53, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot snapshot full, not adding metrics for address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
        }
LABEL_33:

        ++v15;
      }
      while (v64 != v15);
      uint64_t v54 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
      uint64_t v64 = v54;
      if (!v54)
      {
LABEL_38:

        objc_storeStrong((id *)p_lastUpdateTime, v56);
        self->_isClosed = v57;
        id v11 = v58;
        id v10 = v59;
        goto LABEL_41;
      }
    }
  }
  v13 = TAStatusLog;
  BOOL v14 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v14) {
      -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:](v13);
    }
    self->_isClosed = v6;
  }
  else if (v14)
  {
    -[TAInterVisitMetricsSnapshot updateInterVisitMetric:store:withUpdatedTime:andCloseSnapshot:](v13);
  }
LABEL_41:
}

- (NSMutableDictionary)accumulatedDeviceMetrics
{
  return self->_accumulatedDeviceMetrics;
}

- (TAInterVisitMetricsSnapshot)initWithTime:(id)a3 maxUniqueAddresses:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TAInterVisitMetricsSnapshot;
  v7 = [(TAInterVisitMetricsSnapshot *)&v22 init];
  if (v7)
  {
    if (!v6)
    {
      unint64_t v20 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v6 copy];
    initialTime = v7->_initialTime;
    v7->_initialTime = (NSDate *)v8;

    uint64_t v10 = [v6 copy];
    lastUpdateTime = v7->_lastUpdateTime;
    v7->_lastUpdateTime = (NSDate *)v10;

    v7->_maxUniqueAddresses = a4;
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    accumulatedDeviceMetrics = v7->_accumulatedDeviceMetrics;
    v7->_accumulatedDeviceMetrics = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    firstAssociatedLocationPerDevice = v7->_firstAssociatedLocationPerDevice;
    v7->_firstAssociatedLocationPerDevice = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    lastAssociatedLocationPerDevice = v7->_lastAssociatedLocationPerDevice;
    v7->_lastAssociatedLocationPerDevice = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    lastAdvPerDevice = v7->_lastAdvPerDevice;
    v7->_lastAdvPerDevice = (NSMutableDictionary *)v18;

    v7->_isClosed = 0;
  }
  unint64_t v20 = v7;
LABEL_6:

  return v20;
}

- (void)visitEntryDelayCorrection:(id)a3 store:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v51 = v6;
  if ([v6 hasArrivalDate] && !objc_msgSend(v6, "hasDepartureDate"))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = self->_accumulatedDeviceMetrics;
    uint64_t v54 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v81 count:16];
    if (v54)
    {
      uint64_t v10 = *(void *)v63;
      id v11 = (os_log_t *)&TAStatusLog;
      *(void *)&long long v9 = 68289026;
      long long v44 = v9;
      v45 = self;
      id v46 = v7;
      uint64_t v53 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v63 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lastAdvPerDevice, "objectForKeyedSubscript:", v13, v44);
          if (v14)
          {
            uint64_t v55 = v13;
            lastUpdateTime = self->_lastUpdateTime;
            [v51 arrivalDate];
            uint64_t v16 = self;
            v17 = v11;
            v19 = id v18 = v7;
            uint64_t v20 = [(NSDate *)lastUpdateTime compare:v19];

            unint64_t v21 = [v14 getDate];
            objc_super v22 = [v51 arrivalDate];
            uint64_t v57 = [v21 compare:v22];

            v23 = (void *)MEMORY[0x263F08798];
            uint64_t v24 = [v51 arrivalDate];
            id v56 = v14;
            v25 = [v14 getDate];
            v26 = [v23 createIntervalSafelyWithStartDate:v24 endDate:v25];

            id v7 = v18;
            id v11 = v17;
            self = v16;
            [v26 duration];
            double v28 = v27;
            v29 = +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:v26 store:v7];
            uint64_t v52 = v20;
            BOOL v30 = v20 == -1;
            uint64_t v10 = v53;
            if (!v30 && v57 != -1)
            {
              v50 = v26;
              v48 = [(NSMutableDictionary *)v16->_accumulatedDeviceMetrics objectForKeyedSubscript:v55];
              [v48 accumulateDuration:-v28];
              id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              v49 = v29;
              id v32 = v29;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v80 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v59;
                do
                {
                  for (uint64_t j = 0; j != v34; ++j)
                  {
                    if (*(void *)v59 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v37 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                    v38 = NSNumber;
                    v39 = [v32 objectForKeyedSubscript:v37];
                    [v39 doubleValue];
                    v41 = [v38 numberWithDouble:-v40];
                    [v31 setObject:v41 forKeyedSubscript:v37];
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v58 objects:v80 count:16];
                }
                while (v34);
              }

              [v48 accumulateDurationPerMotionState:v31];
              self = v45;
              id v7 = v46;
              uint64_t v10 = v53;
              id v11 = (os_log_t *)&TAStatusLog;
              v29 = v49;
              v26 = v50;
            }
            v42 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68290307;
              int v67 = 0;
              __int16 v68 = 2082;
              v69 = "";
              __int16 v70 = 2113;
              uint64_t v71 = v55;
              __int16 v72 = 1026;
              BOOL v73 = v52 != -1;
              __int16 v74 = 1026;
              BOOL v75 = v57 != -1;
              __int16 v76 = 2050;
              double v77 = v28;
              __int16 v78 = 2114;
              uint64_t v79 = v29;
              _os_log_impl(&dword_22345C000, v42, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot visitEntryDelayCorrection evaluating metric\", \"address\":\"%{private}@\", \"updatedAfterVisitEntry\":%{public}hhd, \"hasAdvertisementAfterVisitEntry\":%{public}hhd, \"durationCorrection\":\"%{public}f\", \"motionStatesCorrection\":\"%{public}@\"}", buf, 0x3Cu);
            }

            uint64_t v14 = v56;
          }
          else
          {
            v43 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v44;
              int v67 = 0;
              __int16 v68 = 2082;
              v69 = "";
              _os_log_impl(&dword_22345C000, v43, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot missing latest advertisement for address in accumulatedDeviceMetrics\"}", buf, 0x12u);
            }
          }
        }
        uint64_t v54 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      }
      while (v54);
    }
  }
  else
  {
    uint64_t v8 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      _os_log_impl(&dword_22345C000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot got invalid visit in visitEntryDelayCorrection\"}", buf, 0x12u);
    }
  }
}

- (void)updateWithInterVisitMetricsSnapshot:(id)a3 store:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v60 = a4;
  id v7 = [v6 lastUpdateTime];
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v7;

  self->_isClosed = [v6 isClosed];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = [v6 accumulatedDeviceMetrics];
  uint64_t v66 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v73;
    long long v59 = v71;
    long long v61 = self;
    id v62 = v6;
    do
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)v73 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        id v11 = objc_msgSend(v6, "accumulatedDeviceMetrics", v59);
        uint64_t v12 = [v11 objectForKey:v10];

        uint64_t v13 = [(NSMutableDictionary *)self->_accumulatedDeviceMetrics objectForKey:v10];
        uint64_t v14 = [(NSMutableDictionary *)self->_accumulatedDeviceMetrics objectForKey:v10];

        if (v14)
        {
          objc_msgSend(v13, "accumulateNumOfAssociatedLocs:", objc_msgSend(v12, "numOfAssociatedLocs"));
          uint64_t v15 = [(NSMutableDictionary *)self->_lastAdvPerDevice objectForKeyedSubscript:v10];
          uint64_t v16 = [v6 lastAdvPerDevice];
          v17 = [v16 objectForKeyedSubscript:v10];

          int v67 = v15;
          if (v15 && v17)
          {
            id v18 = [v15 getDate];
            [v17 getDate];
            v19 = v17;
            v21 = uint64_t v20 = v15;
            uint64_t v22 = [v18 compare:v21];

            if (v22 == 1)
            {
              v17 = v19;
              self = v61;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
                -[TAInterVisitMetricsSnapshot updateWithInterVisitMetricsSnapshot:store:](&v70, v59);
              }
            }
            else
            {
              double v28 = (void *)MEMORY[0x263F08798];
              v29 = [v20 getDate];
              BOOL v30 = [v19 getDate];
              id v31 = [v28 createIntervalSafelyWithStartDate:v29 endDate:v30];

              [v31 duration];
              objc_msgSend(v13, "accumulateDuration:");
              id v32 = +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:v31 store:v60];
              [v13 accumulateDurationPerMotionState:v32];

              v17 = v19;
              self = v61;
            }
          }
          else
          {
            [v12 duration];
            objc_msgSend(v13, "accumulateDuration:");
            v26 = [v12 durationPerMotionState];
            [v13 accumulateDurationPerMotionState:v26];
          }
          [v12 distance];
          objc_msgSend(v13, "accumulateDistance:");
          uint64_t v33 = [(NSMutableDictionary *)self->_lastAssociatedLocationPerDevice objectForKeyedSubscript:v10];
          uint64_t v34 = [v6 firstAssociatedLocationPerDevice];
          uint64_t v35 = [v34 objectForKeyedSubscript:v10];

          if (v33 && v35)
          {
            long long v64 = v17;
            BOOL v36 = [v33 getDate];
            uint64_t v37 = [v35 getDate];
            uint64_t v38 = [v36 compare:v37];

            if (v38 == -1)
            {
              v76[0] = v33;
              v76[1] = v35;
              v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
              +[TAFilterGeneral distOfTravelAlong:v39];
              double v41 = v40;

              [v13 accumulateDistance:v41];
              id v6 = v62;
              v17 = v64;
            }
            else
            {
              id v6 = v62;
              v17 = v64;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
                -[TAInterVisitMetricsSnapshot updateWithInterVisitMetricsSnapshot:store:](&v68, v69);
              }
            }
          }
          v42 = [v12 sampledObservedLocations];
          [v13 accumulateSampledObservedLocations:v42];

          v43 = [v12 latestAdvertisement];
          [v13 accumulateLatestAdvertisement:v43];

LABEL_25:
          long long v44 = [(NSMutableDictionary *)self->_firstAssociatedLocationPerDevice objectForKeyedSubscript:v10];
          if (v44)
          {
LABEL_28:
          }
          else
          {
            v45 = [v6 firstAssociatedLocationPerDevice];
            id v46 = [v45 objectForKeyedSubscript:v10];

            if (v46)
            {
              firstAssociatedLocationPerDevice = self->_firstAssociatedLocationPerDevice;
              long long v44 = [v6 firstAssociatedLocationPerDevice];
              v48 = [v44 objectForKeyedSubscript:v10];
              [(NSMutableDictionary *)firstAssociatedLocationPerDevice setObject:v48 forKey:v10];

              goto LABEL_28;
            }
          }
          v49 = [v6 lastAssociatedLocationPerDevice];
          v50 = [v49 objectForKeyedSubscript:v10];

          if (v50)
          {
            lastAssociatedLocationPerDevice = self->_lastAssociatedLocationPerDevice;
            uint64_t v52 = [v6 lastAssociatedLocationPerDevice];
            uint64_t v53 = [v52 objectForKeyedSubscript:v10];
            [(NSMutableDictionary *)lastAssociatedLocationPerDevice setObject:v53 forKey:v10];
          }
          uint64_t v54 = [v6 lastAdvPerDevice];
          uint64_t v55 = [v54 objectForKeyedSubscript:v10];

          if (v55)
          {
            lastAdvPerDevice = self->_lastAdvPerDevice;
            uint64_t v57 = [v6 lastAdvPerDevice];
            long long v58 = [v57 objectForKeyedSubscript:v10];
            [(NSMutableDictionary *)lastAdvPerDevice setObject:v58 forKey:v10];
          }
          goto LABEL_33;
        }
        v23 = [(TAInterVisitMetricsSnapshot *)self accumulatedDeviceMetrics];
        unint64_t v24 = [v23 count];
        unint64_t v25 = [(TAInterVisitMetricsSnapshot *)self maxUniqueAddresses];

        if (v24 < v25)
        {
          [(NSMutableDictionary *)self->_accumulatedDeviceMetrics setObject:v12 forKey:v10];
          goto LABEL_25;
        }
        double v27 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289283;
          int v78 = 0;
          __int16 v79 = 2082;
          v80 = "";
          __int16 v81 = 2113;
          uint64_t v82 = v10;
          _os_log_impl(&dword_22345C000, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAInterVisitMetricsSnapshot snapshot full, not adding metrics for address\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
        }
LABEL_33:
      }
      uint64_t v66 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
    }
    while (v66);
  }
}

- (BOOL)isEqual:(id)a3
{
  v5 = (TAInterVisitMetricsSnapshot *)a3;
  if (self == v5)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      BOOL v7 = [(TAInterVisitMetricsSnapshot *)self isClosed];
      if (v7 != [(TAInterVisitMetricsSnapshot *)v6 isClosed])
      {
        char v8 = 0;
LABEL_40:

        goto LABEL_41;
      }
      long long v9 = [(TAInterVisitMetricsSnapshot *)self initialTime];
      uint64_t v10 = [(TAInterVisitMetricsSnapshot *)v6 initialTime];
      if (v9 != v10)
      {
        id v11 = [(TAInterVisitMetricsSnapshot *)self initialTime];
        v49 = [(TAInterVisitMetricsSnapshot *)v6 initialTime];
        v50 = v11;
        if (!objc_msgSend(v11, "isEqual:"))
        {
          char v8 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v12 = [(TAInterVisitMetricsSnapshot *)self lastUpdateTime];
      uint64_t v13 = [(TAInterVisitMetricsSnapshot *)v6 lastUpdateTime];
      if (v12 != v13)
      {
        v3 = [(TAInterVisitMetricsSnapshot *)self lastUpdateTime];
        v48 = [(TAInterVisitMetricsSnapshot *)v6 lastUpdateTime];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v8 = 0;
LABEL_36:

LABEL_37:
          if (v9 == v10)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
      }
      uint64_t v14 = [(TAInterVisitMetricsSnapshot *)self accumulatedDeviceMetrics];
      uint64_t v15 = [(TAInterVisitMetricsSnapshot *)v6 accumulatedDeviceMetrics];
      v47 = (void *)v14;
      BOOL v16 = v14 == v15;
      v17 = (void *)v15;
      if (!v16)
      {
        id v18 = [(TAInterVisitMetricsSnapshot *)self accumulatedDeviceMetrics];
        v42 = [(TAInterVisitMetricsSnapshot *)v6 accumulatedDeviceMetrics];
        v43 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v8 = 0;
          v19 = v47;
LABEL_34:

LABEL_35:
          if (v12 == v13) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }
      uint64_t v20 = [(TAInterVisitMetricsSnapshot *)self firstAssociatedLocationPerDevice];
      uint64_t v45 = [(TAInterVisitMetricsSnapshot *)v6 firstAssociatedLocationPerDevice];
      id v46 = (void *)v20;
      long long v44 = v17;
      if (v20 == v45)
      {
        uint64_t v38 = v13;
      }
      else
      {
        unint64_t v21 = v3;
        uint64_t v22 = [(TAInterVisitMetricsSnapshot *)self firstAssociatedLocationPerDevice];
        double v40 = [(TAInterVisitMetricsSnapshot *)v6 firstAssociatedLocationPerDevice];
        double v41 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          char v8 = 0;
          unint64_t v25 = (void *)v45;
          v3 = v21;
LABEL_32:

LABEL_33:
          v17 = v44;
          v19 = v47;
          if (v47 == v44) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        uint64_t v38 = v13;
        v3 = v21;
      }
      v23 = [(TAInterVisitMetricsSnapshot *)self lastAssociatedLocationPerDevice];
      uint64_t v39 = [(TAInterVisitMetricsSnapshot *)v6 lastAssociatedLocationPerDevice];
      if (v23 == (void *)v39)
      {
        uint64_t v34 = v3;
        uint64_t v35 = v12;
      }
      else
      {
        unint64_t v24 = [(TAInterVisitMetricsSnapshot *)self lastAssociatedLocationPerDevice];
        BOOL v36 = [(TAInterVisitMetricsSnapshot *)v6 lastAssociatedLocationPerDevice];
        uint64_t v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          char v8 = 0;
          uint64_t v13 = v38;
          id v31 = (void *)v39;
          goto LABEL_30;
        }
        uint64_t v34 = v3;
        uint64_t v35 = v12;
      }
      v26 = [(TAInterVisitMetricsSnapshot *)self lastAdvPerDevice];
      uint64_t v27 = [(TAInterVisitMetricsSnapshot *)v6 lastAdvPerDevice];
      if (v26 == (void *)v27)
      {

        char v8 = 1;
      }
      else
      {
        double v28 = (void *)v27;
        [(TAInterVisitMetricsSnapshot *)self lastAdvPerDevice];
        v29 = uint64_t v33 = v23;
        BOOL v30 = [(TAInterVisitMetricsSnapshot *)v6 lastAdvPerDevice];
        char v8 = [v29 isEqual:v30];

        v23 = v33;
      }
      uint64_t v13 = v38;
      id v31 = (void *)v39;
      v3 = v34;
      uint64_t v12 = v35;
      if (v23 == (void *)v39)
      {
LABEL_31:

        unint64_t v25 = (void *)v45;
        if (v46 == (void *)v45) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    char v8 = 0;
  }
LABEL_41:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricsSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TAInterVisitMetricsSnapshot;
  v5 = [(TAInterVisitMetricsSnapshot *)&v35 init];
  if (v5)
  {
    v5->_isClosed = [v4 decodeBoolForKey:@"IsClosed"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InitTime"];
    initialTime = v5->_initialTime;
    v5->_initialTime = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastUpdateTime"];
    lastUpdateTime = v5->_lastUpdateTime;
    v5->_lastUpdateTime = (NSDate *)v8;

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"accumMetrics"];
    accumulatedDeviceMetrics = v5->_accumulatedDeviceMetrics;
    v5->_accumulatedDeviceMetrics = (NSMutableDictionary *)v14;

    BOOL v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"firstLoc"];
    firstAssociatedLocationPerDevice = v5->_firstAssociatedLocationPerDevice;
    v5->_firstAssociatedLocationPerDevice = (NSMutableDictionary *)v20;

    uint64_t v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    unint64_t v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"lastLoc"];
    lastAssociatedLocationPerDevice = v5->_lastAssociatedLocationPerDevice;
    v5->_lastAssociatedLocationPerDevice = (NSMutableDictionary *)v26;

    double v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    id v31 = objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"LastAdv"];
    lastAdvPerDevice = v5->_lastAdvPerDevice;
    v5->_lastAdvPerDevice = (NSMutableDictionary *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isClosed = self->_isClosed;
  id v5 = a3;
  [v5 encodeBool:isClosed forKey:@"IsClosed"];
  [v5 encodeObject:self->_initialTime forKey:@"InitTime"];
  [v5 encodeObject:self->_lastUpdateTime forKey:@"LastUpdateTime"];
  [v5 encodeObject:self->_accumulatedDeviceMetrics forKey:@"accumMetrics"];
  [v5 encodeObject:self->_firstAssociatedLocationPerDevice forKey:@"firstLoc"];
  [v5 encodeObject:self->_lastAssociatedLocationPerDevice forKey:@"lastLoc"];
  [v5 encodeObject:self->_lastAdvPerDevice forKey:@"LastAdv"];
}

- (NSDate)initialTime
{
  return self->_initialTime;
}

- (unint64_t)maxUniqueAddresses
{
  return self->_maxUniqueAddresses;
}

- (NSMutableDictionary)firstAssociatedLocationPerDevice
{
  return self->_firstAssociatedLocationPerDevice;
}

- (NSMutableDictionary)lastAssociatedLocationPerDevice
{
  return self->_lastAssociatedLocationPerDevice;
}

- (NSMutableDictionary)lastAdvPerDevice
{
  return self->_lastAdvPerDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdvPerDevice, 0);
  objc_storeStrong((id *)&self->_lastAssociatedLocationPerDevice, 0);
  objc_storeStrong((id *)&self->_firstAssociatedLocationPerDevice, 0);
  objc_storeStrong((id *)&self->_accumulatedDeviceMetrics, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_initialTime, 0);
}

- (void)updateInterVisitMetric:(os_log_t)log store:withUpdatedTime:andCloseSnapshot:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22345C000, log, OS_LOG_TYPE_DEBUG, "#TAInterVisitMetricsSnapshot receiving updates from the past to close the snapshot; ignore the update content but cl"
    "ose the snapshot",
    v1,
    2u);
}

- (void)updateInterVisitMetric:(os_log_t)log store:withUpdatedTime:andCloseSnapshot:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22345C000, log, OS_LOG_TYPE_DEBUG, "#TAInterVisitMetricsSnapshot receiving updates from the past; ignore them",
    v1,
    2u);
}

- (void)updateInterVisitMetric:(unsigned char *)a1 store:(unsigned char *)a2 withUpdatedTime:andCloseSnapshot:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  _os_log_error_impl(&dword_22345C000, v2, OS_LOG_TYPE_ERROR, "#TAInterVisitMetricsSnapshot observing out-of-order advertisements; use the observation interval in the summary",
    v3,
    2u);
}

- (void)updateInterVisitMetric:(os_log_t)log store:withUpdatedTime:andCloseSnapshot:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "#TAInterVisitMetricsSnapshot attempting to close inter-visit snapshot multiple times; ignore this update",
    v1,
    2u);
}

- (void)updateWithInterVisitMetricsSnapshot:(unsigned char *)a1 store:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  _os_log_error_impl(&dword_22345C000, v2, OS_LOG_TYPE_ERROR, "#TAInterVisitMetricsSnapshot latestest current location and earliest next location out of order", v3, 2u);
}

- (void)updateWithInterVisitMetricsSnapshot:(unsigned char *)a1 store:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  _os_log_fault_impl(&dword_22345C000, v2, OS_LOG_TYPE_FAULT, "#TAInterVisitMetricsSnapshot latestest advertisements out of order", v3, 2u);
}

@end