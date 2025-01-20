@interface SMSuggestionsMetricsManager
+ (id)stringFromSuggestionsMetricsEvent:(unint64_t)a3;
- (BOOL)_collectAndSubmitMetricsUponNotification:(id)a3;
- (BOOL)_submitMetrics:(id)a3 event:(unint64_t)a4 error:(id *)a5;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (SMSessionStore)sessionStore;
- (SMSuggestionsMetricsManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 sessionStore:(id)a5 suggestionsStore:(id)a6;
- (SMSuggestionsStore)suggestionsStore;
- (id)_computeDetailsMetricsWithError:(id *)a3;
- (id)_computeMetricsForEvent:(unint64_t)a3 error:(id *)a4;
- (id)_computeUsageMetricsWithError:(id *)a3;
- (id)_computeWorkoutAlwaysPromptMetricsWithError:(id *)a3;
- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (id)_getSelectedSessionForSuggestion:(id)a3 error:(id *)a4;
- (id)_getSessionConfigurationsForSuggestion:(id)a3 timeWindow:(double)a4 error:(id *)a5;
- (id)_getSuggestionsConsideredMetricsWithError:(id *)a3;
- (id)_getSuggestionsPresentedMetricsWithError:(id *)a3;
- (id)_getSuggestionsSelectedMetricsWithError:(id *)a3;
- (int64_t)_getSuggestionsCountConsideredForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (int64_t)_getSuggestionsCountPresentedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (int64_t)_getSuggestionsCountSelectedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (void)_setup;
- (void)_submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3;
- (void)collectAndSubmitMetricsUponNotification:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSuggestionsStore:(id)a3;
- (void)setup;
- (void)submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3;
@end

@implementation SMSuggestionsMetricsManager

- (SMSuggestionsMetricsManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 sessionStore:(id)a5 suggestionsStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SMSuggestionsMetricsManager;
  v15 = [(RTNotifier *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_defaultsManager, a3);
    objc_storeStrong((id *)&v16->_deviceLocationPredictor, a4);
    objc_storeStrong((id *)&v16->_sessionStore, a5);
    objc_storeStrong((id *)&v16->_suggestionsStore, a6);
    [(SMSuggestionsMetricsManager *)v16 setup];
  }

  return v16;
}

- (void)setup
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SMSuggestionsMetricsManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__SMSuggestionsMetricsManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_collectAndSubmitMetricsUponNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_submitWorkoutAlwaysPromptResponseMetricUponNotification_ name:@"SMSubmitSuggesionsWorkoutAlwaysPromptResponseNotification" object:0];
}

- (void)submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__SMSuggestionsMetricsManager_submitWorkoutAlwaysPromptResponseMetricUponNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __87__SMSuggestionsMetricsManager_submitWorkoutAlwaysPromptResponseMetricUponNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitWorkoutAlwaysPromptResponseMetricUponNotification:*(void *)(a1 + 40)];
}

- (void)_submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "%@, unexpected call to submit workout always prompt response on non-watch", (uint8_t *)&v6, 0xCu);
  }
}

- (void)collectAndSubmitMetricsUponNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SMSuggestionsMetricsManager_collectAndSubmitMetricsUponNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__SMSuggestionsMetricsManager_collectAndSubmitMetricsUponNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _collectAndSubmitMetricsUponNotification:*(void *)(a1 + 40)];
}

- (BOOL)_collectAndSubmitMetricsUponNotification:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v6 & 1) == 0)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v27 = [v4 name];
      *(_DWORD *)buf = 138412802;
      v39 = v27;
      __int16 v40 = 2080;
      v41 = "-[SMSuggestionsMetricsManager _collectAndSubmitMetricsUponNotification:]";
      __int16 v42 = 1024;
      int v43 = 176;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  id v8 = [v4 name];
  char v9 = [v8 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v9)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v10 = [&unk_1F3453468 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v29 = v4;
      id v12 = 0;
      BOOL v30 = 0;
      uint64_t v13 = *(void *)v34;
      while (1)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(&unk_1F3453468);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1E016D870]();
          unsigned int v17 = [v15 unsignedIntValue];
          v32 = v12;
          objc_super v18 = [(SMSuggestionsMetricsManager *)self _computeMetricsForEvent:v17 error:&v32];
          v19 = v32;

          if (v19)
          {
            v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
LABEL_20:
              v23 = [v19 localizedDescription];
              *(_DWORD *)buf = 138412290;
              v39 = v23;
              _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
            }
LABEL_16:

            id v12 = v19;
            goto LABEL_17;
          }
          unsigned int v21 = [v15 unsignedIntValue];
          id v31 = 0;
          BOOL v30 = [(SMSuggestionsMetricsManager *)self _submitMetrics:v18 event:v21 error:&v31];
          v22 = v31;
          if (v22)
          {
            v19 = v22;
            v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_20;
            }
            goto LABEL_16;
          }
          id v12 = 0;
LABEL_17:

          ++v14;
        }
        while (v11 != v14);
        uint64_t v24 = [&unk_1F3453468 countByEnumeratingWithState:&v33 objects:v37 count:16];
        uint64_t v11 = v24;
        if (!v24) {
          goto LABEL_26;
        }
      }
    }
    BOOL v25 = 0;
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v29 = v4;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v28 = [v4 name];
      *(_DWORD *)buf = 138412290;
      v39 = v28;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    BOOL v30 = 0;
LABEL_26:

    id v4 = v29;
    BOOL v25 = v30;
  }

  return v25;
}

- (id)_computeMetricsForEvent:(unint64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 3uLL:
      v15 = 0;
      v5 = [(SMSuggestionsMetricsManager *)self _computeWorkoutAlwaysPromptMetricsWithError:&v15];
      char v6 = v15;
      goto LABEL_7;
    case 2uLL:
      v16 = 0;
      v5 = [(SMSuggestionsMetricsManager *)self _computeUsageMetricsWithError:&v16];
      char v6 = v16;
LABEL_7:
      id v7 = v6;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 1uLL:
      unsigned int v17 = 0;
      v5 = [(SMSuggestionsMetricsManager *)self _computeDetailsMetricsWithError:&v17];
      char v6 = v17;
      goto LABEL_7;
  }
  char v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F99A48];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  uint64_t v11 = NSString;
  id v12 = [(id)objc_opt_class() stringFromSuggestionsMetricsEvent:a3];
  uint64_t v13 = [v11 stringWithFormat:@"requires a valid suggestions metric event. Passed, %@", v12];
  v19[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v7 = [v9 errorWithDomain:v10 code:7 userInfo:v14];

  v5 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v7;
LABEL_9:

  return v5;
}

- (id)_computeDetailsMetricsWithError:(id *)a3
{
  v246[1] = *MEMORY[0x1E4F143B8];
  uint64_t v231 = 0;
  v232 = &v231;
  uint64_t v233 = 0x3032000000;
  v234 = __Block_byref_object_copy__159;
  v235 = __Block_byref_object_dispose__159;
  id v236 = 0;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v164 = [v3 dateByAddingTimeInterval:-86400.0];
  v163 = v3;
  v178 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F999C0]);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v164 endDate:v163];
  v162 = (void *)[v4 initWithIncludeSuppressed:1 sortByCreationDate:1 ascending:1 dateInterval:v5 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v225 = 0;
  v226 = &v225;
  uint64_t v227 = 0x3032000000;
  v228 = __Block_byref_object_copy__159;
  v229 = __Block_byref_object_dispose__159;
  id v230 = 0;
  id v7 = [(SMSuggestionsMetricsManager *)self suggestionsStore];
  v221[0] = MEMORY[0x1E4F143A8];
  v221[1] = 3221225472;
  v221[2] = __63__SMSuggestionsMetricsManager__computeDetailsMetricsWithError___block_invoke;
  v221[3] = &unk_1E6B905F0;
  v223 = &v225;
  v224 = &v231;
  id v8 = v6;
  v222 = v8;
  [v7 fetchSuggestionsWithOptions:v162 handler:v221];

  dsema = v8;
  char v9 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v10)) {
    goto LABEL_6;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceDate:v9];
  double v13 = v12;
  uint64_t v14 = objc_opt_new();
  v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
  v16 = [MEMORY[0x1E4F29060] callStackSymbols];
  unsigned int v17 = [v16 filteredArrayUsingPredicate:v15];
  uint64_t v18 = [v17 firstObject];

  [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
  v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E4F28C58];
  v246[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  unsigned int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v246 count:1];
  v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

  if (v22)
  {
    id v23 = v22;
  }
  else
  {
LABEL_6:
    id v23 = 0;
  }

  id v24 = v23;
  v161 = v24;
  if (a3 && v24)
  {
    BOOL v25 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v154 = (objc_class *)objc_opt_class();
      NSStringFromClass(v154);
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      v156 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v155;
      __int16 v242 = 2112;
      id v243 = v156;
      __int16 v244 = 2112;
      uint64_t v245 = (uint64_t)v161;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    v26 = v161;
    goto LABEL_144;
  }
  if (!a3 || !v232[5])
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [(id)v226[5] count];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v242 = 2112;
      id v243 = v31;
      __int16 v244 = 2048;
      uint64_t v245 = v32;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, %@, fetchedSuggestions with count, %lu", buf, 0x20u);
    }
    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    obuint64_t j = (id)v226[5];
    uint64_t v170 = [obj countByEnumeratingWithState:&v217 objects:v240 count:16];
    if (!v170)
    {
LABEL_142:

      if (!a3) {
        goto LABEL_145;
      }
      goto LABEL_143;
    }
    uint64_t v169 = *(void *)v218;
LABEL_21:
    uint64_t v189 = 0;
LABEL_22:
    if (*(void *)v218 != v169) {
      objc_enumerationMutation(obj);
    }
    v192 = *(void **)(*((void *)&v217 + 1) + 8 * v189);
    context = (void *)MEMORY[0x1E016D870]();
    v191 = objc_opt_new();
    long long v33 = (void *)v232[5];
    v232[5] = 0;

    long long v34 = [v192 sourceLocation];
    long long v35 = [v192 creationDate];
    long long v36 = (id *)(v232 + 5);
    id v216 = (id)v232[5];
    v37 = [(SMSuggestionsMetricsManager *)self _getNPLOIsWithOnlyHighConfidence:1 location:v34 date:v35 error:&v216];
    objc_storeStrong(v36, v216);

    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    id v190 = v37;
    uint64_t v38 = [v190 countByEnumeratingWithState:&v212 objects:v239 count:16];
    if (!v38)
    {
      char v194 = 0;
      goto LABEL_45;
    }
    char v194 = 0;
    uint64_t v39 = *(void *)v213;
    while (1)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v213 != v39) {
          objc_enumerationMutation(v190);
        }
        v41 = *(void **)(*((void *)&v212 + 1) + 8 * i);
        __int16 v42 = (void *)MEMORY[0x1E016D870]();
        *(void *)buf = 0;
        v246[0] = 0;
        double v211 = 0.0;
        double v210 = 0.0;
        int v43 = [v41 locationOfInterest];
        uint64_t v44 = [v43 location];
        [v44 latitude];
        v45 = [v41 locationOfInterest];
        v46 = [v45 location];
        [v46 longitude];
        RTCommonCalculateBoundingBox();

        v47 = [v192 destinationLocation];
        if (!v47) {
          goto LABEL_32;
        }
        double v48 = *(double *)buf;
        v49 = [v192 destinationLocation];
        [v49 latitude];
        if (v48 > v50)
        {

LABEL_32:
          BOOL v51 = 0;
          goto LABEL_40;
        }
        v52 = [v192 destinationLocation];
        [v52 latitude];
        if (v53 <= v211)
        {
          double v54 = *(double *)v246;
          v55 = [v192 destinationLocation];
          [v55 longitude];
          if (v54 <= v56)
          {
            v57 = [v192 destinationLocation];
            [v57 longitude];
            BOOL v51 = v58 <= v210;
          }
          else
          {
            BOOL v51 = 0;
          }
        }
        else
        {
          BOOL v51 = 0;
        }

        v194 |= v51;
LABEL_40:
        if (v51) {
          goto LABEL_45;
        }
      }
      uint64_t v38 = [v190 countByEnumeratingWithState:&v212 objects:v239 count:16];
      if (!v38)
      {
LABEL_45:

        uint64_t v59 = v232[5];
        if (v59)
        {
          v60 = 0;
        }
        else
        {
          v177 = [NSNumber numberWithBool:v194 & 1];
          v60 = v177;
        }
        [v191 setObject:v60 forKeyedSubscript:@"nploi_match_historicalSessionDestination"];
        if (!v59) {

        }
        uint64_t v61 = v232[5];
        if (v61)
        {
          v62 = 0;
        }
        else
        {
          v176 = [NSNumber numberWithUnsignedInteger:[v190 count]];
          v62 = v176;
        }
        [v191 setObject:v62 forKeyedSubscript:@"nploiCount"];
        if (!v61) {

        }
        v63 = [NSNumber numberWithUnsignedInteger:[v192 suggestionUserType]];
        [v191 setObject:v63 forKeyedSubscript:@"policy"];

        v64 = (void *)v232[5];
        v232[5] = 0;

        v65 = (id *)(v232 + 5);
        id v209 = (id)v232[5];
        v66 = [(SMSuggestionsMetricsManager *)self _getSessionConfigurationsForSuggestion:v192 timeWindow:&v209 error:30.0];
        objc_storeStrong(v65, v209);
        uint64_t v67 = v232[5];
        if (v67)
        {
          v68 = 0;
        }
        else
        {
          v175 = [NSNumber numberWithUnsignedInteger:[v66 count]];
          v68 = v175;
        }
        [v191 setObject:v68 forKeyedSubscript:@"previousSessionCount_plusMinus30"];
        if (!v67) {

        }
        v195 = objc_opt_new();
        long long v208 = 0u;
        long long v206 = 0u;
        long long v207 = 0u;
        long long v205 = 0u;
        id v69 = v66;
        uint64_t v70 = [v69 countByEnumeratingWithState:&v205 objects:v238 count:16];
        if (v70)
        {
          uint64_t v71 = *(void *)v206;
          do
          {
            for (uint64_t j = 0; j != v70; ++j)
            {
              if (*(void *)v206 != v71) {
                objc_enumerationMutation(v69);
              }
              v73 = *(void **)(*((void *)&v205 + 1) + 8 * j);
              v74 = (void *)MEMORY[0x1E016D870]();
              v75 = [v73 conversation];
              v76 = [v75 receiverHandles];
              BOOL v77 = (unint64_t)[v76 count] > 1;

              if (v77)
              {
                v78 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  v79 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v79);
                  id v80 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v81 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v80;
                  __int16 v242 = 2112;
                  id v243 = v81;
                  __int16 v244 = 2112;
                  uint64_t v245 = (uint64_t)v73;
                  _os_log_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_INFO, "%@, %@, not considering group sessions for metric, %@", buf, 0x20u);
                }
              }
              else
              {
                v82 = [v73 conversation];
                v83 = [v82 receiverHandles];
                v84 = [v83 firstObject];
                v85 = [v84 primaryHandle];

                if (!v85) {
                  goto LABEL_71;
                }
                v78 = [v73 conversation];
                v86 = [v78 receiverHandles];
                v87 = [v86 firstObject];
                v88 = [v87 primaryHandle];
                [v195 addObject:v88];
              }
LABEL_71:
            }
            uint64_t v70 = [v69 countByEnumeratingWithState:&v205 objects:v238 count:16];
          }
          while (v70);
        }

        uint64_t v89 = v232[5];
        if (v89)
        {
          v90 = 0;
        }
        else
        {
          v174 = [NSNumber numberWithUnsignedInteger:[v195 count]];
          v90 = v174;
        }
        [v191 setObject:v90 forKeyedSubscript:@"previousSessionReceiverCount_plusMinus30"];
        if (!v89) {

        }
        v91 = (void *)v232[5];
        v232[5] = 0;

        v92 = (id *)(v232 + 5);
        id v204 = (id)v232[5];
        v93 = [(SMSuggestionsMetricsManager *)self _getSessionConfigurationsForSuggestion:v192 timeWindow:&v204 error:60.0];
        objc_storeStrong(v92, v204);

        uint64_t v94 = v232[5];
        if (v94)
        {
          v95 = 0;
        }
        else
        {
          v173 = [NSNumber numberWithUnsignedInteger:[v93 count]];
          v95 = v173;
        }
        [v191 setObject:v95 forKeyedSubscript:@"previousSessionCount_plusMinus60"];
        if (!v94) {

        }
        v193 = objc_opt_new();
        long long v202 = 0u;
        long long v203 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        id v96 = v93;
        uint64_t v97 = [v96 countByEnumeratingWithState:&v200 objects:v237 count:16];
        if (v97)
        {
          uint64_t v98 = *(void *)v201;
          do
          {
            for (uint64_t k = 0; k != v97; ++k)
            {
              if (*(void *)v201 != v98) {
                objc_enumerationMutation(v96);
              }
              v100 = *(void **)(*((void *)&v200 + 1) + 8 * k);
              v101 = (void *)MEMORY[0x1E016D870]();
              v102 = [v100 conversation];
              v103 = [v102 receiverHandles];
              BOOL v104 = (unint64_t)[v103 count] > 1;

              if (v104)
              {
                v105 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                {
                  v106 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v106);
                  id v107 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  id v108 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v107;
                  __int16 v242 = 2112;
                  id v243 = v108;
                  __int16 v244 = 2112;
                  uint64_t v245 = (uint64_t)v100;
                  _os_log_impl(&dword_1D9BFA000, v105, OS_LOG_TYPE_INFO, "%@, %@, not considering group sessions for metric, %@", buf, 0x20u);
                }
              }
              else
              {
                v109 = [v100 conversation];
                v110 = [v109 receiverHandles];
                v111 = [v110 firstObject];
                v112 = [v111 primaryHandle];

                if (!v112) {
                  goto LABEL_94;
                }
                v105 = [v100 conversation];
                v113 = [v105 receiverHandles];
                v114 = [v113 firstObject];
                v115 = [v114 primaryHandle];
                [v193 addObject:v115];
              }
LABEL_94:
            }
            uint64_t v97 = [v96 countByEnumeratingWithState:&v200 objects:v237 count:16];
          }
          while (v97);
        }

        uint64_t v116 = v232[5];
        if (v116)
        {
          v117 = 0;
        }
        else
        {
          v172 = [NSNumber numberWithUnsignedInteger:[v193 count]];
          v117 = v172;
        }
        [v191 setObject:v117 forKeyedSubscript:@"previousSessionReceiverCount_plusMinus60"];
        if (!v116) {

        }
        v118 = [NSNumber numberWithInt:objc_msgSend(v192, "suppressionReason") == 1];
        [v191 setObject:v118 forKeyedSubscript:@"suggestionPresented"];

        v119 = (void *)v232[5];
        v232[5] = 0;

        if ([v192 suppressionReason] == 1)
        {
          v120 = (id *)(v232 + 5);
          id v199 = (id)v232[5];
          v196 = [(SMSuggestionsMetricsManager *)self _getSelectedSessionForSuggestion:v192 error:&v199];
          objc_storeStrong(v120, v199);
        }
        else
        {
          v196 = 0;
        }
        uint64_t v121 = v232[5];
        if (v121)
        {
          v122 = 0;
        }
        else
        {
          v171 = [NSNumber numberWithInt:v196 != 0];
          v122 = v171;
        }
        [v191 setObject:v122 forKeyedSubscript:@"suggestionSelected"];
        if (!v121) {

        }
        *(void *)buf = 0;
        v246[0] = 0;
        double v211 = 0.0;
        double v210 = 0.0;
        v123 = [v196 destination];
        v124 = [v123 location];
        [v124 latitude];
        v125 = [v196 destination];
        v126 = [v125 location];
        [v126 longitude];
        RTCommonCalculateBoundingBox();

        v127 = [v192 destinationLocation];
        if (v127)
        {
          double v128 = *(double *)buf;
          v129 = [v192 destinationLocation];
          [v129 latitude];
          if (v128 <= v130)
          {
            v131 = [v192 destinationLocation];
            [v131 latitude];
            if (v132 <= v211)
            {
              double v133 = *(double *)v246;
              v134 = [v192 destinationLocation];
              [v134 longitude];
              if (v133 <= v135)
              {
                v136 = [v192 destinationLocation];
                [v136 longitude];
                BOOL v180 = v137 <= v210;
              }
              else
              {
                BOOL v180 = 0;
              }
            }
            else
            {
              BOOL v180 = 0;
            }
          }
          else
          {
            BOOL v180 = 0;
          }
        }
        else
        {
          BOOL v180 = 0;
        }

        v188 = [v192 buddy];
        v138 = [v188 phoneNumber];
        if (v138)
        {
          v186 = [v192 buddy];
          v181 = [v186 phoneNumber];
          v185 = [v196 conversation];
          v184 = [v185 receiverHandles];
          v183 = [v184 firstObject];
          v182 = [v183 primaryHandle];
          if ([v181 isEqualToString:v182])
          {
            LOBYTE(v139) = 1;
            goto LABEL_130;
          }
        }
        v140 = [v192 buddy];
        v141 = [v140 email];
        if (v141)
        {
          v142 = [v192 buddy];
          v179 = [v142 email];
          v143 = [v196 conversation];
          v144 = [v143 receiverHandles];
          v145 = [v144 firstObject];
          v146 = [v145 primaryHandle];
          int v139 = [v179 isEqualToString:v146];

          if (!v138)
          {

            if (!v139)
            {
LABEL_133:
              uint64_t v147 = 1;
              goto LABEL_134;
            }
LABEL_131:
            uint64_t v147 = !v180;
LABEL_134:
            if (v196 && !v232[5])
            {
              v168 = [NSNumber numberWithBool:v147];
              int v148 = 1;
              v149 = v168;
            }
            else
            {
              int v148 = 0;
              v149 = 0;
            }
            [v191 setObject:v149 forKeyedSubscript:@"suggestionSelected_configurationModified"];
            if (v148) {

            }
            v150 = [NSNumber numberWithUnsignedInteger:[v192 suppressionReason]];
            [v191 setObject:v150 forKeyedSubscript:@"suppressionReason"];

            v151 = [NSNumber numberWithUnsignedInteger:[v192 suggestionTrigger]];
            [v191 setObject:v151 forKeyedSubscript:@"trigger"];

            [v178 addObject:v191];
            if (++v189 == v170)
            {
              uint64_t v170 = [obj countByEnumeratingWithState:&v217 objects:v240 count:16];
              if (!v170) {
                goto LABEL_142;
              }
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }
        else
        {

          if (!v138)
          {

            goto LABEL_133;
          }
          LOBYTE(v139) = 0;
        }
LABEL_130:

        if ((v139 & 1) == 0) {
          goto LABEL_133;
        }
        goto LABEL_131;
      }
    }
  }
  v27 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v157 = (objc_class *)objc_opt_class();
    NSStringFromClass(v157);
    id v158 = (id)objc_claimAutoreleasedReturnValue();
    v159 = NSStringFromSelector(a2);
    uint64_t v160 = v232[5];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v158;
    __int16 v242 = 2112;
    id v243 = v159;
    __int16 v244 = 2112;
    uint64_t v245 = v160;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
  }
LABEL_143:
  v26 = (void *)v232[5];
LABEL_144:
  *a3 = v26;
LABEL_145:
  id v152 = v178;

  _Block_object_dispose(&v225, 8);
  _Block_object_dispose(&v231, 8);

  return v152;
}

void __63__SMSuggestionsMetricsManager__computeDetailsMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_computeUsageMetricsWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = objc_opt_new();
  id v31 = 0;
  uint64_t v7 = [(SMSuggestionsMetricsManager *)self _getSuggestionsConsideredMetricsWithError:&v31];
  id v8 = v31;
  uint64_t v9 = v8;
  if (a3 && v8)
  {
    dispatch_time_t v10 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      unsigned int v21 = NSStringFromClass(v20);
      v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v21;
      __int16 v38 = 2112;
      uint64_t v39 = v22;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v11 = v9;
    *a3 = v11;
    long long v35 = v6;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  }
  else
  {
    [v6 addEntriesFromDictionary:v7];
    id v30 = v9;
    double v13 = [(SMSuggestionsMetricsManager *)self _getSuggestionsPresentedMetricsWithError:&v30];
    id v14 = v30;

    if (a3 && v14)
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v23 = (objc_class *)objc_opt_class();
        id v24 = NSStringFromClass(v23);
        BOOL v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v37 = v24;
        __int16 v38 = 2112;
        uint64_t v39 = v25;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v11 = v14;
      *a3 = v11;
      long long v34 = v6;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    }
    else
    {
      [v6 addEntriesFromDictionary:v13];
      id v29 = v14;
      v16 = [(SMSuggestionsMetricsManager *)self _getSuggestionsSelectedMetricsWithError:&v29];
      id v11 = v29;

      if (a3 && v11)
      {
        unsigned int v17 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          v28 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v37 = v27;
          __int16 v38 = 2112;
          uint64_t v39 = v28;
          __int16 v40 = 2112;
          id v41 = v11;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
        }
        *a3 = v11;
        long long v33 = v6;
        uint64_t v18 = &v33;
      }
      else
      {
        [v6 addEntriesFromDictionary:v16];
        if (a3) {
          *a3 = v11;
        }
        uint64_t v32 = v6;
        uint64_t v18 = &v32;
      }
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
  }

  return v12;
}

- (id)_getSuggestionsConsideredMetricsWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v6 dateByAddingTimeInterval:-86400.0];
  id v8 = [v6 dateByAddingTimeInterval:-604800.0];
  uint64_t v9 = [v6 dateByAddingTimeInterval:-2419200.0];
  id v35 = 0;
  int64_t v10 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountConsideredForPastDate:v7 endDate:v6 error:&v35];
  id v11 = v35;
  id v12 = v11;
  if (a3 && v11)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      NSStringFromSelector(a2);
      unsigned int v17 = v16 = v5;
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      id v5 = v16;
    }
    goto LABEL_15;
  }
  uint64_t v32 = v5;
  id v34 = v11;
  int64_t v18 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountConsideredForPastDate:v8 endDate:v6 error:&v34];
  id v19 = v34;

  if (a3 && v19)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      BOOL v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      __int16 v38 = 2112;
      uint64_t v39 = v26;
      __int16 v40 = 2112;
      id v41 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v12 = v19;
LABEL_14:
    id v5 = v32;
LABEL_15:

LABEL_16:
    id v12 = v12;
    *a3 = v12;
    goto LABEL_17;
  }
  id v33 = v19;
  int64_t v30 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountConsideredForPastDate:v9 endDate:v6 error:&v33];
  id v12 = v33;

  if (a3 && v12)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      __int16 v38 = 2112;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsConsidered_daily"];
  }
  else
  {
    unsigned int v21 = [NSNumber numberWithUnsignedInteger:v10];
    [v32 setObject:v21 forKeyedSubscript:@"suggestionsConsidered_daily"];
  }
  if (v18 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsConsidered_weekly"];
  }
  else
  {
    v22 = [NSNumber numberWithUnsignedInteger:v18];
    [v32 setObject:v22 forKeyedSubscript:@"suggestionsConsidered_weekly"];
  }
  if (v30 == -1)
  {
    id v5 = v32;
    [v32 setObject:0 forKeyedSubscript:@"suggestionsConsidered_monthly"];
    if (a3) {
      goto LABEL_16;
    }
  }
  else
  {
    id v23 = [NSNumber numberWithUnsignedInteger:];
    id v5 = v32;
    [v32 setObject:v23 forKeyedSubscript:@"suggestionsConsidered_monthly"];

    if (a3) {
      goto LABEL_16;
    }
  }
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountConsideredForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    int64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"startDate");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v31;
    goto LABEL_18;
  }
  if (!v10)
  {
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"endDate");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ([v9 compare:v10] == -1)
  {
    *(void *)buf = 0;
    v60 = buf;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__159;
    v63 = __Block_byref_object_dispose__159;
    id v64 = 0;
    id v12 = objc_alloc(MEMORY[0x1E4F999C0]);
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v11];
    double v50 = (void *)[v12 initWithIncludeSuppressed:1 sortByCreationDate:0 ascending:0 dateInterval:v13 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v55 = 0;
    double v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    v15 = [(SMSuggestionsMetricsManager *)self suggestionsStore];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __87__SMSuggestionsMetricsManager__getSuggestionsCountConsideredForPastDate_endDate_error___block_invoke;
    v51[3] = &unk_1E6B908E0;
    double v53 = &v55;
    double v54 = buf;
    v16 = v14;
    v52 = v16;
    [v15 fetchSuggestionsCountWithOptions:v50 handler:v51];

    unsigned int v17 = v16;
    v49 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v18)) {
      goto LABEL_20;
    }
    double v48 = [MEMORY[0x1E4F1C9C8] now];
    [v48 timeIntervalSinceDate:v49];
    double v20 = v19;
    v47 = objc_opt_new();
    unsigned int v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
    v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v47 submitToCoreAnalytics:v24 type:1 duration:v20];
    BOOL v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v65, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F28C58];
    v70[0] = *MEMORY[0x1E4F28568];
    *(void *)v65 = @"semaphore wait timeout";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v70 count:1];
    v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;
    }
    else
    {
LABEL_20:
      id v29 = 0;
    }

    id v35 = v29;
    long long v36 = v35;
    if (a5 && v35)
    {
      v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = NSStringFromSelector(a2);
        *(_DWORD *)v65 = 138412802;
        *(void *)&v65[4] = v41;
        __int16 v66 = 2112;
        uint64_t v67 = v42;
        __int16 v68 = 2112;
        id v69 = v36;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);
      }
      id v38 = v36;
    }
    else
    {
      if (!a5 || !*((void *)v60 + 5))
      {
        int64_t v33 = v56[3];
        goto LABEL_33;
      }
      uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = NSStringFromSelector(a2);
        v46 = (void *)*((void *)v60 + 5);
        *(_DWORD *)v65 = 138412802;
        *(void *)&v65[4] = v44;
        __int16 v66 = 2112;
        uint64_t v67 = v45;
        __int16 v68 = 2112;
        id v69 = v46;
        _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);
      }
      id v38 = *((id *)v60 + 5);
    }
    *a5 = v38;
    int64_t v33 = -1;
LABEL_33:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_19;
  }
LABEL_18:
  int64_t v33 = -1;
LABEL_19:

  return v33;
}

void __87__SMSuggestionsMetricsManager__getSuggestionsCountConsideredForPastDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getSuggestionsPresentedMetricsWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v6 dateByAddingTimeInterval:-86400.0];
  id v8 = [v6 dateByAddingTimeInterval:-604800.0];
  id v9 = [v6 dateByAddingTimeInterval:-2419200.0];
  id v35 = 0;
  int64_t v10 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountPresentedForPastDate:v7 endDate:v6 error:&v35];
  id v11 = v35;
  id v12 = v11;
  if (a3 && v11)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      dispatch_semaphore_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      NSStringFromSelector(a2);
      unsigned int v17 = v16 = v5;
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      id v5 = v16;
    }
    goto LABEL_15;
  }
  uint64_t v32 = v5;
  id v34 = v11;
  int64_t v18 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountPresentedForPastDate:v8 endDate:v6 error:&v34];
  id v19 = v34;

  if (a3 && v19)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      BOOL v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      __int16 v38 = 2112;
      uint64_t v39 = v26;
      __int16 v40 = 2112;
      id v41 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v12 = v19;
LABEL_14:
    id v5 = v32;
LABEL_15:

LABEL_16:
    id v12 = v12;
    *a3 = v12;
    goto LABEL_17;
  }
  id v33 = v19;
  int64_t v30 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountPresentedForPastDate:v9 endDate:v6 error:&v33];
  id v12 = v33;

  if (a3 && v12)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      __int16 v38 = 2112;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsPresented_daily"];
  }
  else
  {
    unsigned int v21 = [NSNumber numberWithUnsignedInteger:v10];
    [v32 setObject:v21 forKeyedSubscript:@"suggestionsPresented_daily"];
  }
  if (v18 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsPresented_weekly"];
  }
  else
  {
    v22 = [NSNumber numberWithUnsignedInteger:v18];
    [v32 setObject:v22 forKeyedSubscript:@"suggestionsPresented_weekly"];
  }
  if (v30 == -1)
  {
    id v5 = v32;
    [v32 setObject:0 forKeyedSubscript:@"suggestionsPresented_monthly"];
    if (a3) {
      goto LABEL_16;
    }
  }
  else
  {
    id v23 = [NSNumber numberWithUnsignedInteger:];
    id v5 = v32;
    [v32 setObject:v23 forKeyedSubscript:@"suggestionsPresented_monthly"];

    if (a3) {
      goto LABEL_16;
    }
  }
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountPresentedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    int64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"startDate");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v31;
    goto LABEL_18;
  }
  if (!v10)
  {
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"endDate");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ([v9 compare:v10] == -1)
  {
    *(void *)buf = 0;
    v60 = buf;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__159;
    v63 = __Block_byref_object_dispose__159;
    id v64 = 0;
    id v12 = objc_alloc(MEMORY[0x1E4F999C0]);
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v11];
    double v50 = (void *)[v12 initWithIncludeSuppressed:0 sortByCreationDate:0 ascending:0 dateInterval:v13 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v55 = 0;
    double v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    v15 = [(SMSuggestionsMetricsManager *)self suggestionsStore];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __86__SMSuggestionsMetricsManager__getSuggestionsCountPresentedForPastDate_endDate_error___block_invoke;
    v51[3] = &unk_1E6B908E0;
    double v53 = &v55;
    double v54 = buf;
    v16 = v14;
    v52 = v16;
    [v15 fetchSuggestionsCountWithOptions:v50 handler:v51];

    unsigned int v17 = v16;
    v49 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v18)) {
      goto LABEL_20;
    }
    double v48 = [MEMORY[0x1E4F1C9C8] now];
    [v48 timeIntervalSinceDate:v49];
    double v20 = v19;
    v47 = objc_opt_new();
    unsigned int v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
    v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v47 submitToCoreAnalytics:v24 type:1 duration:v20];
    BOOL v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v65, 2u);
    }

    v26 = (void *)MEMORY[0x1E4F28C58];
    v70[0] = *MEMORY[0x1E4F28568];
    *(void *)v65 = @"semaphore wait timeout";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v70 count:1];
    v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;
    }
    else
    {
LABEL_20:
      id v29 = 0;
    }

    id v35 = v29;
    long long v36 = v35;
    if (a5 && v35)
    {
      v37 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = NSStringFromSelector(a2);
        *(_DWORD *)v65 = 138412802;
        *(void *)&v65[4] = v41;
        __int16 v66 = 2112;
        uint64_t v67 = v42;
        __int16 v68 = 2112;
        id v69 = v36;
        _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);
      }
      id v38 = v36;
    }
    else
    {
      if (!a5 || !*((void *)v60 + 5))
      {
        int64_t v33 = v56[3];
        goto LABEL_33;
      }
      uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = NSStringFromSelector(a2);
        v46 = (void *)*((void *)v60 + 5);
        *(_DWORD *)v65 = 138412802;
        *(void *)&v65[4] = v44;
        __int16 v66 = 2112;
        uint64_t v67 = v45;
        __int16 v68 = 2112;
        id v69 = v46;
        _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);
      }
      id v38 = *((id *)v60 + 5);
    }
    *a5 = v38;
    int64_t v33 = -1;
LABEL_33:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_19;
  }
LABEL_18:
  int64_t v33 = -1;
LABEL_19:

  return v33;
}

void __86__SMSuggestionsMetricsManager__getSuggestionsCountPresentedForPastDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getSuggestionsSelectedMetricsWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v6 dateByAddingTimeInterval:-86400.0];
  id v8 = [v6 dateByAddingTimeInterval:-604800.0];
  id v9 = [v6 dateByAddingTimeInterval:-2419200.0];
  id v35 = 0;
  int64_t v10 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountSelectedForPastDate:v7 endDate:v6 error:&v35];
  id v11 = v35;
  id v12 = v11;
  if (a3 && v11)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      dispatch_semaphore_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      NSStringFromSelector(a2);
      unsigned int v17 = v16 = v5;
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      id v5 = v16;
    }
    goto LABEL_15;
  }
  uint64_t v32 = v5;
  id v34 = v11;
  int64_t v18 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountSelectedForPastDate:v8 endDate:v6 error:&v34];
  id v19 = v34;

  if (a3 && v19)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      BOOL v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      __int16 v38 = 2112;
      uint64_t v39 = v26;
      __int16 v40 = 2112;
      id v41 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v12 = v19;
LABEL_14:
    id v5 = v32;
LABEL_15:

LABEL_16:
    id v12 = v12;
    *a3 = v12;
    goto LABEL_17;
  }
  id v33 = v19;
  int64_t v30 = [(SMSuggestionsMetricsManager *)self _getSuggestionsCountSelectedForPastDate:v9 endDate:v6 error:&v33];
  id v12 = v33;

  if (a3 && v12)
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      __int16 v38 = 2112;
      uint64_t v39 = v29;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsSelected_daily"];
  }
  else
  {
    unsigned int v21 = [NSNumber numberWithUnsignedInteger:v10];
    [v32 setObject:v21 forKeyedSubscript:@"suggestionsSelected_daily"];
  }
  if (v18 == -1)
  {
    [v32 setObject:0 forKeyedSubscript:@"suggestionsSelected_weekly"];
  }
  else
  {
    v22 = [NSNumber numberWithUnsignedInteger:v18];
    [v32 setObject:v22 forKeyedSubscript:@"suggestionsSelected_weekly"];
  }
  if (v30 == -1)
  {
    id v5 = v32;
    [v32 setObject:0 forKeyedSubscript:@"suggestionsSelected_monthly"];
    if (a3) {
      goto LABEL_16;
    }
  }
  else
  {
    id v23 = [NSNumber numberWithUnsignedInteger:];
    id v5 = v32;
    [v32 setObject:v23 forKeyedSubscript:@"suggestionsSelected_monthly"];

    if (a3) {
      goto LABEL_16;
    }
  }
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountSelectedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v168[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v121 = v10;
  v122 = v9;
  if (!v9)
  {
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"startDate");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v32;
    goto LABEL_18;
  }
  if (!v10)
  {
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5) {
      goto LABEL_18;
    }
    _RTErrorInvalidParameterCreate(@"endDate");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ([v9 compare:v10] != -1)
  {
LABEL_18:
    int64_t v34 = -1;
    goto LABEL_19;
  }
  context = self;
  aSelector = a2;
  *(void *)buf = 0;
  int v148 = buf;
  uint64_t v149 = 0x3032000000;
  v150 = __Block_byref_object_copy__159;
  v151 = __Block_byref_object_dispose__159;
  id v152 = 0;
  id v11 = objc_alloc(MEMORY[0x1E4F999C0]);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v121];
  uint64_t v116 = *MEMORY[0x1E4F99C18];
  v113 = (void *)[v11 initWithBatchSize:*MEMORY[0x1E4F99C18] fetchLimit:10000 offset:*MEMORY[0x1E4F99C18] includeSuppressed:0 sortByCreationDate:1 ascending:1 dateInterval:v12 filteredToSuggestionTriggers:0 filteredToSuggestionUserTypes:0 filteredToSessionTypes:0];

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__159;
  v145 = __Block_byref_object_dispose__159;
  id v146 = 0;
  dispatch_semaphore_t v14 = [(SMSuggestionsMetricsManager *)context suggestionsStore];
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke;
  v137[3] = &unk_1E6B905F0;
  int v139 = &v141;
  v140 = buf;
  v15 = v13;
  v138 = v15;
  [v14 fetchSuggestionsWithOptions:v113 handler:v137];

  dsema = v15;
  v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v17)) {
    goto LABEL_20;
  }
  int64_t v18 = [MEMORY[0x1E4F1C9C8] now];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;
  unsigned int v21 = objc_opt_new();
  v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
  id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v24 = [v23 filteredArrayUsingPredicate:v22];
  BOOL v25 = [v24 firstObject];

  [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v162 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v162, 2u);
  }

  v27 = (void *)MEMORY[0x1E4F28C58];
  *(void *)v157 = *MEMORY[0x1E4F28568];
  *(void *)v162 = @"semaphore wait timeout";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v162 forKeys:v157 count:1];
  id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (v29)
  {
    id v30 = v29;
  }
  else
  {
LABEL_20:
    id v30 = 0;
  }

  long long v36 = (uint64_t (*)(uint64_t, uint64_t))v30;
  v37 = v36;
  if (a5 && v36)
  {
    __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      id v83 = (id)objc_claimAutoreleasedReturnValue();
      v84 = NSStringFromSelector(aSelector);
      *(_DWORD *)v162 = 138412802;
      *(void *)&v162[4] = v83;
      *(_WORD *)&v162[12] = 2112;
      *(void *)&v162[14] = v84;
      *(_WORD *)&v162[22] = 2112;
      v163 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v162, 0x20u);
    }
    uint64_t v39 = v37;
    v37 = v39;
    goto LABEL_34;
  }
  if (a5 && *((void *)v148 + 5))
  {
    __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v99 = (objc_class *)objc_opt_class();
      NSStringFromClass(v99);
      id v100 = (id)objc_claimAutoreleasedReturnValue();
      v101 = NSStringFromSelector(aSelector);
      v102 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v148 + 5);
      *(_DWORD *)v162 = 138412802;
      *(void *)&v162[4] = v100;
      *(_WORD *)&v162[12] = 2112;
      *(void *)&v162[14] = v101;
      *(_WORD *)&v162[22] = 2112;
      v163 = v102;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v162, 0x20u);
    }
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t))*((id *)v148 + 5);
    goto LABEL_34;
  }
  if ([(id)v142[5] count] == 10000)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v166 = *MEMORY[0x1E4F28568];
    uint64_t v42 = NSString;
    int v43 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v43);
    v45 = NSStringFromSelector(aSelector);
    v46 = [v42 stringWithFormat:@"%@, %@, suggestions reached max database objects count, %lu, dropping further evaluation", v44, v45, [v142[5] count]];
    v167 = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
    uint64_t v48 = [v41 initWithDomain:*MEMORY[0x1E4F99A48] code:12 userInfo:v47];
    v49 = (void *)*((void *)v148 + 5);
    *((void *)v148 + 5) = v48;

    if (!a5)
    {
LABEL_35:
      int64_t v34 = -1;
      goto LABEL_36;
    }
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t))*((id *)v148 + 5);
LABEL_34:
    *a5 = v39;
    goto LABEL_35;
  }
  id v50 = objc_alloc(MEMORY[0x1E4F99920]);
  BOOL v51 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v122 endDate:v121];
  LOBYTE(v110) = 0;
  v111 = (void *)[v50 initWithBatchSize:v116 fetchLimit:10000 sortBySessionStartDate:1 ascending:1 sessionTypes:&unk_1F3453480 timeInADayInterval:0 pickOneConfigInTimeInADayInterval:v110 dateInterval:v51 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];

  dispatch_semaphore_t v52 = dispatch_semaphore_create(0);
  *(void *)v162 = 0;
  *(void *)&v162[8] = v162;
  *(void *)&v162[16] = 0x3032000000;
  v163 = __Block_byref_object_copy__159;
  v164 = __Block_byref_object_dispose__159;
  id v165 = 0;
  double v53 = [(SMSuggestionsMetricsManager *)context sessionStore];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke_133;
  v133[3] = &unk_1E6B905F0;
  double v135 = v162;
  v136 = buf;
  double v54 = v52;
  v134 = v54;
  [v53 fetchSessionConfigurationsWithOptions:v111 handler:v133];

  dsema = v54;
  uint64_t v55 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v56 = dispatch_time(0, 3600000000000);
  uint64_t v57 = v37;
  if (dispatch_semaphore_wait(dsema, v56))
  {
    v117 = [MEMORY[0x1E4F1C9C8] now];
    [v117 timeIntervalSinceDate:v55];
    double v59 = v58;
    v60 = objc_opt_new();
    uint64_t v61 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
    v62 = [MEMORY[0x1E4F29060] callStackSymbols];
    v63 = [v62 filteredArrayUsingPredicate:v61];
    id v64 = [v63 firstObject];

    [v60 submitToCoreAnalytics:v64 type:1 duration:v59];
    v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v157 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v157, 2u);
    }

    __int16 v66 = (void *)MEMORY[0x1E4F28C58];
    v168[0] = *MEMORY[0x1E4F28568];
    *(void *)v157 = @"semaphore wait timeout";
    uint64_t v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v168 count:1];
    __int16 v68 = [v66 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v67];

    uint64_t v57 = v37;
    if (v68)
    {
      uint64_t v57 = v68;
    }
  }

  v112 = v57;
  if (v112) {
    BOOL v69 = a5 != 0;
  }
  else {
    BOOL v69 = 0;
  }
  if (v69)
  {
    uint64_t v70 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      id v104 = (id)objc_claimAutoreleasedReturnValue();
      v105 = NSStringFromSelector(aSelector);
      *(_DWORD *)v157 = 138412802;
      *(void *)&v157[4] = v104;
      __int16 v158 = 2112;
      v159 = v105;
      __int16 v160 = 2112;
      v161 = v112;
      _os_log_error_impl(&dword_1D9BFA000, v70, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v157, 0x20u);
    }
    uint64_t v71 = v112;
    goto LABEL_57;
  }
  if (a5 && *((void *)v148 + 5))
  {
    v72 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      id v107 = (id)objc_claimAutoreleasedReturnValue();
      id v108 = NSStringFromSelector(aSelector);
      v109 = (uint64_t (*)(uint64_t, uint64_t))*((void *)v148 + 5);
      *(_DWORD *)v157 = 138412802;
      *(void *)&v157[4] = v107;
      __int16 v158 = 2112;
      v159 = v108;
      __int16 v160 = 2112;
      v161 = v109;
      _os_log_error_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v157, 0x20u);
    }
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t))*((id *)v148 + 5);
    goto LABEL_57;
  }
  if ([*(id *)(*(void *)&v162[8] + 40) count] == 10000)
  {
    id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v155 = *MEMORY[0x1E4F28568];
    v74 = NSString;
    v75 = (objc_class *)objc_opt_class();
    v76 = NSStringFromClass(v75);
    BOOL v77 = NSStringFromSelector(aSelector);
    v78 = [v74 stringWithFormat:@"%@, %@, session configs reached max database objects count, %lu, dropping further evaluation", v76, v77, [*(id *)(*(void *)&v162[8] + 40) count]];
    v156 = v78;
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
    uint64_t v80 = [v73 initWithDomain:*MEMORY[0x1E4F99A48] code:12 userInfo:v79];
    id v81 = (void *)*((void *)v148 + 5);
    *((void *)v148 + 5) = v80;

    if (!a5)
    {
LABEL_58:
      int64_t v34 = -1;
      goto LABEL_59;
    }
    uint64_t v71 = (uint64_t (*)(uint64_t, uint64_t))*((id *)v148 + 5);
LABEL_57:
    *a5 = v71;
    goto LABEL_58;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  obuint64_t j = *(id *)(*(void *)&v162[8] + 40);
  uint64_t v85 = [obj countByEnumeratingWithState:&v129 objects:v154 count:16];
  int64_t v34 = 0;
  if (!v85) {
    goto LABEL_81;
  }
  uint64_t v118 = *(void *)v130;
  do
  {
    SEL v86 = 0;
    SEL aSelectora = (SEL)v85;
    do
    {
      if (*(void *)v130 != v118) {
        objc_enumerationMutation(obj);
      }
      v87 = *(void **)(*((void *)&v129 + 1) + 8 * (void)v86);
      contexta = (void *)MEMORY[0x1E016D870]();
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v88 = (id)v142[5];
      uint64_t v89 = [v88 countByEnumeratingWithState:&v125 objects:v153 count:16];
      if (v89)
      {
        uint64_t v90 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v89; ++i)
          {
            if (*(void *)v126 != v90) {
              objc_enumerationMutation(v88);
            }
            v92 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            v93 = (void *)MEMORY[0x1E016D870]();
            uint64_t v94 = [v87 sessionStartDate];
            v95 = [v92 creationDate];
            [v94 timeIntervalSinceDate:v95];
            double v97 = v96;

            if (v97 < 0.0 || v97 > 7200.0)
            {
              if (v97 < 0.0)
              {
                int v98 = 0;
                goto LABEL_76;
              }
            }
            else
            {
              ++v34;
            }
            int v98 = 1;
LABEL_76:
            if (!v98) {
              goto LABEL_79;
            }
          }
          uint64_t v89 = [v88 countByEnumeratingWithState:&v125 objects:v153 count:16];
        }
        while (v89);
      }
LABEL_79:

      ++v86;
    }
    while (v86 != aSelectora);
    uint64_t v85 = [obj countByEnumeratingWithState:&v129 objects:v154 count:16];
  }
  while (v85);
LABEL_81:

LABEL_59:
  _Block_object_dispose(v162, 8);

  v37 = v112;
LABEL_36:

  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v34;
}

void __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke_133(uint64_t a1, void *a2, void *a3)
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

- (id)_getSelectedSessionForSuggestion:(id)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"suggestion");
      id v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      __int16 v40 = 0;
      *a4 = v38;
      goto LABEL_28;
    }
LABEL_17:
    __int16 v40 = 0;
    goto LABEL_28;
  }
  if ([v7 suppressionReason] != 1)
  {
    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion.suppressionReason == SMSuggestionSuppressionReasonNotSuppressed", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"suggestion.suppressionReason == SMSuggestionSuppressionReasonNotSuppressed");
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  dispatch_semaphore_t v52 = self;
  aSelector = a2;
  id v9 = objc_alloc(MEMORY[0x1E4F99920]);
  id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v11 = [v8 creationDate];
  id v12 = (void *)[v10 initWithStartDate:v11 duration:7200.0];
  id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
  dispatch_semaphore_t v14 = [v8 creationDate];
  uint64_t v15 = *MEMORY[0x1E4F99C18];
  v16 = (void *)[v13 initWithStartDate:v14 duration:86400.0];
  LOBYTE(v49) = 1;
  uint64_t v17 = [v9 initWithBatchSize:v15 fetchLimit:1 sortBySessionStartDate:1 ascending:1 sessionTypes:&unk_1F3453498 timeInADayInterval:v12 pickOneConfigInTimeInADayInterval:v49 dateInterval:v16 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  id v64 = buf;
  uint64_t v65 = 0x3032000000;
  __int16 v66 = __Block_byref_object_copy__159;
  uint64_t v67 = __Block_byref_object_dispose__159;
  id v68 = 0;
  uint64_t v57 = 0;
  double v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__159;
  uint64_t v61 = __Block_byref_object_dispose__159;
  id v62 = 0;
  double v19 = [(SMSuggestionsMetricsManager *)v52 sessionStore];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __70__SMSuggestionsMetricsManager__getSelectedSessionForSuggestion_error___block_invoke;
  v53[3] = &unk_1E6B905F0;
  uint64_t v55 = buf;
  dispatch_time_t v56 = &v57;
  double v20 = v18;
  double v54 = v20;
  [v19 fetchSessionConfigurationsWithOptions:v17 handler:v53];
  BOOL v51 = (void *)v17;

  unsigned int v21 = v20;
  v22 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v21, v23)) {
    goto LABEL_18;
  }
  id v24 = [MEMORY[0x1E4F1C9C8] now];
  [v24 timeIntervalSinceDate:v22];
  double v26 = v25;
  v27 = objc_opt_new();
  v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
  id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v30 = [v29 filteredArrayUsingPredicate:v28];
  id v31 = [v30 firstObject];

  [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
  id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)BOOL v69 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v69, 2u);
  }

  id v33 = (void *)MEMORY[0x1E4F28C58];
  v74[0] = *MEMORY[0x1E4F28568];
  *(void *)BOOL v69 = @"semaphore wait timeout";
  int64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v74 count:1];
  id v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

  if (v35)
  {
    id v36 = v35;
  }
  else
  {
LABEL_18:
    id v36 = 0;
  }

  id v41 = v36;
  uint64_t v42 = v41;
  if (a4 && v41)
  {
    int v43 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v48 = NSStringFromSelector(aSelector);
      *(_DWORD *)BOOL v69 = 138412802;
      *(void *)&v69[4] = v47;
      __int16 v70 = 2112;
      uint64_t v71 = v48;
      __int16 v72 = 2112;
      id v73 = v42;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v69, 0x20u);
    }
    id v44 = v42;
    goto LABEL_26;
  }
  if (a4)
  {
    id v44 = (void *)v58[5];
LABEL_26:
    *a4 = v44;
  }
  __int16 v40 = [*((id *)v64 + 5) firstObject];

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);

LABEL_28:

  return v40;
}

void __70__SMSuggestionsMetricsManager__getSelectedSessionForSuggestion_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getSessionConfigurationsForSuggestion:(id)a3 timeWindow:(double)a4 error:(id *)a5
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F99920]);
    id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v10 = [v7 creationDate];
    id v11 = [v10 dateByAddingTimeInterval:-a4];
    id v12 = (void *)[v9 initWithStartDate:v11 duration:a4 + a4];
    id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
    dispatch_semaphore_t v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v15 = [v14 dateByAddingTimeInterval:-2419200.0];
    uint64_t v16 = *MEMORY[0x1E4F99C08];
    uint64_t v17 = (void *)[v13 initWithStartDate:v15 duration:2419200.0];
    LOBYTE(v48) = 1;
    uint64_t v18 = [v8 initWithBatchSize:v16 fetchLimit:v16 sortBySessionStartDate:1 ascending:0 sessionTypes:&unk_1F34534B0 timeInADayInterval:v12 pickOneConfigInTimeInADayInterval:v48 dateInterval:v17 startBoundingBoxLocation:0 destinationBoundingBoxLocation:0 boundingBoxRadius:0 sessionIdentifier:0];

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    *(void *)id v62 = 0;
    v63 = v62;
    uint64_t v64 = 0x3032000000;
    uint64_t v65 = __Block_byref_object_copy__159;
    __int16 v66 = __Block_byref_object_dispose__159;
    id v67 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x3032000000;
    uint64_t v59 = __Block_byref_object_copy__159;
    v60 = __Block_byref_object_dispose__159;
    id v61 = 0;
    double v20 = [(SMSuggestionsMetricsManager *)self sessionStore];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __87__SMSuggestionsMetricsManager__getSessionConfigurationsForSuggestion_timeWindow_error___block_invoke;
    v52[3] = &unk_1E6B905F0;
    double v54 = &v56;
    uint64_t v55 = v62;
    unsigned int v21 = v19;
    double v53 = v21;
    [v20 fetchSessionConfigurationsWithOptions:v18 handler:v52];
    uint64_t v49 = (void *)v18;

    v22 = v21;
    dispatch_time_t v23 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v24 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v22, v24)) {
      goto LABEL_7;
    }
    double v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSinceDate:v23];
    double v27 = v26;
    v28 = objc_opt_new();
    id v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
    id v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v31 = [v30 filteredArrayUsingPredicate:v29];
    id v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    id v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    int64_t v34 = (void *)MEMORY[0x1E4F28C58];
    v73[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v73 count:1];
    id v36 = [v34 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v35];

    if (v36)
    {
      id v37 = v36;
    }
    else
    {
LABEL_7:
      id v37 = 0;
    }

    id v38 = v37;
    uint64_t v39 = v38;
    if (a5 && v38)
    {
      __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        id v47 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v46;
        __int16 v69 = 2112;
        __int16 v70 = v47;
        __int16 v71 = 2112;
        __int16 v72 = v39;
        _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v41 = v39;
    }
    else
    {
      if (!a5)
      {
LABEL_21:
        id v43 = (id)v57[5];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(v62, 8);

        goto LABEL_22;
      }
      id v41 = (void *)*((void *)v63 + 5);
    }
    *a5 = v41;
    goto LABEL_21;
  }
  uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v62 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", v62, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"suggestion");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v43 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:

  return v43;
}

void __87__SMSuggestionsMetricsManager__getSessionConfigurationsForSuggestion_timeWindow_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  BOOL v55 = a3;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v57 = a5;
  uint64_t v68 = 0;
  __int16 v69 = &v68;
  uint64_t v70 = 0x3032000000;
  __int16 v71 = __Block_byref_object_copy__159;
  __int16 v72 = __Block_byref_object_dispose__159;
  id v73 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__159;
  __int16 v66 = __Block_byref_object_dispose__159;
  id v67 = [MEMORY[0x1E4F1C978] array];
  id v11 = [(SMSuggestionsMetricsManager *)self deviceLocationPredictor];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke;
  v58[3] = &unk_1E6B905F0;
  v60 = &v62;
  id v61 = &v68;
  id v12 = v10;
  uint64_t v59 = v12;
  [v11 fetchNextPredictedLocationsOfInterestFromLocation:v9 startDate:v57 timeInterval:v58 handler:3600.0];
  uint64_t v56 = v9;

  id v13 = v12;
  dispatch_semaphore_t v14 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15)) {
    goto LABEL_6;
  }
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
  [v16 timeIntervalSinceDate:v14];
  double v18 = v17;
  dispatch_semaphore_t v19 = objc_opt_new();
  double v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_236];
  unsigned int v21 = [MEMORY[0x1E4F29060] callStackSymbols];
  v22 = [v21 filteredArrayUsingPredicate:v20];
  dispatch_time_t v23 = [v22 firstObject];

  [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
  dispatch_time_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  double v25 = (void *)MEMORY[0x1E4F28C58];
  v85[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v85 count:1];
  double v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

  if (v27)
  {
    id v28 = v27;
  }
  else
  {
LABEL_6:
    id v28 = 0;
  }

  id v29 = v28;
  id v30 = v29;
  if (a6)
  {
    if (v69[5])
    {
      id v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v49 = NSStringFromSelector(a2);
        uint64_t v50 = v69[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v48;
        __int16 v75 = 2112;
        id v76 = v49;
        __int16 v77 = 2112;
        uint64_t v78 = v50;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v32 = (void *)v69[5];
LABEL_16:
      *a6 = v32;
      id v34 = [MEMORY[0x1E4F1C978] array];
      goto LABEL_28;
    }
    if (v29)
    {
      id v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        BOOL v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        double v53 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v52;
        __int16 v75 = 2112;
        id v76 = v53;
        __int16 v77 = 2112;
        uint64_t v78 = (uint64_t)v30;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v32 = v30;
      goto LABEL_16;
    }
  }
  id v35 = (void *)v63[5];
  id v36 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_117];
  id v37 = [v35 filteredArrayUsingPredicate:v36];

  id v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [(id)v63[5] count];
    uint64_t v43 = [v37 count];
    id v44 = @"NO";
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v40;
    __int16 v75 = 2112;
    if (v55) {
      id v44 = @"YES";
    }
    id v76 = v41;
    __int16 v77 = 2048;
    uint64_t v78 = v42;
    __int16 v79 = 2112;
    uint64_t v80 = v44;
    __int16 v81 = 2048;
    uint64_t v82 = v43;
    __int16 v83 = 2112;
    v84 = v56;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, onlyHighConfidence, %@, nplois with only high confidence count, %lu, w.r.t the location, %@", buf, 0x3Eu);
  }
  if (v55)
  {
    v45 = v37;
    if (a6)
    {
      *a6 = (id) v69[5];
      v45 = v37;
    }
  }
  else
  {
    if (a6) {
      *a6 = (id) v69[5];
    }
    v45 = (void *)v63[5];
  }
  id v34 = v45;

LABEL_28:
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);

  return v34;
}

void __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_150(uint64_t a1, void *a2)
{
  [a2 confidence];
  return v2 == 1.0;
}

- (id)_computeWorkoutAlwaysPromptMetricsWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)_submitMetrics:(id)a3 event:(unint64_t)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dispatch_semaphore_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v64 = v11;
      __int16 v65 = 2112;
      __int16 v66 = v12;
      __int16 v67 = 2048;
      uint64_t v68 = [v8 count];
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics with count, %lu", buf, 0x20u);
    }
    switch(a4)
    {
      case 3uLL:
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = v8;
        id v13 = (void *)[obj countByEnumeratingWithState:&v46 objects:v60 count:16];
        if (v13)
        {
          uint64_t v43 = a5;
          id v44 = v8;
          uint64_t v23 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v47 != v23) {
                objc_enumerationMutation(obj);
              }
              double v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              double v26 = (void *)MEMORY[0x1E016D870]();
              id v27 = [NSString alloc];
              id v28 = (void *)[v27 initWithCString:RTAnalyticsEventSMSuggestionsWorkoutAlwaysPromptConsidered encoding:1];
              log_analytics_submission(v28, v25);
              id v29 = [NSString stringWithFormat:@"com.apple.%@", v28];
              AnalyticsSendEvent();
            }
            id v13 = (void *)[obj countByEnumeratingWithState:&v46 objects:v60 count:16];
          }
          while (v13);
          goto LABEL_34;
        }
        break;
      case 2uLL:
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        obuint64_t j = v8;
        id v13 = (void *)[obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        if (v13)
        {
          uint64_t v43 = a5;
          id v44 = v8;
          uint64_t v30 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v51 != v30) {
                objc_enumerationMutation(obj);
              }
              id v32 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
              id v33 = (void *)MEMORY[0x1E016D870]();
              id v34 = [NSString alloc];
              id v35 = (void *)[v34 initWithCString:RTAnalyticsEventSMSuggestionsUsage encoding:1];
              log_analytics_submission(v35, v32);
              id v36 = [NSString stringWithFormat:@"com.apple.%@", v35];
              AnalyticsSendEvent();
            }
            id v13 = (void *)[obj countByEnumeratingWithState:&v50 objects:v61 count:16];
          }
          while (v13);
          goto LABEL_34;
        }
        break;
      case 1uLL:
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        obuint64_t j = v8;
        id v13 = (void *)[obj countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v13)
        {
          uint64_t v43 = a5;
          id v44 = v8;
          uint64_t v14 = *(void *)v55;
          do
          {
            for (uint64_t k = 0; k != v13; uint64_t k = (char *)k + 1)
            {
              if (*(void *)v55 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * (void)k);
              double v17 = (void *)MEMORY[0x1E016D870]();
              id v18 = [NSString alloc];
              dispatch_semaphore_t v19 = (void *)[v18 initWithCString:RTAnalyticsEventSMSuggestionsDetails encoding:1];
              log_analytics_submission(v19, v16);
              double v20 = [NSString stringWithFormat:@"com.apple.%@", v19];
              AnalyticsSendEvent();
            }
            id v13 = (void *)[obj countByEnumeratingWithState:&v54 objects:v62 count:16];
          }
          while (v13);
LABEL_34:
          a5 = v43;
          id v8 = v44;
        }
        break;
      default:
        id v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v38 = *MEMORY[0x1E4F99A48];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        uint64_t v39 = NSString;
        obuint64_t j = [(id)objc_opt_class() stringFromSuggestionsMetricsEvent:a4];
        id v40 = [v39 stringWithFormat:@"requires a valid suggestions metric event. Passed, %@", obj];
        uint64_t v59 = v40;
        id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        id v13 = [v37 errorWithDomain:v38 code:7 userInfo:v41];

        break;
    }

    if (a5) {
      *a5 = v13;
    }
    BOOL v22 = v13 == 0;

    goto LABEL_39;
  }
  unsigned int v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"metrics");
    BOOL v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_39:

  return v22;
}

+ (id)stringFromSuggestionsMetricsEvent:(unint64_t)a3
{
  if (a3 > 3) {
    return @"SuggestionsMetricsEventDetails";
  }
  else {
    return off_1E6B9C698[a3];
  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (void)setSuggestionsStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end