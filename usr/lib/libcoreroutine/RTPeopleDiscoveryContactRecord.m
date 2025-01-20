@interface RTPeopleDiscoveryContactRecord
+ (BOOL)supportsSecureCoding;
+ (id)computeEventMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)bundleStartDate;
- (NSHashTable)observers;
- (NSMutableDictionary)contactRecord;
- (NSMutableDictionary)contactScores;
- (RTPeopleDiscoveryContactRecord)init;
- (RTPeopleDiscoveryContactRecord)initWithCoder:(id)a3;
- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3;
- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 defaultsManager:(id)a4;
- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 minObservationDuration:(unint64_t)a4 maxSeparationDuration:(unint64_t)a5 maxBackstopDuration:(unint64_t)a6 maxBundleDuration:(unint64_t)a7;
- (RTProximityEvent)ongoingProximityEvent;
- (id)_updateContactFrequencyCount:(id)a3;
- (id)description;
- (id)descriptionDictionary;
- (id)generateRealtimeProximityEventFromDate:(id)a3 endDate:(id)a4 referenceDate:(id)a5;
- (id)getContactScores:(id)a3;
- (id)getFirstObservationDate:(id)a3;
- (id)getInteractionSessions:(id)a3;
- (id)getLatestAdvertisementDate:(id)a3;
- (id)queryContactScoresWithContactIDs:(id)a3;
- (id)queryRealTimeEventsByEventIDs:(id)a3;
- (int64_t)bucketizeFrequencyScore:(double)a3;
- (int64_t)bucketizeRecencyScore:(double)a3;
- (int64_t)bucketizeSignificanceScore:(double)a3;
- (unint64_t)maxBackstopDuration;
- (unint64_t)maxBundleDuration;
- (unint64_t)maxSeparationDuration;
- (unint64_t)minObservationDuration;
- (void)_fetchAndStoreSignificanceScore:(id)a3;
- (void)addObserver:(id)a3;
- (void)checkAndCloseProximityEventsIfNeeded:(id)a3;
- (void)cleanUpOngoingContactRecordsAndScores;
- (void)closeProximityEvents:(id)a3 bundleEndDate:(id)a4 contactRecords:(id)a5 ongoingProximityEvent:(id)a6;
- (void)createSingleContactRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateProximityEventScores:(double)a3 socialScore:(double *)a4 contactRecords:(id)a5 combinedFrequencyScores:(id)a6 combinedRecencyScores:(id)a7 combinedSignificanceScores:(id)a8;
- (void)ingestEvent:(id)a3;
- (void)injectContactScore:(id)a3;
- (void)mergeWithAnotherContactRecord:(id)a3;
- (void)notifyObserversOnCloseProximityEvent:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setContactRecord:(id)a3;
- (void)setContactScores:(id)a3;
- (void)setMaxBackstopDuration:(unint64_t)a3;
- (void)setMaxBundleDuration:(unint64_t)a3;
- (void)setMaxSeparationDuration:(unint64_t)a3;
- (void)setMinObservationDuration:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setOngoingProximityEvent:(id)a3;
- (void)updateContactRecordOnAdvertisementReceived:(id)a3;
- (void)updateDailyContactScores;
@end

@implementation RTPeopleDiscoveryContactRecord

- (RTPeopleDiscoveryContactRecord)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_defaultsManager_);
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3
{
  return [(RTPeopleDiscoveryContactRecord *)self initWithQueue:a3 minObservationDuration:900 maxSeparationDuration:1800 maxBackstopDuration:28800 maxBundleDuration:3600];
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 defaultsManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKey:@"RTDefaultsPeopleDiscoveryProviderMinimumObservationDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = (unint64_t)(double)[v7 integerValue];
  }
  else {
    unint64_t v8 = 900;
  }
  v9 = [v6 objectForKey:@"RTDefaultsPeopleDiscoveryProviderMaximumSeparationDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v10 = (unint64_t)(double)[v9 integerValue];
  }
  else {
    unint64_t v10 = 1800;
  }
  v11 = [v6 objectForKey:@"RTDefaultsPeopleDiscoveryProviderMaximumBackstopDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v12 = (unint64_t)(double)[v11 integerValue];
  }
  else {
    unint64_t v12 = 28800;
  }
  v13 = [v6 objectForKey:@"RTDefaultsPeopleDiscoveryProviderProximityBundleDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v14 = (unint64_t)(double)[v13 integerValue];
  }
  else {
    unint64_t v14 = 3600;
  }
  v15 = [(RTPeopleDiscoveryContactRecord *)self initWithQueue:v5 minObservationDuration:v8 maxSeparationDuration:v10 maxBackstopDuration:v12 maxBundleDuration:v14];

  return v15;
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 minObservationDuration:(unint64_t)a4 maxSeparationDuration:(unint64_t)a5 maxBackstopDuration:(unint64_t)a6 maxBundleDuration:(unint64_t)a7
{
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryContactRecord;
  v11 = [(RTPeopleDiscoveryContactRecord *)&v18 init];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(RTPeopleDiscoveryContactRecord *)v11 setContactRecord:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(RTPeopleDiscoveryContactRecord *)v11 setContactScores:v13];

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
    bundleStartDate = v11->_bundleStartDate;
    v11->_bundleStartDate = (NSDate *)v14;

    [(RTPeopleDiscoveryContactRecord *)v11 setMinObservationDuration:a4];
    [(RTPeopleDiscoveryContactRecord *)v11 setMaxSeparationDuration:a5];
    [(RTPeopleDiscoveryContactRecord *)v11 setMaxBackstopDuration:a6];
    [(RTPeopleDiscoveryContactRecord *)v11 setMaxBundleDuration:a7];
    v16 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(RTPeopleDiscoveryContactRecord *)v11 setObservers:v16];
  }
  return v11;
}

- (void)updateContactRecordOnAdvertisementReceived:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 contactID];

    if (v6)
    {
      v7 = [v5 scanDate];
      uint64_t v8 = [v7 compare:self->_bundleStartDate];

      v9 = [v5 scanDate];
      unint64_t v10 = v9;
      if (v8 == -1)
      {
        bundleStartDate = self->_bundleStartDate;
        self->_bundleStartDate = v9;
        unint64_t v10 = bundleStartDate;
      }
      else
      {
        [(RTPeopleDiscoveryContactRecord *)self checkAndCloseProximityEventsIfNeeded:v9];
      }

      id v13 = [(RTPeopleDiscoveryContactRecord *)self contactRecord];
      uint64_t v14 = [v5 contactID];
      v11 = [v13 objectForKeyedSubscript:v14];

      v15 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v5 description];
        int v23 = 138412290;
        v24 = v16;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord receive advertisement, %@", (uint8_t *)&v23, 0xCu);
      }
      if (v11)
      {
        v17 = [v5 scanDate];
        objc_super v18 = [v11 latestAdvertisementDate];
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;
        double v21 = (double)[(RTPeopleDiscoveryContactRecord *)self maxSeparationDuration];

        if (v20 >= v21)
        {
          v22 = [v5 scanDate];
          [v11 closeInteractionSession:v22];
        }
        else
        {
          [v11 updateSingleContactRecordOnAdvReceived:v5];
        }
      }
      else
      {
        [(RTPeopleDiscoveryContactRecord *)self createSingleContactRecord:v5];
      }
    }
    else
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v23) = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "advertisement is not associated with a contactID", (uint8_t *)&v23, 2u);
      }
    }
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: advertisement", (uint8_t *)&v23, 2u);
    }
  }
}

- (id)generateRealtimeProximityEventFromDate:(id)a3 endDate:(id)a4 referenceDate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      double v19 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    double v20 = "Invalid parameter not satisfying: startDate";
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_11;
  }
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    double v20 = "Invalid parameter not satisfying: endDate";
    goto LABEL_20;
  }
  if ([v9 compare:self->_bundleStartDate] != 1)
  {
    double v19 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_16;
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 getFormattedDateString];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord generating real-time bundle, referenceDate, %@", buf, 0xCu);
  }
  id v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3453228];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3453240];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3453258];
  *(void *)buf = 0;
  [v10 timeIntervalSinceDate:self->_bundleStartDate];
  -[RTPeopleDiscoveryContactRecord generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:](self, "generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", buf, self->_contactRecord, v13, v14, v15);
  id v16 = objc_alloc(MEMORY[0x1E4F5CEA8]);
  v17 = [MEMORY[0x1E4F29128] UUID];
  objc_super v18 = (void *)[v16 initWithEventID:v17 startDate:self->_bundleStartDate endDate:0 relationship:0 socialScore:v13 combinedFrequencyScores:v14 combinedRecencyScores:*(double *)buf combinedSignificanceScores:v15];

  if (v18)
  {
    objc_storeStrong((id *)&self->_ongoingProximityEvent, v18);
    v22 = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  }
  else
  {
    double v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_15:
LABEL_16:

  return v19;
}

- (id)queryRealTimeEventsByEventIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_ongoingProximityEvent)
    {
      id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord querying real-time events by eventIDs", buf, 2u);
      }

      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            id v13 = (void *)MEMORY[0x1E016D870](v8);
            uint64_t v14 = [(RTProximityEvent *)self->_ongoingProximityEvent eventID];
            LODWORD(v12) = [v12 isEqual:v14];

            if (v12) {
              [v6 addObject:self->_ongoingProximityEvent];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
          uint64_t v9 = v8;
        }
        while (v8);
      }
    }
    else
    {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs", buf, 2u);
    }

    id v6 = [MEMORY[0x1E4F1C978] array];
  }

  return v6;
}

- (id)queryContactScoresWithContactIDs:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord querying contact scores by contactIDs", buf, 2u);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x1E016D870](v8);
          uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v12, (void)v22);

          if (v14)
          {
            v15 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v12];
            [v6 addObject:v15];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }

    if ([v7 count] == 1
      && ([v7 objectAtIndexedSubscript:0],
          id v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqualToString:@"ALL"],
          v16,
          v17))
    {
      id v18 = [(NSMutableDictionary *)self->_contactScores allValues];
    }
    else
    {
      id v18 = v6;
    }
    long long v19 = v18;
  }
  else
  {
    long long v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIDs", buf, 2u);
    }

    long long v19 = [MEMORY[0x1E4F1C978] array];
  }

  return v19;
}

- (id)getLatestAdvertisementDate:(id)a3
{
  if (a3)
  {
    v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 latestAdvertisementDate];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)getFirstObservationDate:(id)a3
{
  if (a3)
  {
    v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 firstObservation];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)getContactScores:(id)a3
{
  if (a3)
  {
    v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:");
    id v4 = v3;
    if (v3) {
      id v5 = v3;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)getInteractionSessions:(id)a3
{
  if (a3)
  {
    v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 interactionSessions];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)checkAndCloseProximityEventsIfNeeded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  bundleStartDate = self->_bundleStartDate;
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  LODWORD(bundleStartDate) = [(NSDate *)bundleStartDate isEqualToDate:v7];

  if (bundleStartDate)
  {
LABEL_15:
    objc_storeStrong((id *)&self->_bundleStartDate, a3);
    goto LABEL_16;
  }
  [v5 timeIntervalSinceDate:self->_bundleStartDate];
  double v9 = v8;
  double maxBundleDuration = (double)self->_maxBundleDuration;
  if (v8 >= maxBundleDuration)
  {
    if (v8 >= (double)self->_maxBackstopDuration)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = v9;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "skip closing the proximity event due to stale records, duration %f", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      [(RTPeopleDiscoveryContactRecord *)self closeProximityEvents:self->_bundleStartDate bundleEndDate:v5 contactRecords:self->_contactRecord ongoingProximityEvent:self->_ongoingProximityEvent];
    }
    v15 = [(RTPeopleDiscoveryContactRecord *)self contactRecord];
    [v15 removeAllObjects];

    [(RTPeopleDiscoveryContactRecord *)self setOngoingProximityEvent:0];
    goto LABEL_15;
  }
  [v5 timeIntervalSinceDate:self->_bundleStartDate];
  double v12 = v11;
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134217984;
    double v17 = maxBundleDuration - v12;
    _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "not enough time has passed since last proximity bundle, remainingSeconds %f", (uint8_t *)&v16, 0xCu);
  }
LABEL_8:

LABEL_16:
}

- (void)closeProximityEvents:(id)a3 bundleEndDate:(id)a4 contactRecords:(id)a5 ongoingProximityEvent:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  [v11 timeIntervalSinceDate:v10];
  double v15 = v14;
  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3453270];
  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F3453288];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1F34532A0];
  v37[0] = 0.0;
  [(RTPeopleDiscoveryContactRecord *)self generateProximityEventScores:v37 socialScore:v13 contactRecords:v16 combinedFrequencyScores:v17 combinedRecencyScores:v18 combinedSignificanceScores:v15];

  if (v37[0] <= 0.0)
  {
    long long v19 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "skip storing proximity events due to invalid social score", buf, 2u);
    }
  }
  else
  {
    id v30 = v12;
    if (v12) {
      [v12 eventID:v37[0]];
    }
    else {
    long long v19 = [MEMORY[0x1E4F29128] UUID:v37[0]];
    }
    id v20 = objc_alloc(MEMORY[0x1E4F5CEA8]);
    double v21 = (void *)[v20 initWithEventID:v19 startDate:v10 endDate:v11 relationship:0 socialScore:v16 combinedFrequencyScores:v17 combinedRecencyScores:v37[0] combinedSignificanceScores:v18];
    [(RTPeopleDiscoveryContactRecord *)self notifyObserversOnCloseProximityEvent:v21];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke;
    v35[3] = &unk_1E6B94930;
    v35[4] = self;
    id v36 = v21;
    id v29 = v21;
    long long v22 = (void *)MEMORY[0x1E016DB00](v35);
    id v23 = [NSString alloc];
    long long v24 = (void *)[v23 initWithCString:RTAnalyticsEventPeopleDiscoveryEvents encoding:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke_2;
    v32[3] = &unk_1E6B943B0;
    id v33 = v24;
    id v34 = v22;
    id v25 = v24;
    id v26 = v22;
    v27 = (void *)MEMORY[0x1E016DB00](v32);
    uint64_t v28 = [NSString stringWithFormat:@"com.apple.%@", v25];
    AnalyticsSendEventLazy();

    id v12 = v30;
  }
}

uint64_t __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 computeEventMetrics:v3];
}

id __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

- (void)generateProximityEventScores:(double)a3 socialScore:(double *)a4 contactRecords:(id)a5 combinedFrequencyScores:(id)a6 combinedRecencyScores:(id)a7 combinedSignificanceScores:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  double v17 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  uint64_t v18 = v17;
  if (a3 <= 0.0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "receiving invalid bundle duration when computing scores", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "computing scores related to current proximity bundle", buf, 2u);
    }
    v31 = a4;
    id v32 = v16;
    id v33 = v15;
    id v34 = v14;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v35 = v13;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      double v23 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          id v26 = (void *)MEMORY[0x1E016D870]();
          v27 = [v19 objectForKeyedSubscript:v25];
          [v27 getTotalInteractionDuration];
          double v29 = v28 / a3;
          id v30 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v41 = v25;
            __int16 v42 = 2048;
            double v43 = v29;
            _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "social score for contact: %@, score, %f", buf, 0x16u);
          }
          double v23 = v23 + v29;
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v21);
    }
    else
    {
      double v23 = 0.0;
    }

    id v16 = v32;
    double *v31 = v23;
    id v14 = v34;
    id v13 = v35;
    id v15 = v33;
  }
}

- (int64_t)bucketizeFrequencyScore:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0) {
    return 0;
  }
  if (a3 >= 0.0 && a3 < 0.4) {
    return 3;
  }
  if (a3 >= 0.4 && a3 <= 0.6) {
    return 2;
  }
  if (a3 <= 1.0) {
    return a3 > 0.6;
  }
  return 0;
}

- (int64_t)bucketizeRecencyScore:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0) {
    return 0;
  }
  if (a3 >= 0.0 && a3 < 0.33) {
    return 3;
  }
  if (a3 >= 0.33 && a3 <= 0.66) {
    return 2;
  }
  if (a3 <= 1.0) {
    return a3 > 0.66;
  }
  return 0;
}

- (int64_t)bucketizeSignificanceScore:(double)a3
{
  if (a3 < 0.5) {
    return 0;
  }
  if (a3 < 0.667) {
    return 3;
  }
  if (a3 > 0.834) {
    return a3 <= 1.0;
  }
  return 2;
}

- (void)createSingleContactRecord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 contactID];
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "create new contact record: %@", (uint8_t *)&v12, 0xCu);
  }
  id v7 = [RTPeopleDiscoverySingleContactRecord alloc];
  double v8 = [v4 contactID];
  double v9 = [(RTPeopleDiscoverySingleContactRecord *)v7 initWithContactID:v8 withAdvertisement:v4];

  id v10 = [(RTPeopleDiscoveryContactRecord *)self contactRecord];
  id v11 = [v4 contactID];
  [v10 setObject:v9 forKey:v11];
}

- (void)mergeWithAnotherContactRecord:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v72 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 contactRecord];
      uint64_t v7 = [v6 count];
      double v8 = [v4 ongoingProximityEvent];
      double v9 = [v8 description];
      id v10 = [v4 contactScores];
      uint64_t v11 = [v10 count];
      int v12 = [v72 bundleStartDate];
      *(_DWORD *)buf = 134218754;
      uint64_t v89 = v7;
      __int16 v90 = 2112;
      v91 = v9;
      __int16 v92 = 2048;
      uint64_t v93 = v11;
      id v4 = v72;
      __int16 v94 = 2112;
      v95 = v12;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "merging contact record: number of contacts, %lu, ongoing proximity event, %@, number of contact scores, %lu, bundle start time, %@", buf, 0x2Au);
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v13 = [v4 contactScores];
    uint64_t v14 = [v13 allKeys];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v82 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          uint64_t v20 = (void *)MEMORY[0x1E016D870]();
          uint64_t v21 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v19];

          if (v21)
          {
            uint64_t v22 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v19];
            double v23 = [v4 contactScores];
            long long v24 = [v23 objectForKeyedSubscript:v19];

            id v4 = v72;
            [v22 mergeWithAnotherContactScore:v24];
          }
          else
          {
            uint64_t v22 = [v4 contactScores];
            long long v24 = [v22 objectForKeyedSubscript:v19];
            [(NSMutableDictionary *)self->_contactScores setObject:v24 forKeyedSubscript:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v16);
    }

    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    id v26 = [v4 bundleStartDate];
    [v25 timeIntervalSinceDate:v26];
    double v28 = v27;
    double maxBackstopDuration = (double)self->_maxBackstopDuration;

    if (v28 < maxBackstopDuration)
    {
      ongoingProximityEvent = self->_ongoingProximityEvent;
      if (ongoingProximityEvent)
      {
        v31 = ongoingProximityEvent;
      }
      else
      {
        v31 = [v72 ongoingProximityEvent];
      }
      v51 = self->_ongoingProximityEvent;
      self->_ongoingProximityEvent = v31;

      bundleStartDate = self->_bundleStartDate;
      v53 = [MEMORY[0x1E4F1C9C8] distantPast];
      if ([(NSDate *)bundleStartDate isEqualToDate:v53])
      {
        id v4 = v72;
        v54 = [v72 bundleStartDate];

        if (v54)
        {
          v55 = [v72 bundleStartDate];
          v56 = self->_bundleStartDate;
          self->_bundleStartDate = v55;
          goto LABEL_42;
        }
      }
      else
      {

        id v4 = v72;
      }
      v56 = [v4 bundleStartDate];
      if (v56)
      {
        v57 = [v4 bundleStartDate];
        v58 = [v57 earlierDate:self->_bundleStartDate];
        v59 = self->_bundleStartDate;
        self->_bundleStartDate = v58;
      }
      else
      {
        v60 = self->_bundleStartDate;
        v57 = self->_bundleStartDate;
        self->_bundleStartDate = v60;
      }

LABEL_42:
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v61 = [v4 contactRecord];
      id v32 = [v61 allKeys];

      uint64_t v62 = [v32 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v63; ++j)
          {
            if (*(void *)v74 != v64) {
              objc_enumerationMutation(v32);
            }
            uint64_t v66 = *(void *)(*((void *)&v73 + 1) + 8 * j);
            v67 = (void *)MEMORY[0x1E016D870]();
            v68 = [(NSMutableDictionary *)self->_contactRecord objectForKeyedSubscript:v66];

            if (v68)
            {
              v69 = [(NSMutableDictionary *)self->_contactRecord objectForKeyedSubscript:v66];
              v70 = [v4 contactRecord];
              v71 = [v70 objectForKeyedSubscript:v66];

              id v4 = v72;
              [v69 mergeWithAnotherSingleContactRecord:v71];
            }
            else
            {
              v69 = [v4 contactRecord];
              v71 = [v69 objectForKeyedSubscript:v66];
              [(NSMutableDictionary *)self->_contactRecord setObject:v71 forKeyedSubscript:v66];
            }
          }
          uint64_t v63 = [v32 countByEnumeratingWithState:&v73 objects:v85 count:16];
        }
        while (v63);
      }
      goto LABEL_52;
    }
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = [MEMORY[0x1E4F1C9C8] now];
      id v35 = [v72 bundleStartDate];
      *(_DWORD *)buf = 138412546;
      uint64_t v89 = (uint64_t)v34;
      __int16 v90 = 2112;
      v91 = v35;
      _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEFAULT, "closing proximity events for stale records, current time, %@, bundle start time, %@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v36 = [v72 contactRecord];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v78 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v77 + 1) + 8 * k);
          __int16 v42 = [v72 contactRecord];
          double v43 = [v42 objectForKeyedSubscript:v41];

          v44 = [v43 latestAdvertisementDate];
          uint64_t v45 = [v32 compare:v44];

          if (v45 == -1)
          {
            uint64_t v46 = [v43 latestAdvertisementDate];

            id v32 = v46;
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v38);
    }

    v47 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v4 = v72;
    if (v32 != v47)
    {
      v48 = [v72 bundleStartDate];
      v49 = [v72 contactRecord];
      v50 = [v72 ongoingProximityEvent];
      [(RTPeopleDiscoveryContactRecord *)self closeProximityEvents:v48 bundleEndDate:v32 contactRecords:v49 ongoingProximityEvent:v50];
    }
  }
  else
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherRecord", buf, 2u);
    }
  }
LABEL_52:
}

- (void)updateDailyContactScores
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v3 = self->_contactScores;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v34;
    *(void *)&long long v5 = 134218498;
    long long v32 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E016D870]();
        uint64_t v11 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v9];
        unint64_t v12 = [v11 frequencyCount];
        [v11 runningMean];
        double v14 = v13;
        [v11 runningMeanOfSquares];
        double v16 = v15;
        [v11 frequencyScore];
        BOOL v18 = fabs(v17 + 1.0) < 2.22044605e-16;
        double v19 = (v14 + (double)v12) * 0.5;
        if (v18) {
          double v20 = (double)(v12 * v12);
        }
        else {
          double v20 = (v16 + (double)(v12 * v12)) * 0.5;
        }
        if (v18) {
          double v21 = (double)v12;
        }
        else {
          double v21 = v19;
        }
        [v11 setRunningMean:v21, v32, v33];
        [v11 setRunningMeanOfSquares:v20];
        float v22 = -((double)v12 - v21) / (sqrt(v20 - v21 * v21) + 2.22044605e-16);
        [v11 setFrequencyScore:1.0 / (expf(v22) + 1.0)];
        [v11 recencyScore];
        double v24 = fabs(v23 + 1.0);
        if (v12) {
          double v25 = 0.0;
        }
        else {
          double v25 = 1.0;
        }
        double v26 = (v23 + v25) * 0.5;
        if (v24 < 2.22044605e-16) {
          double v26 = v25;
        }
        [v11 setRecencyScore:v26];
        [v11 setFrequencyCount:0];
        double v27 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          [v11 frequencyScore];
          uint64_t v29 = v28;
          [v11 recencyScore];
          *(_DWORD *)buf = v32;
          uint64_t v38 = v29;
          __int16 v39 = 2048;
          uint64_t v40 = v30;
          __int16 v41 = 2112;
          uint64_t v42 = v9;
          _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "finish computing frequencyScore, %f and recencyScore, %f for contact %@", buf, 0x20u);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v6);
  }

  v31 = [(NSMutableDictionary *)self->_contactScores allKeys];
  [(RTPeopleDiscoveryContactRecord *)self _fetchAndStoreSignificanceScore:v31];
}

- (void)_fetchAndStoreSignificanceScore:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = objc_alloc_init(MEMORY[0x1E4F89C70]);
  long long v5 = [v18 contactPriorsForContactIdentifiers:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v12 = [v5 objectForKey:v11];
        [v12 priorScore];
        float v14 = v13;
        double v15 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          double v24 = v14;
          __int16 v25 = 2112;
          uint64_t v26 = v11;
          _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "Received significance score %f for contact %@", buf, 0x16u);
        }

        double v16 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v11];
        if (v16)
        {
          [v16 setSignificanceScore:1.0 / (expf(-v14) + 1.0)];
        }
        else
        {
          double v17 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Received significance score for unknown contact", buf, 2u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }
}

- (id)_updateContactFrequencyCount:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v4];
    [v6 setFrequencyCount:[v6 frequencyCount] + 1];
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = [v6 frequencyCount];
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "frequency count updated for contact %@, new count, %lu", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "create new scores for contact %@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5CDA8]) initWithContactID:v4 frequencyScore:1 recencyScore:-1.0 significanceScore:-1.0 frequencyCount:-1.0 runningMean:0.0 runningMeanOfSquares:0.0];
    [(NSMutableDictionary *)self->_contactScores setObject:v6 forKey:v4];
  }

  return v6;
}

- (void)injectContactScore:(id)a3
{
  contactScores = self->_contactScores;
  id v4 = a3;
  id v5 = [v4 contactID];
  [(NSMutableDictionary *)contactScores setObject:v4 forKey:v5];
}

- (void)ingestEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    [(RTPeopleDiscoveryContactRecord *)self updateContactRecordOnAdvertisementReceived:v4];
  }
}

- (void)cleanUpOngoingContactRecordsAndScores
{
  [(NSMutableDictionary *)self->_contactRecord removeAllObjects];
  [(NSMutableDictionary *)self->_contactScores removeAllObjects];
  ongoingProximityEvent = self->_ongoingProximityEvent;
  self->_ongoingProximityEvent = 0;

  self->_bundleStartDate = [MEMORY[0x1E4F1C9C8] distantPast];

  MEMORY[0x1F41817F8]();
}

+ (id)computeEventMetrics:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:&unk_1F3451D58 forKeyedSubscript:@"numOfEventsPerDay"];
  id v5 = [v3 endDate];
  if (v5)
  {
    id v6 = [v3 endDate];
    uint64_t v7 = [v3 startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }

  int v10 = [NSNumber numberWithDouble:v9];
  [v4 setObject:v10 forKeyedSubscript:@"duration"];

  id v11 = NSNumber;
  [v3 socialScore];
  __int16 v12 = [v11 numberWithDouble:];
  [v4 setObject:v12 forKeyedSubscript:@"socialScore"];

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObserversOnCloseProximityEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1E016D870](v6);
        if (objc_opt_respondsToSelector()) {
          [v10 didCloseProximityEvent:v4, (void)v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTPeopleDiscoveryContactRecord *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(RTPeopleDiscoveryContactRecord *)self contactRecord];
      uint64_t v7 = [(RTPeopleDiscoveryContactRecord *)v5 contactRecord];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = [(NSMutableDictionary *)self->_contactRecord allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1E016D870]();
        int v10 = [NSString stringWithFormat:@"record: %@", v8];
        id v11 = [(NSMutableDictionary *)self->_contactRecord objectForKeyedSubscript:v8];
        long long v12 = [v11 descriptionDictionary];
        [0 setObject:v12 forKey:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v13 = [(NSMutableDictionary *)self->_contactScores allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
        long long v19 = (void *)MEMORY[0x1E016D870]();
        long long v20 = [NSString stringWithFormat:@"score: %@", v18];
        long long v21 = [(NSMutableDictionary *)self->_contactScores objectForKeyedSubscript:v18];
        long long v22 = [v21 descriptionDictionary];
        [0 setObject:v22 forKey:v20];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }

  double v23 = (void *)[0 copy];

  return v23;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDiscoveryContactRecord *)self descriptionDictionary];
  id v11 = 0;
  id v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      long long v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  uint64_t v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoveryContactRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTPeopleDiscoveryContactRecord;
  uint64_t v5 = [(RTPeopleDiscoveryContactRecord *)&v23 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v6 setWithObjects:v7, v8, objc_opt_class(), 0];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ContactRecord"];
    contactRecord = v5->_contactRecord;
    v5->_contactRecord = (NSMutableDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OngoingProximityEvent"];
    ongoingProximityEvent = v5->_ongoingProximityEvent;
    v5->_ongoingProximityEvent = (RTProximityEvent *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleStartDate"];
    bundleStartDate = v5->_bundleStartDate;
    v5->_bundleStartDate = (NSDate *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    long long v19 = [v16 setWithObjects:v17, v18, objc_opt_class(), 0];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"ContactScores"];
    contactScores = v5->_contactScores;
    v5->_contactScores = (NSMutableDictionary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactRecord = self->_contactRecord;
  id v5 = a3;
  [v5 encodeObject:contactRecord forKey:@"ContactRecord"];
  [v5 encodeObject:self->_ongoingProximityEvent forKey:@"OngoingProximityEvent"];
  [v5 encodeObject:self->_bundleStartDate forKey:@"BundleStartDate"];
  [v5 encodeObject:self->_contactScores forKey:@"ContactScores"];
}

- (NSDate)bundleStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)contactRecord
{
  return self->_contactRecord;
}

- (void)setContactRecord:(id)a3
{
}

- (NSMutableDictionary)contactScores
{
  return self->_contactScores;
}

- (void)setContactScores:(id)a3
{
}

- (RTProximityEvent)ongoingProximityEvent
{
  return self->_ongoingProximityEvent;
}

- (void)setOngoingProximityEvent:(id)a3
{
}

- (unint64_t)minObservationDuration
{
  return self->_minObservationDuration;
}

- (void)setMinObservationDuration:(unint64_t)a3
{
  self->_minObservationDuration = a3;
}

- (unint64_t)maxSeparationDuration
{
  return self->_maxSeparationDuration;
}

- (void)setMaxSeparationDuration:(unint64_t)a3
{
  self->_maxSeparationDuration = a3;
}

- (unint64_t)maxBackstopDuration
{
  return self->_maxBackstopDuration;
}

- (void)setMaxBackstopDuration:(unint64_t)a3
{
  self->_double maxBackstopDuration = a3;
}

- (unint64_t)maxBundleDuration
{
  return self->_maxBundleDuration;
}

- (void)setMaxBundleDuration:(unint64_t)a3
{
  self->_double maxBundleDuration = a3;
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
  objc_storeStrong((id *)&self->_ongoingProximityEvent, 0);
  objc_storeStrong((id *)&self->_contactScores, 0);
  objc_storeStrong((id *)&self->_contactRecord, 0);

  objc_storeStrong((id *)&self->_bundleStartDate, 0);
}

@end