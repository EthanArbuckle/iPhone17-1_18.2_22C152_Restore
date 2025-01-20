@interface RTPeopleDensityRecordRunningRecentObservation
- (NSMutableArray)runningAdvertisementsPerRecord;
- (NSMutableArray)runningRecords;
- (RTPeopleDensityRecordRunningRecentObservation)init;
- (double)currentObservationIntervalSeconds;
- (float)currentConfidenceThreshold;
- (id)getHistogram;
- (void)addRecord:(id)a3;
- (void)setCurrentConfidenceThreshold:(float)a3;
- (void)setCurrentObservationIntervalSeconds:(double)a3;
- (void)setRunningAdvertisementsPerRecord:(id)a3;
- (void)setRunningRecords:(id)a3;
- (void)trimRunningRecordsBeforeRef:(id)a3;
- (void)updateHistogramWithAdvs:(id)a3;
@end

@implementation RTPeopleDensityRecordRunningRecentObservation

- (RTPeopleDensityRecordRunningRecentObservation)init
{
  v9.receiver = self;
  v9.super_class = (Class)RTPeopleDensityRecordRunningRecentObservation;
  v2 = [(RTPeopleDensityRecordRunningRecentObservation *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentObservationIntervalSeconds = 300.0;
    v2->_currentConfidenceThreshold = 0.0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    runningRecords = v3->_runningRecords;
    v3->_runningRecords = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    runningAdvertisementsPerRecord = v3->_runningAdvertisementsPerRecord;
    v3->_runningAdvertisementsPerRecord = v6;
  }
  return v3;
}

- (void)updateHistogramWithAdvs:(id)a3
{
}

- (void)addRecord:(id)a3
{
}

- (id)getHistogram
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = self->_runningAdvertisementsPerRecord;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ([v15 rssi] < 0) {
                [v3 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v16 = +[RTPeopleDensityRecord computeRssiHistogramForAdvs:v3];

  return v16;
}

- (void)trimRunningRecordsBeforeRef:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(NSMutableArray *)self->_runningRecords count];
    uint64_t v7 = [(NSMutableArray *)self->_runningRecords firstObject];
    v8 = [v7 startDatetime];
    double currentObservationIntervalSeconds = self->_currentObservationIntervalSeconds;
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    long long v22 = v8;
    __int16 v23 = 2048;
    double v24 = currentObservationIntervalSeconds;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord trimRunningRecords count:%lu, startDatetime: %@, currentObservationInterval(s): %f", buf, 0x20u);
  }
  if ((unint64_t)[(NSMutableArray *)self->_runningRecords count] >= 2)
  {
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      uint64_t v11 = [(NSMutableArray *)self->_runningRecords firstObject];
      uint64_t v12 = [v11 startDatetime];
      [v4 timeIntervalSinceDate:v12];
      double v14 = v13;
      double v15 = self->_currentObservationIntervalSeconds;

      if (v14 <= v15) {
        break;
      }
      v16 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(NSMutableArray *)self->_runningRecords firstObject];
        *(_DWORD *)buf = v18;
        uint64_t v20 = (uint64_t)v17;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord trimRunningRecords old bundle: %@", buf, 0xCu);
      }
      [(NSMutableArray *)self->_runningRecords removeObjectAtIndex:0];
      [(NSMutableArray *)self->_runningAdvertisementsPerRecord removeObjectAtIndex:0];
    }
    while ((unint64_t)[(NSMutableArray *)self->_runningRecords count] > 1);
  }
}

- (NSMutableArray)runningRecords
{
  return self->_runningRecords;
}

- (void)setRunningRecords:(id)a3
{
}

- (NSMutableArray)runningAdvertisementsPerRecord
{
  return self->_runningAdvertisementsPerRecord;
}

- (void)setRunningAdvertisementsPerRecord:(id)a3
{
}

- (double)currentObservationIntervalSeconds
{
  return self->_currentObservationIntervalSeconds;
}

- (void)setCurrentObservationIntervalSeconds:(double)a3
{
  self->_double currentObservationIntervalSeconds = a3;
}

- (float)currentConfidenceThreshold
{
  return self->_currentConfidenceThreshold;
}

- (void)setCurrentConfidenceThreshold:(float)a3
{
  self->_currentConfidenceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAdvertisementsPerRecord, 0);

  objc_storeStrong((id *)&self->_runningRecords, 0);
}

@end