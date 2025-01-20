@interface RTPlaceTypeClassifierExpertInferred
- (RTBiomeManager)biomeManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTPlaceTypeClassifierExpertInferred)init;
- (RTPlaceTypeClassifierExpertInferred)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8;
- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator;
- (RTPlatform)platform;
- (id)classifyWithError:(id *)a3;
- (void)setBiomeManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3;
- (void)setPlatform:(id)a3;
@end

@implementation RTPlaceTypeClassifierExpertInferred

- (RTPlaceTypeClassifierExpertInferred)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_defaultsManager_distanceCalculator_learnedLocationStore_placeTypeClassifierMetricsCalculator_platform_);
}

- (RTPlaceTypeClassifierExpertInferred)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v29 = a6;
  id v28 = a7;
  id v18 = a8;
  if (!v15)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: biomeManager";
LABEL_20:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_21;
  }
  if (!v16)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_20;
  }
  if (!v17)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_20;
  }
  if (!v29)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_20;
  }
  if (!v28)
  {
    v22 = v18;
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
      goto LABEL_20;
    }
LABEL_21:

    v21 = 0;
    goto LABEL_22;
  }
  id v27 = v18;
  if (v18)
  {
    v30.receiver = self;
    v30.super_class = (Class)RTPlaceTypeClassifierExpertInferred;
    v19 = [(RTPlaceTypeClassifierExpertInferred *)&v30 init];
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_biomeManager, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 6, a8);
    }
    self = p_isa;
    v21 = self;
  }
  else
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_22:

  return v21;
}

- (id)classifyWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E016D870](self, a2);
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__70;
  v57 = __Block_byref_object_dispose__70;
  v4 = [RTLearnedPlaceTypeInferenceGenerator alloc];
  v5 = [(RTPlaceTypeClassifierExpertInferred *)self biomeManager];
  v6 = [(RTPlaceTypeClassifierExpertInferred *)self defaultsManager];
  v7 = [(RTPlaceTypeClassifierExpertInferred *)self distanceCalculator];
  v8 = [(RTPlaceTypeClassifierExpertInferred *)self learnedLocationStore];
  v9 = [(RTPlaceTypeClassifierExpertInferred *)self placeTypeClassifierMetricsCalculator];
  v10 = [(RTPlaceTypeClassifierExpertInferred *)self platform];
  v58 = [(RTLearnedPlaceTypeInferenceGenerator *)v4 initWithBiomeManager:v5 defaultsManager:v6 distanceCalculator:v7 learnedLocationStore:v8 placeTypeClassifierMetricsCalculator:v9 platform:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3628800.0];
  v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];

  id v15 = [[RTStoredLocationOfInterestEnumerationOptions alloc] initWithAscendingVisitEntryDate:1 batchSize:5 dateInterval:v14 singleVisit:0];
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v47 = 0;
  v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__70;
  v51 = __Block_byref_object_dispose__70;
  id v52 = 0;
  learnedLocationStore = self->_learnedLocationStore;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __57__RTPlaceTypeClassifierExpertInferred_classifyWithError___block_invoke;
  v43[3] = &unk_1E6B96880;
  v45 = &v47;
  v46 = &v53;
  id v18 = v16;
  v44 = v18;
  [(RTLearnedLocationStore *)learnedLocationStore enumerateStoredLocationsOfInterestWithOptions:v15 enumerationBlock:v43];
  v19 = v18;
  v20 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v21 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v19, v21)) {
    goto LABEL_6;
  }
  v22 = [MEMORY[0x1E4F1C9C8] now:context];
  [v22 timeIntervalSinceDate:v20];
  double v24 = v23;
  v25 = objc_opt_new();
  v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56];
  id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v28 = [v27 filteredArrayUsingPredicate:v26];
  id v29 = [v28 firstObject];

  [v25 submitToCoreAnalytics:v29 type:1 duration:v24];
  objc_super v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v59 count:1];
  v33 = [v31 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v32];

  if (v33)
  {
    id v34 = v33;

    char v35 = 0;
  }
  else
  {
LABEL_6:
    id v34 = 0;
    char v35 = 1;
  }

  id v36 = v34;
  if ((v35 & 1) == 0) {
    objc_storeStrong(v48 + 5, v34);
  }
  id v37 = v48[5];
  if (v37)
  {
    id v38 = v37;
    v39 = 0;
  }
  else
  {
    v39 = [(id)v54[5] inferPlaceTypes];
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  if (a3) {
    *a3 = v37;
  }

  return v39;
}

void __57__RTPlaceTypeClassifierExpertInferred_classifyWithError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          id v15 = (void *)MEMORY[0x1E016D870](v10);
          dispatch_semaphore_t v16 = [v14 place:v18];
          id v17 = [v14 visits];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) submitVisits:v17 place:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v11 = v10;
      }
      while (v10);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end