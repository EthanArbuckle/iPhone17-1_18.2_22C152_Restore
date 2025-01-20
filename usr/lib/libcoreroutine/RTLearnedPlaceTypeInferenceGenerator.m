@interface RTLearnedPlaceTypeInferenceGenerator
+ (id)getCandidateGenerationParameters;
+ (id)modelTypeToString:(unint64_t)a3;
+ (id)placeTypeClassificationSourceToString:(unint64_t)a3;
+ (id)placeTypeClassifierModelTargetClass:(unint64_t)a3;
+ (id)placeTypeClassifierModelThresholdForPlatform:(id)a3 placeType:(unint64_t)a4;
+ (id)sortPlaceStats:(id)a3;
- (BOOL)supportsModel;
- (NSDictionary)placeStatsUUIDStringsToMLFeaturesMap;
- (NSMutableArray)placeStats;
- (RTBiomeManager)biomeManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLearnedPlaceTypeInferenceGenerator)init;
- (RTLearnedPlaceTypeInferenceGenerator)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8;
- (RTLearnedVisit)firstVisit;
- (RTLearnedVisit)lastVisit;
- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator;
- (RTPlatform)platform;
- (id)_getCandidatePlaceStatsFromPlaceStats:(id)a3;
- (id)_getFullLocationHistoryDateInterval;
- (id)_inferPlaceTypesFromMultiClassModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5;
- (id)_inferPlaceTypesFromRankerModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5;
- (id)filterPlaceStats:(id)a3 referenceLearnedPlace:(id)a4 minDistanceThreshold:(id)a5 maxDistanceThreshold:(id)a6;
- (id)filteredPlaceStatsByWeeklyVisitThreshold:(double)a3 placeStats:(id)a4;
- (id)fuseInferences:(id)a3;
- (id)inferPlaceTypes;
- (id)inferPlaceTypesFromDailyPatternsWithPlaceStats:(id)a3 dateInterval:(id)a4;
- (id)inferPlaceTypesFromFallbackWithPlaceStats:(id)a3 dateInterval:(id)a4;
- (id)inferPlaceTypesFromModelForModelType:(unint64_t)a3 placeType:(unint64_t)a4 placeStats:(id)a5 metricsData:(id)a6;
- (id)inferPlaceTypesFromModelWithCandidateSelection:(BOOL)a3 homeModelType:(unint64_t)a4 workModelType:(unint64_t)a5 placeStats:(id)a6 dateInterval:(id)a7;
- (id)inferPlaceTypesFromModelWithPlaceStats:(id)a3 dateInterval:(id)a4;
- (id)inferPlaceTypesFromRuleEngineWithPlaceStats:(id)a3 dateInterval:(id)a4;
- (id)inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:(id)a3 dateInterval:(id)a4;
- (id)placeCandidateStatsForType:(unint64_t)a3 placeStats:(id)a4 dateInterval:(id)a5 excludingPlaces:(id)a6 parameters:(id)a7 distanceThreshold:(double)a8;
- (id)placeCandidatesFromDailyPatternsForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5;
- (id)placeCandidatesFromTopMedianDwellTimeForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5;
- (void)_prepareMLFeaturesWithPlaceStats:(id)a3;
- (void)log;
- (void)setBiomeManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setFirstVisit:(id)a3;
- (void)setLastVisit:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setPlaceStats:(id)a3;
- (void)setPlaceStatsUUIDStringsToMLFeaturesMap:(id)a3;
- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3;
- (void)setPlatform:(id)a3;
- (void)submitVisits:(id)a3 place:(id)a4;
@end

@implementation RTLearnedPlaceTypeInferenceGenerator

- (RTLearnedPlaceTypeInferenceGenerator)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_defaultsManager_distanceCalculator_learnedLocationStore_placeTypeClassifierMetricsCalculator_platform_);
}

- (RTLearnedPlaceTypeInferenceGenerator)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v33 = a6;
  id v34 = a7;
  id v18 = a8;
  if (!v15)
  {
    v27 = v18;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: biomeManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v27 = v18;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_17;
  }
  if (!v17)
  {
    v27 = v18;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v29 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v34)
  {
    v27 = v18;
    v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
      goto LABEL_17;
    }
LABEL_18:

    v25 = 0;
    v26 = v33;
    goto LABEL_19;
  }
  id v32 = v18;
  if (v18)
  {
    v35.receiver = self;
    v35.super_class = (Class)RTLearnedPlaceTypeInferenceGenerator;
    v19 = [(RTLearnedPlaceTypeInferenceGenerator *)&v35 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_biomeManager, a3);
      objc_storeStrong((id *)&v20->_defaultsManager, a4);
      objc_storeStrong((id *)&v20->_distanceCalculator, a5);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a6);
      objc_storeStrong((id *)&v20->_placeTypeClassifierMetricsCalculator, a7);
      objc_storeStrong((id *)&v20->_platform, a8);
      uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      placeStats = v20->_placeStats;
      v20->_placeStats = (NSMutableArray *)v21;

      uint64_t v23 = objc_opt_new();
      placeStatsUUIDStringsToMLFeaturesMap = v20->_placeStatsUUIDStringsToMLFeaturesMap;
      v20->_placeStatsUUIDStringsToMLFeaturesMap = (NSDictionary *)v23;
    }
    self = v20;
    v25 = self;
    v26 = v33;
  }
  else
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = v33;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v25 = 0;
  }
  v27 = v32;
LABEL_19:

  return v25;
}

+ (id)placeTypeClassificationSourceToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9C8D0[a3 - 1];
  }
}

+ (id)modelTypeToString:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Ranker";
  }
  if (a3 == 1) {
    return @"MultiClass";
  }
  else {
    return v3;
  }
}

+ (id)placeTypeClassifierModelThresholdForPlatform:(id)a3 placeType:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = &unk_1F3453EA8;
    goto LABEL_11;
  }
  if (a4 != 2)
  {
LABEL_10:
    v7 = &unk_1F3453EE8;
    goto LABEL_11;
  }
  if (![v5 iPhonePlatform])
  {
    if ([v6 watchPlatform])
    {
      v7 = &unk_1F3453ED8;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v6 iPhoneDevice]) {
    v7 = &unk_1F3453EB8;
  }
  else {
    v7 = &unk_1F3453EC8;
  }
LABEL_11:

  return v7;
}

+ (id)placeTypeClassifierModelTargetClass:(unint64_t)a3
{
  v3 = &unk_1F3452568;
  if (a3 == 2) {
    v3 = &unk_1F3452550;
  }
  if (a3 == 1) {
    return &unk_1F3452538;
  }
  else {
    return v3;
  }
}

- (void)submitVisits:(id)a3 place:(id)a4
{
  id v48 = a3;
  id v6 = a4;
  v7 = [v6 identifier];

  if (v7 && [v48 count])
  {
    v8 = [RTLearnedPlaceTypeInferencePlaceStats alloc];
    v9 = [(RTLearnedPlaceTypeInferenceGenerator *)self learnedLocationStore];
    id v47 = v6;
    v10 = [(RTLearnedPlaceTypeInferencePlaceStats *)v8 initWithLearnedLocationStore:v9 place:v6 visits:v48];

    v11 = [RTLearnedPlace alloc];
    v44 = [(RTLearnedPlaceTypeInferencePlaceStats *)v10 place];
    uint64_t v12 = [v44 identifier];
    v43 = [(RTLearnedPlaceTypeInferencePlaceStats *)v10 place];
    v13 = [v43 mapItem];
    v14 = [(RTLearnedPlaceTypeInferencePlaceStats *)v10 place];
    [v14 customLabel];
    id v15 = v46 = self;
    id v16 = [(RTLearnedPlaceTypeInferencePlaceStats *)v10 place];
    id v17 = [v16 creationDate];
    id v18 = [(RTLearnedPlaceTypeInferencePlaceStats *)v10 place];
    v19 = [v18 expirationDate];
    v20 = v11;
    uint64_t v21 = (void *)v12;
    uint64_t v22 = [(RTLearnedPlace *)v20 initWithIdentifier:v12 type:1 typeSource:1 mapItem:v13 customLabel:v15 creationDate:v17 expirationDate:v19];

    v45 = (void *)v22;
    if (v22)
    {
      uint64_t v23 = [(RTLearnedPlaceTypeInferenceGenerator *)v46 placeStats];
      v24 = v10;
      [v23 addObject:v10];

      v25 = [v48 firstObject];
      v26 = [v25 entryDate];
      v27 = [(RTLearnedPlaceTypeInferenceGenerator *)v46 firstVisit];
      v28 = [v27 entryDate];
      v29 = [v26 earlierDate:v28];
      v30 = [v48 firstObject];
      v31 = [v30 entryDate];
      int v32 = [v29 isEqualToDate:v31];

      if (v32)
      {
        id v33 = [v48 firstObject];
        [(RTLearnedPlaceTypeInferenceGenerator *)v46 setFirstVisit:v33];
      }
      id v34 = [v48 lastObject];
      objc_super v35 = [v34 exitDate];
      v36 = [(RTLearnedPlaceTypeInferenceGenerator *)v46 lastVisit];
      v37 = [v36 exitDate];
      v38 = [v35 laterDate:v37];
      v39 = [v48 lastObject];
      v40 = [v39 exitDate];
      int v41 = [v38 isEqualToDate:v40];

      v10 = v24;
      if (v41)
      {
        v42 = [v48 lastObject];
        [(RTLearnedPlaceTypeInferenceGenerator *)v46 setLastVisit:v42];
      }
    }

    id v6 = v47;
  }
}

- (id)inferPlaceTypesFromDailyPatternsWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  v101[2] = *MEMORY[0x1E4F143B8];
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@.%@", @"stats", @"weeklyDaysWithNonZeroDwellTimeAverage"];
  v8 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyAggregateDwellTimeBetweenDateRangeAverage"];
  uint64_t v9 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyTotalDailyVisitCountAverage"];
  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", v8, &unk_1F3453EF8];
  v101[0] = v11;
  v84 = (void *)v9;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", v9, &unk_1F3453F08];
  v101[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
  uint64_t v14 = [v10 andPredicateWithSubpredicates:v13];

  v85 = (void *)v7;
  id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v7 ascending:0];
  v100[0] = v15;
  id v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v8 ascending:0];
  v100[1] = v16;
  id v17 = (void *)v14;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];

  v19 = [(RTLearnedPlaceTypeInferenceGenerator *)self filteredPlaceStatsByWeeklyVisitThreshold:v6 placeStats:0.6];

  v20 = [v19 filteredArrayUsingPredicate:v14];
  uint64_t v21 = [v20 sortedArrayUsingDescriptors:v18];

  if ([v21 count])
  {
    uint64_t v22 = [v21 objectAtIndex:0];
  }
  else
  {
    uint64_t v22 = 0;
  }
  if ((unint64_t)[v21 count] < 2)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = [v21 objectAtIndex:1];
  }
  v24 = [MEMORY[0x1E4F1CA48] array];
  v25 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v79 = (void *)v14;
    v27 = v21;
    v28 = v8;
    v29 = v24;
    v30 = self;
    v31 = v18;
    v33 = int v32 = v23;
    id v34 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413826;
    v87 = v33;
    __int16 v88 = 2112;
    v89 = v34;
    __int16 v90 = 2112;
    v91 = v22;
    __int16 v92 = 2048;
    uint64_t v93 = 0x4014000000000000;
    __int16 v94 = 2048;
    uint64_t v95 = 0x401C000000000000;
    __int16 v96 = 2048;
    uint64_t v97 = 0x40D5180000000000;
    __int16 v98 = 2048;
    uint64_t v99 = 0x4014000000000000;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, theoreticalHome places stats, %@, required minDaysNonZeroDwellTime, %.2f, maxDaysNonZeroDwellTime, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, totalWeeklyVisitCount, %.2f", buf, 0x48u);

    uint64_t v23 = v32;
    id v18 = v31;
    self = v30;
    v24 = v29;
    v8 = v28;
    uint64_t v21 = v27;
    id v17 = v79;
  }

  objc_super v35 = [v22 stats];
  [(RTLearnedPlace *)v35 weeklyDaysWithNonZeroDwellTimeAverage];
  if (v36 < 5.0) {
    goto LABEL_22;
  }
  v37 = [v22 stats];
  [(RTLearnedPlace *)v37 weeklyDaysWithNonZeroDwellTimeAverage];
  if (v38 > 7.0) {
    goto LABEL_21;
  }
  v78 = v23;
  v39 = [v22 stats];
  [v39 weeklyAggregateDwellTimeBetweenDateRangeAverage];
  if (v40 <= 21600.0)
  {

    goto LABEL_20;
  }
  [v22 stats];
  int v41 = v80 = v17;
  [v41 weeklyTotalDailyVisitCountAverage];
  double v43 = v42;

  id v17 = v80;
  uint64_t v23 = v78;
  if (v43 < 5.0) {
    goto LABEL_23;
  }
  v66 = [RTLearnedPlace alloc];
  v72 = [v22 place];
  v76 = [v72 identifier];
  v70 = [v22 place];
  v74 = [v70 mapItem];
  v68 = [v22 place];
  v62 = [v68 customLabel];
  v64 = [v22 place];
  v44 = [v64 creationDate];
  v45 = [v22 place];
  v46 = [v45 expirationDate];
  objc_super v35 = [(RTLearnedPlace *)v66 initWithIdentifier:v76 type:1 typeSource:1 mapItem:v74 customLabel:v62 creationDate:v44 expirationDate:v46];

  if (!v35) {
    goto LABEL_28;
  }
  [v24 addObject:v35];
  id v47 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    id v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    v50 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413826;
    v87 = v49;
    __int16 v88 = 2112;
    v89 = v50;
    __int16 v90 = 2112;
    v91 = v78;
    __int16 v92 = 2048;
    uint64_t v93 = 0x400C000000000000;
    __int16 v94 = 2048;
    uint64_t v95 = 0x4018000000000000;
    __int16 v96 = 2048;
    uint64_t v97 = 0x40CFA40000000000;
    __int16 v98 = 2048;
    uint64_t v99 = 0x4010000000000000;
    _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, theoreticalWork places stats, %@, required minDaysNonZeroDwellTime, %.2f, maxDaysNonZeroDwellTime, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, totalWeeklyVisitCount, %.2f", buf, 0x48u);
  }
  uint64_t v23 = v78;
  v37 = [v78 stats];
  [(RTLearnedPlace *)v37 weeklyDaysWithNonZeroDwellTimeAverage];
  id v17 = v80;
  if (v51 < 3.5) {
    goto LABEL_21;
  }
  aSelectora = [v78 stats];
  [aSelectora weeklyDaysWithNonZeroDwellTimeAverage];
  if (v52 <= 6.0)
  {
    v55 = [v78 stats];
    [v55 weeklyAggregateDwellTimeBetweenDateRangeAverage];
    if (v56 <= 16200.0)
    {
    }
    else
    {
      v57 = [v78 stats];
      [v57 weeklyTotalDailyVisitCountAverage];
      double v59 = v58;

      if (v59 < 4.0)
      {
LABEL_28:
        uint64_t v23 = v78;
        id v17 = v80;
        goto LABEL_22;
      }
      v69 = [RTLearnedPlace alloc];
      v75 = [v78 place];
      aSelectorb = [v75 identifier];
      v73 = [v78 place];
      v77 = [v73 mapItem];
      v71 = [v78 place];
      v61 = [v71 customLabel];
      v67 = [v78 place];
      v63 = [v67 creationDate];
      v65 = [v78 place];
      v60 = [v65 expirationDate];
      v37 = [(RTLearnedPlace *)v69 initWithIdentifier:aSelectorb type:2 typeSource:1 mapItem:v77 customLabel:v61 creationDate:v63 expirationDate:v60];

      if (v37) {
        [v24 addObject:v37];
      }
      id v17 = v80;
    }
LABEL_20:
    uint64_t v23 = v78;
    goto LABEL_21;
  }

LABEL_21:
LABEL_22:

LABEL_23:
  v53 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v53 storeMetricsData:v24 source:12];

  return v24;
}

- (id)inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  v8 = [v6 array];
  uint64_t v9 = [(RTLearnedPlaceTypeInferenceGenerator *)self filteredPlaceStatsByWeeklyVisitThreshold:v7 placeStats:0.6];

  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"stats.topMedianDwellTime" ascending:0];
  v51[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  uint64_t v12 = [v9 sortedArrayUsingDescriptors:v11];

  v13 = [v12 firstObject];
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    id v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    double v40 = v16;
    __int16 v41 = 2112;
    double v42 = v17;
    __int16 v43 = 2112;
    v44 = v13;
    __int16 v45 = 2048;
    uint64_t v46 = 0x4014000000000000;
    __int16 v47 = 2048;
    uint64_t v48 = 0x4014000000000000;
    __int16 v49 = 2048;
    uint64_t v50 = 0x40E5180000000000;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, theoreticalHome places stats, %@, required minDaysNonZeroDwellTime, %.2f, totalWeeklyVisitCount, %.2f, minTopMedianDwellTime, %.2f", buf, 0x3Eu);
  }
  id v18 = [v13 stats];
  [(RTLearnedPlace *)v18 weeklyDaysWithNonZeroDwellTimeAverage];
  if (v19 >= 5.0)
  {
    v20 = [v13 stats];
    [v20 weeklyTotalDailyVisitCountAverage];
    if (v21 >= 5.0)
    {
      uint64_t v22 = [v13 stats];
      [v22 topMedianDwellTime];
      double v24 = v23;

      if (v24 <= 43200.0) {
        goto LABEL_10;
      }
      id v34 = [RTLearnedPlace alloc];
      v37 = [v13 place];
      double v38 = [v37 identifier];
      double v36 = [v13 place];
      id v33 = [v36 mapItem];
      objc_super v35 = [v13 place];
      uint64_t v25 = [v35 customLabel];
      v26 = [v13 place];
      v27 = [v26 creationDate];
      v28 = [v13 place];
      v29 = [v28 expirationDate];
      v30 = (void *)v25;
      id v18 = [(RTLearnedPlace *)v34 initWithIdentifier:v38 type:1 typeSource:1 mapItem:v33 customLabel:v25 creationDate:v27 expirationDate:v29];

      if (v18) {
        [v8 addObject:v18];
      }
    }
    else
    {
    }
  }

LABEL_10:
  v31 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v31 storeMetricsData:v8 source:13];

  return v8;
}

- (BOOL)supportsModel
{
  v3 = [(RTLearnedPlaceTypeInferenceGenerator *)self platform];
  if ([v3 iPhonePlatform])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(RTLearnedPlaceTypeInferenceGenerator *)self platform];
    char v4 = [v5 watchPlatform];
  }
  return v4;
}

+ (id)sortPlaceStats:(id)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v16 = [NSString stringWithFormat:@"%@.%@", @"stats", @"topMedianDwellTime"];
    id v15 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyDaysWithNonZeroDwellTimeAverage"];
    char v4 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyAggregateDwellTimeBetweenDateRangeAverage"];
    id v5 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyTotalDailyVisitCountAverage"];
    id v6 = [NSString stringWithFormat:@"%@.%@", @"place", @"creationDate"];
    id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v16 ascending:0];
    v17[0] = v7;
    v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v15 ascending:0];
    v17[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v4 ascending:0];
    v17[2] = v9;
    v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v5 ascending:0];
    v17[3] = v10;
    v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v6 ascending:0];
    v17[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];

    id v13 = [v3 sortedArrayUsingDescriptors:v12];
  }
  else
  {
    id v13 = v3;
  }

  return v13;
}

- (id)_inferPlaceTypesFromRankerModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (![(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel])
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      double v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not supported", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      double v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not enabled", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v11 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  uint64_t v12 = [v11 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"];
  int v13 = [v12 BOOLValue];

  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, Model disabled by defaults", buf, 0x16u);
    }
LABEL_23:
    uint64_t v50 = 0;
    goto LABEL_24;
  }
  if (v15)
  {
    uint64_t v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = NSStringFromSelector(a2);
    uint64_t v28 = [v9 count];
    v29 = +[RTLearnedPlace placeTypeToString:a3];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v95 = (uint64_t (*)(uint64_t, uint64_t))v28;
    LOWORD(v96) = 2112;
    *(void *)((char *)&v96 + 2) = v29;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, placeType, %@", buf, 0x2Au);
  }
  if (a3 != 1)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = (objc_class *)objc_opt_class();
      __int16 v47 = NSStringFromClass(v46);
      uint64_t v48 = NSStringFromSelector(a2);
      __int16 v49 = +[RTLearnedPlace placeTypeToString:a3];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v95 = v49;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeType, %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  if (![v9 count])
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v57 = (objc_class *)objc_opt_class();
      double v58 = NSStringFromClass(v57);
      double v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v95 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeStats, %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  uint64_t v30 = [(RTLearnedPlaceTypeInferenceGenerator *)self _prepareMLFeaturesWithPlaceStats:v9];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v95 = __Block_byref_object_copy__160;
  *(void *)&long long v96 = __Block_byref_object_dispose__160;
  *((void *)&v96 + 1) = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__160;
  v84[4] = __Block_byref_object_dispose__160;
  id v85 = &unk_1F3452580;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__160;
  v82 = __Block_byref_object_dispose__160;
  id v83 = 0;
  context = (void *)MEMORY[0x1E016D870](v30);
  v31 = [MEMORY[0x1E4F28CB8] frameworkBundle];
  v67 = [v31 pathForResource:@"RTPlaceTypeClassifierModelRanker" ofType:@"mlmodelc"];

  v66 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v67];
  int v32 = [RTPlaceTypeClassifierModelRanker alloc];
  id v33 = (id *)(v79 + 5);
  id obj = (id)v79[5];
  v68 = [(RTPlaceTypeClassifierModelRanker *)v32 initWithContentsOfURL:v66 error:&obj];
  objc_storeStrong(v33, obj);
  if (v68)
  {
    v64 = [(id)objc_opt_class() sortPlaceStats:v9];

    [v10 setObject:&unk_1F3452538 forKeyedSubscript:&unk_1F3452598];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __107__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromRankerModelForPlaceType_placeStats_metricsData___block_invoke;
    v69[3] = &unk_1E6B9C7B0;
    v69[4] = self;
    SEL v75 = a2;
    uint64_t v76 = 1;
    v70 = v68;
    v72 = &v78;
    v73 = v84;
    v74 = buf;
    id v71 = v10;
    [v64 enumerateObjectsUsingBlock:v69];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v34 = [RTLearnedPlace alloc];
      v63 = [*(id *)(*(void *)&buf[8] + 40) place];
      v61 = [v63 identifier];
      v62 = [*(id *)(*(void *)&buf[8] + 40) place];
      v60 = [v62 mapItem];
      objc_super v35 = [*(id *)(*(void *)&buf[8] + 40) place];
      double v36 = [v35 customLabel];
      v37 = [*(id *)(*(void *)&buf[8] + 40) place];
      double v38 = [v37 creationDate];
      v39 = [*(id *)(*(void *)&buf[8] + 40) place];
      double v40 = [v39 expirationDate];
      uint64_t v14 = [(RTLearnedPlace *)v34 initWithIdentifier:v61 type:1 typeSource:1 mapItem:v60 customLabel:v36 creationDate:v38 expirationDate:v40];

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        double v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v45 = +[RTLearnedPlace placeTypeToString:1];
        *(_DWORD *)v86 = 138413058;
        id v87 = v43;
        __int16 v88 = 2112;
        id v89 = v44;
        __int16 v90 = 2112;
        v91 = v45;
        __int16 v92 = 2112;
        uint64_t v93 = v14;
        _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, %@, placeType, %@, inferred place, %@", v86, 0x2Au);
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    id v9 = v64;
  }
  else
  {
    double v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = NSStringFromSelector(a2);
      double v56 = v79[5];
      *(_DWORD *)v86 = 138413058;
      id v87 = v54;
      __int16 v88 = 2112;
      id v89 = v55;
      __int16 v90 = 2112;
      v91 = v67;
      __int16 v92 = 2112;
      uint64_t v93 = v56;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, failed to load model, %@, error, %@", v86, 0x2Au);
    }
    uint64_t v14 = 0;
  }

  if (v68) {
    uint64_t v50 = v14;
  }
  else {
    uint64_t v50 = 0;
  }
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(v84, 8);
  _Block_object_dispose(buf, 8);

LABEL_24:

  return v50;
}

void __107__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromRankerModelForPlaceType_placeStats_metricsData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 mlFeatures];

  if (v5)
  {
    id obj = a2;
    v137 = [RTPlaceTypeClassifierModelRankerInput alloc];
    v136 = [v4 mlFeatures];
    v135 = [v136 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_bucketed"];
    [v135 doubleValue];
    double v122 = v6;
    v134 = [v4 mlFeatures];
    v133 = [v134 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_bucketed"];
    [v133 doubleValue];
    double v120 = v7;
    v132 = [v4 mlFeatures];
    v131 = [v132 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];
    [v131 doubleValue];
    double v117 = v8;
    v130 = [v4 mlFeatures];
    v129 = [v130 objectForKeyedSubscript:@"mean_daily_total_charging_duration_bucketed"];
    [v129 doubleValue];
    double v115 = v9;
    v128 = [v4 mlFeatures];
    v127 = [v128 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration_bucketed"];
    [v127 doubleValue];
    double v113 = v10;
    v126 = [v4 mlFeatures];
    v125 = [v126 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];
    [v125 doubleValue];
    double v110 = v11;
    v124 = [v4 mlFeatures];
    v123 = [v124 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"];
    [v123 doubleValue];
    double v108 = v12;
    v121 = [v4 mlFeatures];
    v119 = [v121 objectForKeyedSubscript:@"median_daily_longest_charging_duration_bucketed"];
    [v119 doubleValue];
    double v106 = v13;
    v118 = [v4 mlFeatures];
    v116 = [v118 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration_bucketed"];
    [v116 doubleValue];
    uint64_t v102 = v14;
    v114 = [v4 mlFeatures];
    v112 = [v114 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];
    [v112 doubleValue];
    uint64_t v100 = v15;
    v111 = [v4 mlFeatures];
    v109 = [v111 objectForKeyedSubscript:@"median_daily_total_charging_duration_bucketed"];
    [v109 doubleValue];
    uint64_t v17 = v16;
    v107 = [v4 mlFeatures];
    v105 = [v107 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration_bucketed"];
    [v105 doubleValue];
    uint64_t v19 = v18;
    v104 = [v4 mlFeatures];
    v103 = [v104 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];
    [v103 doubleValue];
    uint64_t v21 = v20;
    v101 = [v4 mlFeatures];
    uint64_t v99 = [v101 objectForKeyedSubscript:@"percentage_of_days_with_charging_bucketed"];
    [v99 doubleValue];
    uint64_t v23 = v22;
    __int16 v98 = [v4 mlFeatures];
    uint64_t v97 = [v98 objectForKeyedSubscript:@"percentage_of_days_with_screenLock_bucketed"];
    [v97 doubleValue];
    uint64_t v25 = v24;
    v26 = [v4 mlFeatures];
    v27 = [v26 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"];
    [v27 doubleValue];
    uint64_t v29 = v28;
    uint64_t v30 = NSNumber;
    v31 = [*(id *)(a1 + 32) platform];
    int v32 = [v30 numberWithBool:[v31 iPhoneDevice]];
    [v32 doubleValue];
    uint64_t v34 = v33;
    objc_super v35 = NSNumber;
    double v36 = [*(id *)(a1 + 32) platform];
    char v37 = [v36 iPhoneDevice];
    if (v37)
    {
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v95 = [*(id *)(a1 + 32) platform];
      uint64_t v38 = [v95 iPhonePlatform];
    }
    v39 = [v35 numberWithBool:v38];
    [v39 doubleValue];
    uint64_t v41 = v40;
    double v42 = NSNumber;
    uint64_t v139 = a1;
    id v43 = [*(id *)(a1 + 32) platform];
    id v44 = [v42 numberWithBool:[v43 watchPlatform]];
    [v44 doubleValue];
    v138 = -[RTPlaceTypeClassifierModelRankerInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:](v137, "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", v122, v120, v117, v115, v113, v110, v108, v106, v102,
             v100,
             v17,
             v19,
             v21,
             v23,
             v25,
             v29,
             v34,
             v41,
             v45);

    if ((v37 & 1) == 0) {
    [(RTPlaceTypeClassifierModelRankerInput *)v138 mean_daily_longest_screen_lock_duration_bucketed];
    }
    if (v46 <= 1.0) {
      goto LABEL_22;
    }
    [(RTPlaceTypeClassifierModelRankerInput *)v138 mean_daily_total_screen_lock_duration_bucketed];
    if (v47 <= 1.0) {
      goto LABEL_22;
    }
    [(RTPlaceTypeClassifierModelRankerInput *)v138 median_daily_longest_screen_lock_duration_bucketed];
    if (v48 <= 1.0
      || ([(RTPlaceTypeClassifierModelRankerInput *)v138 median_daily_total_screen_lock_duration_bucketed], v49 <= 1.0)|| ([(RTPlaceTypeClassifierModelRankerInput *)v138 percentage_of_days_with_screen_lock_bucketed], v50 <= 1.0)|| ([(RTPlaceTypeClassifierModelRankerInput *)v138 mean_daily_longest_charging_duration_bucketed], v51 <= 1.0)|| ([(RTPlaceTypeClassifierModelRankerInput *)v138 mean_daily_total_charging_duration_bucketed], v52 <= 1.0)|| ([(RTPlaceTypeClassifierModelRankerInput *)v138 median_daily_longest_charging_duration_bucketed], v53 <= 1.0)
      || ([(RTPlaceTypeClassifierModelRankerInput *)v138 median_daily_total_charging_duration_bucketed], v54 <= 1.0)|| ([(RTPlaceTypeClassifierModelRankerInput *)v138 percentage_of_days_with_charging_bucketed], v55 <= 1.0))
    {
LABEL_22:
      double v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        uint64_t v78 = (objc_class *)objc_opt_class();
        v79 = NSStringFromClass(v78);
        uint64_t v80 = NSStringFromSelector(*(SEL *)(v139 + 80));
        v81 = +[RTLearnedPlace placeTypeToString:*(void *)(v139 + 88)];
        v82 = +[RTRuntime objToString:v138 filterProperties:&unk_1F34534C8];
        *(_DWORD *)buf = 138413314;
        v142 = v79;
        __int16 v143 = 2112;
        v144 = v80;
        __int16 v145 = 2112;
        v146 = v81;
        __int16 v147 = 2112;
        id v148 = v4;
        __int16 v149 = 2112;
        v150 = v82;
        _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\nSkipping place inference in Ranker model because all the longest duet stream bucketed values are <= 1. It means the stream doesn't exist or the values are less than 10 mins each.", buf, 0x34u);
      }
    }
    else
    {
      double v56 = *(void **)(v139 + 40);
      uint64_t v57 = *(void *)(*(void *)(v139 + 56) + 8);
      id v140 = *(id *)(v57 + 40);
      double v58 = [v56 predictionFromFeatures:v138 error:&v140];
      objc_storeStrong((id *)(v57 + 40), v140);
      double v59 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        v62 = NSStringFromSelector(*(SEL *)(v139 + 80));
        v63 = +[RTLearnedPlace placeTypeToString:*(void *)(v139 + 88)];
        v64 = +[RTRuntime objToString:v138 filterProperties:&unk_1F34534E0];
        [v58 target];
        uint64_t v65 = *(void *)(*(void *)(*(void *)(v139 + 56) + 8) + 40);
        *(_DWORD *)buf = 138413826;
        v142 = v61;
        __int16 v143 = 2112;
        v144 = v62;
        __int16 v145 = 2112;
        v146 = v63;
        __int16 v147 = 2112;
        id v148 = v4;
        __int16 v149 = 2112;
        v150 = v64;
        __int16 v151 = 2048;
        uint64_t v152 = v66;
        __int16 v153 = 2112;
        uint64_t v154 = v65;
        _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\noutput target score, %lf, error, %@", buf, 0x48u);
      }
      [v58 target];
      double v68 = v67;
      [*(id *)(*(void *)(*(void *)(v139 + 64) + 8) + 40) doubleValue];
      if (v68 <= v69 || ([v58 target], v70 <= 0.0))
      {
        uint64_t v83 = [*(id *)(v139 + 48) objectForKeyedSubscript:&unk_1F34525F8];
        if (!v83) {
          goto LABEL_28;
        }
        v84 = (void *)v83;
        id v85 = [*(id *)(v139 + 48) objectForKeyedSubscript:&unk_1F34525F8];
        double v86 = (double)[v85 unsignedIntValue];
        [v58 target];
        double v88 = v87;

        if (v88 > v86)
        {
LABEL_28:
          id v89 = +[RTRuntime objToDictionary:v138 filterProperties:&unk_1F3453510];
          [*(id *)(v139 + 48) setObject:v89 forKeyedSubscript:&unk_1F34525C8];

          __int16 v90 = NSNumber;
          [v58 target];
          v91 = [v90 numberWithDouble:];
          [*(id *)(v139 + 48) setObject:v91 forKeyedSubscript:&unk_1F34525F8];
        }
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(v139 + 72) + 8) + 40), obj);
        id v71 = NSNumber;
        [v58 target];
        uint64_t v72 = [v71 numberWithDouble:];
        uint64_t v73 = *(void *)(*(void *)(v139 + 64) + 8);
        v74 = *(void **)(v73 + 40);
        *(void *)(v73 + 40) = v72;

        SEL v75 = [*(id *)(v139 + 48) objectForKeyedSubscript:&unk_1F34525B0];
        [*(id *)(v139 + 48) setObject:v75 forKeyedSubscript:&unk_1F34525C8];

        uint64_t v76 = +[RTRuntime objToDictionary:v138 filterProperties:&unk_1F34534F8];
        [*(id *)(v139 + 48) setObject:v76 forKeyedSubscript:&unk_1F34525B0];

        v77 = [*(id *)(v139 + 48) objectForKeyedSubscript:&unk_1F34525E0];
        [*(id *)(v139 + 48) setObject:v77 forKeyedSubscript:&unk_1F34525F8];

        [*(id *)(v139 + 48) setObject:*(void *)(*(void *)(*(void *)(v139 + 64) + 8) + 40) forKeyedSubscript:&unk_1F34525E0];
      }
      __int16 v92 = NSNumber;
      uint64_t v93 = [*(id *)(v139 + 48) objectForKeyedSubscript:&unk_1F3452598];
      __int16 v94 = [v92 numberWithUnsignedInt:[v93 unsignedIntValue] + 1];
      [*(id *)(v139 + 48) setObject:v94 forKeyedSubscript:&unk_1F3452598];
    }
  }
}

- (id)_inferPlaceTypesFromMultiClassModelForPlaceType:(unint64_t)a3 placeStats:(id)a4 metricsData:(id)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (![(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel])
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not supported", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      uint64_t v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, feature not enabled", buf, 0x16u);
    }
    goto LABEL_23;
  }
  double v11 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  double v12 = [v11 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, Model disabled by defaults", buf, 0x16u);
    }
LABEL_23:
    double v50 = 0;
    goto LABEL_24;
  }
  [(RTLearnedPlaceTypeInferenceGenerator *)self _prepareMLFeaturesWithPlaceStats:v9];
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = NSStringFromSelector(a2);
    uint64_t v28 = [v9 count];
    uint64_t v29 = +[RTLearnedPlace placeTypeToString:a3];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2048;
    v103 = (uint64_t (*)(uint64_t, uint64_t))v28;
    LOWORD(v104) = 2112;
    *(void *)((char *)&v104 + 2) = v29;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, placeType, %@", buf, 0x2Au);
  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      int v32 = NSStringFromSelector(a2);
      uint64_t v33 = +[RTLearnedPlace placeTypeToString:a3];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v103 = v33;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeType, %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  if (![v9 count])
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v57 = (objc_class *)objc_opt_class();
      double v58 = NSStringFromClass(v57);
      double v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      v103 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, invalid placeStats, %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v103 = __Block_byref_object_copy__160;
  *(void *)&long long v104 = __Block_byref_object_dispose__160;
  *((void *)&v104 + 1) = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__160;
  v92[4] = __Block_byref_object_dispose__160;
  id v93 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__160;
  v90[4] = __Block_byref_object_dispose__160;
  id v91 = 0;
  uint64_t v84 = 0;
  id v85 = &v84;
  uint64_t v86 = 0x3032000000;
  double v87 = __Block_byref_object_copy__160;
  double v88 = __Block_byref_object_dispose__160;
  id v89 = 0;
  context = (void *)MEMORY[0x1E016D870]();
  uint64_t v34 = [MEMORY[0x1E4F28CB8] frameworkBundle];
  double v70 = [v34 pathForResource:@"RTPlaceTypeClassifierModelMultiClass" ofType:@"mlmodelc"];

  double v69 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v70];
  objc_super v35 = [RTPlaceTypeClassifierModelMultiClass alloc];
  double v36 = (id *)(v85 + 5);
  id obj = (id)v85[5];
  id v71 = [(RTPlaceTypeClassifierModelMultiClass *)v35 initWithContentsOfURL:v69 error:&obj];
  objc_storeStrong(v36, obj);
  double v68 = [(id)objc_opt_class() placeTypeClassifierModelTargetClass:a3];
  char v37 = objc_opt_class();
  uint64_t v38 = [(RTLearnedPlaceTypeInferenceGenerator *)self platform];
  double v67 = [v37 placeTypeClassifierModelThresholdForPlatform:v38 placeType:a3];

  if (v71)
  {
    uint64_t v65 = [(id)objc_opt_class() sortPlaceStats:v9];

    [v10 setObject:&unk_1F3452538 forKeyedSubscript:&unk_1F3452598];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __111__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromMultiClassModelForPlaceType_placeStats_metricsData___block_invoke;
    v72[3] = &unk_1E6B9C7D8;
    v72[4] = self;
    SEL v81 = a2;
    unint64_t v82 = a3;
    uint64_t v73 = v71;
    v77 = &v84;
    uint64_t v78 = v90;
    id v74 = v67;
    id v75 = v68;
    v79 = v92;
    uint64_t v80 = buf;
    id v76 = v10;
    [v65 enumerateObjectsUsingBlock:v72];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v39 = [RTLearnedPlace alloc];
      v64 = [*(id *)(*(void *)&buf[8] + 40) place];
      v61 = [v64 identifier];
      v63 = [*(id *)(*(void *)&buf[8] + 40) place];
      v60 = [v63 mapItem];
      v62 = [*(id *)(*(void *)&buf[8] + 40) place];
      uint64_t v40 = [v62 customLabel];
      uint64_t v41 = [*(id *)(*(void *)&buf[8] + 40) place];
      double v42 = [v41 creationDate];
      id v43 = [*(id *)(*(void *)&buf[8] + 40) place];
      id v44 = [v43 expirationDate];
      uint64_t v14 = [(RTLearnedPlace *)v39 initWithIdentifier:v61 type:a3 typeSource:1 mapItem:v60 customLabel:v40 creationDate:v42 expirationDate:v44];

      uint64_t v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        double v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        double v49 = +[RTLearnedPlace placeTypeToString:a3];
        *(_DWORD *)__int16 v94 = 138413058;
        id v95 = v47;
        __int16 v96 = 2112;
        id v97 = v48;
        __int16 v98 = 2112;
        uint64_t v99 = v49;
        __int16 v100 = 2112;
        v101 = v14;
        _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "%@, %@, placeType, %@, inferred place, %@", v94, 0x2Au);
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    id v9 = v65;
  }
  else
  {
    double v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      double v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      double v55 = NSStringFromSelector(a2);
      double v56 = v85[5];
      *(_DWORD *)__int16 v94 = 138413058;
      id v95 = v54;
      __int16 v96 = 2112;
      id v97 = v55;
      __int16 v98 = 2112;
      uint64_t v99 = v70;
      __int16 v100 = 2112;
      v101 = v56;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, failed to load model, %@, error, %@", v94, 0x2Au);
    }
    uint64_t v14 = 0;
  }

  if (v71) {
    double v50 = v14;
  }
  else {
    double v50 = 0;
  }
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v92, 8);

  _Block_object_dispose(buf, 8);
LABEL_24:

  return v50;
}

void __111__RTLearnedPlaceTypeInferenceGenerator__inferPlaceTypesFromMultiClassModelForPlaceType_placeStats_metricsData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 mlFeatures];

  if (v5)
  {
    id v101 = a2;
    __int16 v149 = [RTPlaceTypeClassifierModelMultiClassInput alloc];
    __int16 v147 = [v4 mlFeatures];
    __int16 v145 = [v147 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_bucketed"];
    [v145 doubleValue];
    double v127 = v6;
    __int16 v143 = [v4 mlFeatures];
    v141 = [v143 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_bucketed"];
    [v141 doubleValue];
    double v125 = v7;
    uint64_t v139 = [v4 mlFeatures];
    v137 = [v139 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];
    [v137 doubleValue];
    double v122 = v8;
    v135 = [v4 mlFeatures];
    v134 = [v135 objectForKeyedSubscript:@"mean_daily_total_charging_duration_bucketed"];
    [v134 doubleValue];
    double v120 = v9;
    v133 = [v4 mlFeatures];
    v132 = [v133 objectForKeyedSubscript:@"mean_daily_total_screen_lock_duration_bucketed"];
    [v132 doubleValue];
    double v118 = v10;
    v131 = [v4 mlFeatures];
    v130 = [v131 objectForKeyedSubscript:@"mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];
    [v130 doubleValue];
    double v115 = v11;
    v129 = [v4 mlFeatures];
    v128 = [v129 objectForKeyedSubscript:@"mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed"];
    [v128 doubleValue];
    double v113 = v12;
    v126 = [v4 mlFeatures];
    v124 = [v126 objectForKeyedSubscript:@"median_daily_longest_charging_duration_bucketed"];
    [v124 doubleValue];
    double v111 = v13;
    v123 = [v4 mlFeatures];
    v121 = [v123 objectForKeyedSubscript:@"median_daily_longest_screen_lock_duration_bucketed"];
    [v121 doubleValue];
    uint64_t v107 = v14;
    v119 = [v4 mlFeatures];
    double v117 = [v119 objectForKeyedSubscript:@"median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];
    [v117 doubleValue];
    uint64_t v105 = v15;
    v116 = [v4 mlFeatures];
    v114 = [v116 objectForKeyedSubscript:@"median_daily_total_charging_duration_bucketed"];
    [v114 doubleValue];
    uint64_t v17 = v16;
    v112 = [v4 mlFeatures];
    double v110 = [v112 objectForKeyedSubscript:@"median_daily_total_screen_lock_duration_bucketed"];
    [v110 doubleValue];
    uint64_t v19 = v18;
    v109 = [v4 mlFeatures];
    double v108 = [v109 objectForKeyedSubscript:@"median_daily_total_uninterrupted_WiFi_connection_duration_bucketed"];
    [v108 doubleValue];
    uint64_t v21 = v20;
    double v106 = [v4 mlFeatures];
    long long v104 = [v106 objectForKeyedSubscript:@"percentage_of_days_with_charging_bucketed"];
    [v104 doubleValue];
    uint64_t v23 = v22;
    v103 = [v4 mlFeatures];
    uint64_t v102 = [v103 objectForKeyedSubscript:@"percentage_of_days_with_screenLock_bucketed"];
    [v102 doubleValue];
    uint64_t v25 = v24;
    v26 = [v4 mlFeatures];
    v27 = [v26 objectForKeyedSubscript:@"percentage_of_days_with_uninterrupted_WiFi_connection_bucketed"];
    [v27 doubleValue];
    uint64_t v29 = v28;
    uint64_t v30 = NSNumber;
    v31 = [*(id *)(a1 + 32) platform];
    int v32 = [v30 numberWithBool:[v31 iPhoneDevice]];
    [v32 doubleValue];
    uint64_t v34 = v33;
    objc_super v35 = NSNumber;
    double v36 = [*(id *)(a1 + 32) platform];
    char v37 = [v36 iPhoneDevice];
    if (v37)
    {
      uint64_t v38 = 0;
    }
    else
    {
      __int16 v100 = [*(id *)(a1 + 32) platform];
      uint64_t v38 = [v100 iPhonePlatform];
    }
    v39 = [v35 numberWithBool:v38];
    [v39 doubleValue];
    uint64_t v41 = v40;
    double v42 = NSNumber;
    uint64_t v151 = a1;
    id v43 = [*(id *)(a1 + 32) platform];
    id v44 = [v42 numberWithBool:[v43 watchPlatform]];
    [v44 doubleValue];
    v150 = -[RTPlaceTypeClassifierModelMultiClassInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:](v149, "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", v127, v125, v122, v120, v118, v115, v113, v111, v107,
             v105,
             v17,
             v19,
             v21,
             v23,
             v25,
             v29,
             v34,
             v41,
             v45);

    if ((v37 & 1) == 0) {
    double v46 = v150;
    }
    [(RTPlaceTypeClassifierModelMultiClassInput *)v150 mean_daily_longest_screen_lock_duration_bucketed];
    if (v47 <= 1.0
      || ([(RTPlaceTypeClassifierModelMultiClassInput *)v150 mean_daily_total_screen_lock_duration_bucketed], v48 <= 1.0)|| ([(RTPlaceTypeClassifierModelMultiClassInput *)v150 median_daily_longest_screen_lock_duration_bucketed], v49 <= 1.0)|| ([(RTPlaceTypeClassifierModelMultiClassInput *)v150 median_daily_total_screen_lock_duration_bucketed], v50 <= 1.0)|| ([(RTPlaceTypeClassifierModelMultiClassInput *)v150 percentage_of_days_with_screen_lock_bucketed], v51 <= 1.0))
    {
      double v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v84 = (objc_class *)objc_opt_class();
        id v85 = NSStringFromClass(v84);
        uint64_t v86 = NSStringFromSelector(*(SEL *)(v151 + 104));
        double v87 = +[RTLearnedPlace placeTypeToString:*(void *)(v151 + 112)];
        double v88 = +[RTRuntime objToString:v150 filterProperties:&unk_1F3453528];
        *(_DWORD *)buf = 138413314;
        uint64_t v154 = v85;
        __int16 v155 = 2112;
        v156 = v86;
        __int16 v157 = 2112;
        v158 = v87;
        __int16 v159 = 2112;
        id v160 = v4;
        __int16 v161 = 2112;
        v162 = v88;
        _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\nSkipping place inference in multi class model because all the longest duet stream bucketed values are <= 1. It means the stream doesn't exist or the values are less than 10 mins each.", buf, 0x34u);
      }
      goto LABEL_20;
    }
    uint64_t v52 = v151;
    double v53 = *(void **)(v151 + 40);
    uint64_t v54 = *(void *)(*(void *)(v151 + 72) + 8);
    id obj = *(id *)(v54 + 40);
    double v55 = [v53 predictionFromFeatures:v150 error:&obj];
    objc_storeStrong((id *)(v54 + 40), obj);
    double v56 = [v55 classProbability];
    uint64_t v57 = [(id)objc_opt_class() placeTypeClassifierModelTargetClass:*(void *)(v151 + 112)];
    uint64_t v58 = [v56 objectForKeyedSubscript:v57];
    uint64_t v59 = *(void *)(*(void *)(v151 + 80) + 8);
    v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = v58;

    v61 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = (objc_class *)objc_opt_class();
      id v148 = NSStringFromClass(v62);
      v146 = NSStringFromSelector(*(SEL *)(v151 + 104));
      v144 = +[RTLearnedPlace placeTypeToString:*(void *)(v151 + 112)];
      v63 = +[RTRuntime objToString:v150 filterProperties:&unk_1F3453540];
      v64 = +[RTLearnedPlace placeTypeToString:1];
      v142 = [v55 classProbability];
      id v140 = [(id)objc_opt_class() placeTypeClassifierModelTargetClass:1];
      v136 = [v142 objectForKeyedSubscript:v140];
      uint64_t v65 = +[RTLearnedPlace placeTypeToString:2];
      v138 = [v55 classProbability];
      uint64_t v66 = [(id)objc_opt_class() placeTypeClassifierModelTargetClass:2];
      double v67 = [v138 objectForKeyedSubscript:v66];
      double v68 = +[RTLearnedPlace placeTypeToString:*(void *)(v151 + 112)];
      uint64_t v69 = *(void *)(v151 + 48);
      uint64_t v70 = *(void *)(*(void *)(*(void *)(v151 + 72) + 8) + 40);
      *(_DWORD *)buf = 138415106;
      uint64_t v154 = v148;
      __int16 v155 = 2112;
      v156 = v146;
      __int16 v157 = 2112;
      v158 = v144;
      __int16 v159 = 2112;
      id v160 = v4;
      __int16 v161 = 2112;
      v162 = v63;
      __int16 v163 = 2112;
      v164 = v64;
      __int16 v165 = 2112;
      v166 = v136;
      __int16 v167 = 2112;
      v168 = v65;
      __int16 v169 = 2112;
      v170 = v67;
      __int16 v171 = 2112;
      v172 = v68;
      __int16 v173 = 2112;
      uint64_t v174 = v69;
      __int16 v175 = 2112;
      uint64_t v176 = v70;
      _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "%@, %@, inferring for placeType, %@, placeStat, %@, mlFeatures, %@, \n\npredicted probability for %@, %@, predicted probability for %@, %@, probability threshold for %@, %@, error, %@", buf, 0x7Au);

      double v46 = v150;
      uint64_t v52 = v151;
    }
    uint64_t v71 = [v55 target];
    if (v71 == (int)[*(id *)(v52 + 56) intValue]
      && ([*(id *)(*(void *)(*(void *)(v52 + 80) + 8) + 40) doubleValue],
          double v73 = v72,
          [*(id *)(v52 + 48) doubleValue],
          v73 >= v74)
      && ([*(id *)(*(void *)(*(void *)(v52 + 80) + 8) + 40) doubleValue],
          double v76 = v75,
          [*(id *)(*(void *)(*(void *)(v52 + 88) + 8) + 40) doubleValue],
          v76 > v77))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(v52 + 96) + 8) + 40), v101);
      objc_storeStrong((id *)(*(void *)(*(void *)(v52 + 88) + 8) + 40), *(id *)(*(void *)(*(void *)(v52 + 80) + 8) + 40));
      uint64_t v78 = (id *)(v52 + 64);
      v79 = [*(id *)(v52 + 64) objectForKeyedSubscript:&unk_1F34525B0];
      [*(id *)(v52 + 64) setObject:v79 forKeyedSubscript:&unk_1F34525C8];

      uint64_t v80 = +[RTRuntime objToDictionary:v46 filterProperties:&unk_1F3453558];
      [*(id *)(v52 + 64) setObject:v80 forKeyedSubscript:&unk_1F34525B0];

      SEL v81 = &unk_1F34525E0;
      unint64_t v82 = [*(id *)(v52 + 64) objectForKeyedSubscript:&unk_1F34525E0];
      [*(id *)(v52 + 64) setObject:v82 forKeyedSubscript:&unk_1F34525F8];

      uint64_t v83 = (void *)(*(void *)(*(void *)(v52 + 88) + 8) + 40);
    }
    else
    {
      uint64_t v78 = (id *)(v52 + 64);
      uint64_t v89 = [*(id *)(v52 + 64) objectForKeyedSubscript:&unk_1F34525F8];
      if (v89)
      {
        __int16 v90 = (void *)v89;
        id v91 = [*(id *)(v52 + 64) objectForKeyedSubscript:&unk_1F34525F8];
        [v91 doubleValue];
        double v93 = v92;
        [*(id *)(*(void *)(*(void *)(v52 + 80) + 8) + 40) doubleValue];
        double v95 = v94;

        if (v93 >= v95) {
          goto LABEL_26;
        }
      }
      __int16 v96 = +[RTRuntime objToDictionary:v46 filterProperties:&unk_1F3453570];
      [*(id *)(v52 + 64) setObject:v96 forKeyedSubscript:&unk_1F34525C8];

      uint64_t v83 = (void *)(*(void *)(*(void *)(v52 + 80) + 8) + 40);
      SEL v81 = &unk_1F34525F8;
    }
    [*v78 setObject:*v83 forKeyedSubscript:v81];
LABEL_26:
    id v97 = NSNumber;
    __int16 v98 = [*(id *)(v52 + 64) objectForKeyedSubscript:&unk_1F3452598];
    uint64_t v99 = [v97 numberWithUnsignedInt:objc_msgSend(v98, "unsignedIntValue") + 1];
    [*(id *)(v52 + 64) setObject:v99 forKeyedSubscript:&unk_1F3452598];

LABEL_20:
  }
}

- (id)inferPlaceTypesFromModelForModelType:(unint64_t)a3 placeType:(unint64_t)a4 placeStats:(id)a5 metricsData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a3 == 1)
  {
    uint64_t v12 = [(RTLearnedPlaceTypeInferenceGenerator *)self _inferPlaceTypesFromMultiClassModelForPlaceType:a4 placeStats:v10 metricsData:v11];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v12 = [(RTLearnedPlaceTypeInferenceGenerator *)self _inferPlaceTypesFromRankerModelForPlaceType:a4 placeStats:v10 metricsData:v11];
LABEL_5:
    double v13 = (void *)v12;
    goto LABEL_7;
  }
  double v13 = 0;
LABEL_7:

  return v13;
}

- (id)inferPlaceTypesFromModelWithCandidateSelection:(BOOL)a3 homeModelType:(unint64_t)a4 workModelType:(unint64_t)a5 placeStats:(id)a6 dateInterval:(id)a7
{
  BOOL v10 = a3;
  v117[1] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v100 = a7;
  if (![(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel])
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v22);
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v102 = v19;
      __int16 v103 = 2112;
      long long v104 = v20;
      uint64_t v21 = "%@, %@, feature not supported";
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v24 = 0;
    goto LABEL_12;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v23);
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v102 = v19;
      __int16 v103 = 2112;
      long long v104 = v20;
      uint64_t v21 = "%@, %@, feature not enabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  unint64_t v97 = a5;
  uint64_t v14 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  uint64_t v15 = [v14 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v102 = v19;
      __int16 v103 = 2112;
      long long v104 = v20;
      uint64_t v21 = "%@, %@, Model disabled by defaults";
LABEL_10:
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  unint64_t v99 = a4;
  uint64_t v17 = objc_opt_new();
  __int16 v96 = objc_opt_new();
  uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
  __int16 v98 = +[RTLearnedPlaceTypeInferenceGenerator getCandidateGenerationParameters];
  v26 = -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 1, v13, v100, 0, 200.0);
  v27 = [NSNumber numberWithUnsignedInteger:[v26 count]];
  [v17 setObject:v27 forKeyedSubscript:&unk_1F3452610];

  uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  double v93 = v26;
  BOOL v92 = v10;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    uint64_t v30 = aSelector = a2;
    v31 = NSStringFromSelector(aSelector);
    int v32 = @"NO";
    if (v10) {
      int v32 = @"YES";
    }
    __int16 v90 = v32;
    uint64_t v33 = [v13 count];
    uint64_t v34 = [(id)objc_opt_class() modelTypeToString:v99];
    uint64_t v88 = [v26 count];
    objc_super v35 = +[RTRuntime objToString:v98 filterProperties:0];
    *(_DWORD *)buf = 138413826;
    uint64_t v102 = v30;
    __int16 v103 = 2112;
    long long v104 = v31;
    __int16 v105 = 2112;
    double v106 = v90;
    __int16 v107 = 2048;
    uint64_t v108 = v33;
    BOOL v10 = v92;
    __int16 v109 = 2112;
    double v110 = v34;
    __int16 v111 = 2048;
    v112 = (__CFString *)v88;
    __int16 v113 = 2112;
    uint64_t v114 = (uint64_t)v35;
    _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, useCandidateSelection, %@, placeStats count, %lu, home model type, %@, home candidates from candidateSelection, count, %lu, parameters, %@", buf, 0x48u);

    v26 = v93;
    a2 = aSelector;
  }

  if (v10)
  {
    unint64_t v36 = v99;
    if ([v26 count])
    {
      uint64_t v37 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelForModelType:v99 placeType:1 placeStats:v26 metricsData:v17];
      goto LABEL_27;
    }
    uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      double v42 = (objc_class *)objc_opt_class();
      id v43 = NSStringFromClass(v42);
      NSStringFromSelector(a2);
      uint64_t v45 = v44 = v10;
      *(_DWORD *)buf = 138412546;
      uint64_t v102 = v43;
      __int16 v103 = 2112;
      long long v104 = v45;
      _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "%@, %@, placeStatsCandidatesForHome count is 0. So running all placeStats through model.", buf, 0x16u);

      BOOL v10 = v44;
      unint64_t v36 = v99;
    }
    uint64_t v38 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    v39 = self;
    unint64_t v40 = v36;
  }
  else
  {
    uint64_t v38 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    v39 = self;
    unint64_t v40 = v99;
  }
  uint64_t v37 = [(RTLearnedPlaceTypeInferenceGenerator *)v39 inferPlaceTypesFromModelForModelType:v40 placeType:1 placeStats:v38 metricsData:v17];

LABEL_27:
  aSelectora = (char *)v37;
  if (!v37)
  {
    uint64_t v57 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      uint64_t v58 = (objc_class *)objc_opt_class();
      uint64_t v59 = NSStringFromClass(v58);
      v60 = NSStringFromSelector(a2);
      if (v10) {
        v61 = @"YES";
      }
      else {
        v61 = @"NO";
      }
      v62 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
      uint64_t v63 = [v62 count];
      *(_DWORD *)buf = 138413058;
      uint64_t v102 = v59;
      __int16 v103 = 2112;
      long long v104 = v60;
      __int16 v105 = 2112;
      double v106 = v61;
      __int16 v107 = 2048;
      uint64_t v108 = v63;
      _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%@, %@, skipping work inference from model since home is not inferred, useCandidateSelection, %@, placeStats count, %lu", buf, 0x2Au);

      BOOL v10 = v92;
    }
    unint64_t v56 = v97;
    goto LABEL_48;
  }
  v117[0] = v37;
  uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
  double v87 = -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 2, v13, v100, 200.0);
  id v91 = -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:");
  double v46 = [NSNumber numberWithUnsignedInteger:[v91 count]];
  [v96 setObject:v46 forKeyedSubscript:&unk_1F3452610];

  double v47 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    double v48 = (objc_class *)objc_opt_class();
    double v49 = NSStringFromClass(v48);
    uint64_t v50 = NSStringFromSelector(a2);
    double v51 = @"NO";
    if (v10) {
      double v51 = @"YES";
    }
    uint64_t v84 = v51;
    id v85 = (void *)v50;
    uint64_t v83 = [v13 count];
    uint64_t v52 = [(id)objc_opt_class() modelTypeToString:v97];
    uint64_t v53 = [v91 count];
    uint64_t v54 = +[RTRuntime objToString:v98 filterProperties:0];
    *(_DWORD *)buf = 138414082;
    uint64_t v102 = v49;
    __int16 v103 = 2112;
    long long v104 = v85;
    __int16 v105 = 2112;
    double v106 = v84;
    __int16 v107 = 2048;
    uint64_t v108 = v83;
    __int16 v109 = 2112;
    double v110 = v52;
    __int16 v111 = 2112;
    v112 = @"YES";
    __int16 v113 = 2048;
    uint64_t v114 = v53;
    BOOL v10 = v92;
    __int16 v115 = 2112;
    v116 = v54;
    _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%@, %@, useCandidateSelection, %@, placeStats count, %lu, work model type, %@, is home inferred, %@, work candidates from candidateSelection, count, %lu, parameters, %@", buf, 0x52u);

    uint64_t v37 = (uint64_t)aSelectora;
  }
  id v86 = v13;

  if (v10)
  {
    double v55 = v91;
    unint64_t v56 = v97;
    if ([v91 count])
    {
      uint64_t v57 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelForModelType:v97 placeType:2 placeStats:v91 metricsData:v96];
      goto LABEL_46;
    }
    uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      double v67 = (objc_class *)objc_opt_class();
      double v68 = NSStringFromClass(v67);
      NSStringFromSelector(a2);
      v70 = BOOL v69 = v10;
      *(_DWORD *)buf = 138412546;
      uint64_t v102 = v68;
      __int16 v103 = 2112;
      long long v104 = v70;
      _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "%@, %@, placeStatsCandidatesForWorkExcludingPlacesNearHome count is 0. Skipping Work model inference", buf, 0x16u);

      BOOL v10 = v69;
    }

    uint64_t v57 = 0;
    unint64_t v56 = v97;
  }
  else
  {
    v64 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    uint64_t v65 = [(RTLearnedPlaceTypeInferenceGenerator *)self filterPlaceStats:v64 referenceLearnedPlace:v37 minDistanceThreshold:&unk_1F3453F18 maxDistanceThreshold:&unk_1F3453F28];

    unint64_t v56 = v97;
    uint64_t v57 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelForModelType:v97 placeType:2 placeStats:v65 metricsData:v96];
  }
  uint64_t v37 = (uint64_t)aSelectora;
  double v55 = v91;
LABEL_46:

  [v24 addObject:v37];
  id v13 = v86;
  if (v57)
  {
    [v24 addObject:v57];
LABEL_48:
  }
  BOOL v72 = v99 == 2 && v56 == 1;
  uint64_t v73 = 9;
  BOOL v74 = v56 == 1 && v99 == 1;
  uint64_t v75 = 16;
  if (!v74) {
    uint64_t v75 = 0;
  }
  if (!v72) {
    uint64_t v73 = v75;
  }
  BOOL v76 = v56 == 1 && v99 == 1;
  uint64_t v77 = 15;
  if (!v76) {
    uint64_t v77 = 0;
  }
  if (v72) {
    uint64_t v78 = 8;
  }
  else {
    uint64_t v78 = v77;
  }
  if (v10) {
    uint64_t v79 = v78;
  }
  else {
    uint64_t v79 = v73;
  }
  uint64_t v80 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v80 storeMetricsData:v17 source:v79 placeType:1];

  SEL v81 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v81 storeMetricsData:v96 source:v79 placeType:2];

  unint64_t v82 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v82 storeMetricsData:v24 source:v79];

LABEL_12:

  return v24;
}

- (id)inferPlaceTypesFromModelWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel])
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v17);
      uint64_t v15 = NSStringFromSelector(a2);
      int v24 = 138412546;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      v27 = v15;
      int v16 = "%@, %@, feature not supported";
      goto LABEL_10;
    }
LABEL_11:

    uint64_t v19 = 0;
    goto LABEL_12;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v18);
      uint64_t v15 = NSStringFromSelector(a2);
      int v24 = 138412546;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      v27 = v15;
      int v16 = "%@, %@, feature not enabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  double v9 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  BOOL v10 = [v9 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableModel"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      int v24 = 138412546;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      v27 = v15;
      int v16 = "%@, %@, Model disabled by defaults";
LABEL_10:
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v24, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v19 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelWithCandidateSelection:1 homeModelType:2 workModelType:1 placeStats:v7 dateInterval:v8];
  id v21 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelWithCandidateSelection:1 homeModelType:1 workModelType:1 placeStats:v7 dateInterval:v8];
  id v22 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelWithCandidateSelection:0 homeModelType:2 workModelType:1 placeStats:v7 dateInterval:v8];
  id v23 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelWithCandidateSelection:0 homeModelType:1 workModelType:1 placeStats:v7 dateInterval:v8];
LABEL_12:

  return v19;
}

- (id)filteredPlaceStatsByWeeklyVisitThreshold:(double)a3 placeStats:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__RTLearnedPlaceTypeInferenceGenerator_filteredPlaceStatsByWeeklyVisitThreshold_placeStats___block_invoke;
  v9[3] = &__block_descriptor_40_e64_B24__0__RTLearnedPlaceTypeInferencePlaceStats_8__NSDictionary_16l;
  *(double *)&v9[4] = a3;
  id v5 = a4;
  double v6 = [v4 predicateWithBlock:v9];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

BOOL __92__RTLearnedPlaceTypeInferenceGenerator_filteredPlaceStatsByWeeklyVisitThreshold_placeStats___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 stats];
  BOOL v4 = (double)[v3 weeksWithNonZeroDwellTime] / 5.0 > *(double *)(a1 + 32);

  return v4;
}

- (id)inferPlaceTypesFromRuleEngineWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v61 = v8;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v12 = v7;
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v18);
      int v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v77 = (uint64_t)v15;
      __int16 v78 = 2112;
      uint64_t v79 = (uint64_t)v16;
      uint64_t v17 = "%@, %@, feature not enabled";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v19 = 0;
LABEL_9:

    goto LABEL_10;
  }
  double v9 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  BOOL v10 = [v9 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableRuleEngine"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    uint64_t v12 = v7;
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      int v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v77 = (uint64_t)v15;
      __int16 v78 = 2112;
      uint64_t v79 = (uint64_t)v16;
      uint64_t v17 = "%@, %@, Rule Engine disabled by defaults";
LABEL_7:
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, v17, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  [v8 duration];
  uint64_t v22 = *(void *)&v21;
  if (v21 < 1209600.0)
  {
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v77 = v22;
      __int16 v78 = 2048;
      uint64_t v79 = 0x4132750000000000;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "cannot infer place types. data set interval, %.2f, does not exceed required minimum interval, %.2f", buf, 0x16u);
    }
    uint64_t v12 = v7;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v24 = [&unk_1F3453588 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v71 != v26) {
            objc_enumerationMutation(&unk_1F3453588);
          }
          uint64_t v28 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          uint64_t v29 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
          uint64_t v30 = objc_opt_new();
          [v29 storeMetricsData:v30 source:[v28 unsignedIntValue]];
        }
        uint64_t v25 = [&unk_1F3453588 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v25);
    }
LABEL_23:
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  v31 = [(RTLearnedPlaceTypeInferenceGenerator *)self filteredPlaceStatsByWeeklyVisitThreshold:v7 placeStats:0.6];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v34 = [MEMORY[0x1E4F1CA48] array];
    [v33 setObject:v34 forKeyedSubscript:&unk_1F3452658];

    objc_super v35 = [MEMORY[0x1E4F1CA48] array];
    [v33 setObject:v35 forKeyedSubscript:&unk_1F3452670];

    unint64_t v36 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromDailyPatternsWithPlaceStats:v7 dateInterval:v8];
    uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v77 = [v36 count];
      _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "inferred places from daily patterns, %lu", buf, 0xCu);
    }

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke;
    v64[3] = &unk_1E6B99898;
    id v38 = v33;
    id v65 = v38;
    v60 = v36;
    [v36 enumerateObjectsUsingBlock:v64];
    uint64_t v12 = v7;
    v39 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromTopMedianDwellTimeWithPlaceStats:v7 dateInterval:v8];
    unint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = [v39 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v77 = v41;
      _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "inferred places from top median dwell time, %lu", buf, 0xCu);
    }

    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke_406;
    v62[3] = &unk_1E6B99898;
    id v13 = v38;
    uint64_t v63 = v13;
    [v39 enumerateObjectsUsingBlock:v62];
    double v42 = (void *)MEMORY[0x1E4F1CAD0];
    id v43 = [v13 objectForKeyedSubscript:&unk_1F3452658];
    BOOL v44 = [v42 setWithArray:v43];

    uint64_t v45 = [v13 objectForKeyedSubscript:&unk_1F3452658];
    if ((unint64_t)[v45 count] >= 2)
    {
      uint64_t v46 = [v44 count];

      if (v46 != 1)
      {
LABEL_34:
        double v51 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
        [v51 storeMetricsData:v19 source:11];

        goto LABEL_9;
      }
      double v47 = [v44 anyObject];
      [v19 addObject:v47];

      double v48 = (void *)MEMORY[0x1E4F1CAD0];
      double v49 = [v13 objectForKeyedSubscript:&unk_1F3452670];
      uint64_t v45 = [v48 setWithArray:v49];

      if ([v45 count] == 1)
      {
        uint64_t v50 = [v45 anyObject];
        [v19 addObject:v50];
      }
    }

    goto LABEL_34;
  }
  uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "cannot infer place types. at least 1 place is required", buf, 2u);
  }
  uint64_t v12 = v7;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v53 = [&unk_1F34535A0 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (!v53) {
    goto LABEL_23;
  }
  uint64_t v54 = v53;
  uint64_t v55 = *(void *)v67;
  do
  {
    for (uint64_t j = 0; j != v54; ++j)
    {
      if (*(void *)v67 != v55) {
        objc_enumerationMutation(&unk_1F34535A0);
      }
      uint64_t v57 = *(void **)(*((void *)&v66 + 1) + 8 * j);
      uint64_t v58 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
      uint64_t v59 = objc_opt_new();
      [v58 storeMetricsData:v59 source:[v57 unsignedIntValue]];
    }
    uint64_t v54 = [&unk_1F34535A0 countByEnumeratingWithState:&v66 objects:v74 count:16];
    uint64_t v19 = 0;
  }
  while (v54);
LABEL_10:

  return v19;
}

void __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "inferred place from daily patterns %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedInteger:[v5 type]];
  double v9 = [v7 objectForKeyedSubscript:v8];
  [v9 addObject:v5];
}

void __97__RTLearnedPlaceTypeInferenceGenerator_inferPlaceTypesFromRuleEngineWithPlaceStats_dateInterval___block_invoke_406(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "inferred place from top median dwell time %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedInteger:[v5 type]];
  double v9 = [v7 objectForKeyedSubscript:v8];
  [v9 addObject:v5];
}

- (id)fuseInferences:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v77 = 0;
  __int16 v78 = &v77;
  uint64_t v79 = 0x3032000000;
  uint64_t v80 = __Block_byref_object_copy__160;
  SEL v81 = __Block_byref_object_dispose__160;
  id v82 = 0;
  uint64_t v71 = 0;
  long long v72 = &v71;
  uint64_t v73 = 0x3032000000;
  BOOL v74 = __Block_byref_object_copy__160;
  uint64_t v75 = __Block_byref_object_dispose__160;
  id v76 = 0;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x3032000000;
  long long v68 = __Block_byref_object_copy__160;
  long long v69 = __Block_byref_object_dispose__160;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__160;
  uint64_t v63 = __Block_byref_object_dispose__160;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  unint64_t v56 = __Block_byref_object_copy__160;
  uint64_t v57 = __Block_byref_object_dispose__160;
  id v58 = 0;
  id v49 = [MEMORY[0x1E4F1CA48] array];
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = [v5 objectForKeyedSubscript:&unk_1F3452688];
    uint64_t v11 = [v10 count];
    __int16 v12 = [(id)objc_opt_class() placeTypeClassificationSourceToString:3];
    *(_DWORD *)buf = 138413058;
    id v84 = v8;
    __int16 v85 = 2112;
    id v86 = v9;
    __int16 v87 = 2048;
    uint64_t v88 = v11;
    __int16 v89 = 2112;
    __int16 v90 = v12;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);
  }
  id v13 = [v5 objectForKeyedSubscript:&unk_1F3452688];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke;
  v52[3] = &unk_1E6B9C820;
  v52[4] = self;
  v52[5] = &v77;
  v52[6] = &v71;
  v52[7] = a2;
  [v13 enumerateObjectsUsingBlock:v52];

  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v5 objectForKeyedSubscript:&unk_1F3452670];
    uint64_t v19 = [v18 count];
    uint64_t v20 = [(id)objc_opt_class() placeTypeClassificationSourceToString:2];
    *(_DWORD *)buf = 138413058;
    id v84 = v16;
    __int16 v85 = 2112;
    id v86 = v17;
    __int16 v87 = 2048;
    uint64_t v88 = v19;
    __int16 v89 = 2112;
    __int16 v90 = v20;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);
  }
  double v21 = [v5 objectForKeyedSubscript:&unk_1F3452670];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_410;
  void v51[3] = &unk_1E6B9C820;
  v51[4] = self;
  v51[5] = &v65;
  v51[6] = &v59;
  v51[7] = a2;
  [v21 enumerateObjectsUsingBlock:v51];

  uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v5 objectForKeyedSubscript:&unk_1F3452658];
    uint64_t v27 = [v26 count];
    uint64_t v28 = [(id)objc_opt_class() placeTypeClassificationSourceToString:1];
    *(_DWORD *)buf = 138413058;
    id v84 = v24;
    __int16 v85 = 2112;
    id v86 = v25;
    __int16 v87 = 2048;
    uint64_t v88 = v27;
    __int16 v89 = 2112;
    __int16 v90 = v28;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, %@, classified %lu places from source, %@", buf, 0x2Au);
  }
  uint64_t v29 = [v5 objectForKeyedSubscript:&unk_1F3452658];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_411;
  v50[3] = &unk_1E6B9C848;
  v50[4] = self;
  v50[5] = &v53;
  v50[6] = a2;
  [v29 enumerateObjectsUsingBlock:v50];

  uint64_t v30 = (void *)v78[5];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = (void *)v72[5];
    if (v32)
    {
      uint64_t v33 = 3;
      uint64_t v34 = 3;
LABEL_15:
      unint64_t v36 = v32;
LABEL_16:
      id v37 = v32;
      goto LABEL_17;
    }
    uint64_t v32 = (void *)v60[5];
    uint64_t v34 = 3;
    if (v32)
    {
      uint64_t v33 = 2;
      goto LABEL_15;
    }
  }
  else
  {
    objc_super v35 = (void *)v66[5];
    if (!v35)
    {
      uint64_t v32 = (void *)v54[5];
      if (!v32)
      {
        id v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "No places are inferred", buf, 2u);
        }
        unint64_t v36 = 0;
        id v31 = 0;
        goto LABEL_22;
      }
      uint64_t v33 = 0;
      unint64_t v36 = 0;
      uint64_t v34 = 1;
      id v31 = (id)v54[5];
      goto LABEL_16;
    }
    id v31 = v35;
    uint64_t v32 = (void *)v60[5];
    uint64_t v34 = 2;
    if (v32)
    {
      uint64_t v33 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v33 = 0;
  unint64_t v36 = 0;
LABEL_17:
  [v49 addObject:v31];
  id v38 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    double v42 = [(id)objc_opt_class() placeTypeClassificationSourceToString:v34];
    *(_DWORD *)buf = 138413058;
    id v84 = v40;
    __int16 v85 = 2112;
    id v86 = v41;
    __int16 v87 = 2112;
    uint64_t v88 = (uint64_t)v31;
    __int16 v89 = 2112;
    __int16 v90 = v42;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, final inferred Home, %@, final Home source, %@", buf, 0x2Au);
  }
  if (v36)
  {
    [v49 addObject:v36];
    id v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      BOOL v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      double v47 = [(id)objc_opt_class() placeTypeClassificationSourceToString:v33];
      *(_DWORD *)buf = 138413058;
      id v84 = v45;
      __int16 v85 = 2112;
      id v86 = v46;
      __int16 v87 = 2112;
      uint64_t v88 = (uint64_t)v36;
      __int16 v89 = 2112;
      __int16 v90 = v47;
      _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, %@, final inferred Work, %@, final Work source, %@", buf, 0x2Au);
    }
LABEL_22:
  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);

  return v49;
}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = [(id)objc_opt_class() placeTypeClassificationSourceToString:3];
    int v14 = 138413314;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = a3 + 1;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@, %lu, %@", (uint8_t *)&v14, 0x34u);
  }
  uint64_t v12 = [v6 type];
  if (v12 == 2)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    uint64_t v13 = *(void *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(void *)(v13 + 8) + 40), a2);
  }
}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_410(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = [(id)objc_opt_class() placeTypeClassificationSourceToString:2];
    int v14 = 138413314;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = a3 + 1;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@, %lu, %@", (uint8_t *)&v14, 0x34u);
  }
  uint64_t v12 = [v6 type];
  if (v12 == 2)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    uint64_t v13 = *(void *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(void *)(v13 + 8) + 40), a2);
  }
}

void __55__RTLearnedPlaceTypeInferenceGenerator_fuseInferences___block_invoke_411(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v11 = [(id)objc_opt_class() placeTypeClassificationSourceToString:1];
    int v12 = 138413314;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = a3 + 1;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, place from source, %@ %lu, %@", (uint8_t *)&v12, 0x34u);
  }
  if ([v6 type] == 1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)inferPlaceTypesFromFallbackWithPlaceStats:(id)a3 dateInterval:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v14);
      int v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v47 = v11;
      __int16 v48 = 2112;
      id v49 = v12;
      uint64_t v13 = "%@, %@, feature not enabled";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v15 = 0;
    goto LABEL_20;
  }
  id v6 = [(RTLearnedPlaceTypeInferenceGenerator *)self defaultsManager];
  id v7 = [v6 objectForKey:@"RTDefaultsLearnedPlaceTypeInferenceGeneratorDisableFallback"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v47 = v11;
      __int16 v48 = 2112;
      id v49 = v12;
      uint64_t v13 = "%@, %@, Fall Back disabled by defaults";
LABEL_7:
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, v13, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  __int16 v16 = objc_opt_class();
  id v17 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
  __int16 v18 = [v16 sortPlaceStats:v17];

  if ([v18 count])
  {
    BOOL v44 = v18;
    id v45 = a2;
    uint64_t v19 = [v18 firstObject];
    id v40 = [RTLearnedPlace alloc];
    id v43 = [v19 place];
    v39 = [v43 identifier];
    double v42 = [v19 place];
    __int16 v20 = [v42 mapItem];
    id v21 = [v19 place];
    uint64_t v22 = [v21 customLabel];
    id v23 = [v19 place];
    uint64_t v24 = [v23 creationDate];
    id v41 = v19;
    id v25 = [v19 place];
    uint64_t v26 = [v25 expirationDate];
    id v9 = [(RTLearnedPlace *)v40 initWithIdentifier:v39 type:1 typeSource:1 mapItem:v20 customLabel:v22 creationDate:v24 expirationDate:v26];

    if (v9)
    {
      [v15 addObject:v9];
      __int16 v18 = v44;
      a2 = v45;
      uint64_t v27 = v41;
    }
    else
    {
      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      a2 = v45;
      uint64_t v27 = v41;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        unint64_t v36 = (objc_class *)objc_opt_class();
        id v37 = NSStringFromClass(v36);
        id v38 = NSStringFromSelector(v45);
        *(_DWORD *)buf = 138412802;
        double v47 = v37;
        __int16 v48 = 2112;
        id v49 = v38;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v41;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, %@, failed to create home from placeStats object, %@", buf, 0x20u);
      }
      __int16 v18 = v44;
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = (objc_class *)objc_opt_class();
    id v31 = NSStringFromClass(v30);
    uint64_t v32 = NSStringFromSelector(a2);
    uint64_t v33 = [v18 count];
    *(_DWORD *)buf = 138413058;
    double v47 = v31;
    __int16 v48 = 2112;
    id v49 = v32;
    __int16 v50 = 2048;
    uint64_t v51 = v33;
    __int16 v52 = 2112;
    uint64_t v53 = v9;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, inferred home from fallback, %@,", buf, 0x2Au);
  }
  uint64_t v34 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v34 storeMetricsData:v15 source:4];

LABEL_20:

  return v15;
}

- (id)_getCandidatePlaceStatsFromPlaceStats:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_416];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __78__RTLearnedPlaceTypeInferenceGenerator__getCandidatePlaceStatsFromPlaceStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v23 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = v4;
  id v7 = [v4 visitIntervals];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1E016D870]();
        __int16 v14 = [v12 startDate];
        uint64_t v15 = [v14 compare:v5];

        if (v15 == -1)
        {
          uint64_t v16 = [v12 startDate];

          id v5 = (void *)v16;
        }
        id v17 = [v12 endDate];
        uint64_t v18 = [v6 compare:v17];

        if (v18 == -1)
        {
          uint64_t v19 = [v12 endDate];

          id v6 = (void *)v19;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  [v6 timeIntervalSinceDate:v5];
  BOOL v21 = v20 >= 1555200.0;

  return v21;
}

- (id)_getFullLocationHistoryDateInterval
{
  id v3 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
  uint64_t v4 = [v3 entryDate];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
    uint64_t v7 = [v6 exitDate];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
      uint64_t v10 = [v9 entryDate];
      uint64_t v11 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
      int v12 = [v11 exitDate];
      uint64_t v13 = [v10 compare:v12];

      if (v13 != -1)
      {
        __int16 v14 = 0;
        goto LABEL_10;
      }
      id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v3 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
      id v5 = [v3 entryDate];
      id v6 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
      uint64_t v16 = [v6 exitDate];
      __int16 v14 = (void *)[v15 initWithStartDate:v5 endDate:v16];
    }
    else
    {
      __int16 v14 = 0;
    }
  }
  else
  {
    __int16 v14 = 0;
  }

LABEL_10:

  return v14;
}

- (id)inferPlaceTypes
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  [(RTLearnedPlaceTypeInferenceGenerator *)self log];
  uint64_t v4 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
  id v5 = [(RTLearnedPlaceTypeInferenceGenerator *)self _getCandidatePlaceStatsFromPlaceStats:v4];

  uint64_t v6 = [(RTLearnedPlaceTypeInferenceGenerator *)self _getFullLocationHistoryDateInterval];
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    *(_DWORD *)buf = 138413314;
    id v86 = v9;
    __int16 v87 = 2112;
    uint64_t v88 = v10;
    __int16 v89 = 2048;
    uint64_t v90 = [v11 count];
    __int16 v91 = 2048;
    uint64_t v92 = [v5 count];
    __int16 v93 = 2112;
    uint64_t v94 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, placeStats count, %lu, candidate placeStats count, %lu, dateInterval, %@", buf, 0x34u);
  }
  int v12 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromRuleEngineWithPlaceStats:v5 dateInterval:v6];
  uint64_t v75 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelWithPlaceStats:v5 dateInterval:v6];
  if ([v12 count] || objc_msgSend(v75, "count"))
  {
    BOOL v74 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromFallbackWithPlaceStats:v5 dateInterval:v6];
  }
  else
  {
    id v31 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    BOOL v74 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromFallbackWithPlaceStats:v31 dateInterval:v6];
  }
  long long v66 = (void *)v6;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    id v17 = 0;
    uint64_t v18 = *(void *)v77;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v77 != v18) {
          objc_enumerationMutation(v13);
        }
        double v20 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v21 = [v20 type];
        if (v21 == 1)
        {
          uint64_t v22 = v17;
          id v17 = v20;
        }
        else
        {
          if (v21 != 2) {
            continue;
          }
          uint64_t v22 = v16;
          uint64_t v16 = v20;
        }
        id v23 = v20;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v84 count:16];
      if (!v15) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v16 = 0;
  id v17 = 0;
LABEL_20:

  uint64_t v24 = objc_opt_new();
  uint64_t v25 = objc_opt_new();
  uint64_t v71 = objc_opt_new();
  id v70 = objc_opt_new();
  uint64_t v67 = v5;
  if (v17
    && [(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel]
    && _os_feature_enabled_impl())
  {
    long long v72 = (void *)v25;
    uint64_t v83 = v17;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    id v62 = +[RTLearnedPlaceTypeInferenceGenerator getCandidateGenerationParameters];
    id v64 = (void *)v26;
    v60 = -[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:](self, "placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:parameters:distanceThreshold:", 2, v5, v66, v26, 200.0);
    long long v27 = -[RTLearnedPlaceTypeInferenceGenerator filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:](self, "filterPlaceStats:referenceLearnedPlace:minDistanceThreshold:maxDistanceThreshold:");
    uint64_t v28 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelForModelType:1 placeType:2 placeStats:v27 metricsData:v71];
    uint64_t v29 = (void *)v28;
    if (v28)
    {
      uint64_t v82 = v28;
      uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];

      if (!v16)
      {
        v81[0] = v17;
        v81[1] = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];

        uint64_t v75 = (void *)v30;
      }
    }
    else
    {
      uint64_t v68 = (uint64_t)v24;
    }
    uint64_t v32 = [(RTLearnedPlaceTypeInferenceGenerator *)self filterPlaceStats:v67 referenceLearnedPlace:v17 minDistanceThreshold:&unk_1F3453F18 maxDistanceThreshold:&unk_1F3453F28];
    uint64_t v33 = [(RTLearnedPlaceTypeInferenceGenerator *)self inferPlaceTypesFromModelForModelType:1 placeType:2 placeStats:v32 metricsData:v70];
    uint64_t v34 = (void *)v33;
    if (v33)
    {
      uint64_t v80 = v33;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];

      long long v72 = (void *)v35;
    }
    unint64_t v36 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
    [v36 storeMetricsData:v71 source:6 placeType:2];

    id v37 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
    [v37 storeMetricsData:v70 source:7 placeType:2];

    uint64_t v25 = (uint64_t)v72;
    uint64_t v24 = (void *)v68;
  }
  id v38 = objc_opt_new();
  [v38 setObject:v13 forKeyedSubscript:&unk_1F3452688];
  [v38 setObject:v75 forKeyedSubscript:&unk_1F3452670];
  [v38 setObject:v74 forKeyedSubscript:&unk_1F3452658];
  uint64_t v65 = v38;
  uint64_t v39 = [(RTLearnedPlaceTypeInferenceGenerator *)self fuseInferences:v38];
  id v40 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  long long v69 = v24;
  [v40 storeMetricsData:v24 source:6];

  id v41 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  uint64_t v73 = (void *)v25;
  [v41 storeMetricsData:v25 source:7];

  double v42 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  id v63 = (id)v39;
  [v42 storeMetricsData:v39 source:5];

  id v43 = objc_opt_new();
  BOOL v44 = NSNumber;
  id v45 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
  id v46 = [v44 numberWithUnsignedInteger:[v45 count]];
  [v43 setObject:v46 forKeyedSubscript:&unk_1F3452670];

  double v47 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
  uint64_t v48 = [v47 entryDate];
  if (v48)
  {
    id v49 = (void *)v48;
    __int16 v50 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
    uint64_t v51 = [v50 exitDate];

    __int16 v52 = v67;
    if (!v51) {
      goto LABEL_36;
    }
    double v47 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v61 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
    uint64_t v53 = [v61 entryDate];
    uint64_t v54 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
    uint64_t v55 = [v54 exitDate];
    uint64_t v59 = [v47 components:16 fromDate:v53 toDate:v55 options:0];

    __int16 v52 = v67;
    unint64_t v56 = [NSNumber numberWithInteger:[v59 day]];
    [v43 setObject:v56 forKeyedSubscript:&unk_1F3452688];
  }
  else
  {
    __int16 v52 = v67;
  }

LABEL_36:
  uint64_t v57 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeTypeClassifierMetricsCalculator];
  [v57 storeMetricsData:v43 source:0 placeType:0];

  return v63;
}

- (void)log
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(RTLearnedPlaceTypeInferenceGenerator *)self lastVisit];
    uint64_t v9 = [v8 exitDate];
    uint64_t v10 = [(RTLearnedPlaceTypeInferenceGenerator *)self firstVisit];
    uint64_t v11 = [v10 entryDate];
    [v9 timeIntervalSinceDate:v11];
    int v14 = 138412802;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, place stats, %lu, dataSetTimeInterval, %.2f", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStats];
  [v13 enumerateObjectsUsingBlock:&__block_literal_global_418];
}

void __43__RTLearnedPlaceTypeInferenceGenerator_log__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "place stat, %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)placeCandidatesFromDailyPatternsForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5
{
  v82[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (a3 == 1)
  {
    aSelector = a2;
    id v58 = self;
    id v59 = v9;
    unint64_t v56 = @"home";
    uint64_t v12 = @"sHomeTotalWeeklyVisitCountPlaceCandidates";
    id v13 = @"sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
    int v14 = @"sHomeMaxDaysNonZeroDwellTimePlaceCandidates";
    uint64_t v15 = @"sHomeMinDaysNonZeroDwellTimePlaceCandidates";
  }
  else
  {
    if (a3 != 2)
    {
      __int16 v50 = 0;
      goto LABEL_9;
    }
    aSelector = a2;
    id v58 = self;
    id v59 = v9;
    unint64_t v56 = @"work";
    uint64_t v12 = @"sWorkTotalWeeklyVisitCountPlaceCandidates";
    id v13 = @"sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
    int v14 = @"sWorkMaxDaysNonZeroDwellTimePlaceCandidates";
    uint64_t v15 = @"sWorkMinDaysNonZeroDwellTimePlaceCandidates";
  }
  [v10 objectForKeyedSubscript:v15];
  __int16 v16 = v64 = v11;
  [v16 doubleValue];
  double v18 = v17;

  uint64_t v19 = [v64 objectForKeyedSubscript:v14];
  [v19 doubleValue];
  double v21 = v20;

  uint64_t v22 = [v64 objectForKeyedSubscript:v13];
  [v22 doubleValue];
  double v24 = v23;

  uint64_t v25 = [v64 objectForKeyedSubscript:v12];
  [v25 doubleValue];
  double v27 = v26;

  uint64_t v28 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyDaysWithNonZeroDwellTimeAverage"];
  id v63 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyAggregateDwellTimeBetweenDateRangeAverage"];
  uint64_t v29 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyTotalDailyVisitCountAverage"];
  v60 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v30 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v61 = [NSNumber numberWithDouble:v18];
  id v31 = [v30 predicateWithFormat:@"%K >= %@", v28, v61];
  v82[0] = v31;
  uint64_t v32 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v33 = [NSNumber numberWithDouble:v21];
  uint64_t v34 = [v32 predicateWithFormat:@"%K <= %@", v28, v33];
  v82[1] = v34;
  uint64_t v35 = (void *)MEMORY[0x1E4F28F60];
  unint64_t v36 = [NSNumber numberWithDouble:v24];
  id v37 = [v35 predicateWithFormat:@"%K > %@", v63, v36];
  v82[2] = v37;
  id v38 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v39 = [NSNumber numberWithDouble:v27];
  id v62 = (void *)v29;
  id v40 = [v38 predicateWithFormat:@"%K >= %@", v29, v39];
  v82[3] = v40;
  id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
  double v42 = [v60 andPredicateWithSubpredicates:v41];

  uint64_t v11 = v64;
  id v43 = (void *)v28;

  BOOL v44 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v28 ascending:0];
  v81[0] = v44;
  id v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v63 ascending:0];
  v81[1] = v45;
  id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];

  double v47 = [v64 objectForKeyedSubscript:@"sWeeklyVisitThresholdPlaceCandidates"];
  [v47 doubleValue];
  id v9 = v59;
  uint64_t v48 = -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v58, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v59);
  id v49 = [v48 filteredArrayUsingPredicate:v42];
  __int16 v50 = [v49 sortedArrayUsingDescriptors:v46];

  uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    __int16 v52 = (objc_class *)objc_opt_class();
    uint64_t v53 = NSStringFromClass(v52);
    uint64_t v54 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138414082;
    long long v66 = v53;
    __int16 v67 = 2112;
    uint64_t v68 = v54;
    __int16 v69 = 2112;
    id v70 = v56;
    __int16 v71 = 2048;
    double v72 = v18;
    __int16 v73 = 2048;
    double v74 = v21;
    __int16 v75 = 2048;
    double v76 = v24;
    __int16 v77 = 2048;
    double v78 = v27;
    __int16 v79 = 2112;
    uint64_t v80 = v50;
    _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from daily patterns requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, maxDaysNonZeroDwellTimePlaceCandidates, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f: %@", buf, 0x52u);
  }
LABEL_9:

  return v50;
}

- (id)placeCandidatesFromTopMedianDwellTimeForType:(unint64_t)a3 placeStats:(id)a4 parameters:(id)a5
{
  v75[3] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (a3 == 1)
  {
    aSelector = a2;
    uint64_t v53 = self;
    id v54 = v9;
    uint64_t v51 = @"home";
    uint64_t v12 = @"sHomeMinTopMedianDwellTimePlaceCandidates";
    id v13 = @"sHomeTotalWeeklyVisitCountPlaceCandidates";
    int v14 = @"sHomeMinDaysNonZeroDwellTimePlaceCandidates";
  }
  else
  {
    if (a3 != 2)
    {
      BOOL v44 = 0;
      goto LABEL_9;
    }
    aSelector = a2;
    uint64_t v53 = self;
    id v54 = v9;
    uint64_t v51 = @"work";
    uint64_t v12 = @"sWorkMinTopMedianDwellTimePlaceCandidates";
    id v13 = @"sWorkTotalWeeklyVisitCountPlaceCandidates";
    int v14 = @"sWorkMinDaysNonZeroDwellTimePlaceCandidates";
  }
  uint64_t v15 = [v10 objectForKeyedSubscript:v14];
  [v15 doubleValue];
  double v17 = v16;

  double v18 = [v11 objectForKeyedSubscript:v13];
  [v18 doubleValue];
  double v20 = v19;

  double v21 = [v11 objectForKeyedSubscript:v12];
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyDaysWithNonZeroDwellTimeAverage"];
  [NSString stringWithFormat:@"%@.%@", @"stats", @"weeklyTotalDailyVisitCountAverage"];
  v26 = uint64_t v25 = v11;
  uint64_t v27 = [NSString stringWithFormat:@"%@.%@", @"stats", @"topMedianDwellTime"];
  uint64_t v55 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v28 = (void *)MEMORY[0x1E4F28F60];
  unint64_t v56 = [NSNumber numberWithDouble:v17];
  id v59 = (void *)v24;
  uint64_t v29 = [v28 predicateWithFormat:@"%K >= %@", v24, v56];
  v75[0] = v29;
  uint64_t v30 = (void *)MEMORY[0x1E4F28F60];
  id v31 = [NSNumber numberWithDouble:v20];
  uint64_t v50 = v26;
  id v58 = (void *)v26;
  uint64_t v11 = v25;
  uint64_t v32 = [v30 predicateWithFormat:@"%K >= %@", v50, v31];
  v75[1] = v32;
  uint64_t v33 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v34 = [NSNumber numberWithDouble:v23];
  uint64_t v57 = (void *)v27;
  uint64_t v35 = [v33 predicateWithFormat:@"%K > %@", v27, v34];
  v75[2] = v35;
  unint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  uint64_t v37 = [v55 andPredicateWithSubpredicates:v36];

  id v38 = (void *)v37;
  uint64_t v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"stats.topMedianDwellTime" ascending:0];
  double v74 = v39;
  id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];

  id v41 = [v25 objectForKeyedSubscript:@"sWeeklyVisitThresholdPlaceCandidates"];
  [v41 doubleValue];
  id v9 = v54;
  double v42 = -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v53, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v54);
  id v43 = [v42 filteredArrayUsingPredicate:v38];
  BOOL v44 = [v43 sortedArrayUsingDescriptors:v40];

  id v45 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    id v46 = (objc_class *)objc_opt_class();
    double v47 = NSStringFromClass(v46);
    uint64_t v48 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138413826;
    uint64_t v61 = v47;
    __int16 v62 = 2112;
    id v63 = v48;
    __int16 v64 = 2112;
    uint64_t v65 = v51;
    __int16 v66 = 2048;
    double v67 = v17;
    __int16 v68 = 2048;
    double v69 = v20;
    __int16 v70 = 2048;
    double v71 = v23;
    __int16 v72 = 2112;
    __int16 v73 = v44;
    _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time stats requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f, minTopMedianDwellTimePlaceCandidates, %.2f: %@", buf, 0x48u);
  }
LABEL_9:

  return v44;
}

- (id)filterPlaceStats:(id)a3 referenceLearnedPlace:(id)a4 minDistanceThreshold:(id)a5 maxDistanceThreshold:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v45 = a5;
  id v44 = a6;
  if (v11 && v45 && v44)
  {
    aSelector = a2;
    id v42 = v10;
    id v43 = (id)objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id obj = v12;
      uint64_t v47 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v50 != v47) {
            objc_enumerationMutation(obj);
          }
          double v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          double v17 = [(RTLearnedPlaceTypeInferenceGenerator *)self distanceCalculator];
          double v18 = [v16 place];
          double v19 = [v18 mapItem];
          double v20 = [v19 location];
          double v21 = [v11 mapItem];
          double v22 = [v21 location];
          [v17 distanceFromLocation:v20 toLocation:v22 error:0];
          double v24 = v23;

          uint64_t v25 = [v16 place];
          uint64_t v26 = [v25 identifier];
          uint64_t v27 = [v11 identifier];
          if (([v26 isEqual:v27] & 1) != 0 || (objc_msgSend(v45, "doubleValue"), v24 <= v28))
          {
          }
          else
          {
            [v44 doubleValue];
            double v30 = v29;

            if (v24 < v30) {
              [v43 addObject:v16];
            }
          }
        }
        id v12 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v65 count:16];
      }
      while (v14);
    }

    id v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = (objc_class *)objc_opt_class();
      uint64_t v33 = NSStringFromClass(v32);
      uint64_t v34 = NSStringFromSelector(aSelector);
      uint64_t v35 = [v12 count];
      uint64_t v36 = [v43 count];
      [v45 doubleValue];
      uint64_t v38 = v37;
      [v44 doubleValue];
      *(_DWORD *)buf = 138413570;
      id v54 = v33;
      __int16 v55 = 2112;
      unint64_t v56 = v34;
      __int16 v57 = 2048;
      uint64_t v58 = v35;
      __int16 v59 = 2048;
      uint64_t v60 = v36;
      __int16 v61 = 2048;
      uint64_t v62 = v38;
      __int16 v63 = 2048;
      uint64_t v64 = v39;
      _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%@, %@, input placeStats count, %lu, filterPlaceStats count, %lu, minDistanceThreshold, %.2f, maxDistanceThreshold, %.2f", buf, 0x3Eu);
    }
    id v10 = v42;
  }
  else
  {
    id v43 = v10;
  }

  return v43;
}

- (id)placeCandidateStatsForType:(unint64_t)a3 placeStats:(id)a4 dateInterval:(id)a5 excludingPlaces:(id)a6 parameters:(id)a7 distanceThreshold:(double)a8
{
  v167[12] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v131 = a5;
  id v15 = a6;
  id v16 = a7;
  v130 = self;
  [(RTLearnedPlaceTypeInferenceGenerator *)self _prepareMLFeaturesWithPlaceStats:v14];
  double v17 = (void *)MEMORY[0x1E4F1CAD0];
  v167[0] = @"sWeeklyVisitThresholdPlaceCandidates";
  v167[1] = @"sMinimumDataSetIntervalForPlaceCandidates";
  v167[2] = @"sHomeMinTopMedianDwellTimePlaceCandidates";
  v167[3] = @"sHomeTotalWeeklyVisitCountPlaceCandidates";
  v167[4] = @"sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
  v167[5] = @"sHomeMinDaysNonZeroDwellTimePlaceCandidates";
  v167[6] = @"sHomeMaxDaysNonZeroDwellTimePlaceCandidates";
  v167[7] = @"sWorkMinTopMedianDwellTimePlaceCandidates";
  v167[8] = @"sWorkTotalWeeklyVisitCountPlaceCandidates";
  v167[9] = @"sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
  v167[10] = @"sWorkMinDaysNonZeroDwellTimePlaceCandidates";
  v167[11] = @"sWorkMaxDaysNonZeroDwellTimePlaceCandidates";
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:12];
  uint64_t v19 = [v17 setWithArray:v18];

  double v20 = (void *)MEMORY[0x1E4F1CAD0];
  v132 = v16;
  double v21 = [v16 allKeys];
  double v22 = [v20 setWithArray:v21];

  v128 = v22;
  v129 = (void *)v19;
  if (([v22 isEqualToSet:v19] & 1) == 0)
  {
    double v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v150 = "-[RTLearnedPlaceTypeInferenceGenerator placeCandidateStatsForType:placeStats:dateInterval:excludingPlaces:p"
             "arameters:distanceThreshold:]";
      __int16 v151 = 1024;
      LODWORD(v152) = 2192;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [parametersKeys isEqualToSet:expectedKeys] (in %s:%d)", buf, 0x12u);
    }
  }
  double v24 = v131;
  [v131 duration];
  double v26 = v25;
  uint64_t v27 = [v16 objectForKeyedSubscript:@"sMinimumDataSetIntervalForPlaceCandidates"];
  [v27 doubleValue];
  double v29 = v28;

  if (v26 < v29)
  {
    double v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = v16;
      uint64_t v32 = [v16 objectForKeyedSubscript:@"sMinimumDataSetIntervalForPlaceCandidates"];
      [v32 doubleValue];
      *(_DWORD *)buf = 134218240;
      v150 = *(const char **)&v26;
      __int16 v151 = 2048;
      uint64_t v152 = v33;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "cannot generate place candidates. data set interval, %.2f, does not exceed required minimum interval, %.2f", buf, 0x16u);

      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v34 = 0;
      id v31 = v16;
    }
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v35 = [v16 objectForKeyedSubscript:@"sWeeklyVisitThresholdPlaceCandidates"];
  [v35 doubleValue];
  uint64_t v36 = -[RTLearnedPlaceTypeInferenceGenerator filteredPlaceStatsByWeeklyVisitThreshold:placeStats:](v130, "filteredPlaceStatsByWeeklyVisitThreshold:placeStats:", v14);
  uint64_t v37 = [v36 count];

  if (!v37)
  {
    double v30 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "cannot generate place candidates. at least 1 place is required", buf, 2u);
    }
    uint64_t v34 = 0;
    double v24 = v131;
    id v31 = v132;
    goto LABEL_50;
  }
  if (a3 == 1)
  {
    id v38 = v15;
    v121 = @"home";
    uint64_t v39 = @"sHomeMinTopMedianDwellTimePlaceCandidates";
    id v40 = @"sHomeTotalWeeklyVisitCountPlaceCandidates";
    id v41 = @"sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
    id v42 = @"sHomeMaxDaysNonZeroDwellTimePlaceCandidates";
    id v43 = @"sHomeMinDaysNonZeroDwellTimePlaceCandidates";
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    id v38 = v15;
    v121 = @"work";
    uint64_t v39 = @"sWorkMinTopMedianDwellTimePlaceCandidates";
    id v40 = @"sWorkTotalWeeklyVisitCountPlaceCandidates";
    id v41 = @"sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
    id v42 = @"sWorkMaxDaysNonZeroDwellTimePlaceCandidates";
    id v43 = @"sWorkMinDaysNonZeroDwellTimePlaceCandidates";
LABEL_17:
    id v44 = [v132 objectForKeyedSubscript:v43];
    [v44 doubleValue];
    id v46 = v45;

    uint64_t v47 = [v132 objectForKeyedSubscript:v42];
    [v47 doubleValue];
    uint64_t v49 = v48;

    long long v50 = [v132 objectForKeyedSubscript:v41];
    [v50 doubleValue];
    uint64_t v52 = v51;

    uint64_t v53 = [v132 objectForKeyedSubscript:v40];
    [v53 doubleValue];
    uint64_t v55 = v54;

    unint64_t v56 = [v132 objectForKeyedSubscript:v39];
    [v56 doubleValue];
    uint64_t v58 = v57;

    double v122 = [(RTLearnedPlaceTypeInferenceGenerator *)v130 placeCandidatesFromDailyPatternsForType:a3 placeStats:v14 parameters:v132];
    __int16 v59 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      uint64_t v60 = [v122 count];
      *(_DWORD *)buf = 138412546;
      v150 = (const char *)v121;
      __int16 v151 = 2048;
      uint64_t v152 = v60;
      _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "number of candidate places from daily patterns for %@: %lu", buf, 0x16u);
    }

    __int16 v61 = [(RTLearnedPlaceTypeInferenceGenerator *)v130 placeCandidatesFromTopMedianDwellTimeForType:a3 placeStats:v14 parameters:v132];
    uint64_t v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    id v15 = v38;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      uint64_t v63 = [v61 count];
      *(_DWORD *)buf = 138412546;
      v150 = (const char *)v121;
      __int16 v151 = 2048;
      uint64_t v152 = v63;
      _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "number of candidate places from top median dwell time for %@: %lu", buf, 0x16u);
    }
    double v120 = v14;

    uint64_t v64 = [MEMORY[0x1E4F1CA80] setWithArray:v122];
    v119 = v61;
    double v117 = [MEMORY[0x1E4F1CAD0] setWithArray:v61];
    [v64 intersectSet:];
    uint64_t v65 = (void *)MEMORY[0x1E4F1CA48];
    double v118 = v64;
    uint64_t v66 = [v64 allObjects];
    double v67 = [v65 arrayWithArray:v66];

    __int16 v68 = [(id)objc_opt_class() sortPlaceStats:v67];

    double v69 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      __int16 v70 = (objc_class *)objc_opt_class();
      NSStringFromClass(v70);
      double v71 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v72 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138414338;
      v150 = v71;
      __int16 v151 = 2112;
      uint64_t v152 = (uint64_t)v72;
      __int16 v153 = 2112;
      uint64_t v154 = v121;
      __int16 v155 = 2048;
      v156 = v46;
      __int16 v157 = 2048;
      uint64_t v158 = v49;
      __int16 v159 = 2048;
      uint64_t v160 = v52;
      __int16 v161 = 2048;
      uint64_t v162 = v55;
      __int16 v163 = 2048;
      uint64_t v164 = v58;
      __int16 v165 = 2112;
      v166 = v68;
      _os_log_impl(&dword_1D9BFA000, v69, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time and daily patterns before pruning requiring minDaysNonZeroDwellTimePlaceCandidates, %.2f, maxDaysNonZeroDwellTimePlaceCandidates, %.2f, minWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates, %.2f, totalWeeklyVisitCountPlaceCandidates, %.2f, minTopMedianDwellTimePlaceCandidates, %.2f: %@", buf, 0x5Cu);
    }
    v134 = [MEMORY[0x1E4F1CA48] array];
    v137 = objc_opt_new();
    v135 = v68;
    if (![v68 count])
    {
LABEL_47:
      uint64_t v108 = (void *)MEMORY[0x1E4F28F60];
      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __136__RTLearnedPlaceTypeInferenceGenerator_placeCandidateStatsForType_placeStats_dateInterval_excludingPlaces_parameters_distanceThreshold___block_invoke;
      v141[3] = &unk_1E6B9C8B0;
      id v142 = v134;
      id v109 = v134;
      double v110 = [v108 predicateWithBlock:v141];
      id v14 = v120;
      __int16 v111 = [v120 filteredArrayUsingPredicate:v110];

      uint64_t v34 = [(id)objc_opt_class() sortPlaceStats:v111];

      v112 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        __int16 v113 = (objc_class *)objc_opt_class();
        NSStringFromClass(v113);
        uint64_t v114 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v115 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        v150 = v114;
        __int16 v151 = 2112;
        uint64_t v152 = (uint64_t)v115;
        __int16 v153 = 2112;
        uint64_t v154 = v121;
        __int16 v155 = 2112;
        v156 = v34;
        _os_log_impl(&dword_1D9BFA000, v112, OS_LOG_TYPE_INFO, "%@, %@, candidate %@ places from dwell time and daily patterns after pruning: %@", buf, 0x2Au);
      }
      double v24 = v131;
      id v31 = v132;
      double v30 = v122;
      goto LABEL_50;
    }
    unint64_t v73 = 0;
    v133 = v38;
    while (1)
    {
      unint64_t v136 = v73;
      id v140 = [v68 objectAtIndexedSubscript:v73];
      if ([v15 count])
      {
        unint64_t v74 = 0;
        do
        {
          __int16 v75 = [v15 objectAtIndexedSubscript:v74];
          double v76 = [v140 place];
          __int16 v77 = [v76 identifier];
          double v78 = [v75 identifier];
          int v79 = [v77 isEqual:v78];

          if (v79) {
            break;
          }
          ++v74;
        }
        while ([v15 count] > v74);
      }
      else
      {
        LOBYTE(v79) = 0;
      }
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v80 = v134;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v144 objects:v148 count:16];
      if (v81) {
        break;
      }
LABEL_43:

      id v15 = v133;
      unint64_t v99 = v136;
      if ((v79 & 1) == 0)
      {
        id obja = v80;
        double v125 = [RTLearnedPlace alloc];
        double v127 = [v140 place];
        v124 = [v127 identifier];
        v126 = [v140 place];
        id v100 = [v126 mapItem];
        id v101 = [v140 place];
        uint64_t v102 = [v101 customLabel];
        __int16 v103 = [v140 place];
        long long v104 = [v103 creationDate];
        __int16 v105 = [v140 place];
        double v106 = [v105 expirationDate];
        __int16 v107 = [(RTLearnedPlace *)v125 initWithIdentifier:v124 type:0 typeSource:0 mapItem:v100 customLabel:v102 creationDate:v104 expirationDate:v106];

        [obja addObject:v107];
      }
LABEL_46:

      unint64_t v73 = v99 + 1;
      __int16 v68 = v135;
      if ([v135 count] <= v73) {
        goto LABEL_47;
      }
    }
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v145;
    id obj = v80;
LABEL_33:
    uint64_t v84 = 0;
    while (1)
    {
      if (*(void *)v145 != v83) {
        objc_enumerationMutation(obj);
      }
      __int16 v85 = *(void **)(*((void *)&v144 + 1) + 8 * v84);
      id v86 = [v85 mapItem];
      uint64_t v87 = [v86 location];
      if (!v87) {
        goto LABEL_40;
      }
      uint64_t v88 = (void *)v87;
      __int16 v89 = [v140 place];
      uint64_t v90 = [v89 mapItem];
      __int16 v91 = [v90 location];

      if (v91) {
        break;
      }
LABEL_41:
      if (v82 == ++v84)
      {
        id v80 = obj;
        uint64_t v82 = [obj countByEnumeratingWithState:&v144 objects:v148 count:16];
        if (v82) {
          goto LABEL_33;
        }
        goto LABEL_43;
      }
    }
    uint64_t v92 = [v140 place];
    __int16 v93 = [v92 mapItem];
    uint64_t v94 = [v93 location];
    uint64_t v95 = [v85 mapItem];
    __int16 v96 = [v95 location];
    id v143 = 0;
    [v137 distanceFromLocation:v94 toLocation:v96 error:&v143];
    double v98 = v97;
    id v86 = v143;

    if (!v86 && v98 <= a8)
    {
      id v15 = v133;
      unint64_t v99 = v136;

      goto LABEL_46;
    }
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v34 = 0;
  double v24 = v131;
  id v31 = v132;
LABEL_51:

  return v34;
}

uint64_t __136__RTLearnedPlaceTypeInferenceGenerator_placeCandidateStatsForType_placeStats_dateInterval_excludingPlaces_parameters_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mlFeatures];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        __int16 v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = [v3 place];
        id v10 = [v9 identifier];
        id v11 = [v8 identifier];
        if ([v10 isEqual:v11])
        {
          id v12 = [v4 objectForKeyedSubscript:@"mean_daily_longest_charging_duration_bucketed"];
          [v12 doubleValue];
          if (v13 > 1.0) {
            goto LABEL_16;
          }
          id v14 = [v4 objectForKeyedSubscript:@"mean_daily_longest_screen_lock_duration_bucketed"];
          [v14 doubleValue];
          if (v15 > 1.0)
          {

LABEL_16:
LABEL_17:
            uint64_t v5 = 1;
            goto LABEL_18;
          }
          [v4 objectForKeyedSubscript:@"mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed"];
          double v25 = v9;
          uint64_t v16 = v5;
          double v17 = v4;
          uint64_t v18 = v6;
          v20 = id v19 = v3;
          [v20 doubleValue];
          double v22 = v21;

          id v3 = v19;
          uint64_t v6 = v18;
          id v4 = v17;
          uint64_t v5 = v16;

          if (v22 > 1.0) {
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v5;
}

+ (id)getCandidateGenerationParameters
{
  v5[12] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sWeeklyVisitThresholdPlaceCandidates";
  v4[1] = @"sMinimumDataSetIntervalForPlaceCandidates";
  v5[0] = &unk_1F3453F38;
  v5[1] = &unk_1F3453F48;
  v4[2] = @"sHomeMinTopMedianDwellTimePlaceCandidates";
  v4[3] = @"sHomeTotalWeeklyVisitCountPlaceCandidates";
  v5[2] = &unk_1F3453F58;
  v5[3] = &unk_1F34526A0;
  v4[4] = @"sHomeMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
  v4[5] = @"sHomeMinDaysNonZeroDwellTimePlaceCandidates";
  v5[4] = &unk_1F3453F68;
  v5[5] = &unk_1F34526A0;
  v4[6] = @"sHomeMaxDaysNonZeroDwellTimePlaceCandidates";
  v4[7] = @"sWorkMinTopMedianDwellTimePlaceCandidates";
  v5[6] = &unk_1F34526B8;
  v5[7] = &unk_1F3453F78;
  v4[8] = @"sWorkTotalWeeklyVisitCountPlaceCandidates";
  v4[9] = @"sWorkMinWeeklyAggregateDwellTimeBetweenDateRangeAveragePlaceCandidates";
  v5[8] = &unk_1F34526D0;
  v5[9] = &unk_1F3453F68;
  v4[10] = @"sWorkMinDaysNonZeroDwellTimePlaceCandidates";
  v4[11] = @"sWorkMaxDaysNonZeroDwellTimePlaceCandidates";
  v5[10] = &unk_1F34526D0;
  v5[11] = &unk_1F34526B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:12];

  return v2;
}

- (void)_prepareMLFeaturesWithPlaceStats:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(RTLearnedPlaceTypeInferenceGenerator *)self supportsModel])
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v5 = [(RTLearnedPlaceTypeInferenceGenerator *)self placeStatsUUIDStringsToMLFeaturesMap];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v8 = (objc_class *)objc_opt_class();
          id v9 = NSStringFromClass(v8);
          id v10 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          double v98 = v9;
          __int16 v99 = 2112;
          id v100 = v10;
          id v11 = "%@, %@, mlFeatures are already set";
LABEL_10:
          _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, v11, buf, 0x16u);
        }
      }
      else
      {
        uint64_t v75 = [MEMORY[0x1E4F1C9C8] date];
        id v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          double v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          double v17 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          double v98 = v16;
          __int16 v99 = 2112;
          id v100 = v17;
          _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "--------->%@, %@, started, <---------", buf, 0x16u);
        }
        __int16 v85 = self;

        uint64_t v87 = objc_opt_new();
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v18 = v4;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v108 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v94;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v94 != v21) {
                objc_enumerationMutation(v18);
              }
              double v23 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              double v24 = (void *)MEMORY[0x1E016D870]();
              double v25 = [v23 visitIntervals];
              uint64_t v26 = [v25 count];

              if (v26)
              {
                long long v27 = [v23 visitIntervals];
                long long v28 = [v23 place];
                long long v29 = [v28 identifier];
                double v30 = [v29 UUIDString];
                [v87 setObject:v27 forKeyedSubscript:v30];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v93 objects:v108 count:16];
          }
          while (v20);
        }

        uint64_t v31 = v87;
        if ([v87 count])
        {
          id v74 = v4;
          uint64_t v32 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v33 = [v32 dateByAddingTimeInterval:-3628800.0];
          uint64_t v34 = +[RTPlaceDataMetrics calculateMLFeatures:v87 startDate:v33 endDate:v32 createBucketedFeatures:1];
          uint64_t v35 = v85;
          [(RTLearnedPlaceTypeInferenceGenerator *)v85 setPlaceStatsUUIDStringsToMLFeaturesMap:v34];

          uint64_t v36 = [(RTLearnedPlaceTypeInferenceGenerator *)v85 biomeManager];
          __int16 v72 = (void *)v33;
          unint64_t v73 = v32;
          double v76 = +[RTPlaceDataMetrics calculateMLFeaturesUsingBiomeManager:v36 intervalDictionary:v87 startDate:v33 endDate:v32 createBucketedFeatures:1];

          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id obj = v18;
          uint64_t v37 = [obj countByEnumeratingWithState:&v89 objects:v107 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v88 = 0;
            uint64_t v86 = *(void *)v90;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v90 != v86) {
                  objc_enumerationMutation(obj);
                }
                id v40 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                id v41 = (void *)MEMORY[0x1E016D870]();
                id v42 = [(RTLearnedPlaceTypeInferenceGenerator *)v35 placeStatsUUIDStringsToMLFeaturesMap];
                id v43 = [v40 place];
                id v44 = [v43 identifier];
                id v45 = [v44 UUIDString];
                id v46 = [v42 objectForKeyedSubscript:v45];

                if (v46)
                {
                  uint64_t v47 = [(RTLearnedPlaceTypeInferenceGenerator *)v35 placeStatsUUIDStringsToMLFeaturesMap];
                  uint64_t v48 = [v40 place];
                  uint64_t v49 = [v48 identifier];
                  long long v50 = [v49 UUIDString];
                  uint64_t v51 = [v47 objectForKeyedSubscript:v50];
                  [v40 setMlFeatures:v51];

                  uint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v54 = (objc_class *)objc_opt_class();
                    uint64_t v83 = NSStringFromClass(v54);
                    uint64_t v55 = NSStringFromSelector(a2);
                    id v80 = [(RTLearnedPlaceTypeInferenceGenerator *)v85 placeStatsUUIDStringsToMLFeaturesMap];
                    uint64_t v81 = [v40 place];
                    int v79 = [v81 identifier];
                    double v78 = [v79 UUIDString];
                    __int16 v77 = [v80 objectForKeyedSubscript:v78];
                    unint64_t v56 = [v40 place];
                    uint64_t v57 = [v56 identifier];
                    uint64_t v58 = [v57 UUIDString];
                    __int16 v59 = [v76 objectForKeyedSubscript:v58];
                    *(_DWORD *)buf = 138413314;
                    double v98 = v83;
                    __int16 v99 = 2112;
                    id v100 = v55;
                    __int16 v101 = 2112;
                    uint64_t v102 = v40;
                    __int16 v103 = 2112;
                    uint64_t v104 = (uint64_t)v77;
                    __int16 v105 = 2112;
                    double v106 = v59;
                    _os_log_debug_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEBUG, "%@, %@, setting mlFeatures for placeStat, %@, mlFeatures, %@, biomeMLFeatures, %@", buf, 0x34u);
                  }
                  ++v88;
                  uint64_t v35 = v85;
                }
                else
                {
                  uint64_t v53 = objc_opt_new();
                  [v40 setMlFeatures:v53];
                }
              }
              uint64_t v38 = [obj countByEnumeratingWithState:&v89 objects:v107 count:16];
            }
            while (v38);
          }
          else
          {
            uint64_t v88 = 0;
          }

          uint64_t v60 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            __int16 v61 = (objc_class *)objc_opt_class();
            uint64_t v62 = NSStringFromClass(v61);
            uint64_t v63 = NSStringFromSelector(a2);
            uint64_t v64 = [(RTLearnedPlaceTypeInferenceGenerator *)v35 placeStats];
            uint64_t v65 = [v64 count];
            *(_DWORD *)buf = 138413058;
            double v98 = v62;
            __int16 v99 = 2112;
            id v100 = v63;
            __int16 v101 = 2048;
            uint64_t v102 = v88;
            __int16 v103 = 2048;
            uint64_t v104 = v65;
            _os_log_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_INFO, "%@, %@, number of placeStats set with ML Features, %lu, total placeStats count, %lu", buf, 0x2Au);
          }
          uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          id v4 = v74;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            double v67 = (objc_class *)objc_opt_class();
            __int16 v68 = NSStringFromClass(v67);
            double v69 = NSStringFromSelector(a2);
            __int16 v70 = [MEMORY[0x1E4F1C9C8] date];
            [v70 timeIntervalSinceDate:v75];
            *(_DWORD *)buf = 138412802;
            double v98 = v68;
            __int16 v99 = 2112;
            id v100 = v69;
            __int16 v101 = 2048;
            uint64_t v102 = v71;
            _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "--------->%@, %@, finished, latency, %.2f<---------", buf, 0x20u);
          }
          uint64_t v31 = v87;
        }

        uint64_t v7 = v75;
      }
    }
    else
    {
      uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        double v13 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v13);
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        double v98 = v9;
        __int16 v99 = 2112;
        id v100 = v10;
        id v11 = "%@, %@, mlFeature are not set because PlaceTypeClassificationModel feature flag is not enabled";
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v12);
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      double v98 = v9;
      __int16 v99 = 2112;
      id v100 = v10;
      id v11 = "%@, %@, mlFeature are not set because device is not supported";
      goto LABEL_10;
    }
  }
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (NSMutableArray)placeStats
{
  return self->_placeStats;
}

- (void)setPlaceStats:(id)a3
{
}

- (RTLearnedVisit)firstVisit
{
  return self->_firstVisit;
}

- (void)setFirstVisit:(id)a3
{
}

- (RTLearnedVisit)lastVisit
{
  return self->_lastVisit;
}

- (void)setLastVisit:(id)a3
{
}

- (NSDictionary)placeStatsUUIDStringsToMLFeaturesMap
{
  return self->_placeStatsUUIDStringsToMLFeaturesMap;
}

- (void)setPlaceStatsUUIDStringsToMLFeaturesMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeStatsUUIDStringsToMLFeaturesMap, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_firstVisit, 0);
  objc_storeStrong((id *)&self->_placeStats, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end