@interface RTLocationContextManager
- (BOOL)_clearTimerWithError:(id *)a3;
- (BOOL)_postLocationContextNotificationUsingData:(id)a3 error:(id *)a4;
- (BOOL)_resetTimerWitherror:(id *)a3;
- (BOOL)inHighConfidenceVisit;
- (BOOL)inLowConfidenceVisit;
- (BOOL)locationContextMonitoringEnabled;
- (BOOL)routineEnabled;
- (RTAuthorizationManager)authorizationManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocation)lastPublishedLocation;
- (RTLocation)latestValidLocation;
- (RTLocationContextManager)init;
- (RTLocationContextManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 placeInferenceManager:(id)a9 platform:(id)a10 timerManager:(id)a11 visitManager:(id)a12;
- (RTLocationManager)locationManager;
- (RTPlaceInference)lastPublishedPlaceInference;
- (RTPlaceInferenceManager)placeInferenceManager;
- (RTPlatform)platform;
- (RTTimer)timer;
- (RTTimerManager)timerManager;
- (RTVisitManager)visitManager;
- (id)_getFamIndexResultWithGranularity:(unint64_t)a3 location:(id)a4 error:(id *)a5;
- (id)_getLearnedLOIForVisit:(id)a3 error:(id *)a4;
- (id)_getPlaceInferencesAtLocation:(id)a3 error:(id *)a4;
- (void)_onAuthorizationNotification:(id)a3;
- (void)_onLearnedLocationManagerNotification:(id)a3;
- (void)_onLeechedLocationNotification:(id)a3;
- (void)_onVisitManagerNotification:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onAuthorizationNotification:(id)a3;
- (void)onLearnedLocationManagerNotification:(id)a3;
- (void)onLeechedLocationNotification:(id)a3;
- (void)onVisitManagerNotification:(id)a3;
- (void)setInHighConfidenceVisit:(BOOL)a3;
- (void)setInLowConfidenceVisit:(BOOL)a3;
- (void)setLastPublishedLocation:(id)a3;
- (void)setLastPublishedPlaceInference:(id)a3;
- (void)setLatestValidLocation:(id)a3;
- (void)setLocationContextMonitoringEnabled:(BOOL)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation RTLocationContextManager

uint64_t __58__RTLocationContextManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLeechedLocationNotification:*(void *)(a1 + 40)];
}

- (void)onLeechedLocationNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTLocationContextManager_onLeechedLocationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_onLeechedLocationNotification:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    [v5 name];
    v10 = self;
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v81 = v8;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v9;
    __int16 v84 = 2112;
    v85 = v11;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, notification name, %@", buf, 0x20u);

    self = v10;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 leechedLocations];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v92 count:16];
    v71 = a2;
    id v72 = v5;
    if (v13)
    {
      uint64_t v14 = v13;
      v69 = self;
      v15 = 0;
      uint64_t v16 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E016D870]();
          if (v18)
          {
            if (!v15
              || ([v15 timestamp],
                  v20 = objc_claimAutoreleasedReturnValue(),
                  [v18 timestamp],
                  v21 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v22 = [v20 compare:v21],
                  v21,
                  v20,
                  v22 == -1))
            {
              id v23 = v18;

              v15 = v23;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v76 objects:v92 count:16];
      }
      while (v14);

      if (!v15)
      {
        a2 = v71;
        id v5 = v72;
        self = v69;
LABEL_20:
        v25 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          v28 = NSStringFromSelector(a2);
          v29 = @"NO";
          if ([(RTLocationContextManager *)self inLowConfidenceVisit]) {
            v30 = @"YES";
          }
          else {
            v30 = @"NO";
          }
          if ([(RTLocationContextManager *)self inHighConfidenceVisit]) {
            v29 = @"YES";
          }
          v31 = [(RTLocationContextManager *)self lastPublishedLocation];
          v32 = [(RTLocationContextManager *)self latestValidLocation];
          *(_DWORD *)buf = 138413570;
          v81 = v27;
          __int16 v82 = 2112;
          uint64_t v83 = (uint64_t)v28;
          __int16 v84 = 2112;
          v85 = v30;
          __int16 v86 = 2112;
          v87 = v29;
          a2 = v71;
          id v5 = v72;
          __int16 v88 = 2112;
          v89 = v31;
          __int16 v90 = 2112;
          v91 = v32;
          _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, in low confidence visit, %@, in high confidence visit, %@, lastPublishedLocation, %@, latestValidLocation, %@", buf, 0x3Eu);
        }
        uint64_t v33 = [(RTLocationContextManager *)self lastPublishedLocation];
        if (v33)
        {
          v34 = (void *)v33;
          [(RTLocationContextManager *)self latestValidLocation];
          v36 = v35 = self;
          if (v36 && ![(RTLocationContextManager *)v35 inLowConfidenceVisit])
          {
            BOOL v48 = [(RTLocationContextManager *)v35 inHighConfidenceVisit];

            self = v35;
            if (!v48)
            {
              v49 = [(RTLocationContextManager *)v35 distanceCalculator];
              v50 = [(RTLocationContextManager *)v35 lastPublishedLocation];
              v51 = v35;
              v52 = [(RTLocationContextManager *)v35 latestValidLocation];
              id v75 = 0;
              [v49 distanceFromLocation:v50 toLocation:v52 error:&v75];
              double v54 = v53;
              v39 = (__CFString *)v75;

              v55 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v56 = (objc_class *)objc_opt_class();
                v70 = NSStringFromClass(v56);
                v68 = NSStringFromSelector(a2);
                v57 = [(RTLocationContextManager *)v51 lastPublishedLocation];
                v58 = [(RTLocationContextManager *)v51 latestValidLocation];
                if (v54 == 1.79769313e308)
                {
                  v59 = @"DBL_MAX";
                }
                else
                {
                  [NSString stringWithFormat:@"%.3f", *(void *)&v54];
                  v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                *(_DWORD *)buf = 138413570;
                v81 = v70;
                __int16 v82 = 2112;
                uint64_t v83 = (uint64_t)v68;
                __int16 v84 = 2112;
                v85 = v57;
                __int16 v86 = 2112;
                v87 = v58;
                __int16 v88 = 2112;
                v89 = v59;
                __int16 v90 = 2112;
                v91 = v39;
                _os_log_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_INFO, "%@, %@, last published location, %@, latest valid location, %@, distance, %@, error, %@", buf, 0x3Eu);
                if (v54 != 1.79769313e308) {
              }
                }
              if (v39 || v54 == 1.79769313e308) {
                goto LABEL_34;
              }
              self = v51;
              if (v54 > 500.0)
              {
                v60 = [(RTLocationContextManager *)v51 latestValidLocation];
                id v74 = 0;
                BOOL v61 = [(RTLocationContextManager *)v51 _postLocationContextNotificationUsingData:v60 error:&v74];
                v39 = (__CFString *)v74;

                v62 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  v63 = (objc_class *)objc_opt_class();
                  v64 = NSStringFromClass(v63);
                  uint64_t v65 = NSStringFromSelector(a2);
                  v66 = (void *)v65;
                  v67 = @"NO";
                  *(_DWORD *)buf = 138413058;
                  v81 = v64;
                  __int16 v82 = 2112;
                  if (v61) {
                    v67 = @"YES";
                  }
                  uint64_t v83 = v65;
                  __int16 v84 = 2112;
                  v85 = v67;
                  __int16 v86 = 2112;
                  v87 = v39;
                  _os_log_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_INFO, "%@, %@, publish outside visit after meeting distance threshold status, %@, error, %@", buf, 0x2Au);
                }
                self = v51;
                if (v39) {
                  goto LABEL_34;
                }
              }
            }
          }
          else
          {

            self = v35;
          }
        }
        uint64_t v37 = [(RTLocationContextManager *)self lastPublishedLocation];
        if (v37)
        {
          v38 = v37;
          v39 = 0;
        }
        else
        {
          v40 = [(RTLocationContextManager *)self latestValidLocation];

          if (!v40)
          {
            v39 = 0;
            goto LABEL_34;
          }
          v41 = [(RTLocationContextManager *)self latestValidLocation];
          id v73 = 0;
          BOOL v42 = [(RTLocationContextManager *)self _postLocationContextNotificationUsingData:v41 error:&v73];
          v39 = (__CFString *)v73;

          v38 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            uint64_t v45 = NSStringFromSelector(a2);
            v46 = (void *)v45;
            v47 = @"NO";
            *(_DWORD *)buf = 138413058;
            v81 = v44;
            __int16 v82 = 2112;
            if (v42) {
              v47 = @"YES";
            }
            uint64_t v83 = v45;
            __int16 v84 = 2112;
            v85 = v47;
            __int16 v86 = 2112;
            v87 = v39;
            _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, %@, publish outside visit after first location status, %@, error, %@", buf, 0x2Au);
          }
        }

LABEL_34:
        goto LABEL_35;
      }
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v15];
      self = v69;
      [(RTLocationContextManager *)v69 setLatestValidLocation:v24];
      a2 = v71;
      id v5 = v72;
    }
    else
    {
      v15 = 0;
      v24 = v12;
    }

    goto LABEL_20;
  }
LABEL_35:
}

- (RTLocation)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (RTLocation)latestValidLocation
{
  return self->_latestValidLocation;
}

- (BOOL)inLowConfidenceVisit
{
  return self->_inLowConfidenceVisit;
}

- (BOOL)inHighConfidenceVisit
{
  return self->_inHighConfidenceVisit;
}

- (void)setLatestValidLocation:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

void __49__RTLocationContextManager__resetTimerWitherror___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained latestValidLocation];
  id v12 = 0;
  int v4 = [WeakRetained _postLocationContextNotificationUsingData:v3 error:&v12];
  id v5 = v12;

  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)v9;
    v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    if (v4) {
      v11 = @"YES";
    }
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, timer expired, notification status, %@, error, %@", buf, 0x2Au);
  }
}

- (BOOL)_postLocationContextNotificationUsingData:(id)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"data");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = 0;
    uint64_t v9 = [(RTLocationContextManager *)self _getPlaceInferencesAtLocation:v7 error:&v56];
    id v10 = v56;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v71 = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      goto LABEL_13;
    }
    id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v39 = *MEMORY[0x1E4F5CFE8];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    v70 = @"invalid data type is passed";
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    id v10 = (id)[v38 initWithDomain:v39 code:7 userInfo:v40];

    v41 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_44:

      if (a4)
      {
        id v10 = v10;
        BOOL v16 = 0;
        *a4 = v10;
        goto LABEL_46;
      }
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = (uint64_t)v10;
LABEL_43:
    _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
    goto LABEL_44;
  }
  v11 = [v7 placeInference];

  if (v11)
  {
    id v12 = [v7 placeInference];
    v74[0] = v12;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];

LABEL_13:
    id v10 = 0;
    goto LABEL_14;
  }
  BOOL v42 = [v7 location];

  if (!v42)
  {
    id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v45 = *MEMORY[0x1E4F5CFE8];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v46 = [NSString stringWithFormat:@"invalid visit passed, %@", v7];
    id v73 = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v10 = (id)[v44 initWithDomain:v45 code:7 userInfo:v47];

    v41 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = (uint64_t)v10;
    goto LABEL_43;
  }
  v43 = [v7 location];
  id v55 = 0;
  uint64_t v9 = [(RTLocationContextManager *)self _getPlaceInferencesAtLocation:v43 error:&v55];
  id v10 = v55;

LABEL_14:
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v9 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v58 = v14;
    __int16 v59 = 2112;
    id v60 = v10;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "final place inferences count, %lu, error, %@", buf, 0x16u);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __76__RTLocationContextManager__postLocationContextNotificationUsingData_error___block_invoke;
    v54[3] = &__block_descriptor_40_e33_v32__0__RTPlaceInference_8Q16_B24l;
    v54[4] = a2;
    [v9 enumerateObjectsUsingBlock:v54];
  }
  if (a4 && v10)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      v51 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v58 = (uint64_t)v50;
      __int16 v59 = 2112;
      id v60 = v51;
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v10 = v10;
    *a4 = v10;

LABEL_23:
    BOOL v16 = 0;
    goto LABEL_46;
  }
  __int16 v17 = [(RTLocationContextManager *)self lastPublishedPlaceInference];
  v18 = [v9 firstObject];
  int v19 = [v17 isEqual:v18];

  if (v19)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v58 = (uint64_t)v22;
      __int16 v59 = 2112;
      id v60 = v23;
      __int16 v61 = 2112;
      id v62 = v9;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, place inference already published, skipping place inference, %@", buf, 0x20u);
    }
    if (a4) {
      *a4 = v10;
    }
    BOOL v16 = v10 == 0;
  }
  else
  {
    v24 = [[RTLocationContextManagerPlaceInferencesNotification alloc] initWithPlaceInferences:v9];
    [(RTNotifier *)self postNotification:v24];
    v25 = [v9 firstObject];
    [(RTLocationContextManager *)self setLastPublishedPlaceInference:v25];

    v26 = [v9 firstObject];
    v27 = [v26 referenceLocation];
    [(RTLocationContextManager *)self setLastPublishedLocation:v27];

    id v53 = v10;
    BOOL v28 = [(RTLocationContextManager *)self _resetTimerWitherror:&v53];
    id v29 = v53;

    v30 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      uint64_t v33 = NSStringFromSelector(a2);
      [(RTLocationContextManager *)self lastPublishedLocation];
      v34 = v52 = v24;
      uint64_t v35 = [(RTLocationContextManager *)self lastPublishedPlaceInference];
      v36 = (void *)v35;
      *(_DWORD *)buf = 138413570;
      uint64_t v37 = @"NO";
      uint64_t v58 = (uint64_t)v32;
      __int16 v59 = 2112;
      if (v28) {
        uint64_t v37 = @"YES";
      }
      id v60 = v33;
      __int16 v61 = 2112;
      id v62 = v34;
      __int16 v63 = 2112;
      uint64_t v64 = v35;
      __int16 v65 = 2112;
      v66 = v37;
      __int16 v67 = 2112;
      id v68 = v29;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@, %@, last published location, %@, last published place inference, %@, timer status, %@, error, %@", buf, 0x3Eu);

      v24 = v52;
    }

    if (a4) {
      *a4 = v29;
    }
    BOOL v16 = v29 == 0;

    id v10 = v29;
  }
LABEL_46:

  return v16;
}

- (id)_getPlaceInferencesAtLocation:(id)a3 error:(id *)a4
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (!v6)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"location");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    __int16 v63 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, location, %@,", buf, 0x20u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F5CE78]);
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v6];
  v66 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  __int16 v15 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
  BOOL v16 = [v15 bundleIdentifier];
  __int16 v17 = (void *)[v12 initWithFidelityPolicy:0 locations:v14 accessPoints:MEMORY[0x1E4F1CBF0] clientIdentifier:v16];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v63 = __Block_byref_object_copy__118;
  uint64_t v64 = __Block_byref_object_dispose__118;
  id v65 = 0;
  uint64_t v52 = 0;
  id v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__118;
  id v56 = __Block_byref_object_dispose__118;
  id v57 = 0;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  int v19 = [(RTLocationContextManager *)self placeInferenceManager];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __64__RTLocationContextManager__getPlaceInferencesAtLocation_error___block_invoke;
  v48[3] = &unk_1E6B905F0;
  v50 = buf;
  v51 = &v52;
  id v20 = v18;
  v49 = v20;
  [v19 fetchPlaceInferencesForOptions:v17 handler:v48];

  uint64_t v21 = v20;
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v21, v23)) {
    goto LABEL_13;
  }
  v24 = [MEMORY[0x1E4F1C9C8] now];
  [v24 timeIntervalSinceDate:v22];
  double v26 = v25;
  v27 = objc_opt_new();
  BOOL v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_90];
  id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
  v30 = [v29 filteredArrayUsingPredicate:v28];
  v31 = [v30 firstObject];

  [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
  v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int16 v59 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
  }

  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
  v67[0] = *MEMORY[0x1E4F28568];
  *(void *)__int16 v59 = @"semaphore wait timeout";
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v67 count:1];
  uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

  if (v35)
  {
    id v36 = v35;
  }
  else
  {
LABEL_13:
    id v36 = 0;
  }

  id v37 = v36;
  if (v37) {
    objc_storeStrong(v53 + 5, v36);
  }
  id v38 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = [*(id *)(*(void *)&buf[8] + 40) count];
    id v40 = v53[5];
    *(_DWORD *)__int16 v59 = 134218242;
    *(void *)&v59[4] = v39;
    __int16 v60 = 2112;
    id v61 = v40;
    _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "fetched place inferences count, %lu, error, %@", v59, 0x16u);
  }

  if (![*(id *)(*(void *)&buf[8] + 40) count])
  {
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F5CE70]) initWithMapItem:0 userType:0 userTypeSource:0 placeType:0 referenceLocation:v6 confidence:0 loiIdentifier:1.0];
    BOOL v42 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v59 = 138412290;
      *(void *)&v59[4] = v41;
      _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "created a place inference using location, %@,", v59, 0xCu);
    }

    uint64_t v58 = v41;
    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    id v44 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v43;
  }
  if (a4) {
    *a4 = v53[5];
  }
  id v45 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(buf, 8);

  return v45;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTLocationContextManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_defaultsManager_distanceCalculator_learnedLocationManager_learnedLocationStore_locationManager_placeInferenceManager_platform_timerManager_visitManager_);
}

- (RTLocationContextManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 placeInferenceManager:(id)a9 platform:(id)a10 timerManager:(id)a11 visitManager:(id)a12
{
  id v17 = a3;
  id v43 = a4;
  id v18 = a4;
  id v50 = a5;
  id v44 = a6;
  id v19 = a6;
  id v45 = a7;
  id v20 = a7;
  id v46 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v49 = v17;
  if (v17)
  {
    if (v18)
    {
      if (v50)
      {
        id v47 = v25;
        double v26 = v18;
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v24)
                  {
                    if (v25)
                    {
                      v52.receiver = self;
                      v52.super_class = (Class)RTLocationContextManager;
                      v27 = [(RTNotifier *)&v52 init];
                      BOOL v28 = v27;
                      if (v27)
                      {
                        objc_storeStrong((id *)&v27->_authorizationManager, a3);
                        objc_storeStrong((id *)&v28->_defaultsManager, v43);
                        objc_storeStrong((id *)&v28->_distanceCalculator, a5);
                        objc_storeStrong((id *)&v28->_learnedLocationManager, v44);
                        objc_storeStrong((id *)&v28->_learnedLocationStore, v45);
                        objc_storeStrong((id *)&v28->_locationManager, v46);
                        objc_storeStrong((id *)&v28->_placeInferenceManager, a9);
                        objc_storeStrong((id *)&v28->_platform, a10);
                        objc_storeStrong((id *)&v28->_timerManager, a11);
                        objc_storeStrong((id *)&v28->_visitManager, a12);
                        v28->_locationContextMonitoringEnabled = 0;
                        v28->_inLowConfidenceVisit = 0;
                        v28->_inHighConfidenceVisit = 0;
                        lastPublishedLocation = v28->_lastPublishedLocation;
                        v28->_lastPublishedLocation = 0;

                        latestValidLocation = v28->_latestValidLocation;
                        v28->_latestValidLocation = 0;

                        lastPublishedPlaceInference = v28->_lastPublishedPlaceInference;
                        v28->_lastPublishedPlaceInference = 0;

                        timer = v28->_timer;
                        v28->_timer = 0;

                        [(RTService *)v28 setup];
                      }
                      uint64_t v33 = v28;
                      self = v33;
                      goto LABEL_39;
                    }
                    uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      id v40 = "Invalid parameter not satisfying: visitManager";
                      goto LABEL_37;
                    }
LABEL_38:

                    uint64_t v33 = 0;
LABEL_39:
                    id v36 = v47;
                    goto LABEL_40;
                  }
                  uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  id v40 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  id v40 = "Invalid parameter not satisfying: platform";
                }
              }
              else
              {
                uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
                *(_WORD *)buf = 0;
                id v40 = "Invalid parameter not satisfying: placeInferenceManager";
              }
            }
            else
            {
              uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                goto LABEL_38;
              }
              *(_WORD *)buf = 0;
              id v40 = "Invalid parameter not satisfying: locationManager";
            }
          }
          else
          {
            uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              goto LABEL_38;
            }
            *(_WORD *)buf = 0;
            id v40 = "Invalid parameter not satisfying: learnedLocationStore";
          }
        }
        else
        {
          uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          *(_WORD *)buf = 0;
          id v40 = "Invalid parameter not satisfying: learnedLocationManager";
        }
LABEL_37:
        _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
        goto LABEL_38;
      }
      double v26 = v18;
      id v36 = v25;
      id v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        uint64_t v33 = 0;
LABEL_40:
        uint64_t v35 = v50;
        goto LABEL_41;
      }
      *(_WORD *)buf = 0;
      id v38 = "Invalid parameter not satisfying: distanceCalculator";
    }
    else
    {
      double v26 = 0;
      id v36 = v25;
      id v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      id v38 = "Invalid parameter not satisfying: defaultsManager";
    }
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_20;
  }
  id v48 = v25;
  double v26 = v18;
  v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  uint64_t v33 = 0;
  uint64_t v35 = v50;
  id v36 = v48;
LABEL_41:

  return v33;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    id v7 = +[RTNotification notificationName];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      [(RTLocationContextManager *)self setLocationContextMonitoringEnabled:[(RTNotifier *)self getNumberOfObservers:v6] != 0];
    }
    else
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(a2);
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(RTLocationContextManager *)self setLocationContextMonitoringEnabled:[(RTNotifier *)self getNumberOfObservers:v5] != 0];
  }
  else
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__RTLocationContextManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__RTLocationContextManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAuthorizationNotification:*(void *)(a1 + 40)];
}

- (void)_onAuthorizationNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[RTLocationContextManager setRoutineEnabled:](self, "setRoutineEnabled:", [v5 enabled]);
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = [(RTLocationContextManager *)self routineEnabled];
      id v8 = @"NO";
      if (v7) {
        id v8 = @"YES";
      }
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v10 = [v5 name];
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RTLocationContextManager_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__RTLocationContextManager_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      NSStringFromSelector(a2);
      int v9 = (char *)objc_claimAutoreleasedReturnValue();
      int v10 = [v5 available];
      int v11 = @"NO";
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 2112;
      if (v10) {
        int v11 = @"YES";
      }
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location manager available, %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2080;
      uint64_t v15 = "-[RTLocationContextManager _onLearnedLocationManagerNotification:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 234;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)onVisitManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTLocationContextManager_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTLocationContextManager_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVisitManagerNotification:*(void *)(a1 + 40)];
}

- (void)_onVisitManagerNotification:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = [v6 visitIncident];
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      NSStringFromSelector(a2);
      int v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v11;
      __int16 v63 = 2112;
      uint64_t v64 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);
    }
    if ([(__CFString *)v7 type] != 1
      || [(RTLocationContextManager *)self inHighConfidenceVisit]
      || [(RTLocationContextManager *)self inLowConfidenceVisit])
    {
      if ([(__CFString *)v7 type] != 3
        || [(RTLocationContextManager *)self inHighConfidenceVisit])
      {
        int v12 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = (objc_class *)objc_opt_class();
          __int16 v14 = NSStringFromClass(v13);
          NSStringFromSelector(a2);
          id v53 = (char *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x1E4F5CFC8] stringFromVisitIncidentType:-[__CFString type](v7, "type")];
          uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v16 = v5;
          id v17 = v6;
          if ([(RTLocationContextManager *)self inLowConfidenceVisit]) {
            uint64_t v18 = @"YES";
          }
          else {
            uint64_t v18 = @"NO";
          }
          BOOL v19 = [(RTLocationContextManager *)self inHighConfidenceVisit];
          *(_DWORD *)buf = 138413314;
          if (v19) {
            id v20 = @"YES";
          }
          else {
            id v20 = @"NO";
          }
          id v60 = v14;
          __int16 v61 = 2112;
          id v62 = v53;
          __int16 v63 = 2112;
          uint64_t v64 = v15;
          __int16 v65 = 2112;
          v66 = v18;
          id v6 = v17;
          id v5 = v16;
          __int16 v67 = 2112;
          id v68 = v20;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, invalid state, visit type, %@, in low confidence visit, %@, in high confidence visit, %@", buf, 0x34u);
        }
        goto LABEL_54;
      }
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = 1;
    }
    [(RTLocationContextManager *)self setInLowConfidenceVisit:v38];
    [(RTLocationContextManager *)self setInHighConfidenceVisit:0];
    id v58 = 0;
    BOOL v45 = [(RTLocationContextManager *)self _postLocationContextNotificationUsingData:v7 error:&v58];
    int v12 = v58;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
LABEL_53:

LABEL_54:
      goto LABEL_55;
    }
    id v46 = (objc_class *)objc_opt_class();
    uint64_t v33 = NSStringFromClass(v46);
    uint64_t v47 = NSStringFromSelector(a2);
    uint64_t v35 = (void *)v47;
    id v48 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v60 = v33;
    __int16 v61 = 2112;
    if (v45) {
      id v48 = @"YES";
    }
    id v62 = (const char *)v47;
    __int16 v63 = 2112;
    uint64_t v64 = v48;
    __int16 v65 = 2112;
    v66 = v12;
    id v37 = "%@, %@, publish place inference status, %@, error, %@";
LABEL_52:
    _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, v37, buf, 0x2Au);

    goto LABEL_53;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = [v6 visitIncident];
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      NSStringFromSelector(a2);
      id v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v60 = v23;
      __int16 v61 = 2112;
      id v62 = v24;
      __int16 v63 = 2112;
      uint64_t v64 = v7;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);
    }
    if ([(__CFString *)v7 type] == 1
      && ![(RTLocationContextManager *)self inHighConfidenceVisit])
    {
      uint64_t v25 = 1;
    }
    else
    {
      if ([(__CFString *)v7 type] != 3)
      {
        int v12 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = (objc_class *)objc_opt_class();
          uint64_t v54 = NSStringFromClass(v39);
          NSStringFromSelector(a2);
          id v40 = (char *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x1E4F5CFC8] stringFromVisitIncidentType:-[__CFString type](v7, "type")];
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ([(RTLocationContextManager *)self inLowConfidenceVisit]) {
            BOOL v42 = @"YES";
          }
          else {
            BOOL v42 = @"NO";
          }
          BOOL v43 = [(RTLocationContextManager *)self inHighConfidenceVisit];
          *(_DWORD *)buf = 138413314;
          if (v43) {
            id v44 = @"YES";
          }
          else {
            id v44 = @"NO";
          }
          id v60 = v55;
          __int16 v61 = 2112;
          id v62 = v40;
          __int16 v63 = 2112;
          uint64_t v64 = v41;
          __int16 v65 = 2112;
          v66 = v42;
          __int16 v67 = 2112;
          id v68 = v44;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, invalid state, visit type, %@, in low confidence visit, %@, in high confidence visit, %@", buf, 0x34u);
        }
        goto LABEL_54;
      }
      uint64_t v25 = 0;
    }
    [(RTLocationContextManager *)self setInHighConfidenceVisit:v25];
    [(RTLocationContextManager *)self setInLowConfidenceVisit:0];
    id v57 = 0;
    BOOL v49 = [(RTLocationContextManager *)self _postLocationContextNotificationUsingData:v7 error:&v57];
    int v12 = v57;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    id v50 = (objc_class *)objc_opt_class();
    uint64_t v33 = NSStringFromClass(v50);
    uint64_t v51 = NSStringFromSelector(a2);
    uint64_t v35 = (void *)v51;
    objc_super v52 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v60 = v33;
    __int16 v61 = 2112;
    if (v49) {
      objc_super v52 = @"YES";
    }
    id v62 = (const char *)v51;
    __int16 v63 = 2112;
    uint64_t v64 = v52;
    __int16 v65 = 2112;
    v66 = v12;
    id v37 = "%@, %@, publish inside visit place inference status, %@, error, %@";
    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = [v6 placeInference];
    double v26 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class();
      BOOL v28 = NSStringFromClass(v27);
      NSStringFromSelector(a2);
      id v29 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v60 = v28;
      __int16 v61 = 2112;
      id v62 = v29;
      __int16 v63 = 2112;
      uint64_t v64 = v7;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, %@, received POI update notification, %@", buf, 0x20u);
    }
    id v56 = 0;
    BOOL v30 = [(RTLocationContextManager *)self _postLocationContextNotificationUsingData:v7 error:&v56];
    int v12 = v56;
    v31 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_53;
    }
    v32 = (objc_class *)objc_opt_class();
    uint64_t v33 = NSStringFromClass(v32);
    uint64_t v34 = NSStringFromSelector(a2);
    uint64_t v35 = (void *)v34;
    id v36 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v60 = v33;
    __int16 v61 = 2112;
    if (v30) {
      id v36 = @"YES";
    }
    id v62 = (const char *)v34;
    __int16 v63 = 2112;
    uint64_t v64 = v36;
    __int16 v65 = 2112;
    v66 = v12;
    id v37 = "%@, %@, publish inside visit POI status, %@, error, %@";
    goto LABEL_52;
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v60 = v5;
    __int16 v61 = 2080;
    id v62 = "-[RTLocationContextManager _onVisitManagerNotification:]";
    __int16 v63 = 1024;
    LODWORD(v64) = 354;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_55:
}

- (void)setLocationContextMonitoringEnabled:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_locationContextMonitoringEnabled != a3)
  {
    self->_BOOL locationContextMonitoringEnabled = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_locationContextMonitoringEnabled) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "location context monitoring enabled, %@", buf, 0xCu);
    }

    BOOL locationContextMonitoringEnabled = self->_locationContextMonitoringEnabled;
    BOOL v7 = [(RTLocationContextManager *)self authorizationManager];
    id v8 = v7;
    if (locationContextMonitoringEnabled)
    {
      int v9 = +[RTNotification notificationName];
      [v8 addObserver:self selector:sel_onAuthorizationNotification_ name:v9];

      int v10 = [(RTLocationContextManager *)self visitManager];
      int v11 = +[RTNotification notificationName];
      [v10 addObserver:self selector:sel_onVisitManagerNotification_ name:v11];

      int v12 = [(RTLocationContextManager *)self visitManager];
      id v13 = +[RTNotification notificationName];
      [v12 addObserver:self selector:sel_onVisitManagerNotification_ name:v13];

      __int16 v14 = [(RTLocationContextManager *)self visitManager];
      uint64_t v15 = +[RTNotification notificationName];
      [v14 addObserver:self selector:sel_onVisitManagerNotification_ name:v15];

      id v16 = [(RTLocationContextManager *)self learnedLocationManager];
      id v17 = +[RTNotification notificationName];
      [v16 addObserver:self selector:sel_onLearnedLocationManagerNotification_ name:v17];

      uint64_t v18 = [(RTLocationContextManager *)self locationManager];
      BOOL v19 = +[RTNotification notificationName];
      [v18 addObserver:self selector:sel_onLeechedLocationNotification_ name:v19];

      uint64_t v27 = 0;
      [(RTLocationContextManager *)self _resetTimerWitherror:&v27];
    }
    else
    {
      [v7 removeObserver:self];

      id v20 = [(RTLocationContextManager *)self visitManager];
      id v21 = +[RTNotification notificationName];
      [v20 removeObserver:self fromNotification:v21];

      id v22 = [(RTLocationContextManager *)self visitManager];
      id v23 = +[RTNotification notificationName];
      [v22 removeObserver:self fromNotification:v23];

      id v24 = [(RTLocationContextManager *)self learnedLocationManager];
      [v24 removeObserver:self];

      uint64_t v25 = [(RTLocationContextManager *)self locationManager];
      [v25 removeObserver:self];

      uint64_t v26 = 0;
      [(RTLocationContextManager *)self _clearTimerWithError:&v26];
    }
  }
}

void __76__RTLocationContextManager__postLocationContextNotificationUsingData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    int v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3 + 1;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "%@, place inference %lu, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (BOOL)_resetTimerWitherror:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    int v9 = NSStringFromSelector(a2);
    __int16 v10 = [(RTLocationContextManager *)self timer];
    *(_DWORD *)buf = 138412802;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, reset timer called, %@", buf, 0x20u);
  }
  uint64_t v11 = [(RTLocationContextManager *)self timer];

  if (v11)
  {
    __int16 v12 = [(RTLocationContextManager *)self timer];
    [v12 invalidate];

    [(RTLocationContextManager *)self setTimer:0];
  }
  objc_initWeak((id *)buf, self);
  id v13 = [(RTLocationContextManager *)self timerManager];
  uint64_t v14 = [(RTNotifier *)self queue];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __49__RTLocationContextManager__resetTimerWitherror___block_invoke;
  id v22 = &unk_1E6B9A3F8;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  uint64_t v15 = [v13 timerWithIdentifier:@"com.apple.routined.locationContextManagerAlarm" queue:v14 handler:&v19];
  -[RTLocationContextManager setTimer:](self, "setTimer:", v15, v19, v20, v21, v22);

  id v16 = [(RTLocationContextManager *)self timer];
  [v16 fireWithInterval:300.0];

  id v17 = [(RTLocationContextManager *)self timer];
  [v17 resume];

  if (a3) {
    *a3 = 0;
  }
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
  return 1;
}

- (BOOL)_clearTimerWithError:(id *)a3
{
  id v5 = [(RTLocationContextManager *)self timer];

  if (v5)
  {
    id v6 = [(RTLocationContextManager *)self timer];
    [v6 invalidate];

    [(RTLocationContextManager *)self setTimer:0];
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

void __64__RTLocationContextManager__getPlaceInferencesAtLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLearnedLOIForVisit:(id)a3 error:(id *)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v48 = 0;
  BOOL v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__118;
  objc_super v52 = __Block_byref_object_dispose__118;
  id v53 = 0;
  uint64_t v42 = 0;
  BOOL v43 = &v42;
  uint64_t v44 = 0x3032000000;
  BOOL v45 = __Block_byref_object_copy__118;
  id v46 = __Block_byref_object_dispose__118;
  id v47 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  int v8 = [(RTLocationContextManager *)self learnedLocationManager];
  uint64_t v9 = [v6 placeInference];
  __int16 v10 = [v9 loiIdentifier];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __57__RTLocationContextManager__getLearnedLOIForVisit_error___block_invoke;
  v38[3] = &unk_1E6B90B28;
  id v40 = &v42;
  v41 = &v48;
  id v11 = v7;
  uint64_t v39 = v11;
  [v8 fetchLocationOfInterestWithIdentifier:v10 handler:v38];

  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14)) {
    goto LABEL_6;
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  [v15 timeIntervalSinceDate:v13];
  double v17 = v16;
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_90];
  uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
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
  v59[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v59 count:1];
  __int16 v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

  if (v26)
  {
    id v27 = v26;
  }
  else
  {
LABEL_6:
    id v27 = 0;
  }

  id v28 = v27;
  id v29 = v28;
  if (a4 && v28)
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v55 = 2112;
      id v56 = v36;
      __int16 v57 = 2112;
      id v58 = v29;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v31 = 0;
    *a4 = v29;
  }
  else
  {
    if (a4) {
      *a4 = (id) v49[5];
    }
    if (v49[5]) {
      v32 = 0;
    }
    else {
      v32 = (void *)v43[5];
    }
    id v31 = v32;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v31;
}

void __57__RTLocationContextManager__getLearnedLOIForVisit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getFamIndexResultWithGranularity:(unint64_t)a3 location:(id)a4 error:(id *)a5
{
  aSelector = a2;
  v62[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F5CDD8]);
  [v8 horizontalUncertainty];
  uint64_t v11 = [v9 initWithDateInterval:0 lookbackInterval:a3 spatialGranularity:v8 referenceLocation:0 referenceLocationSummary:604800.0 distance:v10];
  uint64_t v51 = 0;
  objc_super v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__118;
  __int16 v55 = __Block_byref_object_dispose__118;
  id v56 = 0;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__118;
  BOOL v49 = __Block_byref_object_dispose__118;
  id v50 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = [(RTLocationContextManager *)self learnedLocationManager];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __77__RTLocationContextManager__getFamIndexResultWithGranularity_location_error___block_invoke;
  v41[3] = &unk_1E6B905F0;
  BOOL v43 = &v45;
  uint64_t v44 = &v51;
  dispatch_time_t v14 = v12;
  uint64_t v42 = v14;
  [v13 fetchFamiliarityIndexResultsWithOptions:v11 handler:v41];
  id v40 = (void *)v11;

  uint64_t v15 = v14;
  double v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17)) {
    goto LABEL_6;
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] now:aSelector];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;
  id v21 = objc_opt_new();
  id v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_90];
  id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v24 = [v23 filteredArrayUsingPredicate:v22];
  uint64_t v25 = [v24 firstObject];

  [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
  __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  id v27 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
  id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (v29)
  {
    id v30 = v29;
  }
  else
  {
LABEL_6:
    id v30 = 0;
  }

  id v31 = v30;
  v32 = v31;
  if (a5 && v31)
  {
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v37;
      __int16 v58 = 2112;
      __int16 v59 = v38;
      __int16 v60 = 2112;
      __int16 v61 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
    }
    id v34 = 0;
    *a5 = v32;
  }
  else
  {
    if (a5) {
      *a5 = (id) v52[5];
    }
    id v34 = (id)v46[5];
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v34;
}

void __77__RTLocationContextManager__getFamIndexResultWithGranularity_location_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 lastObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (BOOL)locationContextMonitoringEnabled
{
  return self->_locationContextMonitoringEnabled;
}

- (void)setLastPublishedLocation:(id)a3
{
}

- (RTPlaceInference)lastPublishedPlaceInference
{
  return self->_lastPublishedPlaceInference;
}

- (void)setLastPublishedPlaceInference:(id)a3
{
}

- (void)setInLowConfidenceVisit:(BOOL)a3
{
  self->_inLowConfidenceVisit = a3;
}

- (void)setInHighConfidenceVisit:(BOOL)a3
{
  self->_inHighConfidenceVisit = a3;
}

- (RTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastPublishedPlaceInference, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_latestValidLocation, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end