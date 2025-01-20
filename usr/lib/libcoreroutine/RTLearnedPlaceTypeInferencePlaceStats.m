@interface RTLearnedPlaceTypeInferencePlaceStats
+ (double)extractTopMedianDwellTimeFromVisits:(id)a3;
+ (id)extractDailyStatsFromVisits:(id)a3;
+ (id)extractWeeklyStatsFromDailyStats:(id)a3;
+ (id)visitsWithDwellTimeBetweenDateRange:(id)a3 start:(id)a4 end:(id)a5;
- (NSArray)visitIntervals;
- (NSDictionary)mlFeatures;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlace)place;
- (RTLearnedPlaceTypeInferencePlaceStats)initWithLearnedLocationStore:(id)a3 place:(id)a4 visits:(id)a5;
- (RTLearnedPlaceTypeInferenceStats)stats;
- (id)description;
- (id)getMlFeatures;
- (id)localDeviceVisitsForVisits:(id)a3;
- (unint64_t)visitsCount;
- (void)log;
- (void)setLearnedLocationStore:(id)a3;
- (void)setMlFeatures:(id)a3;
- (void)setPlace:(id)a3;
- (void)setVisitIntervals:(id)a3;
- (void)setVisitsCount:(unint64_t)a3;
@end

@implementation RTLearnedPlaceTypeInferencePlaceStats

+ (id)visitsWithDwellTimeBetweenDateRange:(id)a3 start:(id)a4 end:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a3;
  v9 = [v7 predicateWithFormat:@"%K <= %@ and %@ <= %K", @"entryDate", a5, a4, @"exitDate"];
  v10 = [v8 filteredArrayUsingPredicate:v9];

  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v13 = [v10 sortedArrayUsingDescriptors:v12];

  return v13;
}

+ (double)extractTopMedianDwellTimeFromVisits:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 startOfDayForDate:v4];

  v7 = objc_opt_new();
  [v7 setWeekOfYear:-5];
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v37 = v7;
  uint64_t v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  id v10 = v6;
  v38 = v3;
  v36 = (void *)v9;
  v11 = [(id)objc_opt_class() visitsWithDwellTimeBetweenDateRange:v3 start:v9 end:v10];
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v19 = NSNumber;
        v20 = [v18 exitDate];
        v21 = [v18 entryDate];
        [v20 timeIntervalSinceDate:v21];
        v22 = [v19 numberWithDouble:x0];
        [v12 addObject:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }

  v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v43 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  [v12 sortUsingDescriptors:v24];

  v25 = [v13 lastObject];
  v26 = [v25 exitDate];
  v27 = [v13 firstObject];
  v28 = [v27 entryDate];
  [v26 timeIntervalSinceDate:v28];
  double v30 = v29 / 604800.0;

  unint64_t v31 = vcvtmd_u64_f64(v30 * 0.5);
  double v32 = 0.0;
  if ([v12 count] > v31)
  {
    if (v31 <= 1)
    {
      if ((unint64_t)[v12 count] <= 2)
      {
        if ([v12 count]) {
          unint64_t v31 = [v12 count] - 1;
        }
      }
      else
      {
        unint64_t v31 = 2;
      }
    }
    v33 = [v12 objectAtIndex:v31];
    [v33 doubleValue];
    double v32 = v34;
  }
  return v32;
}

+ (id)extractDailyStatsFromVisits:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v4 = 0x1E4F1C000uLL;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v34 = (void *)v3;
  uint64_t v6 = [v5 startOfDayForDate:v3];

  v7 = objc_opt_new();
  [v7 setWeekOfYear:-5];
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v33 = v7;
  uint64_t v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  id v10 = objc_opt_new();
  [v10 setDay:1];
  [v10 setSecond:-1];
  v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v32 = v10;
  v12 = [v11 dateByAddingComponents:v10 toDate:v9 options:0];

  v36 = objc_opt_new();
  [v36 setDay:1];
  id v35 = [MEMORY[0x1E4F1CA48] array];
  v37 = (void *)v6;
  if ([v12 compare:v6] == -1)
  {
    do
    {
      unint64_t v15 = v4;
      context = (void *)MEMORY[0x1E016D870]();
      uint64_t v16 = [(id)objc_opt_class() visitsWithDwellTimeBetweenDateRange:v38 start:v9 end:v12];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v41;
        double v20 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v41 != v19) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v23 = [v22 entryDate];
            v24 = [v23 laterDate:v9];

            v25 = [v22 exitDate];
            v26 = [v25 earlierDate:v12];

            [v26 timeIntervalSinceDate:v24];
            double v20 = v20 + v27;
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v18);
      }
      else
      {
        double v20 = 0.0;
      }
      v28 = -[RTLearnedPlaceTypeInferenceDailyStats initWithStart:end:visitCount:aggregateDwellTimeBetweenDateRange:]([RTLearnedPlaceTypeInferenceDailyStats alloc], "initWithStart:end:visitCount:aggregateDwellTimeBetweenDateRange:", v9, v12, [v16 count], v20);
      if (v28) {
        [v35 addObject:v28];
      }
      unint64_t v4 = v15;
      double v29 = [*(id *)(v15 + 2472) currentCalendar];
      uint64_t v14 = [v29 dateByAddingComponents:v36 toDate:v9 options:0];

      double v30 = [*(id *)(v15 + 2472) currentCalendar];
      id v13 = [v30 dateByAddingComponents:v36 toDate:v12 options:0];

      uint64_t v9 = v14;
      v12 = v13;
    }
    while ([v13 compare:v37] == -1);
  }
  else
  {
    id v13 = v12;
    uint64_t v14 = v9;
  }

  return v35;
}

+ (id)extractWeeklyStatsFromDailyStats:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if ((unint64_t)[v3 count] >= 7)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x1E016D870]();
      id v8 = [RTLearnedPlaceTypeInferenceWeeklyStats alloc];
      uint64_t v9 = [v3 subarrayWithRange:v5, 7];
      id v10 = [(RTLearnedPlaceTypeInferenceWeeklyStats *)v8 initWithDailyStats:v9];

      if (v10) {
        [v4 addObject:v10];
      }

      ++v6;
      v5 += 7;
    }
    while (v6 < [v3 count] / 7uLL);
  }

  return v4;
}

- (id)localDeviceVisitsForVisits:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52 = self;
  uint64_t v5 = [(RTLearnedPlaceTypeInferencePlaceStats *)self learnedLocationStore];
  v49 = [v5 predicateForObjectsFromCurrentDevice];

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__160;
  v66 = __Block_byref_object_dispose__160;
  id v67 = (id)objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v6)
  {
    v7 = 0;
    id v8 = 0;
    uint64_t v9 = 0;
    uint64_t v48 = *(void *)v59;
    uint64_t v46 = *MEMORY[0x1E4F5CFE8];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    do
    {
      uint64_t v50 = v6;
      uint64_t v10 = 0;
      v11 = v7;
      v12 = v8;
      id v13 = v9;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1E016D870]();
        unint64_t v15 = [(RTLearnedPlaceTypeInferencePlaceStats *)v52 learnedLocationStore];
        uint64_t v16 = [v14 location];
        uint64_t v17 = [v16 location];
        v54 = [v15 predicateForVisitsWithinDistance:v17 location:500.0];

        uint64_t v18 = [(RTLearnedPlaceTypeInferencePlaceStats *)v52 learnedLocationStore];
        uint64_t v19 = [v14 entryDate];
        double v20 = [v19 dateByAddingTimeInterval:-1800.0];
        v21 = [v14 exitDate];
        v22 = [v21 dateByAddingTimeInterval:1800.0];
        v53 = [v18 predicateForVisitsFromEntryDate:v20 exitDate:v22];

        v23 = (void *)MEMORY[0x1E4F28BA0];
        v68[0] = v49;
        v68[1] = v54;
        v68[2] = v53;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
        v7 = [v23 andPredicateWithSubpredicates:v24];

        dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
        v26 = [(RTLearnedPlaceTypeInferencePlaceStats *)v52 learnedLocationStore];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __68__RTLearnedPlaceTypeInferencePlaceStats_localDeviceVisitsForVisits___block_invoke;
        v55[3] = &unk_1E6B90700;
        v57 = &v62;
        double v27 = v25;
        v56 = v27;
        [v26 fetchVisitsWithPredicate:v7 handler:v55];

        v28 = v27;
        double v29 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v30 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v28, v30))
        {
          unint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
          [v31 timeIntervalSinceDate:v29];
          double v33 = v32;
          double v34 = objc_opt_new();
          id v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_540];
          v36 = [MEMORY[0x1E4F29060] callStackSymbols];
          v37 = [v36 filteredArrayUsingPredicate:v35];
          id v38 = [v37 firstObject];

          [v34 submitToCoreAnalytics:v38 type:1 duration:v33];
          long long v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          long long v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v70 = v47;
          *(void *)buf = @"semaphore wait timeout";
          long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v70 count:1];
          long long v42 = [v40 errorWithDomain:v46 code:15 userInfo:v41];

          if (v42) {
        }
          }

        ++v10;
        v11 = v7;
        id v8 = v53;
        uint64_t v9 = v54;
        v12 = v53;
        id v13 = v54;
      }
      while (v50 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v6);
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }

  id v43 = (id)v63[5];
  _Block_object_dispose(&v62, 8);

  return v43;
}

void __68__RTLearnedPlaceTypeInferencePlaceStats_localDeviceVisitsForVisits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:a2];
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Error was issued during fetching visits from store. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTLearnedPlaceTypeInferencePlaceStats)initWithLearnedLocationStore:(id)a3 place:(id)a4 visits:(id)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[RTLearnedPlaceTypeInferencePlaceStats initWithLearnedLocationStore:place:visits:]";
      __int16 v80 = 1024;
      LODWORD(v81) = 415;
      _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place (in %s:%d)", buf, 0x12u);
    }

    v54 = 0;
    goto LABEL_30;
  }
  v77.receiver = self;
  v77.super_class = (Class)RTLearnedPlaceTypeInferencePlaceStats;
  v12 = [(RTLearnedPlaceTypeInferencePlaceStats *)&v77 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v12->_learnedLocationStore, a3);
  objc_storeStrong((id *)&v13->_place, a4);
  v13->_visitsCount = [v11 count];
  mlFeatures = v13->_mlFeatures;
  v13->_mlFeatures = 0;

  long long v59 = [(id)objc_opt_class() extractDailyStatsFromVisits:v11];
  uint64_t v15 = [(id)objc_opt_class() extractWeeklyStatsFromDailyStats:v59];
  [(id)objc_opt_class() extractTopMedianDwellTimeFromVisits:v11];
  long long v58 = (void *)v15;
  uint64_t v17 = [[RTLearnedPlaceTypeInferenceStats alloc] initWithWeeklyStats:v15 topMedianDwellTime:v16];
  stats = v13->_stats;
  v13->_stats = v17;

  v63 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v64 = [MEMORY[0x1E4F1C9C8] date];
  v68 = [v64 dateByAddingTimeInterval:-3628800.0];
  uint64_t v19 = objc_opt_new();
  double v20 = [(RTLearnedPlaceTypeInferencePlaceStats *)v13 localDeviceVisitsForVisits:v11];
  v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v11 count];
    uint64_t v23 = [v20 count];
    *(_DWORD *)buf = 134218240;
    v79 = (const char *)v22;
    __int16 v80 = 2048;
    uint64_t v81 = v23;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "visits count, %lu, local device visits count, %lu", buf, 0x16u);
  }
  long long v60 = v13;
  id v61 = v11;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v20;
  uint64_t v69 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
  id v62 = v9;
  if (!v69)
  {
    id v71 = 0;
    v24 = 0;
    goto LABEL_28;
  }
  id v71 = 0;
  v24 = 0;
  uint64_t v67 = *(void *)v74;
  do
  {
    for (uint64_t i = 0; i != v69; ++i)
    {
      v26 = v24;
      double v27 = v71;
      if (*(void *)v74 != v67) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      context = (void *)MEMORY[0x1E016D870]();
      id v29 = objc_alloc(MEMORY[0x1E4F28C18]);
      dispatch_time_t v30 = [v28 entryDate];
      unint64_t v31 = [v28 exitDate];
      v24 = (void *)[v29 initWithStartDate:v30 endDate:v31];

      double v32 = [v28 location];
      double v33 = [v32 location];
      double v34 = [v10 mapItem];
      id v35 = [v34 location];
      id v72 = v71;
      [v19 distanceFromLocation:v33 toLocation:v35 error:&v72];
      double v37 = v36;
      id v71 = v72;

      id v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v66 = [v10 mapItem];
        long long v39 = [v66 location];
        long long v40 = [v28 location];
        long long v41 = [v40 location];
        long long v42 = [v24 startDate];
        [v24 endDate];
        id v43 = v24;
        v44 = v19;
        v46 = id v45 = v10;
        *(_DWORD *)buf = 138414082;
        v79 = v39;
        __int16 v80 = 2112;
        uint64_t v81 = (uint64_t)v41;
        __int16 v82 = 2048;
        double v83 = v37;
        __int16 v84 = 2112;
        v85 = v42;
        __int16 v86 = 2112;
        v87 = v46;
        __int16 v88 = 2112;
        v89 = v68;
        __int16 v90 = 2112;
        v91 = v64;
        __int16 v92 = 2112;
        id v93 = v71;
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "place location, %@, visit location, %@, distance from place to visit location, %.3f, visit interval start date, %@, visit interval end date, %@, earliestStartDate, %@, latestEndDate, %@, error, %@", buf, 0x52u);

        id v10 = v45;
        uint64_t v19 = v44;
        v24 = v43;
      }
      if (v37 <= 200.0)
      {
        v51 = [v24 endDate];
        uint64_t v52 = [v51 compare:v68];

        if (v52 != -1)
        {
          [(NSArray *)v63 addObject:v24];
          uint64_t v48 = context;
          goto LABEL_21;
        }
        uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        uint64_t v48 = context;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v49 = v47;
          uint64_t v50 = "Visit interval end date exceeded earliest start date. Skipping visit interval.";
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v47 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        uint64_t v48 = context;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v49 = v47;
          uint64_t v50 = "Distance from place to visit location exceeded threshold. Skipping visit interval.";
LABEL_19:
          _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, v50, buf, 2u);
        }
      }

LABEL_21:
    }
    uint64_t v69 = [obj countByEnumeratingWithState:&v73 objects:v94 count:16];
  }
  while (v69);
LABEL_28:

  id v13 = v60;
  visitIntervals = v60->_visitIntervals;
  v60->_visitIntervals = v63;
  v56 = v63;

  id v11 = v61;
  id v9 = v62;
LABEL_29:
  self = v13;
  v54 = self;
LABEL_30:

  return v54;
}

- (id)getMlFeatures
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  mlFeatures = self->_mlFeatures;
  if (!mlFeatures)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "-[RTLearnedPlaceTypeInferencePlaceStats getMlFeatures]";
      __int16 v8 = 1024;
      int v9 = 490;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "accessing mlFeatures before being set (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    mlFeatures = self->_mlFeatures;
  }

  return mlFeatures;
}

- (void)log
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(RTLearnedPlaceTypeInferencePlaceStats *)self stats];
  id v5 = [v4 weeklyStats];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_118];
}

void __44__RTLearnedPlaceTypeInferencePlaceStats_log__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "weekly stat %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(RTLearnedPlaceTypeInferencePlaceStats *)self place];
  unint64_t v5 = [(RTLearnedPlaceTypeInferencePlaceStats *)self visitsCount];
  int v6 = [(RTLearnedPlaceTypeInferencePlaceStats *)self stats];
  uint64_t v7 = [v3 stringWithFormat:@"place, %@, visits, %lu, stats, %@", v4, v5, v6];

  return v7;
}

- (RTLearnedPlaceTypeInferenceStats)stats
{
  return self->_stats;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTLearnedPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
}

- (unint64_t)visitsCount
{
  return self->_visitsCount;
}

- (void)setVisitsCount:(unint64_t)a3
{
  self->_visitsCount = a3;
}

- (NSArray)visitIntervals
{
  return self->_visitIntervals;
}

- (void)setVisitIntervals:(id)a3
{
}

- (NSDictionary)mlFeatures
{
  return self->_mlFeatures;
}

- (void)setMlFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlFeatures, 0);
  objc_storeStrong((id *)&self->_visitIntervals, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);

  objc_storeStrong((id *)&self->_stats, 0);
}

@end