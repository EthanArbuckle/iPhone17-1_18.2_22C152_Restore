@interface RTMapItemProviderBluePOI
+ (NSArray)preferredAOICategories;
+ (id)harvestTypeToString:(unint64_t)a3;
+ (int)harvestTypeToPoiTriggerType:(unint64_t)a3;
- (BOOL)_fallbackToLocationBasedLookupForVisitDuration:(double)a3;
- (BOOL)_hasMapItemInQueryResult:(id)a3 wifiFingerprintLabelType:(int64_t)a4;
- (BOOL)chooseBestAoiInferredMapItem:(id *)a3 PoiInferredMapItem:(id *)a4 fromSortedAveragedResults:(id)a5 error:(id *)a6;
- (BOOL)harvestVisits:(id)a3 mapItem:(id)a4 harvestType:(unint64_t)a5 error:(id *)a6;
- (BOOL)skipForOptions:(id)a3 error:(id *)a4;
- (BOOL)sortedQueryResult:(id)a3 correspondsToAoi:(id)a4 poi:(id)a5;
- (BOOL)submitHarvest:(id)a3 error:(id *)a4;
- (RTFingerprintManager)fingerprintManager;
- (RTInferredMapItemDeduper)inferredMapItemDeduper;
- (RTLocationManager)locationManager;
- (RTMapItemProviderBluePOI)init;
- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 parameters:(id)a9 placeInferenceQueryStore:(id)a10 platform:(id)a11;
- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 placeInferenceQueryStore:(id)a9 platform:(id)a10;
- (RTMapItemProviderBluePOIParameters)parameters;
- (RTMapServiceManager)mapServiceManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTPlatform)platform;
- (id)_adjustConfidencesOfTheSelectedResult:(id)a3 allQueryResults:(id)a4;
- (id)_bestAOIFromAOIs:(id)a3;
- (id)_computeEarlyStopQueryResultFromResults:(id)a3 originalMaxNumberOfQueries:(unint64_t)a4 aoiConfidencePassThroughThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6;
- (id)_confidenceCoefficientsForAOI:(id)a3 AOIOccurenceCount:(unint64_t)a4 POIResults:(id)a5;
- (id)_determineFingerprintFallbackDateIntervalFromStartDate:(id)a3 endDate:(id)a4;
- (id)_filterByConfidence:(id)a3 aoiConfidencePassThroughThreshold:(double)a4 aoiConfidenceConsiderThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6 poiConfidenceConsiderThreshold:(double)a7 error:(id *)a8;
- (id)_filterLessRelevantAOIsFromQueryResult:(id)a3;
- (id)_filterOutEmptyFingerprintsFromFingerprints:(id)a3 endDate:(id)a4;
- (id)_mapItemsWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 referenceLocation:(id)a6 options:(id)a7 error:(id *)a8;
- (id)_mapItemsWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 maxQueryAttemps:(unint64_t)a7 error:(id *)a8;
- (id)accessPointsForFingerprint:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)bestQueryFromAggregatedQueries:(id)a3 error:(id *)a4;
- (id)bestQueryFromSortedQueryResults:(id)a3 bestAoiInferredMapItem:(id)a4 bestPoiInferredMapItem:(id)a5 error:(id *)a6;
- (id)bestQueryFromSortedQueryResults:(id)a3 bestInferredMapItem:(id)a4 error:(id *)a5;
- (id)collapseDedupedInferredMapItems:(id)a3 inferredMapItemDeduperState:(id)a4 error:(id *)a5;
- (id)dedupeQueryResults:(id)a3 error:(id *)a4;
- (id)filterByDistance:(id)a3 location:(id)a4 thresholdForUnknownLabel:(double)a5 error:(id *)a6;
- (id)fingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 isTimeWindowFallback:(BOOL *)a5 settledState:(unint64_t)a6 error:(id *)a7;
- (id)inferredMapItemsFromPlist:(id)a3 error:(id *)a4;
- (id)locationsForAccessPoints:(id)a3 error:(id *)a4;
- (id)locationsInDateInterval:(id)a3 error:(id *)a4;
- (id)mapItemFromPlistDictionary:(id)a3;
- (id)mapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 error:(id *)a8;
- (id)mapItemsWithOptions:(id)a3 error:(id *)a4;
- (id)motionActivitesFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (id)poiHarvestForFingerprint:(id)a3 mapItem:(id)a4 referenceLocation:(id)a5 endDate:(id)a6 error:(id *)a7;
- (id)sortQueryResults:(id)a3 error:(id *)a4;
- (id)sortedAveragedQueryResults:(id)a3 baseDuration:(double)a4 error:(id *)a5;
- (unint64_t)numberOfRealtimeQueriesForInterval:(id)a3;
- (void)_submitPerformanceMetricsForResults:(id)a3 noFingerprints:(BOOL)a4 originalMaxNumberOfQueries:(unint64_t)a5 aoiConfidencePassThroughThreshold:(double)a6 poiConfidencePassThroughThreshold:(double)a7 fingerprintsCount:(unint64_t)a8 zeroAccessPointsFingerprintsCount:(unint64_t)a9 nonZeroAccessPointsFingerprintsCount:(unint64_t)a10 queryCount:(unint64_t)a11 firstResultQueryCount:(unint64_t)a12 error:(id)a13 visitInterval:(double)a14 visitSource:(int64_t)a15;
- (void)setFingerprintManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPlaceInferenceQueryStore:(id)a3;
@end

@implementation RTMapItemProviderBluePOI

+ (NSArray)preferredAOICategories
{
  if (qword_1EBE388B8 != -1) {
    dispatch_once(&qword_1EBE388B8, &__block_literal_global_25);
  }
  v2 = (void *)_MergedGlobals_3;

  return (NSArray *)v2;
}

void __50__RTMapItemProviderBluePOI_preferredAOICategories__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if (!_MergedGlobals_3)
  {
    v2[0] = *MEMORY[0x1E4F63F38];
    uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
    v1 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = v0;
  }
}

- (RTMapItemProviderBluePOI)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_fingerprintManager_locationManager_mapServiceManager_motionActivityManager_placeInferenceQueryStore_platform_);
}

- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 placeInferenceQueryStore:(id)a9 platform:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [[RTMapItemProviderBluePOIParameters alloc] initWithDefaultsManager:v24];
  v26 = [(RTMapItemProviderBluePOI *)self initWithDefaultsManager:v24 distanceCalculator:v23 fingerprintManager:v22 locationManager:v21 mapServiceManager:v20 motionActivityManager:v19 parameters:v25 placeInferenceQueryStore:v18 platform:v17];

  return v26;
}

- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 parameters:(id)a9 placeInferenceQueryStore:(id)a10 platform:(id)a11
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v29 = a4;
  id v18 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v19 = a11;
  v28 = v19;
  if (!v17)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_33:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_34;
  }
  if (!v18)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_33;
  }
  if (!v34)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_33;
  }
  if (!v33)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_33;
  }
  if (!v32)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_33;
  }
  if (!v31)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: parameters";
    goto LABEL_33;
  }
  if (!v30)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_33;
  }
  if (!v19)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_33;
  }
  v35.receiver = self;
  v35.super_class = (Class)RTMapItemProviderBluePOI;
  self = [(RTMapItemProviderBase *)&v35 initWithDefaultsManager:v17 distanceCalculator:v29];
  if (self)
  {
    id v20 = [[RTInferredMapItemDeduper alloc] initWithDeduperFunction:&__block_literal_global_11];
    inferredMapItemDeduper = self->_inferredMapItemDeduper;
    self->_inferredMapItemDeduper = v20;

    if (self->_inferredMapItemDeduper)
    {
      objc_storeStrong((id *)&self->_fingerprintManager, a5);
      objc_storeStrong((id *)&self->_locationManager, a6);
      objc_storeStrong((id *)&self->_mapServiceManager, a7);
      objc_storeStrong((id *)&self->_motionActivityManager, a8);
      objc_storeStrong((id *)&self->_placeInferenceQueryStore, a10);
      objc_storeStrong((id *)&self->_platform, a11);
      objc_storeStrong((id *)&self->_parameters, a9);
      id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        parameters = self->_parameters;
        *(_DWORD *)buf = 138412290;
        v37 = parameters;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderBluePOI with parameters: %@", buf, 0xCu);
      }

      goto LABEL_14;
    }
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: _inferredMapItemDeduper";
      goto LABEL_33;
    }
LABEL_34:

    id v24 = 0;
    goto LABEL_35;
  }
LABEL_14:
  self = self;
  id v24 = self;
LABEL_35:

  return v24;
}

uint64_t __191__RTMapItemProviderBluePOI_initWithDefaultsManager_distanceCalculator_fingerprintManager_locationManager_mapServiceManager_motionActivityManager_parameters_placeInferenceQueryStore_platform___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v5 mapItem];
  v7 = [v4 mapItem];
  unsigned int v8 = [v6 isEqualToMapItem:v7];

  v9 = [v5 mapItem];

  v10 = [v9 extendedAttributes];
  uint64_t v11 = [v10 wifiFingerprintLabelType];
  v12 = [v4 mapItem];

  v13 = [v12 extendedAttributes];
  uint64_t v14 = [v13 wifiFingerprintLabelType];

  if (v11 == v14) {
    return v8;
  }
  else {
    return 0;
  }
}

- (id)fingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 isTimeWindowFallback:(BOOL *)a5 settledState:(unint64_t)a6 error:(id *)a7
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (!v10)
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v101 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v101, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      id v60 = 0;
      *a7 = v33;
      goto LABEL_44;
    }
LABEL_30:
    id v60 = 0;
    goto LABEL_44;
  }
  if (!v11)
  {
    v59 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v101 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v101, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate(@"endDate");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  aSelector = a2;
  uint64_t v95 = 0;
  v96 = (id *)&v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__31;
  v99 = __Block_byref_object_dispose__31;
  id v100 = 0;
  uint64_t v89 = 0;
  v90 = (id *)&v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__31;
  v93 = __Block_byref_object_dispose__31;
  id v94 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = [(RTMapItemProviderBluePOI *)self fingerprintManager];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke;
  v85[3] = &unk_1E6B905F0;
  v87 = &v95;
  v88 = &v89;
  v15 = v13;
  v86 = v15;
  [v14 fetchFingerprintsBetweenStartDate:v10 endDate:v12 filteredBySettledState:a6 handler:v85];

  dsema = v15;
  v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v17)) {
    goto LABEL_12;
  }
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;
  id v21 = objc_opt_new();
  id v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
  id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v24 = [v23 filteredArrayUsingPredicate:v22];
  v25 = [v24 firstObject];

  [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v101 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v101, 2u);
  }

  v27 = (void *)MEMORY[0x1E4F28C58];
  *(void *)buf = *MEMORY[0x1E4F28568];
  *(void *)v101 = @"semaphore wait timeout";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:buf count:1];
  id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (v29)
  {
    id v30 = v29;

    char v31 = 0;
  }
  else
  {
LABEL_12:
    id v30 = 0;
    char v31 = 1;
  }

  id v34 = v30;
  if ((v31 & 1) == 0) {
    objc_storeStrong(v90 + 5, v30);
  }
  if (a6 == 2 && !v90[5] && ![v96[5] count])
  {
    *a5 = 1;
    *(void *)v101 = 0;
    *(void *)&v101[8] = v101;
    *(void *)&v101[16] = 0x3032000000;
    v102 = __Block_byref_object_copy__31;
    *(void *)v103 = __Block_byref_object_dispose__31;
    *(void *)&v103[8] = 0;
    v75 = [(RTMapItemProviderBluePOI *)self _determineFingerprintFallbackDateIntervalFromStartDate:v10 endDate:v12];
    objc_super v35 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v71 = [v10 stringFromDate];
      id v73 = [v12 stringFromDate];
      v36 = [v75 startDate];
      id v37 = [v36 stringFromDate];
      uint64_t v38 = [v75 endDate];
      v39 = [v38 stringFromDate];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v71;
      __int16 v109 = 2112;
      id v110 = v73;
      __int16 v111 = 2112;
      id v112 = v37;
      __int16 v113 = 2112;
      v114 = v39;
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "Zero fingerprints found between startDate %@, endDate, %@, fallback query between fallbackStartDate %@ and fallbackEndDate %@", buf, 0x2Au);
    }
    v40 = [(RTMapItemProviderBluePOI *)self fingerprintManager];
    v41 = [v75 startDate];
    v42 = [v75 endDate];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke_19;
    v81[3] = &unk_1E6B905F0;
    v83 = v101;
    v84 = &v89;
    v43 = dsema;
    v82 = v43;
    [v40 fetchFingerprintsBetweenStartDate:v41 endDate:v42 filteredBySettledState:2 handler:v81];

    v44 = v43;
    v74 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v45 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v44, v45)) {
      goto LABEL_31;
    }
    v72 = [MEMORY[0x1E4F1C9C8] now];
    [v72 timeIntervalSinceDate:v74];
    double v47 = v46;
    v48 = objc_opt_new();
    v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
    v50 = [MEMORY[0x1E4F29060] callStackSymbols];
    v51 = [v50 filteredArrayUsingPredicate:v49];
    v52 = [v51 firstObject];

    [v48 submitToCoreAnalytics:v52 type:1 duration:v47];
    v53 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v54 = (void *)MEMORY[0x1E4F28C58];
    v115[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v115 count:1];
    v56 = [v54 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v55];

    if (v56)
    {
      id v57 = v56;

      char v58 = 0;
    }
    else
    {
LABEL_31:
      char v58 = 1;
      id v57 = v34;
    }

    id v61 = v57;
    if ((v58 & 1) == 0) {
      objc_storeStrong(v90 + 5, v57);
    }
    if (!v90[5]) {
      objc_storeStrong(v96 + 5, *(id *)(*(void *)&v101[8] + 40));
    }

    _Block_object_dispose(v101, 8);
    id v34 = v61;
  }
  v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(aSelector);
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = [v96[5] count];
    v65 = [v10 stringFromDate];
    uint64_t v66 = [v12 stringFromDate];
    v67 = (void *)v66;
    v68 = @"YES";
    id v69 = v90[5];
    if (!*a5) {
      v68 = @"NO";
    }
    *(_DWORD *)v101 = 138413826;
    *(void *)&v101[4] = v63;
    *(_WORD *)&v101[12] = 2048;
    *(void *)&v101[14] = v64;
    *(_WORD *)&v101[22] = 2112;
    v102 = v65;
    *(_WORD *)v103 = 2112;
    *(void *)&v103[2] = v66;
    *(_WORD *)&v103[10] = 2048;
    *(void *)&v103[12] = a6;
    __int16 v104 = 2112;
    v105 = v68;
    __int16 v106 = 2112;
    id v107 = v69;
    _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "%@, fingerprints count, %lu, startDate %@, endData, %@, settledState, %lu, isTimeWindowFallback, %@, error, %@", v101, 0x48u);
  }
  if (a7) {
    *a7 = v90[5];
  }
  id v60 = v96[5];

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

LABEL_44:

  return v60;
}

void __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_determineFingerprintFallbackDateIntervalFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  uint64_t v7 = [v5 dateWithTimeInterval:a3 sinceDate:-300.0];
  unsigned int v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v6 sinceDate:300.0];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];

  return v9;
}

- (id)accessPointsForFingerprint:(id)a3 endDate:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"fingerprint");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      id v34 = 0;
      *a5 = v31;
      goto LABEL_24;
    }
LABEL_23:
    id v34 = 0;
    goto LABEL_24;
  }
  if (!v9)
  {
    objc_super v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"endDate");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  *(void *)buf = 0;
  v49 = buf;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__31;
  v52 = __Block_byref_object_dispose__31;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  dispatch_time_t v45 = __Block_byref_object_copy__31;
  double v46 = __Block_byref_object_dispose__31;
  id v47 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [(RTMapItemProviderBluePOI *)self fingerprintManager];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __69__RTMapItemProviderBluePOI_accessPointsForFingerprint_endDate_error___block_invoke;
  v38[3] = &unk_1E6B905F0;
  v40 = buf;
  v41 = &v42;
  dispatch_semaphore_t v13 = v11;
  v39 = v13;
  [v12 fetchWifiAccessPointsForFingerprint:v8 handler:v38];

  uint64_t v14 = v13;
  v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_12;
  }
  id v37 = [MEMORY[0x1E4F1C9C8] now];
  [v37 timeIntervalSinceDate:v15];
  double v18 = v17;
  double v19 = objc_opt_new();
  double v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
  id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v22 = [v21 filteredArrayUsingPredicate:v20];
  id v23 = [v22 firstObject];

  [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
  id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v55 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v55, 2u);
  }

  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  *(void *)v55 = @"semaphore wait timeout";
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

  if (v27)
  {
    id v28 = v27;

    char v29 = 0;
  }
  else
  {
LABEL_12:
    id v28 = 0;
    char v29 = 1;
  }

  id v32 = v28;
  if ((v29 & 1) == 0) {
    objc_storeStrong(v43 + 5, v28);
  }
  if (a5) {
    *a5 = v43[5];
  }
  id v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"date", v10];
  id v34 = [*((id *)v49 + 5) filteredArrayUsingPredicate:v33];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(buf, 8);

LABEL_24:

  return v34;
}

void __69__RTMapItemProviderBluePOI_accessPointsForFingerprint_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)locationsForAccessPoints:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  id v8 = [v7 date];

  uint64_t v9 = [v6 lastObject];

  id v10 = [v9 date];

  id v11 = 0;
  if (v8 && v10)
  {
    [v10 timeIntervalSinceDate:v8];
    double v13 = v12 / 60.0;
    [(RTMapItemProviderBluePOIParameters *)self->_parameters locationLookupWindowMinMinutes];
    parameters = self->_parameters;
    if (v13 >= v15)
    {
      [(RTMapItemProviderBluePOIParameters *)parameters locationLookupWindowMaxMinutes];
      if (v13 <= v17)
      {
LABEL_8:
        double v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v10];
        id v11 = [(RTMapItemProviderBluePOI *)self locationsInDateInterval:v19 error:a4];

        goto LABEL_9;
      }
      [(RTMapItemProviderBluePOIParameters *)self->_parameters locationLookupWindowMaxMinutes];
    }
    else
    {
      [(RTMapItemProviderBluePOIParameters *)parameters locationLookupWindowMinMinutes];
    }
    uint64_t v18 = [v8 dateByAddingTimeInterval:v16 * 60.0];

    id v10 = (void *)v18;
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (id)locationsInDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    *(void *)id v47 = 0;
    v48 = v47;
    uint64_t v49 = 0x3032000000;
    uint64_t v50 = __Block_byref_object_copy__31;
    v51 = __Block_byref_object_dispose__31;
    id v52 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__31;
    dispatch_time_t v45 = __Block_byref_object_dispose__31;
    id v46 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = objc_alloc(MEMORY[0x1E4F5CF40]);
    [(RTMapItemProviderBluePOIParameters *)self->_parameters locationUncertaintyThreshold];
    v36 = [v8 initWithDateInterval:v6 horizontalAccuracy:-[RTMapItemProviderBluePOIParameters maxLocationsPerFingerprint](self->_parameters, "maxLocationsPerFingerprint")- 1 batchSize:0 boundingBoxLocation:v9];
    id v10 = [(RTMapItemProviderBluePOI *)self locationManager];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke;
    v37[3] = &unk_1E6B905F0;
    v39 = v47;
    v40 = &v41;
    id v11 = v7;
    uint64_t v38 = v11;
    [v10 fetchStoredLocationsWithOptions:v36 handler:v37];

    double v12 = v11;
    double v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_7;
    }
    double v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    uint64_t v18 = objc_opt_new();
    double v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
    double v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v21 = [v20 filteredArrayUsingPredicate:v19];
    id v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v53 count:1];
    v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;

      char v28 = 0;
    }
    else
    {
LABEL_7:
      id v27 = 0;
      char v28 = 1;
    }

    id v29 = v27;
    if ((v28 & 1) == 0) {
      objc_storeStrong((id *)v48 + 5, v27);
    }
    id v30 = (void *)*((void *)v48 + 5);
    if (v30)
    {
      id v31 = 0;
      if (a4) {
        *a4 = v30;
      }
    }
    else
    {
      id v33 = [_RTMap alloc];
      id v34 = [(_RTMap *)v33 initWithInput:v42[5]];
      id v31 = [(_RTMap *)v34 withBlock:&__block_literal_global_45];
    }
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(v47, 8);
  }
  else
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v47 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v47, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      id v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v31 = 0;
    }
  }

  return v31;
}

void __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithCLLocation:v3];

  return v4;
}

- (id)motionActivitesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    uint64_t v45 = 0;
    id v46 = (id *)&v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__31;
    uint64_t v49 = __Block_byref_object_dispose__31;
    id v50 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    uint64_t v42 = __Block_byref_object_copy__31;
    uint64_t v43 = __Block_byref_object_dispose__31;
    id v44 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    double v12 = [(RTMapItemProviderBluePOI *)self motionActivityManager];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __57__RTMapItemProviderBluePOI_motionActivitesFrom_to_error___block_invoke;
    v35[3] = &unk_1E6B905F0;
    id v37 = &v39;
    uint64_t v38 = &v45;
    double v13 = v11;
    v36 = v13;
    [v12 fetchMotionActivitiesFromStartDate:v7 endDate:v9 handler:v35];

    dispatch_time_t v14 = v13;
    double v15 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16)) {
      goto LABEL_8;
    }
    double v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v15];
    double v19 = v18;
    double v20 = objc_opt_new();
    id v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
    id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v51 count:1];
    char v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;

      char v30 = 0;
    }
    else
    {
LABEL_8:
      id v29 = 0;
      char v30 = 1;
    }

    id v31 = v29;
    if ((v30 & 1) == 0) {
      objc_storeStrong(v46 + 5, v29);
    }
    id v32 = v46[5];
    if (v32)
    {
      id v10 = 0;
      if (a5) {
        *a5 = v32;
      }
    }
    else
    {
      id v10 = (id)v40[5];
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }

  return v10;
}

void __57__RTMapItemProviderBluePOI_motionActivitesFrom_to_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)dedupeQueryResults:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = [[_RTMap alloc] initWithInput:v7];
    uint64_t v9 = [(_RTMap *)v8 withBlock:&__block_literal_global_52];

    id v10 = objc_alloc_init(RTInferredMapItemDeduperState);
    inferredMapItemDeduper = self->_inferredMapItemDeduper;
    id v39 = 0;
    id v12 = [(RTInferredMapItemDeduper *)inferredMapItemDeduper dedupeDoubleArrayOfInferredMapItems:v9 state:v10 error:&v39];
    id v13 = v39;
    if (v13)
    {
      dispatch_time_t v14 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v30;
        __int16 v44 = 2112;
        id v45 = v13;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      double v15 = 0;
      if (a4) {
        *a4 = v13;
      }
      goto LABEL_30;
    }
    id v38 = 0;
    double v17 = [(RTMapItemProviderBluePOI *)self collapseDedupedInferredMapItems:v12 inferredMapItemDeduperState:v10 error:&v38];
    id v18 = v38;
    if (v18)
    {
      double v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v31;
        __int16 v44 = 2112;
        id v45 = v18;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (a4)
      {
        double v15 = 0;
        *a4 = v18;
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v20 = [v17 count];
      if (v20 == [v7 count])
      {
        double v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v7 count]];
        if ([v17 count])
        {
          id v33 = v12;
          id v35 = v9;
          unint64_t v21 = 0;
          do
          {
            id v22 = objc_alloc(MEMORY[0x1E4F5CE58]);
            id v23 = [v17 objectAtIndexedSubscript:v21];
            id v24 = [v7 objectAtIndexedSubscript:v21];
            v25 = [v24 secondObject];
            v26 = (void *)[v22 initWithFirstObject:v23 secondObject:v25];

            [v15 addObject:v26];
            ++v21;
          }
          while (v21 < [v17 count]);
          uint64_t v9 = v35;
          id v18 = 0;
          id v12 = v33;
        }
        goto LABEL_29;
      }
      id v36 = (id)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F5CFE8];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      uint64_t v41 = @"collapsedDedupedInferredMapItems.count != queryResults.count";
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v37 = [v36 errorWithDomain:v34 code:0 userInfo:v27];

      char v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v32;
        __int16 v44 = 2112;
        id v45 = v37;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (a4) {
        *a4 = v37;
      }
    }
    double v15 = 0;
    goto LABEL_29;
  }
  dispatch_time_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queryResults", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"queryResults");
    double v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v15 = 0;
  }
LABEL_31:

  return v15;
}

uint64_t __53__RTMapItemProviderBluePOI_dedupeQueryResults_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 firstObject];
}

- (id)collapseDedupedInferredMapItems:(id)a3 inferredMapItemDeduperState:(id)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    uint64_t v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: allDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      id v50 = @"allDedupedInferredMapItems";
LABEL_38:
      _RTErrorInvalidParameterCreate((uint64_t)v50);
      id v48 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
LABEL_39:
    id v48 = 0;
    goto LABEL_50;
  }
  if (!v9)
  {
    uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (a5)
    {
      id v50 = @"inferredMapItemDeduperState";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  aSelector = a2;
  unint64_t v11 = 0x1E4F1C000uLL;
  id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v13 = v8;
  uint64_t v65 = [v13 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v65)
  {
    uint64_t v14 = *(void *)v81;
    unint64_t v15 = 0x1E4F1C000uLL;
    id v69 = v10;
    uint64_t v64 = a5;
    v67 = v13;
    v68 = v12;
    uint64_t v62 = *(void *)v81;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v81 != v14) {
          objc_enumerationMutation(v13);
        }
        uint64_t v66 = v16;
        double v17 = *(void **)(*((void *)&v80 + 1) + 8 * v16);
        v70 = [*(id *)(v11 + 2632) arrayWithCapacity:[v17 count]];
        id v18 = [*(id *)(v15 + 2656) dictionaryWithCapacity:[v17 count]];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v91 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v77 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              v25 = [v24 mapItem];
              v26 = [v25 identifier];

              id v27 = [v18 objectForKeyedSubscript:v26];

              char v28 = NSNumber;
              if (v27)
              {
                id v29 = [v18 objectForKeyedSubscript:v26];
                [v29 doubleValue];
                double v31 = v30;
                [v24 confidence];
                id v33 = [v28 numberWithDouble:v31 + v32];
                [v18 setObject:v33 forKeyedSubscript:v26];
              }
              else
              {
                [v24 confidence];
                id v29 = [v28 numberWithDouble:];
                [v18 setObject:v29 forKeyedSubscript:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v76 objects:v91 count:16];
          }
          while (v21);
        }

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v34 = v18;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v72 objects:v90 count:16];
        id v10 = v69;
        if (!v35) {
          goto LABEL_27;
        }
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v73;
        while (2)
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v73 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v72 + 1) + 8 * j);
            uint64_t v40 = [v34 objectForKeyedSubscript:v39];
            [v40 doubleValue];
            double v42 = v41;

            if (v42 > 1.0)
            {
              id v52 = [NSString stringWithFormat:@"confidence for uuid %@ was greater than 1", v39];
              uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v54 = *MEMORY[0x1E4F5CFE8];
              uint64_t v88 = *MEMORY[0x1E4F28568];
              uint64_t v89 = v52;
              uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
              uint64_t v56 = [v53 errorWithDomain:v54 code:0 userInfo:v55];

              id v57 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                id v60 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412546;
                v85 = v60;
                __int16 v86 = 2112;
                v87 = v56;
                _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
              }
              uint64_t v43 = v56;
              goto LABEL_46;
            }
            id v71 = 0;
            uint64_t v43 = [v69 mapItemForDedupedUUID:v39 error:&v71];
            id v44 = v71;
            if (v44)
            {
              uint64_t v56 = v44;
              char v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                id v61 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412546;
                v85 = v61;
                __int16 v86 = 2112;
                v87 = v56;
                _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
              }
              id v52 = v56;
LABEL_46:
              id v12 = v68;
              if (v64) {
                *uint64_t v64 = v56;
              }

              id v48 = 0;
              id v10 = v69;
              goto LABEL_49;
            }
            id v45 = objc_alloc(MEMORY[0x1E4F5CDF8]);
            uint64_t v46 = [v34 objectForKeyedSubscript:v39];
            [v46 doubleValue];
            uint64_t v47 = [v45 initWithMapItem:v43 confidence:0x4000 source:];

            [v70 addObject:v47];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v72 objects:v90 count:16];
          if (v36) {
            continue;
          }
          break;
        }
LABEL_27:

        id v12 = v68;
        [v68 addObject:v70];

        uint64_t v16 = v66 + 1;
        id v13 = v67;
        unint64_t v11 = 0x1E4F1C000;
        uint64_t v14 = v62;
        unint64_t v15 = 0x1E4F1C000;
      }
      while (v66 + 1 != v65);
      uint64_t v65 = [v67 countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v65);
  }

  id v48 = v12;
LABEL_49:

LABEL_50:

  return v48;
}

- (id)sortedAveragedQueryResults:(id)a3 baseDuration:(double)a4 error:(id *)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 count])
  {
    unint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: correctedQueryResults.count != 0", buf, 2u);
    }

    if (a5)
    {
      id v10 = @"correctedQueryResults.count != 0";
      goto LABEL_11;
    }
    goto LABEL_30;
  }
  if (a4 < 0.0)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: baseDuration >= 0", buf, 2u);
    }

    if (a5)
    {
      id v10 = @"baseDuration >= 0";
LABEL_11:
      _RTErrorInvalidParameterCreate((uint64_t)v10);
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
LABEL_30:
    id v12 = 0;
    goto LABEL_48;
  }
  aSelector = a2;
  v67 = a5;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v73 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v68 = v8;
  obuint64_t j = v8;
  uint64_t v71 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
  if (v71)
  {
    uint64_t v70 = *(void *)v84;
    double v14 = 0.0;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v84 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = v15;
        uint64_t v16 = *(void **)(*((void *)&v83 + 1) + 8 * v15);
        double v17 = [v16 secondObject];
        [v17 duration];
        double v19 = v18;

        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v74 = [v16 firstObject];
        uint64_t v20 = [v74 countByEnumeratingWithState:&v79 objects:v95 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v80 != v22) {
                objc_enumerationMutation(v74);
              }
              id v24 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v25 = NSNumber;
              v26 = [v24 mapItem];
              id v27 = [v25 numberWithUnsignedInteger:[v26 muid]];

              char v28 = [v13 objectForKeyedSubscript:v27];

              if (v28)
              {
                id v29 = [v13 objectForKeyedSubscript:v27];
                id v30 = objc_alloc(MEMORY[0x1E4F28C28]);
                [v24 confidence];
                double v32 = v31;
                id v33 = [v16 secondObject];
                [v33 duration];
                uint64_t v35 = (void *)[v30 initWithDouble:v32 * (v34 + a4)];
                uint64_t v36 = [v29 decimalNumberByAdding:v35];
                [v13 setObject:v36 forKeyedSubscript:v27];
              }
              else
              {
                id v37 = objc_alloc(MEMORY[0x1E4F28C28]);
                [v24 confidence];
                double v39 = v38;
                uint64_t v40 = [v16 secondObject];
                [v40 duration];
                double v42 = (void *)[v37 initWithDouble:v39 * (v41 + a4)];
                [v13 setObject:v42 forKeyedSubscript:v27];

                id v29 = [v24 mapItem];
                [v73 setObject:v29 forKeyedSubscript:v27];
              }
            }
            uint64_t v21 = [v74 countByEnumeratingWithState:&v79 objects:v95 count:16];
          }
          while (v21);
        }
        double v14 = v14 + v19;

        uint64_t v15 = v72 + 1;
      }
      while (v72 + 1 != v71);
      uint64_t v71 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
    }
    while (v71);
  }
  else
  {
    double v14 = 0.0;
  }

  uint64_t v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v13 count]];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v44 = v13;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v94 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v76;
    while (2)
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v75 + 1) + 8 * j);
        id v50 = [v44 objectForKeyedSubscript:v49];
        uint64_t v51 = [objc_alloc(MEMORY[0x1E4F28C28]) initWithDouble:v14 + a4 * (double)(unint64_t)[obj count]];
        id v52 = [v50 decimalNumberByDividingBy:v51];
        [v52 doubleValue];
        double v54 = v53;

        id v55 = objc_alloc(MEMORY[0x1E4F5CDF8]);
        uint64_t v56 = [v73 objectForKeyedSubscript:v49];
        id v57 = (void *)[v55 initWithMapItem:v56 confidence:0x4000 source:v54];

        if (!v57)
        {
          id v60 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v61 = *MEMORY[0x1E4F5CFE8];
          uint64_t v92 = *MEMORY[0x1E4F28568];
          uint64_t v93 = @"inferredMapItem was nil";
          uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          id v59 = [v60 errorWithDomain:v61 code:0 userInfo:v62];

          id v63 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            uint64_t v65 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            uint64_t v89 = v65;
            __int16 v90 = 2112;
            id v91 = v59;
            _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
          }
          id v8 = v68;
          if (v67)
          {
            id v59 = v59;
            id v12 = 0;
            id *v67 = v59;
          }
          else
          {
            id v12 = 0;
          }
          char v58 = v44;
          goto LABEL_47;
        }
        [v43 addObject:v57];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v75 objects:v94 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }

  char v58 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v87 = v58;
  id v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  id v12 = [v43 sortedArrayUsingDescriptors:v59];
  id v8 = v68;
LABEL_47:

LABEL_48:

  return v12;
}

- (BOOL)chooseBestAoiInferredMapItem:(id *)a3 PoiInferredMapItem:(id *)a4 fromSortedAveragedResults:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = v9;
  if (!a3)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiInferredMapItem", buf, 2u);
    }

    if (!a6) {
      goto LABEL_30;
    }
    uint64_t v21 = @"outAoiInferredMapItem";
    goto LABEL_29;
  }
  if (!a4)
  {
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPoiInferredMapItem", buf, 2u);
    }

    if (!a6) {
      goto LABEL_30;
    }
    uint64_t v21 = @"outPoiInferredMapItem";
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    BOOL v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v9)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedAveragedResults", buf, 2u);
    }

    if (a6)
    {
      uint64_t v21 = @"sortedAveragedResults";
      goto LABEL_29;
    }
LABEL_30:
    BOOL v23 = 0;
    goto LABEL_31;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v26 = v9;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v17 = [v16 mapItem];
        double v18 = [v17 extendedAttributes];
        uint64_t v19 = [v18 wifiFingerprintLabelType];

        if (v19 != 2)
        {
          *a4 = v16;
          goto LABEL_24;
        }
        if (!*a3) {
          *a3 = v16;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  BOOL v23 = 1;
  id v10 = v26;
LABEL_31:

  return v23;
}

- (id)sortQueryResults:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    aSelector = a2;
    uint64_t v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v6 count]];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v31 = v7;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v33 = *MEMORY[0x1E4F5CFE8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
          uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mapItem" ascending:0 comparator:&__block_literal_global_102];
          uint64_t v15 = [v12 firstObject];
          v46[0] = v13;
          v46[1] = v14;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          double v17 = [v15 sortedArrayUsingDescriptors:v16];

          id v18 = objc_alloc(MEMORY[0x1E4F5CE58]);
          uint64_t v19 = [v12 secondObject];
          uint64_t v20 = (void *)[v18 initWithFirstObject:v17 secondObject:v19];

          if (v20)
          {
            [v35 addObject:v20];
          }
          else
          {
            uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v44 = v32;
            uint64_t v45 = @"sortedQueryResult was nil";
            uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            BOOL v23 = [v21 errorWithDomain:v33 code:0 userInfo:v22];

            id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              long long v29 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412546;
              double v41 = v29;
              __int16 v42 = 2112;
              uint64_t v43 = v23;
              _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
            }
            if (a4) {
              *a4 = v23;
            }
          }
          if (!v20)
          {

            id v26 = 0;
            v25 = v35;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v25 = v35;
    id v26 = v35;
LABEL_19:

    id v7 = v31;
  }
  else
  {
    long long v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queryResults", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"queryResults");
      id v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = 0;
    }
  }

  return v26;
}

uint64_t __51__RTMapItemProviderBluePOI_sortQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 extendedAttributes];
  uint64_t v6 = [v5 wifiFingerprintLabelType];

  id v7 = [v4 extendedAttributes];

  uint64_t v8 = [v7 wifiFingerprintLabelType];
  uint64_t v9 = 1;
  uint64_t v10 = -1;
  if (v6 == 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v8 != 2) {
    uint64_t v10 = v11;
  }
  if (v6 != 2) {
    uint64_t v9 = v10;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (id)bestQueryFromSortedQueryResults:(id)a3 bestInferredMapItem:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    long long v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults", buf, 2u);
    }

    if (!a5) {
      goto LABEL_39;
    }
    long long v29 = @"sortedQueryResults";
    goto LABEL_38;
  }
  if (![v9 count])
  {
    long long v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults.count > 0", buf, 2u);
    }

    if (!a5) {
      goto LABEL_39;
    }
    long long v29 = @"sortedQueryResults.count > 0";
LABEL_38:
    _RTErrorInvalidParameterCreate((uint64_t)v29);
    long long v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (!v10)
  {
    double v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestInferredMapItem", buf, 2u);
    }

    if (a5)
    {
      long long v29 = @"bestInferredMapItem";
      goto LABEL_38;
    }
LABEL_39:
    long long v27 = 0;
    goto LABEL_47;
  }
  SEL aSelector = a2;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v11 = v9;
  uint64_t v43 = [v11 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (!v43)
  {

LABEL_41:
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    id v57 = @"bestQuery is nil";
    double v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57, &v56, 1, aSelector];
    id v12 = [v32 errorWithDomain:v33 code:0 userInfo:v34];

    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v37 = NSStringFromSelector(aSelectora);
      *(_DWORD *)buf = 138412546;
      double v53 = v37;
      __int16 v54 = 2112;
      id v55 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a5)
    {
      id v12 = v12;
      long long v27 = 0;
      *a5 = v12;
    }
    else
    {
      long long v27 = 0;
    }
    goto LABEL_46;
  }
  id v40 = v9;
  id v12 = 0;
  obuint64_t j = v11;
  uint64_t v42 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v49 != v42) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v15 = [v14 firstObject:aSelector];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v58 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v45;
        while (2)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v45 != v18) {
              objc_enumerationMutation(v15);
            }
            if ([(RTInferredMapItemDeduper *)self->_inferredMapItemDeduper inferredMapItem:*(void *)(*((void *)&v44 + 1) + 8 * j) dedupesToInferredMapItem:v10 error:0])
            {
              if (v12)
              {
                uint64_t v20 = [v14 secondObject];
                [v20 duration];
                double v22 = v21;
                BOOL v23 = [v12 secondObject];
                [v23 duration];
                double v25 = v24;

                if (v22 > v25)
                {
                  id v26 = v14;

                  id v12 = v26;
                }
              }
              else
              {
                id v12 = v14;
              }
              goto LABEL_22;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
    uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  }
  while (v43);

  id v9 = v40;
  if (!v12) {
    goto LABEL_41;
  }
  long long v27 = [v12 firstObject];
LABEL_46:

LABEL_47:

  return v27;
}

- (BOOL)sortedQueryResult:(id)a3 correspondsToAoi:(id)a4 poi:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    id v26 = "Invalid parameter not satisfying: sortedQueryResult";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_22;
  }
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    id v26 = "Invalid parameter not satisfying: bestAoiInferredMapItem";
    goto LABEL_21;
  }
  if (!v10)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v26 = "Invalid parameter not satisfying: bestPoiInferredMapItem";
      goto LABEL_21;
    }
LABEL_22:
    BOOL v24 = 0;
    goto LABEL_23;
  }
  id v12 = [v8 firstObject];
  uint64_t v13 = [v12 firstObject];

  if (!v13) {
    goto LABEL_22;
  }
  inferredMapItemDeduper = self->_inferredMapItemDeduper;
  uint64_t v15 = [v12 firstObject];
  LODWORD(inferredMapItemDeduper) = [(RTInferredMapItemDeduper *)inferredMapItemDeduper inferredMapItem:v9 dedupesToInferredMapItem:v15 error:0];

  if (!inferredMapItemDeduper) {
    goto LABEL_22;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v12;
  uint64_t v16 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    long long v28 = self;
    long long v29 = v11;
    uint64_t v18 = *(void *)v31;
LABEL_8:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v31 != v18) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
      double v21 = [v20 mapItem];
      double v22 = [v21 extendedAttributes];
      uint64_t v23 = [v22 wifiFingerprintLabelType];

      if (v23 != 2) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v17) {
          goto LABEL_8;
        }
        BOOL v24 = 0;
        double v25 = v12;
        id v11 = v29;
        goto LABEL_27;
      }
    }
    double v25 = v20;

    if (v25)
    {
      id v11 = v29;
      BOOL v24 = [(RTInferredMapItemDeduper *)v28->_inferredMapItemDeduper inferredMapItem:v29 dedupesToInferredMapItem:v25 error:0];
      goto LABEL_27;
    }
    BOOL v24 = 0;
    id v11 = v29;
  }
  else
  {
    BOOL v24 = 0;
    double v25 = v12;
LABEL_27:
  }
LABEL_23:

  return v24;
}

- (id)bestQueryFromSortedQueryResults:(id)a3 bestAoiInferredMapItem:(id)a4 bestPoiInferredMapItem:(id)a5 error:(id *)a6
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  unint64_t v12 = (unint64_t)a4;
  unint64_t v13 = (unint64_t)a5;
  if (!v11)
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults", buf, 2u);
    }

    if (!a6) {
      goto LABEL_35;
    }
    long long v30 = @"sortedQueryResults";
    goto LABEL_29;
  }
  if (![v11 count])
  {
    long long v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults.count > 0", buf, 2u);
    }

    if (!a6) {
      goto LABEL_35;
    }
    long long v30 = @"sortedQueryResults.count > 0";
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v30);
    id v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (!(v12 | v13))
  {
    long long v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v63 = *MEMORY[0x1E4F28568];
    v64[0] = @"both bestAoiInferredMapItem and bestPoiInferredMapItem are nil.";
    double v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
    uint64_t v35 = [v32 errorWithDomain:v33 code:0 userInfo:v34];

    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v44 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v60 = v44;
      __int16 v61 = 2112;
      id v62 = v35;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    if (a6) {
      *a6 = v35;
    }

LABEL_35:
    id v28 = 0;
    goto LABEL_36;
  }
  unint64_t v51 = v12;
  if (v12 && v13)
  {
    SEL aSelector = a2;
    long long v50 = a6;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v49 = v11;
      id v17 = 0;
      uint64_t v18 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (-[RTMapItemProviderBluePOI sortedQueryResult:correspondsToAoi:poi:](self, "sortedQueryResult:correspondsToAoi:poi:", v20, v12, v13, aSelector))
          {
            if (v17)
            {
              double v21 = [v20 secondObject];
              [v21 duration];
              double v23 = v22;
              BOOL v24 = [v17 secondObject];
              [v24 duration];
              double v26 = v25;

              if (v23 > v26)
              {
                id v27 = v20;

                id v17 = v27;
              }
              unint64_t v12 = v51;
            }
            else
            {
              id v17 = v20;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v16);

      id v11 = v49;
      if (v17)
      {
        id v28 = [v17 firstObject];
LABEL_57:

        goto LABEL_36;
      }
    }
    else
    {
    }
    id v53 = 0;
    uint64_t v42 = -[RTMapItemProviderBluePOI bestQueryFromSortedQueryResults:bestInferredMapItem:error:](self, "bestQueryFromSortedQueryResults:bestInferredMapItem:error:", v14, v12, &v53, aSelector);
    id v17 = v53;
    if (v17)
    {
      uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        long long v46 = NSStringFromSelector(aSelectora);
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = v46;
        __int16 v61 = 2112;
        id v62 = v17;
        _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        unint64_t v12 = v51;
      }

      id v28 = 0;
      if (v50) {
        id *v50 = v17;
      }
    }
    else
    {
      id v28 = v42;
    }

    goto LABEL_57;
  }
  if (v12) {
    unint64_t v38 = v12;
  }
  else {
    unint64_t v38 = v13;
  }
  id v52 = 0;
  long long v39 = [(RTMapItemProviderBluePOI *)self bestQueryFromSortedQueryResults:v11 bestInferredMapItem:v38 error:&v52];
  id v40 = v52;
  if (v40)
  {
    double v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      long long v45 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v60 = v45;
      __int16 v61 = 2112;
      id v62 = v40;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      unint64_t v12 = v51;
    }

    id v28 = 0;
    if (a6) {
      *a6 = v40;
    }
  }
  else
  {
    id v28 = v39;
  }

LABEL_36:

  return v28;
}

- (id)bestQueryFromAggregatedQueries:(id)a3 error:(id *)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aggregatedQueries", buf, 2u);
    }

    if (a4)
    {
      id v28 = @"aggregatedQueries";
LABEL_25:
      _RTErrorInvalidParameterCreate((uint64_t)v28);
      id v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_86;
    }
LABEL_26:
    id v26 = 0;
    goto LABEL_86;
  }
  if (![v6 count])
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aggregatedQueries.count > 0", buf, 2u);
    }

    if (a4)
    {
      id v28 = @"aggregatedQueries.count > 0";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  uint64_t v92 = a4;
  uint64_t v93 = self;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v7 count])
  {
    unint64_t v8 = 0;
    v96 = v7;
    do
    {
      id v9 = [v7 objectAtIndexedSubscript:v8];
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = NSStringFromSelector(a2);
        unint64_t v12 = [v9 secondObject];
        [v12 duration];
        *(_DWORD *)buf = 138412802;
        __int16 v106 = v11;
        __int16 v107 = 2048;
        unint64_t v108 = v8;
        __int16 v109 = 2048;
        id v110 = v13;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, query, %lu, duration %.3f", buf, 0x20u);
      }
      id v14 = [v9 firstObject];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        unint64_t v16 = 0;
        do
        {
          id v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = NSStringFromSelector(a2);
            uint64_t v19 = [v9 firstObject];
            uint64_t v20 = [v19 objectAtIndexedSubscript:v16];
            *(_DWORD *)buf = 138412802;
            __int16 v106 = v18;
            __int16 v107 = 2048;
            unint64_t v108 = v16;
            __int16 v109 = 2112;
            id v110 = v20;
            _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);
          }
          ++v16;
          double v21 = [v9 firstObject];
          unint64_t v22 = [v21 count];
        }
        while (v16 < v22);
      }

      ++v8;
      id v7 = v96;
    }
    while (v8 < [v96 count]);
  }
  id v104 = 0;
  double v23 = [(RTMapItemProviderBluePOI *)v93 dedupeQueryResults:v7 error:&v104];
  id v24 = v104;
  double v25 = v24;
  if (v24)
  {
    id v26 = 0;
    if (v92) {
      *uint64_t v92 = v24;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v23 count])
    {
      unint64_t v30 = 0;
      id v94 = v23;
      do
      {
        long long v31 = [v23 objectAtIndexedSubscript:v30];
        long long v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = NSStringFromSelector(a2);
          double v34 = [v31 secondObject];
          [v34 duration];
          *(_DWORD *)buf = 138412802;
          __int16 v106 = v33;
          __int16 v107 = 2048;
          unint64_t v108 = v30;
          __int16 v109 = 2048;
          id v110 = v35;
          _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@, corrected query, %lu, duration %.3f", buf, 0x20u);
        }
        uint64_t v36 = [v31 firstObject];
        uint64_t v37 = [v36 count];

        if (v37)
        {
          unint64_t v38 = 0;
          do
          {
            long long v39 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              id v40 = NSStringFromSelector(a2);
              double v41 = [v31 firstObject];
              uint64_t v42 = [v41 objectAtIndexedSubscript:v38];
              *(_DWORD *)buf = 138412802;
              __int16 v106 = v40;
              __int16 v107 = 2048;
              unint64_t v108 = v38;
              __int16 v109 = 2112;
              id v110 = v42;
              _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);
            }
            ++v38;
            uint64_t v43 = [v31 firstObject];
            unint64_t v44 = [v43 count];
          }
          while (v38 < v44);
        }

        ++v30;
        double v23 = v94;
      }
      while (v30 < [v94 count]);
    }
    [(RTMapItemProviderBluePOIParameters *)v93->_parameters baseDuration];
    id v103 = 0;
    long long v45 = -[RTMapItemProviderBluePOI sortedAveragedQueryResults:baseDuration:error:](v93, "sortedAveragedQueryResults:baseDuration:error:", v23, &v103);
    id v46 = v103;
    long long v47 = v46;
    id v91 = v45;
    if (v46)
    {
      double v25 = 0;
      id v26 = 0;
      if (v92) {
        *uint64_t v92 = v46;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v45 count])
      {
        unint64_t v48 = 0;
        do
        {
          id v49 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            long long v50 = NSStringFromSelector(a2);
            unint64_t v51 = [v45 objectAtIndexedSubscript:v48];
            *(_DWORD *)buf = 138412802;
            __int16 v106 = v50;
            __int16 v107 = 2048;
            unint64_t v108 = v48;
            __int16 v109 = 2112;
            id v110 = v51;
            _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "%@, averaged inferredMapItem, %lu, %@", buf, 0x20u);

            long long v45 = v91;
          }

          ++v48;
        }
        while (v48 < [v45 count]);
      }
      id v101 = 0;
      id v102 = 0;
      id v100 = 0;
      [(RTMapItemProviderBluePOI *)v93 chooseBestAoiInferredMapItem:&v102 PoiInferredMapItem:&v101 fromSortedAveragedResults:v45 error:&v100];
      id v52 = v102;
      id v53 = v101;
      id v54 = v100;
      long long v55 = v54;
      if (v54)
      {
        id v26 = 0;
        if (v92) {
          *uint64_t v92 = v54;
        }
        long long v47 = 0;
        double v25 = 0;
      }
      else
      {
        long long v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          long long v57 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          __int16 v106 = v57;
          __int16 v107 = 2112;
          unint64_t v108 = (unint64_t)v52;
          __int16 v109 = 2112;
          id v110 = v53;
          _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%@, bestAoiInferredMapItem, %@, bestPoiInferredMapItem, %@", buf, 0x20u);
        }
        id v99 = 0;
        char v58 = [(RTMapItemProviderBluePOI *)v93 sortQueryResults:v23 error:&v99];
        id v59 = v99;
        if (v59)
        {
          long long v47 = 0;
          double v25 = 0;
          if (v92)
          {
            uint64_t v60 = v59;
            id v26 = 0;
            *uint64_t v92 = v59;
          }
          else
          {
            id v26 = 0;
            uint64_t v60 = v59;
          }
        }
        else
        {
          uint64_t v84 = 0;
          uint64_t v86 = 0;
          id v88 = v53;
          id v89 = v52;
          uint64_t v95 = v23;
          __int16 v90 = v58;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v58 count])
          {
            unint64_t v61 = 0;
            do
            {
              id v62 = [v58 objectAtIndexedSubscript:v61, v84, v86];
              uint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                uint64_t v64 = NSStringFromSelector(a2);
                uint64_t v65 = [v62 secondObject];
                [v65 duration];
                *(_DWORD *)buf = 138412802;
                __int16 v106 = v64;
                __int16 v107 = 2048;
                unint64_t v108 = v61;
                __int16 v109 = 2048;
                id v110 = v66;
                _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%@, sorted query, %lu, duration %.3f", buf, 0x20u);
              }
              v67 = [v62 firstObject];
              uint64_t v68 = [v67 count];

              if (v68)
              {
                unint64_t v69 = 0;
                do
                {
                  uint64_t v70 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v71 = NSStringFromSelector(a2);
                    uint64_t v72 = [v62 firstObject];
                    long long v73 = [v72 objectAtIndexedSubscript:v69];
                    *(_DWORD *)buf = 138412802;
                    __int16 v106 = v71;
                    __int16 v107 = 2048;
                    unint64_t v108 = v69;
                    __int16 v109 = 2112;
                    id v110 = v73;
                    _os_log_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);
                  }
                  ++v69;
                  id v74 = [v62 firstObject];
                  unint64_t v75 = [v74 count];
                }
                while (v69 < v75);
              }

              ++v61;
              char v58 = v90;
            }
            while (v61 < [v90 count]);
          }
          id v98 = 0;
          id v53 = v88;
          id v52 = v89;
          long long v76 = -[RTMapItemProviderBluePOI bestQueryFromSortedQueryResults:bestAoiInferredMapItem:bestPoiInferredMapItem:error:](v93, "bestQueryFromSortedQueryResults:bestAoiInferredMapItem:bestPoiInferredMapItem:error:", v58, v89, v88, &v98, v84, v86);
          id v77 = v98;
          long long v78 = v77;
          double v25 = 0;
          if (v77)
          {
            id v26 = 0;
            if (v92) {
              *uint64_t v92 = v77;
            }
            char v58 = v90;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO) && [v76 count])
            {
              unint64_t v79 = 0;
              do
              {
                long long v80 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                {
                  long long v81 = NSStringFromSelector(a2);
                  long long v82 = [v76 objectAtIndexedSubscript:v79];
                  *(_DWORD *)buf = 138412802;
                  __int16 v106 = v81;
                  __int16 v107 = 2048;
                  unint64_t v108 = v79;
                  __int16 v109 = 2112;
                  id v110 = v82;
                  _os_log_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_INFO, "%@, best inferredMapItems, %lu, %@", buf, 0x20u);

                  char v58 = v90;
                }

                ++v79;
              }
              while (v79 < [v76 count]);
            }
            id v26 = v76;
            double v23 = v95;
            double v25 = 0;
            id v53 = v88;
            id v52 = v89;
          }

          long long v47 = 0;
          uint64_t v60 = v85;
          long long v55 = v87;
        }
      }
    }
  }
LABEL_86:

  return v26;
}

- (id)mapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 error:(id *)a8
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v46 = a5;
  id v47 = a6;
  id v48 = a7;
  [v14 enumerateObjectsUsingBlock:&__block_literal_global_129];
  [v13 enumerateObjectsUsingBlock:&__block_literal_global_133];
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__31;
  uint64_t v63 = __Block_byref_object_dispose__31;
  id v64 = 0;
  uint64_t v53 = 0;
  id v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  long long v56 = __Block_byref_object_copy__31;
  long long v57 = __Block_byref_object_dispose__31;
  id v58 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  unint64_t v16 = [(RTMapItemProviderBluePOI *)self mapServiceManager];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_134;
  v49[3] = &unk_1E6B905F0;
  unint64_t v51 = &v59;
  id v52 = &v53;
  id v17 = v15;
  long long v50 = v17;
  [v16 fetchMapItemsFromLocations:v13 accessPoints:v14 startDate:v46 endDate:v47 options:v48 handler:v49];

  uint64_t v18 = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v20 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v18, v20)) {
    goto LABEL_6;
  }
  double v21 = [MEMORY[0x1E4F1C9C8] now];
  [v21 timeIntervalSinceDate:v19];
  double v23 = v22;
  id v24 = objc_opt_new();
  double v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
  id v26 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v27 = [v26 filteredArrayUsingPredicate:v25];
  id v28 = [v27 firstObject];

  [v24 submitToCoreAnalytics:v28 type:1 duration:v23];
  long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  unint64_t v30 = (void *)MEMORY[0x1E4F28C58];
  v72[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v72 count:1];
  long long v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v31];

  if (v32)
  {
    id v33 = v32;

    char v34 = 0;
  }
  else
  {
LABEL_6:
    id v33 = 0;
    char v34 = 1;
  }

  id v35 = v33;
  if ((v34 & 1) == 0) {
    objc_storeStrong(v54 + 5, v33);
  }
  uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [v13 firstObject];
    uint64_t v38 = [v14 count];
    uint64_t v39 = [(id)v60[5] count];
    id v40 = v54[5];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v37;
    __int16 v66 = 2048;
    uint64_t v67 = v38;
    __int16 v68 = 2048;
    uint64_t v69 = v39;
    __int16 v70 = 2112;
    id v71 = v40;
    _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "blue poi request at location, %@, access points, %lu, mapItems, %lu, error, %@", buf, 0x2Au);
  }
  [(id)v60[5] enumerateObjectsUsingBlock:&__block_literal_global_138];
  if (a8) {
    *a8 = v54[5];
  }
  double v41 = [_RTMap alloc];
  uint64_t v42 = [(_RTMap *)v41 initWithInput:v60[5]];
  uint64_t v43 = [(_RTMap *)v42 withBlock:&__block_literal_global_142];

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v43;
}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "accessPoint %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_130(uint64_t a1, void *a2, uint64_t a3)
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
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "location %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_135(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a3 + 1;
    uint64_t v7 = [v4 extendedAttributes];
    [v7 wifiConfidence];
    uint64_t v9 = v8;
    uint64_t v10 = [v4 extendedAttributes];
    int v11 = 134218754;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = [v10 wifiFingerprintLabelType];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "mapItem, %lu, %@, confidence, %lf, type, %ld", (uint8_t *)&v11, 0x2Au);
  }
}

id __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CDF8];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 extendedAttributes];
  [v5 wifiConfidence];
  uint64_t v6 = [v4 initWithMapItem:v3 confidence:0x4000 source:];

  return v6;
}

- (id)mapItemFromPlistDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"name"];
  uint64_t v5 = [v3 objectForKey:@"category"];
  uint64_t v6 = [v3 objectForKey:@"mapItemPlaceType"];
  if (v6)
  {
    uint64_t v7 = [v3 objectForKey:@"mapItemPlaceType"];
    uint64_t v34 = (int)[v7 intValue];
  }
  else
  {
    uint64_t v34 = 1000;
  }

  uint64_t v8 = [v3 objectForKey:@"muid"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = [v3 objectForKey:@"resultProviderID"];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = [v3 objectForKey:@"latitude"];
  [v12 doubleValue];
  double v14 = v13;

  __int16 v15 = [v3 objectForKey:@"longitude"];
  [v15 doubleValue];
  double v17 = v16;

  uint64_t v18 = [v3 objectForKey:@"labelType"];
  uint64_t v38 = v9;
  uint64_t v39 = (void *)v5;
  uint64_t v37 = v18;
  id v35 = v3;
  uint64_t v36 = v11;
  if ([v18 caseInsensitiveCompare:@"unknown"])
  {
    if ([v18 caseInsensitiveCompare:@"poi"]) {
      uint64_t v19 = 2 * ([v18 caseInsensitiveCompare:@"aoi"] == 0);
    }
    else {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  dispatch_time_t v20 = [MEMORY[0x1E4F1C9C8] date];
  double v21 = [v20 dateByAddingTimeInterval:4838400.0];
  id v22 = objc_alloc(MEMORY[0x1E4F5CD80]);
  double v23 = [MEMORY[0x1E4F29128] UUID];
  LOBYTE(v33) = 0;
  id v24 = objc_msgSend(v22, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v23, 0, 0, 0, v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  0,
                  v33,
                  v20,
                  v21,
                  0,
                  0);

  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:v20 longitude:v14 horizontalUncertainty:v17 date:1.0];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F5CE40]) initWithAddressIdentifier:0 isMe:0 wifiConfidence:v19 wifiFingerprintLabelType:1.0];
  id v27 = objc_alloc(MEMORY[0x1E4F5CE38]);
  id v28 = [MEMORY[0x1E4F29128] UUID];
  long long v29 = [MEMORY[0x1E4F1C9B8] data];
  LOBYTE(v32) = 0;
  unint64_t v30 = (void *)[v27 initWithIdentifier:v28 name:v4 category:v39 address:v24 location:v25 source:0x4000 mapItemPlaceType:v34 muid:v38 resultProviderID:v36 geoMapItemHandle:v29 creationDate:v20 expirationDate:v21 extendedAttributes:v26 displayLanguage:0 disputed:v32];

  return v30;
}

- (id)inferredMapItemsFromPlist:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v27 = 1;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7 isDirectory:&v27];

  if (v9) {
    BOOL v10 = v27 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v7];
    double v13 = v12;
    if (v12)
    {
      double v14 = [v12 objectForKey:@"Inferred Map Items"];
      __int16 v15 = [MEMORY[0x1E4F1CA48] array];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __60__RTMapItemProviderBluePOI_inferredMapItemsFromPlist_error___block_invoke;
      v25[3] = &unk_1E6B90A68;
      v25[4] = self;
      id v16 = v15;
      id v26 = v16;
      [v14 enumerateObjectsUsingBlock:v25];
      double v17 = v26;
      id v18 = v16;

      uint64_t v11 = v18;
    }
    else
    {
      double v14 = [NSString stringWithFormat:@"failed to create dictionary from plist file, %@", v7];
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F5CFE8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = v14;
      double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      id v18 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

      id v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        long long v29 = v24;
        __int16 v30 = 2112;
        id v31 = v18;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
      if (a4)
      {
        id v18 = v18;
        uint64_t v11 = 0;
        *a4 = v18;
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __60__RTMapItemProviderBluePOI_inferredMapItemsFromPlist_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 objectForKeyedSubscript:@"mapItem"];
  id v4 = [*(id *)(a1 + 32) mapItemFromPlistDictionary:v9];
  uint64_t v5 = [v3 objectForKey:@"confidence"];

  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F5CDF8]) initWithMapItem:v4 confidence:0x4000 source:v7];
  [*(id *)(a1 + 40) addObject:v8];
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    uint64_t v8 = [(RTMapItemProviderBluePOIParameters *)self->_parameters injectedPlistPath];

    if (v8)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        id v77 = v10;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", buf, 0xCu);
      }
      uint64_t v11 = [(RTMapItemProviderBluePOIParameters *)self->_parameters injectedPlistPath];
      id v75 = 0;
      uint64_t v12 = [(RTMapItemProviderBluePOI *)self inferredMapItemsFromPlist:v11 error:&v75];
      id v13 = v75;

      if (v13)
      {
        double v14 = 0;
        if (a4) {
          *a4 = v13;
        }
      }
      else
      {
        double v14 = v12;
      }

LABEL_38:
      goto LABEL_39;
    }
  }
  uint64_t v15 = [v7 locations];
  if (v15)
  {
    id v16 = (void *)v15;
    double v17 = [v7 accessPoints];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F5CE48]);
      uint64_t v19 = [v7 useBackground];
      uint64_t v20 = (objc_class *)objc_opt_class();
      double v21 = NSStringFromClass(v20);
      id v22 = [v7 clientIdentifier];
      double v23 = (void *)[v18 initWithUseBackgroundTraits:v19 analyticsIdentifier:v21 clientIdentifier:v22];

      uint64_t v24 = [v7 fidelityPolicy];
      double v25 = [v7 locations];
      id v26 = [v7 accessPoints];
      char v27 = [v7 location];
      id v28 = [(RTMapItemProviderBluePOI *)self _mapItemsWithFidelityPolicy:v24 locations:v25 accessPoints:v26 referenceLocation:v27 options:v23 error:a4];

      if (v28)
      {
        [(RTMapItemProviderBluePOIParameters *)self->_parameters aoiConfidencePassThroughThreshold];
        double v30 = v29;
        [(RTMapItemProviderBluePOIParameters *)self->_parameters poiConfidencePassThroughThreshold];
        uint64_t v32 = [(RTMapItemProviderBluePOI *)self _filterByConfidence:v28 aoiConfidencePassThroughThreshold:a4 aoiConfidenceConsiderThreshold:v30 poiConfidencePassThroughThreshold:0.0 poiConfidenceConsiderThreshold:v31 error:0.0];
      }
      else
      {
        uint64_t v32 = 0;
      }
      if ([0 count])
      {
        id v62 = [0 arrayByAddingObjectsFromArray:v32];
      }
      else
      {
        id v62 = v32;
      }
      double v14 = v62;

      if (!v14) {
        goto LABEL_39;
      }
      goto LABEL_33;
    }
  }
  uint64_t v33 = [v7 startDate];
  if (!v33) {
    goto LABEL_27;
  }
  uint64_t v34 = (void *)v33;
  uint64_t v35 = [v7 endDate];
  if (!v35)
  {

    goto LABEL_27;
  }
  uint64_t v36 = (void *)v35;
  uint64_t v37 = [v7 startDate];
  uint64_t v38 = [v7 endDate];
  int v39 = [v37 isAfterDate:v38];

  if (v39)
  {
LABEL_27:
    if (!a4)
    {
      double v14 = 0;
      goto LABEL_39;
    }
    uint64_t v63 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F5CFE8];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    v85[0] = @"requires a valid date range.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    [v63 errorWithDomain:v64 code:7 userInfo:v12];
    double v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  id v40 = objc_alloc(MEMORY[0x1E4F28C18]);
  double v41 = [v7 startDate];
  uint64_t v42 = [v7 endDate];
  uint64_t v43 = [v40 initWithStartDate:v41 endDate:v42];

  id v74 = (void *)v43;
  unint64_t v44 = [(RTMapItemProviderBluePOI *)self numberOfRealtimeQueriesForInterval:v43];
  unint64_t v45 = [(RTMapItemProviderBluePOIParameters *)self->_parameters maxNumberOfQueries] - v44;
  id v46 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    id v47 = NSStringFromSelector(a2);
    unint64_t v48 = [(RTMapItemProviderBluePOIParameters *)self->_parameters maxNumberOfQueries];
    *(_DWORD *)buf = 138413058;
    id v77 = v47;
    __int16 v78 = 2048;
    unint64_t v79 = v48;
    __int16 v80 = 2048;
    unint64_t v81 = v44;
    __int16 v82 = 2048;
    unint64_t v83 = v45;
    _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "%@, maxNumberOfQueries, %lu, realtime usage, %lu, hindsight usage, %lu", buf, 0x2Au);
  }
  [v7 distance];
  double v50 = v49;
  unint64_t v51 = [v7 location];
  id v52 = [v7 startDate];
  uint64_t v53 = [v7 endDate];
  id v54 = [(RTMapItemProviderBluePOI *)self _mapItemsWithinDistance:v51 location:v52 startDate:v53 endDate:v45 maxQueryAttemps:a4 error:v50];

  if (v54)
  {
    [(RTMapItemProviderBluePOIParameters *)self->_parameters aoiConfidencePassThroughThreshold];
    double v56 = v55;
    [(RTMapItemProviderBluePOIParameters *)self->_parameters aoiConfidenceConsiderThreshold];
    double v58 = v57;
    [(RTMapItemProviderBluePOIParameters *)self->_parameters poiConfidencePassThroughThreshold];
    double v60 = v59;
    [(RTMapItemProviderBluePOIParameters *)self->_parameters poiConfidenceConsiderThreshold];
    double v14 = [(RTMapItemProviderBluePOI *)self _filterByConfidence:v54 aoiConfidencePassThroughThreshold:a4 aoiConfidenceConsiderThreshold:v56 poiConfidencePassThroughThreshold:v58 poiConfidenceConsiderThreshold:v60 error:v61];
  }
  else
  {
    double v14 = 0;
  }

  if (v14)
  {
LABEL_33:
    [v7 distance];
    if (v65 > 0.0)
    {
      __int16 v66 = [v7 location];

      if (v66)
      {
        uint64_t v67 = [v7 location];
        [v7 distance];
        uint64_t v68 = -[RTMapItemProviderBluePOI filterByDistance:location:thresholdForUnknownLabel:error:](self, "filterByDistance:location:thresholdForUnknownLabel:error:", v14, v67, a4);

        double v14 = v68;
      }
    }
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v69 = (objc_class *)objc_opt_class();
      __int16 v70 = NSStringFromClass(v69);
      id v71 = NSStringFromSelector(a2);
      uint64_t v72 = [v14 count];
      *(_DWORD *)buf = 138412802;
      id v77 = v70;
      __int16 v78 = 2112;
      unint64_t v79 = (unint64_t)v71;
      __int16 v80 = 2048;
      unint64_t v81 = v72;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, inferredMapItems.count, %lu", buf, 0x20u);
    }
    goto LABEL_38;
  }
LABEL_39:

  return v14;
}

- (id)_mapItemsWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 referenceLocation:(id)a6 options:(id)a7 error:(id *)a8
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v13 count])
  {
    SEL aSelector = a2;
    id v54 = v16;
    double v17 = [v13 firstObject];
    id v18 = [v17 timestamp];

    uint64_t v19 = [v13 lastObject];
    uint64_t v20 = [v19 timestamp];

    [v20 timeIntervalSinceDate:v18];
    double v22 = v21;
    unint64_t v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:1];
    uint64_t v64 = v51;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    uint64_t v24 = [v14 sortedArrayUsingDescriptors:v23];

    double v25 = [v24 firstObject];
    id v26 = [v25 date];
    [v18 timeIntervalSinceDate:v26];
    double v28 = v27;

    double v29 = [v24 lastObject];
    double v30 = [v29 date];
    [v18 timeIntervalSinceDate:v30];
    double v32 = v31;

    [RTMapItemProviderBluePOIWiFiScanMetrics submitBluePOIWiFiScanMetricsWithFingerprintsCount:[v14 count] fingerprintsZeroAccessPointsCount:0 fingerprintsNonZeroAccessPointsCount:[v14 count] isFingerprintWindowFallback:1 timeIntervalSinceEarliestFingerprint:v28 timeIntervalSinceLatestFingerprint:v32 totalAccessPointsCount:v22 visitInterval:v22 visitSource:v22];
    if ([v14 count])
    {
      uint64_t v33 = objc_opt_new();
      uint64_t v34 = v33;
      if (v15) {
        [v33 addObject:v15];
      }
      id v50 = v15;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __111__RTMapItemProviderBluePOI__mapItemsWithFidelityPolicy_locations_accessPoints_referenceLocation_options_error___block_invoke;
      v56[3] = &unk_1E6B93A18;
      id v35 = v34;
      id v57 = v35;
      [v13 enumerateObjectsUsingBlock:v56];
      id v55 = 0;
      uint64_t v36 = [(RTMapItemProviderBluePOI *)self mapItemsFromLocations:v35 accessPoints:v14 startDate:v18 endDate:v20 options:v54 error:&v55];
      id v37 = v55;
      uint64_t v38 = v37;
      if (v37)
      {
        if (a8) {
          *a8 = v37;
        }
        int v39 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v46 = (objc_class *)objc_opt_class();
          uint64_t v53 = NSStringFromClass(v46);
          uint64_t v47 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          double v59 = v53;
          __int16 v60 = 2112;
          uint64_t v61 = v47;
          unint64_t v48 = (void *)v47;
          _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, mapItemsFromLocationsAccessPointsErrors", buf, 0x16u);
        }
        id v40 = 0;
      }
      else
      {
        id v40 = v36;
      }
    }
    else
    {
      if (!a8)
      {
        id v40 = 0;
        goto LABEL_18;
      }
      id v50 = v15;
      uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F5CFE8];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      uint64_t v63 = @"requires accessPoints.";
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      [v43 errorWithDomain:v44 code:7 userInfo:v35];
      id v40 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v15 = v50;
LABEL_18:

    id v16 = v54;
    goto LABEL_19;
  }
  if (a8)
  {
    double v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F5CFE8];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v66[0] = @"requires locations.";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
    [v41 errorWithDomain:v42 code:7 userInfo:v18];
    id v40 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  id v40 = 0;
LABEL_20:

  return v40;
}

void __111__RTMapItemProviderBluePOI__mapItemsWithFidelityPolicy_locations_accessPoints_referenceLocation_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithCLLocation:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

- (id)_filterOutEmptyFingerprintsFromFingerprints:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __80__RTMapItemProviderBluePOI__filterOutEmptyFingerprintsFromFingerprints_endDate___block_invoke;
  id v16 = &unk_1E6B93A40;
  double v17 = self;
  id v18 = v6;
  id v8 = v6;
  id v9 = a3;
  BOOL v10 = [v7 predicateWithBlock:&v13];
  uint64_t v11 = [v9 filteredArrayUsingPredicate:v10, v13, v14, v15, v16, v17];

  return v11;
}

BOOL __80__RTMapItemProviderBluePOI__filterOutEmptyFingerprintsFromFingerprints_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessPointsForFingerprint:a2 endDate:*(void *)(a1 + 40) error:0];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_fallbackToLocationBasedLookupForVisitDuration:(double)a3
{
  [(RTMapItemProviderBluePOIParameters *)self->_parameters noFingerprintMinVisitDuration];
  return v4 <= a3;
}

- (unint64_t)numberOfRealtimeQueriesForInterval:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  uint64_t v58 = 0;
  double v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__31;
  uint64_t v62 = __Block_byref_object_dispose__31;
  id v63 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__31;
  double v56 = __Block_byref_object_dispose__31;
  id v57 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(RTMapItemProviderBluePOI *)self placeInferenceQueryStore];
  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  uint64_t v47 = __63__RTMapItemProviderBluePOI_numberOfRealtimeQueriesForInterval___block_invoke;
  unint64_t v48 = &unk_1E6B905F0;
  id v50 = &v58;
  unint64_t v51 = &v52;
  id v7 = v5;
  double v49 = v7;
  [v6 fetchPlaceInferenceQueriesWithDateInterval:v44 ascending:1 handler:&v45];

  id v8 = v7;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10)) {
    goto LABEL_6;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  id v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
  id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v17 = [v16 filteredArrayUsingPredicate:v15];
  id v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  v69[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v69 count:1];
  double v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;

    char v24 = 0;
  }
  else
  {
LABEL_6:
    id v23 = 0;
    char v24 = 1;
  }

  id v25 = v23;
  if ((v24 & 1) == 0) {
    objc_storeStrong(v53 + 5, v23);
  }
  id v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [(id)v59[5] count];
    id v29 = v53[5];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v65 = 2048;
    uint64_t v66 = v28;
    __int16 v67 = 2112;
    id v68 = v29;
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, fetched place inference queries, %lu, error, %@", buf, 0x20u);
  }
  if (v53[5] || ![(id)v59[5] count])
  {
    unint64_t v30 = 0;
  }
  else
  {
    double v32 = [(id)v59[5] objectAtIndexedSubscript:0];
    uint64_t v33 = [v32 sourceIdentifier];
    unint64_t v30 = v33 == @"com.apple.CoreRoutine.visitManager";

    for (unint64_t i = 1; i < [v59[5] count:v44, v45, v46, v47, v48]; ++i)
    {
      id v35 = [(id)v59[5] objectAtIndexedSubscript:i];
      uint64_t v36 = [v35 sourceIdentifier];
      BOOL v37 = v36 == @"com.apple.CoreRoutine.visitManager";

      if (v37)
      {
        uint64_t v38 = [(id)v59[5] objectAtIndexedSubscript:i];
        int v39 = [v38 date];
        id v40 = [(id)v59[5] objectAtIndexedSubscript:i - 1];
        double v41 = [v40 date];
        [v39 timeIntervalSinceDate:v41];
        BOOL v43 = v42 > 1.0;

        if (v43) {
          ++v30;
        }
      }
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v30;
}

void __63__RTMapItemProviderBluePOI_numberOfRealtimeQueriesForInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_bestAOIFromAOIs:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    SEL aSelector = a2;
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v46;
    double v10 = 0.0;
    double v11 = 0.0;
    obuint64_t j = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v14 = [(id)objc_opt_class() preferredAOICategories];
        id v15 = [v13 mapItem];
        id v16 = [v15 category];
        int v17 = [v14 containsObject:v16];

        if (v17)
        {
          id v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          id v4 = obj;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v34 = (objc_class *)objc_opt_class();
            id v35 = NSStringFromClass(v34);
            uint64_t v36 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138413058;
            id v50 = v35;
            __int16 v51 = 2112;
            uint64_t v52 = v36;
            __int16 v53 = 2112;
            uint64_t v54 = v13;
            __int16 v55 = 2112;
            id v56 = obj;
            _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "%@, %@, selecting preferred AOI, %@, from AOIs, %@.", buf, 0x2Au);
          }
          id v30 = v13;

          goto LABEL_29;
        }
        [v13 confidence];
        if (v18 >= 0.9)
        {
          if (!v8 || ([v13 confidence], v11 > v19))
          {
            id v20 = v13;

            [v20 confidence];
            double v11 = v21;
            id v8 = v20;
          }
        }
        [v13 confidence];
        if (v22 < 0.9)
        {
          if (!v7 || ([v13 confidence], v10 < v23))
          {
            id v24 = v13;

            [v24 confidence];
            double v10 = v25;
            uint64_t v7 = v24;
          }
        }
      }
      id v4 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v61 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if (!v8)
    {
      double v31 = v7;
      a2 = aSelector;
      goto LABEL_25;
    }
    id v26 = v8;
    id v27 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v40 = (objc_class *)objc_opt_class();
      double v41 = NSStringFromClass(v40);
      double v42 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138413570;
      id v50 = v41;
      __int16 v51 = 2112;
      uint64_t v52 = v42;
      __int16 v53 = 2112;
      uint64_t v54 = v26;
      __int16 v55 = 2112;
      id v56 = v7;
      __int16 v57 = 2048;
      uint64_t v58 = 0x3FECCCCCCCCCCCCDLL;
      __int16 v59 = 2112;
      id v60 = obj;
      _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "%@, %@, selecting innerNestedAOI, %@, higherOverlapConflictedAOI, %@, threshold, %f, AOIs, %@.", buf, 0x3Eu);
    }
    id v28 = v26;
    id v8 = v28;
  }
  else
  {

    double v31 = 0;
LABEL_25:
    double v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      BOOL v37 = (objc_class *)objc_opt_class();
      uint64_t v38 = NSStringFromClass(v37);
      int v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413570;
      id v50 = v38;
      __int16 v51 = 2112;
      uint64_t v52 = v39;
      __int16 v53 = 2112;
      uint64_t v54 = v31;
      __int16 v55 = 2112;
      id v56 = 0;
      __int16 v57 = 2048;
      uint64_t v58 = 0x3FECCCCCCCCCCCCDLL;
      __int16 v59 = 2112;
      id v60 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEBUG, "%@, %@, selecting higherOverlapConflictedAOI, %@, innerNestedAOI, %@, threshold, %f, AOIs, %@.", buf, 0x3Eu);
    }
    id v28 = v31;
    uint64_t v7 = v28;
    id v8 = 0;
  }
  id v30 = v28;
LABEL_29:

  return v30;
}

- (id)_filterLessRelevantAOIsFromQueryResult:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v33;
    *(void *)&long long v8 = 138412802;
    long long v29 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v13 = [v12 mapItem:v29];
        uint64_t v14 = [v13 mapItemPlaceType];

        id v15 = v4;
        if (v14 != 1)
        {
          id v16 = [v12 mapItem];
          uint64_t v17 = [v16 mapItemPlaceType];

          id v15 = v5;
          if (v17 != 2)
          {
            double v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              double v19 = (objc_class *)objc_opt_class();
              id v20 = NSStringFromClass(v19);
              double v21 = NSStringFromSelector(a2);
              *(_DWORD *)buf = v29;
              BOOL v37 = v20;
              __int16 v38 = 2112;
              int v39 = v21;
              __int16 v40 = 2112;
              id v41 = v12;
              _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@, %@, the inferred map item, %@, is neither an AOI or a POI.", buf, 0x20u);
            }
            id v15 = v5;
          }
        }
        [v15 addObject:v12];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v9);
  }

  double v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v6 count]];
  if ((unint64_t)[v4 count] < 2)
  {
    [v22 addObjectsFromArray:v6];
  }
  else
  {
    double v23 = [(RTMapItemProviderBluePOI *)self _bestAOIFromAOIs:v4];
    [v22 addObject:v23];
    [v22 addObjectsFromArray:v5];
  }
  id v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    double v25 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v25);
    id v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    BOOL v37 = v26;
    __int16 v38 = 2112;
    int v39 = v27;
    __int16 v40 = 2112;
    id v41 = v6;
    __int16 v42 = 2112;
    BOOL v43 = v4;
    __int16 v44 = 2112;
    long long v45 = v5;
    __int16 v46 = 2112;
    long long v47 = v22;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, queryResult, %@, aois, %@, pois, %@, selectedResults, %@.", buf, 0x3Eu);
  }

  return v22;
}

- (id)_mapItemsWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 maxQueryAttemps:(unint64_t)a7 error:(id *)a8
{
  v196[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = v16;
  if (!v14)
  {
    if (a8)
    {
      double v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v195 = *MEMORY[0x1E4F28568];
      v196[0] = @"requires a valid location.";
      double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v196 forKeys:&v195 count:1];
      id v20 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v19];
      goto LABEL_9;
    }
LABEL_10:
    double v22 = 0;
    goto LABEL_69;
  }
  if (v15 && v16 && ![v15 isAfterDate:v16])
  {
    SEL aSelector = a2;
    v134 = self;
    double v19 = [MEMORY[0x1E4F1CA48] array];
    id v23 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [v14 latitude];
    double v25 = v24;
    [v14 longitude];
    double v27 = v26;
    [v14 horizontalUncertainty];
    uint64_t v29 = [v23 initWithLatitude:v15 longitude:objc_msgSend(v14, "referenceFrame") horizontalUncertainty:v25 date:v27 referenceFrame:v28];
    if (v29) {
      [v19 addObject:v29];
    }
    v131 = (void *)v29;
    char v179 = 0;
    id v178 = 0;
    v133 = [(RTMapItemProviderBluePOI *)v134 fingerprintsBetweenStartDate:v15 endDate:v17 isTimeWindowFallback:&v179 settledState:2 error:&v178];
    id v30 = v178;
    [v17 timeIntervalSinceDate:v15];
    double v32 = v31;
    if (v30)
    {
      if (a8) {
        *a8 = v30;
      }
      [(RTMapItemProviderBluePOIParameters *)v134->_parameters aoiConfidencePassThroughThreshold];
      double v34 = v33;
      [(RTMapItemProviderBluePOIParameters *)v134->_parameters poiConfidencePassThroughThreshold];
      [(RTMapItemProviderBluePOI *)v134 _submitPerformanceMetricsForResults:MEMORY[0x1E4F1CBF0] noFingerprints:0 originalMaxNumberOfQueries:3 aoiConfidencePassThroughThreshold:0 poiConfidencePassThroughThreshold:0 fingerprintsCount:0 zeroAccessPointsFingerprintsCount:v34 nonZeroAccessPointsFingerprintsCount:v35 queryCount:v32 firstResultQueryCount:0 error:0 visitInterval:v30 visitSource:3];
      double v22 = 0;
      goto LABEL_67;
    }
    uint64_t v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"start" ascending:1];
    v192 = v36;
    BOOL v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
    __int16 v38 = [v133 sortedArrayUsingDescriptors:v37];

    uint64_t v124 = [v38 count];
    int v39 = [(RTMapItemProviderBluePOI *)v134 _filterOutEmptyFingerprintsFromFingerprints:v38 endDate:v17];

    uint64_t v122 = [v39 count];
    BOOL v40 = [v39 count] > a7;
    unint64_t v41 = [v39 count];
    if (v41 >= a7) {
      unint64_t v42 = a7;
    }
    else {
      unint64_t v42 = v41;
    }
    v133 = [v39 subarrayWithRange:v40, v42];

    BOOL v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      long long v85 = NSStringFromSelector(aSelector);
      uint64_t v86 = [v133 count];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v85;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v124;
      *(_WORD *)&buf[22] = 2048;
      v189 = (uint64_t (*)(uint64_t, uint64_t))v122;
      LOWORD(v190) = 2048;
      *(void *)((char *)&v190 + 2) = v86;
      _os_log_debug_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEBUG, "%@, fingerprints from settled points, total count, %lu, non zero AP count, %lu, filtered count, %lu", buf, 0x2Au);
    }
    v132 = [MEMORY[0x1E4F1CA48] arrayWithArray:v133];
    if ([v133 count] >= a7)
    {
      uint64_t v118 = 0;
      uint64_t v120 = 0;
    }
    else
    {
      char v179 = 0;
      id v177 = 0;
      id v128 = [(RTMapItemProviderBluePOI *)v134 fingerprintsBetweenStartDate:v15 endDate:v17 isTimeWindowFallback:&v179 settledState:1 error:&v177];
      id v44 = v177;
      if (v44)
      {
        id v30 = v44;
        if (a8)
        {
          id v30 = v44;
          double v22 = 0;
          *a8 = v30;
        }
        else
        {
          double v22 = 0;
        }
        goto LABEL_66;
      }
      long long v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"start" ascending:1];
      v191 = v45;
      __int16 v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
      long long v47 = [v128 sortedArrayUsingDescriptors:v46];

      uint64_t v120 = [v47 count];
      long long v48 = [(RTMapItemProviderBluePOI *)v134 _filterOutEmptyFingerprintsFromFingerprints:v47 endDate:v17];

      uint64_t v118 = [v48 count];
      unint64_t v49 = [v48 count];
      uint64_t v50 = [v133 count];
      if (a7 - v50 > v49) {
        unint64_t v51 = 1;
      }
      else {
        unint64_t v51 = v49 / (a7 - v50);
      }
      if ([v48 count])
      {
        unint64_t v52 = 0;
        do
        {
          if ([v132 count] >= a7) {
            break;
          }
          __int16 v53 = [v48 objectAtIndex:v52];
          [v132 addObject:v53];

          v52 += v51;
        }
        while (v52 < [v48 count]);
      }
      uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        v87 = NSStringFromSelector(aSelector);
        uint64_t v88 = [v132 count];
        uint64_t v89 = [v133 count];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v87;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v120;
        *(_WORD *)&buf[22] = 2048;
        v189 = (uint64_t (*)(uint64_t, uint64_t))v118;
        LOWORD(v190) = 2048;
        *(void *)((char *)&v190 + 2) = v88 - v89;
        _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "%@, fingerprints from unsettled points, total count, %lu, non zero AP count, %lu, filtered count, %lu", buf, 0x2Au);
      }
    }
    __int16 v55 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      id v56 = NSStringFromSelector(aSelector);
      uint64_t v57 = [v133 count];
      uint64_t v58 = [v132 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2048;
      v189 = (uint64_t (*)(uint64_t, uint64_t))v58;
      _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "%@, fingerprints from settled points count, %lu, total fingerprints count, %lu", buf, 0x20u);
    }
    __int16 v59 = [MEMORY[0x1E4F1CA48] array];
    id v60 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v173 = 0;
    v174 = &v173;
    uint64_t v175 = 0x2020000000;
    char v176 = 0;
    v172[0] = 0;
    v172[1] = v172;
    v172[2] = 0x2020000000;
    v172[3] = 0;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v189 = __Block_byref_object_copy__31;
    *(void *)&long long v190 = __Block_byref_object_dispose__31;
    *((void *)&v190 + 1) = 0;
    uint64_t v166 = 0;
    v167 = &v166;
    uint64_t v168 = 0x3032000000;
    v169 = __Block_byref_object_copy__31;
    v170 = __Block_byref_object_dispose__31;
    id v171 = (id)objc_opt_new();
    uint64_t v160 = 0;
    v161 = &v160;
    uint64_t v162 = 0x3032000000;
    v163 = __Block_byref_object_copy__31;
    v164 = __Block_byref_object_dispose__31;
    id v165 = (id)objc_opt_new();
    uint64_t v156 = 0;
    v157 = &v156;
    uint64_t v158 = 0x2020000000;
    uint64_t v159 = 0;
    uint64_t v152 = 0;
    v153 = &v152;
    uint64_t v154 = 0x2020000000;
    uint64_t v155 = 0;
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __101__RTMapItemProviderBluePOI__mapItemsWithinDistance_location_startDate_endDate_maxQueryAttemps_error___block_invoke;
    v138[3] = &unk_1E6B93A68;
    v138[4] = v134;
    id v116 = v17;
    id v139 = v116;
    id v127 = v60;
    id v140 = v127;
    v144 = v172;
    id v114 = v19;
    id v141 = v114;
    v151 = aSelector;
    id v61 = v15;
    id v142 = v61;
    v145 = &v156;
    id v128 = v59;
    id v143 = v128;
    v146 = &v152;
    v147 = &v166;
    v148 = &v160;
    v149 = buf;
    v150 = &v173;
    [v132 enumerateObjectsUsingBlock:v138];
    v126 = [(id)v167[5] valueForKeyPath:@"@min.self"];
    v117 = [(id)v161[5] valueForKeyPath:@"@max.self"];
    [v61 timeIntervalSinceDate:];
    [v61 timeIntervalSinceDate:v126];
    uint64_t v62 = v118 + v122;
    uint64_t v123 = v120 + v124 - (v118 + v122);
    uint64_t v125 = v120 + v124;
    +[RTMapItemProviderBluePOIWiFiScanMetrics submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:](RTMapItemProviderBluePOIWiFiScanMetrics, "submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:");
    id v63 = *(void **)(*(void *)&buf[8] + 40);
    if (v63)
    {
      if (a8)
      {
        double v22 = 0;
        *a8 = v63;
LABEL_65:

        _Block_object_dispose(&v152, 8);
        _Block_object_dispose(&v156, 8);
        _Block_object_dispose(&v160, 8);

        _Block_object_dispose(&v166, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v172, 8);
        _Block_object_dispose(&v173, 8);

        id v30 = 0;
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
    }
    else
    {
      if (!*((unsigned char *)v174 + 24) && ![v127 count])
      {
        uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          int v109 = *((unsigned __int8 *)v174 + 24);
          uint64_t v110 = [v127 count];
          uint64_t v111 = @"YES";
          *(_DWORD *)v180 = 138412802;
          if (!v109) {
            uint64_t v111 = @"NO";
          }
          double v181 = *(double *)&v111;
          __int16 v182 = 2048;
          double v183 = v32;
          __int16 v184 = 2048;
          uint64_t v185 = v110;
          _os_log_debug_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_DEBUG, "fingerprintFound, %@, visit duration, %f, error count, %lu", v180, 0x20u);
        }
        uint64_t v65 = v62;

        if ([(RTMapItemProviderBluePOI *)v134 _fallbackToLocationBasedLookupForVisitDuration:v32])
        {
          uint64_t v66 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v180 = 134217984;
            double v181 = v32;
            _os_log_debug_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_DEBUG, "no fingerprints with access points - falling back to location based lookup, visit duration, %f", v180, 0xCu);
          }

          id v137 = 0;
          v121 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v61 endDate:v116];
          __int16 v67 = [(RTMapItemProviderBluePOI *)v134 locationsInDateInterval:v121 error:&v137];
          id v68 = v137;
          if (v68)
          {
            uint64_t v69 = v68;
            [v127 addObject:];
          }
          else
          {
            uint64_t v69 = 0;
            if ([v67 count]) {
              [v114 addObjectsFromArray:v67];
            }
            __int16 v113 = v67;
            id v95 = objc_alloc(MEMORY[0x1E4F5CE48]);
            v96 = (objc_class *)objc_opt_class();
            uint64_t v97 = NSStringFromClass(v96);
            v119 = (void *)[v95 initWithUseBackgroundTraits:1 analyticsIdentifier:v97];

            id v136 = 0;
            double v22 = [(RTMapItemProviderBluePOI *)v134 mapItemsFromLocations:v114 accessPoints:0 startDate:v61 endDate:v116 options:v119 error:&v136];
            id v98 = v136;
            ++v157[3];
            if (![v128 count] && !objc_msgSend(v22, "count")) {
              ++v153[3];
            }
            if ([v22 count])
            {
              v115 = v98;
              id v99 = objc_alloc(MEMORY[0x1E4F5CE58]);
              id v100 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v61 endDate:v116];
              aSelectora = (char *)[v99 initWithFirstObject:v22 secondObject:v100];

              [v128 addObject:aSelectora];
              [(RTMapItemProviderBluePOIParameters *)v134->_parameters aoiConfidencePassThroughThreshold];
              double v102 = v101;
              [(RTMapItemProviderBluePOIParameters *)v134->_parameters poiConfidencePassThroughThreshold];
              double v104 = v103;
              uint64_t v105 = v157[3];
              uint64_t v106 = v153[3];
              __int16 v107 = _RTSafeArray();
              unint64_t v108 = _RTMultiErrorCreate();
              [(RTMapItemProviderBluePOI *)v134 _submitPerformanceMetricsForResults:v128 noFingerprints:1 originalMaxNumberOfQueries:3 aoiConfidencePassThroughThreshold:v125 poiConfidencePassThroughThreshold:v123 fingerprintsCount:v65 zeroAccessPointsFingerprintsCount:v102 nonZeroAccessPointsFingerprintsCount:v104 queryCount:v32 firstResultQueryCount:v105 error:v106 visitInterval:v108 visitSource:3];

              goto LABEL_65;
            }
            if (v127 && v98) {
              [v127 addObject:v98];
            }

            __int16 v67 = v113;
          }

          uint64_t v62 = v65;
        }
      }
      [(RTMapItemProviderBluePOIParameters *)v134->_parameters aoiConfidencePassThroughThreshold];
      double v71 = v70;
      [(RTMapItemProviderBluePOIParameters *)v134->_parameters poiConfidencePassThroughThreshold];
      double v73 = v72;
      uint64_t v74 = v157[3];
      uint64_t v75 = v153[3];
      long long v76 = _RTSafeArray();
      id v77 = _RTMultiErrorCreate();
      [(RTMapItemProviderBluePOI *)v134 _submitPerformanceMetricsForResults:v128 noFingerprints:0 originalMaxNumberOfQueries:3 aoiConfidencePassThroughThreshold:v125 poiConfidencePassThroughThreshold:v123 fingerprintsCount:v62 zeroAccessPointsFingerprintsCount:v71 nonZeroAccessPointsFingerprintsCount:v73 queryCount:v32 firstResultQueryCount:v74 error:v75 visitInterval:v77 visitSource:3];

      if ([v128 count])
      {
        __int16 v78 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          __int16 v90 = (objc_class *)objc_opt_class();
          NSStringFromClass(v90);
          id v91 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          id v92 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v93 = [v132 count];
          uint64_t v94 = v157[3];
          *(_DWORD *)v180 = 138413058;
          double v181 = *(double *)&v91;
          __int16 v182 = 2112;
          double v183 = *(double *)&v92;
          __int16 v184 = 2048;
          uint64_t v185 = v93;
          __int16 v186 = 2048;
          uint64_t v187 = v94;
          _os_log_debug_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_DEBUG, "%@, %@, fingerprintsCount, %lu, numberOfBPQueries, %lu", v180, 0x2Au);
        }
        id v135 = 0;
        unint64_t v79 = [(RTMapItemProviderBluePOI *)v134 bestQueryFromAggregatedQueries:v128 error:&v135];
        id v80 = v135;
        if (v80) {
          [v127 addObject:v80];
        }
        if (a8 && [v127 count])
        {
          uint64_t v112 = 1;
          unint64_t v81 = _RTSafeArray();
          _RTMultiErrorCreate();
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        __int16 v82 = -[RTMapItemProviderBluePOI _filterLessRelevantAOIsFromQueryResult:](v134, "_filterLessRelevantAOIsFromQueryResult:", v79, v112);
        double v22 = [(RTMapItemProviderBluePOI *)v134 _adjustConfidencesOfTheSelectedResult:v82 allQueryResults:v128];

        goto LABEL_65;
      }
      if (a8 && [v127 count])
      {
        unint64_t v83 = _RTSafeArray();
        _RTMultiErrorCreate();
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    double v22 = 0;
    goto LABEL_65;
  }
  if (!a8) {
    goto LABEL_10;
  }
  double v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v193 = *MEMORY[0x1E4F28568];
  v194 = @"requires a valid date range.";
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
  id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v19];
LABEL_9:
  double v22 = 0;
  *a8 = v20;
LABEL_68:

LABEL_69:

  return v22;
}

void __101__RTMapItemProviderBluePOI__mapItemsWithinDistance_location_startDate_endDate_maxQueryAttemps_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v81 = 0;
  uint64_t v10 = [v8 accessPointsForFingerprint:v7 endDate:v9 error:&v81];
  id v11 = v81;
  if (!v11)
  {
    double v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:1];
    v98[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:1];
    id v12 = [v10 sortedArrayUsingDescriptors:v14];

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v12 count] + v15;
    id v16 = *(void **)(a1 + 32);
    id v80 = 0;
    uint64_t v17 = [v16 locationsForAccessPoints:v12 error:&v80];
    id v18 = v80;
    if (v18)
    {
      [*(id *)(a1 + 48) addObject:v18];
      *a4 = 1;
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v19 = [v17 count];
    id v20 = *(void **)(a1 + 56);
    id v77 = v13;
    if (v19)
    {
      id v21 = [v20 arrayByAddingObjectsFromArray:v17];
    }
    else
    {
      id v21 = v20;
    }
    __int16 v78 = v21;
    double v22 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    long long v76 = v17;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 136));
      v68 = uint64_t v74 = a4;
      uint64_t v70 = a3 + 1;
      uint64_t v66 = [v7 identifier];
      double v72 = [v7 start];
      uint64_t v23 = [v72 stringFromDate];
      double v24 = +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", [v7 settledState]);
      uint64_t v25 = [v12 count];
      uint64_t v26 = [v78 count];
      *(_DWORD *)buf = 138413826;
      long long v85 = v68;
      __int16 v86 = 2048;
      uint64_t v87 = v70;
      __int16 v88 = 2112;
      uint64_t v89 = v66;
      __int16 v90 = 2112;
      uint64_t v91 = v23;
      double v27 = (void *)v23;
      __int16 v92 = 2112;
      uint64_t v93 = v24;
      __int16 v94 = 2048;
      uint64_t v95 = v25;
      __int16 v96 = 2048;
      uint64_t v97 = v26;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, fingerprint, %lu, identifier, %@, start, %@, settled state, %@, number of accessPoints, %lu, number of locations, %lu", buf, 0x48u);

      id v18 = 0;
      a4 = v74;
    }

    double v13 = v77;
    if (![v12 count])
    {
LABEL_31:

      goto LABEL_32;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v29 = (objc_class *)objc_opt_class();
    id v30 = NSStringFromClass(v29);
    uint64_t v31 = [v28 initWithUseBackgroundTraits:1 analyticsIdentifier:v30];

    uint64_t v32 = *(void *)(a1 + 64);
    double v33 = *(void **)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 40);
    id v79 = 0;
    double v71 = (void *)v31;
    double v35 = [v33 mapItemsFromLocations:v78 accessPoints:v12 startDate:v32 endDate:v34 options:v31 error:&v79];
    id v69 = v79;
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (![*(id *)(a1 + 72) count] && !objc_msgSend(v35, "count")) {
      ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    }
    id v36 = objc_alloc(MEMORY[0x1E4F28C18]);
    BOOL v37 = [v12 firstObject];
    __int16 v38 = [v37 date];
    int v39 = [v12 lastObject];
    [v39 date];
    v40 = double v73 = v35;
    uint64_t v75 = (void *)[v36 initWithStartDate:v38 endDate:v40];

    unint64_t v41 = v73;
    unint64_t v42 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    BOOL v43 = [v12 firstObject];
    id v44 = [v43 date];
    [v42 addObject:v44];

    long long v45 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    __int16 v46 = [v12 lastObject];
    long long v47 = [v46 date];
    [v45 addObject:v47];

    id v18 = 0;
    if ([v73 count])
    {
      uint64_t v48 = [objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:v73 secondObject:v75];
      if (!v48)
      {
        uint64_t v57 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F5CFE8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        unint64_t v83 = @"queryResult was nil";
        __int16 v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        uint64_t v60 = [v57 errorWithDomain:v58 code:0 userInfo:v59];

        id v61 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          uint64_t v65 = NSStringFromSelector(*(SEL *)(a1 + 136));
          *(_DWORD *)buf = 138412546;
          long long v85 = v65;
          __int16 v86 = 2112;
          uint64_t v87 = v60;
          _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        uint64_t v62 = *(void *)(*(void *)(a1 + 120) + 8);
        id v63 = *(void **)(v62 + 40);
        *(void *)(v62 + 40) = v60;

        *a4 = 1;
        id v18 = 0;
        double v13 = v77;
        uint64_t v17 = v76;
        uint64_t v64 = v69;
        goto LABEL_30;
      }
      unint64_t v49 = (void *)v48;
      [*(id *)(a1 + 72) addObject:v48];
      if ([*(id *)(*(void *)(a1 + 32) + 80) earlyStop])
      {
        uint64_t v50 = [v73 objectAtIndex:0];
        unint64_t v51 = [v50 mapItem];
        unint64_t v52 = [v51 extendedAttributes];
        uint64_t v67 = [v52 wifiFingerprintLabelType];

        [v50 confidence];
        double v54 = v53;
        __int16 v55 = *(void **)(*(void *)(a1 + 32) + 80);
        if (v67 == 2) {
          [v55 aoiConfidencePassThroughThreshold];
        }
        else {
          [v55 poiConfidencePassThroughThreshold];
        }
        if (v54 >= v56) {
          *a4 = 1;
        }

        id v18 = 0;
        unint64_t v41 = v73;
      }
    }
    uint64_t v17 = v76;
    uint64_t v64 = v69;
    if (v69) {
      [*(id *)(a1 + 48) addObject:v69];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 1;
    double v13 = v77;
LABEL_30:

    goto LABEL_31;
  }
  [*(id *)(a1 + 48) addObject:v11];
  *a4 = 1;
  id v12 = v10;
LABEL_33:
}

- (id)_computeEarlyStopQueryResultFromResults:(id)a3 originalMaxNumberOfQueries:(unint64_t)a4 aoiConfidencePassThroughThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6
{
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v10 = [v8 count];
  if (v10 >= a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = v10;
  }
  unint64_t v12 = [v8 count];
  if (v12 >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v13)
  {
    unint64_t v32 = v11;
    unint64_t v11 = 1;
    while (1)
    {
      id v14 = [v8 objectAtIndexedSubscript:v11 - 1];
      [v9 addObject:v14];
      uint64_t v15 = [v14 firstObject];
      id v16 = [v15 objectAtIndex:0];

      uint64_t v17 = [v16 mapItem];
      id v18 = [v17 extendedAttributes];
      uint64_t v19 = [v18 wifiFingerprintLabelType];

      [v16 confidence];
      double v21 = v20;
      parameters = self->_parameters;
      if (v19 == 2) {
        [(RTMapItemProviderBluePOIParameters *)parameters aoiConfidencePassThroughThreshold];
      }
      else {
        [(RTMapItemProviderBluePOIParameters *)parameters poiConfidencePassThroughThreshold];
      }
      if (v21 >= v23) {
        break;
      }

      unint64_t v24 = [v8 count];
      if (v24 >= a4) {
        unint64_t v25 = a4;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25 <= v11++)
      {
        unint64_t v11 = v32;
        goto LABEL_19;
      }
    }
    unint64_t v11 = v11;
  }
LABEL_19:
  if ([v9 count])
  {
    double v27 = [(RTMapItemProviderBluePOI *)self bestQueryFromAggregatedQueries:v9 error:0];
    id v28 = objc_alloc(MEMORY[0x1E4F5CE58]);
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F5CE58]);
    double v27 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v29 = [NSNumber numberWithUnsignedInteger:v11];
  id v30 = (void *)[v28 initWithFirstObject:v27 secondObject:v29];

  return v30;
}

- (void)_submitPerformanceMetricsForResults:(id)a3 noFingerprints:(BOOL)a4 originalMaxNumberOfQueries:(unint64_t)a5 aoiConfidencePassThroughThreshold:(double)a6 poiConfidencePassThroughThreshold:(double)a7 fingerprintsCount:(unint64_t)a8 zeroAccessPointsFingerprintsCount:(unint64_t)a9 nonZeroAccessPointsFingerprintsCount:(unint64_t)a10 queryCount:(unint64_t)a11 firstResultQueryCount:(unint64_t)a12 error:(id)a13 visitInterval:(double)a14 visitSource:(int64_t)a15
{
  BOOL v20 = a4;
  id v22 = a3;
  id v23 = a13;
  if (v20)
  {
    unint64_t v24 = 0;
    uint64_t v25 = 1;
  }
  else
  {
    id v41 = (id)a8;
    uint64_t v26 = [(RTMapItemProviderBluePOI *)self _computeEarlyStopQueryResultFromResults:v22 originalMaxNumberOfQueries:a5 aoiConfidencePassThroughThreshold:a6 poiConfidencePassThroughThreshold:a7];
    double v27 = [v26 firstObject];
    id v28 = [MEMORY[0x1E4F1CA98] null];
    if (v27 == v28)
    {
      unint64_t v24 = 0;
    }
    else
    {
      unint64_t v24 = [v26 firstObject];
    }

    uint64_t v29 = [v26 secondObject];
    uint64_t v25 = [v29 unsignedIntegerValue];

    a8 = (unint64_t)v41;
  }
  id v42 = v22;
  if ([v42 count])
  {
    if (v20)
    {
      [v42 firstObject];
      v31 = unint64_t v30 = a8;
      unint64_t v32 = [v31 firstObject];

      id v33 = v42;
      a8 = v30;
    }
    else
    {
      uint64_t v38 = [(RTMapItemProviderBluePOI *)self bestQueryFromAggregatedQueries:v42 error:0];
      id v33 = v42;
      unint64_t v32 = (void *)v38;
    }
    unint64_t v35 = a9;
    unint64_t v34 = a10;
    unint64_t v36 = a12;
    unint64_t v37 = a11;
  }
  else
  {
    unint64_t v32 = 0;
    unint64_t v35 = a9;
    unint64_t v34 = a10;
    unint64_t v36 = a12;
    unint64_t v37 = a11;
    id v33 = v42;
  }
  +[RTMapItemProviderBluePOIPerformanceMetrics submitMetricsWithNonZeroAccessPointsFingerprintsCount:v34 zeroAccessPointsFingerprintsCount:v35 fingerprintsCount:a8 queryCount:v37 firstResultQueryCount:v36 results:v33 earlyStopQueryCount:a14 earlyStopQueryResult:v25 bestQueryResult:v24 error:v32 visitInterval:v23 visitSource:a15];
}

- (BOOL)_hasMapItemInQueryResult:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) mapItem:v15];
        unint64_t v11 = [v10 extendedAttributes];
        uint64_t v12 = [v11 wifiFingerprintLabelType];

        if (v12 == a4)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (id)_adjustConfidencesOfTheSelectedResult:(id)a3 allQueryResults:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(RTMapItemProviderBluePOI *)self _hasMapItemInQueryResult:v7 wifiFingerprintLabelType:2])
  {
    __int16 v59 = v7;
    +[RTMapItemProviderBluePOIPerformanceMetrics _mapItemDictionaryforResults:v8 wifiFingerprintLabelType:1];
    v58 = id v57 = v8;
    +[RTMapItemProviderBluePOIPerformanceMetrics _mapItemDictionaryforResults:v8 wifiFingerprintLabelType:2];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v62 = v72 = 0u;
    uint64_t v9 = [v62 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      id v63 = 0;
      uint64_t v13 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          long long v16 = [v62 objectForKeyedSubscript:v15];
          unint64_t v17 = [v16 count];

          if (v12 < v17)
          {
            id v18 = v15;

            unint64_t v12 = v17;
            id v63 = v18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
      id v63 = 0;
    }

    uint64_t v20 = [(RTMapItemProviderBluePOI *)self _confidenceCoefficientsForAOI:v63 AOIOccurenceCount:v12 POIResults:v58];
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      unint64_t v24 = NSStringFromSelector(a2);
      uint64_t v25 = [v63 unsignedIntegerValue];
      *(_DWORD *)buf = 138413058;
      uint64_t v75 = v23;
      __int16 v76 = 2112;
      id v77 = v24;
      __int16 v78 = 2048;
      uint64_t v79 = v25;
      __int16 v80 = 2048;
      double v81 = *(double *)&v12;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, AOI MUID with the largest number of occuraces, %lu, largest number of occurances, %lu.", buf, 0x2Au);
    }
    [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v59 count]];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v26 = v59;
    uint64_t v64 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v64)
    {
      uint64_t v61 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v64; ++j)
        {
          if (*(void *)v66 != v61) {
            objc_enumerationMutation(v26);
          }
          id v28 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          uint64_t v29 = [v28 mapItem];
          unint64_t v30 = [v29 extendedAttributes];
          uint64_t v31 = [v30 wifiFingerprintLabelType];

          if (v31 == 1)
          {
            unint64_t v32 = NSNumber;
            id v33 = [v28 mapItem];
            unint64_t v34 = [v32 numberWithUnsignedInteger:[v33 muid]];

            [v28 confidence];
            double v36 = v35;
            unint64_t v37 = [v20 objectForKeyedSubscript:v34];
            [v37 doubleValue];
            double v39 = v36 * v38;

            BOOL v40 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              id v41 = (objc_class *)objc_opt_class();
              id v42 = NSStringFromClass(v41);
              NSStringFromSelector(a2);
              uint64_t v60 = v34;
              id v43 = v26;
              id v44 = v19;
              long long v45 = v20;
              __int16 v46 = self;
              v48 = long long v47 = a2;
              *(_DWORD *)buf = 138413058;
              uint64_t v75 = v42;
              __int16 v76 = 2112;
              id v77 = v48;
              __int16 v78 = 2112;
              uint64_t v79 = (uint64_t)v28;
              __int16 v80 = 2048;
              double v81 = v39;
              _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "%@, %@, confidence for map item, %@, was changed to, %f.", buf, 0x2Au);

              a2 = v47;
              self = v46;
              uint64_t v20 = v45;
              id v19 = v44;
              id v26 = v43;
              unint64_t v34 = v60;
            }
            id v49 = objc_alloc(MEMORY[0x1E4F5CDF8]);
            uint64_t v50 = [v28 mapItem];
            unint64_t v51 = [v49 initWithMapItem:v50 source:[v28 source] confidence:v39];

            [v19 addObject:v51];
          }
          else
          {
            unint64_t v52 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              double v53 = (objc_class *)objc_opt_class();
              double v54 = NSStringFromClass(v53);
              __int16 v55 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              uint64_t v75 = v54;
              __int16 v76 = 2112;
              id v77 = v55;
              __int16 v78 = 2112;
              uint64_t v79 = (uint64_t)v28;
              _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, confidence for map item, %@, remains unchanged.", buf, 0x20u);
            }
            [v19 addObject:v28];
          }
        }
        uint64_t v64 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v64);
    }

    id v7 = v59;
    id v8 = v57;
  }
  else
  {
    id v19 = v7;
  }

  return v19;
}

- (id)_confidenceCoefficientsForAOI:(id)a3 AOIOccurenceCount:(unint64_t)a4 POIResults:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v6 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = (double)a4;
    uint64_t v12 = *(void *)v21;
    double v13 = (double)a4 * 0.5;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = [v6 objectForKeyedSubscript:v15];
        unint64_t v17 = [v16 count];

        if (v13 >= (double)v17)
        {
          id v18 = [NSNumber numberWithDouble:(double)v17 / v11];
          [v7 setObject:v18 forKeyedSubscript:v15];
        }
        else
        {
          [v7 setObject:&unk_1F3453698 forKeyedSubscript:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)filterByDistance:(id)a3 location:(id)a4 thresholdForUnknownLabel:(double)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([v10 count])
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v10 count]];
    double v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_223];
    id v14 = [v10 filteredArrayUsingPredicate:v13];

    [(RTMapItemProviderBluePOIParameters *)self->_parameters aoiDistanceThreshold];
    id v35 = 0;
    uint64_t v15 = -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v14, v11, 0x4000, &v35);
    id v16 = v35;

    if (v16)
    {
      if (a6)
      {
        id v16 = v16;
        id v17 = 0;
        *a6 = v16;
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      if ([v15 count]) {
        [v12 addObjectsFromArray:v15];
      }
      unint64_t v32 = v12;
      id v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_225];
      id v19 = [v10 filteredArrayUsingPredicate:v18];

      [(RTMapItemProviderBluePOIParameters *)self->_parameters poiDistanceThreshold];
      id v34 = 0;
      long long v20 = -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v19, v11, 0x4000, &v34);
      id v16 = v34;

      if (v16)
      {
        if (a6)
        {
          id v16 = v16;
          id v17 = 0;
          *a6 = v16;
        }
        else
        {
          id v17 = 0;
        }
      }
      else
      {
        if ([v20 count]) {
          [v32 addObjectsFromArray:v20];
        }
        long long v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_227];
        long long v22 = [v10 filteredArrayUsingPredicate:v21];

        id v33 = 0;
        long long v23 = [(RTMapItemProviderBase *)self filterInferredMapItems:v22 byDistance:v11 fromLocation:0x4000 andAppendSource:&v33 error:a5];
        id v16 = v33;

        if (v16)
        {
          id v17 = 0;
          if (a6) {
            *a6 = v16;
          }
        }
        else
        {
          if ([v23 count])
          {
            unint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v26 = (objc_class *)objc_opt_class();
              double v27 = NSStringFromClass(v26);
              uint64_t v31 = [v23 firstObject];
              id v28 = [v31 mapItem];
              uint64_t v29 = [v28 extendedAttributes];
              uint64_t v30 = [v29 wifiFingerprintLabelType];
              *(_DWORD *)buf = 138412546;
              unint64_t v37 = v27;
              __int16 v38 = 2048;
              uint64_t v39 = v30;
              _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, unknown label type, %ld", buf, 0x16u);
            }
            [v32 addObjectsFromArray:v23];
          }
          id v17 = v32;
        }
      }
      uint64_t v12 = v32;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mapItem];
  id v3 = [v2 extendedAttributes];
  BOOL v4 = [v3 wifiFingerprintLabelType] == 2;

  return v4;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mapItem];
  id v3 = [v2 extendedAttributes];
  BOOL v4 = [v3 wifiFingerprintLabelType] == 1;

  return v4;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 mapItem];
  BOOL v4 = [v3 extendedAttributes];
  if ([v4 wifiFingerprintLabelType] == 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v2 mapItem];
    id v7 = [v6 extendedAttributes];
    BOOL v5 = [v7 wifiFingerprintLabelType] != 2;
  }
  return v5;
}

- (id)_filterByConfidence:(id)a3 aoiConfidencePassThroughThreshold:(double)a4 aoiConfidenceConsiderThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6 poiConfidenceConsiderThreshold:(double)a7 error:(id *)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if ([v12 count])
  {
    id v39 = v12;
    id v40 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v12 count]];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (!v14) {
      goto LABEL_27;
    }
    uint64_t v15 = v14;
    uint64_t v41 = 0;
    uint64_t v16 = *(void *)v44;
    char v17 = 1;
    char v18 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v21 = [v20 mapItem];
        long long v22 = [v21 extendedAttributes];
        uint64_t v23 = [v22 wifiFingerprintLabelType];

        if (v23 == 2)
        {
          if (v18)
          {
            [v20 confidence];
            if (v24 < a4) {
              goto LABEL_19;
            }
            LOBYTE(v41) = 1;
            double v25 = a4;
          }
          else
          {
            if ((v41 & 1) == 0) {
              goto LABEL_19;
            }
            [v20 confidence];
            if (v27 < a5) {
              goto LABEL_19;
            }
            LOBYTE(v41) = 1;
            double v25 = a5;
          }
        }
        else if (v17)
        {
          [v20 confidence];
          if (v26 < a6) {
            goto LABEL_19;
          }
          BYTE4(v41) = 1;
          double v25 = a6;
        }
        else
        {
          if ((v41 & 0x100000000) == 0 || ([v20 confidence], v28 < a7))
          {
LABEL_19:
            uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
            uint64_t v30 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v48 = v30;
            __int16 v49 = 2048;
            double v50 = a4;
            __int16 v51 = 2112;
            unint64_t v52 = v20;
            uint64_t v31 = v29;
            unint64_t v32 = "%@, filtered mapItem by confidence %0.2f, %@";
            goto LABEL_24;
          }
          BYTE4(v41) = 1;
          double v25 = a7;
        }
        [v40 addObject:v20];
        uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        uint64_t v30 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v48 = v30;
        __int16 v49 = 2048;
        double v50 = v25;
        __int16 v51 = 2112;
        unint64_t v52 = v20;
        uint64_t v31 = v29;
        unint64_t v32 = "%@, passed mapItem by confidence %0.2f, %@";
LABEL_24:
        _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, v32, buf, 0x20u);

LABEL_25:
        id v33 = [v20 mapItem];
        id v34 = [v33 extendedAttributes];
        uint64_t v35 = [v34 wifiFingerprintLabelType];
        BOOL v36 = v35 != 2;
        BOOL v37 = v35 == 2;

        v17 &= v37;
        v18 &= v36;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (!v15)
      {
LABEL_27:

        id v12 = v39;
        goto LABEL_29;
      }
    }
  }
  id v40 = 0;
LABEL_29:

  return v40;
}

- (id)poiHarvestForFingerprint:(id)a3 mapItem:(id)a4 referenceLocation:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v36 = 0;
  uint64_t v14 = [(RTMapItemProviderBluePOI *)self accessPointsForFingerprint:a3 endDate:a6 error:&v36];
  id v15 = v36;
  uint64_t v16 = v15;
  if (v15)
  {
    if (a7)
    {
      char v17 = 0;
      *a7 = v15;
      goto LABEL_21;
    }
    goto LABEL_8;
  }
  if (![v14 count])
  {
LABEL_8:
    char v17 = 0;
    goto LABEL_21;
  }
  id v35 = 0;
  char v18 = [(RTMapItemProviderBluePOI *)self locationsForAccessPoints:v14 error:&v35];
  id v19 = v35;
  long long v20 = v19;
  if (v19)
  {
    char v17 = 0;
    if (a7) {
      *a7 = v19;
    }
  }
  else
  {
    id v33 = [v18 firstObject];
    long long v21 = [v33 date];
    unint64_t v32 = v18;
    long long v22 = [v18 lastObject];
    uint64_t v23 = [v22 date];
    id v34 = 0;
    uint64_t v30 = [(RTMapItemProviderBluePOI *)self motionActivitesFrom:v21 to:v23 error:&v34];
    id v24 = v34;

    if (v24)
    {
      char v17 = 0;
      if (a7) {
        *a7 = v24;
      }
      double v28 = (void *)v30;
      char v18 = v32;
    }
    else
    {
      double v25 = [MEMORY[0x1E4F1CA48] array];
      double v26 = v25;
      if (v13) {
        [v25 addObject:v13];
      }
      char v18 = v32;
      uint64_t v27 = [v32 count:v30];
      double v28 = v31;
      if (v27) {
        [v26 addObjectsFromArray:v32];
      }
      char v17 = (void *)[objc_alloc(MEMORY[0x1E4F5C288]) initWithMapItem:v12 accessPoints:v14 locations:v26 motionActivities:v31];
    }
  }

LABEL_21:

  return v17;
}

- (BOOL)submitHarvest:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v34 = 0;
    id v35 = (id *)&v34;
    uint64_t v36 = 0x3032000000;
    BOOL v37 = __Block_byref_object_copy__31;
    __int16 v38 = __Block_byref_object_dispose__31;
    id v39 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [(RTMapItemProviderBluePOI *)self locationManager];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __48__RTMapItemProviderBluePOI_submitHarvest_error___block_invoke;
    v31[3] = &unk_1E6B90728;
    id v33 = &v34;
    uint64_t v9 = v7;
    unint64_t v32 = v9;
    [v8 submitHarvestSample:v6 handler:v31];

    id v10 = v9;
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v12)) {
      goto LABEL_7;
    }
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSinceDate:v11];
    double v15 = v14;
    uint64_t v16 = objc_opt_new();
    char v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_413];
    char v18 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v19 = [v18 filteredArrayUsingPredicate:v17];
    long long v20 = [v19 firstObject];

    [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
    long long v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    long long v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v42 count:1];
    id v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

    if (v24)
    {
      id v25 = v24;

      char v26 = 0;
    }
    else
    {
LABEL_7:
      id v25 = 0;
      char v26 = 1;
    }

    id v27 = v25;
    if ((v26 & 1) == 0) {
      objc_storeStrong(v35 + 5, v25);
    }
    if (a4) {
      *a4 = v35[5];
    }
    LOBYTE(a4) = v35[5] == 0;

    _Block_object_dispose(&v34, 8);
  }
  else if (a4)
  {
    double v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    uint64_t v41 = @"requires a valid poiHarvest.";
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    *a4 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v29];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

void __48__RTMapItemProviderBluePOI_submitHarvest_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int)harvestTypeToPoiTriggerType:(unint64_t)a3
{
  if (a3 == 2) {
    int v3 = 4;
  }
  else {
    int v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (id)harvestTypeToString:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E6B93AA8[a3];
  }
}

- (BOOL)harvestVisits:(id)a3 mapItem:(id)a4 harvestType:(unint64_t)a5 error:(id *)a6
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 count] && objc_msgSend(v10, "validMUID"))
  {
    long long v66 = (void *)[v10 copy];
    if (v66)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v11 = v9;
      uint64_t v56 = [v11 countByEnumeratingWithState:&v80 objects:v95 count:16];
      if (v56)
      {
        uint64_t v12 = *(void *)v81;
        id v58 = v10;
        id v59 = v9;
        id v57 = a6;
        uint64_t v60 = v11;
        uint64_t v55 = *(void *)v81;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v81 != v12) {
              objc_enumerationMutation(v11);
            }
            uint64_t v61 = v13;
            double v14 = *(void **)(*((void *)&v80 + 1) + 8 * v13);
            if (a5 != 1
              || ![v14 placeSource]
              || (uint64_t v15 = [v14 placeSource],
                  ([(RTMapItemProviderBluePOIParameters *)self->_parameters harvestMask] & v15) != 0))
            {
              char v79 = 0;
              uint64_t v16 = [v14 entryDate];
              char v17 = [v14 exitDate];
              id v78 = 0;
              char v18 = [(RTMapItemProviderBluePOI *)self fingerprintsBetweenStartDate:v16 endDate:v17 isTimeWindowFallback:&v79 settledState:2 error:&v78];
              id v19 = v78;

              if (v19)
              {
                if (a6) {
                  *a6 = v19;
                }

                BOOL v48 = 0;
LABEL_41:
                id v11 = v60;
                goto LABEL_43;
              }
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              obuint64_t j = v18;
              uint64_t v65 = [obj countByEnumeratingWithState:&v74 objects:v94 count:16];
              if (v65)
              {
                uint64_t v64 = *(void *)v75;
                while (2)
                {
                  uint64_t v20 = 0;
                  do
                  {
                    if (*(void *)v75 != v64) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v68 = v20;
                    long long v69 = *(void **)(*((void *)&v74 + 1) + 8 * v20);
                    context = (void *)MEMORY[0x1E016D870]();
                    id v21 = objc_alloc(MEMORY[0x1E4F5CE00]);
                    long long v70 = [v14 location];
                    long long v22 = [v70 location];
                    [v22 latitude];
                    double v24 = v23;
                    id v25 = [v14 location];
                    char v26 = [v25 location];
                    [v26 longitude];
                    double v28 = v27;
                    uint64_t v29 = [v14 location];
                    uint64_t v30 = [v29 location];
                    [v30 horizontalUncertainty];
                    double v32 = v31;
                    id v33 = [v14 entryDate];
                    uint64_t v34 = [v14 location];
                    id v35 = [v34 location];
                    uint64_t v36 = [v21 initWithLatitude:v33 longitude:objc_msgSend(v35, "referenceFrame") horizontalUncertainty:v24 date:v28 referenceFrame:v32];

                    [v66 setSource:[v14 placeSource]];
                    BOOL v37 = [v14 exitDate];
                    id v73 = 0;
                    __int16 v38 = [(RTMapItemProviderBluePOI *)self poiHarvestForFingerprint:v69 mapItem:v66 referenceLocation:v36 endDate:v37 error:&v73];
                    id v39 = v73;

                    if (v39)
                    {
                      id v40 = v39;
                    }
                    else if (v38)
                    {
                      uint64_t v41 = +[RTMapItemProviderBluePOI harvestTypeToPoiTriggerType:a5];
                      uint64_t v42 = [v38 triggerEvent];
                      [v42 setTriggerType:v41];

                      id v72 = 0;
                      [(RTMapItemProviderBluePOI *)self submitHarvest:v38 error:&v72];
                      id v40 = v72;
                      long long v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v44 = [v38 triggerEvent];
                        int v45 = [v44 triggerType];
                        long long v46 = +[RTMapItemProviderBluePOI harvestTypeToString:a5];
                        *(_DWORD *)buf = 138413314;
                        long long v85 = v69;
                        __int16 v86 = 2112;
                        id v87 = v38;
                        __int16 v88 = 1024;
                        int v89 = v45;
                        __int16 v90 = 2112;
                        uint64_t v91 = v46;
                        __int16 v92 = 2112;
                        id v93 = v40;
                        _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "harvested fingerprint, %@, poiHarvest, %@, triggerType, %d, harvestType, %@, error, %@", buf, 0x30u);
                      }
                    }
                    else
                    {
                      id v40 = 0;
                    }

                    if (v40)
                    {
                      if (v57) {
                        *id v57 = v40;
                      }

                      BOOL v48 = 0;
                      id v10 = v58;
                      id v9 = v59;
                      goto LABEL_41;
                    }
                    uint64_t v20 = v68 + 1;
                  }
                  while (v65 != v68 + 1);
                  uint64_t v65 = [obj countByEnumeratingWithState:&v74 objects:v94 count:16];
                  if (v65) {
                    continue;
                  }
                  break;
                }
              }

              id v10 = v58;
              id v9 = v59;
              a6 = v57;
              id v11 = v60;
            }
            uint64_t v13 = v61 + 1;
            uint64_t v12 = v55;
          }
          while (v61 + 1 != v56);
          uint64_t v47 = [v11 countByEnumeratingWithState:&v80 objects:v95 count:16];
          uint64_t v12 = v55;
          BOOL v48 = 1;
          uint64_t v56 = v47;
          if (v47) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v48 = 1;
      }
    }
    else
    {
      if (a6)
      {
        __int16 v49 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F5CFE8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        __int16 v51 = [NSString stringWithFormat:@"Failed to copy %@", v10];
        v97[0] = v51;
        unint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:&v96 count:1];
        *a6 = [v49 errorWithDomain:v50 code:0 userInfo:v52];
      }
      id v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        long long v85 = v54;
        __int16 v86 = 2112;
        id v87 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, Failed to copy %@", buf, 0x16u);
      }
      BOOL v48 = 0;
    }
LABEL_43:
  }
  else
  {
    BOOL v48 = 1;
  }

  return v48;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 endDate];
  dispatch_semaphore_t v7 = [v5 startDate];

  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  [(RTMapItemProviderBluePOIParameters *)self->_parameters minVisitLength];
  return v9 <= v10;
}

- (RTInferredMapItemDeduper)inferredMapItemDeduper
{
  return self->_inferredMapItemDeduper;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void)setPlaceInferenceQueryStore:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTMapItemProviderBluePOIParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);

  objc_storeStrong((id *)&self->_inferredMapItemDeduper, 0);
}

@end