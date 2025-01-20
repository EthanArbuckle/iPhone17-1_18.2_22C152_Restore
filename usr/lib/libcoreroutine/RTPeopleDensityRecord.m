@interface RTPeopleDensityRecord
+ (BOOL)supportsSecureCoding;
+ (id)computeEventMetrics:(id)a3;
+ (id)computeRssiHistogramForAdvs:(id)a3;
+ (int)_computeMeanOfRssi:(id)a3;
+ (void)_computeDensityScore:(double *)a3 scanDuration:(double *)a4 forRecords:(id)a5;
- (NSDate)bundleStartDate;
- (NSMutableArray)records;
- (NSMutableDictionary)addressToRssiValues;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTPeopleDensity)ongoingPeopleDensityEvent;
- (RTPeopleDensityRecord)initWithCoder:(id)a3;
- (RTPeopleDensityRecord)initWithQueue:(id)a3 peopleDensityStore:(id)a4 defaultsManager:(id)a5;
- (RTPeopleDensityRecordRunningRecentObservation)runningRecentBundle;
- (RTPeopleDensityStore)peopleDensityStore;
- (float)highDensityThreshold;
- (id)computeRssiHistogram;
- (id)fetchCurrentObservationBundle;
- (id)fetchOngoingPeopleDensityBundle:(id)a3 endDate:(id)a4;
- (unint64_t)maxBackstopDuration;
- (unint64_t)maxBundleDuration;
- (void)_closeDensityBundle:(id)a3;
- (void)cleanUpOngoingPeopleDensityBundle;
- (void)closeDensityBundle:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCurrentScoreAndScanDuration:(double *)a3 scanDuration:(double *)a4;
- (void)mergeWithAnotherDensityRecord:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setHighDensityThreshold:(float)a3;
- (void)setMaxBackstopDuration:(unint64_t)a3;
- (void)setMaxBundleDuration:(unint64_t)a3;
- (void)setOngoingPeopleDensityEvent:(id)a3;
- (void)setPeopleDensityStore:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecords:(id)a3;
- (void)setRunningRecentBundle:(id)a3;
- (void)updateConfidenceThreshold:(float)a3;
- (void)updateObservationIntervalSeconds:(double)a3;
- (void)updateRSSIHistogramOnAdvertisementReceived:(id)a3;
- (void)updateRecordOnFetchComplete:(unint64_t)a3 scanDuration:(double)a4 referenceDate:(id)a5 advertisements:(id)a6;
@end

@implementation RTPeopleDensityRecord

- (RTPeopleDensityRecord)initWithQueue:(id)a3 peopleDensityStore:(id)a4 defaultsManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v28 = 0;
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: peopleDensityStore";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_9;
  }
  if (!v11)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_21;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTPeopleDensityRecord;
  v13 = [(RTPeopleDensityRecord *)&v34 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v14->_peopleDensityStore, a4);
    objc_storeStrong((id *)&v14->_defaultsManager, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v14->_records;
    v14->_records = v15;

    v17 = objc_alloc_init(RTPeopleDensityRecordRunningRecentObservation);
    runningRecentBundle = v14->_runningRecentBundle;
    v14->_runningRecentBundle = v17;

    uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantPast];
    bundleStartDate = v14->_bundleStartDate;
    v14->_bundleStartDate = (NSDate *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addressToRssiValues = v14->_addressToRssiValues;
    v14->_addressToRssiValues = v21;

    v23 = [v12 objectForKey:@"RTDefaultsPeopleDiscoveryProviderDensityBundleDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v23 doubleValue];
      unint64_t v25 = (unint64_t)v24;
    }
    else
    {
      unint64_t v25 = 3600;
    }
    v14->_maxBundleDuration = v25;
    v29 = [v12 objectForKey:@"RTDefaultsPeopleDiscoveryProviderHighDensityThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v29 floatValue];
    }
    else {
      int v30 = 1128792064;
    }
    LODWORD(v14->_highDensityThreshold) = v30;
    v31 = [v12 objectForKey:@"RTDefaultsPeopleDiscoveryProviderMaximumBackstopDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v32 = (unint64_t)(double)[v31 integerValue];
    }
    else {
      unint64_t v32 = 28800;
    }
    v14->_maxBackstopDuration = v32;
  }
  self = v14;
  v28 = self;
LABEL_19:

  return v28;
}

- (void)updateRecordOnFetchComplete:(unint64_t)a3 scanDuration:(double)a4 referenceDate:(id)a5 advertisements:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  p_bundleStartDate = &self->_bundleStartDate;
  [v11 timeIntervalSinceDate:self->_bundleStartDate];
  double v15 = v14;
  bundleStartDate = self->_bundleStartDate;
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  if (bundleStartDate == (NSDate *)v17)
  {

    goto LABEL_10;
  }
  v18 = (void *)v17;
  uint64_t v19 = [v11 compare:*p_bundleStartDate];

  if (v19 == -1)
  {
LABEL_10:
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v25 = [v11 getFormattedDateString];
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = (uint64_t)v25;
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord update bundle start time to, %@", buf, 0xCu);
    }
    v23 = (NSDate *)v11;
    double v24 = (RTPeopleDensity *)*p_bundleStartDate;
    *p_bundleStartDate = v23;
    goto LABEL_19;
  }
  if (v15 < (double)self->_maxBundleDuration) {
    goto LABEL_20;
  }
  if (v15 < (double)self->_maxBackstopDuration)
  {
    double v47 = 0.0;
    double v48 = -1.0;
    [(id)objc_opt_class() _computeDensityScore:&v48 scanDuration:&v47 forRecords:self->_records];
    v20 = [(RTPeopleDensityRecord *)self computeRssiHistogram];
    if (v48 >= 0.0 && v47 > 1.0)
    {
      ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
      if (ongoingPeopleDensityEvent) {
        [(RTPeopleDensity *)ongoingPeopleDensityEvent uuid];
      }
      else {
      v41 = [MEMORY[0x1E4F29128] UUID:v47];
      }
      id v26 = objc_alloc(MEMORY[0x1E4F5CE60]);
      v42 = v20;
      v27 = (void *)[v26 initWithBundleUUID:v41 startDate:*p_bundleStartDate endDate:v11 densityScore:v20 scanDuration:v48 rssiHistogram:v47];
      v28 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = [v27 description:v41];
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v39;
        v40 = (void *)v39;
        _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord storing people density bundle, %@", buf, 0xCu);
      }
      [(RTPeopleDensityRecord *)self closeDensityBundle:v27];

      v20 = v42;
    }
  }
  objc_storeStrong((id *)&self->_bundleStartDate, a5);
  [(NSMutableArray *)self->_records removeAllObjects];
  [(NSMutableDictionary *)self->_addressToRssiValues removeAllObjects];
  double v24 = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = 0;
LABEL_19:

LABEL_20:
  v29 = [[RTPeopleDensitySingleRecord alloc] initWithStats:a3 scanDuration:a4];
  [(RTPeopleDensitySingleRecord *)v29 setStartDatetime:v11];
  [(NSMutableArray *)self->_records addObject:v29];
  [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle addRecord:v29];
  [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle updateHistogramWithAdvs:v12];
  runningRecentBundle = self->_runningRecentBundle;
  v31 = [MEMORY[0x1E4F1C9C8] now];
  [(RTPeopleDensityRecordRunningRecentObservation *)runningRecentBundle trimRunningRecordsBeforeRef:v31];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v12;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v38 = (void *)MEMORY[0x1E016D870]();
        [(RTPeopleDensityRecord *)self updateRSSIHistogramOnAdvertisementReceived:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v34);
  }
}

- (void)updateRSSIHistogramOnAdvertisementReceived:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rssi];
  v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v7 = v6;
  if (v5 < 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [v4 description];
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord update RSSI histogram for advertisement, %@", buf, 0xCu);
    }
    addressToRssiValues = self->_addressToRssiValues;
    id v10 = [v4 address];
    id v11 = [(NSMutableDictionary *)addressToRssiValues objectForKey:v10];

    if (v11)
    {
      id v12 = self->_addressToRssiValues;
      v13 = [v4 address];
      v7 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];

      if (v7)
      {
        v8 = [NSNumber numberWithInteger:[v4 rssi]];
        [v7 addObject:v8];
      }
      else
      {
        v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v20 = [v4 address];
          *(_DWORD *)buf = 138412290;
          v23 = v20;
          _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord _addressToRssiValues has nil entry at address %@", buf, 0xCu);
        }
      }
      goto LABEL_12;
    }
    double v14 = (void *)MEMORY[0x1E4F1CA48];
    double v15 = [NSNumber numberWithInteger:[v4 rssi]];
    v21 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v7 = [v14 arrayWithArray:v16];

    uint64_t v17 = self->_addressToRssiValues;
    v18 = [v4 address];
    [(NSMutableDictionary *)v17 setObject:v7 forKeyedSubscript:v18];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord received invalid RSSI value, adv, %@", buf, 0xCu);
LABEL_12:
  }
}

- (void)getCurrentScoreAndScanDuration:(double *)a3 scanDuration:(double *)a4
{
  v7 = objc_opt_class();
  records = self->_records;

  [v7 _computeDensityScore:a3 scanDuration:a4 forRecords:records];
}

- (id)fetchOngoingPeopleDensityBundle:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    double v15 = "Invalid parameter not satisfying: startDate";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_10;
  }
  if (!v7)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    double v15 = "Invalid parameter not satisfying: endDate";
    goto LABEL_16;
  }
  if ([v7 compare:self->_bundleStartDate] == -1)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord generating real-time bundle", buf, 2u);
  }

  double v17 = 0.0;
  *(void *)buf = 0xBFF0000000000000;
  [(id)objc_opt_class() _computeDensityScore:buf scanDuration:&v17 forRecords:self->_records];
  id v10 = [(RTPeopleDensityRecord *)self computeRssiHistogram];
  id v11 = objc_alloc(MEMORY[0x1E4F5CE60]);
  id v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = (void *)[v11 initWithBundleUUID:v12 startDate:self->_bundleStartDate endDate:0 densityScore:v10 scanDuration:*(double *)buf rssiHistogram:v17];

  objc_storeStrong((id *)&self->_ongoingPeopleDensityEvent, v13);
LABEL_12:

  return v13;
}

- (id)fetchCurrentObservationBundle
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v26 = 0.0;
  *(double *)&unint64_t v27 = -1.0;
  v3 = [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle runningRecords];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 startDatetime];

  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  id v9 = objc_opt_class();
  id v10 = [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle runningRecords];
  [v9 _computeDensityScore:&v27 scanDuration:&v26 forRecords:v10];

  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = v26;
    [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle currentConfidenceThreshold];
    *(_DWORD *)buf = 138413058;
    v29 = v5;
    __int16 v30 = 2048;
    double v31 = v8;
    __int16 v32 = 2048;
    double v33 = v12;
    __int16 v34 = 2048;
    double v35 = v13;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#RTPeopleDensityRecord fetchCurrentHighConfidenceBundle runningRecordsStartdatetime:%@, theoreticalObsSpanSeconds: %f, totalScanDuration: %f, currentConfidenceThreshold: %f", buf, 0x2Au);
  }

  double v14 = v26 / v8;
  [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle currentConfidenceThreshold];
  if (v14 <= v15)
  {
    uint64_t v24 = 0;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F5CE60]);
    double v17 = [MEMORY[0x1E4F29128] UUID];
    v18 = [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle runningRecords];
    uint64_t v19 = [v18 firstObject];
    v20 = [v19 startDatetime];
    double v22 = v26;
    double v21 = *(double *)&v27;
    v23 = [(RTPeopleDensityRecordRunningRecentObservation *)self->_runningRecentBundle getHistogram];
    uint64_t v24 = (void *)[v16 initWithBundleUUID:v17 startDate:v20 endDate:0 densityScore:v23 scanDuration:v21 rssiHistogram:v22];
  }

  return v24;
}

+ (void)_computeDensityScore:(double *)a3 scanDuration:(double *)a4 forRecords:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) scanDuration];
        double v11 = v11 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
    if (v11 != 0.0)
    {
      *a4 = v11;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        double v18 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
            [v20 scanDuration:v26];
            double v22 = 1.0 / (v21 / 900.0 + 1.0);
            double v23 = (double)(unint64_t)[v20 advertisementsCount];
            [v20 scanDuration];
            double v18 = v18 + v22 * (v24 / v11 * v23);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v16);
      }
      else
      {
        double v18 = 0.0;
      }

      *a3 = v18;
      goto LABEL_23;
    }
  }
  else
  {
    double v11 = 0.0;
  }
  unint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#RTPeopleDensityRecord receives zero total scan duration when computing scores", buf, 2u);
  }

  *a3 = -1.0;
  *a4 = v11;
LABEL_23:
}

- (id)computeRssiHistogram
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [(NSMutableDictionary *)self->_addressToRssiValues allKeys];
    *(_DWORD *)buf = 138412290;
    double v24 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "#RTPeopleDensityRecord computing RSSI histogram, unique addresses %@", buf, 0xCu);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_addressToRssiValues allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_addressToRssiValues objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        if ([v9 count])
        {
          uint64_t v10 = [NSNumber numberWithInt:[objc_opt_class() _computeMeanOfRssi:v9]];
          double v11 = [v3 objectForKey:v10];

          if (v11)
          {
            double v12 = [v3 objectForKeyedSubscript:v10];
            uint64_t v13 = [v12 integerValue] + 1;

            id v14 = [NSNumber numberWithInteger:v13];
            [v3 setObject:v14 forKeyedSubscript:v10];
          }
          else
          {
            [v3 setObject:&unk_1F3450CA8 forKeyedSubscript:v10];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (int)_computeMeanOfRssi:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          double v8 = v8 + (double)(int)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue:v13];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    int v11 = 3 * (uint64_t)rint(v8 / (double)(unint64_t)[v4 count] / 3.0);
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "_computeMeanOfRssi divide by 0: %@", buf, 0xCu);
    }

    int v11 = 0;
  }

  return v11;
}

+ (id)computeRssiHistogramForAdvs:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v11 = [v10 address];
        double v12 = [v5 objectForKeyedSubscript:v11];

        if (!v12)
        {
          long long v13 = objc_opt_new();
          long long v14 = [v10 address];
          [v5 setObject:v13 forKeyedSubscript:v14];
        }
        long long v15 = [v10 address];
        long long v16 = [v5 objectForKeyedSubscript:v15];
        uint64_t v17 = [NSNumber numberWithInteger:[v10 rssi]];
        [v16 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v30 = [v5 allKeys];
  uint64_t v18 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v30);
        }
        double v22 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        if ([v22 count])
        {
          uint64_t v23 = [a1 _computeMeanOfRssi:v22];
          double v24 = [NSNumber numberWithInt:v23];
          uint64_t v25 = [v4 objectForKey:v24];

          if (v25)
          {
            long long v26 = [v4 objectForKeyedSubscript:v24];
            uint64_t v27 = [v26 integerValue] + 1;

            long long v28 = [NSNumber numberWithInteger:v27];
            [v4 setObject:v28 forKeyedSubscript:v24];
          }
          else
          {
            [v4 setObject:&unk_1F3450CA8 forKeyedSubscript:v24];
          }
        }
      }
      uint64_t v19 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }

  return v4;
}

- (void)closeDensityBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTPeopleDensityRecord *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTPeopleDensityRecord_closeDensityBundle___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__RTPeopleDensityRecord_closeDensityBundle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDensityBundle:*(void *)(a1 + 40)];
}

- (void)_closeDensityBundle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(RTPeopleDensityRecord *)self peopleDensityStore];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke;
    v21[3] = &unk_1E6B90CB8;
    SEL v23 = a2;
    uint64_t v7 = v5;
    double v22 = v7;
    [v6 storePeopleDensity:v7 handler:v21];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_39;
    v19[3] = &unk_1E6B94930;
    v19[4] = self;
    uint64_t v20 = v7;
    id v8 = (void *)MEMORY[0x1E016DB00](v19);
    id v9 = [NSString alloc];
    uint64_t v10 = (void *)[v9 initWithCString:RTAnalyticsEventPeopleDiscoveryDensityEvents encoding:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_2;
    v16[3] = &unk_1E6B943B0;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    id v12 = v8;
    long long v13 = (void *)MEMORY[0x1E016DB00](v16);
    long long v14 = [NSString stringWithFormat:@"com.apple.%@", v11];
    AnalyticsSendEventLazy();

    long long v15 = v22;
  }
  else
  {
    long long v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundle", buf, 2u);
    }
  }
}

void __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_39(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 computeEventMetrics:v3];
}

id __45__RTPeopleDensityRecord__closeDensityBundle___block_invoke_2(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

+ (id)computeEventMetrics:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 endDate];
  if (v5)
  {
    uint64_t v6 = [v3 endDate];
    int v7 = [v3 startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }

  uint64_t v10 = [NSNumber numberWithDouble:v9];
  [v4 setObject:v10 forKeyedSubscript:@"eventDuration"];

  __int16 v11 = NSNumber;
  [v3 densityScore];
  id v12 = [v11 numberWithDouble:];
  [v4 setObject:v12 forKeyedSubscript:@"densityScore"];

  uint64_t v13 = NSNumber;
  [v3 scanDuration];
  long long v14 = [v13 numberWithDouble:x0];
  [v4 setObject:v14 forKeyedSubscript:@"scanDuration"];

  return v4;
}

- (void)cleanUpOngoingPeopleDensityBundle
{
  [(NSMutableArray *)self->_records removeAllObjects];
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  bundleStartDate = self->_bundleStartDate;
  self->_bundleStartDate = v3;

  ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = 0;

  addressToRssiValues = self->_addressToRssiValues;

  [(NSMutableDictionary *)addressToRssiValues removeAllObjects];
}

- (void)mergeWithAnotherDensityRecord:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherRecord", buf, 2u);
    }
    goto LABEL_34;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v4 bundleStartDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;
  double maxBackstopDuration = (double)self->_maxBackstopDuration;

  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 >= maxBackstopDuration)
  {
    if (v11)
    {
      double v24 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v25 = [v4 bundleStartDate];
      *(_DWORD *)buf = 138412546;
      uint64_t v51 = (uint64_t)v24;
      __int16 v52 = 2112;
      v53 = v25;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "dropping people density records for stale records, current time, %@, bundle start time, %@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  if (v11)
  {
    id v12 = [v4 records];
    uint64_t v13 = [v12 count];
    long long v14 = [v4 ongoingPeopleDensityEvent];
    long long v15 = [v14 description];
    long long v16 = [v4 bundleStartDate];
    id v17 = [v4 addressToRssiValues];
    *(_DWORD *)buf = 134218754;
    uint64_t v51 = v13;
    __int16 v52 = 2112;
    v53 = v15;
    __int16 v54 = 2112;
    v55 = v16;
    __int16 v56 = 2048;
    uint64_t v57 = [v17 count];
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "merging density record: number of records, %lu, ongoing density event, %@, bundle start time, %@, number of RSSI records, %lu", buf, 0x2Au);
  }
  id v18 = [v4 records];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    records = self->_records;
    long long v21 = [v4 records];
    [(NSMutableArray *)records addObjectsFromArray:v21];
  }
  ongoingPeopleDensityEvent = self->_ongoingPeopleDensityEvent;
  if (ongoingPeopleDensityEvent)
  {
    SEL v23 = ongoingPeopleDensityEvent;
  }
  else
  {
    SEL v23 = [v4 ongoingPeopleDensityEvent];
  }
  long long v26 = self->_ongoingPeopleDensityEvent;
  self->_ongoingPeopleDensityEvent = v23;

  bundleStartDate = self->_bundleStartDate;
  long long v28 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([(NSDate *)bundleStartDate isEqualToDate:v28])
  {
    long long v29 = [v4 bundleStartDate];

    if (v29)
    {
      id v30 = [v4 bundleStartDate];
      long long v31 = self->_bundleStartDate;
      self->_bundleStartDate = v30;
      goto LABEL_22;
    }
  }
  else
  {
  }
  long long v31 = [v4 bundleStartDate];
  if (v31)
  {
    long long v32 = [v4 bundleStartDate];
    long long v33 = [v32 earlierDate:self->_bundleStartDate];
    long long v34 = self->_bundleStartDate;
    self->_bundleStartDate = v33;
  }
  else
  {
    long long v35 = self->_bundleStartDate;
    long long v32 = self->_bundleStartDate;
    self->_bundleStartDate = v35;
  }

LABEL_22:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v10 = [v4 addressToRssiValues];
  uint64_t v36 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(v10);
        }
        uint64_t v40 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v41 = [(NSMutableDictionary *)self->_addressToRssiValues objectForKey:v40];

        if (v41)
        {
          v42 = [(NSMutableDictionary *)self->_addressToRssiValues objectForKeyedSubscript:v40];
          if (!v42) {
            goto LABEL_32;
          }
          uint64_t v43 = [v4 addressToRssiValues];
          long long v44 = [v43 objectForKeyedSubscript:v40];
          [v42 addObjectsFromArray:v44];
        }
        else
        {
          v42 = [v4 addressToRssiValues];
          uint64_t v43 = [v42 objectForKeyedSubscript:v40];
          [(NSMutableDictionary *)self->_addressToRssiValues setObject:v43 forKeyedSubscript:v40];
        }

LABEL_32:
      }
      uint64_t v37 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v37);
  }
LABEL_34:
}

- (void)updateObservationIntervalSeconds:(double)a3
{
}

- (void)updateConfidenceThreshold:(float)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensityRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTPeopleDensityRecord;
  id v5 = [(RTPeopleDensityRecord *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    double v8 = [v6 setWithObjects:v7, objc_opt_class(), 0];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"DensityRecord"];
    records = v5->_records;
    v5->_records = (NSMutableArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OngoingPeopleDensityEvent"];
    ongoingPeopleDensityEvent = v5->_ongoingPeopleDensityEvent;
    v5->_ongoingPeopleDensityEvent = (RTPeopleDensity *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleStartDate"];
    bundleStartDate = v5->_bundleStartDate;
    v5->_bundleStartDate = (NSDate *)v13;

    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [v15 setWithObjects:v16, v17, v18, objc_opt_class(), nil];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"RSSIRecords"];
    addressToRssiValues = v5->_addressToRssiValues;
    v5->_addressToRssiValues = (NSMutableDictionary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  records = self->_records;
  id v5 = a3;
  [v5 encodeObject:records forKey:@"DensityRecord"];
  [v5 encodeObject:self->_ongoingPeopleDensityEvent forKey:@"OngoingPeopleDensityEvent"];
  [v5 encodeObject:self->_bundleStartDate forKey:@"BundleStartDate"];
  [v5 encodeObject:self->_addressToRssiValues forKey:@"RSSIRecords"];
}

- (NSDate)bundleStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)addressToRssiValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (RTPeopleDensityRecordRunningRecentObservation)runningRecentBundle
{
  return self->_runningRecentBundle;
}

- (void)setRunningRecentBundle:(id)a3
{
}

- (RTPeopleDensity)ongoingPeopleDensityEvent
{
  return self->_ongoingPeopleDensityEvent;
}

- (void)setOngoingPeopleDensityEvent:(id)a3
{
}

- (unint64_t)maxBundleDuration
{
  return self->_maxBundleDuration;
}

- (void)setMaxBundleDuration:(unint64_t)a3
{
  self->_maxBundleDuration = a3;
}

- (unint64_t)maxBackstopDuration
{
  return self->_maxBackstopDuration;
}

- (void)setMaxBackstopDuration:(unint64_t)a3
{
  self->_double maxBackstopDuration = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTPeopleDensityStore)peopleDensityStore
{
  return self->_peopleDensityStore;
}

- (void)setPeopleDensityStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (float)highDensityThreshold
{
  return self->_highDensityThreshold;
}

- (void)setHighDensityThreshold:(float)a3
{
  self->_highDensityThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_peopleDensityStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_ongoingPeopleDensityEvent, 0);
  objc_storeStrong((id *)&self->_runningRecentBundle, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_addressToRssiValues, 0);

  objc_storeStrong((id *)&self->_bundleStartDate, 0);
}

@end