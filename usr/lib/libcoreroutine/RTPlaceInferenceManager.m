@interface RTPlaceInferenceManager
+ (int64_t)periodicPurgePolicy;
+ (unint64_t)learnedPlaceTypeFromLocationOfInterestType:(int64_t)a3;
+ (unint64_t)learnedPlaceTypeFromUserSpecificPlaceType:(unint64_t)a3;
+ (unint64_t)learnedPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3;
+ (unint64_t)learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:(unint64_t)a3;
+ (unint64_t)userSpecificPlaceTypeFromLearnedPlaceType:(unint64_t)a3;
+ (unint64_t)userSpecificPlaceTypeFromLocationOfInterestType:(int64_t)a3;
+ (unint64_t)userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:(unint64_t)a3;
+ (unint64_t)userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3;
+ (void)sanityCheckMapItemProviders:(id)a3;
- (BOOL)_inferUserSpecificPlaceTypeForInferredMapItem:(id)a3 userSpecificPlaceType:(unint64_t *)a4 userSpecificPlaceTypeSource:(unint64_t *)a5 error:(id *)a6;
- (BOOL)_learnedPlaceTypeForInferredMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6;
- (BOOL)_savePlaceInferenceQueriesFromInferredMapItems:(id)a3 inferenceErrorCode:(int64_t)a4 referenceLocation:(id)a5 options:(id)a6 outError:(id *)a7;
- (NSDate)visitEntryTime;
- (NSDictionary)mapItemProviders;
- (NSMutableArray)cachedLocations;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTInferredMapItemFuser)inferredMapItemFuser;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationManager)locationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTMetricManager)metricManager;
- (RTPlaceInferenceDailyMetrics)dailyMetrics;
- (RTPlaceInferenceManager)init;
- (RTPlaceInferenceManager)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 eventManager:(id)a6 fingerprintManager:(id)a7 inferredMapItemFuser:(id)a8 learnedLocationStore:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 mapsSupportManager:(id)a12 metricManager:(id)a13 motionActivityManager:(id)a14 placeInferenceQueryStore:(id)a15 platform:(id)a16 portraitManager:(id)a17 visitStore:(id)a18;
- (RTPlaceInferenceQueryStore)placeInferenceQueryStore;
- (RTVisitManager)visitManager;
- (RTVisitStore)visitStore;
- (id)_closestCachedLocationForLocation:(id)a3;
- (id)_estimatedLocationFromSortedLocations:(id)a3;
- (id)_getFallbackMapItemProviderForOptions:(id)a3;
- (id)_loiIdentifierForInferredMapItem:(id)a3;
- (id)_placeInferenceFromInferredMapItem:(id)a3 referenceLocation:(id)a4 error:(id *)a5;
- (id)_placeInferencesForOptions:(id)a3 error:(id *)a4;
- (id)_selectBestCandidateAndUpdateReferenceLocation:(id)a3;
- (id)_selectLastLocationFromLocations:(id)a3 maxHorizontalUncertainty:(double)a4;
- (id)_selectMapItemProvidersForOptions:(id)a3;
- (id)_selectMapItemProvidersForOptions:(id)a3 targetProvider:(unint64_t)a4;
- (id)createAllMapItemProvidersWithDefaultManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 fingerprintManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 portraitManager:(id)a13 visitStore:(id)a14;
- (unint64_t)_getMappingIndexForClientIdentifier:(id)a3;
- (unint64_t)cachedLocationIndex;
- (unint64_t)clientMappingIndex;
- (unint64_t)placeInferencesLimit;
- (void)_addMapItemProviderFromArray:(id)a3 toSet:(id)a4;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_onPointOfInterestVisitNotification:(id)a3;
- (void)_onVisitManagerVisitIncidentNotification:(id)a3;
- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)_registerForDailyMetricsNotifications;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unRegisterForDailyMetricsNotifications;
- (void)_updateCachedLocationsWithLocation:(id)a3;
- (void)fetchPlaceInferencesForOptions:(id)a3 handler:(id)a4;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onPointOfInterestVisitNotification:(id)a3;
- (void)onVisitManagerVisitIncidentNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)sendPlaceInferenceMetrics:(id)a3 inferredMapItems:(id)a4 fusedMapItems:(id)a5 fallbackInferredMapItems:(id)a6 finalPlaceInferences:(id)a7 referenceLocation:(id)a8;
- (void)setClientMappingIndex:(unint64_t)a3;
- (void)setDailyMetrics:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setPlaceInferencesLimit:(unint64_t)a3;
- (void)setVisitEntryTime:(id)a3;
- (void)setVisitManager:(id)a3;
@end

@implementation RTPlaceInferenceManager

void __60__RTPlaceInferenceManager__loiIdentifierForInferredMapItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55__RTPlaceInferenceManager_sanityCheckMapItemProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [v5 isMemberOfClass:objc_opt_class()];
  if (a3 && v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v13 = 138412802;
      v14 = v10;
      __int16 v15 = 2080;
      v16 = "+[RTPlaceInferenceManager sanityCheckMapItemProviders:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 1087;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "the first mapItem provider must be %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }
  }
  if ([v5 isMemberOfClass:objc_opt_class()]
    && [*(id *)(a1 + 32) count] - 1 != a3)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v13 = 138412802;
      v14 = v12;
      __int16 v15 = 2080;
      v16 = "+[RTPlaceInferenceManager sanityCheckMapItemProviders:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 1093;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "the last mapItem provider must be %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

void __66__RTPlaceInferenceManager_fetchPlaceInferencesForOptions_handler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  v4 = [v2 _placeInferencesForOptions:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();
}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_207(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = 0;
  v8 = [v6 _placeInferenceFromInferredMapItem:a2 referenceLocation:v7 error:&v10];
  id v9 = v10;
  [*(id *)(a1 + 48) addObject:v8];
  if (v9) {
    [*(id *)(a1 + 56) addObject:v9];
  }
  if ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 64)) {
    *a4 = 1;
  }
}

- (id)_placeInferenceFromInferredMapItem:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    id v26 = 0;
    BOOL v11 = [(RTPlaceInferenceManager *)self _inferUserSpecificPlaceTypeForInferredMapItem:v9 userSpecificPlaceType:&v28 userSpecificPlaceTypeSource:&v27 error:&v26];
    id v12 = v26;
    if (!v11)
    {
      int v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v30 = v25;
        __int16 v31 = 2112;
        id v32 = v9;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, failed to infer user specific place type for inferredMapItem, %@ error, %@", buf, 0x20u);
      }
      if (a5) {
        *a5 = v12;
      }
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    v14 = [(RTPlaceInferenceManager *)self _loiIdentifierForInferredMapItem:v9];
    __int16 v15 = (void *)MEMORY[0x1E4F5CE70];
    v16 = [v9 mapItem];
    uint64_t v17 = [v15 placeInferencePlaceTypeFromMapItem:v16 userType:0 source:[v9 source]];

    id v18 = objc_alloc(MEMORY[0x1E4F5CE70]);
    uint64_t v19 = [v9 mapItem];
    uint64_t v21 = v27;
    uint64_t v20 = v28;
    [v9 confidence];
    v22 = [v18 initWithMapItem:v19 userType:v20 userTypeSource:v21 placeType:v17 confidence:v10 loiIdentifier:v14];
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (BOOL)_inferUserSpecificPlaceTypeForInferredMapItem:(id)a3 userSpecificPlaceType:(unint64_t *)a4 userSpecificPlaceTypeSource:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    if (!a6) {
      goto LABEL_19;
    }
    uint64_t v17 = @"inferredMapItem";
    goto LABEL_18;
  }
  if (!a4)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userSpecificPlaceType", buf, 2u);
    }

    if (!a6) {
      goto LABEL_19;
    }
    uint64_t v17 = @"userSpecificPlaceType";
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v17);
    char v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!a5)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userSpecificPlaceTypeSource", buf, 2u);
    }

    if (a6)
    {
      uint64_t v17 = @"userSpecificPlaceTypeSource";
      goto LABEL_18;
    }
LABEL_19:
    char v13 = 0;
    goto LABEL_24;
  }
  uint64_t v22 = 0;
  *(void *)buf = 0;
  BOOL v11 = [(RTPlaceInferenceManager *)self learnedLocationStore];
  id v12 = [v10 mapItem];
  id v21 = 0;
  char v13 = [v11 placeTypeForMapItem:v12 placeType:buf placeTypeSource:&v22 error:&v21];
  id v14 = v21;

  if (v13)
  {
    *a4 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:*(void *)buf];
    unint64_t v15 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:v22];
  }
  else
  {
    if (a6) {
      *a6 = v14;
    }
    unint64_t v15 = 0;
    *a4 = 0;
  }
  *a5 = v15;

LABEL_24:
  return v13;
}

- (id)_loiIdentifierForInferredMapItem:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = (id *)&v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  id v43 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [(RTPlaceInferenceManager *)self learnedLocationStore];
  v8 = [v5 mapItem];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__RTPlaceInferenceManager__loiIdentifierForInferredMapItem___block_invoke;
  v34[3] = &unk_1E6B90B28;
  v36 = &v44;
  v37 = &v38;
  id v9 = v6;
  uint64_t v35 = v9;
  [v7 fetchLocationOfInterestWithMapItem:v8 handler:v34];

  id v10 = v9;
  BOOL v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_6;
  }
  char v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  v16 = objc_opt_new();
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
  id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v19 = [v18 filteredArrayUsingPredicate:v17];
  uint64_t v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  v53[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v53 count:1];
  v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_6:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v39 + 5, v25);
  }
  if (!v39[5]) {
    goto LABEL_14;
  }
  uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v32 = NSStringFromSelector(a2);
    id v33 = v39[5];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v32;
    __int16 v51 = 2112;
    id v52 = v33;
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
  }
  if (v39[5]) {
    v29 = 0;
  }
  else {
LABEL_14:
  }
    v29 = (void *)v45[5];
  id v30 = v29;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

+ (unint64_t)userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)userSpecificPlaceTypeFromLearnedPlaceType:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (id)_getFallbackMapItemProviderForOptions:(id)a3
{
  id v4 = a3;
  if (([v4 fidelityPolicy] & 4) != 0)
  {
    dispatch_semaphore_t v6 = [(RTPlaceInferenceManager *)self _selectMapItemProvidersForOptions:v4 targetProvider:7];
    if ([v6 count])
    {
      id v5 = [v6 firstObject];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_placeInferencesForOptions:(id)a3 error:(id *)a4
{
  v165[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 locations];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPlaceInferenceManager _placeInferencesForOptions:error:]";
      __int16 v160 = 1024;
      LODWORD(v161) = 453;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options.locations.count (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = [v6 locations];
  uint64_t v11 = [v10 count];

  dispatch_time_t v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  char v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v14 = NSStringFromSelector(a2);
      uint64_t v15 = [v6 fidelityPolicy];
      v16 = [v6 locations];
      uint64_t v17 = [v16 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v160 = 2048;
      uint64_t v161 = v15;
      __int16 v162 = 2048;
      uint64_t v163 = v17;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, fidelity policy, %lu, location count, %lu", buf, 0x20u);
    }
    id v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
    uint64_t v19 = [v6 locations];
    v158 = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v158 count:1];
    id v21 = [v19 sortedArrayUsingDescriptors:v20];

    v132 = v21;
    uint64_t v22 = [(RTPlaceInferenceManager *)self _selectLastLocationFromLocations:v21 maxHorizontalUncertainty:250.0];
    if (v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        v153[0] = MEMORY[0x1E4F143A8];
        v153[1] = 3221225472;
        v153[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke;
        v153[3] = &__block_descriptor_40_e27_v32__0__CLLocation_8Q16_B24l;
        v153[4] = a2;
        [v21 enumerateObjectsUsingBlock:v153];
      }
      id v134 = v22;
      if (([v6 fidelityPolicy] & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) != 0)
      {
        uint64_t v23 = [(RTPlaceInferenceManager *)self _estimatedLocationFromSortedLocations:v21];

        [(RTPlaceInferenceManager *)self _updateCachedLocationsWithLocation:v23];
        id v134 = (id)v23;
      }
      if (([v6 fidelityPolicy] & 0x10) != 0)
      {
        if (([v6 fidelityPolicy] & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) == 0)
        {
          uint64_t v38 = [(RTPlaceInferenceManager *)self _closestCachedLocationForLocation:v134];

          id v134 = (id)v38;
        }
        uint64_t v39 = [objc_alloc(MEMORY[0x1E4F5CE70]) initWithMapItem:0 finerGranularityMapItem:0 userType:0 userTypeSource:0 placeType:0 referenceLocation:v134 confidence:0.0 finerGranularityMapItemConfidence:0.0 loiIdentifier:0 preferredName:0];
        v37 = (void *)v39;
        if (v39)
        {
          uint64_t v155 = v39;
          id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
        }
        else
        {
          id v33 = 0;
        }
      }
      else
      {
        uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
        v126 = [MEMORY[0x1E4F1CA48] array];
        char v26 = [v132 firstObject];
        v131 = [v26 timestamp];

        id v27 = [v132 lastObject];
        v130 = [v27 timestamp];

        uint64_t v28 = [(RTPlaceInferenceManager *)self placeInferencesLimit];
        if ([v6 limit] >= 1) {
          uint64_t v28 = [v6 limit];
        }
        uint64_t v129 = v28;
        context = (void *)MEMORY[0x1E016D870]();
        v29 = [v6 clientIdentifier];
        v128 = (void *)v24;
        v120 = v22;
        if (v29)
        {
          id v30 = [v6 clientIdentifier];
        }
        else
        {
          id v30 = @"unknown";
        }
        v121 = v18;
        v122 = (void *)v25;
        v123 = a4;

        v117 = [[RTPlaceInferenceMetrics alloc] initWithClientIdentifier:v30 placeInferenceOptions:v6];
        v118 = v30;
        self->_clientMappingIndex = [(RTPlaceInferenceManager *)self _getMappingIndexForClientIdentifier:v30];
        uint64_t v40 = [(RTPlaceInferenceManager *)self _selectMapItemProvidersForOptions:v6];
        v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = [v6 fidelityPolicy];
          uint64_t v43 = [v40 count];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v42;
          __int16 v160 = 2048;
          uint64_t v161 = v43;
          _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "fidelity policy %lu has %lu providers", buf, 0x16u);
        }

        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        id obj = v40;
        uint64_t v44 = [obj countByEnumeratingWithState:&v149 objects:v154 count:16];
        id v133 = v6;
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v150;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v150 != v46) {
                objc_enumerationMutation(obj);
              }
              v48 = *(void **)(*((void *)&v149 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || ![v128 count])
              {
                id v49 = objc_alloc(MEMORY[0x1E4F5CE78]);
                uint64_t v50 = [v6 fidelityPolicy];
                __int16 v51 = [v6 accessPoints];
                id v52 = [v6 clientIdentifier];
                LOBYTE(v116) = 0;
                v53 = (void *)[v49 initWithFidelityPolicy:v50 locations:v132 accessPoints:v51 distance:v134 location:v131 startDate:v130 endDate:50.0 limit:v129 useBackground:v116 clientIdentifier:v52];

                id v148 = 0;
                v54 = [v48 mapItemsWithOptions:v53 error:&v148];
                id v55 = v148;
                v56 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  v57 = (objc_class *)objc_opt_class();
                  v58 = NSStringFromClass(v57);
                  uint64_t v59 = [v54 count];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v58;
                  __int16 v160 = 2048;
                  uint64_t v161 = v59;
                  __int16 v162 = 2112;
                  uint64_t v163 = (uint64_t)v55;
                  _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v60 = [v55 code];
                  id v147 = 0;
                  [(RTPlaceInferenceManager *)self _savePlaceInferenceQueriesFromInferredMapItems:v54 inferenceErrorCode:v60 referenceLocation:v134 options:v133 outError:&v147];
                  id v61 = v147;
                  if (v61)
                  {
                    v62 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      v67 = (objc_class *)objc_opt_class();
                      v124 = NSStringFromClass(v67);
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v124;
                      __int16 v160 = 2112;
                      uint64_t v161 = (uint64_t)v61;
                      _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "%@, saving BluePOI queries hits error, %@", buf, 0x16u);
                    }
                  }
                }
                if (v55)
                {
                  [v126 addObject:v55];
                  v63 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    v64 = (objc_class *)objc_opt_class();
                    v65 = NSStringFromClass(v64);
                    uint64_t v66 = [v54 count];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v65;
                    __int16 v160 = 2048;
                    uint64_t v161 = v66;
                    __int16 v162 = 2112;
                    uint64_t v163 = (uint64_t)v55;
                    _os_log_debug_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_DEBUG, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);
                  }
                }
                else if ([v54 count])
                {
                  [v128 addObjectsFromArray:v54];
                }

                id v6 = v133;
              }
            }
            uint64_t v45 = [obj countByEnumeratingWithState:&v149 objects:v154 count:16];
          }
          while (v45);
        }

        uint64_t v68 = [v6 fidelityPolicy];
        BOOL v70 = ([v6 fidelityPolicy] & 0x20) == 0 && v68 != 7;
        v37 = v128;
        if ([v128 count])
        {
          v71 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v128 count]];
          if ([v128 count])
          {
            unint64_t v72 = 0;
            id v73 = 0;
            do
            {
              v74 = v73;
              *(void *)buf = 0;
              uint64_t v146 = 0;
              v75 = [v128 objectAtIndexedSubscript:v72];
              id v145 = v73;
              BOOL v76 = [(RTPlaceInferenceManager *)self _learnedPlaceTypeForInferredMapItem:v75 placeType:buf placeTypeSource:&v146 error:&v145];
              id v73 = v145;

              if (!v76)
              {
                *(void *)buf = 0;
                uint64_t v146 = 0;
              }
              id v77 = objc_alloc(MEMORY[0x1E4F5CE58]);
              v78 = [v128 objectAtIndexedSubscript:v72];
              v79 = [NSNumber numberWithUnsignedInteger:*(void *)buf];
              v80 = (void *)[v77 initWithFirstObject:v78 secondObject:v79];

              if (v80) {
                [v71 addObject:v80];
              }
              if (v73) {
                [v126 addObject:v73];
              }

              ++v72;
            }
            while (v72 < [v128 count]);
          }
          else
          {
            id v73 = 0;
          }
          v83 = [(RTPlaceInferenceManager *)self inferredMapItemFuser];
          id v144 = v73;
          v84 = [v83 fusedInferredMapItemsUsingCandidates:v71 referenceLocation:v134 snapToBestKnownPlaceAndAoi:v70 error:&v144];
          id v85 = v144;

          id v33 = v122;
          v82 = v123;
          if (v85) {
            [v126 addObject:v85];
          }
          v86 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          id v6 = v133;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            uint64_t v87 = [v128 count];
            uint64_t v88 = [v84 count];
            *(_DWORD *)buf = 134218498;
            *(void *)&uint8_t buf[4] = v87;
            __int16 v160 = 2048;
            uint64_t v161 = v88;
            __int16 v162 = 2112;
            uint64_t v163 = (uint64_t)v85;
            _os_log_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_INFO, "fusion, inferrend mapitems, %lu, fused mapitems, %lu, error, %@", buf, 0x20u);
          }

          v81 = v84;
        }
        else
        {
          v81 = (void *)MEMORY[0x1E4F1CBF0];
          id v33 = v122;
          v82 = v123;
        }
        if ([v81 count])
        {
          v89 = [v81 firstObject];
          v90 = [v89 mapItem];

          if (v90) {
            goto LABEL_97;
          }
        }
        uint64_t v91 = [(RTPlaceInferenceManager *)self _getFallbackMapItemProviderForOptions:v6];
        if (!v91) {
          goto LABEL_97;
        }
        v92 = (void *)v91;
        v93 = v81;
        id v94 = objc_alloc(MEMORY[0x1E4F5CE78]);
        uint64_t v95 = [v6 fidelityPolicy];
        v96 = [v6 accessPoints];
        v97 = [v6 clientIdentifier];
        LOBYTE(v116) = 0;
        v98 = (void *)[v94 initWithFidelityPolicy:v95 locations:v132 accessPoints:v96 distance:v134 location:v131 startDate:v130 endDate:50.0 limit:v129 useBackground:v116 clientIdentifier:v97];

        id v143 = 0;
        v99 = [v92 mapItemsWithOptions:v98 error:&v143];
        id v100 = v143;
        if (v100)
        {
          [v126 addObject:v100];
          v101 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v113 = (objc_class *)objc_opt_class();
            v114 = NSStringFromClass(v113);
            uint64_t v115 = [v99 count];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v114;
            __int16 v160 = 2048;
            uint64_t v161 = v115;
            __int16 v162 = 2112;
            uint64_t v163 = (uint64_t)v100;
            _os_log_debug_impl(&dword_1D9BFA000, v101, OS_LOG_TYPE_DEBUG, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);
          }
          id v102 = 0;
        }
        else
        {
          id v102 = v99;
          v101 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
          {
            v103 = (objc_class *)objc_opt_class();
            v104 = NSStringFromClass(v103);
            uint64_t v105 = [v102 count];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v104;
            __int16 v160 = 2048;
            uint64_t v161 = v105;
            __int16 v162 = 2112;
            uint64_t v163 = 0;
            _os_log_impl(&dword_1D9BFA000, v101, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);
          }
        }
        v81 = v93;

        id v6 = v133;
        id v33 = v122;
        v82 = v123;
        v37 = v128;
        if (!v102)
        {
LABEL_97:
          v135[0] = MEMORY[0x1E4F143A8];
          v135[1] = 3221225472;
          v135[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_2;
          v135[3] = &unk_1E6B90B00;
          v135[4] = self;
          v106 = &v136;
          id v136 = v134;
          v107 = &v137;
          id v137 = v33;
          v108 = (id *)v138;
          v138[0] = v126;
          v138[1] = v129;
          [v81 enumerateObjectsUsingBlock:v135];
          id v102 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_207;
          v139[3] = &unk_1E6B90AD8;
          v139[4] = self;
          v106 = &v140;
          id v140 = v134;
          v107 = &v141;
          id v141 = v122;
          v108 = (id *)v142;
          v142[0] = v126;
          v142[1] = v129;
          [v102 enumerateObjectsUsingBlock:v139];
        }

        uint64_t v22 = v120;
        if (([v6 fidelityPolicy] & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) == 0)
        {
          v109 = [(RTPlaceInferenceManager *)self _selectBestCandidateAndUpdateReferenceLocation:v33];
          [v33 removeAllObjects];
          if (v109) {
            [v33 addObject:v109];
          }
        }
        v110 = [(RTPlaceInferenceManager *)self dailyMetrics];
        [v110 increaseCountForClientMappingIndex:LODWORD(self->_clientMappingIndex)];

        [(RTPlaceInferenceManager *)self sendPlaceInferenceMetrics:v117 inferredMapItems:v37 fusedMapItems:v81 fallbackInferredMapItems:v102 finalPlaceInferences:v33 referenceLocation:v134];
        if (v82 && [v126 count] && !objc_msgSend(v33, "count"))
        {
          v111 = _RTSafeArray();
          _RTMultiErrorCreate();
          id *v82 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v18 = v121;
      }
    }
    else
    {
      id v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "At least one non-cell location should be provided, %@", buf, 0xCu);
      }

      if (!a4)
      {
        id v33 = 0;
LABEL_109:

        goto LABEL_110;
      }
      uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F5CFE8];
      uint64_t v156 = *MEMORY[0x1E4F28568];
      id v134 = [NSString stringWithFormat:@"At least one non-cell location should be provided."];
      id v157 = v134;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
      [v35 errorWithDomain:v36 code:7 userInfo:v37];
      id v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_109;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "At least one location should be provided, %@", buf, 0xCu);
  }

  if (!a4)
  {
    id v33 = 0;
    goto LABEL_111;
  }
  __int16 v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v32 = *MEMORY[0x1E4F5CFE8];
  uint64_t v164 = *MEMORY[0x1E4F28568];
  id v18 = [NSString stringWithFormat:@"At least one location should be provided."];
  v165[0] = v18;
  v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:&v164 count:1];
  [v31 errorWithDomain:v32 code:7 userInfo:nil];
  id v33 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:

LABEL_111:

  return v33;
}

- (id)_selectMapItemProvidersForOptions:(id)a3 targetProvider:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    id v9 = [(RTPlaceInferenceManager *)self defaultsManager];
    id v10 = [v9 objectForKey:@"RTDefaultsMapItemProviderDenyList"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(RTPlaceInferenceManager *)self _addMapItemProviderFromArray:v10 toSet:v8];
    }
    uint64_t v11 = [MEMORY[0x1E4F64500] sharedConfiguration];
    dispatch_time_t v12 = [v11 defaultForKey:@"RTDefaultsMapItemProviderDenyList" defaultValue:MEMORY[0x1E4F1CBF0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(RTPlaceInferenceManager *)self _addMapItemProviderFromArray:v12 toSet:v8];
    }
    char v13 = [v6 fidelityPolicy];
    if ((v13 & 0x20) != 0)
    {
      uint64_t v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      char v42 = [v8 containsObject:v41];

      if ((v42 & 1) == 0)
      {
        uint64_t v43 = [(RTPlaceInferenceManager *)self mapItemProviders];
        uint64_t v44 = [v43 objectForKeyedSubscript:&unk_1F344F7C0];

        if (v44) {
          [v7 addObject:v44];
        }
      }
      goto LABEL_54;
    }
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
        double v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        char v16 = [v8 containsObject:v15];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [(RTPlaceInferenceManager *)self mapItemProviders];
          id v18 = [v17 objectForKeyedSubscript:&unk_1F344F7F0];

          if (v18) {
            [v7 addObject:v18];
          }
        }
        if (!a4) {
          goto LABEL_13;
        }
        break;
      case 4uLL:
LABEL_13:
        uint64_t v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        char v21 = [v8 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [(RTPlaceInferenceManager *)self mapItemProviders];
          uint64_t v23 = [v22 objectForKeyedSubscript:&unk_1F344F808];

          if (v23) {
            [v7 addObject:v23];
          }
        }
        if (!a4) {
          goto LABEL_18;
        }
        break;
      case 8uLL:
LABEL_18:
        uint64_t v24 = (objc_class *)objc_opt_class();
        uint64_t v25 = NSStringFromClass(v24);
        char v26 = [v8 containsObject:v25];

        if ((v26 & 1) == 0)
        {
          id v27 = [(RTPlaceInferenceManager *)self mapItemProviders];
          uint64_t v28 = [v27 objectForKeyedSubscript:&unk_1F344F820];

          if (v28) {
            [v7 addObject:v28];
          }
        }
        break;
      default:
        break;
    }
    if ((v13 & 3) != 0)
    {
      if (a4 <= 1)
      {
        v29 = (objc_class *)objc_opt_class();
        id v30 = NSStringFromClass(v29);
        char v31 = [v8 containsObject:v30];

        if ((v31 & 1) == 0)
        {
          uint64_t v32 = [(RTPlaceInferenceManager *)self mapItemProviders];
          id v33 = [v32 objectForKeyedSubscript:&unk_1F344F7C0];

          if (v33) {
            [v7 addObject:v33];
          }
        }
      }
      if ((a4 | 2) == 2)
      {
        id v34 = (objc_class *)objc_opt_class();
        uint64_t v35 = NSStringFromClass(v34);
        char v36 = [v8 containsObject:v35];

        if ((v36 & 1) == 0)
        {
          v37 = [(RTPlaceInferenceManager *)self mapItemProviders];
          uint64_t v38 = [v37 objectForKeyedSubscript:&unk_1F344F7D8];

          if (v38) {
            [v7 addObject:v38];
          }
        }
      }
    }
    if ((v13 & 2) == 0)
    {
      if (a4 != 7) {
        goto LABEL_53;
      }
LABEL_48:
      __int16 v51 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v51);
      char v53 = [v8 containsObject:v52];

      if ((v53 & 1) == 0)
      {
        v48 = [(RTPlaceInferenceManager *)self mapItemProviders];
        id v49 = v48;
        uint64_t v50 = &unk_1F344F850;
        goto LABEL_50;
      }
      goto LABEL_53;
    }
    if (a4)
    {
      if (a4 == 7) {
        goto LABEL_48;
      }
      if (a4 != 6) {
        goto LABEL_53;
      }
    }
    uint64_t v45 = (objc_class *)objc_opt_class();
    uint64_t v46 = NSStringFromClass(v45);
    char v47 = [v8 containsObject:v46];

    if ((v47 & 1) == 0)
    {
      v48 = [(RTPlaceInferenceManager *)self mapItemProviders];
      id v49 = v48;
      uint64_t v50 = &unk_1F344F838;
LABEL_50:
      v54 = [v48 objectForKeyedSubscript:v50];

      if (v54) {
        [v7 addObject:v54];
      }
    }
LABEL_53:
    +[RTPlaceInferenceManager sanityCheckMapItemProviders:v7];
LABEL_54:

    goto LABEL_55;
  }
  uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v56 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", v56, 2u);
  }

  uint64_t v7 = 0;
LABEL_55:

  return v7;
}

- (NSDictionary)mapItemProviders
{
  return self->_mapItemProviders;
}

+ (void)sanityCheckMapItemProviders:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__RTPlaceInferenceManager_sanityCheckMapItemProviders___block_invoke;
    v4[3] = &unk_1E6B90B50;
    id v5 = v3;
    [v5 enumerateObjectsUsingBlock:v4];
  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)_addMapItemProviderFromArray:(id)a3 toSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__RTPlaceInferenceManager__addMapItemProviderFromArray_toSet___block_invoke;
    v7[3] = &unk_1E6B90B78;
    id v8 = v6;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

- (unint64_t)placeInferencesLimit
{
  return self->_placeInferencesLimit;
}

- (id)_selectMapItemProvidersForOptions:(id)a3
{
  return [(RTPlaceInferenceManager *)self _selectMapItemProvidersForOptions:a3 targetProvider:0];
}

- (id)_selectLastLocationFromLocations:(id)a3 maxHorizontalUncertainty:(double)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTPlaceInferenceManager _selectLastLocationFromLocations:maxHorizontalUncertainty:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 352;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v5 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    dispatch_time_t v12 = __Block_byref_object_copy__2;
    char v13 = __Block_byref_object_dispose__2;
    id v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__RTPlaceInferenceManager__selectLastLocationFromLocations_maxHorizontalUncertainty___block_invoke;
    v10[3] = &unk_1E6B90A90;
    *(double *)&v10[5] = a4;
    v10[4] = buf;
    [v5 enumerateObjectsWithOptions:2 usingBlock:v10];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v7 = objc_alloc(MEMORY[0x1E4F5CE00]);
      id v8 = (void *)[v7 initWithCLLocation:*(void *)(*(void *)&buf[8] + 40)];
    }
    else
    {
      id v8 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)_getMappingIndexForClientIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"CoreRoutine"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 hasSuffix:@"DoNotDisturb.bundle"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 hasSuffix:@"Emergency SOS.bundle"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 hasSuffix:@"findmy"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 hasSuffix:@"GeocorrectionDLocationBundle.bundle"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 hasSuffix:@"HomeKitDaemon.framework"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 hasSuffix:@"CoreParsec.framework"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 hasSuffix:@"VoiceMemos"])
  {
    unint64_t v4 = 8;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)sendPlaceInferenceMetrics:(id)a3 inferredMapItems:(id)a4 fusedMapItems:(id)a5 fallbackInferredMapItems:(id)a6 finalPlaceInferences:(id)a7 referenceLocation:(id)a8
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v85 = a3;
  id v14 = a4;
  id v82 = a5;
  id v15 = a6;
  id v84 = a7;
  id v83 = a8;
  uint64_t v80 = [v15 count];
  uint64_t v135 = 0;
  id v136 = &v135;
  uint64_t v137 = 0x2020000000;
  char v138 = 0;
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 0;
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x2020000000;
  char v130 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  char v126 = 0;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  char v122 = 0;
  uint64_t v115 = 0;
  uint64_t v116 = &v115;
  uint64_t v117 = 0x2020000000;
  int v118 = 0;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__2;
  v113 = __Block_byref_object_dispose__2;
  id v114 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__2;
  v107 = __Block_byref_object_dispose__2;
  id v108 = (id)objc_opt_new();
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke;
  v102[3] = &unk_1E6B90BA0;
  v102[4] = &v109;
  v102[5] = &v115;
  v102[6] = &v123;
  v102[7] = &v131;
  v102[8] = &v135;
  v102[9] = &v103;
  v102[10] = &v119;
  v102[11] = &v127;
  [v14 enumerateObjectsUsingBlock:v102];
  char v16 = v14;
  uint64_t v81 = [v82 count];
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  int v101 = 0;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_2;
  v97[3] = &unk_1E6B90BC8;
  v97[4] = &v98;
  [v82 enumerateObjectsUsingBlock:v97];
  if (self->_visitEntryTime)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:self->_visitEntryTime];
    double v19 = v18;

    unint64_t v20 = vcvtad_u64_f64(v19);
    BOOL v21 = 1;
  }
  else if (self->_clientMappingIndex == 2)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v140 = 0x3032000000;
    id v141 = __Block_byref_object_copy__2;
    v142 = __Block_byref_object_dispose__2;
    id v143 = 0;
    uint64_t v91 = 0;
    v92 = (id *)&v91;
    uint64_t v93 = 0x3032000000;
    id v94 = __Block_byref_object_copy__2;
    uint64_t v95 = __Block_byref_object_dispose__2;
    id v96 = 0;
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    uint64_t v23 = [(RTPlaceInferenceManager *)self visitStore];
    id v24 = objc_alloc(MEMORY[0x1E4F5CF58]);
    uint64_t v25 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
    char v26 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F344F880];
    id v27 = (void *)[v24 initWithAscending:0 confidence:v25 dateInterval:0 labelVisit:1 limit:&unk_1F344F868 sources:v26];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_241;
    v87[3] = &unk_1E6B905F0;
    p_long long buf = &buf;
    v90 = &v91;
    uint64_t v28 = v22;
    uint64_t v88 = v28;
    [v23 fetchVisitsWithOptions:v27 handler:v87];

    v29 = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v31 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v29, v31)) {
      goto LABEL_10;
    }
    v79 = [MEMORY[0x1E4F1C9C8] now];
    [v79 timeIntervalSinceDate:v30];
    double v33 = v32;
    id v77 = objc_opt_new();
    v78 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
    id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v35 = [v34 filteredArrayUsingPredicate:v78];
    char v36 = [v35 firstObject];

    [v77 submitToCoreAnalytics:v36 type:1 duration:v33];
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v145 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v145, 2u);
    }

    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v144 = *MEMORY[0x1E4F28568];
    *(void *)id v145 = @"semaphore wait timeout";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:&v144 count:1];
    uint64_t v40 = [v38 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v39];

    if (v40)
    {
      id v41 = v40;

      char v42 = (void *)v30;
      char v43 = 0;
    }
    else
    {
LABEL_10:
      char v42 = (void *)v30;
      id v41 = 0;
      char v43 = 1;
    }

    id v44 = v41;
    if ((v43 & 1) == 0) {
      objc_storeStrong(v92 + 5, v41);
    }
    uint64_t v45 = [*(id *)(*((void *)&buf + 1) + 40) type];
    BOOL v21 = v45 == 1;
    if (v45 == 1)
    {
      uint64_t v46 = [MEMORY[0x1E4F1C9C8] now];
      char v47 = [*(id *)(*((void *)&buf + 1) + 40) entry];
      [v46 timeIntervalSinceDate:v47];
      double v49 = v48;

      unint64_t v20 = vcvtad_u64_f64(v49);
    }
    else
    {
      unint64_t v20 = -1;
    }

    _Block_object_dispose(&v91, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v21 = 0;
    unint64_t v20 = -1;
  }
  if (v20 >= 0xE10) {
    uint64_t v50 = 3600;
  }
  else {
    uint64_t v50 = v20;
  }
  BOOL v51 = v20 < 0xE11 && v21;
  [v85 setPlaceInferences:v84];
  [v85 setTopPersonalizedLabelsInferredMapItems:v104[5] topBluePOIInferredMapItem:v110[5]];
  id v52 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v99 + 6)];
  [v85 setObject:v52 forKey:@"afterFusionCount"];

  char v53 = [NSNumber numberWithUnsignedInteger:[v14 count]];
  [v85 setObject:v53 forKey:@"beforeFusionCount"];

  v54 = [NSNumber numberWithUnsignedInteger:v50];
  [v85 setObject:v54 forKey:@"callEntryLatency"];

  id v55 = [NSNumber numberWithUnsignedInteger:self->_clientMappingIndex];
  [v85 setObject:v55 forKey:@"clientIdMappingIndex"];

  v56 = [NSNumber numberWithInt:v110[5] != 0];
  [v85 setObject:v56 forKey:@"hasBluePOIResults"];

  v57 = [NSNumber numberWithBool:*((unsigned __int8 *)v120 + 24)];
  [v85 setObject:v57 forKey:@"hasConfidentLocalHints"];

  v58 = [NSNumber numberWithBool:*((unsigned __int8 *)v136 + 24)];
  [v85 setObject:v58 forKey:@"hasCurrentPOIResult"];

  uint64_t v59 = [NSNumber numberWithBool:*((unsigned __int8 *)v132 + 24)];
  [v85 setObject:v59 forKey:@"hasLearnedPlaceInResults"];

  uint64_t v60 = [NSNumber numberWithBool:*((unsigned __int8 *)v128 + 24)];
  [v85 setObject:v60 forKey:@"hasMapSupportResults"];

  id v61 = [NSNumber numberWithBool:*((unsigned __int8 *)v124 + 24)];
  [v85 setObject:v61 forKey:@"hasRevGeocodeInResults"];

  v62 = [NSNumber numberWithBool:v81 != 0];
  [v85 setObject:v62 forKey:@"hasFusedResults"];

  v63 = [NSNumber numberWithBool:v80 != 0];
  [v85 setObject:v63 forKey:@"hasFallbackResults"];

  v64 = [NSNumber numberWithBool:v51];
  [v85 setObject:v64 forKey:@"isInVisit"];

  v65 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v116 + 6)];
  [v85 setObject:v65 forKey:@"sourceCount"];

  if (v83
    && [v84 count]
    && ([v84 objectAtIndexedSubscript:0],
        uint64_t v66 = objc_claimAutoreleasedReturnValue(),
        [v66 referenceLocation],
        v67 = objc_claimAutoreleasedReturnValue(),
        BOOL v68 = v67 == 0,
        v67,
        v66,
        !v68))
  {
    v69 = [(RTPlaceInferenceManager *)self distanceCalculator];
    BOOL v70 = [v84 objectAtIndexedSubscript:0];
    v71 = [v70 referenceLocation];
    uint64_t v86 = 0;
    [v69 distanceFromLocation:v83 toLocation:v71 error:&v86];
    double v73 = v72;

    uint64_t v74 = (uint64_t)v73;
  }
  else
  {
    uint64_t v74 = -1;
  }
  v75 = [NSNumber numberWithInteger:v74];
  [v85 setObject:v75 forKey:@"distanceBetweenReferenceLocationAndUpdatedReferenceLocation"];

  [v85 submitMetrics];
  BOOL v76 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v85;
    _os_log_impl(&dword_1D9BFA000, v76, OS_LOG_TYPE_INFO, "metrics, %@", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTPlaceInferenceDailyMetrics)dailyMetrics
{
  return self->_dailyMetrics;
}

void __85__RTPlaceInferenceManager__selectLastLocationFromLocations_maxHorizontalUncertainty___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  [v8 horizontalAccuracy];
  if (v7 < *(double *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)fetchPlaceInferencesForOptions:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void, NSObject *))a4;
  if (!v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v21 = self;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "options is required, %@", buf, 0xCu);
    }

    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    char v13 = [NSString stringWithFormat:@"options is required."];
    double v19 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v9 = [v11 errorWithDomain:v12 code:7 userInfo:v14];

    v7[2](v7, 0, v9);
LABEL_9:

    goto LABEL_10;
  }
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTPlaceInferenceManager_fetchPlaceInferencesForOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v16 = v6;
  uint64_t v17 = v7;
  dispatch_async(v8, block);

LABEL_10:
}

- (RTPlaceInferenceManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_defaultsManager_distanceCalculator_eventManager_fingerprintManager_inferredMapItemFuser_learnedLocationStore_locationManager_mapServiceManager_mapsSupportManager_metricManager_motionActivityManager_placeInferenceQueryStore_platform_portraitManager_visitStore_);
}

- (RTPlaceInferenceManager)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 eventManager:(id)a6 fingerprintManager:(id)a7 inferredMapItemFuser:(id)a8 learnedLocationStore:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 mapsSupportManager:(id)a12 metricManager:(id)a13 motionActivityManager:(id)a14 placeInferenceQueryStore:(id)a15 platform:(id)a16 portraitManager:(id)a17 visitStore:(id)a18
{
  id v64 = a3;
  id obj = a4;
  id v56 = a4;
  id v63 = a5;
  id v62 = a6;
  id v61 = a7;
  id v49 = a8;
  id v23 = a8;
  id v24 = a9;
  id v55 = a10;
  id v53 = a11;
  id v25 = a12;
  id v52 = a13;
  id v60 = a14;
  id v59 = a15;
  id v58 = a16;
  id v57 = a17;
  id v26 = a18;
  v54 = v26;
  if (!v64)
  {
    id v27 = v56;
    uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    uint64_t v38 = 0;
    id v41 = v63;
    goto LABEL_27;
  }
  id v27 = v56;
  if (!v56)
  {
    char v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v41 = v63;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    uint64_t v38 = 0;
LABEL_27:
    uint64_t v28 = v55;
    v29 = v53;
    v37 = self;
    uint64_t v39 = v52;
    goto LABEL_55;
  }
  if (v63)
  {
    uint64_t v28 = v55;
    v29 = v53;
    if (v62)
    {
      if (v61)
      {
        if (v23)
        {
          if (v24)
          {
            if (v55)
            {
              if (v53)
              {
                if (v25)
                {
                  if (v60)
                  {
                    if (v59)
                    {
                      if (v58)
                      {
                        if (v57)
                        {
                          if (v26)
                          {
                            v65.receiver = self;
                            v65.super_class = (Class)RTPlaceInferenceManager;
                            BOOL v51 = [(RTNotifier *)&v65 init];
                            if (v51)
                            {
                              objc_storeStrong((id *)&v51->_defaultsManager, obj);
                              objc_storeStrong((id *)&v51->_distanceCalculator, a5);
                              objc_storeStrong((id *)&v51->_metricManager, a13);
                              objc_storeStrong((id *)&v51->_inferredMapItemFuser, v49);
                              objc_storeStrong((id *)&v51->_learnedLocationStore, a9);
                              v51->_placeInferencesLimit = 50;
                              uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
                              cachedLocations = v51->_cachedLocations;
                              v51->_cachedLocations = (NSMutableArray *)v30;

                              v51->_cachedLocationIndex = 0;
                              objc_storeStrong((id *)&v51->_locationManager, a10);
                              objc_storeStrong((id *)&v51->_mapServiceManager, a11);
                              objc_storeStrong((id *)&v51->_visitStore, a18);
                              objc_storeStrong((id *)&v51->_placeInferenceQueryStore, a15);
                              double v32 = [(RTDefaultsManager *)v51->_defaultsManager objectForKey:@"RTDefaultsPlaceInferenceManagerPlaceInferencesLimit"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                v51->_placeInferencesLimit = [v32 unsignedIntegerValue];
                              }
                              v51->_clientMappingIndex = 0;
                              double v33 = [[RTPlaceInferenceDailyMetrics alloc] initWithDefaultsManager:v56];
                              dailyMetrics = v51->_dailyMetrics;
                              v51->_dailyMetrics = v33;

                              uint64_t v35 = [(RTPlaceInferenceManager *)v51 createAllMapItemProvidersWithDefaultManager:v56 distanceCalculator:v63 eventManager:v62 fingerprintManager:v61 learnedLocationStore:v24 locationManager:v55 mapServiceManager:v53 mapsSupportManager:v25 motionActivityManager:v60 platform:v58 portraitManager:v57 visitStore:v54];
                              v29 = v53;
                              mapItemProviders = v51->_mapItemProviders;
                              v51->_mapItemProviders = (NSDictionary *)v35;

                              [(RTService *)v51 setup];
                            }
                            v37 = v51;
                            uint64_t v38 = v37;
                            uint64_t v39 = v52;
                          }
                          else
                          {
                            char v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                            uint64_t v39 = v52;
                            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)long long buf = 0;
                              _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", buf, 2u);
                            }

                            uint64_t v38 = 0;
                            v37 = self;
                          }
                          id v41 = v63;
                          uint64_t v28 = v55;
                          id v27 = v56;
                          goto LABEL_55;
                        }
                        id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)long long buf = 0;
                          uint64_t v45 = "Invalid parameter not satisfying: portraitManager";
                          goto LABEL_53;
                        }
LABEL_54:

                        uint64_t v38 = 0;
                        v37 = self;
                        uint64_t v39 = v52;
                        id v41 = v63;
                        goto LABEL_55;
                      }
                      id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_54;
                      }
                      *(_WORD *)long long buf = 0;
                      uint64_t v45 = "Invalid parameter not satisfying: platform";
                    }
                    else
                    {
                      id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_54;
                      }
                      *(_WORD *)long long buf = 0;
                      uint64_t v45 = "Invalid parameter not satisfying: placeInferenceQueryStore";
                    }
                  }
                  else
                  {
                    id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_54;
                    }
                    *(_WORD *)long long buf = 0;
                    uint64_t v45 = "Invalid parameter not satisfying: motionActivityManager";
                  }
                }
                else
                {
                  id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_54;
                  }
                  *(_WORD *)long long buf = 0;
                  uint64_t v45 = "Invalid parameter not satisfying: mapsSupportManager";
                }
              }
              else
              {
                id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_54;
                }
                *(_WORD *)long long buf = 0;
                uint64_t v45 = "Invalid parameter not satisfying: mapServiceManager";
              }
            }
            else
            {
              id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                goto LABEL_54;
              }
              *(_WORD *)long long buf = 0;
              uint64_t v45 = "Invalid parameter not satisfying: locationManager";
            }
          }
          else
          {
            id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              goto LABEL_54;
            }
            *(_WORD *)long long buf = 0;
            uint64_t v45 = "Invalid parameter not satisfying: learnedLocationStore";
          }
        }
        else
        {
          id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            goto LABEL_54;
          }
          *(_WORD *)long long buf = 0;
          uint64_t v45 = "Invalid parameter not satisfying: inferredMapItemFuser";
        }
      }
      else
      {
        id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v45 = "Invalid parameter not satisfying: fingerprintManager";
      }
    }
    else
    {
      id v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v45 = "Invalid parameter not satisfying: eventManager";
    }
LABEL_53:
    _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, v45, buf, 2u);
    goto LABEL_54;
  }
  char v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  uint64_t v28 = v55;
  v29 = v53;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
  }

  uint64_t v38 = 0;
  v37 = self;
  uint64_t v39 = v52;
  id v41 = 0;
LABEL_55:

  return v38;
}

- (id)createAllMapItemProvidersWithDefaultManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 fingerprintManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 portraitManager:(id)a13 visitStore:(id)a14
{
  id v48 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v54 = a8;
  id v23 = a9;
  id v53 = a10;
  id v52 = a11;
  id v51 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = v25;
  if (!v19)
  {
    char v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v29 = 0;
    id v27 = v48;
    goto LABEL_30;
  }
  if (!v20)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    id v27 = v48;
    uint64_t v28 = v23;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: eventManager";
LABEL_51:
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_52;
  }
  id v27 = v48;
  uint64_t v28 = v23;
  if (!v21)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_51;
  }
  if (!v22)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_51;
  }
  if (!v54)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_51;
  }
  if (!v23)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_51;
  }
  if (!v53)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: mapsSupportManager";
    goto LABEL_51;
  }
  if (!v52)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_51;
  }
  if (!v51)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: platform";
    goto LABEL_51;
  }
  if (!v24)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: portraitManager";
    goto LABEL_51;
  }
  if (v25)
  {
    v29 = objc_opt_new();
    id v49 = [RTMapItemProviderBluePOI alloc];
    id v44 = [(RTPlaceInferenceManager *)self placeInferenceQueryStore];
    uint64_t v50 = [(RTMapItemProviderBluePOI *)v49 initWithDefaultsManager:v48 distanceCalculator:v19 fingerprintManager:v21 locationManager:v54 mapServiceManager:v23 motionActivityManager:v52 placeInferenceQueryStore:v44 platform:v51];

    if (v50) {
      [v29 setObject:v50 forKey:&unk_1F344F7C0];
    }
    uint64_t v30 = [[RTMapItemProviderEventKit alloc] initWithDefaultsManager:v48 distanceCalculator:v19 eventManager:v20 mapServiceManager:v23];
    if (v30) {
      [v29 setObject:v30 forKey:&unk_1F344F7D8];
    }
    uint64_t v45 = v30;
    dispatch_time_t v31 = [[RTMapItemProviderLearnedPlace alloc] initWithDefaultsManager:v48 distanceCalculator:v19 learnedLocationStore:v22];
    if (v31) {
      [v29 setObject:v31 forKey:&unk_1F344F7F0];
    }
    char v43 = v31;
    double v32 = [[RTMapItemProviderMapsSupport alloc] initWithDefaultsManager:v48 distanceCalculator:v19 mapsSupportManager:v53];
    if (v32) {
      [v29 setObject:v32 forKey:&unk_1F344F808];
    }
    char v42 = v32;
    uint64_t v40 = [RTMapItemProviderCurrentPOI alloc];
    double v33 = [(RTPlaceInferenceManager *)self placeInferenceQueryStore];
    char v47 = [(RTMapItemProviderCurrentPOI *)v40 initWithDefaultsManager:v48 distanceCalculator:v19 placeInferenceQueryStore:v33 visitStore:v26];

    if (v47) {
      [v29 setObject:v47 forKey:&unk_1F344F820];
    }
    id v34 = [[RTMapItemProviderProactiveExperts alloc] initWithDefaultsManager:v48 distanceCalculator:v19 mapServiceManager:v23 personalizationPortraitManager:v24];
    if (v34) {
      [v29 setObject:v34 forKey:&unk_1F344F838];
    }
    id v41 = v34;
    uint64_t v35 = [[RTMapItemProviderReverseGeocode alloc] initWithDefaultsManager:v48 mapServiceManager:v23];
    if (v35) {
      [v29 setObject:v35 forKey:&unk_1F344F850];
    }

LABEL_30:
    uint64_t v28 = v23;
    goto LABEL_53;
  }
  v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v38 = "Invalid parameter not satisfying: visitStore";
    goto LABEL_51;
  }
LABEL_52:

  v29 = 0;
LABEL_53:

  return v29;
}

- (void)_registerForDailyMetricsNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  unint64_t v4 = [(RTPlaceInferenceManager *)self visitManager];
  id v5 = +[RTNotification notificationName];
  [v4 addObserver:self selector:sel_onVisitManagerVisitIncidentNotification_ name:v5];

  id v7 = [(RTPlaceInferenceManager *)self visitManager];
  id v6 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onPointOfInterestVisitNotification_ name:v6];
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
  [(RTPlaceInferenceManager *)self _unRegisterForDailyMetricsNotifications];
  if (v5) {
    v5[2](v5, 0);
  }
}

- (void)_unRegisterForDailyMetricsNotifications
{
  id v3 = [(RTPlaceInferenceManager *)self locationManager];
  unint64_t v4 = +[RTNotification notificationName];
  [v3 removeObserver:self fromNotification:v4];

  id v5 = [(RTPlaceInferenceManager *)self visitManager];
  id v6 = +[RTNotification notificationName];
  [v5 removeObserver:self fromNotification:v6];

  id v8 = [(RTPlaceInferenceManager *)self visitManager];
  id v7 = +[RTNotification notificationName];
  [v8 removeObserver:self fromNotification:v7];
}

- (void)_updateCachedLocationsWithLocation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[RTPlaceInferenceManager _updateCachedLocationsWithLocation:]";
      __int16 v15 = 1024;
      LODWORD(v16) = 376;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    __int16 v10 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [(NSMutableArray *)self->_cachedLocations count];
    unint64_t cachedLocationIndex = self->_cachedLocationIndex;
    int v13 = 138413058;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = cachedLocationIndex;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, location, %@, cached locations count, %lu, current index, %lu", (uint8_t *)&v13, 0x2Au);
  }
  unint64_t v8 = [(NSMutableArray *)self->_cachedLocations count];
  cachedLocations = self->_cachedLocations;
  if (v8 > 9) {
    [(NSMutableArray *)cachedLocations replaceObjectAtIndex:self->_cachedLocationIndex withObject:v5];
  }
  else {
    [(NSMutableArray *)cachedLocations addObject:v5];
  }
  self->_unint64_t cachedLocationIndex = (self->_cachedLocationIndex + 1) % 0xA;
}

- (id)_closestCachedLocationForLocation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (v27)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = self->_cachedLocations;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      id v7 = 0;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v30;
      double v10 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v12 = v7;
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v14 = [(RTPlaceInferenceManager *)self distanceCalculator];
          uint64_t v28 = v7;
          [v14 distanceFromLocation:v27 toLocation:v13 error:&v28];
          double v16 = v15;
          id v7 = v28;

          __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v20 = NSStringFromSelector(a2);
            *(_DWORD *)long long buf = 138413314;
            id v34 = v20;
            __int16 v35 = 2048;
            char v36 = v6;
            __int16 v37 = 2112;
            id v38 = v13;
            __int16 v39 = 2048;
            double v40 = v16;
            __int16 v41 = 2112;
            uint64_t v42 = (uint64_t)v7;
            _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@, index, %lu, cached location, %@, distance, %.3f, error, %@", buf, 0x34u);
          }
          if (!v7 && v16 <= 50.0 && v16 < v10)
          {
            id v19 = v13;

            ++v6;
            double v10 = v16;
            unint64_t v8 = v19;
          }
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v5);
    }
    else
    {
      id v7 = 0;
      unint64_t v8 = 0;
      double v10 = 1.79769313e308;
    }

    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = NSStringFromSelector(a2);
      uint64_t v23 = [(NSMutableArray *)self->_cachedLocations count];
      *(_DWORD *)long long buf = 138413314;
      id v34 = v22;
      __int16 v35 = 2112;
      char v36 = v8;
      __int16 v37 = 2112;
      id v38 = v27;
      __int16 v39 = 2048;
      double v40 = v10;
      __int16 v41 = 2048;
      uint64_t v42 = v23;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, selected cached location, %@, for location, %@, distance, %.3f, cached locations count, %lu", buf, 0x34u);
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
    unint64_t v8 = 0;
  }

  return v8;
}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, sorted location %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 convertToInferredMapItem];
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = 0;
    uint64_t v9 = [v7 _placeInferenceFromInferredMapItem:v6 referenceLocation:v8 error:&v11];
    id v10 = v11;
    [*(id *)(a1 + 48) addObject:v9];
    if (v10) {
      [*(id *)(a1 + 56) addObject:v10];
    }
    if ((unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 64)) {
      *a4 = 1;
    }
  }
}

- (BOOL)_savePlaceInferenceQueriesFromInferredMapItems:(id)a3 inferenceErrorCode:(int64_t)a4 referenceLocation:(id)a5 options:(id)a6 outError:(id *)a7
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v89 = a5;
  id v90 = a6;
  uint64_t v103 = 0;
  v104 = (id *)&v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__2;
  v107 = __Block_byref_object_dispose__2;
  id v108 = 0;
  v79 = v9;
  if ([v9 count])
  {
    uint64_t v88 = [MEMORY[0x1E4F1C9C8] now];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v96 objects:v109 count:16];
    if (v10)
    {
      dispatch_semaphore_t dsema = 0;
      id v11 = 0;
      uint64_t v85 = *(void *)v97;
      uint64_t v82 = *MEMORY[0x1E4F5CFE8];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      while (2)
      {
        uint64_t v84 = v10;
        uint64_t v12 = 0;
        uint64_t v91 = v11;
        do
        {
          if (*(void *)v97 != v85) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v96 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1E4F5CE70];
          double v15 = [v13 mapItem];
          uint64_t v16 = [v14 placeInferencePlaceTypeFromMapItem:v15 userType:0 source:0x4000];

          id v17 = objc_alloc(MEMORY[0x1E4F5CE70]);
          uint64_t v18 = [v13 mapItem];
          [v13 confidence];
          id v19 = [v17 initWithMapItem:v18 userType:0 userTypeSource:0 placeType:v16 confidence:v89 loiIdentifier:0];

          id v20 = objc_alloc(MEMORY[0x1E4F5CE80]);
          uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v22 = [v90 fidelityPolicy];
          uint64_t v23 = [v90 clientIdentifier];
          id v24 = (void *)[v20 initWithIdentifier:v21 date:v88 errorCode:a4 fidelityPolicyMask:v22 placeInference:v19 sourceIdentifier:v23];

          dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
          id v26 = [(RTPlaceInferenceManager *)self placeInferenceQueryStore];
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke_214;
          v93[3] = &unk_1E6B90728;
          uint64_t v95 = &v103;
          id v27 = v25;
          id v94 = v27;
          [v26 storePlaceInferenceQuery:v24 handler:v93];

          dispatch_semaphore_t dsema = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v29 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v29)) {
            goto LABEL_12;
          }
          long long v30 = [MEMORY[0x1E4F1C9C8] now];
          [v30 timeIntervalSinceDate:v28];
          double v32 = v31;
          double v33 = objc_opt_new();
          id v34 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
          __int16 v35 = [MEMORY[0x1E4F29060] callStackSymbols];
          char v36 = [v35 filteredArrayUsingPredicate:v34];
          __int16 v37 = [v36 firstObject];

          [v33 submitToCoreAnalytics:v37 type:1 duration:v32];
          id v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          __int16 v39 = (void *)MEMORY[0x1E4F28C58];
          v115[0] = v83;
          *(void *)long long buf = @"semaphore wait timeout";
          double v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v115 count:1];
          __int16 v41 = [v39 errorWithDomain:v82 code:15 userInfo:v40];

          if (v41)
          {
            id v42 = v41;

            char v43 = 0;
          }
          else
          {
LABEL_12:
            char v43 = 1;
            id v42 = v91;
          }

          id v11 = v42;
          if ((v43 & 1) == 0) {
            objc_storeStrong(v104 + 5, v42);
          }
          uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = NSStringFromSelector(a2);
            id v46 = v104[5];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v45;
            __int16 v111 = 2112;
            v112 = v24;
            __int16 v113 = 2112;
            id v114 = v46;
            _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, save placeInferenceQuery, %@, error, %@", buf, 0x20u);
          }
          id v47 = v104[5];
          if (v47)
          {
            if (a7) {
              *a7 = v47;
            }

            BOOL v48 = 0;
            goto LABEL_41;
          }

          ++v12;
          uint64_t v91 = v11;
        }
        while (v84 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v96 objects:v109 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      dispatch_semaphore_t dsema = 0;
      id v11 = 0;
    }

    if (a7) {
      *a7 = 0;
    }
    BOOL v48 = 1;
  }
  else
  {
    dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
    uint64_t v88 = (void *)[objc_alloc(MEMORY[0x1E4F5CE70]) initWithMapItem:0 finerGranularityMapItem:0 userType:0 userTypeSource:0 placeType:0 referenceLocation:v89 confidence:0.0 finerGranularityMapItemConfidence:0.0 loiIdentifier:0];
    id v50 = objc_alloc(MEMORY[0x1E4F5CE80]);
    id v51 = [MEMORY[0x1E4F29128] UUID];
    id v52 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v53 = [v90 fidelityPolicy];
    id v54 = [v90 clientIdentifier];
    id v55 = (void *)[v50 initWithIdentifier:v51 date:v52 errorCode:a4 fidelityPolicyMask:v53 placeInference:v88 sourceIdentifier:v54];

    id v56 = [(RTPlaceInferenceManager *)self placeInferenceQueryStore];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke;
    v100[3] = &unk_1E6B90728;
    id v102 = &v103;
    id v57 = v49;
    int v101 = v57;
    [v56 storePlaceInferenceQuery:v55 handler:v100];

    dispatch_semaphore_t dsema = v57;
    id v58 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v59 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v59)) {
      goto LABEL_33;
    }
    id v60 = [MEMORY[0x1E4F1C9C8] now];
    [v60 timeIntervalSinceDate:v58];
    double v62 = v61;
    id v63 = objc_opt_new();
    id v64 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
    objc_super v65 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v66 = [v65 filteredArrayUsingPredicate:v64];
    v67 = [v66 firstObject];

    [v63 submitToCoreAnalytics:v67 type:1 duration:v62];
    BOOL v68 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v69 = (void *)MEMORY[0x1E4F28C58];
    v115[0] = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    BOOL v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v115 count:1];
    v71 = [v69 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v70];

    if (v71)
    {
      id v72 = v71;

      char v73 = 0;
    }
    else
    {
LABEL_33:
      id v72 = 0;
      char v73 = 1;
    }

    id v11 = v72;
    if ((v73 & 1) == 0) {
      objc_storeStrong(v104 + 5, v72);
    }
    uint64_t v74 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v75 = NSStringFromSelector(a2);
      id v76 = v104[5];
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v75;
      __int16 v111 = 2112;
      v112 = v55;
      __int16 v113 = 2112;
      id v114 = v76;
      _os_log_impl(&dword_1D9BFA000, v74, OS_LOG_TYPE_INFO, "%@, save placeInferenceQuery, %@, error, %@", buf, 0x20u);
    }
    if (a7) {
      *a7 = v104[5];
    }
    BOOL v48 = v104[5] == 0;
  }
LABEL_41:

  _Block_object_dispose(&v103, 8);
  return v48;
}

void __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke_214(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_selectBestCandidateAndUpdateReferenceLocation:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = a3;
  uint64_t v69 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (!v69)
  {
    double v61 = 0;
    id v57 = 0;
    id v46 = obj;
LABEL_33:

    goto LABEL_35;
  }
  double v61 = 0;
  BOOL v70 = 0;
  uint64_t v68 = *(void *)v82;
  uint64_t v66 = 0;
  uint64_t v62 = *MEMORY[0x1E4F5CFE8];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  double v3 = -1.0;
  do
  {
    for (uint64_t i = 0; i != v69; ++i)
    {
      if (*(void *)v82 != v68) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v81 + 1) + 8 * i);
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v66 + i + 1;
        *(_WORD *)&buf[22] = 2112;
        id v89 = v5;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, placeInference candidate %lu, %@", buf, 0x20u);
      }
      uint64_t v8 = [v5 loiIdentifier];
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        id v89 = __Block_byref_object_copy__2;
        id v90 = __Block_byref_object_dispose__2;
        id v91 = 0;
        uint64_t v75 = 0;
        id v76 = &v75;
        uint64_t v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__2;
        v79 = __Block_byref_object_dispose__2;
        id v80 = 0;
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = [(RTPlaceInferenceManager *)self learnedLocationStore];
        uint64_t v12 = [v5 loiIdentifier];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __74__RTPlaceInferenceManager__selectBestCandidateAndUpdateReferenceLocation___block_invoke;
        v71[3] = &unk_1E6B90B28;
        char v73 = &v75;
        uint64_t v74 = buf;
        id v13 = v10;
        id v72 = v13;
        [v11 fetchLocationOfInterestWithIdentifier:v12 handler:v71];

        uint64_t v14 = v13;
        double v15 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v16 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v14, v16)) {
          goto LABEL_14;
        }
        id v17 = [MEMORY[0x1E4F1C9C8] now];
        [v17 timeIntervalSinceDate:v15];
        double v19 = v18;
        id v20 = objc_opt_new();
        uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
        uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
        id v24 = [v23 firstObject];

        [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
        dispatch_semaphore_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v85 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v85, 2u);
        }

        id v26 = (void *)MEMORY[0x1E4F28C58];
        v93[0] = v63;
        *(void *)uint64_t v85 = @"semaphore wait timeout";
        id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v93 count:1];
        uint64_t v28 = [v26 errorWithDomain:v62 code:15 userInfo:v27];

        if (v28)
        {
          id v29 = v28;

          char v30 = 0;
        }
        else
        {
LABEL_14:
          id v29 = 0;
          char v30 = 1;
        }

        id v31 = v29;
        if ((v30 & 1) == 0) {
          objc_storeStrong((id *)(*(void *)&buf[8] + 40), v29);
        }
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          double v32 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            double v33 = NSStringFromSelector(a2);
            uint64_t v34 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v85 = 138412546;
            *(void *)&v85[4] = v33;
            __int16 v86 = 2112;
            uint64_t v87 = v34;
            _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", v85, 0x16u);
          }
LABEL_25:

          goto LABEL_26;
        }
        double v32 = [(id)v76[5] location];
        __int16 v35 = [v32 location];
        if ([v35 sourceAccuracy] != 2)
        {

          goto LABEL_25;
        }
        char v36 = [(id)v76[5] location];
        __int16 v37 = [v36 location];
        [v37 horizontalUncertainty];
        BOOL v39 = v38 > 40.0;

        if (v39 || ([v5 confidence], v40 <= v3))
        {
LABEL_26:
          __int16 v41 = v70;
        }
        else
        {
          __int16 v41 = v5;

          id v42 = [(id)v76[5] location];
          uint64_t v43 = [v42 location];

          [v41 confidence];
          double v3 = v44;
          double v61 = (void *)v43;
        }

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(buf, 8);

        BOOL v70 = v41;
        continue;
      }
    }
    uint64_t v69 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
    v66 += i;
  }
  while (v69);

  if (v70)
  {
    id v45 = objc_alloc(MEMORY[0x1E4F5CE70]);
    id v46 = [v70 mapItem];
    id v47 = [v70 finerGranularityMapItem];
    uint64_t v48 = [v70 userType];
    uint64_t v49 = [v70 userTypeSource];
    uint64_t v50 = [v70 placeType];
    [v70 confidence];
    double v52 = v51;
    [v70 finerGranularityMapItemConfidence];
    double v54 = v53;
    id v55 = [v70 loiIdentifier];
    id v56 = [v70 preferredName];
    id v57 = (void *)[v45 initWithMapItem:v46 finerGranularityMapItem:v47 userType:v48 userTypeSource:v49 placeType:v50 referenceLocation:v61 confidence:v52 finerGranularityMapItemConfidence:v54 loiIdentifier:v55 preferredName:v56];

    goto LABEL_33;
  }
  id v57 = 0;
LABEL_35:
  id v58 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v59 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v59;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v57;
    _os_log_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_INFO, "%@, selected best candidate, %@", buf, 0x16u);
  }

  return v57;
}

void __74__RTPlaceInferenceManager__selectBestCandidateAndUpdateReferenceLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_estimatedLocationFromSortedLocations:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v27;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", (void)v26) == 1)
          {
            [v12 speed];
            if (v13 >= 0.0)
            {
              [v12 speed];
              double v10 = v10 + v14;
              ++v8;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);

      if (v8)
      {
        double v15 = v10 / (double)v8;
LABEL_19:
        dispatch_time_t v16 = [MEMORY[0x1E4F1CA60] dictionary:v26];
        double v18 = [NSNumber numberWithDouble:v15];
        [v16 setObject:v18 forKey:@"kRTLocationSmootherAverageMovingSpeed"];

        uint64_t v19 = MEMORY[0x1E4F1CC38];
        [v16 setObject:MEMORY[0x1E4F1CC38] forKey:@"kRTLocationSmootherEnableFallbackModel"];
        [v16 setObject:v19 forKey:@"kRTLocationSmootherPreciseLocationOnlyMode"];
        id v20 = [(RTPlaceInferenceManager *)self locationManager];
        uint64_t v21 = [v20 locationSmoother];
        uint64_t v22 = [v5 objectAtIndexedSubscript:0];
        uint64_t v23 = [v22 timestamp];
        [v23 timeIntervalSinceReferenceDate];
        id v24 = [v21 estimateLocationWithLocations:v5 timestamp:v16 parameters:0 meta:0];

        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v24];
        goto LABEL_20;
      }
    }
    else
    {
    }
    double v15 = 0.0;
    goto LABEL_19;
  }
  dispatch_time_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count", buf, 2u);
  }
  id v17 = 0;
LABEL_20:

  return v17;
}

void __62__RTPlaceInferenceManager__addMapItemProviderFromArray_toSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)_learnedPlaceTypeForInferredMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  if (!v10)
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    if (!a6) {
      goto LABEL_19;
    }
    dispatch_time_t v16 = @"inferredMapItem";
    goto LABEL_18;
  }
  if (!a4)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeType", buf, 2u);
    }

    if (!a6) {
      goto LABEL_19;
    }
    dispatch_time_t v16 = @"placeType";
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    BOOL v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!a5)
  {
    double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeTypeSource", buf, 2u);
    }

    if (a6)
    {
      dispatch_time_t v16 = @"placeTypeSource";
      goto LABEL_18;
    }
LABEL_19:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  uint64_t v21 = 0;
  *(void *)long long buf = 0;
  id v20 = 0;
  BOOL v11 = [(RTPlaceInferenceManager *)self _inferUserSpecificPlaceTypeForInferredMapItem:v10 userSpecificPlaceType:buf userSpecificPlaceTypeSource:&v21 error:&v20];
  id v12 = v20;
  double v13 = v12;
  if (v11)
  {
    *a4 = +[RTPlaceInferenceManager learnedPlaceTypeFromUserSpecificPlaceType:*(void *)buf];
    unint64_t v14 = +[RTPlaceInferenceManager learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:v21];
  }
  else
  {
    if (a6) {
      *a6 = v12;
    }
    unint64_t v14 = 0;
    *a4 = 0;
  }
  *a5 = v14;

LABEL_24:
  return v11;
}

uint64_t __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  if (([v7 source] & 0x4000) != 0 || (objc_msgSend(v7, "source") & 0x80000) != 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
    goto LABEL_16;
  }
  if (([v7 source] & 1) != 0 || (objc_msgSend(v7, "source") & 0x40000) != 0)
  {
    uint64_t v5 = a1[6];
LABEL_15:
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
    goto LABEL_16;
  }
  if (([v7 source] & 0x2000) != 0)
  {
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
    uint64_t v5 = a1[7];
    goto LABEL_15;
  }
  uint64_t v4 = [v7 source];
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  if ((v4 & 0x10000) != 0)
  {
    uint64_t v5 = a1[8];
    goto LABEL_15;
  }
  [*(id *)(*(void *)(a1[9] + 8) + 40) addObject:v7];
  if (([v7 source] & 0x40) != 0) {
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
  }
  if (([v7 source] & 0x10) != 0
    || ([v7 source] & 0x40) != 0
    || ([v7 source] & 0x80) != 0)
  {
    *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 1;
  }
LABEL_16:

  return MEMORY[0x1F41817F8]();
}

void __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 mapItem];

  if (v3) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

void __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_241(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = [v5 firstObject];
    int v15 = 138412546;
    dispatch_time_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "fetched visit, %@, error, %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v9 = [v5 firstObject];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_onVisitManagerVisitIncidentNotification:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  id v7 = v11;
  if (v6)
  {
    unint64_t v8 = [v11 visitIncident];
    if ([v8 type] == 1)
    {
      uint64_t v9 = [v8 entry];
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = v9;
    }
    else
    {
      if ([v8 type] != 3)
      {
LABEL_7:

        id v7 = v11;
        goto LABEL_8;
      }
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = 0;
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)onVisitManagerVisitIncidentNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__RTPlaceInferenceManager_onVisitManagerVisitIncidentNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__RTPlaceInferenceManager_onVisitManagerVisitIncidentNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerVisitIncidentNotification:*(void *)(a1 + 40)];
}

- (void)_onPointOfInterestVisitNotification:(id)a3
{
  id v11 = a3;
  id v4 = [v11 name];
  id v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  id v7 = v11;
  if (v6)
  {
    id v8 = [v11 visit];
    if ([v8 type] == 1)
    {
      uint64_t v9 = [v8 entry];
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = v9;
    }
    id v7 = v11;
  }
}

- (void)onPointOfInterestVisitNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RTPlaceInferenceManager_onPointOfInterestVisitNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__RTPlaceInferenceManager_onPointOfInterestVisitNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onPointOfInterestVisitNotification:*(void *)(a1 + 40)];
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(RTPlaceInferenceManager *)self dailyMetrics];
  [v8 submit];
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__RTPlaceInferenceManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__RTPlaceInferenceManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

+ (unint64_t)learnedPlaceTypeFromUserSpecificPlaceType:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unint64_t)learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)userSpecificPlaceTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (unint64_t)userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)learnedPlaceTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (unint64_t)learnedPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if ((unint64_t)a3 > 1)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
  else
  {
    __int16 v11 = [(RTPlaceInferenceManager *)self placeInferenceQueryStore];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__RTPlaceInferenceManager__performPurgeOfType_referenceDate_completion___block_invoke;
    v12[3] = &unk_1E6B90C18;
    id v13 = v10;
    [v11 purgePlaceInferenceQueriesPredating:v8 handler:v12];
  }
}

uint64_t __72__RTPlaceInferenceManager__performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__RTPlaceInferenceManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __71__RTPlaceInferenceManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPurgeOfType:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTInferredMapItemFuser)inferredMapItemFuser
{
  return self->_inferredMapItemFuser;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setPlaceInferencesLimit:(unint64_t)a3
{
  self->_placeInferencesLimit = a3;
}

- (NSMutableArray)cachedLocations
{
  return self->_cachedLocations;
}

- (unint64_t)cachedLocationIndex
{
  return self->_cachedLocationIndex;
}

- (void)setDailyMetrics:(id)a3
{
}

- (NSDate)visitEntryTime
{
  return self->_visitEntryTime;
}

- (void)setVisitEntryTime:(id)a3
{
}

- (unint64_t)clientMappingIndex
{
  return self->_clientMappingIndex;
}

- (void)setClientMappingIndex:(unint64_t)a3
{
  self->_clientMappingIndex = a3;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_visitEntryTime, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_cachedLocations, 0);
  objc_storeStrong((id *)&self->_mapItemProviders, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_inferredMapItemFuser, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end