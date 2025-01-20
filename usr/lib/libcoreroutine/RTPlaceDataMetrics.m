@interface RTPlaceDataMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)DataSourceToString:(unint64_t)a3;
+ (id)binArrayDuetEventDuration;
+ (id)binArrayPercentage;
+ (id)bucketedKeys;
+ (id)calculateMLFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 createBucketedFeatures:(BOOL)a6;
+ (id)calculateMLFeaturesUsingBiomeManager:(id)a3 intervalDictionary:(id)a4 startDate:(id)a5 endDate:(id)a6 createBucketedFeatures:(BOOL)a7;
+ (id)doubleKeys;
+ (id)generateDictionaryOfOldMetricsWithLearnedLocationStore:(id)a3 locationsOfInterest:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7;
+ (id)integerKeys;
+ (id)labelAnEventInterval:(id)a3 basedOnIntervalDict:(id)a4;
+ (id)meanOf:(id)a3;
+ (id)medianOf:(id)a3;
+ (id)standardDeviationOf:(id)a3;
+ (id)supportedMetricKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (NSArray)locationsOfOthers;
- (NSArray)visitArray;
- (NSDate)endDateTime;
- (NSDate)startDateTime;
- (RTLocation)locationHome;
- (RTLocation)locationWork;
- (RTPlaceDataMetrics)initWithLoggingEnabled:(BOOL)a3;
- (RTPlaceDataMetrics)initWithVisitArray:(id)a3 distanceThreshold:(double)a4 locationHome:(id)a5 locationWork:(id)a6 locationsOfOthers:(id)a7 startDateTime:(id)a8 endDateTime:(id)a9;
- (double)distanceThreshold;
- (id)findHomeWorkOthersIntervals;
- (id)removeTimeFromDateTime:(id)a3 withCalendar:(id)a4;
- (int64_t)convertDateTime2SecondsBasedOnCalendar:(id)a3 dateTime:(id)a4;
- (int64_t)daysBetweenDate:(id)a3 andDate:(id)a4;
- (int64_t)numberOfWeeksBetweenDatesBasedOnCalendar:(id)a3 startDateTime:(id)a4 endDateTime:(id)a5;
- (void)calculateAndSetVisitMetrics;
- (void)setCurrentInferenceReplayableMetricsFromDict:(id)a3;
- (void)setDerivedMetrics;
- (void)setDistanceThreshold:(double)a3;
- (void)setEndDateTime:(id)a3;
- (void)setLocationHome:(id)a3;
- (void)setLocationWork:(id)a3;
- (void)setLocationsOfOthers:(id)a3;
- (void)setMLMetricsFromFeaturesDict:(id)a3 sourceName:(unint64_t)a4;
- (void)setStartDateTime:(id)a3;
- (void)setVisitArray:(id)a3;
@end

@implementation RTPlaceDataMetrics

+ (id)binArrayDuetEventDuration
{
  return +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453728 gap:&unk_1F3453738];
}

+ (id)binArrayPercentage
{
  return +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453748 gap:&unk_1F3453758];
}

- (RTPlaceDataMetrics)initWithVisitArray:(id)a3 distanceThreshold:(double)a4 locationHome:(id)a5 locationWork:(id)a6 locationsOfOthers:(id)a7 startDateTime:(id)a8 endDateTime:(id)a9
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v36 = a7;
  id v35 = a8;
  id v20 = a9;
  if (!v17)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v43 = 0;
    v30 = "Invalid parameter not satisfying: visitArray";
    v31 = (uint8_t *)&v43;
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_24;
  }
  if (a4 <= 0.0)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v42 = 0;
    v30 = "Invalid parameter not satisfying: distanceThreshold > 0";
    v31 = (uint8_t *)&v42;
    goto LABEL_23;
  }
  if (!v18)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v41 = 0;
    v30 = "Invalid parameter not satisfying: locationHome";
    v31 = (uint8_t *)&v41;
    goto LABEL_23;
  }
  if (!v19)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v40 = 0;
    v30 = "Invalid parameter not satisfying: locationWork";
    v31 = (uint8_t *)&v40;
    goto LABEL_23;
  }
  if (!v36)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    __int16 v39 = 0;
    v30 = "Invalid parameter not satisfying: locationsOfOthers";
    v31 = (uint8_t *)&v39;
    goto LABEL_23;
  }
  if (!v35)
  {
    v28 = v20;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: startDateTime";
      v31 = buf;
      goto LABEL_23;
    }
LABEL_24:

    v27 = 0;
    goto LABEL_25;
  }
  id v34 = v20;
  if (v20)
  {
    v21 = [(RTPlaceDataMetrics *)self initWithLoggingEnabled:1];
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_visitArray, a3);
      v22->_distanceThreshold = a4;
      objc_storeStrong((id *)&v22->_locationHome, a5);
      objc_storeStrong((id *)&v22->_locationWork, a6);
      objc_storeStrong((id *)&v22->_locationsOfOthers, a7);
      objc_storeStrong((id *)&v22->_startDateTime, a8);
      objc_storeStrong((id *)&v22->_endDateTime, a9);
      v23 = [NSNumber numberWithDouble:a4];
      v24 = [(RTMetric *)v22 metrics];
      [v24 setObject:v23 forKeyedSubscript:@"home_work_distance_threshold"];

      v25 = [NSNumber numberWithLong:-[RTPlaceDataMetrics daysBetweenDate:andDate:](v22, "daysBetweenDate:andDate:", v22->_startDateTime, v22->_endDateTime)];
      v26 = [(RTMetric *)v22 metrics];
      [v26 setObject:v25 forKeyedSubscript:@"days_of_history"];
    }
    self = v22;
    v27 = self;
  }
  else
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDateTime", v37, 2u);
    }

    v27 = 0;
  }
  v28 = v34;
LABEL_25:

  return v27;
}

- (RTPlaceDataMetrics)initWithLoggingEnabled:(BOOL)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)RTPlaceDataMetrics;
  v3 = [(RTMetric *)&v50 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v47;
      uint64_t v8 = MEMORY[0x1E4F1CC28];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * v9);
          v11 = [(RTMetric *)v3 metrics];
          [v11 setObject:v8 forKeyedSubscript:v10];

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v6);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v12 = [(id)objc_opt_class() integerKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v43;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * v16);
          id v18 = [(RTMetric *)v3 metrics];
          [v18 setObject:&unk_1F3450348 forKeyedSubscript:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v14);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = [(id)objc_opt_class() doubleKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
          v25 = [(RTMetric *)v3 metrics];
          [v25 setObject:&unk_1F3453718 forKeyedSubscript:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v21);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v26 = [objc_opt_class() bucketedKeys];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * v30);
          v32 = [(RTMetric *)v3 metrics];
          [v32 setObject:&unk_1F3450348 forKeyedSubscript:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v28);
    }
  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"agreeDailyPatternsAndDwellTimeOnHome", 0];
}

+ (id)integerKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"days_of_history", @"numPlacesAfterWeeksWithNonZeroDwellTimePruning", @"weeksWithNonZeroDwellTime_home", @"weeksWithNonZeroDwellTime_work", @"numPlacesAfterDailyPatternsPruning", @"homeRankDailyPatterns", @"workRankDailyPatterns", @"homeRankDwellTime", @"workRankDwellTime", 0];
}

+ (id)doubleKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"home_work_distance_threshold", @"mean_distance_homeVisit_from_homeAddress", @"mean_distance_workVisit_from_workAddress", @"mean_distance_otherVisit_from_otherAddress", @"weekly_occurrence_rate_home", @"weekly_occurrence_rate_work", @"mean_visit_time_home", @"median_visit_time_home", @"SD_visit_time_home", @"mean_visit_time_work", @"median_visit_time_work", @"SD_visit_time_work", @"mean_visit_time_others", @"median_visit_time_others", @"SD_visit_time_others", @"average_occurrence_weekdays_Home_Work_Others", @"average_occurrence_weekdays_Home_NoWork_Others",
               @"average_occurrence_weekdays_NoHome_Work_Others",
               @"average_occurrence_weekdays_NoHome_NoWork_Others",
               @"average_occurrence_weekdays_Home_Work_NoOthers",
               @"average_occurrence_weekdays_Home_NoWork_NoOthers",
               @"average_occurrence_weekdays_NoHome_Work_NoOthers",
               @"average_occurrence_weekdays_NoHome_NoWork_NoOthers",
               @"average_occurrence_weekend_Home_Work_Others",
               @"average_occurrence_weekend_Home_NoWork_Others",
               @"average_occurrence_weekend_NoHome_Work_Others",
               @"average_occurrence_weekend_NoHome_NoWork_Others",
               @"average_occurrence_weekend_Home_Work_NoOthers",
               @"average_occurrence_weekend_Home_NoWork_NoOthers",
               @"average_occurrence_weekend_NoHome_Work_NoOthers",
               @"average_occurrence_weekend_NoHome_NoWork_NoOthers",
               @"median_daily_visits_weekdays_home",
               @"mean_daily_visits_weekdays_home",
               @"SD_daily_visits_weekdays_home",
               @"median_daily_visits_weekdays_work",
               @"mean_daily_visits_weekdays_work",
               @"SD_daily_visits_weekdays_work",
               @"median_daily_visits_weekdays_others",
               @"mean_daily_visits_weekdays_others",
               @"SD_daily_visits_weekdays_others",
               @"median_daily_visits_weekend_home",
               @"mean_daily_visits_weekend_home",
               @"SD_daily_visits_weekend_home",
               @"median_daily_visits_weekend_work",
               @"mean_daily_visits_weekend_work",
               @"SD_daily_visits_weekend_work",
               @"median_daily_visits_weekend_others",
               @"mean_daily_visits_weekend_others",
               @"SD_daily_visits_weekend_others",
               @"median_visit_duration_weekdays_home",
               @"mean_visit_duration_weekdays_home",
               @"SD_visit_duration_weekdays_home",
               @"median_visit_duration_weekdays_work",
               @"mean_visit_duration_weekdays_work",
               @"SD_visit_duration_weekdays_work",
               @"median_visit_duration_weekdays_others",
               @"mean_visit_duration_weekdays_others",
               @"SD_visit_duration_weekdays_others",
               @"median_visit_duration_weekend_home",
               @"mean_visit_duration_weekend_home",
               @"SD_visit_duration_weekend_home");
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"home_work_distance_threshold_bucketed", @"mean_distance_homeVisit_from_homeAddress_bucketed", @"mean_distance_workVisit_from_workAddress_bucketed", @"mean_distance_otherVisit_from_otherAddress_bucketed", @"weekly_occurrence_rate_home_bucketed", @"weekly_occurrence_rate_work_bucketed", @"mean_visit_time_home_bucketed", @"median_visit_time_home_bucketed", @"mean_visit_time_work_bucketed", @"median_visit_time_work_bucketed", @"mean_visit_time_others_bucketed", @"median_visit_time_others_bucketed", @"average_occurrence_weekdays_Home_Work_Others_bucketed", @"average_occurrence_weekdays_Home_NoWork_Others_bucketed", @"average_occurrence_weekdays_NoHome_Work_Others_bucketed", @"average_occurrence_weekdays_NoHome_NoWork_Others_bucketed", @"average_occurrence_weekdays_Home_Work_NoOthers_bucketed",
               @"average_occurrence_weekdays_Home_NoWork_NoOthers_bucketed",
               @"average_occurrence_weekdays_NoHome_Work_NoOthers_bucketed",
               @"average_occurrence_weekdays_NoHome_NoWork_NoOthers_bucketed",
               @"average_occurrence_weekend_Home_Work_Others_bucketed",
               @"average_occurrence_weekend_Home_NoWork_Others_bucketed",
               @"average_occurrence_weekend_NoHome_Work_Others_bucketed",
               @"average_occurrence_weekend_NoHome_NoWork_Others_bucketed",
               @"average_occurrence_weekend_Home_Work_NoOthers_bucketed",
               @"average_occurrence_weekend_Home_NoWork_NoOthers_bucketed",
               @"average_occurrence_weekend_NoHome_Work_NoOthers_bucketed",
               @"average_occurrence_weekend_NoHome_NoWork_NoOthers_bucketed",
               @"median_daily_visits_weekdays_home_bucketed",
               @"mean_daily_visits_weekdays_home_bucketed",
               @"median_daily_visits_weekdays_work_bucketed",
               @"mean_daily_visits_weekdays_work_bucketed",
               @"median_daily_visits_weekdays_others_bucketed",
               @"mean_daily_visits_weekdays_others_bucketed",
               @"median_daily_visits_weekend_home_bucketed",
               @"mean_daily_visits_weekend_home_bucketed",
               @"median_daily_visits_weekend_work_bucketed",
               @"mean_daily_visits_weekend_work_bucketed",
               @"median_daily_visits_weekend_others_bucketed",
               @"mean_daily_visits_weekend_others_bucketed",
               @"median_visit_duration_weekdays_home_bucketed",
               @"mean_visit_duration_weekdays_home_bucketed",
               @"median_visit_duration_weekdays_work_bucketed",
               @"mean_visit_duration_weekdays_work_bucketed",
               @"median_visit_duration_weekdays_others_bucketed",
               @"mean_visit_duration_weekdays_others_bucketed",
               @"median_visit_duration_weekend_home_bucketed",
               @"mean_visit_duration_weekend_home_bucketed",
               @"median_visit_duration_weekend_work_bucketed",
               @"mean_visit_duration_weekend_work_bucketed",
               @"median_visit_duration_weekend_others_bucketed",
               @"mean_visit_duration_weekend_others_bucketed",
               @"median_daily_total_visit_duration_weekdays_home_bucketed",
               @"mean_daily_total_visit_duration_weekdays_home_bucketed",
               @"median_daily_total_visit_duration_weekdays_work_bucketed",
               @"mean_daily_total_visit_duration_weekdays_Work_Bucketed",
               @"median_daily_total_visit_duration_weekdays_others_bucketed",
               @"mean_daily_total_visit_duration_weekdays_others_bucketed",
               @"median_daily_total_visit_duration_weekend_home_bucketed",
               @"mean_daily_total_visit_duration_weekend_home_bucketed",
               @"median_daily_total_visit_duration_weekend_work_bucketed");
}

+ (id)supportedMetricKeys
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = [(id)objc_opt_class() integerKeys];
  v4 = [v2 setWithSet:v3];

  uint64_t v5 = [(id)objc_opt_class() BOOLeanKeys];
  uint64_t v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [(id)objc_opt_class() doubleKeys];
  uint64_t v8 = [v7 allObjects];
  [v4 addObjectsFromArray:v8];

  uint64_t v9 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v10 = [v9 allObjects];
  [v4 addObjectsFromArray:v10];

  [v4 addObject:@"data_source"];

  return v4;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventPlaceDataMetrics;
}

- (void)setDerivedMetrics
{
  id v962 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453768 gap:&unk_1F3453778];
  v3 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453728 gap:&unk_1F3453788];
  v958 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F34503F0 gap:&unk_1F3450408];
  v4 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453728 gap:&unk_1F3453798];
  v960 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F3453748 gap:&unk_1F34537A8];
  v961 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F34537B8 gap:&unk_1F34537C8];
  v959 = +[RTMetric binsFromStart:&unk_1F3450330 toEnd:&unk_1F34537D8 gap:&unk_1F3453798];
  uint64_t v5 = [(RTMetric *)self metrics];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"home_work_distance_threshold"];
  uint64_t v7 = +[RTMetric binForNumber:v6 bins:&unk_1F3452B98];
  uint64_t v8 = [(RTMetric *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:@"home_work_distance_threshold_bucketed"];

  uint64_t v9 = [(RTMetric *)self metrics];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"mean_distance_homeVisit_from_homeAddress"];
  v11 = +[RTMetric binForNumber:v10 bins:v962];
  v12 = [(RTMetric *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"mean_distance_homeVisit_from_homeAddress_bucketed"];

  uint64_t v13 = [(RTMetric *)self metrics];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"mean_distance_workVisit_from_workAddress"];
  uint64_t v15 = +[RTMetric binForNumber:v14 bins:v962];
  uint64_t v16 = [(RTMetric *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"mean_distance_workVisit_from_workAddress_bucketed"];

  uint64_t v17 = [(RTMetric *)self metrics];
  id v18 = [v17 objectForKeyedSubscript:@"mean_distance_otherVisit_from_otherAddress"];
  id v19 = +[RTMetric binForNumber:v18 bins:v962];
  uint64_t v20 = [(RTMetric *)self metrics];
  [v20 setObject:v19 forKeyedSubscript:@"mean_distance_otherVisit_from_otherAddress_bucketed"];

  uint64_t v21 = [(RTMetric *)self metrics];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"weekly_occurrence_rate_home"];
  uint64_t v23 = +[RTPlaceDataMetrics binArrayPercentage];
  uint64_t v24 = +[RTMetric binForNumber:v22 bins:v23];
  v25 = [(RTMetric *)self metrics];
  [v25 setObject:v24 forKeyedSubscript:@"weekly_occurrence_rate_home_bucketed"];

  v26 = [(RTMetric *)self metrics];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"weekly_occurrence_rate_work"];
  uint64_t v28 = +[RTPlaceDataMetrics binArrayPercentage];
  uint64_t v29 = +[RTMetric binForNumber:v27 bins:v28];
  uint64_t v30 = [(RTMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"weekly_occurrence_rate_work_bucketed"];

  uint64_t v31 = [(RTMetric *)self metrics];
  v32 = [v31 objectForKeyedSubscript:@"mean_visit_time_home"];
  v33 = +[RTMetric binForNumber:v32 bins:v3];
  long long v34 = [(RTMetric *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"mean_visit_time_home_bucketed"];

  long long v35 = [(RTMetric *)self metrics];
  long long v36 = [v35 objectForKeyedSubscript:@"median_visit_time_home"];
  long long v37 = +[RTMetric binForNumber:v36 bins:v3];
  long long v38 = [(RTMetric *)self metrics];
  [v38 setObject:v37 forKeyedSubscript:@"median_visit_time_home_bucketed"];

  long long v39 = [(RTMetric *)self metrics];
  long long v40 = [v39 objectForKeyedSubscript:@"mean_visit_time_work"];
  long long v41 = +[RTMetric binForNumber:v40 bins:v3];
  long long v42 = [(RTMetric *)self metrics];
  [v42 setObject:v41 forKeyedSubscript:@"mean_visit_time_work_bucketed"];

  long long v43 = [(RTMetric *)self metrics];
  long long v44 = [v43 objectForKeyedSubscript:@"median_visit_time_work"];
  long long v45 = +[RTMetric binForNumber:v44 bins:v3];
  long long v46 = [(RTMetric *)self metrics];
  [v46 setObject:v45 forKeyedSubscript:@"median_visit_time_work_bucketed"];

  long long v47 = [(RTMetric *)self metrics];
  long long v48 = [v47 objectForKeyedSubscript:@"mean_visit_time_others"];
  long long v49 = +[RTMetric binForNumber:v48 bins:v3];
  objc_super v50 = [(RTMetric *)self metrics];
  [v50 setObject:v49 forKeyedSubscript:@"mean_visit_time_others_bucketed"];

  v51 = [(RTMetric *)self metrics];
  v52 = [v51 objectForKeyedSubscript:@"median_visit_time_others"];
  v53 = +[RTMetric binForNumber:v52 bins:v3];
  v54 = [(RTMetric *)self metrics];
  [v54 setObject:v53 forKeyedSubscript:@"median_visit_time_others_bucketed"];

  uint64_t v55 = [(RTMetric *)self metrics];
  v56 = [v55 objectForKeyedSubscript:@"average_occurrence_weekdays_Home_Work_Others"];
  v57 = +[RTMetric binForNumber:v56 bins:v960];
  v58 = [(RTMetric *)self metrics];
  [v58 setObject:v57 forKeyedSubscript:@"average_occurrence_weekdays_Home_Work_Others_bucketed"];

  v59 = [(RTMetric *)self metrics];
  v60 = [v59 objectForKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_Others"];
  v61 = +[RTMetric binForNumber:v60 bins:v960];
  v62 = [(RTMetric *)self metrics];
  [v62 setObject:v61 forKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_Others_bucketed"];

  v63 = [(RTMetric *)self metrics];
  v64 = [v63 objectForKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_Others"];
  v65 = +[RTMetric binForNumber:v64 bins:v960];
  v66 = [(RTMetric *)self metrics];
  [v66 setObject:v65 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_Others_bucketed"];

  v67 = [(RTMetric *)self metrics];
  v68 = [v67 objectForKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_Others"];
  v69 = +[RTMetric binForNumber:v68 bins:v960];
  v70 = [(RTMetric *)self metrics];
  [v70 setObject:v69 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_Others_bucketed"];

  v71 = [(RTMetric *)self metrics];
  v72 = [v71 objectForKeyedSubscript:@"average_occurrence_weekdays_Home_Work_NoOthers"];
  v73 = +[RTMetric binForNumber:v72 bins:v960];
  v74 = [(RTMetric *)self metrics];
  [v74 setObject:v73 forKeyedSubscript:@"average_occurrence_weekdays_Home_Work_NoOthers_bucketed"];

  v75 = [(RTMetric *)self metrics];
  v76 = [v75 objectForKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_NoOthers"];
  v77 = +[RTMetric binForNumber:v76 bins:v960];
  v78 = [(RTMetric *)self metrics];
  [v78 setObject:v77 forKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_NoOthers_bucketed"];

  v79 = [(RTMetric *)self metrics];
  v80 = [v79 objectForKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_NoOthers"];
  v81 = +[RTMetric binForNumber:v80 bins:v960];
  v82 = [(RTMetric *)self metrics];
  [v82 setObject:v81 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_NoOthers_bucketed"];

  v83 = [(RTMetric *)self metrics];
  v84 = [v83 objectForKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_NoOthers"];
  v85 = +[RTMetric binForNumber:v84 bins:v960];
  v86 = [(RTMetric *)self metrics];
  [v86 setObject:v85 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_NoOthers_bucketed"];

  v87 = [(RTMetric *)self metrics];
  v88 = [v87 objectForKeyedSubscript:@"average_occurrence_weekend_Home_Work_Others"];
  v89 = +[RTMetric binForNumber:v88 bins:v960];
  v90 = [(RTMetric *)self metrics];
  [v90 setObject:v89 forKeyedSubscript:@"average_occurrence_weekend_Home_Work_Others_bucketed"];

  v91 = [(RTMetric *)self metrics];
  v92 = [v91 objectForKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_Others"];
  v93 = +[RTMetric binForNumber:v92 bins:v960];
  v94 = [(RTMetric *)self metrics];
  [v94 setObject:v93 forKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_Others_bucketed"];

  v95 = [(RTMetric *)self metrics];
  v96 = [v95 objectForKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_Others"];
  v97 = +[RTMetric binForNumber:v96 bins:v960];
  v98 = [(RTMetric *)self metrics];
  [v98 setObject:v97 forKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_Others_bucketed"];

  v99 = [(RTMetric *)self metrics];
  v100 = [v99 objectForKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_Others"];
  v101 = +[RTMetric binForNumber:v100 bins:v960];
  v102 = [(RTMetric *)self metrics];
  [v102 setObject:v101 forKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_Others_bucketed"];

  v103 = [(RTMetric *)self metrics];
  v104 = [v103 objectForKeyedSubscript:@"average_occurrence_weekend_Home_Work_NoOthers"];
  v105 = +[RTMetric binForNumber:v104 bins:v960];
  v106 = [(RTMetric *)self metrics];
  [v106 setObject:v105 forKeyedSubscript:@"average_occurrence_weekend_Home_Work_NoOthers_bucketed"];

  v107 = [(RTMetric *)self metrics];
  v108 = [v107 objectForKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_NoOthers"];
  v109 = +[RTMetric binForNumber:v108 bins:v960];
  v110 = [(RTMetric *)self metrics];
  [v110 setObject:v109 forKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_NoOthers_bucketed"];

  v111 = [(RTMetric *)self metrics];
  v112 = [v111 objectForKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_NoOthers"];
  v113 = +[RTMetric binForNumber:v112 bins:v960];
  v114 = [(RTMetric *)self metrics];
  [v114 setObject:v113 forKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_NoOthers_bucketed"];

  v115 = [(RTMetric *)self metrics];
  v116 = [v115 objectForKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_NoOthers"];
  v117 = +[RTMetric binForNumber:v116 bins:v960];
  v118 = [(RTMetric *)self metrics];
  [v118 setObject:v117 forKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_NoOthers_bucketed"];

  v119 = [(RTMetric *)self metrics];
  v120 = [v119 objectForKeyedSubscript:@"median_daily_visits_weekdays_home"];
  v121 = +[RTMetric binForNumber:v120 bins:v958];
  v122 = [(RTMetric *)self metrics];
  [v122 setObject:v121 forKeyedSubscript:@"median_daily_visits_weekdays_home_bucketed"];

  v123 = [(RTMetric *)self metrics];
  v124 = [v123 objectForKeyedSubscript:@"mean_daily_visits_weekdays_home"];
  v125 = +[RTMetric binForNumber:v124 bins:v958];
  v126 = [(RTMetric *)self metrics];
  [v126 setObject:v125 forKeyedSubscript:@"mean_daily_visits_weekdays_home_bucketed"];

  v127 = [(RTMetric *)self metrics];
  v128 = [v127 objectForKeyedSubscript:@"median_daily_visits_weekdays_work"];
  v129 = +[RTMetric binForNumber:v128 bins:v958];
  v130 = [(RTMetric *)self metrics];
  [v130 setObject:v129 forKeyedSubscript:@"median_daily_visits_weekdays_work_bucketed"];

  v131 = [(RTMetric *)self metrics];
  v132 = [v131 objectForKeyedSubscript:@"mean_daily_visits_weekdays_work"];
  v133 = +[RTMetric binForNumber:v132 bins:v958];
  v134 = [(RTMetric *)self metrics];
  [v134 setObject:v133 forKeyedSubscript:@"mean_daily_visits_weekdays_work_bucketed"];

  v135 = [(RTMetric *)self metrics];
  v136 = [v135 objectForKeyedSubscript:@"median_daily_visits_weekdays_others"];
  v137 = +[RTMetric binForNumber:v136 bins:v958];
  v138 = [(RTMetric *)self metrics];
  [v138 setObject:v137 forKeyedSubscript:@"median_daily_visits_weekdays_others_bucketed"];

  v139 = [(RTMetric *)self metrics];
  v140 = [v139 objectForKeyedSubscript:@"mean_daily_visits_weekdays_others"];
  v141 = +[RTMetric binForNumber:v140 bins:v958];
  v142 = [(RTMetric *)self metrics];
  [v142 setObject:v141 forKeyedSubscript:@"mean_daily_visits_weekdays_others_bucketed"];

  v143 = [(RTMetric *)self metrics];
  v144 = [v143 objectForKeyedSubscript:@"median_daily_visits_weekend_home"];
  v145 = +[RTMetric binForNumber:v144 bins:v958];
  v146 = [(RTMetric *)self metrics];
  [v146 setObject:v145 forKeyedSubscript:@"median_daily_visits_weekend_home_bucketed"];

  v147 = [(RTMetric *)self metrics];
  v148 = [v147 objectForKeyedSubscript:@"mean_daily_visits_weekend_home"];
  v149 = +[RTMetric binForNumber:v148 bins:v958];
  v150 = [(RTMetric *)self metrics];
  [v150 setObject:v149 forKeyedSubscript:@"mean_daily_visits_weekend_home_bucketed"];

  v151 = [(RTMetric *)self metrics];
  v152 = [v151 objectForKeyedSubscript:@"median_daily_visits_weekend_work"];
  v153 = +[RTMetric binForNumber:v152 bins:v958];
  v154 = [(RTMetric *)self metrics];
  [v154 setObject:v153 forKeyedSubscript:@"median_daily_visits_weekend_work_bucketed"];

  v155 = [(RTMetric *)self metrics];
  v156 = [v155 objectForKeyedSubscript:@"mean_daily_visits_weekend_work"];
  v157 = +[RTMetric binForNumber:v156 bins:v958];
  v158 = [(RTMetric *)self metrics];
  [v158 setObject:v157 forKeyedSubscript:@"mean_daily_visits_weekend_work_bucketed"];

  v159 = [(RTMetric *)self metrics];
  v160 = [v159 objectForKeyedSubscript:@"median_daily_visits_weekend_others"];
  v161 = +[RTMetric binForNumber:v160 bins:v958];
  v162 = [(RTMetric *)self metrics];
  [v162 setObject:v161 forKeyedSubscript:@"median_daily_visits_weekend_others_bucketed"];

  v163 = [(RTMetric *)self metrics];
  v164 = [v163 objectForKeyedSubscript:@"mean_daily_visits_weekend_others"];
  v165 = +[RTMetric binForNumber:v164 bins:v958];
  v166 = [(RTMetric *)self metrics];
  [v166 setObject:v165 forKeyedSubscript:@"mean_daily_visits_weekend_others_bucketed"];

  v167 = [(RTMetric *)self metrics];
  v168 = [v167 objectForKeyedSubscript:@"median_visit_duration_weekdays_home"];
  v169 = +[RTMetric binForNumber:v168 bins:v4];
  v170 = [(RTMetric *)self metrics];
  [v170 setObject:v169 forKeyedSubscript:@"median_visit_duration_weekdays_home_bucketed"];

  v171 = [(RTMetric *)self metrics];
  v172 = [v171 objectForKeyedSubscript:@"mean_visit_duration_weekdays_home"];
  v173 = +[RTMetric binForNumber:v172 bins:v4];
  v174 = [(RTMetric *)self metrics];
  [v174 setObject:v173 forKeyedSubscript:@"mean_visit_duration_weekdays_home_bucketed"];

  v175 = [(RTMetric *)self metrics];
  v176 = [v175 objectForKeyedSubscript:@"median_visit_duration_weekdays_work"];
  v177 = +[RTMetric binForNumber:v176 bins:v4];
  v178 = [(RTMetric *)self metrics];
  [v178 setObject:v177 forKeyedSubscript:@"median_visit_duration_weekdays_work_bucketed"];

  v179 = [(RTMetric *)self metrics];
  v180 = [v179 objectForKeyedSubscript:@"mean_visit_duration_weekdays_work"];
  v181 = +[RTMetric binForNumber:v180 bins:v4];
  v182 = [(RTMetric *)self metrics];
  [v182 setObject:v181 forKeyedSubscript:@"mean_visit_duration_weekdays_work_bucketed"];

  v183 = [(RTMetric *)self metrics];
  v184 = [v183 objectForKeyedSubscript:@"median_visit_duration_weekdays_others"];
  v185 = +[RTMetric binForNumber:v184 bins:v4];
  v186 = [(RTMetric *)self metrics];
  [v186 setObject:v185 forKeyedSubscript:@"median_visit_duration_weekdays_others_bucketed"];

  v187 = [(RTMetric *)self metrics];
  v188 = [v187 objectForKeyedSubscript:@"mean_visit_duration_weekdays_others"];
  v189 = +[RTMetric binForNumber:v188 bins:v4];
  v190 = [(RTMetric *)self metrics];
  [v190 setObject:v189 forKeyedSubscript:@"mean_visit_duration_weekdays_others_bucketed"];

  v191 = [(RTMetric *)self metrics];
  v192 = [v191 objectForKeyedSubscript:@"median_visit_duration_weekend_home"];
  v193 = +[RTMetric binForNumber:v192 bins:v4];
  v194 = [(RTMetric *)self metrics];
  [v194 setObject:v193 forKeyedSubscript:@"median_visit_duration_weekend_home_bucketed"];

  v195 = [(RTMetric *)self metrics];
  v196 = [v195 objectForKeyedSubscript:@"mean_visit_duration_weekend_home"];
  v197 = +[RTMetric binForNumber:v196 bins:v4];
  v198 = [(RTMetric *)self metrics];
  [v198 setObject:v197 forKeyedSubscript:@"mean_visit_duration_weekend_home_bucketed"];

  v199 = [(RTMetric *)self metrics];
  v200 = [v199 objectForKeyedSubscript:@"median_visit_duration_weekend_work"];
  v201 = +[RTMetric binForNumber:v200 bins:v4];
  v202 = [(RTMetric *)self metrics];
  [v202 setObject:v201 forKeyedSubscript:@"median_visit_duration_weekend_work_bucketed"];

  v203 = [(RTMetric *)self metrics];
  v204 = [v203 objectForKeyedSubscript:@"mean_visit_duration_weekend_work"];
  v205 = +[RTMetric binForNumber:v204 bins:v4];
  v206 = [(RTMetric *)self metrics];
  [v206 setObject:v205 forKeyedSubscript:@"mean_visit_duration_weekend_work_bucketed"];

  v207 = [(RTMetric *)self metrics];
  v208 = [v207 objectForKeyedSubscript:@"median_visit_duration_weekend_others"];
  v209 = +[RTMetric binForNumber:v208 bins:v4];
  v210 = [(RTMetric *)self metrics];
  [v210 setObject:v209 forKeyedSubscript:@"median_visit_duration_weekend_others_bucketed"];

  v211 = [(RTMetric *)self metrics];
  v212 = [v211 objectForKeyedSubscript:@"mean_visit_duration_weekend_others"];
  v213 = +[RTMetric binForNumber:v212 bins:v4];
  v214 = [(RTMetric *)self metrics];
  [v214 setObject:v213 forKeyedSubscript:@"mean_visit_duration_weekend_others_bucketed"];

  v215 = [(RTMetric *)self metrics];
  v216 = [v215 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekdays_home"];
  v217 = +[RTMetric binForNumber:v216 bins:v4];
  v218 = [(RTMetric *)self metrics];
  [v218 setObject:v217 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_home_bucketed"];

  v219 = [(RTMetric *)self metrics];
  v220 = [v219 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_home"];
  v221 = +[RTMetric binForNumber:v220 bins:v4];
  v222 = [(RTMetric *)self metrics];
  [v222 setObject:v221 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_home_bucketed"];

  v223 = [(RTMetric *)self metrics];
  v224 = [v223 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekdays_work"];
  v225 = +[RTMetric binForNumber:v224 bins:v4];
  v226 = [(RTMetric *)self metrics];
  [v226 setObject:v225 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_work_bucketed"];

  v227 = [(RTMetric *)self metrics];
  v228 = [v227 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_work"];
  v229 = +[RTMetric binForNumber:v228 bins:v4];
  v230 = [(RTMetric *)self metrics];
  [v230 setObject:v229 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_Work_Bucketed"];

  v231 = [(RTMetric *)self metrics];
  v232 = [v231 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekdays_others"];
  v233 = +[RTMetric binForNumber:v232 bins:v4];
  v234 = [(RTMetric *)self metrics];
  [v234 setObject:v233 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_others_bucketed"];

  v235 = [(RTMetric *)self metrics];
  v236 = [v235 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_others"];
  v237 = +[RTMetric binForNumber:v236 bins:v4];
  v238 = [(RTMetric *)self metrics];
  [v238 setObject:v237 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_others_bucketed"];

  v239 = [(RTMetric *)self metrics];
  v240 = [v239 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekend_home"];
  v241 = +[RTMetric binForNumber:v240 bins:v4];
  v242 = [(RTMetric *)self metrics];
  [v242 setObject:v241 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_home_bucketed"];

  v243 = [(RTMetric *)self metrics];
  v244 = [v243 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekend_home"];
  v245 = +[RTMetric binForNumber:v244 bins:v4];
  v246 = [(RTMetric *)self metrics];
  [v246 setObject:v245 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_home_bucketed"];

  v247 = [(RTMetric *)self metrics];
  v248 = [v247 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekend_work"];
  v249 = +[RTMetric binForNumber:v248 bins:v4];
  v250 = [(RTMetric *)self metrics];
  [v250 setObject:v249 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_work_bucketed"];

  v251 = [(RTMetric *)self metrics];
  v252 = [v251 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekend_work"];
  v253 = +[RTMetric binForNumber:v252 bins:v4];
  v254 = [(RTMetric *)self metrics];
  [v254 setObject:v253 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_work_bucketed"];

  v255 = [(RTMetric *)self metrics];
  v256 = [v255 objectForKeyedSubscript:@"median_daily_total_visit_duration_weekend_others"];
  v257 = +[RTMetric binForNumber:v256 bins:v4];
  v258 = [(RTMetric *)self metrics];
  [v258 setObject:v257 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_others_bucketed"];

  v259 = [(RTMetric *)self metrics];
  v260 = [v259 objectForKeyedSubscript:@"mean_daily_total_visit_duration_weekend_others"];
  v261 = +[RTMetric binForNumber:v260 bins:v4];
  v262 = [(RTMetric *)self metrics];
  [v262 setObject:v261 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_others_bucketed"];

  v263 = [(RTMetric *)self metrics];
  v264 = [v263 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_home"];
  v265 = +[RTMetric binForNumber:v264 bins:v4];
  v266 = [(RTMetric *)self metrics];
  [v266 setObject:v265 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_home_bucketed"];

  v267 = [(RTMetric *)self metrics];
  v268 = [v267 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_home"];
  v269 = +[RTMetric binForNumber:v268 bins:v4];
  v270 = [(RTMetric *)self metrics];
  [v270 setObject:v269 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_home_bucketed"];

  v271 = [(RTMetric *)self metrics];
  v272 = [v271 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_work"];
  v273 = +[RTMetric binForNumber:v272 bins:v4];
  v274 = [(RTMetric *)self metrics];
  [v274 setObject:v273 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_work_bucketed"];

  v275 = [(RTMetric *)self metrics];
  v276 = [v275 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_work"];
  v277 = +[RTMetric binForNumber:v276 bins:v4];
  v278 = [(RTMetric *)self metrics];
  [v278 setObject:v277 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_work_bucketed"];

  v279 = [(RTMetric *)self metrics];
  v280 = [v279 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_others"];
  v281 = +[RTMetric binForNumber:v280 bins:v4];
  v282 = [(RTMetric *)self metrics];
  [v282 setObject:v281 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_others_bucketed"];

  v283 = [(RTMetric *)self metrics];
  v284 = [v283 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_others"];
  v285 = +[RTMetric binForNumber:v284 bins:v4];
  v286 = [(RTMetric *)self metrics];
  [v286 setObject:v285 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_others_bucketed"];

  v287 = [(RTMetric *)self metrics];
  v288 = [v287 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekend_home"];
  v289 = +[RTMetric binForNumber:v288 bins:v4];
  v290 = [(RTMetric *)self metrics];
  [v290 setObject:v289 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_home_bucketed"];

  v291 = [(RTMetric *)self metrics];
  v292 = [v291 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_home"];
  v293 = +[RTMetric binForNumber:v292 bins:v4];
  v294 = [(RTMetric *)self metrics];
  [v294 setObject:v293 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_home_bucketed"];

  v295 = [(RTMetric *)self metrics];
  v296 = [v295 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekend_work"];
  v297 = +[RTMetric binForNumber:v296 bins:v4];
  v298 = [(RTMetric *)self metrics];
  [v298 setObject:v297 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_work_bucketed"];

  v299 = [(RTMetric *)self metrics];
  v300 = [v299 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_work"];
  v301 = +[RTMetric binForNumber:v300 bins:v4];
  v302 = [(RTMetric *)self metrics];
  [v302 setObject:v301 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_work_bucketed"];

  v303 = [(RTMetric *)self metrics];
  v304 = [v303 objectForKeyedSubscript:@"median_daily_longest_visit_duration_weekend_others"];
  v305 = +[RTMetric binForNumber:v304 bins:v4];
  v306 = [(RTMetric *)self metrics];
  [v306 setObject:v305 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_others_bucketed"];

  v307 = [(RTMetric *)self metrics];
  v308 = [v307 objectForKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_others"];
  v309 = +[RTMetric binForNumber:v308 bins:v4];
  v310 = [(RTMetric *)self metrics];
  [v310 setObject:v309 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_others_bucketed"];

  v311 = [(RTMetric *)self metrics];
  v312 = [v311 objectForKeyedSubscript:@"percentage_of_days_with_charging_home"];
  v313 = +[RTPlaceDataMetrics binArrayPercentage];
  v314 = +[RTMetric binForNumber:v312 bins:v313];
  v315 = [(RTMetric *)self metrics];
  [v315 setObject:v314 forKeyedSubscript:@"percentage_of_days_with_charging_home_bucketed"];

  v316 = [(RTMetric *)self metrics];
  v317 = [v316 objectForKeyedSubscript:@"percentage_of_days_with_charging_work"];
  v318 = +[RTPlaceDataMetrics binArrayPercentage];
  v319 = +[RTMetric binForNumber:v317 bins:v318];
  v320 = [(RTMetric *)self metrics];
  [v320 setObject:v319 forKeyedSubscript:@"percentage_of_days_with_charging_work_bucketed"];

  v321 = [(RTMetric *)self metrics];
  v322 = [v321 objectForKeyedSubscript:@"percentage_of_days_with_charging_others"];
  v323 = +[RTPlaceDataMetrics binArrayPercentage];
  v324 = +[RTMetric binForNumber:v322 bins:v323];
  v325 = [(RTMetric *)self metrics];
  [v325 setObject:v324 forKeyedSubscript:@"percentage_of_days_with_charging_others_bucketed"];

  v326 = [(RTMetric *)self metrics];
  v327 = [v326 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion_home"];
  v328 = +[RTPlaceDataMetrics binArrayPercentage];
  v329 = +[RTMetric binForNumber:v327 bins:v328];
  v330 = [(RTMetric *)self metrics];
  [v330 setObject:v329 forKeyedSubscript:@"percentage_of_days_with_static_motion_home_bucketed"];

  v331 = [(RTMetric *)self metrics];
  v332 = [v331 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion_work"];
  v333 = +[RTPlaceDataMetrics binArrayPercentage];
  v334 = +[RTMetric binForNumber:v332 bins:v333];
  v335 = [(RTMetric *)self metrics];
  [v335 setObject:v334 forKeyedSubscript:@"percentage_of_days_with_static_motion_work_bucketed"];

  v336 = [(RTMetric *)self metrics];
  v337 = [v336 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion_others"];
  v338 = +[RTPlaceDataMetrics binArrayPercentage];
  v339 = +[RTMetric binForNumber:v337 bins:v338];
  v340 = [(RTMetric *)self metrics];
  [v340 setObject:v339 forKeyedSubscript:@"percentage_of_days_with_static_motion_others_bucketed"];

  v341 = [(RTMetric *)self metrics];
  v342 = [v341 objectForKeyedSubscript:@"percentage_of_days_with_screenLock_home"];
  v343 = +[RTPlaceDataMetrics binArrayPercentage];
  v344 = +[RTMetric binForNumber:v342 bins:v343];
  v345 = [(RTMetric *)self metrics];
  [v345 setObject:v344 forKeyedSubscript:@"percentage_of_days_with_screen_lock_home_bucketed"];

  v346 = [(RTMetric *)self metrics];
  v347 = [v346 objectForKeyedSubscript:@"percentage_of_days_with_screenLock_work"];
  v348 = +[RTPlaceDataMetrics binArrayPercentage];
  v349 = +[RTMetric binForNumber:v347 bins:v348];
  v350 = [(RTMetric *)self metrics];
  [v350 setObject:v349 forKeyedSubscript:@"percentage_of_days_with_screen_lock_work_bucketed"];

  v351 = [(RTMetric *)self metrics];
  v352 = [v351 objectForKeyedSubscript:@"percentage_of_days_with_screenLock_others"];
  v353 = +[RTPlaceDataMetrics binArrayPercentage];
  v354 = +[RTMetric binForNumber:v352 bins:v353];
  v355 = [(RTMetric *)self metrics];
  [v355 setObject:v354 forKeyedSubscript:@"percentage_of_days_with_screen_lock_others_bucketed"];

  v356 = [(RTMetric *)self metrics];
  v357 = [v356 objectForKeyedSubscript:@"median_daily_total_charging_duration_home"];
  v358 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v359 = +[RTMetric binForNumber:v357 bins:v358];
  v360 = [(RTMetric *)self metrics];
  [v360 setObject:v359 forKeyedSubscript:@"median_daily_total_charging_duration_home_bucketed"];

  v361 = [(RTMetric *)self metrics];
  v362 = [v361 objectForKeyedSubscript:@"mean_daily_total_charging_duration_home"];
  v363 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v364 = +[RTMetric binForNumber:v362 bins:v363];
  v365 = [(RTMetric *)self metrics];
  [v365 setObject:v364 forKeyedSubscript:@"mean_daily_total_charging_duration_home_bucketed"];

  v366 = [(RTMetric *)self metrics];
  v367 = [v366 objectForKeyedSubscript:@"median_daily_total_charging_duration_work"];
  v368 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v369 = +[RTMetric binForNumber:v367 bins:v368];
  v370 = [(RTMetric *)self metrics];
  [v370 setObject:v369 forKeyedSubscript:@"median_daily_total_charging_duration_work_bucketed"];

  v371 = [(RTMetric *)self metrics];
  v372 = [v371 objectForKeyedSubscript:@"mean_daily_total_charging_duration_work"];
  v373 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v374 = +[RTMetric binForNumber:v372 bins:v373];
  v375 = [(RTMetric *)self metrics];
  [v375 setObject:v374 forKeyedSubscript:@"mean_daily_total_charging_duration_work_bucketed"];

  v376 = [(RTMetric *)self metrics];
  v377 = [v376 objectForKeyedSubscript:@"median_daily_total_charging_duration_others"];
  v378 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v379 = +[RTMetric binForNumber:v377 bins:v378];
  v380 = [(RTMetric *)self metrics];
  [v380 setObject:v379 forKeyedSubscript:@"median_daily_total_charging_duration_others_bucketed"];

  v381 = [(RTMetric *)self metrics];
  v382 = [v381 objectForKeyedSubscript:@"mean_daily_total_charging_duration_others"];
  v383 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v384 = +[RTMetric binForNumber:v382 bins:v383];
  v385 = [(RTMetric *)self metrics];
  [v385 setObject:v384 forKeyedSubscript:@"mean_daily_total_charging_duration_others_bucketed"];

  v386 = [(RTMetric *)self metrics];
  v387 = [v386 objectForKeyedSubscript:@"median_daily_longest_charging_duration_home"];
  v388 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v389 = +[RTMetric binForNumber:v387 bins:v388];
  v390 = [(RTMetric *)self metrics];
  [v390 setObject:v389 forKeyedSubscript:@"median_daily_longest_charging_duration_home_bucketed"];

  v391 = [(RTMetric *)self metrics];
  v392 = [v391 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_home"];
  v393 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v394 = +[RTMetric binForNumber:v392 bins:v393];
  v395 = [(RTMetric *)self metrics];
  [v395 setObject:v394 forKeyedSubscript:@"mean_daily_longest_charging_duration_home_bucketed"];

  v396 = [(RTMetric *)self metrics];
  v397 = [v396 objectForKeyedSubscript:@"median_daily_longest_charging_duration_work"];
  v398 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v399 = +[RTMetric binForNumber:v397 bins:v398];
  v400 = [(RTMetric *)self metrics];
  [v400 setObject:v399 forKeyedSubscript:@"median_daily_longest_charging_duration_work_bucketed"];

  v401 = [(RTMetric *)self metrics];
  v402 = [v401 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_work"];
  v403 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v404 = +[RTMetric binForNumber:v402 bins:v403];
  v405 = [(RTMetric *)self metrics];
  [v405 setObject:v404 forKeyedSubscript:@"mean_daily_longest_charging_duration_work_bucketed"];

  v406 = [(RTMetric *)self metrics];
  v407 = [v406 objectForKeyedSubscript:@"median_daily_longest_charging_duration_others"];
  v408 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v409 = +[RTMetric binForNumber:v407 bins:v408];
  v410 = [(RTMetric *)self metrics];
  [v410 setObject:v409 forKeyedSubscript:@"median_dailylongestchargingdurationothers_bucketed"];

  v411 = [(RTMetric *)self metrics];
  v412 = [v411 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_others"];
  v413 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v414 = +[RTMetric binForNumber:v412 bins:v413];
  v415 = [(RTMetric *)self metrics];
  [v415 setObject:v414 forKeyedSubscript:@"mean_daily_longest_charging_duration_others_bucketed"];

  v416 = [(RTMetric *)self metrics];
  v417 = [v416 objectForKeyedSubscript:@"median_daily_total_static_motion_duration_home"];
  v418 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v419 = +[RTMetric binForNumber:v417 bins:v418];
  v420 = [(RTMetric *)self metrics];
  [v420 setObject:v419 forKeyedSubscript:@"median_daily_total_static_motion_duration_home_bucketed"];

  v421 = [(RTMetric *)self metrics];
  v422 = [v421 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration_home"];
  v423 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v424 = +[RTMetric binForNumber:v422 bins:v423];
  v425 = [(RTMetric *)self metrics];
  [v425 setObject:v424 forKeyedSubscript:@"mean_daily_total_static_motion_duration_home_bucketed"];

  v426 = [(RTMetric *)self metrics];
  v427 = [v426 objectForKeyedSubscript:@"median_daily_total_static_motion_duration_work"];
  v428 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v429 = +[RTMetric binForNumber:v427 bins:v428];
  v430 = [(RTMetric *)self metrics];
  [v430 setObject:v429 forKeyedSubscript:@"median_daily_total_static_motion_duration_work_bucketed"];

  v431 = [(RTMetric *)self metrics];
  v432 = [v431 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration_work"];
  v433 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v434 = +[RTMetric binForNumber:v432 bins:v433];
  v435 = [(RTMetric *)self metrics];
  [v435 setObject:v434 forKeyedSubscript:@"mean_daily_total_static_motion_duration_work_bucketed"];

  v436 = [(RTMetric *)self metrics];
  v437 = [v436 objectForKeyedSubscript:@"median_daily_total_static_motion_duration_others"];
  v438 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v439 = +[RTMetric binForNumber:v437 bins:v438];
  v440 = [(RTMetric *)self metrics];
  [v440 setObject:v439 forKeyedSubscript:@"median_daily_total_static_motion_duration_others_bucketed"];

  v441 = [(RTMetric *)self metrics];
  v442 = [v441 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration_others"];
  v443 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v444 = +[RTMetric binForNumber:v442 bins:v443];
  v445 = [(RTMetric *)self metrics];
  [v445 setObject:v444 forKeyedSubscript:@"mean_daily_total_static_motion_duration_others_bucketed"];

  v446 = [(RTMetric *)self metrics];
  v447 = [v446 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration_home"];
  v448 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v449 = +[RTMetric binForNumber:v447 bins:v448];
  v450 = [(RTMetric *)self metrics];
  [v450 setObject:v449 forKeyedSubscript:@"median_daily_longest_static_motion_duration_home_bucketed"];

  v451 = [(RTMetric *)self metrics];
  v452 = [v451 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration_home"];
  v453 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v454 = +[RTMetric binForNumber:v452 bins:v453];
  v455 = [(RTMetric *)self metrics];
  [v455 setObject:v454 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_home_bucketed"];

  v456 = [(RTMetric *)self metrics];
  v457 = [v456 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration_work"];
  v458 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v459 = +[RTMetric binForNumber:v457 bins:v458];
  v460 = [(RTMetric *)self metrics];
  [v460 setObject:v459 forKeyedSubscript:@"median_daily_longest_static_motion_duration_work_bucketed"];

  v461 = [(RTMetric *)self metrics];
  v462 = [v461 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration_work"];
  v463 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v464 = +[RTMetric binForNumber:v462 bins:v463];
  v465 = [(RTMetric *)self metrics];
  [v465 setObject:v464 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_work_bucketed"];

  v466 = [(RTMetric *)self metrics];
  v467 = [v466 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration_others"];
  v468 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v469 = +[RTMetric binForNumber:v467 bins:v468];
  v470 = [(RTMetric *)self metrics];
  [v470 setObject:v469 forKeyedSubscript:@"median_daily_longest_static_motion_duration_others_bucketed"];

  v471 = [(RTMetric *)self metrics];
  v472 = [v471 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration_others"];
  v473 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v474 = +[RTMetric binForNumber:v472 bins:v473];
  v475 = [(RTMetric *)self metrics];
  [v475 setObject:v474 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_others_bucketed"];

  v476 = [(RTMetric *)self metrics];
  v477 = [v476 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration_home"];
  v478 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v479 = +[RTMetric binForNumber:v477 bins:v478];
  v480 = [(RTMetric *)self metrics];
  [v480 setObject:v479 forKeyedSubscript:@"median_daily_total_screen_lock_duration_home_bucketed"];

  v481 = [(RTMetric *)self metrics];
  v482 = [v481 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration_home"];
  v483 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v484 = +[RTMetric binForNumber:v482 bins:v483];
  v485 = [(RTMetric *)self metrics];
  [v485 setObject:v484 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_home_bucketed"];

  v486 = [(RTMetric *)self metrics];
  v487 = [v486 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration_work"];
  v488 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v489 = +[RTMetric binForNumber:v487 bins:v488];
  v490 = [(RTMetric *)self metrics];
  [v490 setObject:v489 forKeyedSubscript:@"median_daily_total_screen_lock_duration_work_bucketed"];

  v491 = [(RTMetric *)self metrics];
  v492 = [v491 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration_work"];
  v493 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v494 = +[RTMetric binForNumber:v492 bins:v493];
  v495 = [(RTMetric *)self metrics];
  [v495 setObject:v494 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_work_bucketed"];

  v496 = [(RTMetric *)self metrics];
  v497 = [v496 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration_others"];
  v498 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v499 = +[RTMetric binForNumber:v497 bins:v498];
  v500 = [(RTMetric *)self metrics];
  [v500 setObject:v499 forKeyedSubscript:@"median_daily_total_screen_lock_duration_others_bucketed"];

  v501 = [(RTMetric *)self metrics];
  v502 = [v501 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration_others"];
  v503 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v504 = +[RTMetric binForNumber:v502 bins:v503];
  v505 = [(RTMetric *)self metrics];
  [v505 setObject:v504 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_others_bucketed"];

  v506 = [(RTMetric *)self metrics];
  v507 = [v506 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration_home"];
  v508 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v509 = +[RTMetric binForNumber:v507 bins:v508];
  v510 = [(RTMetric *)self metrics];
  [v510 setObject:v509 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_home_bucketed"];

  v511 = [(RTMetric *)self metrics];
  v512 = [v511 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_home"];
  v513 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v514 = +[RTMetric binForNumber:v512 bins:v513];
  v515 = [(RTMetric *)self metrics];
  [v515 setObject:v514 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_home_bucketed"];

  v516 = [(RTMetric *)self metrics];
  v517 = [v516 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration_work"];
  v518 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v519 = +[RTMetric binForNumber:v517 bins:v518];
  v520 = [(RTMetric *)self metrics];
  [v520 setObject:v519 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_work_bucketed"];

  v521 = [(RTMetric *)self metrics];
  v522 = [v521 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_work"];
  v523 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v524 = +[RTMetric binForNumber:v522 bins:v523];
  v525 = [(RTMetric *)self metrics];
  [v525 setObject:v524 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_work_bucketed"];

  v526 = [(RTMetric *)self metrics];
  v527 = [v526 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration_others"];
  v528 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v529 = +[RTMetric binForNumber:v527 bins:v528];
  v530 = [(RTMetric *)self metrics];
  [v530 setObject:v529 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_others_bucketed"];

  v531 = [(RTMetric *)self metrics];
  v532 = [v531 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_others"];
  v533 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v534 = +[RTMetric binForNumber:v532 bins:v533];
  v535 = [(RTMetric *)self metrics];
  [v535 setObject:v534 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_others_bucketed"];

  v536 = [(RTMetric *)self metrics];
  v537 = [v536 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_home"];
  v538 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v539 = +[RTMetric binForNumber:v537 bins:v538];
  v540 = [(RTMetric *)self metrics];
  [v540 setObject:v539 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v541 = [(RTMetric *)self metrics];
  v542 = [v541 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_home"];
  v543 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v544 = +[RTMetric binForNumber:v542 bins:v543];
  v545 = [(RTMetric *)self metrics];
  [v545 setObject:v544 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v546 = [(RTMetric *)self metrics];
  v547 = [v546 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_home"];
  v548 = +[RTPlaceDataMetrics binArrayPercentage];
  v549 = +[RTMetric binForNumber:v547 bins:v548];
  v550 = [(RTMetric *)self metrics];
  [v550 setObject:v549 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_home_bucketed"];

  v551 = [(RTMetric *)self metrics];
  v552 = [v551 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_work"];
  v553 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v554 = +[RTMetric binForNumber:v552 bins:v553];
  v555 = [(RTMetric *)self metrics];
  [v555 setObject:v554 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v556 = [(RTMetric *)self metrics];
  v557 = [v556 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_work"];
  v558 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v559 = +[RTMetric binForNumber:v557 bins:v558];
  v560 = [(RTMetric *)self metrics];
  [v560 setObject:v559 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v561 = [(RTMetric *)self metrics];
  v562 = [v561 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_work"];
  v563 = +[RTPlaceDataMetrics binArrayPercentage];
  v564 = +[RTMetric binForNumber:v562 bins:v563];
  v565 = [(RTMetric *)self metrics];
  [v565 setObject:v564 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_work_bucketed"];

  v566 = [(RTMetric *)self metrics];
  v567 = [v566 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_others"];
  v568 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v569 = +[RTMetric binForNumber:v567 bins:v568];
  v570 = [(RTMetric *)self metrics];
  [v570 setObject:v569 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"];

  v571 = [(RTMetric *)self metrics];
  v572 = [v571 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_others"];
  v573 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v574 = +[RTMetric binForNumber:v572 bins:v573];
  v575 = [(RTMetric *)self metrics];
  [v575 setObject:v574 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"];

  v576 = [(RTMetric *)self metrics];
  v577 = [v576 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_others"];
  v578 = +[RTPlaceDataMetrics binArrayPercentage];
  v579 = +[RTMetric binForNumber:v577 bins:v578];
  v580 = [(RTMetric *)self metrics];
  [v580 setObject:v579 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_others_bucketed"];

  v581 = [(RTMetric *)self metrics];
  v582 = [v581 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_home"];
  v583 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v584 = +[RTMetric binForNumber:v582 bins:v583];
  v585 = [(RTMetric *)self metrics];
  [v585 setObject:v584 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v586 = [(RTMetric *)self metrics];
  v587 = [v586 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_home"];
  v588 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v589 = +[RTMetric binForNumber:v587 bins:v588];
  v590 = [(RTMetric *)self metrics];
  [v590 setObject:v589 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v591 = [(RTMetric *)self metrics];
  v592 = [v591 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_home"];
  v593 = +[RTPlaceDataMetrics binArrayPercentage];
  v594 = +[RTMetric binForNumber:v592 bins:v593];
  v595 = [(RTMetric *)self metrics];
  [v595 setObject:v594 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_home_bucketed"];

  v596 = [(RTMetric *)self metrics];
  v597 = [v596 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_work"];
  v598 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v599 = +[RTMetric binForNumber:v597 bins:v598];
  v600 = [(RTMetric *)self metrics];
  [v600 setObject:v599 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v601 = [(RTMetric *)self metrics];
  v602 = [v601 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_work"];
  v603 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v604 = +[RTMetric binForNumber:v602 bins:v603];
  v605 = [(RTMetric *)self metrics];
  [v605 setObject:v604 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v606 = [(RTMetric *)self metrics];
  v607 = [v606 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_work"];
  v608 = +[RTPlaceDataMetrics binArrayPercentage];
  v609 = +[RTMetric binForNumber:v607 bins:v608];
  v610 = [(RTMetric *)self metrics];
  [v610 setObject:v609 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_work_bucketed"];

  v611 = [(RTMetric *)self metrics];
  v612 = [v611 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_others"];
  v613 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v614 = +[RTMetric binForNumber:v612 bins:v613];
  v615 = [(RTMetric *)self metrics];
  [v615 setObject:v614 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"];

  v616 = [(RTMetric *)self metrics];
  v617 = [v616 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_others"];
  v618 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v619 = +[RTMetric binForNumber:v617 bins:v618];
  v620 = [(RTMetric *)self metrics];
  [v620 setObject:v619 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"];

  v621 = [(RTMetric *)self metrics];
  v622 = [v621 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_others"];
  v623 = +[RTPlaceDataMetrics binArrayPercentage];
  v624 = +[RTMetric binForNumber:v622 bins:v623];
  v625 = [(RTMetric *)self metrics];
  [v625 setObject:v624 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_others_bucketed"];

  v626 = [(RTMetric *)self metrics];
  v627 = [v626 objectForKeyedSubscript:@"intervalToCalculateStats"];
  v628 = +[RTMetric binForNumber:v627 bins:v961];
  v629 = [(RTMetric *)self metrics];
  [v629 setObject:v628 forKeyedSubscript:@"intervalToCalculateStats_bucketed"];

  v630 = [(RTMetric *)self metrics];
  v631 = [v630 objectForKeyedSubscript:@"numPlacesAfterWeeksWithNonZeroDwellTimePruning"];
  v632 = +[RTMetric binForNumber:v631 bins:v958];
  v633 = [(RTMetric *)self metrics];
  [v633 setObject:v632 forKeyedSubscript:@"numPlacesAfterWeeksWithNonZeroDwellTimePruning_bucketed"];

  v634 = [(RTMetric *)self metrics];
  v635 = [v634 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_home"];
  v636 = +[RTMetric binForNumber:v635 bins:v959];
  v637 = [(RTMetric *)self metrics];
  [v637 setObject:v636 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_home_bucketed"];

  v638 = [(RTMetric *)self metrics];
  v639 = [v638 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_work"];
  v640 = +[RTMetric binForNumber:v639 bins:v959];
  v641 = [(RTMetric *)self metrics];
  [v641 setObject:v640 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_work_bucketed"];

  v642 = [(RTMetric *)self metrics];
  v643 = [v642 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_home"];
  v644 = +[RTMetric binForNumber:v643 bins:v958];
  v645 = [(RTMetric *)self metrics];
  [v645 setObject:v644 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_home_bucketed"];

  v646 = [(RTMetric *)self metrics];
  v647 = [v646 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_work"];
  v648 = +[RTMetric binForNumber:v647 bins:v958];
  v649 = [(RTMetric *)self metrics];
  [v649 setObject:v648 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_work_bucketed"];

  v650 = [(RTMetric *)self metrics];
  v651 = [v650 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_home"];
  v652 = +[RTMetric binForNumber:v651 bins:v958];
  v653 = [(RTMetric *)self metrics];
  [v653 setObject:v652 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_home_bucketed"];

  v654 = [(RTMetric *)self metrics];
  v655 = [v654 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_work"];
  v656 = +[RTMetric binForNumber:v655 bins:v958];
  v657 = [(RTMetric *)self metrics];
  [v657 setObject:v656 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_work_bucketed"];

  v658 = [(RTMetric *)self metrics];
  v659 = [v658 objectForKeyedSubscript:@"topMedianDwellTime_home"];
  v660 = +[RTMetric binForNumber:v659 bins:v959];
  v661 = [(RTMetric *)self metrics];
  [v661 setObject:v660 forKeyedSubscript:@"topMedianDwellTime_home_bucketed"];

  v662 = [(RTMetric *)self metrics];
  v663 = [v662 objectForKeyedSubscript:@"topMedianDwellTime_work"];
  v664 = +[RTMetric binForNumber:v663 bins:v959];
  v665 = [(RTMetric *)self metrics];
  [v665 setObject:v664 forKeyedSubscript:@"topMedianDwellTime_work_bucketed"];

  v666 = [(RTMetric *)self metrics];
  v667 = [v666 objectForKeyedSubscript:@"weeksWithNonZeroDwellTime_home"];
  v668 = +[RTMetric binForNumber:v667 bins:v958];
  v669 = [(RTMetric *)self metrics];
  [v669 setObject:v668 forKeyedSubscript:@"weeksWithNonZeroDwellTime_home_bucketed"];

  v670 = [(RTMetric *)self metrics];
  v671 = [v670 objectForKeyedSubscript:@"weeksWithNonZeroDwellTime_work"];
  v672 = +[RTMetric binForNumber:v671 bins:v958];
  v673 = [(RTMetric *)self metrics];
  [v673 setObject:v672 forKeyedSubscript:@"weeksWithNonZeroDwellTime_work_bucketed"];

  v674 = [(RTMetric *)self metrics];
  v675 = [v674 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"];
  v676 = +[RTMetric binForNumber:v675 bins:v959];
  v677 = [(RTMetric *)self metrics];
  [v677 setObject:v676 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns_bucketed"];

  v678 = [(RTMetric *)self metrics];
  v679 = [v678 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"];
  v680 = +[RTMetric binForNumber:v679 bins:v959];
  v681 = [(RTMetric *)self metrics];
  [v681 setObject:v680 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns_bucketed"];

  v682 = [(RTMetric *)self metrics];
  v683 = [v682 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"];
  v684 = +[RTMetric binForNumber:v683 bins:v958];
  v685 = [(RTMetric *)self metrics];
  [v685 setObject:v684 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns_bucketed"];

  v686 = [(RTMetric *)self metrics];
  v687 = [v686 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"];
  v688 = +[RTMetric binForNumber:v687 bins:v958];
  v689 = [(RTMetric *)self metrics];
  [v689 setObject:v688 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns_bucketed"];

  v690 = [(RTMetric *)self metrics];
  v691 = [v690 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"];
  v692 = +[RTMetric binForNumber:v691 bins:v958];
  v693 = [(RTMetric *)self metrics];
  [v693 setObject:v692 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns_bucketed"];

  v694 = [(RTMetric *)self metrics];
  v695 = [v694 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"];
  v696 = +[RTMetric binForNumber:v695 bins:v958];
  v697 = [(RTMetric *)self metrics];
  [v697 setObject:v696 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns_bucketed"];

  v698 = [(RTMetric *)self metrics];
  v699 = [v698 objectForKeyedSubscript:@"numPlacesAfterDailyPatternsPruning"];
  v700 = +[RTMetric binForNumber:v699 bins:v958];
  v701 = [(RTMetric *)self metrics];
  [v701 setObject:v700 forKeyedSubscript:@"numPlacesAfterDailyPatternsPruning_bucketed"];

  v702 = [(RTMetric *)self metrics];
  v703 = [v702 objectForKeyedSubscript:@"homeRankDailyPatterns"];
  v704 = +[RTMetric binForNumber:v703 bins:v958];
  v705 = [(RTMetric *)self metrics];
  [v705 setObject:v704 forKeyedSubscript:@"homeRankDailyPatterns_bucketed"];

  v706 = [(RTMetric *)self metrics];
  v707 = [v706 objectForKeyedSubscript:@"workRankDailyPatterns"];
  v708 = +[RTMetric binForNumber:v707 bins:v958];
  v709 = [(RTMetric *)self metrics];
  [v709 setObject:v708 forKeyedSubscript:@"workRankDailyPatterns_bucketed"];

  v710 = [(RTMetric *)self metrics];
  v711 = [v710 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"];
  v712 = +[RTMetric binForNumber:v711 bins:v958];
  v713 = [(RTMetric *)self metrics];
  [v713 setObject:v712 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime_bucketed"];

  v714 = [(RTMetric *)self metrics];
  v715 = [v714 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"];
  v716 = +[RTMetric binForNumber:v715 bins:v958];
  v717 = [(RTMetric *)self metrics];
  [v717 setObject:v716 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime_bucketed"];

  v718 = [(RTMetric *)self metrics];
  v719 = [v718 objectForKeyedSubscript:@"topMedianDwellTime_1stPlaceDwellTime"];
  v720 = +[RTMetric binForNumber:v719 bins:v959];
  v721 = [(RTMetric *)self metrics];
  [v721 setObject:v720 forKeyedSubscript:@"topMedianDwellTime_1stPlaceDwellTime_bucketed"];

  v722 = [(RTMetric *)self metrics];
  v723 = [v722 objectForKeyedSubscript:@"homeRankDwellTime"];
  v724 = +[RTMetric binForNumber:v723 bins:v958];
  v725 = [(RTMetric *)self metrics];
  [v725 setObject:v724 forKeyedSubscript:@"homeRankDwellTime_bucketed"];

  v726 = [(RTMetric *)self metrics];
  v727 = [v726 objectForKeyedSubscript:@"workRankDwellTime"];
  v728 = +[RTMetric binForNumber:v727 bins:v958];
  v729 = [(RTMetric *)self metrics];
  [v729 setObject:v728 forKeyedSubscript:@"workRankDwellTime_bucketed"];

  v730 = [(RTMetric *)self metrics];
  v731 = [v730 objectForKeyedSubscript:@"SD_visit_time_home"];
  v732 = +[RTMetric binForNumber:v731 bins:v3];
  v733 = [(RTMetric *)self metrics];
  [v733 setObject:v732 forKeyedSubscript:@"SD_visit_time_home_bucketed"];

  v734 = [(RTMetric *)self metrics];
  v735 = [v734 objectForKeyedSubscript:@"SD_visit_time_work"];
  v736 = +[RTMetric binForNumber:v735 bins:v3];
  v737 = [(RTMetric *)self metrics];
  [v737 setObject:v736 forKeyedSubscript:@"SD_visit_time_work_bucketed"];

  v738 = [(RTMetric *)self metrics];
  v739 = [v738 objectForKeyedSubscript:@"SD_visit_time_others"];
  v740 = +[RTMetric binForNumber:v739 bins:v3];
  v741 = [(RTMetric *)self metrics];
  [v741 setObject:v740 forKeyedSubscript:@"SD_visit_time_others_bucketed"];

  v742 = [(RTMetric *)self metrics];
  v743 = [v742 objectForKeyedSubscript:@"SD_daily_visits_weekdays_home"];
  v744 = +[RTMetric binForNumber:v743 bins:v958];
  v745 = [(RTMetric *)self metrics];
  [v745 setObject:v744 forKeyedSubscript:@"SD_daily_visits_weekdays_home_bucketed"];

  v746 = [(RTMetric *)self metrics];
  v747 = [v746 objectForKeyedSubscript:@"SD_daily_visits_weekdays_work"];
  v748 = +[RTMetric binForNumber:v747 bins:v958];
  v749 = [(RTMetric *)self metrics];
  [v749 setObject:v748 forKeyedSubscript:@"SD_daily_visits_weekdays_work_bucketed"];

  v750 = [(RTMetric *)self metrics];
  v751 = [v750 objectForKeyedSubscript:@"SD_daily_visits_weekdays_others"];
  v752 = +[RTMetric binForNumber:v751 bins:v958];
  v753 = [(RTMetric *)self metrics];
  [v753 setObject:v752 forKeyedSubscript:@"SD_daily_visits_weekdays_others_bucketed"];

  v754 = [(RTMetric *)self metrics];
  v755 = [v754 objectForKeyedSubscript:@"SD_daily_visits_weekend_home"];
  v756 = +[RTMetric binForNumber:v755 bins:v958];
  v757 = [(RTMetric *)self metrics];
  [v757 setObject:v756 forKeyedSubscript:@"SD_daily_visits_weekend_home_bucketed"];

  v758 = [(RTMetric *)self metrics];
  v759 = [v758 objectForKeyedSubscript:@"SD_daily_visits_weekend_work"];
  v760 = +[RTMetric binForNumber:v759 bins:v958];
  v761 = [(RTMetric *)self metrics];
  [v761 setObject:v760 forKeyedSubscript:@"SD_daily_visits_weekend_work_bucketed"];

  v762 = [(RTMetric *)self metrics];
  v763 = [v762 objectForKeyedSubscript:@"SD_daily_visits_weekend_others"];
  v764 = +[RTMetric binForNumber:v763 bins:v958];
  v765 = [(RTMetric *)self metrics];
  [v765 setObject:v764 forKeyedSubscript:@"SD_daily_visits_weekend_others_bucketed"];

  v766 = [(RTMetric *)self metrics];
  v767 = [v766 objectForKeyedSubscript:@"SD_visit_duration_weekdays_home"];
  v768 = +[RTMetric binForNumber:v767 bins:v4];
  v769 = [(RTMetric *)self metrics];
  [v769 setObject:v768 forKeyedSubscript:@"SD_visit_duration_weekdays_home_bucketed"];

  v770 = [(RTMetric *)self metrics];
  v771 = [v770 objectForKeyedSubscript:@"SD_visit_duration_weekdays_work"];
  v772 = +[RTMetric binForNumber:v771 bins:v4];
  v773 = [(RTMetric *)self metrics];
  [v773 setObject:v772 forKeyedSubscript:@"SD_visit_duration_weekdays_work_bucketed"];

  v774 = [(RTMetric *)self metrics];
  v775 = [v774 objectForKeyedSubscript:@"SD_visit_duration_weekdays_others"];
  v776 = +[RTMetric binForNumber:v775 bins:v4];
  v777 = [(RTMetric *)self metrics];
  [v777 setObject:v776 forKeyedSubscript:@"SD_visit_duration_weekdays_others_bucketed"];

  v778 = [(RTMetric *)self metrics];
  v779 = [v778 objectForKeyedSubscript:@"SD_visit_duration_weekend_home"];
  v780 = +[RTMetric binForNumber:v779 bins:v4];
  v781 = [(RTMetric *)self metrics];
  [v781 setObject:v780 forKeyedSubscript:@"SD_visit_duration_weekend_home_bucketed"];

  v782 = [(RTMetric *)self metrics];
  v783 = [v782 objectForKeyedSubscript:@"SD_visit_duration_weekend_work"];
  v784 = +[RTMetric binForNumber:v783 bins:v4];
  v785 = [(RTMetric *)self metrics];
  [v785 setObject:v784 forKeyedSubscript:@"SD_visit_duration_weekend_work_bucketed"];

  v786 = [(RTMetric *)self metrics];
  v787 = [v786 objectForKeyedSubscript:@"SD_visit_duration_weekend_others"];
  v788 = +[RTMetric binForNumber:v787 bins:v4];
  v789 = [(RTMetric *)self metrics];
  [v789 setObject:v788 forKeyedSubscript:@"SD_visit_duration_weekend_others_bucketed"];

  v790 = [(RTMetric *)self metrics];
  v791 = [v790 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_home"];
  v792 = +[RTMetric binForNumber:v791 bins:v4];
  v793 = [(RTMetric *)self metrics];
  [v793 setObject:v792 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_home_bucketed"];

  v794 = [(RTMetric *)self metrics];
  v795 = [v794 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_work"];
  v796 = +[RTMetric binForNumber:v795 bins:v4];
  v797 = [(RTMetric *)self metrics];
  [v797 setObject:v796 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_work_bucketed"];

  v798 = [(RTMetric *)self metrics];
  v799 = [v798 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_others"];
  v800 = +[RTMetric binForNumber:v799 bins:v4];
  v801 = [(RTMetric *)self metrics];
  [v801 setObject:v800 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_others_bucketed"];

  v802 = [(RTMetric *)self metrics];
  v803 = [v802 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekend_home"];
  v804 = +[RTMetric binForNumber:v803 bins:v4];
  v805 = [(RTMetric *)self metrics];
  [v805 setObject:v804 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_home_bucketed"];

  v806 = [(RTMetric *)self metrics];
  v807 = [v806 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekend_work"];
  v808 = +[RTMetric binForNumber:v807 bins:v4];
  v809 = [(RTMetric *)self metrics];
  [v809 setObject:v808 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_work_bucketed"];

  v810 = [(RTMetric *)self metrics];
  v811 = [v810 objectForKeyedSubscript:@"SD_daily_total_visit_duration_weekend_others"];
  v812 = +[RTMetric binForNumber:v811 bins:v4];
  v813 = [(RTMetric *)self metrics];
  [v813 setObject:v812 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_others_bucketed"];

  v814 = [(RTMetric *)self metrics];
  v815 = [v814 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_home"];
  v816 = +[RTMetric binForNumber:v815 bins:v4];
  v817 = [(RTMetric *)self metrics];
  [v817 setObject:v816 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_home_bucketed"];

  v818 = [(RTMetric *)self metrics];
  v819 = [v818 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_work"];
  v820 = +[RTMetric binForNumber:v819 bins:v4];
  v821 = [(RTMetric *)self metrics];
  [v821 setObject:v820 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_work_bucketed"];

  v822 = [(RTMetric *)self metrics];
  v823 = [v822 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_others"];
  v824 = +[RTMetric binForNumber:v823 bins:v4];
  v825 = [(RTMetric *)self metrics];
  [v825 setObject:v824 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_others_bucketed"];

  v826 = [(RTMetric *)self metrics];
  v827 = [v826 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_home"];
  v828 = +[RTMetric binForNumber:v827 bins:v4];
  v829 = [(RTMetric *)self metrics];
  [v829 setObject:v828 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_home_bucketed"];

  v830 = [(RTMetric *)self metrics];
  v831 = [v830 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_work"];
  v832 = +[RTMetric binForNumber:v831 bins:v4];
  v833 = [(RTMetric *)self metrics];
  [v833 setObject:v832 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_work_bucketed"];

  v834 = [(RTMetric *)self metrics];
  v835 = [v834 objectForKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_others"];
  v836 = +[RTMetric binForNumber:v835 bins:v4];
  v837 = [(RTMetric *)self metrics];
  [v837 setObject:v836 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_others_bucketed"];

  v838 = [(RTMetric *)self metrics];
  v839 = [v838 objectForKeyedSubscript:@"SD_daily_total_charging_duration_home"];
  v840 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v841 = +[RTMetric binForNumber:v839 bins:v840];
  v842 = [(RTMetric *)self metrics];
  [v842 setObject:v841 forKeyedSubscript:@"SD_daily_total_charging_duration_home_bucketed"];

  v843 = [(RTMetric *)self metrics];
  v844 = [v843 objectForKeyedSubscript:@"SD_daily_total_charging_duration_work"];
  v845 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v846 = +[RTMetric binForNumber:v844 bins:v845];
  v847 = [(RTMetric *)self metrics];
  [v847 setObject:v846 forKeyedSubscript:@"SD_daily_total_charging_duration_work_bucketed"];

  v848 = [(RTMetric *)self metrics];
  v849 = [v848 objectForKeyedSubscript:@"SD_daily_total_charging_duration_others"];
  v850 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v851 = +[RTMetric binForNumber:v849 bins:v850];
  v852 = [(RTMetric *)self metrics];
  [v852 setObject:v851 forKeyedSubscript:@"SD_daily_total_charging_duration_others_bucketed"];

  v853 = [(RTMetric *)self metrics];
  v854 = [v853 objectForKeyedSubscript:@"SD_daily_longest_charging_duration_home"];
  v855 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v856 = +[RTMetric binForNumber:v854 bins:v855];
  v857 = [(RTMetric *)self metrics];
  [v857 setObject:v856 forKeyedSubscript:@"SD_daily_longest_charging_duration_home_bucketed"];

  v858 = [(RTMetric *)self metrics];
  v859 = [v858 objectForKeyedSubscript:@"SD_daily_longest_charging_duration_work"];
  v860 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v861 = +[RTMetric binForNumber:v859 bins:v860];
  v862 = [(RTMetric *)self metrics];
  [v862 setObject:v861 forKeyedSubscript:@"SD_daily_longest_charging_duration_work_bucketed"];

  v863 = [(RTMetric *)self metrics];
  v864 = [v863 objectForKeyedSubscript:@"SD_daily_longest_charging_duration_others"];
  v865 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v866 = +[RTMetric binForNumber:v864 bins:v865];
  v867 = [(RTMetric *)self metrics];
  [v867 setObject:v866 forKeyedSubscript:@"SD_daily_longest_charging_duration_others_bucketed"];

  v868 = [(RTMetric *)self metrics];
  v869 = [v868 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration_home"];
  v870 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v871 = +[RTMetric binForNumber:v869 bins:v870];
  v872 = [(RTMetric *)self metrics];
  [v872 setObject:v871 forKeyedSubscript:@"SD_daily_total_static_motion_duration_home_bucketed"];

  v873 = [(RTMetric *)self metrics];
  v874 = [v873 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration_work"];
  v875 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v876 = +[RTMetric binForNumber:v874 bins:v875];
  v877 = [(RTMetric *)self metrics];
  [v877 setObject:v876 forKeyedSubscript:@"SD_daily_total_static_motion_duration_work_bucketed"];

  v878 = [(RTMetric *)self metrics];
  v879 = [v878 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration_others"];
  v880 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v881 = +[RTMetric binForNumber:v879 bins:v880];
  v882 = [(RTMetric *)self metrics];
  [v882 setObject:v881 forKeyedSubscript:@"SD_daily_total_static_motion_duration_others_bucketed"];

  v883 = [(RTMetric *)self metrics];
  v884 = [v883 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration_home"];
  v885 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v886 = +[RTMetric binForNumber:v884 bins:v885];
  v887 = [(RTMetric *)self metrics];
  [v887 setObject:v886 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_home_bucketed"];

  v888 = [(RTMetric *)self metrics];
  v889 = [v888 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration_work"];
  v890 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v891 = +[RTMetric binForNumber:v889 bins:v890];
  v892 = [(RTMetric *)self metrics];
  [v892 setObject:v891 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_work_bucketed"];

  v893 = [(RTMetric *)self metrics];
  v894 = [v893 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration_others"];
  v895 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v896 = +[RTMetric binForNumber:v894 bins:v895];
  v897 = [(RTMetric *)self metrics];
  [v897 setObject:v896 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_others_bucketed"];

  v898 = [(RTMetric *)self metrics];
  v899 = [v898 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration_home"];
  v900 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v901 = +[RTMetric binForNumber:v899 bins:v900];
  v902 = [(RTMetric *)self metrics];
  [v902 setObject:v901 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_home_bucketed"];

  v903 = [(RTMetric *)self metrics];
  v904 = [v903 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration_work"];
  v905 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v906 = +[RTMetric binForNumber:v904 bins:v905];
  v907 = [(RTMetric *)self metrics];
  [v907 setObject:v906 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_work_bucketed"];

  v908 = [(RTMetric *)self metrics];
  v909 = [v908 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration_others"];
  v910 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v911 = +[RTMetric binForNumber:v909 bins:v910];
  v912 = [(RTMetric *)self metrics];
  [v912 setObject:v911 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_others_bucketed"];

  v913 = [(RTMetric *)self metrics];
  v914 = [v913 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration_home"];
  v915 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v916 = +[RTMetric binForNumber:v914 bins:v915];
  v917 = [(RTMetric *)self metrics];
  [v917 setObject:v916 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_home_bucketed"];

  v918 = [(RTMetric *)self metrics];
  v919 = [v918 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration_work"];
  v920 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v921 = +[RTMetric binForNumber:v919 bins:v920];
  v922 = [(RTMetric *)self metrics];
  [v922 setObject:v921 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_work_bucketed"];

  v923 = [(RTMetric *)self metrics];
  v924 = [v923 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration_others"];
  v925 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v926 = +[RTMetric binForNumber:v924 bins:v925];
  v927 = [(RTMetric *)self metrics];
  [v927 setObject:v926 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_others_bucketed"];

  v928 = [(RTMetric *)self metrics];
  v929 = [v928 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_home"];
  v930 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v931 = +[RTMetric binForNumber:v929 bins:v930];
  v932 = [(RTMetric *)self metrics];
  [v932 setObject:v931 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v933 = [(RTMetric *)self metrics];
  v934 = [v933 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_work"];
  v935 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v936 = +[RTMetric binForNumber:v934 bins:v935];
  v937 = [(RTMetric *)self metrics];
  [v937 setObject:v936 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v938 = [(RTMetric *)self metrics];
  v939 = [v938 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_others"];
  v940 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v941 = +[RTMetric binForNumber:v939 bins:v940];
  v942 = [(RTMetric *)self metrics];
  [v942 setObject:v941 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_others_bucketed"];

  v943 = [(RTMetric *)self metrics];
  v944 = [v943 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_home"];
  v945 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v946 = +[RTMetric binForNumber:v944 bins:v945];
  v947 = [(RTMetric *)self metrics];
  [v947 setObject:v946 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_home_bucketed"];

  v948 = [(RTMetric *)self metrics];
  v949 = [v948 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_work"];
  v950 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v951 = +[RTMetric binForNumber:v949 bins:v950];
  v952 = [(RTMetric *)self metrics];
  [v952 setObject:v951 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_work_bucketed"];

  v953 = [(RTMetric *)self metrics];
  v954 = [v953 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_others"];
  v955 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
  v956 = +[RTMetric binForNumber:v954 bins:v955];
  v957 = [(RTMetric *)self metrics];
  [v957 setObject:v956 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_others_bucketed"];
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(RTPlaceDataMetrics *)self setDerivedMetrics];
  v6.receiver = self;
  v6.super_class = (Class)RTPlaceDataMetrics;
  return [(RTMetric *)&v6 submitMetricsWithError:a3];
}

+ (id)medianOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      v4 = NSNumber;
      uint64_t v5 = [v3 objectAtIndexedSubscript:0];
      [v5 doubleValue];
      objc_super v6 = [v4 numberWithDouble:];
    }
    else
    {
      uint64_t v5 = [v3 sortedArrayUsingSelector:sel_compare_];
      char v7 = [v3 count];
      unint64_t v8 = (unint64_t)[v5 count] >> 1;
      uint64_t v9 = NSNumber;
      if (v7)
      {
        uint64_t v10 = [v5 objectAtIndex:v8];
        [v10 doubleValue];
        objc_super v6 = [v9 numberWithDouble:];
      }
      else
      {
        uint64_t v10 = [v5 objectAtIndex:v8 - 1];
        [v10 doubleValue];
        double v12 = v11;
        uint64_t v13 = [v5 objectAtIndex:v8];
        [v13 doubleValue];
        objc_super v6 = [v9 numberWithDouble:(v12 + v14) * 0.5];
      }
    }
  }
  else
  {
    objc_super v6 = &unk_1F3453718;
  }

  return v6;
}

+ (id)meanOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      v4 = NSNumber;
      uint64_t v5 = [v3 objectAtIndexedSubscript:0];
      [v5 doubleValue];
      objc_super v6 = [v4 numberWithDouble:];
    }
    else
    {
      double v7 = 0.0;
      if ([v3 count])
      {
        unint64_t v8 = 1;
        do
        {
          if ([v3 count] >= v8)
          {
            uint64_t v9 = [v3 objectAtIndexedSubscript:v8 - 1];
            [v9 doubleValue];
            double v7 = v7 + (v10 - v7) / (double)(int)v8;
          }
          else
          {
            double v7 = v7 - v7 / (double)(int)v8;
          }
        }
        while ([v3 count] > v8++);
      }
      objc_super v6 = [NSNumber numberWithDouble:v7];
    }
  }
  else
  {
    objc_super v6 = &unk_1F3453718;
  }

  return v6;
}

+ (id)standardDeviationOf:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      v4 = &unk_1F34537E8;
    }
    else
    {
      uint64_t v5 = +[RTPlaceDataMetrics meanOf:v3];
      [v5 doubleValue];
      double v7 = v6;

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v3;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        double v12 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * i) doubleValue:v16];
            double v12 = v12 + (v14 - v7) * (v14 - v7);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
      else
      {
        double v12 = 0.0;
      }

      v4 = [NSNumber numberWithDouble:sqrt(v12 / (double)(unint64_t)[v8 count])];
    }
  }
  else
  {
    v4 = &unk_1F3453718;
  }

  return v4;
}

- (int64_t)daysBetweenDate:(id)a3 andDate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentCalendar];
  id v15 = 0;
  [v8 rangeOfUnit:16 startDate:&v15 interval:0 forDate:v7];

  id v9 = v15;
  id v14 = 0;
  [v8 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v6];

  id v10 = v14;
  uint64_t v11 = [v8 components:16 fromDate:v9 toDate:v10 options:0];
  int64_t v12 = [v11 day] + 1;

  return v12;
}

- (id)removeTimeFromDateTime:(id)a3 withCalendar:(id)a4
{
  id v5 = a4;
  id v6 = [v5 components:1564 fromDate:a3];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9D8]) init];
  [v7 setWeekday:[v6 weekday]];
  [v7 setWeekdayOrdinal:[v6 weekdayOrdinal]];
  [v7 setDay:[v6 day]];
  [v7 setMonth:[v6 month]];
  [v7 setYear:[v6 year]];
  id v8 = [v5 dateFromComponents:v7];

  return v8;
}

- (int64_t)numberOfWeeksBetweenDatesBasedOnCalendar:(id)a3 startDateTime:(id)a4 endDateTime:(id)a5
{
  id v23 = 0;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 rangeOfUnit:16 startDate:&v23 interval:0 forDate:v8];
  id v10 = v23;
  id v22 = 0;
  [v9 rangeOfUnit:16 startDate:&v22 interval:0 forDate:v7];
  id v11 = v22;
  int64_t v12 = [v9 components:16 fromDate:v10 toDate:v11 options:0];
  uint64_t v13 = [v9 components:12800 fromDate:v8];

  id v14 = [v9 components:12800 fromDate:v7];

  uint64_t v15 = [v12 day];
  uint64_t v16 = [v9 maximumRangeOfUnit:512];
  unint64_t v18 = v17;

  uint64_t v19 = [v13 weekday];
  unint64_t v20 = (v15 - v16 + v18 + v19 - [v14 weekday] + 1) / v18;

  return v20;
}

- (int64_t)convertDateTime2SecondsBasedOnCalendar:(id)a3 dateTime:(id)a4
{
  v4 = [a3 components:224 fromDate:a4];
  uint64_t v5 = [v4 hour];
  uint64_t v6 = [v4 minute];
  int64_t v7 = 3600 * v5 + 60 * v6 + [v4 second];

  return v7;
}

- (id)findHomeWorkOthersIntervals
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_visitArray;
  uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v32)
  {
    uint64_t v4 = *(void *)v36;
    uint64_t v5 = &OBJC_IVAR___SMReceiverService__attemptedToLoadFromDisk;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v36 != v4) {
          objc_enumerationMutation(obj);
        }
        int64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v8 = [v7 location];
        id v9 = [v8 location];
        uint64_t v10 = *(uint64_t *)((char *)&self->super.super.isa + v5[133]);
        if (v10)
        {
          id v34 = 0;
          [v3 distanceFromLocation:v9 toLocation:v10 error:&v34];
          double v12 = v11;
          id v13 = v34;
        }
        else
        {
          id v13 = 0;
          double v12 = 1.79769313e308;
        }
        locationWork = self->_locationWork;
        if (locationWork)
        {
          id v33 = v13;
          [v3 distanceFromLocation:v9 toLocation:locationWork error:&v33];
          double v16 = v15;
          id v17 = v33;

          id v13 = v17;
          if (v17) {
            goto LABEL_23;
          }
        }
        else
        {
          double v16 = 1.79769313e308;
          if (v13) {
            goto LABEL_23;
          }
        }
        unint64_t v18 = v3;
        id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
        unint64_t v20 = [v7 entryDate];
        uint64_t v21 = [v7 exitDate];
        id v22 = (void *)[v19 initWithStartDate:v20 endDate:v21];

        double distanceThreshold = self->_distanceThreshold;
        if (v12 <= distanceThreshold)
        {
          [v29 addObject:v22];
          double distanceThreshold = self->_distanceThreshold;
        }
        if (v16 <= distanceThreshold)
        {
          [v28 addObject:v22];
          double distanceThreshold = self->_distanceThreshold;
        }
        BOOL v24 = v12 <= distanceThreshold || v16 <= distanceThreshold;
        id v3 = v18;
        uint64_t v4 = v30;
        if (!v24) {
          [v27 addObject:v22];
        }

        uint64_t v5 = &OBJC_IVAR___SMReceiverService__attemptedToLoadFromDisk;
LABEL_23:
      }
      uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v32);
  }

  [v26 setObject:v29 forKeyedSubscript:@"Home"];
  [v26 setObject:v28 forKeyedSubscript:@"Work"];
  [v26 setObject:v27 forKeyedSubscript:@"Others"];

  return v26;
}

- (void)calculateAndSetVisitMetrics
{
  v976[16] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v770 = [(RTPlaceDataMetrics *)self removeTimeFromDateTime:self->_startDateTime withCalendar:v3];
  v769 = [(RTPlaceDataMetrics *)self removeTimeFromDateTime:self->_endDateTime withCalendar:v3];
  v835 = self;
  v850 = (void *)v3;
  uint64_t v4 = [(RTPlaceDataMetrics *)self numberOfWeeksBetweenDatesBasedOnCalendar:v3 startDateTime:self->_startDateTime endDateTime:self->_endDateTime];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v743 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v742 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v7 = 0x1E4F1C000uLL;
  id v768 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v767 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v851 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v851 setDateFormat:@"yyyy-MM-dd"];
  id v832 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v840 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v839 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v838 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v763 = (void *)v4;
  if (v4 >= 1)
  {
    do
    {
      [v5 addObject:&unk_1F3450330];
      [v6 addObject:&unk_1F3450330];
      --v4;
    }
    while (v4);
  }
  v837 = v9;
  v834 = v8;
  v744 = v6;
  v745 = v5;
  uint64_t v10 = objc_opt_new();
  v771 = [MEMORY[0x1E4F1CA48] array];
  long long v943 = 0u;
  long long v944 = 0u;
  long long v945 = 0u;
  long long v946 = 0u;
  obuint64_t j = v835->_locationsOfOthers;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v943 objects:v976 count:16];
  v833 = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    id v836 = 0;
    uint64_t v13 = *(void *)v944;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v944 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v943 + 1) + 8 * i);
        locationHome = v835->_locationHome;
        id v942 = v836;
        [v10 distanceFromLocation:v15 toLocation:locationHome error:&v942];
        double v18 = v17;
        id v19 = v942;

        if (v18 <= v835->_distanceThreshold)
        {
          id v836 = v19;
        }
        else
        {
          locationWoruint64_t k = v835->_locationWork;
          id v941 = v19;
          [v10 distanceFromLocation:v15 toLocation:locationWork error:&v941];
          double v22 = v21;
          id v836 = v941;

          if (v22 > v835->_distanceThreshold) {
            [v771 addObject:v15];
          }
        }
        unint64_t v7 = 0x1E4F1C000;
        uint64_t v10 = v833;
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v943 objects:v976 count:16];
    }
    while (v12);
  }
  else
  {
    id v836 = 0;
  }

  unint64_t v23 = 0x1E4F1C000uLL;
  BOOL v24 = [MEMORY[0x1E4F1CA48] array];
  if ([v771 count])
  {
    unint64_t v25 = 0;
    do
    {
      id v26 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v27 = objc_alloc_init(*(Class *)(v23 + 2632));
      id v28 = objc_alloc_init(*(Class *)(v7 + 2688));
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v32 = [v26 initWithObjectsAndKeys:&unk_1F3450330, @"numberOthers", v27, @"othersVisitTimeArray", v28, @"othersVisitDateSet", v29, @"dictNumDailyVisitsOthers", v30, @"dictVisitDurationWeekendOthers", v31, @"dictVisitDurationWeekdaysOthers", &unk_1F34537E8, @"sumDistanceOtherFromOther", 0];
      [v24 addObject:v32];

      unint64_t v7 = 0x1E4F1C000;
      unint64_t v23 = 0x1E4F1C000;

      ++v25;
    }
    while ([v771 count] > v25);
  }
  id obja = v24;
  id v772 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  p_isa = (id *)&v835->super.super.isa;
  if (![(NSArray *)v835->_visitArray count])
  {
    long long v37 = (void *)v3;
    goto LABEL_92;
  }
  unint64_t v34 = 0;
  int v755 = 0;
  int v759 = 0;
  double v35 = 0.0;
  double v36 = 0.0;
  long long v37 = (void *)v3;
  do
  {
    long long v38 = v24;
    context = (void *)MEMORY[0x1E016D870]();
    long long v39 = [p_isa[4] objectAtIndex:v34];
    uint64_t v40 = [v39 entryDate];
    v822 = v39;
    long long v41 = [v39 exitDate];
    [p_isa removeTimeFromDateTime:v40 withCalendar:v37];
    v43 = long long v42 = p_isa;
    v829 = [v42 removeTimeFromDateTime:v41 withCalendar:v37];
    int v44 = [v37 isDateInWeekend:v40];
    v807 = v41;
    [v41 timeIntervalSinceDate:v40];
    double v46 = v45;
    id v841 = (id)v43;
    uint64_t v47 = v43;
    p_isa = v42;
    v819 = [v851 stringFromDate:v47];
    long long v48 = [v42[8] earlierDate:v40];
    v811 = (void *)v40;
    if (v48 != v42[8])
    {
      BOOL v24 = v38;
LABEL_23:

      goto LABEL_86;
    }
    int v793 = v44;
    unint64_t v798 = v34;
    long long v49 = v42;
    id v50 = [v42[9] laterDate:v40];
    id v51 = v49[9];

    if (v50 == v51)
    {
      uint64_t v783 = [v49 convertDateTime2SecondsBasedOnCalendar:v37 dateTime:v40];
      uint64_t v52 = [v49 numberOfWeeksBetweenDatesBasedOnCalendar:v37 startDateTime:v49[8] endDateTime:v40];
      uint64_t v53 = v52 - 1;
      BOOL v24 = v38;
      if (v52 < 1 || v52 > (uint64_t)v763)
      {
        v61 = v49;
        uint64_t v62 = [v37 maximumRangeOfUnit:512];
        uint64_t v64 = v63;
        long long v48 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          v65 = [v37 calendarIdentifier];
          int v968 = 134218754;
          uint64_t v969 = v53;
          __int16 v970 = 2048;
          uint64_t v971 = v62;
          __int16 v972 = 2048;
          uint64_t v973 = v64;
          __int16 v974 = 2112;
          v975 = v65;
          _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "weekIndx is out of range. weekIndx: %lu, minimum weekday: %lu , maximum weekday: %ld, calendar: %@", (uint8_t *)&v968, 0x2Au);
        }
        unint64_t v34 = v798;
        p_isa = v61;
        goto LABEL_23;
      }
      v54 = v49;
      if (v49[5])
      {
        uint64_t v55 = [v822 location];
        v56 = [v55 location];
        id v57 = v54[5];
        id v940 = v836;
        [v833 distanceFromLocation:v56 toLocation:v57 error:&v940];
        double v59 = v58;
        id v60 = v940;

        id v836 = v60;
      }
      else
      {
        double v59 = 1.79769313e308;
      }
      if (v54[6])
      {
        v66 = [v822 location];
        v67 = [v66 location];
        id v68 = v54[6];
        id v939 = v836;
        [v833 distanceFromLocation:v67 toLocation:v68 error:&v939];
        double v70 = v69;
        id v71 = v939;

        id v836 = v71;
      }
      else
      {
        double v70 = 1.79769313e308;
      }
      p_isa = v54;
      unint64_t v34 = v798;
      double distanceThreshold = *((double *)v54 + 3);
      if (v59 <= distanceThreshold)
      {
        v74 = (RTPlaceDataMetrics *)v54;
        uint64_t v825 = v53;
        [v745 setObject:&unk_1F3450408 atIndexedSubscript:v53];
        v75 = [NSNumber numberWithLong:v783];
        [v743 addObject:v75];

        [v772 setDay:0];
        v76 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];
        v77 = [v76 earlierDate:v829];

        if (v77 == v76)
        {
          do
          {
            [v768 addObject:v76];
            v79 = [v851 stringFromDate:v76];
            v80 = [v832 allKeys];
            int v81 = [v80 containsObject:v79];

            if (v81)
            {
              v82 = NSNumber;
              v83 = [v832 objectForKeyedSubscript:v79];
              v84 = [v82 numberWithInt:[v83 intValue] + 1];
              [v832 setObject:v84 forKeyedSubscript:v79];
            }
            else
            {
              [v832 setObject:&unk_1F3450408 forKeyedSubscript:v79];
            }
            [v772 setDay:[v772 day] + 1];
            v78 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];

            v85 = [v78 earlierDate:v829];

            v76 = v78;
          }
          while (v85 == v78);
        }
        else
        {
          v78 = v76;
        }
        if (v793)
        {
          v86 = [v837 allKeys];
          char v87 = [v86 containsObject:v819];

          if ((v87 & 1) == 0)
          {
            id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v837 setObject:v88 forKeyedSubscript:v819];
          }
          v89 = [v837 objectForKeyedSubscript:v819];
          v90 = [NSNumber numberWithDouble:v46];
          [v89 addObject:v90];
          v74 = v835;
        }
        else
        {
          v91 = [v840 allKeys];
          char v92 = [v91 containsObject:v819];

          if ((v92 & 1) == 0)
          {
            id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v840 setObject:v93 forKeyedSubscript:v819];
          }
          v89 = [v840 objectForKeyedSubscript:v819];
          v90 = [NSNumber numberWithDouble:v46];
          [v89 addObject:v90];
        }
        uint64_t v53 = v825;
        double v35 = v35 + v59;
        ++v755;

        double distanceThreshold = v74->_distanceThreshold;
        v73 = v744;
        unint64_t v34 = v798;
        p_isa = (id *)&v74->super.super.isa;
      }
      else
      {
        v73 = v744;
      }
      if (v70 <= distanceThreshold)
      {
        v94 = p_isa;
        [v73 setObject:&unk_1F3450408 atIndexedSubscript:v53];
        v95 = [NSNumber numberWithLong:v783];
        [v742 addObject:v95];

        [v772 setDay:0];
        v96 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];
        v97 = [v96 earlierDate:v829];

        if (v97 == v96)
        {
          do
          {
            [v767 addObject:v96];
            v99 = [v851 stringFromDate:v96];
            v100 = [v834 allKeys];
            int v101 = [v100 containsObject:v99];

            if (v101)
            {
              v102 = NSNumber;
              v103 = [v834 objectForKeyedSubscript:v99];
              v104 = [v102 numberWithInt:[v103 intValue] + 1];
              [v834 setObject:v104 forKeyedSubscript:v99];
            }
            else
            {
              [v834 setObject:&unk_1F3450408 forKeyedSubscript:v99];
            }
            [v772 setDay:[v772 day] + 1];
            v98 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];

            v105 = [v98 earlierDate:v829];

            v96 = v98;
          }
          while (v105 == v98);
        }
        else
        {
          v98 = v96;
        }
        if (v793) {
          v106 = v839;
        }
        else {
          v106 = v838;
        }
        v107 = [v106 allKeys];
        char v108 = [v107 containsObject:v819];

        if ((v108 & 1) == 0)
        {
          id v109 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v106 setObject:v109 forKeyedSubscript:v819];
        }
        v110 = [v106 objectForKeyedSubscript:v819];
        v111 = [NSNumber numberWithDouble:v46];
        [v110 addObject:v111];
        double v36 = v36 + v70;
        ++v759;

        p_isa = v94;
        double distanceThreshold = *((double *)v94 + 3);
        unint64_t v34 = v798;
      }
      if (v59 > distanceThreshold && v70 > distanceThreshold && [v771 count])
      {
        unint64_t v112 = 0;
        v113 = v771;
        do
        {
          v114 = v836;
          v115 = (void *)MEMORY[0x1E016D870]();
          uint64_t v116 = [v113 objectAtIndexedSubscript:v112];
          v117 = [v822 location];
          v118 = [v117 location];
          id v938 = v836;
          v803 = (void *)v116;
          [v833 distanceFromLocation:v118 toLocation:v116 error:&v938];
          double v120 = v119;
          id v836 = v938;

          p_isa = (id *)&v835->super.super.isa;
          if (v120 < v835->_distanceThreshold)
          {
            v790 = v115;
            v121 = NSNumber;
            v122 = [obja objectAtIndexedSubscript:v112];
            v123 = [v122 objectForKeyedSubscript:@"sumDistanceOthersFromOther"];
            [v123 doubleValue];
            v125 = [v121 numberWithDouble:v120 + v124];
            v126 = [obja objectAtIndexedSubscript:v112];
            [v126 setObject:v125 forKeyedSubscript:@"sumDistanceOtherFromOther"];

            v127 = NSNumber;
            v128 = [obja objectAtIndexedSubscript:v112];
            v129 = [v128 objectForKeyedSubscript:@"numberOthers"];
            v130 = [v127 numberWithInt:[v129 intValue] + 1];
            v131 = [obja objectAtIndexedSubscript:v112];
            [v131 setObject:v130 forKeyedSubscript:@"numberOthers"];

            v132 = [obja objectAtIndexedSubscript:v112];
            v133 = [v132 objectForKeyedSubscript:@"othersVisitTimeArray"];
            v134 = [NSNumber numberWithLong:v783];
            [v133 addObject:v134];

            [v772 setDay:0];
            v135 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];
            v136 = [v135 earlierDate:v829];

            unint64_t v826 = v112;
            if (v136 == v135)
            {
              do
              {
                v138 = [obja objectAtIndexedSubscript:v112];
                v139 = [v138 objectForKeyedSubscript:@"othersVisitDateSet"];
                [v139 addObject:v135];

                v140 = [v851 stringFromDate:v135];
                v141 = [obja objectAtIndexedSubscript:v112];
                v142 = [v141 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
                v143 = [v142 allKeys];
                int v144 = [v143 containsObject:v140];

                if (v144)
                {
                  v145 = NSNumber;
                  v146 = [obja objectAtIndexedSubscript:v112];
                  v147 = [v146 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
                  v148 = [v147 objectForKeyedSubscript:v140];
                  v149 = [v145 numberWithInt:[v148 intValue] + 1];
                  v150 = [obja objectAtIndexedSubscript:v112];
                  v151 = [v150 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
                  [v151 setObject:v149 forKeyedSubscript:v140];

                  long long v37 = v850;
                }
                else
                {
                  v146 = [obja objectAtIndexedSubscript:v112];
                  v147 = [v146 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
                  [v147 setObject:&unk_1F3450408 forKeyedSubscript:v140];
                }

                [v772 setDay:[v772 day] + 1];
                v137 = [v37 dateByAddingComponents:v772 toDate:v841 options:0];

                v152 = [v137 earlierDate:v829];

                v135 = v137;
                unint64_t v112 = v826;
              }
              while (v152 == v137);
            }
            else
            {
              v137 = v135;
            }
            v153 = [obja objectAtIndexedSubscript:v112];
            v154 = v153;
            if (v793) {
              v155 = @"dictVisitDurationWeekendOthers";
            }
            else {
              v155 = @"dictVisitDurationWeekdaysOthers";
            }
            v156 = [v153 objectForKeyedSubscript:v155];
            v157 = [v156 allKeys];
            char v158 = [v157 containsObject:v819];

            if ((v158 & 1) == 0)
            {
              id v159 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v160 = [obja objectAtIndexedSubscript:v826];
              v161 = [v160 objectForKeyedSubscript:v155];
              [v161 setObject:v159 forKeyedSubscript:v819];
            }
            v162 = [obja objectAtIndexedSubscript:v826];
            v163 = [v162 objectForKeyedSubscript:v155];
            v164 = [v163 objectForKeyedSubscript:v819];
            v165 = [NSNumber numberWithDouble:v46];
            [v164 addObject:v165];

            p_isa = (id *)&v835->super.super.isa;
            unint64_t v112 = v826;
            v115 = v790;
          }

          ++v112;
          v113 = v771;
        }
        while ([v771 count] > v112);
        BOOL v24 = obja;
        unint64_t v34 = v798;
      }
      else
      {
        BOOL v24 = obja;
      }
    }
    else
    {
      p_isa = v49;
      unint64_t v34 = v798;
      BOOL v24 = v38;
    }
LABEL_86:

    ++v34;
  }
  while ([p_isa[4] count] > v34);
  if (v755 > 0)
  {
    v166 = [NSNumber numberWithDouble:v35 / (double)v755];
    v167 = [p_isa metrics];
    [v167 setObject:v166 forKeyedSubscript:@"mean_distance_homeVisit_from_homeAddress"];

    p_isa = (id *)&v835->super.super.isa;
  }
  if (v759 >= 1)
  {
    v168 = [NSNumber numberWithDouble:v36 / (double)v759];
    v169 = [p_isa metrics];
    [v169 setObject:v168 forKeyedSubscript:@"mean_distance_workVisit_from_workAddress"];
  }
LABEL_92:
  if ([v24 count])
  {
    unint64_t v170 = 0;
    int v171 = 0;
    double v172 = 0.0;
    do
    {
      v173 = [v24 objectAtIndexedSubscript:v170];
      v174 = [v173 objectForKeyedSubscript:@"numberOthers"];

      if (v174)
      {
        v175 = [v24 objectAtIndexedSubscript:v170];
        v176 = [v175 objectForKeyedSubscript:@"sumDistanceOtherFromOther"];
        [v176 doubleValue];
        double v178 = v177;
        v179 = [v24 objectAtIndexedSubscript:v170];
        v180 = [v179 objectForKeyedSubscript:@"numberOthers"];
        [v180 doubleValue];
        double v172 = v172 + v178 / v181;

        ++v171;
      }
      ++v170;
    }
    while ([v24 count] > v170);
    if (v171 > 0)
    {
      v182 = [NSNumber numberWithDouble:v172 / (double)v171];
      v183 = [(RTMetric *)v835 metrics];
      [v183 setObject:v182 forKeyedSubscript:@"mean_distance_otherVisit_from_otherAddress"];
    }
  }
  v184 = [v745 valueForKeyPath:@"@avg.self"];
  v185 = [(RTMetric *)v835 metrics];
  [v185 setObject:v184 forKeyedSubscript:@"weekly_occurrence_rate_home"];

  v186 = [v744 valueForKeyPath:@"@avg.self"];
  v187 = [(RTMetric *)v835 metrics];
  [v187 setObject:v186 forKeyedSubscript:@"weekly_occurrence_rate_work"];

  v188 = +[RTPlaceDataMetrics meanOf:v743];
  v189 = [(RTMetric *)v835 metrics];
  [v189 setObject:v188 forKeyedSubscript:@"mean_visit_time_home"];

  v190 = +[RTPlaceDataMetrics medianOf:v743];
  v191 = [(RTMetric *)v835 metrics];
  [v191 setObject:v190 forKeyedSubscript:@"median_visit_time_home"];

  v192 = +[RTPlaceDataMetrics standardDeviationOf:v743];
  v193 = [(RTMetric *)v835 metrics];
  [v193 setObject:v192 forKeyedSubscript:@"SD_visit_time_home"];

  v194 = +[RTPlaceDataMetrics meanOf:v742];
  v195 = [(RTMetric *)v835 metrics];
  [v195 setObject:v194 forKeyedSubscript:@"mean_visit_time_work"];

  v196 = +[RTPlaceDataMetrics medianOf:v742];
  v197 = [(RTMetric *)v835 metrics];
  [v197 setObject:v196 forKeyedSubscript:@"median_visit_time_work"];

  v198 = +[RTPlaceDataMetrics standardDeviationOf:v742];
  v199 = [(RTMetric *)v835 metrics];
  [v199 setObject:v198 forKeyedSubscript:@"SD_visit_time_work"];

  if ([v24 count])
  {
    unint64_t v200 = 0;
    int v201 = 0;
    double v202 = 0.0;
    double v203 = 0.0;
    double v204 = 0.0;
    do
    {
      v205 = [v24 objectAtIndexedSubscript:v200];
      v206 = [v205 objectForKeyedSubscript:@"othersVisitTimeArray"];

      if ([v206 count])
      {
        ++v201;
        v207 = +[RTPlaceDataMetrics meanOf:v206];
        [v207 doubleValue];
        double v202 = v202 + v208;

        v209 = +[RTPlaceDataMetrics medianOf:v206];
        [v209 doubleValue];
        double v203 = v203 + v210;

        v211 = +[RTPlaceDataMetrics standardDeviationOf:v206];
        [v211 doubleValue];
        double v204 = v212;
      }
      ++v200;
    }
    while ([v24 count] > v200);
    if (v201 > 0)
    {
      v213 = [NSNumber numberWithDouble:v202 / (double)v201];
      v214 = [(RTMetric *)v835 metrics];
      [v214 setObject:v213 forKeyedSubscript:@"mean_visit_time_others"];

      v215 = [NSNumber numberWithDouble:v203 / (double)v201];
      v216 = [(RTMetric *)v835 metrics];
      [v216 setObject:v215 forKeyedSubscript:@"median_visit_time_others"];

      v217 = [NSNumber numberWithDouble:v204 / (double)v201];
      v218 = [(RTMetric *)v835 metrics];
      [v218 setObject:v217 forKeyedSubscript:@"SD_visit_time_others"];
    }
  }
  if ([v24 count])
  {
    v219 = 0;
    int v756 = 0;
    int v760 = 0;
    double v220 = 0.0;
    double v221 = 0.0;
    double v222 = 0.0;
    double v223 = 0.0;
    double v224 = 0.0;
    double v225 = 0.0;
    double v226 = 0.0;
    double v746 = 0.0;
    double v747 = 0.0;
    double v748 = 0.0;
    double v749 = 0.0;
    double v750 = 0.0;
    double v751 = 0.0;
    double v752 = 0.0;
    double v753 = 0.0;
    double v227 = 0.0;
    while (1)
    {
      v228 = [v24 objectAtIndexedSubscript:v219];
      v229 = [v228 objectForKeyedSubscript:@"othersVisitDateSet"];

      if (![v229 count]) {
        goto LABEL_157;
      }
      [v772 setDay:0];
      v230 = [v37 dateByAddingComponents:v772 toDate:v770 options:0];
      v231 = [v230 earlierDate:v769];

      if (v231 != v230) {
        goto LABEL_156;
      }
      v764 = v229;
      v842 = v219;
      uint64_t v232 = 0;
      uint64_t v233 = 0;
      uint64_t v773 = 0;
      uint64_t v775 = 0;
      uint64_t v779 = 0;
      uint64_t v784 = 0;
      uint64_t v788 = 0;
      uint64_t v791 = 0;
      uint64_t v794 = 0;
      uint64_t v799 = 0;
      uint64_t v804 = 0;
      uint64_t v808 = 0;
      contexta = 0;
      uint64_t v820 = 0;
      uint64_t v827 = 0;
      uint64_t v830 = 0;
      uint64_t v823 = 0;
      uint64_t v812 = 0;
      do
      {
        v234 = v230;
        v235 = (void *)MEMORY[0x1E016D870]();
        unsigned int v236 = [v37 isDateInWeekend:v230];
        int v237 = [v768 containsObject:v234];
        int v238 = [v767 containsObject:v234];
        v239 = [obja objectAtIndexedSubscript:v842];
        v240 = [v239 objectForKeyedSubscript:@"othersVisitDateSet"];
        int v241 = [v240 containsObject:v234];

        int v242 = v237 ^ 1 | v238 ^ 1;
        int v243 = v241 ^ 1;
        if (v242 & 1) != 0 || (v243)
        {
          int v244 = v237 ^ 1 | v238;
          if ((v244 | v243))
          {
            long long v37 = v850;
            goto LABEL_123;
          }
          long long v37 = v850;
          if (v236)
          {
LABEL_119:
            int v244 = 0;
            ++v808;
            goto LABEL_123;
          }
        }
        else
        {
          if (v236)
          {
            ++v804;
            long long v37 = v850;
            if ((v238 & 1) == 0) {
              goto LABEL_119;
            }
LABEL_121:
            int v244 = 1;
            goto LABEL_123;
          }
          long long v37 = v850;
          ++v773;
          if (v238) {
            goto LABEL_121;
          }
        }
        int v244 = 0;
        ++v775;
LABEL_123:
        int v245 = v237 | v238 ^ 1;
        if ((v245 | v243))
        {
          int v246 = v237 | v238;
          if ((v237 | v238 | v243)) {
            goto LABEL_133;
          }
          if (v236)
          {
LABEL_129:
            int v246 = 0;
            ++v820;
            goto LABEL_133;
          }
        }
        else
        {
          if (v236)
          {
            ++contexta;
            if ((v238 & 1) == 0) {
              goto LABEL_129;
            }
LABEL_131:
            int v246 = 1;
            goto LABEL_133;
          }
          ++v779;
          if (v238) {
            goto LABEL_131;
          }
        }
        int v246 = 0;
        ++v784;
LABEL_133:
        if ((v242 | v241))
        {
          if ((v244 | v241)) {
            goto LABEL_142;
          }
          if (v236) {
            goto LABEL_139;
          }
LABEL_141:
          ++v791;
          goto LABEL_142;
        }
        if (v236)
        {
          ++v812;
          if (v244) {
            goto LABEL_142;
          }
LABEL_139:
          ++v823;
          goto LABEL_142;
        }
        ++v788;
        if ((v244 & 1) == 0) {
          goto LABEL_141;
        }
LABEL_142:
        if ((v245 | v241))
        {
          if ((v246 | v241)) {
            goto LABEL_151;
          }
          if (v236) {
            goto LABEL_148;
          }
LABEL_150:
          ++v799;
          goto LABEL_151;
        }
        if (v236)
        {
          ++v827;
          if (v246) {
            goto LABEL_151;
          }
LABEL_148:
          ++v830;
          goto LABEL_151;
        }
        ++v794;
        if ((v246 & 1) == 0) {
          goto LABEL_150;
        }
LABEL_151:
        v233 += v236;
        v232 += v236 ^ 1;
        [v772 setDay:[v772 day] + 1];
        v230 = [v37 dateByAddingComponents:v772 toDate:v770 options:0];

        v247 = [v230 earlierDate:v769];
      }
      while (v247 == v230);
      if (v232)
      {
        ++v756;
        double v220 = v220 + (double)v773 / (double)v232;
        double v221 = v221 + (double)v775 / (double)v232;
        double v222 = v222 + (double)v779 / (double)v232;
        double v223 = v223 + (double)v784 / (double)v232;
        double v224 = v224 + (double)v788 / (double)v232;
        double v225 = v225 + (double)v791 / (double)v232;
        double v226 = v226 + (double)v794 / (double)v232;
        double v746 = v746 + (double)v799 / (double)v232;
      }
      BOOL v24 = obja;
      v219 = v842;
      v229 = v764;
      if (v233)
      {
        ++v760;
        double v747 = v747 + (double)v804 / (double)v233;
        double v748 = v748 + (double)v808 / (double)v233;
        double v749 = v749 + (double)(uint64_t)contexta / (double)v233;
        double v750 = v750 + (double)v820 / (double)v233;
        double v751 = v751 + (double)v812 / (double)v233;
        double v752 = v752 + (double)v823 / (double)v233;
        double v753 = v753 + (double)v827 / (double)v233;
        double v227 = v227 + (double)v830 / (double)v233;
      }
LABEL_156:

LABEL_157:
      if ([v24 count] <= (unint64_t)++v219)
      {
        if (v756 > 0)
        {
          v248 = [NSNumber numberWithDouble:v220 / (double)v756];
          v249 = [(RTMetric *)v835 metrics];
          [v249 setObject:v248 forKeyedSubscript:@"average_occurrence_weekdays_Home_Work_Others"];

          v250 = [NSNumber numberWithDouble:v221 / (double)v756];
          v251 = [(RTMetric *)v835 metrics];
          [v251 setObject:v250 forKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_Others"];

          v252 = [NSNumber numberWithDouble:v222 / (double)v756];
          v253 = [(RTMetric *)v835 metrics];
          [v253 setObject:v252 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_Others"];

          v254 = [NSNumber numberWithDouble:v223 / (double)v756];
          v255 = [(RTMetric *)v835 metrics];
          [v255 setObject:v254 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_Others"];

          v256 = [NSNumber numberWithDouble:v224 / (double)v756];
          v257 = [(RTMetric *)v835 metrics];
          [v257 setObject:v256 forKeyedSubscript:@"average_occurrence_weekdays_Home_Work_NoOthers"];

          v258 = [NSNumber numberWithDouble:v225 / (double)v756];
          v259 = [(RTMetric *)v835 metrics];
          [v259 setObject:v258 forKeyedSubscript:@"average_occurrence_weekdays_Home_NoWork_NoOthers"];

          v260 = [NSNumber numberWithDouble:v226 / (double)v756];
          v261 = [(RTMetric *)v835 metrics];
          [v261 setObject:v260 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_Work_NoOthers"];

          v262 = [NSNumber numberWithDouble:v746 / (double)v756];
          v263 = [(RTMetric *)v835 metrics];
          [v263 setObject:v262 forKeyedSubscript:@"average_occurrence_weekdays_NoHome_NoWork_NoOthers"];
        }
        if (v760 >= 1)
        {
          v264 = [NSNumber numberWithDouble:v747 / (double)v760];
          v265 = [(RTMetric *)v835 metrics];
          [v265 setObject:v264 forKeyedSubscript:@"average_occurrence_weekend_Home_Work_Others"];

          v266 = [NSNumber numberWithDouble:v748 / (double)v760];
          v267 = [(RTMetric *)v835 metrics];
          [v267 setObject:v266 forKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_Others"];

          v268 = [NSNumber numberWithDouble:v749 / (double)v760];
          v269 = [(RTMetric *)v835 metrics];
          [v269 setObject:v268 forKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_Others"];

          v270 = [NSNumber numberWithDouble:v750 / (double)v760];
          v271 = [(RTMetric *)v835 metrics];
          [v271 setObject:v270 forKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_Others"];

          v272 = [NSNumber numberWithDouble:v751 / (double)v760];
          v273 = [(RTMetric *)v835 metrics];
          [v273 setObject:v272 forKeyedSubscript:@"average_occurrence_weekend_Home_Work_NoOthers"];

          v274 = [NSNumber numberWithDouble:v752 / (double)v760];
          v275 = [(RTMetric *)v835 metrics];
          [v275 setObject:v274 forKeyedSubscript:@"average_occurrence_weekend_Home_NoWork_NoOthers"];

          v276 = [NSNumber numberWithDouble:v753 / (double)v760];
          v277 = [(RTMetric *)v835 metrics];
          [v277 setObject:v276 forKeyedSubscript:@"average_occurrence_weekend_NoHome_Work_NoOthers"];

          v278 = [NSNumber numberWithDouble:v227 / (double)v760];
          v279 = [(RTMetric *)v835 metrics];
          [v279 setObject:v278 forKeyedSubscript:@"average_occurrence_weekend_NoHome_NoWork_NoOthers"];
        }
        break;
      }
    }
  }
  id v831 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v828 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v934 = 0u;
  long long v935 = 0u;
  long long v936 = 0u;
  long long v937 = 0u;
  v280 = [v832 allKeys];
  uint64_t v281 = [v280 countByEnumeratingWithState:&v934 objects:v967 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v935;
    do
    {
      for (uint64_t j = 0; j != v282; ++j)
      {
        if (*(void *)v935 != v283) {
          objc_enumerationMutation(v280);
        }
        uint64_t v285 = *(void *)(*((void *)&v934 + 1) + 8 * j);
        v286 = [v851 dateFromString:v285];
        int v287 = [v37 isDateInWeekend:v286];

        v288 = [v832 objectForKeyedSubscript:v285];
        if (v287) {
          v289 = v831;
        }
        else {
          v289 = v828;
        }
        [v289 addObject:v288];
      }
      uint64_t v282 = [v280 countByEnumeratingWithState:&v934 objects:v967 count:16];
    }
    while (v282);
  }

  v290 = +[RTPlaceDataMetrics meanOf:v828];
  v291 = [(RTMetric *)v835 metrics];
  [v291 setObject:v290 forKeyedSubscript:@"mean_daily_visits_weekdays_home"];

  v292 = +[RTPlaceDataMetrics medianOf:v828];
  v293 = [(RTMetric *)v835 metrics];
  [v293 setObject:v292 forKeyedSubscript:@"median_daily_visits_weekdays_home"];

  v294 = +[RTPlaceDataMetrics standardDeviationOf:v828];
  v295 = [(RTMetric *)v835 metrics];
  [v295 setObject:v294 forKeyedSubscript:@"SD_daily_visits_weekdays_home"];

  v296 = +[RTPlaceDataMetrics meanOf:v831];
  v297 = [(RTMetric *)v835 metrics];
  [v297 setObject:v296 forKeyedSubscript:@"mean_daily_visits_weekend_home"];

  v298 = +[RTPlaceDataMetrics medianOf:v831];
  v299 = [(RTMetric *)v835 metrics];
  [v299 setObject:v298 forKeyedSubscript:@"median_daily_visits_weekend_home"];

  v300 = +[RTPlaceDataMetrics standardDeviationOf:v831];
  v301 = [(RTMetric *)v835 metrics];
  [v301 setObject:v300 forKeyedSubscript:@"SD_daily_visits_weekend_home"];

  id v824 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v821 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v930 = 0u;
  long long v931 = 0u;
  long long v932 = 0u;
  long long v933 = 0u;
  v302 = [v834 allKeys];
  uint64_t v303 = [v302 countByEnumeratingWithState:&v930 objects:v966 count:16];
  if (v303)
  {
    uint64_t v304 = v303;
    uint64_t v305 = *(void *)v931;
    do
    {
      for (uint64_t k = 0; k != v304; ++k)
      {
        if (*(void *)v931 != v305) {
          objc_enumerationMutation(v302);
        }
        uint64_t v307 = *(void *)(*((void *)&v930 + 1) + 8 * k);
        v308 = [v851 dateFromString:v307];
        int v309 = [v37 isDateInWeekend:v308];

        v310 = [v834 objectForKeyedSubscript:v307];
        if (v309) {
          v311 = v824;
        }
        else {
          v311 = v821;
        }
        [v311 addObject:v310];
      }
      uint64_t v304 = [v302 countByEnumeratingWithState:&v930 objects:v966 count:16];
    }
    while (v304);
  }

  v312 = +[RTPlaceDataMetrics meanOf:v821];
  v313 = [(RTMetric *)v835 metrics];
  [v313 setObject:v312 forKeyedSubscript:@"mean_daily_visits_weekdays_work"];

  v314 = +[RTPlaceDataMetrics medianOf:v821];
  v315 = [(RTMetric *)v835 metrics];
  [v315 setObject:v314 forKeyedSubscript:@"median_daily_visits_weekdays_work"];

  v316 = +[RTPlaceDataMetrics standardDeviationOf:v821];
  v317 = [(RTMetric *)v835 metrics];
  [v317 setObject:v316 forKeyedSubscript:@"SD_daily_visits_weekdays_work"];

  v318 = +[RTPlaceDataMetrics meanOf:v824];
  v319 = [(RTMetric *)v835 metrics];
  [v319 setObject:v318 forKeyedSubscript:@"mean_daily_visits_weekend_work"];

  v320 = +[RTPlaceDataMetrics medianOf:v824];
  v321 = [(RTMetric *)v835 metrics];
  [v321 setObject:v320 forKeyedSubscript:@"median_daily_visits_weekend_work"];

  v322 = +[RTPlaceDataMetrics standardDeviationOf:v824];
  v323 = [(RTMetric *)v835 metrics];
  [v323 setObject:v322 forKeyedSubscript:@"SD_daily_visits_weekend_work"];

  v324 = obja;
  v325 = v837;
  if ([obja count])
  {
    unint64_t v326 = 0;
    int v809 = 0;
    int v805 = 0;
    double v327 = 0.0;
    double v328 = 0.0;
    double v329 = 0.0;
    double v330 = 0.0;
    double v331 = 0.0;
    double v332 = 0.0;
    do
    {
      v333 = (void *)MEMORY[0x1E016D870]();
      v334 = [v324 objectAtIndexedSubscript:v326];
      v335 = [v334 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];

      contextb = v335;
      if ([v335 count])
      {
        v813 = v333;
        id v336 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v337 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v926 = 0u;
        long long v927 = 0u;
        long long v928 = 0u;
        long long v929 = 0u;
        id v843 = (id)v326;
        v338 = [v324 objectAtIndexedSubscript:v326];
        v339 = [v338 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
        v340 = [v339 allKeys];

        uint64_t v341 = [v340 countByEnumeratingWithState:&v926 objects:v965 count:16];
        if (v341)
        {
          uint64_t v342 = v341;
          uint64_t v343 = *(void *)v927;
          do
          {
            for (uint64_t m = 0; m != v342; ++m)
            {
              if (*(void *)v927 != v343) {
                objc_enumerationMutation(v340);
              }
              uint64_t v345 = *(void *)(*((void *)&v926 + 1) + 8 * m);
              v346 = [v851 dateFromString:v345];
              int v347 = [v850 isDateInWeekend:v346];

              v348 = [v324 objectAtIndexedSubscript:v843];
              v349 = [v348 objectForKeyedSubscript:@"dictNumDailyVisitsOthers"];
              v350 = [v349 objectForKeyedSubscript:v345];
              if (v347) {
                v351 = v337;
              }
              else {
                v351 = v336;
              }
              [v351 addObject:v350];

              v324 = obja;
            }
            uint64_t v342 = [v340 countByEnumeratingWithState:&v926 objects:v965 count:16];
          }
          while (v342);
        }

        if ([v336 count])
        {
          v352 = +[RTPlaceDataMetrics meanOf:v336];
          [v352 doubleValue];
          double v332 = v332 + v353;

          v354 = +[RTPlaceDataMetrics medianOf:v336];
          [v354 doubleValue];
          double v331 = v331 + v355;

          v356 = +[RTPlaceDataMetrics standardDeviationOf:v336];
          [v356 doubleValue];
          double v330 = v330 + v357;

          ++v805;
        }
        long long v37 = v850;
        if ([v337 count])
        {
          v358 = +[RTPlaceDataMetrics meanOf:v337];
          [v358 doubleValue];
          double v329 = v329 + v359;

          v360 = +[RTPlaceDataMetrics medianOf:v337];
          [v360 doubleValue];
          double v328 = v328 + v361;

          v362 = +[RTPlaceDataMetrics standardDeviationOf:v337];
          [v362 doubleValue];
          double v327 = v327 + v363;

          ++v809;
        }
        unint64_t v326 = (unint64_t)v843;
        v333 = v813;

        v325 = v837;
      }

      ++v326;
    }
    while ([v324 count] > v326);
    if (v805 > 0)
    {
      v364 = [NSNumber numberWithDouble:v332 / (double)v805];
      v365 = [(RTMetric *)v835 metrics];
      [v365 setObject:v364 forKeyedSubscript:@"mean_daily_visits_weekdays_others"];

      v366 = [NSNumber numberWithDouble:v331 / (double)v805];
      v367 = [(RTMetric *)v835 metrics];
      [v367 setObject:v366 forKeyedSubscript:@"median_daily_visits_weekdays_others"];

      v368 = [NSNumber numberWithDouble:v330 / (double)v805];
      v369 = [(RTMetric *)v835 metrics];
      [v369 setObject:v368 forKeyedSubscript:@"SD_daily_visits_weekdays_others"];
    }
    if (v809 >= 1)
    {
      v370 = [NSNumber numberWithDouble:v329 / (double)v809];
      v371 = [(RTMetric *)v835 metrics];
      [v371 setObject:v370 forKeyedSubscript:@"mean_daily_visits_weekend_others"];

      v372 = [NSNumber numberWithDouble:v328 / (double)v809];
      v373 = [(RTMetric *)v835 metrics];
      [v373 setObject:v372 forKeyedSubscript:@"median_daily_visits_weekend_others"];

      v374 = [NSNumber numberWithDouble:v327 / (double)v809];
      v375 = [(RTMetric *)v835 metrics];
      [v375 setObject:v374 forKeyedSubscript:@"SD_daily_visits_weekend_others"];
    }
  }
  id contextc = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v922 = 0u;
  long long v923 = 0u;
  long long v924 = 0u;
  long long v925 = 0u;
  v376 = [v325 allKeys];
  uint64_t v377 = [v376 countByEnumeratingWithState:&v922 objects:v964 count:16];
  if (v377)
  {
    uint64_t v378 = v377;
    uint64_t v379 = *(void *)v923;
    do
    {
      for (uint64_t n = 0; n != v378; ++n)
      {
        if (*(void *)v923 != v379) {
          objc_enumerationMutation(v376);
        }
        v381 = [v325 objectForKeyedSubscript:*(void *)(*((void *)&v922 + 1) + 8 * n)];
        [contextc addObjectsFromArray:v381];
      }
      uint64_t v378 = [v376 countByEnumeratingWithState:&v922 objects:v964 count:16];
    }
    while (v378);
  }

  v382 = +[RTPlaceDataMetrics medianOf:contextc];
  v383 = [(RTMetric *)v835 metrics];
  [v383 setObject:v382 forKeyedSubscript:@"median_visit_duration_weekend_home"];

  v384 = +[RTPlaceDataMetrics meanOf:contextc];
  v385 = [(RTMetric *)v835 metrics];
  [v385 setObject:v384 forKeyedSubscript:@"mean_visit_duration_weekend_home"];

  v386 = +[RTPlaceDataMetrics standardDeviationOf:contextc];
  v387 = [(RTMetric *)v835 metrics];
  [v387 setObject:v386 forKeyedSubscript:@"SD_visit_duration_weekend_home"];

  id v814 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v918 = 0u;
  long long v919 = 0u;
  long long v920 = 0u;
  long long v921 = 0u;
  v388 = v840;
  v389 = [v840 allKeys];
  uint64_t v390 = [v389 countByEnumeratingWithState:&v918 objects:v963 count:16];
  if (v390)
  {
    uint64_t v391 = v390;
    uint64_t v392 = *(void *)v919;
    do
    {
      for (iuint64_t i = 0; ii != v391; ++ii)
      {
        if (*(void *)v919 != v392) {
          objc_enumerationMutation(v389);
        }
        v394 = [v388 objectForKeyedSubscript:*(void *)(*((void *)&v918 + 1) + 8 * ii)];
        [v814 addObjectsFromArray:v394];

        v388 = v840;
      }
      uint64_t v391 = [v389 countByEnumeratingWithState:&v918 objects:v963 count:16];
    }
    while (v391);
  }

  v395 = +[RTPlaceDataMetrics medianOf:v814];
  v396 = [(RTMetric *)v835 metrics];
  [v396 setObject:v395 forKeyedSubscript:@"median_visit_duration_weekdays_home"];

  v397 = +[RTPlaceDataMetrics meanOf:v814];
  v398 = [(RTMetric *)v835 metrics];
  [v398 setObject:v397 forKeyedSubscript:@"mean_visit_duration_weekdays_home"];

  v399 = +[RTPlaceDataMetrics standardDeviationOf:v814];
  v400 = [(RTMetric *)v835 metrics];
  [v400 setObject:v399 forKeyedSubscript:@"SD_visit_duration_weekdays_home"];

  id v810 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v914 = 0u;
  long long v915 = 0u;
  long long v916 = 0u;
  long long v917 = 0u;
  v401 = v839;
  v402 = [v839 allKeys];
  uint64_t v403 = [v402 countByEnumeratingWithState:&v914 objects:v962 count:16];
  if (v403)
  {
    uint64_t v404 = v403;
    uint64_t v405 = *(void *)v915;
    do
    {
      for (juint64_t j = 0; jj != v404; ++jj)
      {
        if (*(void *)v915 != v405) {
          objc_enumerationMutation(v402);
        }
        v407 = [v401 objectForKeyedSubscript:*(void *)(*((void *)&v914 + 1) + 8 * jj)];
        [v810 addObjectsFromArray:v407];

        v401 = v839;
      }
      uint64_t v404 = [v402 countByEnumeratingWithState:&v914 objects:v962 count:16];
    }
    while (v404);
  }

  v408 = +[RTPlaceDataMetrics medianOf:v810];
  v409 = [(RTMetric *)v835 metrics];
  [v409 setObject:v408 forKeyedSubscript:@"median_visit_duration_weekend_work"];

  v410 = +[RTPlaceDataMetrics meanOf:v810];
  v411 = [(RTMetric *)v835 metrics];
  [v411 setObject:v410 forKeyedSubscript:@"mean_visit_duration_weekend_work"];

  v412 = +[RTPlaceDataMetrics standardDeviationOf:v810];
  v413 = [(RTMetric *)v835 metrics];
  [v413 setObject:v412 forKeyedSubscript:@"SD_visit_duration_weekend_work"];

  id v806 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v910 = 0u;
  long long v911 = 0u;
  long long v912 = 0u;
  long long v913 = 0u;
  v414 = v838;
  v415 = [v838 allKeys];
  uint64_t v416 = [v415 countByEnumeratingWithState:&v910 objects:v961 count:16];
  if (v416)
  {
    uint64_t v417 = v416;
    uint64_t v418 = *(void *)v911;
    do
    {
      for (kuint64_t k = 0; kk != v417; ++kk)
      {
        if (*(void *)v911 != v418) {
          objc_enumerationMutation(v415);
        }
        v420 = [v414 objectForKeyedSubscript:*(void *)(*((void *)&v910 + 1) + 8 * kk)];
        [v806 addObjectsFromArray:v420];

        v414 = v838;
      }
      uint64_t v417 = [v415 countByEnumeratingWithState:&v910 objects:v961 count:16];
    }
    while (v417);
  }

  v421 = +[RTPlaceDataMetrics medianOf:v806];
  v422 = [(RTMetric *)v835 metrics];
  [v422 setObject:v421 forKeyedSubscript:@"median_visit_duration_weekdays_work"];

  v423 = +[RTPlaceDataMetrics meanOf:v806];
  v424 = [(RTMetric *)v835 metrics];
  [v424 setObject:v423 forKeyedSubscript:@"mean_visit_duration_weekdays_work"];

  v425 = +[RTPlaceDataMetrics standardDeviationOf:v806];
  v426 = [(RTMetric *)v835 metrics];
  [v426 setObject:v425 forKeyedSubscript:@"SD_visit_duration_weekdays_work"];

  if ([v324 count])
  {
    unint64_t v427 = 0;
    int v428 = 0;
    double v429 = 0.0;
    double v430 = 0.0;
    double v431 = 0.0;
    do
    {
      v432 = (void *)MEMORY[0x1E016D870]();
      v433 = [v324 objectAtIndexedSubscript:v427];
      v434 = [v433 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];

      id v844 = v434;
      if ([v434 count])
      {
        v795 = v432;
        int v800 = v428;
        id v435 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v906 = 0u;
        long long v907 = 0u;
        long long v908 = 0u;
        long long v909 = 0u;
        v436 = [v324 objectAtIndexedSubscript:v427];
        v437 = [v436 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];
        v438 = [v437 allKeys];

        uint64_t v439 = [v438 countByEnumeratingWithState:&v906 objects:v960 count:16];
        if (v439)
        {
          uint64_t v440 = v439;
          uint64_t v441 = *(void *)v907;
          do
          {
            for (muint64_t m = 0; mm != v440; ++mm)
            {
              if (*(void *)v907 != v441) {
                objc_enumerationMutation(v438);
              }
              uint64_t v443 = *(void *)(*((void *)&v906 + 1) + 8 * mm);
              v444 = [obja objectAtIndexedSubscript:v427];
              v445 = [v444 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];
              v446 = [v445 objectForKeyedSubscript:v443];
              [v435 addObjectsFromArray:v446];
            }
            uint64_t v440 = [v438 countByEnumeratingWithState:&v906 objects:v960 count:16];
          }
          while (v440);
        }

        v447 = +[RTPlaceDataMetrics medianOf:v435];
        [v447 doubleValue];
        double v431 = v448;

        v449 = +[RTPlaceDataMetrics meanOf:v435];
        [v449 doubleValue];
        double v430 = v450;

        v451 = +[RTPlaceDataMetrics standardDeviationOf:v435];
        [v451 doubleValue];
        double v429 = v452;

        int v428 = v800 + 1;
        long long v37 = v850;
        v325 = v837;
        v324 = obja;
        v432 = v795;
      }

      ++v427;
    }
    while ([v324 count] > v427);
    if (v428 > 0)
    {
      v453 = [NSNumber numberWithDouble:v431 / (double)v428];
      v454 = [(RTMetric *)v835 metrics];
      [v454 setObject:v453 forKeyedSubscript:@"median_visit_duration_weekend_others"];

      v455 = [NSNumber numberWithDouble:v430 / (double)v428];
      v456 = [(RTMetric *)v835 metrics];
      [v456 setObject:v455 forKeyedSubscript:@"mean_visit_duration_weekend_others"];

      v457 = [NSNumber numberWithDouble:v429 / (double)v428];
      v458 = [(RTMetric *)v835 metrics];
      [v458 setObject:v457 forKeyedSubscript:@"SD_visit_duration_weekend_others"];
    }
  }
  if ([v324 count])
  {
    unint64_t v459 = 0;
    int v460 = 0;
    double v461 = 0.0;
    double v462 = 0.0;
    double v463 = 0.0;
    do
    {
      v464 = (void *)MEMORY[0x1E016D870]();
      v465 = [v324 objectAtIndexedSubscript:v459];
      v466 = [v465 objectForKeyedSubscript:@"dictVisitDurationWeekdaysOthers"];

      id v845 = v466;
      if ([v466 count])
      {
        v796 = v464;
        int v801 = v460;
        id v467 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v902 = 0u;
        long long v903 = 0u;
        long long v904 = 0u;
        long long v905 = 0u;
        v468 = [v324 objectAtIndexedSubscript:v459];
        v469 = [v468 objectForKeyedSubscript:@"dictVisitDurationWeekdaysOthers"];
        v470 = [v469 allKeys];

        uint64_t v471 = [v470 countByEnumeratingWithState:&v902 objects:v959 count:16];
        if (v471)
        {
          uint64_t v472 = v471;
          uint64_t v473 = *(void *)v903;
          do
          {
            for (nuint64_t n = 0; nn != v472; ++nn)
            {
              if (*(void *)v903 != v473) {
                objc_enumerationMutation(v470);
              }
              uint64_t v475 = *(void *)(*((void *)&v902 + 1) + 8 * nn);
              v476 = [obja objectAtIndexedSubscript:v459];
              v477 = [v476 objectForKeyedSubscript:@"dictVisitDurationWeekdaysOthers"];
              v478 = [v477 objectForKeyedSubscript:v475];
              [v467 addObjectsFromArray:v478];
            }
            uint64_t v472 = [v470 countByEnumeratingWithState:&v902 objects:v959 count:16];
          }
          while (v472);
        }

        v479 = +[RTPlaceDataMetrics medianOf:v467];
        [v479 doubleValue];
        double v463 = v480;

        v481 = +[RTPlaceDataMetrics meanOf:v467];
        [v481 doubleValue];
        double v462 = v482;

        v483 = +[RTPlaceDataMetrics standardDeviationOf:v467];
        [v483 doubleValue];
        double v461 = v484;

        int v460 = v801 + 1;
        long long v37 = v850;
        v325 = v837;
        v324 = obja;
        v464 = v796;
      }

      ++v459;
    }
    while ([v324 count] > v459);
    if (v460 > 0)
    {
      v485 = [NSNumber numberWithDouble:v463 / (double)v460];
      v486 = [(RTMetric *)v835 metrics];
      [v486 setObject:v485 forKeyedSubscript:@"median_visit_duration_weekdays_others"];

      v487 = [NSNumber numberWithDouble:v462 / (double)v460];
      v488 = [(RTMetric *)v835 metrics];
      [v488 setObject:v487 forKeyedSubscript:@"mean_visit_duration_weekdays_others"];

      v489 = [NSNumber numberWithDouble:v461 / (double)v460];
      v490 = [(RTMetric *)v835 metrics];
      [v490 setObject:v489 forKeyedSubscript:@"SD_visit_duration_weekdays_others"];
    }
  }
  id v802 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v898 = 0u;
  long long v899 = 0u;
  long long v900 = 0u;
  long long v901 = 0u;
  v491 = [v325 allKeys];
  uint64_t v492 = [v491 countByEnumeratingWithState:&v898 objects:v958 count:16];
  if (v492)
  {
    uint64_t v493 = v492;
    uint64_t v494 = *(void *)v899;
    do
    {
      for (uint64_t i1 = 0; i1 != v493; ++i1)
      {
        if (*(void *)v899 != v494) {
          objc_enumerationMutation(v491);
        }
        v496 = [v837 objectForKeyedSubscript:*(void *)(*((void *)&v898 + 1) + 8 * i1)];
        v497 = [v496 valueForKeyPath:@"@sum.self"];

        [v802 addObject:v497];
      }
      uint64_t v493 = [v491 countByEnumeratingWithState:&v898 objects:v958 count:16];
    }
    while (v493);
  }

  v498 = +[RTPlaceDataMetrics medianOf:v802];
  v499 = [(RTMetric *)v835 metrics];
  [v499 setObject:v498 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_home"];

  v500 = +[RTPlaceDataMetrics meanOf:v802];
  v501 = [(RTMetric *)v835 metrics];
  [v501 setObject:v500 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_home"];

  v502 = +[RTPlaceDataMetrics standardDeviationOf:v802];
  v503 = [(RTMetric *)v835 metrics];
  [v503 setObject:v502 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_home"];

  id v797 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v894 = 0u;
  long long v895 = 0u;
  long long v896 = 0u;
  long long v897 = 0u;
  v504 = v840;
  v505 = [v840 allKeys];
  uint64_t v506 = [v505 countByEnumeratingWithState:&v894 objects:v957 count:16];
  if (v506)
  {
    uint64_t v507 = v506;
    uint64_t v508 = *(void *)v895;
    do
    {
      for (uint64_t i2 = 0; i2 != v507; ++i2)
      {
        if (*(void *)v895 != v508) {
          objc_enumerationMutation(v505);
        }
        v510 = [v504 objectForKeyedSubscript:*(void *)(*((void *)&v894 + 1) + 8 * i2)];
        v511 = [v510 valueForKeyPath:@"@sum.self"];

        v504 = v840;
        [v797 addObject:v511];
      }
      uint64_t v507 = [v505 countByEnumeratingWithState:&v894 objects:v957 count:16];
    }
    while (v507);
  }

  v512 = +[RTPlaceDataMetrics medianOf:v797];
  v513 = [(RTMetric *)v835 metrics];
  [v513 setObject:v512 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_home"];

  v514 = +[RTPlaceDataMetrics meanOf:v797];
  v515 = [(RTMetric *)v835 metrics];
  [v515 setObject:v514 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_home"];

  v516 = +[RTPlaceDataMetrics standardDeviationOf:v797];
  v517 = [(RTMetric *)v835 metrics];
  [v517 setObject:v516 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_home"];

  id v792 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v890 = 0u;
  long long v891 = 0u;
  long long v892 = 0u;
  long long v893 = 0u;
  v518 = v839;
  v519 = [v839 allKeys];
  uint64_t v520 = [v519 countByEnumeratingWithState:&v890 objects:v956 count:16];
  if (v520)
  {
    uint64_t v521 = v520;
    uint64_t v522 = *(void *)v891;
    do
    {
      for (uint64_t i3 = 0; i3 != v521; ++i3)
      {
        if (*(void *)v891 != v522) {
          objc_enumerationMutation(v519);
        }
        v524 = [v518 objectForKeyedSubscript:*(void *)(*((void *)&v890 + 1) + 8 * i3)];
        v525 = [v524 valueForKeyPath:@"@sum.self"];

        v518 = v839;
        [v792 addObject:v525];
      }
      uint64_t v521 = [v519 countByEnumeratingWithState:&v890 objects:v956 count:16];
    }
    while (v521);
  }

  v526 = +[RTPlaceDataMetrics medianOf:v792];
  v527 = [(RTMetric *)v835 metrics];
  [v527 setObject:v526 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_work"];

  v528 = +[RTPlaceDataMetrics meanOf:v792];
  v529 = [(RTMetric *)v835 metrics];
  [v529 setObject:v528 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_work"];

  v530 = +[RTPlaceDataMetrics standardDeviationOf:v792];
  v531 = [(RTMetric *)v835 metrics];
  [v531 setObject:v530 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_work"];

  id v789 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v886 = 0u;
  long long v887 = 0u;
  long long v888 = 0u;
  long long v889 = 0u;
  v532 = v838;
  v533 = [v838 allKeys];
  uint64_t v534 = [v533 countByEnumeratingWithState:&v886 objects:v955 count:16];
  if (v534)
  {
    uint64_t v535 = v534;
    uint64_t v536 = *(void *)v887;
    do
    {
      for (uint64_t i4 = 0; i4 != v535; ++i4)
      {
        if (*(void *)v887 != v536) {
          objc_enumerationMutation(v533);
        }
        v538 = [v532 objectForKeyedSubscript:*(void *)(*((void *)&v886 + 1) + 8 * i4)];
        v539 = [v538 valueForKeyPath:@"@sum.self"];

        v532 = v838;
        [v789 addObject:v539];
      }
      uint64_t v535 = [v533 countByEnumeratingWithState:&v886 objects:v955 count:16];
    }
    while (v535);
  }

  v540 = +[RTPlaceDataMetrics medianOf:v789];
  v541 = [(RTMetric *)v835 metrics];
  [v541 setObject:v540 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_work"];

  v542 = +[RTPlaceDataMetrics meanOf:v789];
  v543 = [(RTMetric *)v835 metrics];
  [v543 setObject:v542 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_work"];

  v544 = +[RTPlaceDataMetrics standardDeviationOf:v789];
  v545 = [(RTMetric *)v835 metrics];
  [v545 setObject:v544 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_work"];

  v546 = obja;
  if (![obja count]) {
    goto LABEL_303;
  }
  unint64_t v547 = 0;
  int v548 = 0;
  v549 = @"dictVisitDurationWeekendOthers";
  double v550 = 0.0;
  double v551 = 0.0;
  double v552 = 0.0;
  do
  {
    v553 = (void *)MEMORY[0x1E016D870]();
    v554 = [v546 objectAtIndexedSubscript:v547];
    v555 = [v554 objectForKeyedSubscript:v549];

    v785 = v555;
    if ([v555 count])
    {
      v776 = v553;
      int v780 = v548;
      id v556 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v882 = 0u;
      long long v883 = 0u;
      long long v884 = 0u;
      long long v885 = 0u;
      v557 = [v546 objectAtIndexedSubscript:v547];
      v558 = [v557 objectForKeyedSubscript:v549];
      v559 = [v558 allKeys];

      id v846 = v559;
      uint64_t v560 = [v559 countByEnumeratingWithState:&v882 objects:v954 count:16];
      if (v560)
      {
        uint64_t v561 = v560;
        uint64_t v562 = *(void *)v883;
        do
        {
          for (uint64_t i5 = 0; i5 != v561; ++i5)
          {
            if (*(void *)v883 != v562) {
              objc_enumerationMutation(v846);
            }
            uint64_t v564 = *(void *)(*((void *)&v882 + 1) + 8 * i5);
            v565 = [v546 objectAtIndexedSubscript:v547];
            v566 = [v565 objectForKeyedSubscript:v549];
            v567 = [v566 objectForKeyedSubscript:v564];
            [v567 valueForKeyPath:@"@sum.self"];
            v569 = v568 = v549;

            v546 = obja;
            [v556 addObject:v569];

            v549 = v568;
          }
          uint64_t v561 = [v846 countByEnumeratingWithState:&v882 objects:v954 count:16];
        }
        while (v561);
      }

      v570 = +[RTPlaceDataMetrics medianOf:v556];
      [v570 doubleValue];
      double v552 = v571;

      v572 = +[RTPlaceDataMetrics meanOf:v556];
      [v572 doubleValue];
      double v551 = v573;

      v574 = +[RTPlaceDataMetrics standardDeviationOf:v556];
      [v574 doubleValue];
      double v550 = v575;

      int v548 = v780 + 1;
      long long v37 = v850;
      v553 = v776;
    }

    ++v547;
  }
  while ([v546 count] > v547);
  if (v548 > 0)
  {
    v576 = [NSNumber numberWithDouble:v552 / (double)v548];
    v577 = [(RTMetric *)v835 metrics];
    [v577 setObject:v576 forKeyedSubscript:@"median_daily_total_visit_duration_weekend_others"];

    v578 = [NSNumber numberWithDouble:v551 / (double)v548];
    v579 = [(RTMetric *)v835 metrics];
    [v579 setObject:v578 forKeyedSubscript:@"mean_daily_total_visit_duration_weekend_others"];

    v580 = [NSNumber numberWithDouble:v550 / (double)v548];
    v581 = [(RTMetric *)v835 metrics];
    [v581 setObject:v580 forKeyedSubscript:@"SD_daily_total_visit_duration_weekend_others"];

    char v754 = 1;
  }
  else
  {
LABEL_303:
    char v754 = 0;
  }
  if ([v546 count])
  {
    unint64_t v582 = 0;
    int v583 = 0;
    v584 = @"dictVisitDurationWeekdaysOthers";
    double v585 = 0.0;
    double v586 = 0.0;
    double v587 = 0.0;
    do
    {
      v588 = (void *)MEMORY[0x1E016D870]();
      v589 = [v546 objectAtIndexedSubscript:v582];
      v590 = [v589 objectForKeyedSubscript:v584];

      if ([v590 count])
      {
        v777 = v590;
        v781 = v588;
        int v786 = v583;
        id v591 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v878 = 0u;
        long long v879 = 0u;
        long long v880 = 0u;
        long long v881 = 0u;
        v592 = [v546 objectAtIndexedSubscript:v582];
        v593 = [v592 objectForKeyedSubscript:v584];
        v594 = [v593 allKeys];

        id v847 = v594;
        uint64_t v595 = [v594 countByEnumeratingWithState:&v878 objects:v953 count:16];
        if (v595)
        {
          uint64_t v596 = v595;
          uint64_t v597 = *(void *)v879;
          do
          {
            for (uint64_t i6 = 0; i6 != v596; ++i6)
            {
              if (*(void *)v879 != v597) {
                objc_enumerationMutation(v847);
              }
              uint64_t v599 = *(void *)(*((void *)&v878 + 1) + 8 * i6);
              v600 = [v546 objectAtIndexedSubscript:v582];
              v601 = [v600 objectForKeyedSubscript:v584];
              v602 = [v601 objectForKeyedSubscript:v599];
              [v602 valueForKeyPath:@"@sum.self"];
              v604 = v603 = v584;

              v546 = obja;
              [v591 addObject:v604];

              v584 = v603;
            }
            uint64_t v596 = [v847 countByEnumeratingWithState:&v878 objects:v953 count:16];
          }
          while (v596);
        }

        v605 = +[RTPlaceDataMetrics medianOf:v591];
        [v605 doubleValue];
        double v587 = v606;

        v607 = +[RTPlaceDataMetrics meanOf:v591];
        [v607 doubleValue];
        double v586 = v608;

        v609 = +[RTPlaceDataMetrics standardDeviationOf:v591];
        [v609 doubleValue];
        double v585 = v610;

        int v583 = v786 + 1;
        long long v37 = v850;
        v590 = v777;
        v588 = v781;
      }

      ++v582;
    }
    while ([v546 count] > v582);
    if (v583 > 0)
    {
      v611 = [NSNumber numberWithDouble:v587 / (double)v583];
      v612 = [(RTMetric *)v835 metrics];
      [v612 setObject:v611 forKeyedSubscript:@"median_daily_total_visit_duration_weekdays_others"];

      v613 = [NSNumber numberWithDouble:v586 / (double)v583];
      v614 = [(RTMetric *)v835 metrics];
      [v614 setObject:v613 forKeyedSubscript:@"mean_daily_total_visit_duration_weekdays_others"];

      v615 = [NSNumber numberWithDouble:v585 / (double)v583];
      v616 = [(RTMetric *)v835 metrics];
      [v616 setObject:v615 forKeyedSubscript:@"SD_daily_total_visit_duration_weekdays_others"];
    }
  }
  id v787 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v874 = 0u;
  long long v875 = 0u;
  long long v876 = 0u;
  long long v877 = 0u;
  v617 = [v837 allKeys];
  uint64_t v618 = [v617 countByEnumeratingWithState:&v874 objects:v952 count:16];
  if (v618)
  {
    uint64_t v619 = v618;
    uint64_t v620 = *(void *)v875;
    do
    {
      for (uint64_t i7 = 0; i7 != v619; ++i7)
      {
        if (*(void *)v875 != v620) {
          objc_enumerationMutation(v617);
        }
        v622 = [v837 objectForKeyedSubscript:*(void *)(*((void *)&v874 + 1) + 8 * i7)];
        v623 = [v622 valueForKeyPath:@"@max.doubleValue"];

        [v787 addObject:v623];
      }
      uint64_t v619 = [v617 countByEnumeratingWithState:&v874 objects:v952 count:16];
    }
    while (v619);
  }

  v624 = +[RTPlaceDataMetrics medianOf:v787];
  v625 = [(RTMetric *)v835 metrics];
  [v625 setObject:v624 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_home"];

  v626 = +[RTPlaceDataMetrics meanOf:v787];
  v627 = [(RTMetric *)v835 metrics];
  [v627 setObject:v626 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_home"];

  v628 = +[RTPlaceDataMetrics standardDeviationOf:v787];
  v629 = [(RTMetric *)v835 metrics];
  [v629 setObject:v628 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_home"];

  id v782 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v870 = 0u;
  long long v871 = 0u;
  long long v872 = 0u;
  long long v873 = 0u;
  v630 = v840;
  v631 = [v840 allKeys];
  uint64_t v632 = [v631 countByEnumeratingWithState:&v870 objects:v951 count:16];
  if (v632)
  {
    uint64_t v633 = v632;
    uint64_t v634 = *(void *)v871;
    do
    {
      for (uint64_t i8 = 0; i8 != v633; ++i8)
      {
        if (*(void *)v871 != v634) {
          objc_enumerationMutation(v631);
        }
        v636 = [v630 objectForKeyedSubscript:*(void *)(*((void *)&v870 + 1) + 8 * i8)];
        v637 = [v636 valueForKeyPath:@"@max.doubleValue"];

        v630 = v840;
        [v782 addObject:v637];
      }
      uint64_t v633 = [v631 countByEnumeratingWithState:&v870 objects:v951 count:16];
    }
    while (v633);
  }

  v638 = +[RTPlaceDataMetrics medianOf:v782];
  v639 = [(RTMetric *)v835 metrics];
  [v639 setObject:v638 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_home"];

  v640 = +[RTPlaceDataMetrics meanOf:v782];
  v641 = [(RTMetric *)v835 metrics];
  [v641 setObject:v640 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_home"];

  v642 = +[RTPlaceDataMetrics standardDeviationOf:v782];
  v643 = [(RTMetric *)v835 metrics];
  [v643 setObject:v642 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_home"];

  id v778 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v866 = 0u;
  long long v867 = 0u;
  long long v868 = 0u;
  long long v869 = 0u;
  v644 = v839;
  v645 = [v839 allKeys];
  uint64_t v646 = [v645 countByEnumeratingWithState:&v866 objects:v950 count:16];
  if (v646)
  {
    uint64_t v647 = v646;
    uint64_t v648 = *(void *)v867;
    do
    {
      for (uint64_t i9 = 0; i9 != v647; ++i9)
      {
        if (*(void *)v867 != v648) {
          objc_enumerationMutation(v645);
        }
        v650 = [v644 objectForKeyedSubscript:*(void *)(*((void *)&v866 + 1) + 8 * i9)];
        v651 = [v650 valueForKeyPath:@"@max.doubleValue"];

        v644 = v839;
        [v778 addObject:v651];
      }
      uint64_t v647 = [v645 countByEnumeratingWithState:&v866 objects:v950 count:16];
    }
    while (v647);
  }

  v652 = +[RTPlaceDataMetrics medianOf:v778];
  v653 = [(RTMetric *)v835 metrics];
  [v653 setObject:v652 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_work"];

  v654 = +[RTPlaceDataMetrics meanOf:v778];
  v655 = [(RTMetric *)v835 metrics];
  [v655 setObject:v654 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_work"];

  v656 = +[RTPlaceDataMetrics standardDeviationOf:v778];
  v657 = [(RTMetric *)v835 metrics];
  [v657 setObject:v656 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_work"];

  id v774 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v862 = 0u;
  long long v863 = 0u;
  long long v864 = 0u;
  long long v865 = 0u;
  v658 = v838;
  v659 = [v838 allKeys];
  uint64_t v660 = [v659 countByEnumeratingWithState:&v862 objects:v949 count:16];
  if (v660)
  {
    uint64_t v661 = v660;
    uint64_t v662 = *(void *)v863;
    do
    {
      for (uint64_t i10 = 0; i10 != v661; ++i10)
      {
        if (*(void *)v863 != v662) {
          objc_enumerationMutation(v659);
        }
        v664 = [v658 objectForKeyedSubscript:*(void *)(*((void *)&v862 + 1) + 8 * i10)];
        v665 = [v664 valueForKeyPath:@"@max.doubleValue"];

        v658 = v838;
        [v774 addObject:v665];
      }
      uint64_t v661 = [v659 countByEnumeratingWithState:&v862 objects:v949 count:16];
    }
    while (v661);
  }

  v666 = +[RTPlaceDataMetrics medianOf:v774];
  v667 = [(RTMetric *)v835 metrics];
  [v667 setObject:v666 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_work"];

  v668 = +[RTPlaceDataMetrics meanOf:v774];
  v669 = [(RTMetric *)v835 metrics];
  [v669 setObject:v668 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_work"];

  v670 = +[RTPlaceDataMetrics standardDeviationOf:v774];
  v671 = [(RTMetric *)v835 metrics];
  [v671 setObject:v670 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_work"];

  v672 = obja;
  if ([obja count])
  {
    unint64_t v673 = 0;
    int v674 = 0;
    double v675 = 0.0;
    double v676 = 0.0;
    double v677 = 0.0;
    do
    {
      v765 = (void *)MEMORY[0x1E016D870]();
      v678 = [v672 objectAtIndexedSubscript:v673];
      v679 = [v678 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];

      v761 = v679;
      if ([v679 count])
      {
        int v757 = v674;
        id v680 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v858 = 0u;
        long long v859 = 0u;
        long long v860 = 0u;
        long long v861 = 0u;
        v681 = [v672 objectAtIndexedSubscript:v673];
        v682 = [v681 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];
        v683 = [v682 allKeys];

        id v848 = v683;
        uint64_t v684 = [v683 countByEnumeratingWithState:&v858 objects:v948 count:16];
        if (v684)
        {
          uint64_t v685 = v684;
          uint64_t v686 = *(void *)v859;
          do
          {
            for (uint64_t i11 = 0; i11 != v685; ++i11)
            {
              if (*(void *)v859 != v686) {
                objc_enumerationMutation(v848);
              }
              uint64_t v688 = *(void *)(*((void *)&v858 + 1) + 8 * i11);
              v689 = [v672 objectAtIndexedSubscript:v673];
              v690 = [v689 objectForKeyedSubscript:@"dictVisitDurationWeekendOthers"];
              v691 = [v690 objectForKeyedSubscript:v688];
              v692 = [v691 valueForKeyPath:@"@max.doubleValue"];

              v672 = obja;
              [v680 addObject:v692];
            }
            uint64_t v685 = [v848 countByEnumeratingWithState:&v858 objects:v948 count:16];
          }
          while (v685);
        }

        v693 = +[RTPlaceDataMetrics medianOf:v680];
        [v693 doubleValue];
        double v677 = v694;

        v695 = +[RTPlaceDataMetrics meanOf:v680];
        [v695 doubleValue];
        double v676 = v696;

        v697 = +[RTPlaceDataMetrics standardDeviationOf:v680];
        [v697 doubleValue];
        double v675 = v698;

        int v674 = v757 + 1;
        long long v37 = v850;
      }

      ++v673;
    }
    while ([v672 count] > v673);
  }
  else
  {
    int v674 = 0;
    double v677 = 0.0;
    double v676 = 0.0;
    double v675 = 0.0;
  }
  if (v754)
  {
    double v699 = (double)v674;
    v700 = [NSNumber numberWithDouble:v677 / (double)v674];
    v701 = [(RTMetric *)v835 metrics];
    [v701 setObject:v700 forKeyedSubscript:@"median_daily_longest_visit_duration_weekend_others"];

    v702 = [NSNumber numberWithDouble:v676 / v699];
    v703 = [(RTMetric *)v835 metrics];
    [v703 setObject:v702 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekend_others"];

    v704 = [NSNumber numberWithDouble:v675 / v699];
    v705 = [(RTMetric *)v835 metrics];
    [v705 setObject:v704 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekend_others"];
  }
  if ([v672 count])
  {
    unint64_t v706 = 0;
    int v707 = 0;
    v708 = @"dictVisitDurationWeekdaysOthers";
    double v709 = 0.0;
    double v710 = 0.0;
    double v711 = 0.0;
    do
    {
      v712 = (void *)MEMORY[0x1E016D870]();
      v713 = [v672 objectAtIndexedSubscript:v706];
      v714 = [v713 objectForKeyedSubscript:v708];

      if ([v714 count])
      {
        v758 = v714;
        v762 = v712;
        int v766 = v707;
        id v715 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v854 = 0u;
        long long v855 = 0u;
        long long v856 = 0u;
        long long v857 = 0u;
        unint64_t v716 = v706;
        v717 = [v672 objectAtIndexedSubscript:v706];
        v718 = v708;
        v719 = [v717 objectForKeyedSubscript:v708];
        v720 = [v719 allKeys];

        id v849 = v720;
        uint64_t v721 = [v720 countByEnumeratingWithState:&v854 objects:v947 count:16];
        if (v721)
        {
          uint64_t v722 = v721;
          uint64_t v723 = *(void *)v855;
          do
          {
            for (uint64_t i12 = 0; i12 != v722; ++i12)
            {
              if (*(void *)v855 != v723) {
                objc_enumerationMutation(v849);
              }
              uint64_t v725 = *(void *)(*((void *)&v854 + 1) + 8 * i12);
              v726 = [v672 objectAtIndexedSubscript:v716];
              v727 = [v726 objectForKeyedSubscript:v718];
              v728 = [v727 objectForKeyedSubscript:v725];
              v729 = [v728 valueForKeyPath:@"@max.doubleValue"];

              v672 = obja;
              [v715 addObject:v729];
            }
            uint64_t v722 = [v849 countByEnumeratingWithState:&v854 objects:v947 count:16];
          }
          while (v722);
        }

        v730 = +[RTPlaceDataMetrics medianOf:v715];
        [v730 doubleValue];
        double v711 = v731;

        v732 = +[RTPlaceDataMetrics meanOf:v715];
        [v732 doubleValue];
        double v710 = v733;

        v734 = +[RTPlaceDataMetrics standardDeviationOf:v715];
        [v734 doubleValue];
        double v709 = v735;

        int v707 = v766 + 1;
        long long v37 = v850;
        v708 = v718;
        unint64_t v706 = v716;
        v714 = v758;
        v712 = v762;
      }

      ++v706;
    }
    while ([v672 count] > v706);
    if (v707 > 0)
    {
      v736 = [NSNumber numberWithDouble:v711 / (double)v707];
      v737 = [(RTMetric *)v835 metrics];
      [v737 setObject:v736 forKeyedSubscript:@"median_daily_longest_visit_duration_weekdays_others"];

      v738 = [NSNumber numberWithDouble:v710 / (double)v707];
      v739 = [(RTMetric *)v835 metrics];
      [v739 setObject:v738 forKeyedSubscript:@"mean_daily_longest_visit_duration_weekdays_others"];

      v740 = [NSNumber numberWithDouble:v709 / (double)v707];
      v741 = [(RTMetric *)v835 metrics];
      [v741 setObject:v740 forKeyedSubscript:@"SD_daily_longest_visit_duration_weekdays_others"];
    }
  }
}

- (void)setCurrentInferenceReplayableMetricsFromDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"intervalToCalculateStats"];
  id v6 = [(RTMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"intervalToCalculateStats"];

  unint64_t v7 = [v4 objectForKeyedSubscript:@"numPlacesAfterWeeksWithNonZeroDwellTimePruning"];
  id v8 = [(RTMetric *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:@"numPlacesAfterWeeksWithNonZeroDwellTimePruning"];

  id v9 = [v4 objectForKeyedSubscript:@"agreeDailyPatternsAndDwellTimeOnHome"];
  uint64_t v10 = [(RTMetric *)self metrics];
  [v10 setObject:v9 forKeyedSubscript:@"agreeDailyPatternsAndDwellTimeOnHome"];

  uint64_t v11 = [v4 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_home"];
  uint64_t v12 = [(RTMetric *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_home"];

  uint64_t v13 = [v4 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_work"];
  id v14 = [(RTMetric *)self metrics];
  [v14 setObject:v13 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_work"];

  uint64_t v15 = [v4 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_home"];
  double v16 = [(RTMetric *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_home"];

  double v17 = [v4 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_work"];
  double v18 = [(RTMetric *)self metrics];
  [v18 setObject:v17 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_work"];

  id v19 = [v4 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_home"];
  unint64_t v20 = [(RTMetric *)self metrics];
  [v20 setObject:v19 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_home"];

  double v21 = [v4 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_work"];
  double v22 = [(RTMetric *)self metrics];
  [v22 setObject:v21 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_work"];

  unint64_t v23 = [v4 objectForKeyedSubscript:@"topMedianDwellTime_home"];
  BOOL v24 = [(RTMetric *)self metrics];
  [v24 setObject:v23 forKeyedSubscript:@"topMedianDwellTime_home"];

  unint64_t v25 = [v4 objectForKeyedSubscript:@"topMedianDwellTime_work"];
  id v26 = [(RTMetric *)self metrics];
  [v26 setObject:v25 forKeyedSubscript:@"topMedianDwellTime_work"];

  id v27 = [v4 objectForKeyedSubscript:@"weeksWithNonZeroDwellTime_home"];
  id v28 = [(RTMetric *)self metrics];
  [v28 setObject:v27 forKeyedSubscript:@"weeksWithNonZeroDwellTime_home"];

  id v29 = [v4 objectForKeyedSubscript:@"weeksWithNonZeroDwellTime_work"];
  id v30 = [(RTMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"weeksWithNonZeroDwellTime_work"];

  id v31 = [v4 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"];
  uint64_t v32 = [(RTMetric *)self metrics];
  [v32 setObject:v31 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns"];

  id v33 = [v4 objectForKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"];
  unint64_t v34 = [(RTMetric *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns"];

  double v35 = [v4 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"];
  double v36 = [(RTMetric *)self metrics];
  [v36 setObject:v35 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns"];

  long long v37 = [v4 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"];
  long long v38 = [(RTMetric *)self metrics];
  [v38 setObject:v37 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns"];

  long long v39 = [v4 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"];
  uint64_t v40 = [(RTMetric *)self metrics];
  [v40 setObject:v39 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns"];

  long long v41 = [v4 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"];
  long long v42 = [(RTMetric *)self metrics];
  [v42 setObject:v41 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns"];

  uint64_t v43 = [v4 objectForKeyedSubscript:@"numPlacesAfterDailyPatternsPruning"];
  int v44 = [(RTMetric *)self metrics];
  [v44 setObject:v43 forKeyedSubscript:@"numPlacesAfterDailyPatternsPruning"];

  double v45 = [v4 objectForKeyedSubscript:@"homeRankDailyPatterns"];
  double v46 = [(RTMetric *)self metrics];
  [v46 setObject:v45 forKeyedSubscript:@"homeRankDailyPatterns"];

  uint64_t v47 = [v4 objectForKeyedSubscript:@"workRankDailyPatterns"];
  long long v48 = [(RTMetric *)self metrics];
  [v48 setObject:v47 forKeyedSubscript:@"workRankDailyPatterns"];

  long long v49 = [v4 objectForKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"];
  id v50 = [(RTMetric *)self metrics];
  [v50 setObject:v49 forKeyedSubscript:@"weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime"];

  id v51 = [v4 objectForKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"];
  uint64_t v52 = [(RTMetric *)self metrics];
  [v52 setObject:v51 forKeyedSubscript:@"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime"];

  uint64_t v53 = [v4 objectForKeyedSubscript:@"topMedianDwellTime_1stPlaceDwellTime"];
  v54 = [(RTMetric *)self metrics];
  [v54 setObject:v53 forKeyedSubscript:@"topMedianDwellTime_1stPlaceDwellTime"];

  uint64_t v55 = [v4 objectForKeyedSubscript:@"homeRankDwellTime"];
  v56 = [(RTMetric *)self metrics];
  [v56 setObject:v55 forKeyedSubscript:@"homeRankDwellTime"];

  id v58 = [v4 objectForKeyedSubscript:@"workRankDwellTime"];

  id v57 = [(RTMetric *)self metrics];
  [v57 setObject:v58 forKeyedSubscript:@"workRankDwellTime"];
}

+ (id)generateDictionaryOfOldMetricsWithLearnedLocationStore:(id)a3 locationsOfInterest:(id)a4 homeMapItem:(id)a5 workMapItem:(id)a6 locationsOfOthers:(id *)a7
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  id v205 = a3;
  id v10 = a4;
  id v204 = a5;
  id v199 = a6;
  id v196 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v200 = [MEMORY[0x1E4F1CA48] array];
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  id v11 = v10;
  uint64_t v209 = [v11 countByEnumeratingWithState:&v238 objects:v251 count:16];
  if (v209)
  {
    id v12 = 0;
    v229 = 0;
    uint64_t v206 = *(void *)v239;
    id v203 = v11;
    do
    {
      for (uint64_t i = 0; i != v209; ++i)
      {
        if (*(void *)v239 != v206) {
          objc_enumerationMutation(v11);
        }
        id v14 = *(void **)(*((void *)&v238 + 1) + 8 * i);
        uint64_t v15 = [v14 place];
        double v16 = [v15 mapItem];
        double v17 = [v16 location];

        if (v17)
        {
          double v18 = [v15 mapItem];
          char v19 = [v18 isEqualToMapItem:v204];

          id v20 = v12;
          if (v19)
          {
            uint64_t v21 = 1;
          }
          else
          {
            unint64_t v23 = [v15 mapItem];
            char v24 = [v23 isEqualToMapItem:v199];

            if (v24)
            {
              uint64_t v21 = 2;
            }
            else
            {
              unint64_t v25 = [v15 mapItem];
              id v26 = [v25 location];
              [v196 addObject:v26];

              uint64_t v21 = 0;
            }
          }
          uint64_t v221 = i;
          id v27 = [v14 visits];
          id v28 = [[RTLearnedPlaceTypeInferencePlaceStats alloc] initWithLearnedLocationStore:v205 place:v15 visits:v27];
          id v29 = [RTPlaceStatsAndType alloc];
          id v30 = [v15 identifier];
          v215 = v28;
          uint64_t v31 = [(RTPlaceStatsAndType *)v29 initWithPlaceStats:v28 type:v21 placeIdentifier:v30];

          if (v31) {
            [v200 addObject:v31];
          }
          v218 = v15;
          long long v236 = 0u;
          long long v237 = 0u;
          long long v234 = 0u;
          long long v235 = 0u;
          obuint64_t j = v27;
          uint64_t v32 = [obj countByEnumeratingWithState:&v234 objects:v248 count:16];
          id v12 = v20;
          double v212 = (void *)v31;
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v227 = *(void *)v235;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v235 != v227) {
                  objc_enumerationMutation(obj);
                }
                double v35 = *(void **)(*((void *)&v234 + 1) + 8 * j);
                if (!v12)
                {
                  id v12 = v35;

                  v229 = v12;
                }
                double v36 = [v35 entryDate];
                long long v37 = [v12 entryDate];
                long long v38 = [v36 earlierDate:v37];
                long long v39 = [v35 entryDate];
                int v40 = [v38 isEqualToDate:v39];

                if (v40)
                {
                  id v41 = v35;
                }
                else
                {
                  id v41 = v12;
                }
                long long v42 = [v35 exitDate];
                uint64_t v43 = [v229 exitDate];
                int v44 = [v42 laterDate:v43];
                double v45 = [v35 exitDate];
                int v46 = [v44 isEqualToDate:v45];

                if (v46)
                {
                  id v47 = v35;

                  v229 = v47;
                }
                id v12 = v41;
              }
              uint64_t v33 = [obj countByEnumeratingWithState:&v234 objects:v248 count:16];
            }
            while (v33);
          }
          double v22 = obj;

          id v11 = v203;
          uint64_t v15 = v218;
          uint64_t i = v221;
        }
        else
        {
          double v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v250 = v15;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "Place with incomplete mapItem. Place: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v209 = [v11 countByEnumeratingWithState:&v238 objects:v251 count:16];
    }
    while (v209);

    if (!v12 || !v229)
    {
      double v190 = 0.0;
      goto LABEL_39;
    }
    long long v48 = [v229 exitDate];
    long long v49 = [v12 entryDate];
    [v48 timeIntervalSinceDate:v49];
    double v190 = v50;
  }
  else
  {
    v229 = 0;
    id v12 = 0;
    double v190 = 0.0;
    long long v48 = v11;
  }

LABEL_39:
  v194 = v12;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id v51 = v200;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v230 objects:v247 count:16];
  double v219 = -1.0;
  if (!v52)
  {
    double v54 = -1.0;
    uint64_t v57 = -1;
    double v55 = -1.0;
    uint64_t v58 = -1;
    double v59 = -1.0;
    double v60 = -1.0;
    double v61 = -1.0;
    double v62 = -1.0;
    double v63 = -1.0;
    double v64 = -1.0;
    goto LABEL_53;
  }
  uint64_t v53 = v52;
  double v54 = -1.0;
  double v55 = -1.0;
  uint64_t v56 = *(void *)v231;
  uint64_t v57 = -1;
  uint64_t v58 = -1;
  double v59 = -1.0;
  double v60 = -1.0;
  double v61 = -1.0;
  double v62 = -1.0;
  double v63 = -1.0;
  double v64 = -1.0;
  do
  {
    for (uint64_t k = 0; k != v53; ++k)
    {
      if (*(void *)v231 != v56) {
        objc_enumerationMutation(v51);
      }
      v66 = *(void **)(*((void *)&v230 + 1) + 8 * k);
      v67 = [v66 placeStats];
      uint64_t v68 = [v66 type];
      if (v68 == 2)
      {
        v78 = [v67 stats];
        [v78 weeklyAggregateDwellTimeBetweenDateRangeAverage];
        double v63 = v79;

        v80 = [v67 stats];
        [v80 weeklyTotalDailyVisitCountAverage];
        double v61 = v81;

        v82 = [v67 stats];
        [v82 weeklyDaysWithNonZeroDwellTimeAverage];
        double v59 = v83;

        v84 = [v67 stats];
        [v84 topMedianDwellTime];
        double v54 = v85;

        v77 = [v67 stats];
        uint64_t v57 = [v77 weeksWithNonZeroDwellTime];
      }
      else
      {
        if (v68 != 1) {
          goto LABEL_49;
        }
        double v69 = [v67 stats];
        [v69 weeklyAggregateDwellTimeBetweenDateRangeAverage];
        double v64 = v70;

        id v71 = [v67 stats];
        [v71 weeklyTotalDailyVisitCountAverage];
        double v62 = v72;

        v73 = [v67 stats];
        [v73 weeklyDaysWithNonZeroDwellTimeAverage];
        double v60 = v74;

        v75 = [v67 stats];
        [v75 topMedianDwellTime];
        double v55 = v76;

        v77 = [v67 stats];
        uint64_t v58 = [v77 weeksWithNonZeroDwellTime];
      }

LABEL_49:
    }
    uint64_t v53 = [v51 countByEnumeratingWithState:&v230 objects:v247 count:16];
  }
  while (v53);
LABEL_53:

  v86 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_30];
  [v51 filterUsingPredicate:v86];

  uint64_t v87 = [v51 count];
  uint64_t v88 = v87;
  if (v87 < 2)
  {
    uint64_t v107 = 0;
    double v192 = -1.0;
    double v189 = -1.0;
    uint64_t v108 = -1;
    uint64_t v109 = -1;
    uint64_t v193 = -1;
    uint64_t v228 = -1;
    uint64_t v110 = -1;
    double v207 = -1.0;
    double v210 = -1.0;
    double v197 = -1.0;
    double v213 = -1.0;
    double v216 = -1.0;
    double v201 = -1.0;
  }
  else
  {
    uint64_t v183 = v87;
    v187 = [NSString stringWithFormat:@"%@.%@.%@", @"placeStats", @"stats", @"weeklyDaysWithNonZeroDwellTimeAverage"];
    uint64_t v89 = [NSString stringWithFormat:@"%@.%@.%@", @"placeStats", @"stats", @"weeklyAggregateDwellTimeBetweenDateRangeAverage"];
    uint64_t v90 = [NSString stringWithFormat:@"%@.%@.%@", @"placeStats", @"stats", @"weeklyTotalDailyVisitCountAverage"];
    v91 = (void *)MEMORY[0x1E4F28BA0];
    char v92 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", v89, &unk_1F34537F8];
    v246[0] = v92;
    v179 = (void *)v90;
    id v93 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", v90, &unk_1F3453808];
    v246[1] = v93;
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v246 count:2];
    uint64_t v95 = [v91 andPredicateWithSubpredicates:v94];

    v96 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v187 ascending:0];
    v245[0] = v96;
    double v181 = (void *)v89;
    v97 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v89 ascending:0];
    v245[1] = v97;
    uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v245 count:2];

    double v177 = (void *)v95;
    v99 = [v51 filteredArrayUsingPredicate:v95];
    v175 = (void *)v98;
    v100 = [v99 sortedArrayUsingDescriptors:v98];

    uint64_t v185 = [v100 count];
    if ([v100 count])
    {
      unint64_t v101 = 0;
      uint64_t v222 = -1;
      uint64_t obja = -1;
      do
      {
        v102 = [v100 objectAtIndexedSubscript:v101];
        uint64_t v103 = [v102 type];

        if (v103 == 1)
        {
          uint64_t v222 = ++v101;
        }
        else
        {
          v104 = [v100 objectAtIndexedSubscript:v101];
          uint64_t v105 = [v104 type];

          unint64_t v106 = obja;
          if (v105 == 2) {
            unint64_t v106 = v101 + 1;
          }
          uint64_t obja = v106;
          ++v101;
        }
      }
      while ([v100 count] > v101);
    }
    else
    {
      uint64_t v222 = -1;
      uint64_t obja = -1;
    }
    double v207 = -1.0;
    double v210 = -1.0;
    double v213 = -1.0;
    double v216 = -1.0;
    if ([v100 count])
    {
      v111 = [v100 objectAtIndexedSubscript:0];
      unint64_t v112 = [v111 placeStats];
      v113 = [v112 stats];
      [v113 weeklyAggregateDwellTimeBetweenDateRangeAverage];
      double v216 = v114;

      v115 = [v100 objectAtIndexedSubscript:0];
      uint64_t v116 = [v115 placeStats];
      v117 = [v116 stats];
      [v117 weeklyTotalDailyVisitCountAverage];
      double v213 = v118;

      double v119 = [v100 objectAtIndexedSubscript:0];
      double v120 = [v119 placeStats];
      v121 = [v120 stats];
      [v121 weeklyDaysWithNonZeroDwellTimeAverage];
      double v210 = v122;
    }
    double v197 = -1.0;
    double v201 = -1.0;
    if ((unint64_t)[v100 count] >= 2)
    {
      v123 = [v100 objectAtIndexedSubscript:1];
      double v124 = [v123 placeStats];
      v125 = [v124 stats];
      [v125 weeklyAggregateDwellTimeBetweenDateRangeAverage];
      double v201 = v126;

      v127 = [v100 objectAtIndexedSubscript:1];
      v128 = [v127 placeStats];
      v129 = [v128 stats];
      [v129 weeklyTotalDailyVisitCountAverage];
      double v197 = v130;

      v131 = [v100 objectAtIndexedSubscript:1];
      v132 = [v131 placeStats];
      v133 = [v132 stats];
      [v133 weeklyDaysWithNonZeroDwellTimeAverage];
      double v207 = v134;
    }
    v173 = [NSString stringWithFormat:@"%@.%@.%@", @"placeStats", @"stats", @"topMedianDwellTime"];
    v135 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:ascending:];
    int v244 = v135;
    v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:1];
    v137 = [v51 sortedArrayUsingDescriptors:v136];

    if ([v137 count])
    {
      unint64_t v138 = 0;
      uint64_t v228 = -1;
      uint64_t v139 = -1;
      do
      {
        v140 = [v137 objectAtIndexedSubscript:v138];
        uint64_t v141 = [v140 type];

        if (v141 == 1)
        {
          uint64_t v139 = ++v138;
        }
        else
        {
          v142 = [v137 objectAtIndexedSubscript:v138];
          uint64_t v143 = [v142 type];

          unint64_t v144 = v228;
          if (v143 == 2) {
            unint64_t v144 = v138 + 1;
          }
          uint64_t v228 = v144;
          ++v138;
        }
      }
      while ([v137 count] > v138);
    }
    else
    {
      uint64_t v139 = -1;
      uint64_t v228 = -1;
    }
    uint64_t v193 = v139;
    if ([v137 count])
    {
      double v220 = [v100 firstObject];
      v145 = [v220 placeIdentifier];
      v146 = [v137 firstObject];
      v147 = [v146 placeIdentifier];
      uint64_t v107 = [v145 isEqual:v147];

      v148 = [v137 firstObject];
      v149 = [v148 placeStats];
      v150 = [v149 stats];
      [v150 weeklyTotalDailyVisitCountAverage];
      double v219 = v151;

      v152 = [v137 firstObject];
      v153 = [v152 placeStats];
      v154 = [v153 stats];
      [v154 weeklyDaysWithNonZeroDwellTimeAverage];
      double v192 = v155;

      v156 = [v137 firstObject];
      v157 = [v156 placeStats];
      char v158 = [v157 stats];
      [v158 topMedianDwellTime];
      double v189 = v159;
    }
    else
    {
      uint64_t v107 = 0;
      double v219 = -1.0;
      double v192 = -1.0;
      double v189 = -1.0;
    }
    uint64_t v108 = v222;
    uint64_t v109 = obja;

    uint64_t v88 = v183;
    uint64_t v110 = v185;
  }
  v242[0] = @"intervalToCalculateStats";
  id objb = [NSNumber numberWithDouble:v190];
  v243[0] = objb;
  v242[1] = @"numPlacesAfterWeeksWithNonZeroDwellTimePruning";
  double v223 = [NSNumber numberWithInteger:v88];
  v243[1] = v223;
  v242[2] = @"agreeDailyPatternsAndDwellTimeOnHome";
  v191 = [NSNumber numberWithBool:v107];
  v243[2] = v191;
  v242[3] = @"weeklyAggregateDwellTimeBetweenDateRangeAverage_home";
  v188 = [NSNumber numberWithDouble:v64];
  v243[3] = v188;
  v242[4] = @"weeklyAggregateDwellTimeBetweenDateRangeAverage_work";
  v186 = [NSNumber numberWithDouble:v63];
  v243[4] = v186;
  v242[5] = @"weeklyTotalDailyVisitCountAverage_home";
  v184 = [NSNumber numberWithDouble:v62];
  v243[5] = v184;
  v242[6] = @"weeklyTotalDailyVisitCountAverage_work";
  v182 = [NSNumber numberWithDouble:v61];
  v243[6] = v182;
  v242[7] = @"weeklyDaysWithNonZeroDwellTimeAverage_home";
  v180 = [NSNumber numberWithDouble:v60];
  v243[7] = v180;
  v242[8] = @"weeklyDaysWithNonZeroDwellTimeAverage_work";
  double v178 = [NSNumber numberWithDouble:v59];
  v243[8] = v178;
  v242[9] = @"topMedianDwellTime_home";
  v176 = [NSNumber numberWithDouble:v55];
  v243[9] = v176;
  v242[10] = @"topMedianDwellTime_work";
  v174 = [NSNumber numberWithDouble:v54];
  v243[10] = v174;
  v242[11] = @"weeksWithNonZeroDwellTime_home";
  double v172 = [NSNumber numberWithInteger:v58];
  v243[11] = v172;
  v242[12] = @"weeksWithNonZeroDwellTime_work";
  int v171 = [NSNumber numberWithInteger:v57];
  v243[12] = v171;
  v242[13] = @"weeklyAggregateDwellTimeBetweenDateRangeAverage_1stPlaceDailyPatterns";
  v217 = [NSNumber numberWithDouble:v216];
  v243[13] = v217;
  v242[14] = @"weeklyAggregateDwellTimeBetweenDateRangeAverage_2ndPlaceDailyPatterns";
  double v202 = [NSNumber numberWithDouble:v201];
  v243[14] = v202;
  v242[15] = @"weeklyTotalDailyVisitCountAverage_1stPlaceDailyPatterns";
  v214 = [NSNumber numberWithDouble:v213];
  v243[15] = v214;
  v242[16] = @"weeklyTotalDailyVisitCountAverage_2ndPlaceDailyPatterns";
  v198 = [NSNumber numberWithDouble:v197];
  v243[16] = v198;
  v242[17] = @"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDailyPatterns";
  v211 = [NSNumber numberWithDouble:v210];
  v243[17] = v211;
  v242[18] = @"weeklyDaysWithNonZeroDwellTimeAverage_2ndPlaceDailyPatterns";
  double v208 = [NSNumber numberWithDouble:v207];
  v243[18] = v208;
  v242[19] = @"numPlacesAfterDailyPatternsPruning";
  unint64_t v170 = [NSNumber numberWithInteger:v110];
  v243[19] = v170;
  v242[20] = @"homeRankDailyPatterns";
  v160 = [NSNumber numberWithInteger:v108];
  v243[20] = v160;
  v242[21] = @"workRankDailyPatterns";
  v161 = [NSNumber numberWithInteger:v109];
  v243[21] = v161;
  v242[22] = @"weeklyTotalDailyVisitCountAverage_1stPlaceDwellTime";
  v162 = [NSNumber numberWithDouble:v219];
  v243[22] = v162;
  v242[23] = @"weeklyDaysWithNonZeroDwellTimeAverage_1stPlaceDwellTime";
  v163 = [NSNumber numberWithDouble:v192];
  v243[23] = v163;
  v242[24] = @"topMedianDwellTime_1stPlaceDwellTime";
  v164 = [NSNumber numberWithDouble:v189];
  v243[24] = v164;
  v242[25] = @"homeRankDwellTime";
  v165 = [NSNumber numberWithInteger:v193];
  v243[25] = v165;
  v242[26] = @"workRankDwellTime";
  v166 = [NSNumber numberWithInteger:v228];
  v243[26] = v166;
  v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:v242 count:27];

  id v168 = v196;
  *a7 = v168;

  return v167;
}

BOOL __139__RTPlaceDataMetrics_generateDictionaryOfOldMetricsWithLearnedLocationStore_locationsOfInterest_homeMapItem_workMapItem_locationsOfOthers___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 placeStats];
  uint64_t v3 = [v2 stats];
  BOOL v4 = (double)[v3 weeksWithNonZeroDwellTime] / 5.0 > 0.6;

  return v4;
}

+ (id)labelAnEventInterval:(id)a3 basedOnIntervalDict:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = a4;
  obuint64_t j = [v24 allKeys];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    id v6 = @"Unknown";
    double v7 = 0.0;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v10 = [v24 objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [v5 intersectionWithDateInterval:*(void *)(*((void *)&v27 + 1) + 8 * i)];
              double v16 = [v15 endDate];
              double v17 = [v15 startDate];
              [v16 timeIntervalSinceDate:v17];
              double v19 = v18;

              if (v19 > v7)
              {
                id v20 = v9;

                double v7 = v19;
                id v6 = v20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }
  else
  {
    id v6 = @"Unknown";
  }

  return v6;
}

+ (id)calculateMLFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 createBucketedFeatures:(BOOL)a6
{
  BOOL v486 = a6;
  uint64_t v596 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v491 = a5;
  id v525 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = (void *)MEMORY[0x1E4F28F60];
  v581[0] = MEMORY[0x1E4F143A8];
  v581[1] = 3221225472;
  v581[2] = __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke;
  v581[3] = &unk_1E6B94680;
  id v492 = v9;
  id v582 = v492;
  v518 = [v10 predicateWithBlock:v581];
  uint64_t v11 = objc_opt_new();
  long long v580 = 0u;
  long long v579 = 0u;
  long long v578 = 0u;
  long long v577 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v577 objects:v595 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v578;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v578 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v577 + 1) + 8 * i);
        double v17 = [v12 objectForKeyedSubscript:v16];
        double v18 = [v17 filteredArrayUsingPredicate:v518];
        [v11 setObject:v18 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v577 objects:v595 count:16];
    }
    while (v13);
  }

  id v508 = v11;
  if ([v508 count] && objc_msgSend(v492, "compare:", v491) != 1)
  {
    long long v576 = 0u;
    long long v575 = 0u;
    long long v574 = 0u;
    long long v573 = 0u;
    double v19 = [v508 allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v573 objects:v594 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v574;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v574 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v573 + 1) + 8 * j);
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v525 setObject:v24 forKeyedSubscript:v23];

          uint64_t v25 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v26 = [v25 numberWithDouble:];
          long long v27 = [v525 objectForKeyedSubscript:v23];
          [v27 setObject:v26 forKeyedSubscript:@"percentage_of_days_with_charging"];

          long long v28 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v29 = [v28 numberWithDouble:];
          long long v30 = [v525 objectForKeyedSubscript:v23];
          [v30 setObject:v29 forKeyedSubscript:@"median_daily_total_charging_duration"];

          long long v31 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v32 = [v31 numberWithDouble:];
          long long v33 = [v525 objectForKeyedSubscript:v23];
          [v33 setObject:v32 forKeyedSubscript:@"mean_daily_total_charging_duration"];

          long long v34 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v35 = [v34 numberWithDouble:];
          double v36 = [v525 objectForKeyedSubscript:v23];
          [v36 setObject:v35 forKeyedSubscript:@"SD_daily_total_charging_duration"];

          uint64_t v37 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v38 = [v37 numberWithDouble:];
          long long v39 = [v525 objectForKeyedSubscript:v23];
          [v39 setObject:v38 forKeyedSubscript:@"median_daily_longest_charging_duration"];

          int v40 = NSNumber;
          [&unk_1F3453718 doubleValue];
          id v41 = [v40 numberWithDouble:];
          long long v42 = [v525 objectForKeyedSubscript:v23];
          [v42 setObject:v41 forKeyedSubscript:@"mean_daily_longest_charging_duration"];

          uint64_t v43 = NSNumber;
          [&unk_1F3453718 doubleValue];
          int v44 = [v43 numberWithDouble:];
          double v45 = [v525 objectForKeyedSubscript:v23];
          [v45 setObject:v44 forKeyedSubscript:@"SD_daily_longest_charging_duration"];

          int v46 = NSNumber;
          [&unk_1F3453718 doubleValue];
          id v47 = [v46 numberWithDouble:];
          long long v48 = [v525 objectForKeyedSubscript:v23];
          [v48 setObject:v47 forKeyedSubscript:@"percentage_of_days_with_staticMotion"];

          long long v49 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v50 = [v49 numberWithDouble:];
          id v51 = [v525 objectForKeyedSubscript:v23];
          [v51 setObject:v50 forKeyedSubscript:@"median_daily_total_static_motion_duration"];

          uint64_t v52 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v53 = [v52 numberWithDouble:];
          double v54 = [v525 objectForKeyedSubscript:v23];
          [v54 setObject:v53 forKeyedSubscript:@"mean_daily_total_static_motion_duration"];

          double v55 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v56 = [v55 numberWithDouble:];
          uint64_t v57 = [v525 objectForKeyedSubscript:v23];
          [v57 setObject:v56 forKeyedSubscript:@"SD_daily_total_static_motion_duration"];

          uint64_t v58 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v59 = [v58 numberWithDouble:];
          double v60 = [v525 objectForKeyedSubscript:v23];
          [v60 setObject:v59 forKeyedSubscript:@"median_daily_longest_static_motion_duration"];

          double v61 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v62 = [v61 numberWithDouble:];
          double v63 = [v525 objectForKeyedSubscript:v23];
          [v63 setObject:v62 forKeyedSubscript:@"mean_daily_longest_static_motion_duration"];

          double v64 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v65 = [v64 numberWithDouble:x0];
          v66 = [v525 objectForKeyedSubscript:v23];
          [v66 setObject:v65 forKeyedSubscript:@"SD_daily_longest_static_motion_duration"];

          v67 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v68 = [v67 numberWithDouble:];
          double v69 = [v525 objectForKeyedSubscript:v23];
          [v69 setObject:v68 forKeyedSubscript:@"percentage_of_days_with_screenLock"];

          double v70 = NSNumber;
          [&unk_1F3453718 doubleValue];
          id v71 = [v70 numberWithDouble:];
          double v72 = [v525 objectForKeyedSubscript:v23];
          [v72 setObject:v71 forKeyedSubscript:@"median_daily_total_screen_lock_duration"];

          v73 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v74 = [v73 numberWithDouble:];
          v75 = [v525 objectForKeyedSubscript:v23];
          [v75 setObject:v74 forKeyedSubscript:@"mean_daily_total_screen_lock_duration"];

          double v76 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v77 = [v76 numberWithDouble:x0];
          v78 = [v525 objectForKeyedSubscript:v23];
          [v78 setObject:v77 forKeyedSubscript:@"SD_daily_total_screen_lock_duration"];

          double v79 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v80 = [v79 numberWithDouble:x0];
          double v81 = [v525 objectForKeyedSubscript:v23];
          [v81 setObject:v80 forKeyedSubscript:@"median_daily_longest_screen_lock_duration"];

          v82 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v83 = [v82 numberWithDouble:];
          v84 = [v525 objectForKeyedSubscript:v23];
          [v84 setObject:v83 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];

          double v85 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v86 = [v85 numberWithDouble:];
          uint64_t v87 = [v525 objectForKeyedSubscript:v23];
          [v87 setObject:v86 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];

          uint64_t v88 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v89 = [v88 numberWithDouble:];
          uint64_t v90 = [v525 objectForKeyedSubscript:v23];
          [v90 setObject:v89 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];

          v91 = NSNumber;
          [&unk_1F3453718 doubleValue];
          char v92 = [v91 numberWithDouble:];
          id v93 = [v525 objectForKeyedSubscript:v23];
          [v93 setObject:v92 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];

          v94 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v95 = [v94 numberWithDouble:];
          v96 = [v525 objectForKeyedSubscript:v23];
          [v96 setObject:v95 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];

          v97 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v98 = [v97 numberWithDouble:];
          v99 = [v525 objectForKeyedSubscript:v23];
          [v99 setObject:v98 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];

          v100 = NSNumber;
          [&unk_1F3453718 doubleValue];
          unint64_t v101 = [v100 numberWithDouble:];
          v102 = [v525 objectForKeyedSubscript:v23];
          [v102 setObject:v101 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];

          uint64_t v103 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v104 = [v103 numberWithDouble:x0];
          uint64_t v105 = [v525 objectForKeyedSubscript:v23];
          [v105 setObject:v104 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];

          unint64_t v106 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v107 = [v106 numberWithDouble:];
          uint64_t v108 = [v525 objectForKeyedSubscript:v23];
          [v108 setObject:v107 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];

          uint64_t v109 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v110 = [v109 numberWithDouble:];
          v111 = [v525 objectForKeyedSubscript:v23];
          [v111 setObject:v110 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];

          unint64_t v112 = objc_opt_new();
          v113 = [v525 objectForKeyedSubscript:v23];
          [v113 setObject:v112 forKeyedSubscript:@"eventHappenedArray"];

          double v114 = objc_opt_new();
          v115 = [v525 objectForKeyedSubscript:v23];
          [v115 setObject:v114 forKeyedSubscript:@"eventLongestArray"];

          uint64_t v116 = objc_opt_new();
          v117 = [v525 objectForKeyedSubscript:v23];
          [v117 setObject:v116 forKeyedSubscript:@"eventTotalArray"];

          double v118 = objc_opt_new();
          double v119 = [v525 objectForKeyedSubscript:v23];
          [v119 setObject:v118 forKeyedSubscript:@"wifiStabilityArray"];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v573 objects:v594 count:16];
      }
      while (v20);
    }

    v487 = objc_opt_new();
    v478 = [[RTDuetKnowledgeStream alloc] initWithDuetKnowledgeStore:v487 streamType:0];
    v477 = [[RTDuetKnowledgeStream alloc] initWithDuetKnowledgeStore:v487 streamType:2];
    v476 = [[RTDuetKnowledgeStream alloc] initWithDuetKnowledgeStore:v487 streamType:1];
    uint64_t v475 = [[RTDuetKnowledgeStream alloc] initWithDuetKnowledgeStore:v487 streamType:3];
    double v120 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"Charging" secondObject:v478];
    v593[0] = v120;
    v121 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"StaticMotion" secondObject:v477];
    v593[1] = v121;
    double v122 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"ScreenLock" secondObject:v476];
    v593[2] = v122;
    v123 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"WiFiConnection" secondObject:v475];
    v593[3] = v123;
    double v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v593 count:4];

    v489 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v490 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    id v488 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    double v482 = [v491 dateByAddingTimeInterval:-2419200.0];
    long long v572 = 0u;
    long long v570 = 0u;
    long long v571 = 0u;
    long long v569 = 0u;
    obuint64_t j = v124;
    uint64_t v484 = [obj countByEnumeratingWithState:&v569 objects:v592 count:16];
    if (v484)
    {
      uint64_t v474 = *(void *)v570;
      do
      {
        uint64_t v125 = 0;
        do
        {
          if (*(void *)v570 != v474)
          {
            uint64_t v126 = v125;
            objc_enumerationMutation(obj);
            uint64_t v125 = v126;
          }
          uint64_t v479 = v125;
          v127 = *(void **)(*((void *)&v569 + 1) + 8 * v125);
          double v480 = (void *)MEMORY[0x1E016D870]();
          v509 = [v127 firstObject];
          v483 = [v127 secondObject];
          [v490 setDay:0];
          v128 = [v489 dateByAddingComponents:v490 toDate:v492 options:0];
          [v488 setDay:0];
          v499 = [v489 dateByAddingComponents:v488 toDate:v492 options:0];
          v129 = [v499 earlierDate:v491];
          BOOL v130 = v129 == v499;

          if (v130)
          {
            while (1)
            {
              uint64_t v473 = (void *)MEMORY[0x1E016D870]();
              [v488 setDay:[v488 day] + 3];
              v485 = [v489 dateByAddingComponents:v488 toDate:v492 options:0];
              uint64_t v494 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v499 endDate:v485];
              uint64_t v563 = 0;
              uint64_t v564 = &v563;
              uint64_t v565 = 0x3032000000;
              v566 = __Block_byref_object_copy__41;
              v567 = __Block_byref_object_dispose__41;
              id v568 = (id)objc_opt_new();
              uint64_t v193 = [v494 endDate];
              v194 = [v482 earlierDate:v193];
              BOOL v195 = v194 == v482;

              if (v195)
              {
                v562[0] = MEMORY[0x1E4F143A8];
                v562[1] = 3221225472;
                v562[2] = __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke_1689;
                v562[3] = &unk_1E6B946A8;
                v562[4] = &v563;
                [v483 enumerateEventsWithinDateInterval:v494 usingBlock:v562];
              }
              int v496 = 1;
              while (1)
              {
                id v196 = [v128 earlierDate:v491];
                uint64_t v520 = v128;
                BOOL v197 = v196 == v128;

                if (!v197) {
                  break;
                }
                [v490 setDay:[v490 day] + 1];
                uint64_t v198 = [v489 dateByAddingComponents:v490 toDate:v492 options:0];
                v523 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v128 endDate:v198];
                contexta = objc_opt_new();
                v498 = (void *)v198;
                long long v560 = 0u;
                long long v561 = 0u;
                long long v558 = 0u;
                long long v559 = 0u;
                id v199 = (id)v564[5];
                uint64_t v200 = [v199 countByEnumeratingWithState:&v558 objects:v591 count:16];
                if (v200)
                {
                  uint64_t v201 = *(void *)v559;
                  do
                  {
                    for (uint64_t k = 0; k != v200; ++k)
                    {
                      if (*(void *)v559 != v201) {
                        objc_enumerationMutation(v199);
                      }
                      id v203 = *(void **)(*((void *)&v558 + 1) + 8 * k);
                      id v204 = [v203 startDate];
                      id v205 = [v520 earlierDate:v204];
                      if (v205 == v520)
                      {
                        uint64_t v206 = [v203 startDate];
                        double v207 = [v206 earlierDate:v498];
                        double v208 = [v203 startDate];
                        BOOL v209 = v207 == v208;

                        if (v209) {
                          [contexta addObject:v203];
                        }
                      }
                      else
                      {
                      }
                    }
                    uint64_t v200 = [v199 countByEnumeratingWithState:&v558 objects:v591 count:16];
                  }
                  while (v200);
                }

                if ([contexta count])
                {
                  long long v552 = 0uLL;
                  long long v553 = 0uLL;
                  long long v550 = 0uLL;
                  long long v551 = 0uLL;
                  double v210 = [v525 allKeys];
                  uint64_t v211 = [v210 countByEnumeratingWithState:&v550 objects:v589 count:16];
                  if (v211)
                  {
                    uint64_t v212 = *(void *)v551;
                    do
                    {
                      for (uint64_t m = 0; m != v211; ++m)
                      {
                        if (*(void *)v551 != v212) {
                          objc_enumerationMutation(v210);
                        }
                        uint64_t v214 = *(void *)(*((void *)&v550 + 1) + 8 * m);
                        v215 = [v525 objectForKeyedSubscript:v214];
                        [v215 setObject:&unk_1F34537E8 forKeyedSubscript:@"eventTotalDaily"];

                        double v216 = [v525 objectForKeyedSubscript:v214];
                        [v216 setObject:&unk_1F34537E8 forKeyedSubscript:@"eventLongestDaily"];

                        v217 = [v525 objectForKeyedSubscript:v214];
                        [v217 setObject:&unk_1F34537E8 forKeyedSubscript:@"wifiTotalDaily"];

                        v218 = [v525 objectForKeyedSubscript:v214];
                        [v218 setObject:&unk_1F34537E8 forKeyedSubscript:@"visitTotalDaily"];
                      }
                      uint64_t v211 = [v210 countByEnumeratingWithState:&v550 objects:v589 count:16];
                    }
                    while (v211);
                  }

                  long long v548 = 0u;
                  long long v549 = 0u;
                  long long v546 = 0u;
                  long long v547 = 0u;
                  id v513 = contexta;
                  uint64_t v219 = [v513 countByEnumeratingWithState:&v546 objects:v588 count:16];
                  if (v219)
                  {
                    uint64_t v516 = *(void *)v547;
                    do
                    {
                      for (uint64_t n = 0; n != v219; ++n)
                      {
                        if (*(void *)v547 != v516) {
                          objc_enumerationMutation(v513);
                        }
                        uint64_t v221 = *(void **)(*((void *)&v546 + 1) + 8 * n);
                        uint64_t v222 = (void *)MEMORY[0x1E016D870]();
                        double v223 = [a1 labelAnEventInterval:v221 basedOnIntervalDict:v508];
                        double v224 = [v508 objectForKeyedSubscript:v223];

                        if (v224)
                        {
                          double v225 = NSNumber;
                          double v226 = [v525 objectForKeyedSubscript:v223];
                          uint64_t v227 = [v226 objectForKeyedSubscript:@"eventTotalDaily"];
                          [v227 doubleValue];
                          double v229 = v228;
                          [v221 duration];
                          long long v231 = [v225 numberWithDouble:v229 + v230];
                          long long v232 = [v525 objectForKeyedSubscript:v223];
                          [v232 setObject:v231 forKeyedSubscript:@"eventTotalDaily"];

                          [v221 duration];
                          double v234 = v233;
                          long long v235 = [v525 objectForKeyedSubscript:v223];
                          long long v236 = [v235 objectForKeyedSubscript:@"eventLongestDaily"];
                          [v236 doubleValue];
                          BOOL v238 = v234 > v237;

                          if (v238)
                          {
                            long long v239 = NSNumber;
                            [v221 duration];
                            long long v240 = [v239 numberWithDouble:];
                            long long v241 = [v525 objectForKeyedSubscript:v223];
                            [v241 setObject:v240 forKeyedSubscript:@"eventLongestDaily"];
                          }
                          if ([v509 isEqual:@"WiFiConnection"])
                          {
                            int v242 = [v523 intersectionWithDateInterval:v221];
                            int v243 = v242;
                            if (v242)
                            {
                              int v244 = [v242 endDate];
                              int v245 = [v243 startDate];
                              [v244 timeIntervalSinceDate:v245];
                              double v247 = v246;

                              v248 = NSNumber;
                              v249 = [v525 objectForKeyedSubscript:v223];
                              v250 = [v249 objectForKeyedSubscript:@"wifiTotalDaily"];
                              [v250 doubleValue];
                              uint64_t v252 = [v248 numberWithDouble:v247 + v251];
                              v253 = [v525 objectForKeyedSubscript:v223];
                              [v253 setObject:v252 forKeyedSubscript:@"wifiTotalDaily"];
                            }
                          }
                        }
                      }
                      uint64_t v219 = [v513 countByEnumeratingWithState:&v546 objects:v588 count:16];
                    }
                    while (v219);
                  }

                  long long v544 = 0u;
                  long long v545 = 0u;
                  long long v542 = 0u;
                  long long v543 = 0u;
                  v254 = [v525 allKeys];
                  uint64_t v255 = [v254 countByEnumeratingWithState:&v542 objects:v587 count:16];
                  if (v255)
                  {
                    id v502 = v254;
                    uint64_t v507 = *(void *)v543;
                    while (1)
                    {
                      uint64_t v517 = 0;
                      uint64_t v511 = v255;
                      do
                      {
                        if (*(void *)v543 != v507) {
                          objc_enumerationMutation(v502);
                        }
                        uint64_t v256 = *(void *)(*((void *)&v542 + 1) + 8 * v517);
                        id v514 = (id)MEMORY[0x1E016D870]();
                        v257 = [v525 objectForKeyedSubscript:v256];
                        v258 = [v257 objectForKeyedSubscript:@"eventTotalDaily"];
                        [v258 doubleValue];
                        BOOL v260 = v259 > 0.0;

                        if (v260)
                        {
                          v261 = [v525 objectForKeyedSubscript:v256];
                          v262 = [v261 objectForKeyedSubscript:@"eventHappenedArray"];
                          [v262 addObject:&unk_1F3453748];

                          v263 = [v525 objectForKeyedSubscript:v256];
                          v264 = [v263 objectForKeyedSubscript:@"eventTotalArray"];
                          v265 = NSNumber;
                          v266 = [v525 objectForKeyedSubscript:v256];
                          v267 = [v266 objectForKeyedSubscript:@"eventTotalDaily"];
                          [v267 doubleValue];
                          v268 = [v265 numberWithDouble:x0];
                          [v264 addObject:v268];

                          v269 = [v525 objectForKeyedSubscript:v256];
                          v270 = [v269 objectForKeyedSubscript:@"eventLongestArray"];
                          v271 = NSNumber;
                          v272 = [v525 objectForKeyedSubscript:v256];
                          v273 = [v272 objectForKeyedSubscript:@"eventLongestDaily"];
                          [v273 doubleValue];
                          v274 = [v271 numberWithDouble:x0];
                          [v270 addObject:v274];

                          if (![v509 isEqual:@"WiFiConnection"]) {
                            goto LABEL_107;
                          }
                          long long v540 = 0u;
                          long long v541 = 0u;
                          long long v538 = 0u;
                          long long v539 = 0u;
                          v275 = [v508 objectForKeyedSubscript:v256];
                          uint64_t v276 = [v275 countByEnumeratingWithState:&v538 objects:v586 count:16];
                          if (v276)
                          {
                            uint64_t v277 = *(void *)v539;
                            do
                            {
                              for (iuint64_t i = 0; ii != v276; ++ii)
                              {
                                if (*(void *)v539 != v277) {
                                  objc_enumerationMutation(v275);
                                }
                                v279 = [v523 intersectionWithDateInterval:*(void *)(*((void *)&v538 + 1) + 8 * ii)];
                                v280 = v279;
                                if (v279)
                                {
                                  uint64_t v281 = [v279 endDate];
                                  uint64_t v282 = [v280 startDate];
                                  [v281 timeIntervalSinceDate:v282];
                                  double v284 = v283;

                                  uint64_t v285 = NSNumber;
                                  v286 = [v525 objectForKeyedSubscript:v256];
                                  int v287 = [v286 objectForKeyedSubscript:@"visitTotalDaily"];
                                  [v287 doubleValue];
                                  v289 = [v285 numberWithDouble:v284 + v288];
                                  v290 = [v525 objectForKeyedSubscript:v256];
                                  [v290 setObject:v289 forKeyedSubscript:@"visitTotalDaily"];
                                }
                              }
                              uint64_t v276 = [v275 countByEnumeratingWithState:&v538 objects:v586 count:16];
                            }
                            while (v276);
                          }

                          v291 = [v525 objectForKeyedSubscript:v256];
                          v292 = [v291 objectForKeyedSubscript:@"wifiTotalDaily"];
                          [v292 doubleValue];
                          double v294 = v293;

                          v295 = [v525 objectForKeyedSubscript:v256];
                          v296 = [v295 objectForKeyedSubscript:@"visitTotalDaily"];
                          [v296 doubleValue];
                          double v298 = v297;

                          if (v294 <= 0.0 || v298 <= 0.0)
                          {
                            v299 = [v525 objectForKeyedSubscript:v256];
                            v300 = [v299 objectForKeyedSubscript:@"wifiStabilityArray"];
                            [v300 addObject:&unk_1F34537E8];
                          }
                          else
                          {
                            v299 = [v525 objectForKeyedSubscript:v256];
                            v300 = [v299 objectForKeyedSubscript:@"wifiStabilityArray"];
                            v301 = [NSNumber numberWithDouble:v294 / v298];
                            [v300 addObject:v301];
                          }
                        }
                        else
                        {
                          v299 = [v525 objectForKeyedSubscript:v256];
                          v300 = [v299 objectForKeyedSubscript:@"eventHappenedArray"];
                          [v300 addObject:&unk_1F34537E8];
                        }

LABEL_107:
                        ++v517;
                      }
                      while (v517 != v511);
                      uint64_t v255 = [v502 countByEnumeratingWithState:&v542 objects:v587 count:16];
                      if (!v255)
                      {
                        v254 = v502;
                        break;
                      }
                    }
                  }
                }
                else
                {
                  long long v556 = 0uLL;
                  long long v557 = 0uLL;
                  long long v554 = 0uLL;
                  long long v555 = 0uLL;
                  v254 = [v525 allKeys];
                  uint64_t v302 = [v254 countByEnumeratingWithState:&v554 objects:v590 count:16];
                  if (v302)
                  {
                    uint64_t v303 = *(void *)v555;
                    do
                    {
                      for (juint64_t j = 0; jj != v302; ++jj)
                      {
                        if (*(void *)v555 != v303) {
                          objc_enumerationMutation(v254);
                        }
                        uint64_t v305 = [v525 objectForKeyedSubscript:*(void *)(*((void *)&v554 + 1) + 8 * jj)];
                        v306 = [v305 objectForKeyedSubscript:@"eventHappenedArray"];
                        [v306 addObject:&unk_1F34537E8];
                      }
                      uint64_t v302 = [v254 countByEnumeratingWithState:&v554 objects:v590 count:16];
                    }
                    while (v302);
                  }
                }

                uint64_t v307 = v498;
                v128 = v498;
                if (++v496 == 4) {
                  goto LABEL_122;
                }
              }
              uint64_t v307 = v128;
LABEL_122:
              v497 = v307;

              _Block_object_dispose(&v563, 8);
              v308 = [v485 earlierDate:v491];
              BOOL v309 = v308 == v485;

              v128 = v497;
              v499 = v485;
              if (!v309) {
                goto LABEL_24;
              }
            }
          }
          v485 = v499;
          v497 = v128;
LABEL_24:
          long long v536 = 0u;
          long long v537 = 0u;
          long long v534 = 0u;
          long long v535 = 0u;
          v131 = [v525 allKeys];
          id v501 = (id)[v131 countByEnumeratingWithState:&v534 objects:v585 count:16];
          if (!v501) {
            goto LABEL_47;
          }
          uint64_t v500 = *(void *)v535;
          do
          {
            for (kuint64_t k = 0; kk != v501; kuint64_t k = (char *)kk + 1)
            {
              if (*(void *)v535 != v500) {
                objc_enumerationMutation(v131);
              }
              uint64_t v133 = *(void *)(*((void *)&v534 + 1) + 8 * (void)kk);
              context = (void *)MEMORY[0x1E016D870]();
              double v134 = [v525 objectForKeyedSubscript:v133];
              v135 = [v134 objectForKeyedSubscript:@"eventHappenedArray"];

              v136 = [v525 objectForKeyedSubscript:v133];
              v137 = [v136 objectForKeyedSubscript:@"eventTotalArray"];

              unint64_t v138 = [v525 objectForKeyedSubscript:v133];
              uint64_t v139 = [v138 objectForKeyedSubscript:@"eventLongestArray"];

              if ([v135 count])
              {
                v140 = NSNumber;
                uint64_t v141 = +[RTPlaceDataMetrics meanOf:v135];
                [v141 doubleValue];
                uint64_t v506 = [v140 numberWithDouble:];
              }
              else
              {
                uint64_t v506 = &unk_1F3453718;
              }
              uint64_t v142 = [v137 count];
              uint64_t v143 = &unk_1F3453718;
              v519 = &unk_1F3453718;
              uint64_t v522 = &unk_1F3453718;
              id v512 = &unk_1F3453718;
              v515 = &unk_1F3453718;
              v510 = &unk_1F3453718;
              if (v142 == [v139 count])
              {
                if ([v137 count])
                {
                  unint64_t v144 = NSNumber;
                  v145 = +[RTPlaceDataMetrics medianOf:v137];
                  [v145 doubleValue];
                  uint64_t v522 = [v144 numberWithDouble:];

                  v146 = NSNumber;
                  v147 = +[RTPlaceDataMetrics meanOf:v137];
                  [v147 doubleValue];
                  v519 = [v146 numberWithDouble:x0];

                  v148 = NSNumber;
                  v149 = +[RTPlaceDataMetrics standardDeviationOf:v137];
                  [v149 doubleValue];
                  v515 = [v148 numberWithDouble:];

                  v150 = NSNumber;
                  double v151 = +[RTPlaceDataMetrics medianOf:v139];
                  [v151 doubleValue];
                  [v150 numberWithDouble:];
                  id v512 = (id)objc_claimAutoreleasedReturnValue();

                  v152 = NSNumber;
                  v153 = +[RTPlaceDataMetrics meanOf:v139];
                  [v153 doubleValue];
                  v510 = [v152 numberWithDouble:x0];

                  v154 = NSNumber;
                  double v155 = +[RTPlaceDataMetrics standardDeviationOf:v139];
                  [v155 doubleValue];
                  uint64_t v143 = [v154 numberWithDouble:];
                }
                else
                {
                  v519 = &unk_1F3453718;
                  uint64_t v522 = &unk_1F3453718;
                  id v512 = &unk_1F3453718;
                  v515 = &unk_1F3453718;
                  v510 = &unk_1F3453718;
                }
              }
              if ([v509 isEqual:@"Charging"])
              {
                v156 = [v525 objectForKeyedSubscript:v133];
                [v156 setObject:v506 forKeyedSubscript:@"percentage_of_days_with_charging"];

                v157 = [v525 objectForKeyedSubscript:v133];
                [v157 setObject:v522 forKeyedSubscript:@"median_daily_total_charging_duration"];

                char v158 = [v525 objectForKeyedSubscript:v133];
                [v158 setObject:v519 forKeyedSubscript:@"mean_daily_total_charging_duration"];

                double v159 = [v525 objectForKeyedSubscript:v133];
                [v159 setObject:v515 forKeyedSubscript:@"SD_daily_total_charging_duration"];

                v160 = [v525 objectForKeyedSubscript:v133];
                [v160 setObject:v512 forKeyedSubscript:@"median_daily_longest_charging_duration"];

                v161 = [v525 objectForKeyedSubscript:v133];
                [v161 setObject:v510 forKeyedSubscript:@"mean_daily_longest_charging_duration"];

                v162 = [v525 objectForKeyedSubscript:v133];
                [v162 setObject:v143 forKeyedSubscript:@"SD_daily_longest_charging_duration"];
              }
              else if ([v509 isEqual:@"StaticMotion"])
              {
                v163 = [v525 objectForKeyedSubscript:v133];
                [v163 setObject:v506 forKeyedSubscript:@"percentage_of_days_with_staticMotion"];

                v164 = [v525 objectForKeyedSubscript:v133];
                [v164 setObject:v522 forKeyedSubscript:@"median_daily_total_static_motion_duration"];

                v165 = [v525 objectForKeyedSubscript:v133];
                [v165 setObject:v519 forKeyedSubscript:@"mean_daily_total_static_motion_duration"];

                v166 = [v525 objectForKeyedSubscript:v133];
                [v166 setObject:v515 forKeyedSubscript:@"SD_daily_total_static_motion_duration"];

                v167 = [v525 objectForKeyedSubscript:v133];
                [v167 setObject:v512 forKeyedSubscript:@"median_daily_longest_static_motion_duration"];

                id v168 = [v525 objectForKeyedSubscript:v133];
                [v168 setObject:v510 forKeyedSubscript:@"mean_daily_longest_static_motion_duration"];

                v162 = [v525 objectForKeyedSubscript:v133];
                [v162 setObject:v143 forKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
              }
              else if ([v509 isEqual:@"ScreenLock"])
              {
                v169 = [v525 objectForKeyedSubscript:v133];
                [v169 setObject:v506 forKeyedSubscript:@"percentage_of_days_with_screenLock"];

                unint64_t v170 = [v525 objectForKeyedSubscript:v133];
                [v170 setObject:v522 forKeyedSubscript:@"median_daily_total_screen_lock_duration"];

                int v171 = [v525 objectForKeyedSubscript:v133];
                [v171 setObject:v519 forKeyedSubscript:@"mean_daily_total_screen_lock_duration"];

                double v172 = [v525 objectForKeyedSubscript:v133];
                [v172 setObject:v515 forKeyedSubscript:@"SD_daily_total_screen_lock_duration"];

                v173 = [v525 objectForKeyedSubscript:v133];
                [v173 setObject:v512 forKeyedSubscript:@"median_daily_longest_screen_lock_duration"];

                v174 = [v525 objectForKeyedSubscript:v133];
                [v174 setObject:v510 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];

                v162 = [v525 objectForKeyedSubscript:v133];
                [v162 setObject:v143 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
              }
              else
              {
                if (![v509 isEqual:@"WiFiConnection"]) {
                  goto LABEL_45;
                }
                v175 = [v525 objectForKeyedSubscript:v133];
                [v175 setObject:v506 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];

                v176 = [v525 objectForKeyedSubscript:v133];
                [v176 setObject:v522 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];

                double v177 = [v525 objectForKeyedSubscript:v133];
                [v177 setObject:v519 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];

                double v178 = [v525 objectForKeyedSubscript:v133];
                [v178 setObject:v515 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];

                v179 = [v525 objectForKeyedSubscript:v133];
                [v179 setObject:v512 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];

                v180 = [v525 objectForKeyedSubscript:v133];
                [v180 setObject:v510 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];

                double v181 = [v525 objectForKeyedSubscript:v133];
                [v181 setObject:v143 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];

                v182 = NSNumber;
                v495 = [v525 objectForKeyedSubscript:v133];
                uint64_t v493 = [v495 objectForKeyedSubscript:@"wifiStabilityArray"];
                uint64_t v183 = +[RTPlaceDataMetrics meanOf:v493];
                [v183 doubleValue];
                v184 = [v182 numberWithDouble:x0];
                uint64_t v185 = [v525 objectForKeyedSubscript:v133];
                [v185 setObject:v184 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];

                v162 = [v525 objectForKeyedSubscript:v133];
                v186 = [v162 objectForKeyedSubscript:@"wifiStabilityArray"];
                [v186 removeAllObjects];
              }
LABEL_45:
              v187 = [v525 objectForKeyedSubscript:v133];
              v188 = [v187 objectForKeyedSubscript:@"eventHappenedArray"];
              [v188 removeAllObjects];

              double v189 = [v525 objectForKeyedSubscript:v133];
              double v190 = [v189 objectForKeyedSubscript:@"eventLongestArray"];
              [v190 removeAllObjects];

              v191 = [v525 objectForKeyedSubscript:v133];
              double v192 = [v191 objectForKeyedSubscript:@"eventTotalArray"];
              [v192 removeAllObjects];
            }
            id v501 = (id)[v131 countByEnumeratingWithState:&v534 objects:v585 count:16];
          }
          while (v501);
LABEL_47:

          uint64_t v125 = v479 + 1;
        }
        while (v479 + 1 != v484);
        uint64_t v310 = [obj countByEnumeratingWithState:&v569 objects:v592 count:16];
        uint64_t v484 = v310;
      }
      while (v310);
    }

    long long v532 = 0u;
    long long v533 = 0u;
    long long v530 = 0u;
    long long v531 = 0u;
    v311 = [v525 allKeys];
    uint64_t v312 = [v311 countByEnumeratingWithState:&v530 objects:v584 count:16];
    if (v312)
    {
      uint64_t v313 = *(void *)v531;
      do
      {
        for (muint64_t m = 0; mm != v312; ++mm)
        {
          if (*(void *)v531 != v313) {
            objc_enumerationMutation(v311);
          }
          uint64_t v315 = *(void *)(*((void *)&v530 + 1) + 8 * mm);
          v316 = [v525 objectForKeyedSubscript:v315];
          [v316 removeObjectForKey:@"eventHappenedArray"];

          v317 = [v525 objectForKeyedSubscript:v315];
          [v317 removeObjectForKey:@"eventLongestArray"];

          v318 = [v525 objectForKeyedSubscript:v315];
          [v318 removeObjectForKey:@"eventTotalArray"];

          v319 = [v525 objectForKeyedSubscript:v315];
          [v319 removeObjectForKey:@"wifiStabilityArray"];

          v320 = [v525 objectForKeyedSubscript:v315];
          [v320 removeObjectForKey:@"eventTotalDaily"];

          v321 = [v525 objectForKeyedSubscript:v315];
          [v321 removeObjectForKey:@"eventLongestDaily"];

          v322 = [v525 objectForKeyedSubscript:v315];
          [v322 removeObjectForKey:@"wifiTotalDaily"];

          v323 = [v525 objectForKeyedSubscript:v315];
          [v323 removeObjectForKey:@"visitTotalDaily"];
        }
        uint64_t v312 = [v311 countByEnumeratingWithState:&v530 objects:v584 count:16];
      }
      while (v312);
    }

    if (v486)
    {
      long long v528 = 0u;
      long long v529 = 0u;
      long long v526 = 0u;
      long long v527 = 0u;
      v324 = [v525 allKeys];
      uint64_t v524 = [v324 countByEnumeratingWithState:&v526 objects:v583 count:16];
      if (v524)
      {
        uint64_t v521 = *(void *)v527;
        do
        {
          for (nuint64_t n = 0; nn != v524; ++nn)
          {
            if (*(void *)v527 != v521) {
              objc_enumerationMutation(v324);
            }
            uint64_t v326 = *(void *)(*((void *)&v526 + 1) + 8 * nn);
            double v327 = [v525 objectForKeyedSubscript:v326];
            double v328 = [v327 objectForKeyedSubscript:@"percentage_of_days_with_charging"];
            double v329 = +[RTPlaceDataMetrics binArrayPercentage];
            double v330 = +[RTMetric binForNumber:v328 bins:v329];
            double v331 = [v525 objectForKeyedSubscript:v326];
            [v331 setObject:v330 forKeyedSubscript:@"percentage_of_days_with_charging_bucketed"];

            double v332 = [v525 objectForKeyedSubscript:v326];
            v333 = [v332 objectForKeyedSubscript:@"median_daily_total_charging_duration"];
            v334 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v335 = +[RTMetric binForNumber:v333 bins:v334];
            id v336 = [v525 objectForKeyedSubscript:v326];
            [v336 setObject:v335 forKeyedSubscript:@"median_daily_total_charging_duration_bucketed"];

            id v337 = [v525 objectForKeyedSubscript:v326];
            v338 = [v337 objectForKeyedSubscript:@"mean_daily_total_charging_duration"];
            v339 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v340 = +[RTMetric binForNumber:v338 bins:v339];
            uint64_t v341 = [v525 objectForKeyedSubscript:v326];
            [v341 setObject:v340 forKeyedSubscript:@"mean_daily_total_charging_duration_bucketed"];

            uint64_t v342 = [v525 objectForKeyedSubscript:v326];
            uint64_t v343 = [v342 objectForKeyedSubscript:@"SD_daily_total_charging_duration"];
            v344 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v345 = +[RTMetric binForNumber:v343 bins:v344];
            v346 = [v525 objectForKeyedSubscript:v326];
            [v346 setObject:v345 forKeyedSubscript:@"SD_daily_total_charging_duration_bucketed"];

            int v347 = [v525 objectForKeyedSubscript:v326];
            v348 = [v347 objectForKeyedSubscript:@"median_daily_longest_charging_duration"];
            v349 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v350 = +[RTMetric binForNumber:v348 bins:v349];
            v351 = [v525 objectForKeyedSubscript:v326];
            [v351 setObject:v350 forKeyedSubscript:@"median_daily_longest_charging_duration_bucketed"];

            v352 = [v525 objectForKeyedSubscript:v326];
            double v353 = [v352 objectForKeyedSubscript:@"mean_daily_longest_charging_duration"];
            v354 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v355 = +[RTMetric binForNumber:v353 bins:v354];
            v356 = [v525 objectForKeyedSubscript:v326];
            [v356 setObject:v355 forKeyedSubscript:@"mean_daily_longest_charging_duration_bucketed"];

            double v357 = [v525 objectForKeyedSubscript:v326];
            v358 = [v357 objectForKeyedSubscript:@"SD_daily_longest_charging_duration"];
            double v359 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v360 = +[RTMetric binForNumber:v358 bins:v359];
            double v361 = [v525 objectForKeyedSubscript:v326];
            [v361 setObject:v360 forKeyedSubscript:@"SD_daily_longest_charging_duration_bucketed"];

            v362 = [v525 objectForKeyedSubscript:v326];
            double v363 = [v362 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion"];
            v364 = +[RTPlaceDataMetrics binArrayPercentage];
            v365 = +[RTMetric binForNumber:v363 bins:v364];
            v366 = [v525 objectForKeyedSubscript:v326];
            [v366 setObject:v365 forKeyedSubscript:@"percentage_of_days_with_staticMotion_bucketed"];

            v367 = [v525 objectForKeyedSubscript:v326];
            v368 = [v367 objectForKeyedSubscript:@"median_daily_total_static_motion_duration"];
            v369 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v370 = +[RTMetric binForNumber:v368 bins:v369];
            v371 = [v525 objectForKeyedSubscript:v326];
            [v371 setObject:v370 forKeyedSubscript:@"median_daily_total_static_motion_duration_bucketed"];

            v372 = [v525 objectForKeyedSubscript:v326];
            v373 = [v372 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration"];
            v374 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v375 = +[RTMetric binForNumber:v373 bins:v374];
            v376 = [v525 objectForKeyedSubscript:v326];
            [v376 setObject:v375 forKeyedSubscript:@"mean_daily_total_static_motion_duration_bucketed"];

            uint64_t v377 = [v525 objectForKeyedSubscript:v326];
            uint64_t v378 = [v377 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration"];
            uint64_t v379 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v380 = +[RTMetric binForNumber:v378 bins:v379];
            v381 = [v525 objectForKeyedSubscript:v326];
            [v381 setObject:v380 forKeyedSubscript:@"SD_daily_total_static_motion_duration_bucketed"];

            v382 = [v525 objectForKeyedSubscript:v326];
            v383 = [v382 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration"];
            v384 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v385 = +[RTMetric binForNumber:v383 bins:v384];
            v386 = [v525 objectForKeyedSubscript:v326];
            [v386 setObject:v385 forKeyedSubscript:@"median_daily_longest_static_motion_duration_bucketed"];

            v387 = [v525 objectForKeyedSubscript:v326];
            v388 = [v387 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration"];
            v389 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v390 = +[RTMetric binForNumber:v388 bins:v389];
            uint64_t v391 = [v525 objectForKeyedSubscript:v326];
            [v391 setObject:v390 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_bucketed"];

            uint64_t v392 = [v525 objectForKeyedSubscript:v326];
            v393 = [v392 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
            v394 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v395 = +[RTMetric binForNumber:v393 bins:v394];
            v396 = [v525 objectForKeyedSubscript:v326];
            [v396 setObject:v395 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_bucketed"];

            v397 = [v525 objectForKeyedSubscript:v326];
            v398 = [v397 objectForKeyedSubscript:@"percentage_of_days_with_screenLock"];
            v399 = +[RTPlaceDataMetrics binArrayPercentage];
            v400 = +[RTMetric binForNumber:v398 bins:v399];
            v401 = [v525 objectForKeyedSubscript:v326];
            [v401 setObject:v400 forKeyedSubscript:@"percentage_of_days_with_screenLock_bucketed"];

            v402 = [v525 objectForKeyedSubscript:v326];
            uint64_t v403 = [v402 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration"];
            uint64_t v404 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v405 = +[RTMetric binForNumber:v403 bins:v404];
            v406 = [v525 objectForKeyedSubscript:v326];
            [v406 setObject:v405 forKeyedSubscript:@"median_daily_total_screen_lock_duration_bucketed"];

            v407 = [v525 objectForKeyedSubscript:v326];
            v408 = [v407 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration"];
            v409 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v410 = +[RTMetric binForNumber:v408 bins:v409];
            v411 = [v525 objectForKeyedSubscript:v326];
            [v411 setObject:v410 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_bucketed"];

            v412 = [v525 objectForKeyedSubscript:v326];
            v413 = [v412 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration"];
            v414 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v415 = +[RTMetric binForNumber:v413 bins:v414];
            uint64_t v416 = [v525 objectForKeyedSubscript:v326];
            [v416 setObject:v415 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_bucketed"];

            uint64_t v417 = [v525 objectForKeyedSubscript:v326];
            uint64_t v418 = [v417 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration"];
            v419 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v420 = +[RTMetric binForNumber:v418 bins:v419];
            v421 = [v525 objectForKeyedSubscript:v326];
            [v421 setObject:v420 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_bucketed"];

            v422 = [v525 objectForKeyedSubscript:v326];
            v423 = [v422 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];
            v424 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v425 = +[RTMetric binForNumber:v423 bins:v424];
            v426 = [v525 objectForKeyedSubscript:v326];
            [v426 setObject:v425 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_bucketed"];

            unint64_t v427 = [v525 objectForKeyedSubscript:v326];
            int v428 = [v427 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
            double v429 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v430 = +[RTMetric binForNumber:v428 bins:v429];
            double v431 = [v525 objectForKeyedSubscript:v326];
            [v431 setObject:v430 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_bucketed"];

            v432 = [v525 objectForKeyedSubscript:v326];
            v433 = [v432 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];
            v434 = +[RTPlaceDataMetrics binArrayPercentage];
            id v435 = +[RTMetric binForNumber:v433 bins:v434];
            v436 = [v525 objectForKeyedSubscript:v326];
            [v436 setObject:v435 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"];

            v437 = [v525 objectForKeyedSubscript:v326];
            v438 = [v437 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];
            uint64_t v439 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v440 = +[RTMetric binForNumber:v438 bins:v439];
            uint64_t v441 = [v525 objectForKeyedSubscript:v326];
            [v441 setObject:v440 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            v442 = [v525 objectForKeyedSubscript:v326];
            uint64_t v443 = [v442 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];
            v444 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v445 = +[RTMetric binForNumber:v443 bins:v444];
            v446 = [v525 objectForKeyedSubscript:v326];
            [v446 setObject:v445 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            v447 = [v525 objectForKeyedSubscript:v326];
            double v448 = [v447 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];
            v449 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v450 = +[RTMetric binForNumber:v448 bins:v449];
            v451 = [v525 objectForKeyedSubscript:v326];
            [v451 setObject:v450 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            double v452 = [v525 objectForKeyedSubscript:v326];
            v453 = [v452 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];
            v454 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v455 = +[RTMetric binForNumber:v453 bins:v454];
            v456 = [v525 objectForKeyedSubscript:v326];
            [v456 setObject:v455 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            v457 = [v525 objectForKeyedSubscript:v326];
            v458 = [v457 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];
            unint64_t v459 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            int v460 = +[RTMetric binForNumber:v458 bins:v459];
            double v461 = [v525 objectForKeyedSubscript:v326];
            [v461 setObject:v460 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            double v462 = [v525 objectForKeyedSubscript:v326];
            double v463 = [v462 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];
            v464 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v465 = +[RTMetric binForNumber:v463 bins:v464];
            v466 = [v525 objectForKeyedSubscript:v326];
            [v466 setObject:v465 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            id v467 = [v525 objectForKeyedSubscript:v326];
            v468 = [v467 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];
            v469 = +[RTPlaceDataMetrics binArrayPercentage];
            v470 = +[RTMetric binForNumber:v468 bins:v469];
            uint64_t v471 = [v525 objectForKeyedSubscript:v326];
            [v471 setObject:v470 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"];
          }
          uint64_t v524 = [v324 countByEnumeratingWithState:&v526 objects:v583 count:16];
        }
        while (v524);
      }
    }
  }

  return v525;
}

BOOL __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 endDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] != -1;

  return v4;
}

uint64_t __83__RTPlaceDataMetrics_calculateMLFeatures_startDate_endDate_createBucketedFeatures___block_invoke_1689(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!a3) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) addObjectsFromArray:a2];
  }
  *a4 = 1;
  return result;
}

- (void)setMLMetricsFromFeaturesDict:(id)a3 sourceName:(unint64_t)a4
{
  unint64_t v442 = a4;
  uint64_t v449 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v444 = 0u;
  long long v445 = 0u;
  long long v446 = 0u;
  long long v447 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v444 objects:v448 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v443 = *(void *)v445;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v445 != v443) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v444 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", @"Home", v442))
        {
          id v10 = NSNumber;
          uint64_t v11 = [v5 objectForKeyedSubscript:v9];
          id v12 = [v11 objectForKeyedSubscript:@"percentage_of_days_with_charging"];
          [v12 doubleValue];
          uint64_t v13 = [v10 numberWithDouble:];
          uint64_t v14 = [(RTMetric *)self metrics];
          [v14 setObject:v13 forKeyedSubscript:@"percentage_of_days_with_charging_home"];

          uint64_t v15 = NSNumber;
          uint64_t v16 = [v5 objectForKeyedSubscript:v9];
          double v17 = [v16 objectForKeyedSubscript:@"median_daily_total_charging_duration"];
          [v17 doubleValue];
          double v18 = [v15 numberWithDouble:];
          double v19 = [(RTMetric *)self metrics];
          [v19 setObject:v18 forKeyedSubscript:@"median_daily_total_charging_duration_home"];

          uint64_t v20 = NSNumber;
          uint64_t v21 = [v5 objectForKeyedSubscript:v9];
          double v22 = [v21 objectForKeyedSubscript:@"mean_daily_total_charging_duration"];
          [v22 doubleValue];
          uint64_t v23 = [v20 numberWithDouble:];
          id v24 = [(RTMetric *)self metrics];
          [v24 setObject:v23 forKeyedSubscript:@"mean_daily_total_charging_duration_home"];

          uint64_t v25 = NSNumber;
          uint64_t v26 = [v5 objectForKeyedSubscript:v9];
          long long v27 = [v26 objectForKeyedSubscript:@"SD_daily_total_charging_duration"];
          [v27 doubleValue];
          long long v28 = [v25 numberWithDouble:];
          long long v29 = [(RTMetric *)self metrics];
          [v29 setObject:v28 forKeyedSubscript:@"SD_daily_total_charging_duration_home"];

          long long v30 = NSNumber;
          long long v31 = [v5 objectForKeyedSubscript:v9];
          long long v32 = [v31 objectForKeyedSubscript:@"median_daily_longest_charging_duration"];
          [v32 doubleValue];
          long long v33 = [v30 numberWithDouble:];
          long long v34 = [(RTMetric *)self metrics];
          [v34 setObject:v33 forKeyedSubscript:@"median_daily_longest_charging_duration_home"];

          double v35 = NSNumber;
          double v36 = [v5 objectForKeyedSubscript:v9];
          uint64_t v37 = [v36 objectForKeyedSubscript:@"mean_daily_longest_charging_duration"];
          [v37 doubleValue];
          long long v38 = [v35 numberWithDouble:];
          long long v39 = [(RTMetric *)self metrics];
          [v39 setObject:v38 forKeyedSubscript:@"mean_daily_longest_charging_duration_home"];

          int v40 = NSNumber;
          id v41 = [v5 objectForKeyedSubscript:v9];
          long long v42 = [v41 objectForKeyedSubscript:@"SD_daily_longest_charging_duration"];
          [v42 doubleValue];
          uint64_t v43 = [v40 numberWithDouble:];
          int v44 = [(RTMetric *)self metrics];
          [v44 setObject:v43 forKeyedSubscript:@"SD_daily_longest_charging_duration_home"];

          double v45 = NSNumber;
          int v46 = [v5 objectForKeyedSubscript:v9];
          id v47 = [v46 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion"];
          [v47 doubleValue];
          long long v48 = [v45 numberWithDouble:];
          long long v49 = [(RTMetric *)self metrics];
          [v49 setObject:v48 forKeyedSubscript:@"percentage_of_days_with_staticMotion_home"];

          double v50 = NSNumber;
          id v51 = [v5 objectForKeyedSubscript:v9];
          uint64_t v52 = [v51 objectForKeyedSubscript:@"median_daily_total_static_motion_duration"];
          [v52 doubleValue];
          uint64_t v53 = [v50 numberWithDouble:];
          double v54 = [(RTMetric *)self metrics];
          [v54 setObject:v53 forKeyedSubscript:@"median_daily_total_static_motion_duration_home"];

          double v55 = NSNumber;
          uint64_t v56 = [v5 objectForKeyedSubscript:v9];
          uint64_t v57 = [v56 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration"];
          [v57 doubleValue];
          uint64_t v58 = [v55 numberWithDouble:];
          double v59 = [(RTMetric *)self metrics];
          [v59 setObject:v58 forKeyedSubscript:@"mean_daily_total_static_motion_duration_home"];

          double v60 = NSNumber;
          double v61 = [v5 objectForKeyedSubscript:v9];
          double v62 = [v61 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration"];
          [v62 doubleValue];
          double v63 = [v60 numberWithDouble:];
          double v64 = [(RTMetric *)self metrics];
          [v64 setObject:v63 forKeyedSubscript:@"SD_daily_total_static_motion_duration_home"];

          v65 = NSNumber;
          v66 = [v5 objectForKeyedSubscript:v9];
          v67 = [v66 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration"];
          [v67 doubleValue];
          uint64_t v68 = [v65 numberWithDouble:];
          double v69 = [(RTMetric *)self metrics];
          [v69 setObject:v68 forKeyedSubscript:@"median_daily_longest_static_motion_duration_home"];

          double v70 = NSNumber;
          id v71 = [v5 objectForKeyedSubscript:v9];
          double v72 = [v71 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration"];
          [v72 doubleValue];
          v73 = [v70 numberWithDouble:x0];
          double v74 = [(RTMetric *)self metrics];
          [v74 setObject:v73 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_home"];

          v75 = NSNumber;
          double v76 = [v5 objectForKeyedSubscript:v9];
          v77 = [v76 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
          [v77 doubleValue];
          v78 = [v75 numberWithDouble:x0];
          double v79 = [(RTMetric *)self metrics];
          [v79 setObject:v78 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_home"];

          v80 = NSNumber;
          double v81 = [v5 objectForKeyedSubscript:v9];
          v82 = [v81 objectForKeyedSubscript:@"percentage_of_days_with_screenLock"];
          [v82 doubleValue];
          double v83 = [v80 numberWithDouble:];
          v84 = [(RTMetric *)self metrics];
          [v84 setObject:v83 forKeyedSubscript:@"percentage_of_days_with_screenLock_home"];

          double v85 = NSNumber;
          v86 = [v5 objectForKeyedSubscript:v9];
          uint64_t v87 = [v86 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration"];
          [v87 doubleValue];
          uint64_t v88 = [v85 numberWithDouble:];
          uint64_t v89 = [(RTMetric *)self metrics];
          [v89 setObject:v88 forKeyedSubscript:@"median_daily_total_screen_lock_duration_home"];

          uint64_t v90 = NSNumber;
          v91 = [v5 objectForKeyedSubscript:v9];
          char v92 = [v91 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration"];
          [v92 doubleValue];
          id v93 = [v90 numberWithDouble:x0];
          v94 = [(RTMetric *)self metrics];
          [v94 setObject:v93 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_home"];

          uint64_t v95 = NSNumber;
          v96 = [v5 objectForKeyedSubscript:v9];
          v97 = [v96 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration"];
          [v97 doubleValue];
          uint64_t v98 = [v95 numberWithDouble:];
          v99 = [(RTMetric *)self metrics];
          [v99 setObject:v98 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_home"];

          v100 = NSNumber;
          unint64_t v101 = [v5 objectForKeyedSubscript:v9];
          v102 = [v101 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration"];
          [v102 doubleValue];
          uint64_t v103 = [v100 numberWithDouble:];
          v104 = [(RTMetric *)self metrics];
          [v104 setObject:v103 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_home"];

          uint64_t v105 = NSNumber;
          unint64_t v106 = [v5 objectForKeyedSubscript:v9];
          uint64_t v107 = [v106 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];
          [v107 doubleValue];
          uint64_t v108 = [v105 numberWithDouble:x0];
          uint64_t v109 = [(RTMetric *)self metrics];
          [v109 setObject:v108 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_home"];

          uint64_t v110 = NSNumber;
          v111 = [v5 objectForKeyedSubscript:v9];
          unint64_t v112 = [v111 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
          [v112 doubleValue];
          v113 = [v110 numberWithDouble:x0];
          double v114 = [(RTMetric *)self metrics];
          [v114 setObject:v113 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_home"];

          v115 = NSNumber;
          uint64_t v116 = [v5 objectForKeyedSubscript:v9];
          v117 = [v116 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];
          [v117 doubleValue];
          double v118 = [v115 numberWithDouble:x0];
          double v119 = [(RTMetric *)self metrics];
          [v119 setObject:v118 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_home"];

          double v120 = NSNumber;
          v121 = [v5 objectForKeyedSubscript:v9];
          double v122 = [v121 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];
          [v122 doubleValue];
          v123 = [v120 numberWithDouble:];
          double v124 = [(RTMetric *)self metrics];
          [v124 setObject:v123 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_home"];

          uint64_t v125 = NSNumber;
          uint64_t v126 = [v5 objectForKeyedSubscript:v9];
          v127 = [v126 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];
          [v127 doubleValue];
          v128 = [v125 numberWithDouble:x0];
          v129 = [(RTMetric *)self metrics];
          [v129 setObject:v128 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_home"];

          BOOL v130 = NSNumber;
          v131 = [v5 objectForKeyedSubscript:v9];
          v132 = [v131 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];
          [v132 doubleValue];
          uint64_t v133 = [v130 numberWithDouble:];
          double v134 = [(RTMetric *)self metrics];
          [v134 setObject:v133 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_home"];

          v135 = NSNumber;
          v136 = [v5 objectForKeyedSubscript:v9];
          v137 = [v136 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v137 doubleValue];
          unint64_t v138 = [v135 numberWithDouble:];
          uint64_t v139 = [(RTMetric *)self metrics];
          [v139 setObject:v138 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_home"];

          v140 = NSNumber;
          uint64_t v141 = [v5 objectForKeyedSubscript:v9];
          uint64_t v142 = [v141 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v142 doubleValue];
          uint64_t v143 = [v140 numberWithDouble:];
          unint64_t v144 = [(RTMetric *)self metrics];
          [v144 setObject:v143 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_home"];

          v145 = NSNumber;
          v146 = [v5 objectForKeyedSubscript:v9];
          v147 = [v146 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v147 doubleValue];
          v148 = [v145 numberWithDouble:x0];
          v149 = [(RTMetric *)self metrics];
          [v149 setObject:v148 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_home"];

          v150 = NSNumber;
          double v151 = [v5 objectForKeyedSubscript:v9];
          v152 = [v151 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];
          [v152 doubleValue];
          v153 = [v150 numberWithDouble:x0];
          v154 = [(RTMetric *)self metrics];
          double v155 = v154;
          v156 = v153;
          v157 = @"mean_daily_uninterrupted_WiFi_connection_stability_ratio_home";
        }
        else if ([v9 isEqualToString:@"Work"])
        {
          char v158 = NSNumber;
          double v159 = [v5 objectForKeyedSubscript:v9];
          v160 = [v159 objectForKeyedSubscript:@"percentage_of_days_with_charging"];
          [v160 doubleValue];
          v161 = [v158 numberWithDouble:];
          v162 = [(RTMetric *)self metrics];
          [v162 setObject:v161 forKeyedSubscript:@"percentage_of_days_with_charging_work"];

          v163 = NSNumber;
          v164 = [v5 objectForKeyedSubscript:v9];
          v165 = [v164 objectForKeyedSubscript:@"median_daily_total_charging_duration"];
          [v165 doubleValue];
          v166 = [v163 numberWithDouble:x0];
          v167 = [(RTMetric *)self metrics];
          [v167 setObject:v166 forKeyedSubscript:@"median_daily_total_charging_duration_work"];

          id v168 = NSNumber;
          v169 = [v5 objectForKeyedSubscript:v9];
          unint64_t v170 = [v169 objectForKeyedSubscript:@"mean_daily_total_charging_duration"];
          [v170 doubleValue];
          int v171 = [v168 numberWithDouble:];
          double v172 = [(RTMetric *)self metrics];
          [v172 setObject:v171 forKeyedSubscript:@"mean_daily_total_charging_duration_work"];

          v173 = NSNumber;
          v174 = [v5 objectForKeyedSubscript:v9];
          v175 = [v174 objectForKeyedSubscript:@"SD_daily_total_charging_duration"];
          [v175 doubleValue];
          v176 = [v173 numberWithDouble:x0];
          double v177 = [(RTMetric *)self metrics];
          [v177 setObject:v176 forKeyedSubscript:@"SD_daily_total_charging_duration_work"];

          double v178 = NSNumber;
          v179 = [v5 objectForKeyedSubscript:v9];
          v180 = [v179 objectForKeyedSubscript:@"median_daily_longest_charging_duration"];
          [v180 doubleValue];
          double v181 = [v178 numberWithDouble:];
          v182 = [(RTMetric *)self metrics];
          [v182 setObject:v181 forKeyedSubscript:@"median_daily_longest_charging_duration_work"];

          uint64_t v183 = NSNumber;
          v184 = [v5 objectForKeyedSubscript:v9];
          uint64_t v185 = [v184 objectForKeyedSubscript:@"mean_daily_longest_charging_duration"];
          [v185 doubleValue];
          v186 = [v183 numberWithDouble:x0];
          v187 = [(RTMetric *)self metrics];
          [v187 setObject:v186 forKeyedSubscript:@"mean_daily_longest_charging_duration_work"];

          v188 = NSNumber;
          double v189 = [v5 objectForKeyedSubscript:v9];
          double v190 = [v189 objectForKeyedSubscript:@"SD_daily_longest_charging_duration"];
          [v190 doubleValue];
          v191 = [v188 numberWithDouble:x0];
          double v192 = [(RTMetric *)self metrics];
          [v192 setObject:v191 forKeyedSubscript:@"SD_daily_longest_charging_duration_work"];

          uint64_t v193 = NSNumber;
          v194 = [v5 objectForKeyedSubscript:v9];
          BOOL v195 = [v194 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion"];
          [v195 doubleValue];
          id v196 = [v193 numberWithDouble:];
          BOOL v197 = [(RTMetric *)self metrics];
          [v197 setObject:v196 forKeyedSubscript:@"percentage_of_days_with_staticMotion_work"];

          uint64_t v198 = NSNumber;
          id v199 = [v5 objectForKeyedSubscript:v9];
          uint64_t v200 = [v199 objectForKeyedSubscript:@"median_daily_total_static_motion_duration"];
          [v200 doubleValue];
          uint64_t v201 = [v198 numberWithDouble:];
          double v202 = [(RTMetric *)self metrics];
          [v202 setObject:v201 forKeyedSubscript:@"median_daily_total_static_motion_duration_work"];

          id v203 = NSNumber;
          id v204 = [v5 objectForKeyedSubscript:v9];
          id v205 = [v204 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration"];
          [v205 doubleValue];
          uint64_t v206 = [v203 numberWithDouble:];
          double v207 = [(RTMetric *)self metrics];
          [v207 setObject:v206 forKeyedSubscript:@"mean_daily_total_static_motion_duration_work"];

          double v208 = NSNumber;
          BOOL v209 = [v5 objectForKeyedSubscript:v9];
          double v210 = [v209 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration"];
          [v210 doubleValue];
          uint64_t v211 = [v208 numberWithDouble:x0];
          uint64_t v212 = [(RTMetric *)self metrics];
          [v212 setObject:v211 forKeyedSubscript:@"SD_daily_total_static_motion_duration_work"];

          double v213 = NSNumber;
          uint64_t v214 = [v5 objectForKeyedSubscript:v9];
          v215 = [v214 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration"];
          [v215 doubleValue];
          double v216 = [v213 numberWithDouble:];
          v217 = [(RTMetric *)self metrics];
          [v217 setObject:v216 forKeyedSubscript:@"median_daily_longest_static_motion_duration_work"];

          v218 = NSNumber;
          uint64_t v219 = [v5 objectForKeyedSubscript:v9];
          double v220 = [v219 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration"];
          [v220 doubleValue];
          uint64_t v221 = [v218 numberWithDouble:];
          uint64_t v222 = [(RTMetric *)self metrics];
          [v222 setObject:v221 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_work"];

          double v223 = NSNumber;
          double v224 = [v5 objectForKeyedSubscript:v9];
          double v225 = [v224 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
          [v225 doubleValue];
          double v226 = [v223 numberWithDouble:];
          uint64_t v227 = [(RTMetric *)self metrics];
          [v227 setObject:v226 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_work"];

          double v228 = NSNumber;
          double v229 = [v5 objectForKeyedSubscript:v9];
          double v230 = [v229 objectForKeyedSubscript:@"percentage_of_days_with_screenLock"];
          [v230 doubleValue];
          long long v231 = [v228 numberWithDouble:x0];
          long long v232 = [(RTMetric *)self metrics];
          [v232 setObject:v231 forKeyedSubscript:@"percentage_of_days_with_screenLock_work"];

          double v233 = NSNumber;
          double v234 = [v5 objectForKeyedSubscript:v9];
          long long v235 = [v234 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration"];
          [v235 doubleValue];
          long long v236 = [v233 numberWithDouble:];
          double v237 = [(RTMetric *)self metrics];
          [v237 setObject:v236 forKeyedSubscript:@"median_daily_total_screen_lock_duration_work"];

          BOOL v238 = NSNumber;
          long long v239 = [v5 objectForKeyedSubscript:v9];
          long long v240 = [v239 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration"];
          [v240 doubleValue];
          long long v241 = [v238 numberWithDouble:];
          int v242 = [(RTMetric *)self metrics];
          [v242 setObject:v241 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_work"];

          int v243 = NSNumber;
          int v244 = [v5 objectForKeyedSubscript:v9];
          int v245 = [v244 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration"];
          [v245 doubleValue];
          double v246 = [v243 numberWithDouble:];
          double v247 = [(RTMetric *)self metrics];
          [v247 setObject:v246 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_work"];

          v248 = NSNumber;
          v249 = [v5 objectForKeyedSubscript:v9];
          v250 = [v249 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration"];
          [v250 doubleValue];
          double v251 = [v248 numberWithDouble:];
          uint64_t v252 = [(RTMetric *)self metrics];
          [v252 setObject:v251 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_work"];

          v253 = NSNumber;
          v254 = [v5 objectForKeyedSubscript:v9];
          uint64_t v255 = [v254 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];
          [v255 doubleValue];
          uint64_t v256 = [v253 numberWithDouble:];
          v257 = [(RTMetric *)self metrics];
          [v257 setObject:v256 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_work"];

          v258 = NSNumber;
          double v259 = [v5 objectForKeyedSubscript:v9];
          BOOL v260 = [v259 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
          [v260 doubleValue];
          v261 = [v258 numberWithDouble:x0];
          v262 = [(RTMetric *)self metrics];
          [v262 setObject:v261 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_work"];

          v263 = NSNumber;
          v264 = [v5 objectForKeyedSubscript:v9];
          v265 = [v264 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];
          [v265 doubleValue];
          v266 = [v263 numberWithDouble:x0];
          v267 = [(RTMetric *)self metrics];
          [v267 setObject:v266 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_work"];

          v268 = NSNumber;
          v269 = [v5 objectForKeyedSubscript:v9];
          v270 = [v269 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];
          [v270 doubleValue];
          v271 = [v268 numberWithDouble:x0];
          v272 = [(RTMetric *)self metrics];
          [v272 setObject:v271 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_work"];

          v273 = NSNumber;
          v274 = [v5 objectForKeyedSubscript:v9];
          v275 = [v274 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];
          [v275 doubleValue];
          uint64_t v276 = [v273 numberWithDouble:];
          uint64_t v277 = [(RTMetric *)self metrics];
          [v277 setObject:v276 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_work"];

          v278 = NSNumber;
          v279 = [v5 objectForKeyedSubscript:v9];
          v280 = [v279 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];
          [v280 doubleValue];
          uint64_t v281 = [v278 numberWithDouble:];
          uint64_t v282 = [(RTMetric *)self metrics];
          [v282 setObject:v281 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_work"];

          double v283 = NSNumber;
          double v284 = [v5 objectForKeyedSubscript:v9];
          uint64_t v285 = [v284 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v285 doubleValue];
          v286 = [v283 numberWithDouble:x0];
          int v287 = [(RTMetric *)self metrics];
          [v287 setObject:v286 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_work"];

          double v288 = NSNumber;
          v289 = [v5 objectForKeyedSubscript:v9];
          v290 = [v289 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v290 doubleValue];
          v291 = [v288 numberWithDouble:x0];
          v292 = [(RTMetric *)self metrics];
          [v292 setObject:v291 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_work"];

          double v293 = NSNumber;
          double v294 = [v5 objectForKeyedSubscript:v9];
          v295 = [v294 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v295 doubleValue];
          v296 = [v293 numberWithDouble:x0];
          double v297 = [(RTMetric *)self metrics];
          [v297 setObject:v296 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_work"];

          double v298 = NSNumber;
          double v151 = [v5 objectForKeyedSubscript:v9];
          v152 = [v151 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];
          [v152 doubleValue];
          v153 = [v298 numberWithDouble:];
          v154 = [(RTMetric *)self metrics];
          double v155 = v154;
          v156 = v153;
          v157 = @"mean_daily_uninterrupted_WiFi_connection_stability_ratio_work";
        }
        else
        {
          if (![v9 isEqualToString:@"Others"]) {
            continue;
          }
          v299 = NSNumber;
          v300 = [v5 objectForKeyedSubscript:v9];
          v301 = [v300 objectForKeyedSubscript:@"percentage_of_days_with_charging"];
          [v301 doubleValue];
          uint64_t v302 = [v299 numberWithDouble:];
          uint64_t v303 = [(RTMetric *)self metrics];
          [v303 setObject:v302 forKeyedSubscript:@"percentage_of_days_with_charging_others"];

          uint64_t v304 = NSNumber;
          uint64_t v305 = [v5 objectForKeyedSubscript:v9];
          v306 = [v305 objectForKeyedSubscript:@"median_daily_total_charging_duration"];
          [v306 doubleValue];
          uint64_t v307 = [v304 numberWithDouble:];
          v308 = [(RTMetric *)self metrics];
          [v308 setObject:v307 forKeyedSubscript:@"median_daily_total_charging_duration_others"];

          BOOL v309 = NSNumber;
          uint64_t v310 = [v5 objectForKeyedSubscript:v9];
          v311 = [v310 objectForKeyedSubscript:@"mean_daily_total_charging_duration"];
          [v311 doubleValue];
          uint64_t v312 = [v309 numberWithDouble:];
          uint64_t v313 = [(RTMetric *)self metrics];
          [v313 setObject:v312 forKeyedSubscript:@"mean_daily_total_charging_duration_others"];

          v314 = NSNumber;
          uint64_t v315 = [v5 objectForKeyedSubscript:v9];
          v316 = [v315 objectForKeyedSubscript:@"SD_daily_total_charging_duration"];
          [v316 doubleValue];
          v317 = [v314 numberWithDouble:x0];
          v318 = [(RTMetric *)self metrics];
          [v318 setObject:v317 forKeyedSubscript:@"SD_daily_total_charging_duration_others"];

          v319 = NSNumber;
          v320 = [v5 objectForKeyedSubscript:v9];
          v321 = [v320 objectForKeyedSubscript:@"median_daily_longest_charging_duration"];
          [v321 doubleValue];
          v322 = [v319 numberWithDouble:x0];
          v323 = [(RTMetric *)self metrics];
          [v323 setObject:v322 forKeyedSubscript:@"median_daily_longest_charging_duration_others"];

          v324 = NSNumber;
          v325 = [v5 objectForKeyedSubscript:v9];
          uint64_t v326 = [v325 objectForKeyedSubscript:@"mean_daily_longest_charging_duration"];
          [v326 doubleValue];
          double v327 = [v324 numberWithDouble:];
          double v328 = [(RTMetric *)self metrics];
          [v328 setObject:v327 forKeyedSubscript:@"mean_daily_longest_charging_duration_others"];

          double v329 = NSNumber;
          double v330 = [v5 objectForKeyedSubscript:v9];
          double v331 = [v330 objectForKeyedSubscript:@"SD_daily_longest_charging_duration"];
          [v331 doubleValue];
          double v332 = [v329 numberWithDouble:];
          v333 = [(RTMetric *)self metrics];
          [v333 setObject:v332 forKeyedSubscript:@"SD_daily_longest_charging_duration_others"];

          v334 = NSNumber;
          v335 = [v5 objectForKeyedSubscript:v9];
          id v336 = [v335 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion"];
          [v336 doubleValue];
          id v337 = [v334 numberWithDouble:];
          v338 = [(RTMetric *)self metrics];
          [v338 setObject:v337 forKeyedSubscript:@"percentage_of_days_with_staticMotion_others"];

          v339 = NSNumber;
          v340 = [v5 objectForKeyedSubscript:v9];
          uint64_t v341 = [v340 objectForKeyedSubscript:@"median_daily_total_static_motion_duration"];
          [v341 doubleValue];
          uint64_t v342 = [v339 numberWithDouble:];
          uint64_t v343 = [(RTMetric *)self metrics];
          [v343 setObject:v342 forKeyedSubscript:@"median_daily_total_static_motion_duration_others"];

          v344 = NSNumber;
          uint64_t v345 = [v5 objectForKeyedSubscript:v9];
          v346 = [v345 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration"];
          [v346 doubleValue];
          int v347 = [v344 numberWithDouble:];
          v348 = [(RTMetric *)self metrics];
          [v348 setObject:v347 forKeyedSubscript:@"mean_daily_total_static_motion_duration_others"];

          v349 = NSNumber;
          v350 = [v5 objectForKeyedSubscript:v9];
          v351 = [v350 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration"];
          [v351 doubleValue];
          v352 = [v349 numberWithDouble:x0];
          double v353 = [(RTMetric *)self metrics];
          [v353 setObject:v352 forKeyedSubscript:@"SD_daily_total_static_motion_duration_others"];

          v354 = NSNumber;
          double v355 = [v5 objectForKeyedSubscript:v9];
          v356 = [v355 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration"];
          [v356 doubleValue];
          double v357 = [v354 numberWithDouble:];
          v358 = [(RTMetric *)self metrics];
          [v358 setObject:v357 forKeyedSubscript:@"median_daily_longest_static_motion_duration_others"];

          double v359 = NSNumber;
          v360 = [v5 objectForKeyedSubscript:v9];
          double v361 = [v360 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration"];
          [v361 doubleValue];
          v362 = [v359 numberWithDouble:x0];
          double v363 = [(RTMetric *)self metrics];
          [v363 setObject:v362 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_others"];

          v364 = NSNumber;
          v365 = [v5 objectForKeyedSubscript:v9];
          v366 = [v365 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
          [v366 doubleValue];
          v367 = [v364 numberWithDouble:x0];
          v368 = [(RTMetric *)self metrics];
          [v368 setObject:v367 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_others"];

          v369 = NSNumber;
          v370 = [v5 objectForKeyedSubscript:v9];
          v371 = [v370 objectForKeyedSubscript:@"percentage_of_days_with_screenLock"];
          [v371 doubleValue];
          v372 = [v369 numberWithDouble:x0];
          v373 = [(RTMetric *)self metrics];
          [v373 setObject:v372 forKeyedSubscript:@"percentage_of_days_with_screenLock_others"];

          v374 = NSNumber;
          v375 = [v5 objectForKeyedSubscript:v9];
          v376 = [v375 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration"];
          [v376 doubleValue];
          uint64_t v377 = [v374 numberWithDouble:];
          uint64_t v378 = [(RTMetric *)self metrics];
          [v378 setObject:v377 forKeyedSubscript:@"median_daily_total_screen_lock_duration_others"];

          uint64_t v379 = NSNumber;
          v380 = [v5 objectForKeyedSubscript:v9];
          v381 = [v380 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration"];
          [v381 doubleValue];
          v382 = [v379 numberWithDouble:];
          v383 = [(RTMetric *)self metrics];
          [v383 setObject:v382 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_others"];

          v384 = NSNumber;
          v385 = [v5 objectForKeyedSubscript:v9];
          v386 = [v385 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration"];
          [v386 doubleValue];
          v387 = [v384 numberWithDouble:x0];
          v388 = [(RTMetric *)self metrics];
          [v388 setObject:v387 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_others"];

          v389 = NSNumber;
          uint64_t v390 = [v5 objectForKeyedSubscript:v9];
          uint64_t v391 = [v390 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration"];
          [v391 doubleValue];
          uint64_t v392 = [v389 numberWithDouble:];
          v393 = [(RTMetric *)self metrics];
          [v393 setObject:v392 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_others"];

          v394 = NSNumber;
          v395 = [v5 objectForKeyedSubscript:v9];
          v396 = [v395 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];
          [v396 doubleValue];
          v397 = [v394 numberWithDouble:];
          v398 = [(RTMetric *)self metrics];
          [v398 setObject:v397 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_others"];

          v399 = NSNumber;
          v400 = [v5 objectForKeyedSubscript:v9];
          v401 = [v400 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
          [v401 doubleValue];
          v402 = [v399 numberWithDouble:x0];
          uint64_t v403 = [(RTMetric *)self metrics];
          [v403 setObject:v402 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_others"];

          uint64_t v404 = NSNumber;
          uint64_t v405 = [v5 objectForKeyedSubscript:v9];
          v406 = [v405 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];
          [v406 doubleValue];
          v407 = [v404 numberWithDouble:x0];
          v408 = [(RTMetric *)self metrics];
          [v408 setObject:v407 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_others"];

          v409 = NSNumber;
          v410 = [v5 objectForKeyedSubscript:v9];
          v411 = [v410 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];
          [v411 doubleValue];
          v412 = [v409 numberWithDouble:x0];
          v413 = [(RTMetric *)self metrics];
          [v413 setObject:v412 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_others"];

          v414 = NSNumber;
          v415 = [v5 objectForKeyedSubscript:v9];
          uint64_t v416 = [v415 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];
          [v416 doubleValue];
          uint64_t v417 = [v414 numberWithDouble:];
          uint64_t v418 = [(RTMetric *)self metrics];
          [v418 setObject:v417 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_others"];

          v419 = NSNumber;
          v420 = [v5 objectForKeyedSubscript:v9];
          v421 = [v420 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];
          [v421 doubleValue];
          v422 = [v419 numberWithDouble:x0];
          v423 = [(RTMetric *)self metrics];
          [v423 setObject:v422 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_others"];

          v424 = NSNumber;
          v425 = [v5 objectForKeyedSubscript:v9];
          v426 = [v425 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v426 doubleValue];
          unint64_t v427 = [v424 numberWithDouble:];
          int v428 = [(RTMetric *)self metrics];
          [v428 setObject:v427 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_others"];

          double v429 = NSNumber;
          double v430 = [v5 objectForKeyedSubscript:v9];
          double v431 = [v430 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v431 doubleValue];
          v432 = [v429 numberWithDouble:x0];
          v433 = [(RTMetric *)self metrics];
          [v433 setObject:v432 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_others"];

          v434 = NSNumber;
          id v435 = [v5 objectForKeyedSubscript:v9];
          v436 = [v435 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];
          [v436 doubleValue];
          v437 = [v434 numberWithDouble:x0];
          v438 = [(RTMetric *)self metrics];
          [v438 setObject:v437 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_others"];

          uint64_t v439 = NSNumber;
          double v151 = [v5 objectForKeyedSubscript:v9];
          v152 = [v151 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];
          [v152 doubleValue];
          v153 = [v439 numberWithDouble:];
          v154 = [(RTMetric *)self metrics];
          double v155 = v154;
          v156 = v153;
          v157 = @"mean_daily_uninterrupted_WiFi_connection_stability_ratio_others";
        }
        [v154 setObject:v156 forKeyedSubscript:v157];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v444 objects:v448 count:16];
    }
    while (v7);
  }
  uint64_t v440 = [NSNumber numberWithUnsignedInteger:v442];
  uint64_t v441 = [(RTMetric *)self metrics];
  [v441 setObject:v440 forKeyedSubscript:@"data_source"];
}

+ (id)DataSourceToString:(unint64_t)a3
{
  uint64_t v3 = @"Unknown";
  if (a3 == 2) {
    uint64_t v3 = @"BiomeStream";
  }
  if (a3 == 1) {
    return @"CoreDuet";
  }
  else {
    return v3;
  }
}

+ (id)calculateMLFeaturesUsingBiomeManager:(id)a3 intervalDictionary:(id)a4 startDate:(id)a5 endDate:(id)a6 createBucketedFeatures:(BOOL)a7
{
  BOOL v483 = a7;
  uint64_t v593 = *MEMORY[0x1E4F143B8];
  id v485 = a3;
  id v10 = a4;
  id v11 = a5;
  id v488 = a6;
  id v522 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = (void *)MEMORY[0x1E4F28F60];
  v578[0] = MEMORY[0x1E4F143A8];
  v578[1] = 3221225472;
  v578[2] = __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke;
  v578[3] = &unk_1E6B94680;
  id v489 = v11;
  id v579 = v489;
  v515 = [v12 predicateWithBlock:v578];
  uint64_t v13 = objc_opt_new();
  long long v577 = 0u;
  long long v576 = 0u;
  long long v575 = 0u;
  long long v574 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v574 objects:v592 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v575;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v575 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v574 + 1) + 8 * i);
        double v19 = [v14 objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 filteredArrayUsingPredicate:v515];
        [v13 setObject:v20 forKeyedSubscript:v18];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v574 objects:v592 count:16];
    }
    while (v15);
  }

  id v505 = v13;
  if ([v505 count] && objc_msgSend(v489, "compare:", v488) != 1)
  {
    long long v573 = 0u;
    long long v572 = 0u;
    long long v571 = 0u;
    long long v570 = 0u;
    uint64_t v21 = [v505 allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v570 objects:v591 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v571;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v571 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v570 + 1) + 8 * j);
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v522 setObject:v26 forKeyedSubscript:v25];

          long long v27 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v28 = [v27 numberWithDouble:x0];
          long long v29 = [v522 objectForKeyedSubscript:v25];
          [v29 setObject:v28 forKeyedSubscript:@"percentage_of_days_with_charging"];

          long long v30 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v31 = [v30 numberWithDouble:];
          long long v32 = [v522 objectForKeyedSubscript:v25];
          [v32 setObject:v31 forKeyedSubscript:@"median_daily_total_charging_duration"];

          long long v33 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v34 = [v33 numberWithDouble:];
          double v35 = [v522 objectForKeyedSubscript:v25];
          [v35 setObject:v34 forKeyedSubscript:@"mean_daily_total_charging_duration"];

          double v36 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v37 = [v36 numberWithDouble:];
          long long v38 = [v522 objectForKeyedSubscript:v25];
          [v38 setObject:v37 forKeyedSubscript:@"SD_daily_total_charging_duration"];

          long long v39 = NSNumber;
          [&unk_1F3453718 doubleValue];
          int v40 = [v39 numberWithDouble:];
          id v41 = [v522 objectForKeyedSubscript:v25];
          [v41 setObject:v40 forKeyedSubscript:@"median_daily_longest_charging_duration"];

          long long v42 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v43 = [v42 numberWithDouble:];
          int v44 = [v522 objectForKeyedSubscript:v25];
          [v44 setObject:v43 forKeyedSubscript:@"mean_daily_longest_charging_duration"];

          double v45 = NSNumber;
          [&unk_1F3453718 doubleValue];
          int v46 = [v45 numberWithDouble:];
          id v47 = [v522 objectForKeyedSubscript:v25];
          [v47 setObject:v46 forKeyedSubscript:@"SD_daily_longest_charging_duration"];

          long long v48 = NSNumber;
          [&unk_1F3453718 doubleValue];
          long long v49 = [v48 numberWithDouble:];
          double v50 = [v522 objectForKeyedSubscript:v25];
          [v50 setObject:v49 forKeyedSubscript:@"percentage_of_days_with_staticMotion"];

          id v51 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v52 = [v51 numberWithDouble:];
          uint64_t v53 = [v522 objectForKeyedSubscript:v25];
          [v53 setObject:v52 forKeyedSubscript:@"median_daily_total_static_motion_duration"];

          double v54 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v55 = [v54 numberWithDouble:x0];
          uint64_t v56 = [v522 objectForKeyedSubscript:v25];
          [v56 setObject:v55 forKeyedSubscript:@"mean_daily_total_static_motion_duration"];

          uint64_t v57 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v58 = [v57 numberWithDouble:];
          double v59 = [v522 objectForKeyedSubscript:v25];
          [v59 setObject:v58 forKeyedSubscript:@"SD_daily_total_static_motion_duration"];

          double v60 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v61 = [v60 numberWithDouble:x0];
          double v62 = [v522 objectForKeyedSubscript:v25];
          [v62 setObject:v61 forKeyedSubscript:@"median_daily_longest_static_motion_duration"];

          double v63 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v64 = [v63 numberWithDouble:];
          v65 = [v522 objectForKeyedSubscript:v25];
          [v65 setObject:v64 forKeyedSubscript:@"mean_daily_longest_static_motion_duration"];

          v66 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v67 = [v66 numberWithDouble:];
          uint64_t v68 = [v522 objectForKeyedSubscript:v25];
          [v68 setObject:v67 forKeyedSubscript:@"SD_daily_longest_static_motion_duration"];

          double v69 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v70 = [v69 numberWithDouble:];
          id v71 = [v522 objectForKeyedSubscript:v25];
          [v71 setObject:v70 forKeyedSubscript:@"percentage_of_days_with_screenLock"];

          double v72 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v73 = [v72 numberWithDouble:x0];
          double v74 = [v522 objectForKeyedSubscript:v25];
          [v74 setObject:v73 forKeyedSubscript:@"median_daily_total_screen_lock_duration"];

          v75 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v76 = [v75 numberWithDouble:];
          v77 = [v522 objectForKeyedSubscript:v25];
          [v77 setObject:v76 forKeyedSubscript:@"mean_daily_total_screen_lock_duration"];

          v78 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v79 = [v78 numberWithDouble:];
          v80 = [v522 objectForKeyedSubscript:v25];
          [v80 setObject:v79 forKeyedSubscript:@"SD_daily_total_screen_lock_duration"];

          double v81 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v82 = [v81 numberWithDouble:x0];
          double v83 = [v522 objectForKeyedSubscript:v25];
          [v83 setObject:v82 forKeyedSubscript:@"median_daily_longest_screen_lock_duration"];

          v84 = NSNumber;
          [&unk_1F3453718 doubleValue];
          double v85 = [v84 numberWithDouble:];
          v86 = [v522 objectForKeyedSubscript:v25];
          [v86 setObject:v85 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];

          uint64_t v87 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v88 = [v87 numberWithDouble:];
          uint64_t v89 = [v522 objectForKeyedSubscript:v25];
          [v89 setObject:v88 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];

          uint64_t v90 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v91 = [v90 numberWithDouble:x0];
          char v92 = [v522 objectForKeyedSubscript:v25];
          [v92 setObject:v91 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];

          id v93 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v94 = [v93 numberWithDouble:];
          uint64_t v95 = [v522 objectForKeyedSubscript:v25];
          [v95 setObject:v94 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];

          v96 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v97 = [v96 numberWithDouble:x0];
          uint64_t v98 = [v522 objectForKeyedSubscript:v25];
          [v98 setObject:v97 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];

          v99 = NSNumber;
          [&unk_1F3453718 doubleValue];
          v100 = [v99 numberWithDouble:x0];
          unint64_t v101 = [v522 objectForKeyedSubscript:v25];
          [v101 setObject:v100 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];

          v102 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v103 = [v102 numberWithDouble:];
          v104 = [v522 objectForKeyedSubscript:v25];
          [v104 setObject:v103 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];

          uint64_t v105 = NSNumber;
          [&unk_1F3453718 doubleValue];
          unint64_t v106 = [v105 numberWithDouble:];
          uint64_t v107 = [v522 objectForKeyedSubscript:v25];
          [v107 setObject:v106 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];

          uint64_t v108 = NSNumber;
          [&unk_1F3453718 doubleValue];
          uint64_t v109 = [v108 numberWithDouble:x0];
          uint64_t v110 = [v522 objectForKeyedSubscript:v25];
          [v110 setObject:v109 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];

          v111 = NSNumber;
          [&unk_1F3453718 doubleValue];
          unint64_t v112 = [v111 numberWithDouble:x0];
          v113 = [v522 objectForKeyedSubscript:v25];
          [v113 setObject:v112 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];

          double v114 = objc_opt_new();
          v115 = [v522 objectForKeyedSubscript:v25];
          [v115 setObject:v114 forKeyedSubscript:@"eventHappenedArray"];

          uint64_t v116 = objc_opt_new();
          v117 = [v522 objectForKeyedSubscript:v25];
          [v117 setObject:v116 forKeyedSubscript:@"eventLongestArray"];

          double v118 = objc_opt_new();
          double v119 = [v522 objectForKeyedSubscript:v25];
          [v119 setObject:v118 forKeyedSubscript:@"eventTotalArray"];

          double v120 = objc_opt_new();
          v121 = [v522 objectForKeyedSubscript:v25];
          [v121 setObject:v120 forKeyedSubscript:@"wifiStabilityArray"];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v570 objects:v591 count:16];
      }
      while (v22);
    }

    double v122 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"Charging" secondObject:&unk_1F3450420];
    v590[0] = v122;
    v123 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"StaticMotion" secondObject:&unk_1F3450438];
    v590[1] = v123;
    double v124 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"ScreenLock" secondObject:&unk_1F3450450];
    v590[2] = v124;
    uint64_t v125 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:@"WiFiConnection" secondObject:&unk_1F3450468];
    v590[3] = v125;
    uint64_t v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v590 count:4];

    BOOL v486 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v487 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    id v484 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    double v480 = [v488 dateByAddingTimeInterval:-2419200.0];
    long long v568 = 0u;
    long long v569 = 0u;
    long long v566 = 0u;
    long long v567 = 0u;
    obuint64_t j = v126;
    uint64_t v481 = [obj countByEnumeratingWithState:&v566 objects:v589 count:16];
    if (v481)
    {
      uint64_t v476 = *(void *)v567;
      do
      {
        uint64_t v127 = 0;
        do
        {
          if (*(void *)v567 != v476)
          {
            uint64_t v128 = v127;
            objc_enumerationMutation(obj);
            uint64_t v127 = v128;
          }
          uint64_t v477 = v127;
          v129 = *(void **)(*((void *)&v566 + 1) + 8 * v127);
          v478 = (void *)MEMORY[0x1E016D870]();
          uint64_t v506 = [v129 firstObject];
          BOOL v130 = [v129 secondObject];
          uint64_t v490 = [v130 integerValue];

          [v487 setDay:0];
          v131 = [v486 dateByAddingComponents:v487 toDate:v489 options:0];
          [v484 setDay:0];
          id v494 = [v486 dateByAddingComponents:v484 toDate:v489 options:0];
          id v132 = [v494 earlierDate:v488];
          LODWORD(v130) = v132 == v494;

          if (v130)
          {
            while (1)
            {
              uint64_t v474 = (void *)MEMORY[0x1E016D870]();
              [v484 setDay:[v484 day] + 3];
              double v482 = [v486 dateByAddingComponents:v484 toDate:v489 options:0];
              uint64_t v475 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v494 endDate:v482];
              uint64_t v560 = 0;
              long long v561 = &v560;
              uint64_t v562 = 0x3032000000;
              uint64_t v563 = __Block_byref_object_copy__41;
              uint64_t v564 = __Block_byref_object_dispose__41;
              id v565 = (id)objc_opt_new();
              BOOL v195 = [v475 endDate];
              id v196 = [v480 earlierDate:v195];
              BOOL v197 = v196 == v480;

              if (v197)
              {
                v559[0] = MEMORY[0x1E4F143A8];
                v559[1] = 3221225472;
                v559[2] = __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke_1706;
                v559[3] = &unk_1E6B946D0;
                v559[4] = &v560;
                [v485 enumerateEventsWithinDateInterval:v475 streamType:v490 handler:v559];
              }
              int v493 = 1;
              while (1)
              {
                uint64_t v198 = [v131 earlierDate:v488];
                uint64_t v517 = v131;
                BOOL v199 = v198 == v131;

                if (!v199) {
                  break;
                }
                [v487 setDay:[v487 day] + 1];
                uint64_t v200 = [v486 dateByAddingComponents:v487 toDate:v489 options:0];
                uint64_t v520 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v131 endDate:v200];
                id v508 = (void *)v200;
                v499 = objc_opt_new();
                long long v557 = 0u;
                long long v558 = 0u;
                long long v555 = 0u;
                long long v556 = 0u;
                id v201 = (id)v561[5];
                uint64_t v202 = [v201 countByEnumeratingWithState:&v555 objects:v588 count:16];
                if (v202)
                {
                  uint64_t v203 = *(void *)v556;
                  do
                  {
                    for (uint64_t k = 0; k != v202; ++k)
                    {
                      if (*(void *)v556 != v203) {
                        objc_enumerationMutation(v201);
                      }
                      id v205 = *(void **)(*((void *)&v555 + 1) + 8 * k);
                      uint64_t v206 = [v205 startDate];
                      double v207 = [v517 earlierDate:v206];
                      if (v207 == v517)
                      {
                        double v208 = [v205 startDate];
                        BOOL v209 = [v208 earlierDate:v508];
                        double v210 = [v205 startDate];
                        BOOL v211 = v209 == v210;

                        if (v211) {
                          [v499 addObject:v205];
                        }
                      }
                      else
                      {
                      }
                    }
                    uint64_t v202 = [v201 countByEnumeratingWithState:&v555 objects:v588 count:16];
                  }
                  while (v202);
                }

                if ([v499 count])
                {
                  long long v549 = 0uLL;
                  long long v550 = 0uLL;
                  long long v547 = 0uLL;
                  long long v548 = 0uLL;
                  uint64_t v212 = [v522 allKeys];
                  uint64_t v213 = [v212 countByEnumeratingWithState:&v547 objects:v586 count:16];
                  if (v213)
                  {
                    uint64_t v214 = *(void *)v548;
                    do
                    {
                      for (uint64_t m = 0; m != v213; ++m)
                      {
                        if (*(void *)v548 != v214) {
                          objc_enumerationMutation(v212);
                        }
                        uint64_t v216 = *(void *)(*((void *)&v547 + 1) + 8 * m);
                        v217 = [v522 objectForKeyedSubscript:v216];
                        [v217 setObject:&unk_1F34537E8 forKeyedSubscript:@"eventTotalDaily"];

                        v218 = [v522 objectForKeyedSubscript:v216];
                        [v218 setObject:&unk_1F34537E8 forKeyedSubscript:@"eventLongestDaily"];

                        uint64_t v219 = [v522 objectForKeyedSubscript:v216];
                        [v219 setObject:&unk_1F34537E8 forKeyedSubscript:@"wifiTotalDaily"];

                        double v220 = [v522 objectForKeyedSubscript:v216];
                        [v220 setObject:&unk_1F34537E8 forKeyedSubscript:@"visitTotalDaily"];
                      }
                      uint64_t v213 = [v212 countByEnumeratingWithState:&v547 objects:v586 count:16];
                    }
                    while (v213);
                  }

                  long long v545 = 0u;
                  long long v546 = 0u;
                  long long v543 = 0u;
                  long long v544 = 0u;
                  id v510 = v499;
                  uint64_t v221 = [v510 countByEnumeratingWithState:&v543 objects:v585 count:16];
                  if (v221)
                  {
                    uint64_t v513 = *(void *)v544;
                    do
                    {
                      for (uint64_t n = 0; n != v221; ++n)
                      {
                        if (*(void *)v544 != v513) {
                          objc_enumerationMutation(v510);
                        }
                        double v223 = *(void **)(*((void *)&v543 + 1) + 8 * n);
                        double v224 = (void *)MEMORY[0x1E016D870]();
                        double v225 = [a1 labelAnEventInterval:v223 basedOnIntervalDict:v505];
                        double v226 = [v505 objectForKeyedSubscript:v225];

                        if (v226)
                        {
                          uint64_t v227 = NSNumber;
                          double v228 = [v522 objectForKeyedSubscript:v225];
                          double v229 = [v228 objectForKeyedSubscript:@"eventTotalDaily"];
                          [v229 doubleValue];
                          double v231 = v230;
                          [v223 duration];
                          double v233 = [v227 numberWithDouble:v231 + v232];
                          double v234 = [v522 objectForKeyedSubscript:v225];
                          [v234 setObject:v233 forKeyedSubscript:@"eventTotalDaily"];

                          [v223 duration];
                          double v236 = v235;
                          double v237 = [v522 objectForKeyedSubscript:v225];
                          BOOL v238 = [v237 objectForKeyedSubscript:@"eventLongestDaily"];
                          [v238 doubleValue];
                          BOOL v240 = v236 > v239;

                          if (v240)
                          {
                            long long v241 = NSNumber;
                            [v223 duration];
                            int v242 = [v241 numberWithDouble:];
                            int v243 = [v522 objectForKeyedSubscript:v225];
                            [v243 setObject:v242 forKeyedSubscript:@"eventLongestDaily"];
                          }
                          if ([v506 isEqual:@"WiFiConnection"])
                          {
                            int v244 = [v520 intersectionWithDateInterval:v223];
                            int v245 = v244;
                            if (v244)
                            {
                              double v246 = [v244 endDate];
                              double v247 = [v245 startDate];
                              [v246 timeIntervalSinceDate:v247];
                              double v249 = v248;

                              v250 = NSNumber;
                              double v251 = [v522 objectForKeyedSubscript:v225];
                              uint64_t v252 = [v251 objectForKeyedSubscript:@"wifiTotalDaily"];
                              [v252 doubleValue];
                              v254 = [v250 numberWithDouble:v249 + v253];
                              uint64_t v255 = [v522 objectForKeyedSubscript:v225];
                              [v255 setObject:v254 forKeyedSubscript:@"wifiTotalDaily"];
                            }
                          }
                        }
                      }
                      uint64_t v221 = [v510 countByEnumeratingWithState:&v543 objects:v585 count:16];
                    }
                    while (v221);
                  }

                  long long v541 = 0u;
                  long long v542 = 0u;
                  long long v539 = 0u;
                  long long v540 = 0u;
                  uint64_t v256 = [v522 allKeys];
                  uint64_t v257 = [v256 countByEnumeratingWithState:&v539 objects:v584 count:16];
                  if (v257)
                  {
                    id v497 = v256;
                    contexta = *(void **)v540;
                    while (1)
                    {
                      uint64_t v514 = 0;
                      uint64_t v504 = v257;
                      do
                      {
                        if (*(void **)v540 != contexta) {
                          objc_enumerationMutation(v497);
                        }
                        uint64_t v258 = *(void *)(*((void *)&v539 + 1) + 8 * v514);
                        id v511 = (id)MEMORY[0x1E016D870]();
                        double v259 = [v522 objectForKeyedSubscript:v258];
                        BOOL v260 = [v259 objectForKeyedSubscript:@"eventTotalDaily"];
                        [v260 doubleValue];
                        BOOL v262 = v261 > 0.0;

                        if (v262)
                        {
                          v263 = [v522 objectForKeyedSubscript:v258];
                          v264 = [v263 objectForKeyedSubscript:@"eventHappenedArray"];
                          [v264 addObject:&unk_1F3453748];

                          v265 = [v522 objectForKeyedSubscript:v258];
                          v266 = [v265 objectForKeyedSubscript:@"eventTotalArray"];
                          v267 = NSNumber;
                          v268 = [v522 objectForKeyedSubscript:v258];
                          v269 = [v268 objectForKeyedSubscript:@"eventTotalDaily"];
                          [v269 doubleValue];
                          v270 = [v267 numberWithDouble:x0];
                          [v266 addObject:v270];

                          v271 = [v522 objectForKeyedSubscript:v258];
                          v272 = [v271 objectForKeyedSubscript:@"eventLongestArray"];
                          v273 = NSNumber;
                          v274 = [v522 objectForKeyedSubscript:v258];
                          v275 = [v274 objectForKeyedSubscript:@"eventLongestDaily"];
                          [v275 doubleValue];
                          uint64_t v276 = [v273 numberWithDouble:];
                          [v272 addObject:v276];

                          if (![v506 isEqual:@"WiFiConnection"]) {
                            goto LABEL_107;
                          }
                          long long v537 = 0u;
                          long long v538 = 0u;
                          long long v535 = 0u;
                          long long v536 = 0u;
                          uint64_t v277 = [v505 objectForKeyedSubscript:v258];
                          uint64_t v278 = [v277 countByEnumeratingWithState:&v535 objects:v583 count:16];
                          if (v278)
                          {
                            uint64_t v279 = *(void *)v536;
                            do
                            {
                              for (iuint64_t i = 0; ii != v278; ++ii)
                              {
                                if (*(void *)v536 != v279) {
                                  objc_enumerationMutation(v277);
                                }
                                uint64_t v281 = [v520 intersectionWithDateInterval:*(void *)(*((void *)&v535 + 1) + 8 * ii)];
                                uint64_t v282 = v281;
                                if (v281)
                                {
                                  double v283 = [v281 endDate];
                                  double v284 = [v282 startDate];
                                  [v283 timeIntervalSinceDate:v284];
                                  double v286 = v285;

                                  int v287 = NSNumber;
                                  double v288 = [v522 objectForKeyedSubscript:v258];
                                  v289 = [v288 objectForKeyedSubscript:@"visitTotalDaily"];
                                  [v289 doubleValue];
                                  v291 = [v287 numberWithDouble:v286 + v290];
                                  v292 = [v522 objectForKeyedSubscript:v258];
                                  [v292 setObject:v291 forKeyedSubscript:@"visitTotalDaily"];
                                }
                              }
                              uint64_t v278 = [v277 countByEnumeratingWithState:&v535 objects:v583 count:16];
                            }
                            while (v278);
                          }

                          double v293 = [v522 objectForKeyedSubscript:v258];
                          double v294 = [v293 objectForKeyedSubscript:@"wifiTotalDaily"];
                          [v294 doubleValue];
                          double v296 = v295;

                          double v297 = [v522 objectForKeyedSubscript:v258];
                          double v298 = [v297 objectForKeyedSubscript:@"visitTotalDaily"];
                          [v298 doubleValue];
                          double v300 = v299;

                          if (v296 <= 0.0 || v300 <= 0.0)
                          {
                            v301 = [v522 objectForKeyedSubscript:v258];
                            uint64_t v302 = [v301 objectForKeyedSubscript:@"wifiStabilityArray"];
                            [v302 addObject:&unk_1F34537E8];
                          }
                          else
                          {
                            v301 = [v522 objectForKeyedSubscript:v258];
                            uint64_t v302 = [v301 objectForKeyedSubscript:@"wifiStabilityArray"];
                            uint64_t v303 = [NSNumber numberWithDouble:v296 / v300];
                            [v302 addObject:v303];
                          }
                        }
                        else
                        {
                          v301 = [v522 objectForKeyedSubscript:v258];
                          uint64_t v302 = [v301 objectForKeyedSubscript:@"eventHappenedArray"];
                          [v302 addObject:&unk_1F34537E8];
                        }

LABEL_107:
                        ++v514;
                      }
                      while (v514 != v504);
                      uint64_t v257 = [v497 countByEnumeratingWithState:&v539 objects:v584 count:16];
                      if (!v257)
                      {
                        uint64_t v256 = v497;
                        break;
                      }
                    }
                  }
                }
                else
                {
                  long long v553 = 0uLL;
                  long long v554 = 0uLL;
                  long long v551 = 0uLL;
                  long long v552 = 0uLL;
                  uint64_t v256 = [v522 allKeys];
                  uint64_t v304 = [v256 countByEnumeratingWithState:&v551 objects:v587 count:16];
                  if (v304)
                  {
                    uint64_t v305 = *(void *)v552;
                    do
                    {
                      for (juint64_t j = 0; jj != v304; ++jj)
                      {
                        if (*(void *)v552 != v305) {
                          objc_enumerationMutation(v256);
                        }
                        uint64_t v307 = [v522 objectForKeyedSubscript:*(void *)(*((void *)&v551 + 1) + 8 * jj)];
                        v308 = [v307 objectForKeyedSubscript:@"eventHappenedArray"];
                        [v308 addObject:&unk_1F34537E8];
                      }
                      uint64_t v304 = [v256 countByEnumeratingWithState:&v551 objects:v587 count:16];
                    }
                    while (v304);
                  }
                }

                uint64_t v133 = v508;
                v131 = v508;
                if (++v493 == 4) {
                  goto LABEL_122;
                }
              }
              uint64_t v133 = v131;
LABEL_122:

              _Block_object_dispose(&v560, 8);
              BOOL v309 = [v482 earlierDate:v488];
              BOOL v310 = v309 == v482;

              v131 = v133;
              id v494 = v482;
              if (!v310) {
                goto LABEL_24;
              }
            }
          }
          double v482 = v494;
          uint64_t v133 = v131;
LABEL_24:
          long long v533 = 0u;
          long long v534 = 0u;
          long long v531 = 0u;
          long long v532 = 0u;
          id v495 = [v522 allKeys];
          uint64_t v498 = [v495 countByEnumeratingWithState:&v531 objects:v582 count:16];
          if (!v498) {
            goto LABEL_47;
          }
          id v496 = *(id *)v532;
          do
          {
            for (kuint64_t k = 0; kk != v498; ++kk)
            {
              if (*(id *)v532 != v496) {
                objc_enumerationMutation(v495);
              }
              uint64_t v135 = *(void *)(*((void *)&v531 + 1) + 8 * kk);
              context = (void *)MEMORY[0x1E016D870]();
              v136 = [v522 objectForKeyedSubscript:v135];
              v137 = [v136 objectForKeyedSubscript:@"eventHappenedArray"];

              unint64_t v138 = [v522 objectForKeyedSubscript:v135];
              uint64_t v139 = [v138 objectForKeyedSubscript:@"eventTotalArray"];

              v140 = [v522 objectForKeyedSubscript:v135];
              uint64_t v141 = [v140 objectForKeyedSubscript:@"eventLongestArray"];

              if ([v137 count])
              {
                uint64_t v142 = NSNumber;
                uint64_t v143 = +[RTPlaceDataMetrics meanOf:v137];
                [v143 doubleValue];
                v503 = [v142 numberWithDouble:x0];
              }
              else
              {
                v503 = &unk_1F3453718;
              }
              uint64_t v144 = [v139 count];
              v145 = &unk_1F3453718;
              uint64_t v516 = &unk_1F3453718;
              v519 = &unk_1F3453718;
              id v509 = &unk_1F3453718;
              id v512 = &unk_1F3453718;
              uint64_t v507 = &unk_1F3453718;
              if (v144 == [v141 count])
              {
                if ([v139 count])
                {
                  v146 = NSNumber;
                  v147 = +[RTPlaceDataMetrics medianOf:v139];
                  [v147 doubleValue];
                  v519 = [v146 numberWithDouble:];

                  v148 = NSNumber;
                  v149 = +[RTPlaceDataMetrics meanOf:v139];
                  [v149 doubleValue];
                  uint64_t v516 = [v148 numberWithDouble:x0];

                  v150 = NSNumber;
                  double v151 = +[RTPlaceDataMetrics standardDeviationOf:v139];
                  [v151 doubleValue];
                  id v512 = [v150 numberWithDouble:x0];

                  v152 = NSNumber;
                  v153 = +[RTPlaceDataMetrics medianOf:v141];
                  [v153 doubleValue];
                  [v152 numberWithDouble:];
                  id v509 = (id)objc_claimAutoreleasedReturnValue();

                  v154 = NSNumber;
                  double v155 = +[RTPlaceDataMetrics meanOf:v141];
                  [v155 doubleValue];
                  uint64_t v507 = [v154 numberWithDouble:];

                  v156 = NSNumber;
                  v157 = +[RTPlaceDataMetrics standardDeviationOf:v141];
                  [v157 doubleValue];
                  v145 = [v156 numberWithDouble:];
                }
                else
                {
                  uint64_t v516 = &unk_1F3453718;
                  v519 = &unk_1F3453718;
                  id v509 = &unk_1F3453718;
                  id v512 = &unk_1F3453718;
                  uint64_t v507 = &unk_1F3453718;
                }
              }
              if ([v506 isEqual:@"Charging"])
              {
                char v158 = [v522 objectForKeyedSubscript:v135];
                [v158 setObject:v503 forKeyedSubscript:@"percentage_of_days_with_charging"];

                double v159 = [v522 objectForKeyedSubscript:v135];
                [v159 setObject:v519 forKeyedSubscript:@"median_daily_total_charging_duration"];

                v160 = [v522 objectForKeyedSubscript:v135];
                [v160 setObject:v516 forKeyedSubscript:@"mean_daily_total_charging_duration"];

                v161 = [v522 objectForKeyedSubscript:v135];
                [v161 setObject:v512 forKeyedSubscript:@"SD_daily_total_charging_duration"];

                v162 = [v522 objectForKeyedSubscript:v135];
                [v162 setObject:v509 forKeyedSubscript:@"median_daily_longest_charging_duration"];

                v163 = [v522 objectForKeyedSubscript:v135];
                [v163 setObject:v507 forKeyedSubscript:@"mean_daily_longest_charging_duration"];

                v164 = [v522 objectForKeyedSubscript:v135];
                [v164 setObject:v145 forKeyedSubscript:@"SD_daily_longest_charging_duration"];
              }
              else if ([v506 isEqual:@"StaticMotion"])
              {
                v165 = [v522 objectForKeyedSubscript:v135];
                [v165 setObject:v503 forKeyedSubscript:@"percentage_of_days_with_staticMotion"];

                v166 = [v522 objectForKeyedSubscript:v135];
                [v166 setObject:v519 forKeyedSubscript:@"median_daily_total_static_motion_duration"];

                v167 = [v522 objectForKeyedSubscript:v135];
                [v167 setObject:v516 forKeyedSubscript:@"mean_daily_total_static_motion_duration"];

                id v168 = [v522 objectForKeyedSubscript:v135];
                [v168 setObject:v512 forKeyedSubscript:@"SD_daily_total_static_motion_duration"];

                v169 = [v522 objectForKeyedSubscript:v135];
                [v169 setObject:v509 forKeyedSubscript:@"median_daily_longest_static_motion_duration"];

                unint64_t v170 = [v522 objectForKeyedSubscript:v135];
                [v170 setObject:v507 forKeyedSubscript:@"mean_daily_longest_static_motion_duration"];

                v164 = [v522 objectForKeyedSubscript:v135];
                [v164 setObject:v145 forKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
              }
              else if ([v506 isEqual:@"ScreenLock"])
              {
                int v171 = [v522 objectForKeyedSubscript:v135];
                [v171 setObject:v503 forKeyedSubscript:@"percentage_of_days_with_screenLock"];

                double v172 = [v522 objectForKeyedSubscript:v135];
                [v172 setObject:v519 forKeyedSubscript:@"median_daily_total_screen_lock_duration"];

                v173 = [v522 objectForKeyedSubscript:v135];
                [v173 setObject:v516 forKeyedSubscript:@"mean_daily_total_screen_lock_duration"];

                v174 = [v522 objectForKeyedSubscript:v135];
                [v174 setObject:v512 forKeyedSubscript:@"SD_daily_total_screen_lock_duration"];

                v175 = [v522 objectForKeyedSubscript:v135];
                [v175 setObject:v509 forKeyedSubscript:@"median_daily_longest_screen_lock_duration"];

                v176 = [v522 objectForKeyedSubscript:v135];
                [v176 setObject:v507 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];

                v164 = [v522 objectForKeyedSubscript:v135];
                [v164 setObject:v145 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
              }
              else
              {
                if (![v506 isEqual:@"WiFiConnection"]) {
                  goto LABEL_45;
                }
                double v177 = [v522 objectForKeyedSubscript:v135];
                [v177 setObject:v503 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];

                double v178 = [v522 objectForKeyedSubscript:v135];
                [v178 setObject:v519 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];

                v179 = [v522 objectForKeyedSubscript:v135];
                [v179 setObject:v516 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];

                v180 = [v522 objectForKeyedSubscript:v135];
                [v180 setObject:v512 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];

                double v181 = [v522 objectForKeyedSubscript:v135];
                [v181 setObject:v509 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];

                v182 = [v522 objectForKeyedSubscript:v135];
                [v182 setObject:v507 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];

                uint64_t v183 = [v522 objectForKeyedSubscript:v135];
                [v183 setObject:v145 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];

                v184 = NSNumber;
                id v492 = [v522 objectForKeyedSubscript:v135];
                id v491 = [v492 objectForKeyedSubscript:@"wifiStabilityArray"];
                uint64_t v185 = +[RTPlaceDataMetrics meanOf:v491];
                [v185 doubleValue];
                v186 = [v184 numberWithDouble:x0];
                v187 = [v522 objectForKeyedSubscript:v135];
                [v187 setObject:v186 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];

                v164 = [v522 objectForKeyedSubscript:v135];
                v188 = [v164 objectForKeyedSubscript:@"wifiStabilityArray"];
                [v188 removeAllObjects];
              }
LABEL_45:
              double v189 = [v522 objectForKeyedSubscript:v135];
              double v190 = [v189 objectForKeyedSubscript:@"eventHappenedArray"];
              [v190 removeAllObjects];

              v191 = [v522 objectForKeyedSubscript:v135];
              double v192 = [v191 objectForKeyedSubscript:@"eventLongestArray"];
              [v192 removeAllObjects];

              uint64_t v193 = [v522 objectForKeyedSubscript:v135];
              v194 = [v193 objectForKeyedSubscript:@"eventTotalArray"];
              [v194 removeAllObjects];
            }
            uint64_t v498 = [v495 countByEnumeratingWithState:&v531 objects:v582 count:16];
          }
          while (v498);
LABEL_47:

          uint64_t v127 = v477 + 1;
        }
        while (v477 + 1 != v481);
        uint64_t v311 = [obj countByEnumeratingWithState:&v566 objects:v589 count:16];
        uint64_t v481 = v311;
      }
      while (v311);
    }

    long long v529 = 0u;
    long long v530 = 0u;
    long long v527 = 0u;
    long long v528 = 0u;
    uint64_t v312 = [v522 allKeys];
    uint64_t v313 = [v312 countByEnumeratingWithState:&v527 objects:v581 count:16];
    if (v313)
    {
      uint64_t v314 = *(void *)v528;
      do
      {
        for (muint64_t m = 0; mm != v313; ++mm)
        {
          if (*(void *)v528 != v314) {
            objc_enumerationMutation(v312);
          }
          uint64_t v316 = *(void *)(*((void *)&v527 + 1) + 8 * mm);
          v317 = [v522 objectForKeyedSubscript:v316];
          [v317 removeObjectForKey:@"eventHappenedArray"];

          v318 = [v522 objectForKeyedSubscript:v316];
          [v318 removeObjectForKey:@"eventLongestArray"];

          v319 = [v522 objectForKeyedSubscript:v316];
          [v319 removeObjectForKey:@"eventTotalArray"];

          v320 = [v522 objectForKeyedSubscript:v316];
          [v320 removeObjectForKey:@"wifiStabilityArray"];

          v321 = [v522 objectForKeyedSubscript:v316];
          [v321 removeObjectForKey:@"eventTotalDaily"];

          v322 = [v522 objectForKeyedSubscript:v316];
          [v322 removeObjectForKey:@"eventLongestDaily"];

          v323 = [v522 objectForKeyedSubscript:v316];
          [v323 removeObjectForKey:@"wifiTotalDaily"];

          v324 = [v522 objectForKeyedSubscript:v316];
          [v324 removeObjectForKey:@"visitTotalDaily"];
        }
        uint64_t v313 = [v312 countByEnumeratingWithState:&v527 objects:v581 count:16];
      }
      while (v313);
    }

    if (v483)
    {
      long long v525 = 0u;
      long long v526 = 0u;
      long long v523 = 0u;
      long long v524 = 0u;
      v325 = [v522 allKeys];
      uint64_t v521 = [v325 countByEnumeratingWithState:&v523 objects:v580 count:16];
      if (v521)
      {
        uint64_t v518 = *(void *)v524;
        do
        {
          for (nuint64_t n = 0; nn != v521; ++nn)
          {
            if (*(void *)v524 != v518) {
              objc_enumerationMutation(v325);
            }
            uint64_t v327 = *(void *)(*((void *)&v523 + 1) + 8 * nn);
            double v328 = [v522 objectForKeyedSubscript:v327];
            double v329 = [v328 objectForKeyedSubscript:@"percentage_of_days_with_charging"];
            double v330 = +[RTPlaceDataMetrics binArrayPercentage];
            double v331 = +[RTMetric binForNumber:v329 bins:v330];
            double v332 = [v522 objectForKeyedSubscript:v327];
            [v332 setObject:v331 forKeyedSubscript:@"percentage_of_days_with_charging_bucketed"];

            v333 = [v522 objectForKeyedSubscript:v327];
            v334 = [v333 objectForKeyedSubscript:@"median_daily_total_charging_duration"];
            v335 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            id v336 = +[RTMetric binForNumber:v334 bins:v335];
            id v337 = [v522 objectForKeyedSubscript:v327];
            [v337 setObject:v336 forKeyedSubscript:@"median_daily_total_charging_duration_bucketed"];

            v338 = [v522 objectForKeyedSubscript:v327];
            v339 = [v338 objectForKeyedSubscript:@"mean_daily_total_charging_duration"];
            v340 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v341 = +[RTMetric binForNumber:v339 bins:v340];
            uint64_t v342 = [v522 objectForKeyedSubscript:v327];
            [v342 setObject:v341 forKeyedSubscript:@"mean_daily_total_charging_duration_bucketed"];

            uint64_t v343 = [v522 objectForKeyedSubscript:v327];
            v344 = [v343 objectForKeyedSubscript:@"SD_daily_total_charging_duration"];
            uint64_t v345 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v346 = +[RTMetric binForNumber:v344 bins:v345];
            int v347 = [v522 objectForKeyedSubscript:v327];
            [v347 setObject:v346 forKeyedSubscript:@"SD_daily_total_charging_duration_bucketed"];

            v348 = [v522 objectForKeyedSubscript:v327];
            v349 = [v348 objectForKeyedSubscript:@"median_daily_longest_charging_duration"];
            v350 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v351 = +[RTMetric binForNumber:v349 bins:v350];
            v352 = [v522 objectForKeyedSubscript:v327];
            [v352 setObject:v351 forKeyedSubscript:@"median_daily_longest_charging_duration_bucketed"];

            double v353 = [v522 objectForKeyedSubscript:v327];
            v354 = [v353 objectForKeyedSubscript:@"mean_daily_longest_charging_duration"];
            double v355 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v356 = +[RTMetric binForNumber:v354 bins:v355];
            double v357 = [v522 objectForKeyedSubscript:v327];
            [v357 setObject:v356 forKeyedSubscript:@"mean_daily_longest_charging_duration_bucketed"];

            v358 = [v522 objectForKeyedSubscript:v327];
            double v359 = [v358 objectForKeyedSubscript:@"SD_daily_longest_charging_duration"];
            v360 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v361 = +[RTMetric binForNumber:v359 bins:v360];
            v362 = [v522 objectForKeyedSubscript:v327];
            [v362 setObject:v361 forKeyedSubscript:@"SD_daily_longest_charging_duration_bucketed"];

            double v363 = [v522 objectForKeyedSubscript:v327];
            v364 = [v363 objectForKeyedSubscript:@"percentage_of_days_with_staticMotion"];
            v365 = +[RTPlaceDataMetrics binArrayPercentage];
            v366 = +[RTMetric binForNumber:v364 bins:v365];
            v367 = [v522 objectForKeyedSubscript:v327];
            [v367 setObject:v366 forKeyedSubscript:@"percentage_of_days_with_staticMotion_bucketed"];

            v368 = [v522 objectForKeyedSubscript:v327];
            v369 = [v368 objectForKeyedSubscript:@"median_daily_total_static_motion_duration"];
            v370 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v371 = +[RTMetric binForNumber:v369 bins:v370];
            v372 = [v522 objectForKeyedSubscript:v327];
            [v372 setObject:v371 forKeyedSubscript:@"median_daily_total_static_motion_duration_bucketed"];

            v373 = [v522 objectForKeyedSubscript:v327];
            v374 = [v373 objectForKeyedSubscript:@"mean_daily_total_static_motion_duration"];
            v375 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v376 = +[RTMetric binForNumber:v374 bins:v375];
            uint64_t v377 = [v522 objectForKeyedSubscript:v327];
            [v377 setObject:v376 forKeyedSubscript:@"mean_daily_total_static_motion_duration_bucketed"];

            uint64_t v378 = [v522 objectForKeyedSubscript:v327];
            uint64_t v379 = [v378 objectForKeyedSubscript:@"SD_daily_total_static_motion_duration"];
            v380 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v381 = +[RTMetric binForNumber:v379 bins:v380];
            v382 = [v522 objectForKeyedSubscript:v327];
            [v382 setObject:v381 forKeyedSubscript:@"SD_daily_total_static_motion_duration_bucketed"];

            v383 = [v522 objectForKeyedSubscript:v327];
            v384 = [v383 objectForKeyedSubscript:@"median_daily_longest_static_motion_duration"];
            v385 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v386 = +[RTMetric binForNumber:v384 bins:v385];
            v387 = [v522 objectForKeyedSubscript:v327];
            [v387 setObject:v386 forKeyedSubscript:@"median_daily_longest_static_motion_duration_bucketed"];

            v388 = [v522 objectForKeyedSubscript:v327];
            v389 = [v388 objectForKeyedSubscript:@"mean_daily_longest_static_motion_duration"];
            uint64_t v390 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v391 = +[RTMetric binForNumber:v389 bins:v390];
            uint64_t v392 = [v522 objectForKeyedSubscript:v327];
            [v392 setObject:v391 forKeyedSubscript:@"mean_daily_longest_static_motion_duration_bucketed"];

            v393 = [v522 objectForKeyedSubscript:v327];
            v394 = [v393 objectForKeyedSubscript:@"SD_daily_longest_static_motion_duration"];
            v395 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v396 = +[RTMetric binForNumber:v394 bins:v395];
            v397 = [v522 objectForKeyedSubscript:v327];
            [v397 setObject:v396 forKeyedSubscript:@"SD_daily_longest_static_motion_duration_bucketed"];

            v398 = [v522 objectForKeyedSubscript:v327];
            v399 = [v398 objectForKeyedSubscript:@"percentage_of_days_with_screenLock"];
            v400 = +[RTPlaceDataMetrics binArrayPercentage];
            v401 = +[RTMetric binForNumber:v399 bins:v400];
            v402 = [v522 objectForKeyedSubscript:v327];
            [v402 setObject:v401 forKeyedSubscript:@"percentage_of_days_with_screenLock_bucketed"];

            uint64_t v403 = [v522 objectForKeyedSubscript:v327];
            uint64_t v404 = [v403 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration"];
            uint64_t v405 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v406 = +[RTMetric binForNumber:v404 bins:v405];
            v407 = [v522 objectForKeyedSubscript:v327];
            [v407 setObject:v406 forKeyedSubscript:@"median_daily_total_screen_lock_duration_bucketed"];

            v408 = [v522 objectForKeyedSubscript:v327];
            v409 = [v408 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration"];
            v410 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v411 = +[RTMetric binForNumber:v409 bins:v410];
            v412 = [v522 objectForKeyedSubscript:v327];
            [v412 setObject:v411 forKeyedSubscript:@"mean_daily_total_screen_lock_duration_bucketed"];

            v413 = [v522 objectForKeyedSubscript:v327];
            v414 = [v413 objectForKeyedSubscript:@"SD_daily_total_screen_lock_duration"];
            v415 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v416 = +[RTMetric binForNumber:v414 bins:v415];
            uint64_t v417 = [v522 objectForKeyedSubscript:v327];
            [v417 setObject:v416 forKeyedSubscript:@"SD_daily_total_screen_lock_duration_bucketed"];

            uint64_t v418 = [v522 objectForKeyedSubscript:v327];
            v419 = [v418 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration"];
            v420 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v421 = +[RTMetric binForNumber:v419 bins:v420];
            v422 = [v522 objectForKeyedSubscript:v327];
            [v422 setObject:v421 forKeyedSubscript:@"median_daily_longest_screen_lock_duration_bucketed"];

            v423 = [v522 objectForKeyedSubscript:v327];
            v424 = [v423 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration"];
            v425 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v426 = +[RTMetric binForNumber:v424 bins:v425];
            unint64_t v427 = [v522 objectForKeyedSubscript:v327];
            [v427 setObject:v426 forKeyedSubscript:@"mean_daily_longest_screen_lock_duration_bucketed"];

            int v428 = [v522 objectForKeyedSubscript:v327];
            double v429 = [v428 objectForKeyedSubscript:@"SD_daily_longest_screen_lock_duration"];
            double v430 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v431 = +[RTMetric binForNumber:v429 bins:v430];
            v432 = [v522 objectForKeyedSubscript:v327];
            [v432 setObject:v431 forKeyedSubscript:@"SD_daily_longest_screen_lock_duration_bucketed"];

            v433 = [v522 objectForKeyedSubscript:v327];
            v434 = [v433 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection"];
            id v435 = +[RTPlaceDataMetrics binArrayPercentage];
            v436 = +[RTMetric binForNumber:v434 bins:v435];
            v437 = [v522 objectForKeyedSubscript:v327];
            [v437 setObject:v436 forKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"];

            v438 = [v522 objectForKeyedSubscript:v327];
            uint64_t v439 = [v438 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration"];
            uint64_t v440 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            uint64_t v441 = +[RTMetric binForNumber:v439 bins:v440];
            unint64_t v442 = [v522 objectForKeyedSubscript:v327];
            [v442 setObject:v441 forKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            uint64_t v443 = [v522 objectForKeyedSubscript:v327];
            long long v444 = [v443 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration"];
            long long v445 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            long long v446 = +[RTMetric binForNumber:v444 bins:v445];
            long long v447 = [v522 objectForKeyedSubscript:v327];
            [v447 setObject:v446 forKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            double v448 = [v522 objectForKeyedSubscript:v327];
            uint64_t v449 = [v448 objectForKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration"];
            double v450 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v451 = +[RTMetric binForNumber:v449 bins:v450];
            double v452 = [v522 objectForKeyedSubscript:v327];
            [v452 setObject:v451 forKeyedSubscript:@"SD_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];

            v453 = [v522 objectForKeyedSubscript:v327];
            v454 = [v453 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration"];
            v455 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v456 = +[RTMetric binForNumber:v454 bins:v455];
            v457 = [v522 objectForKeyedSubscript:v327];
            [v457 setObject:v456 forKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            v458 = [v522 objectForKeyedSubscript:v327];
            unint64_t v459 = [v458 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration"];
            int v460 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            double v461 = +[RTMetric binForNumber:v459 bins:v460];
            double v462 = [v522 objectForKeyedSubscript:v327];
            [v462 setObject:v461 forKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            double v463 = [v522 objectForKeyedSubscript:v327];
            v464 = [v463 objectForKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration"];
            v465 = +[RTPlaceDataMetrics binArrayDuetEventDuration];
            v466 = +[RTMetric binForNumber:v464 bins:v465];
            id v467 = [v522 objectForKeyedSubscript:v327];
            [v467 setObject:v466 forKeyedSubscript:@"SD_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];

            v468 = [v522 objectForKeyedSubscript:v327];
            v469 = [v468 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio"];
            v470 = +[RTPlaceDataMetrics binArrayPercentage];
            uint64_t v471 = +[RTMetric binForNumber:v469 bins:v470];
            uint64_t v472 = [v522 objectForKeyedSubscript:v327];
            [v472 setObject:v471 forKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"];
          }
          uint64_t v521 = [v325 countByEnumeratingWithState:&v523 objects:v580 count:16];
        }
        while (v521);
      }
    }
  }

  return v522;
}

BOOL __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 endDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] != -1;

  return v4;
}

uint64_t __119__RTPlaceDataMetrics_calculateMLFeaturesUsingBiomeManager_intervalDictionary_startDate_endDate_createBucketedFeatures___block_invoke_1706(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (void)setDistanceThreshold:(double)a3
{
  self->_double distanceThreshold = a3;
}

- (NSArray)visitArray
{
  return self->_visitArray;
}

- (void)setVisitArray:(id)a3
{
}

- (RTLocation)locationHome
{
  return self->_locationHome;
}

- (void)setLocationHome:(id)a3
{
}

- (RTLocation)locationWork
{
  return self->_locationWork;
}

- (void)setLocationWork:(id)a3
{
}

- (NSArray)locationsOfOthers
{
  return self->_locationsOfOthers;
}

- (void)setLocationsOfOthers:(id)a3
{
}

- (NSDate)startDateTime
{
  return self->_startDateTime;
}

- (void)setStartDateTime:(id)a3
{
}

- (NSDate)endDateTime
{
  return self->_endDateTime;
}

- (void)setEndDateTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateTime, 0);
  objc_storeStrong((id *)&self->_startDateTime, 0);
  objc_storeStrong((id *)&self->_locationsOfOthers, 0);
  objc_storeStrong((id *)&self->_locationWork, 0);
  objc_storeStrong((id *)&self->_locationHome, 0);

  objc_storeStrong((id *)&self->_visitArray, 0);
}

@end