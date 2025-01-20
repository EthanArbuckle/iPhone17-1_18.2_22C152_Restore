@interface RTVisitPipelineModuleMotionStateTrimmer
- (RTMotionActivityManager)motionActivityManager;
- (RTVisitPipelineModuleMotionStateTrimmer)init;
- (RTVisitPipelineModuleMotionStateTrimmer)initWithMotionActivityManager:(id)a3 defaultsManager:(id)a4;
- (RTVisitPipelineMotionAccumulatorParams)motionAccumulatorParams;
- (id)_fetchActivitiesWithinDateInterval:(id)a3 error:(id *)a4;
- (id)_trimVisitClusterForMotionActivity:(id)a3;
- (id)process:(id)a3;
@end

@implementation RTVisitPipelineModuleMotionStateTrimmer

- (RTVisitPipelineModuleMotionStateTrimmer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMotionActivityManager_defaultsManager_);
}

- (RTVisitPipelineModuleMotionStateTrimmer)initWithMotionActivityManager:(id)a3 defaultsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: motionActivityManager";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTVisitPipelineModuleMotionStateTrimmer;
  v10 = [(RTVisitPipelineModuleMotionStateTrimmer *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_motionActivityManager, a3);
    v12 = [[RTVisitPipelineMotionAccumulatorParams alloc] initWithDefaultsManager:v9];
    motionAccumulatorParams = v11->_motionAccumulatorParams;
    v11->_motionAccumulatorParams = v12;
  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (id)_fetchActivitiesWithinDateInterval:(id)a3 error:(id *)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    aSelector = a2;
    *(void *)v65 = 0;
    v66 = v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__83;
    v69 = __Block_byref_object_dispose__83;
    id v70 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__83;
    v63 = __Block_byref_object_dispose__83;
    id v64 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    motionActivityManager = self->_motionActivityManager;
    v10 = [v7 startDate];
    v11 = [v7 endDate];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __84__RTVisitPipelineModuleMotionStateTrimmer__fetchActivitiesWithinDateInterval_error___block_invoke;
    v55[3] = &unk_1E6B905F0;
    v57 = v65;
    v58 = &v59;
    v12 = v8;
    v56 = v12;
    [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v10 endDate:v11 handler:v55];

    dsema = v12;
    v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(dsema, v14))
    {
      v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      objc_super v18 = objc_opt_new();
      v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_68];
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 filteredArrayUsingPredicate:v19];
      v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      v77[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v77 count:1];
      id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v26 = v26;
      }
    }
    else
    {
      id v26 = 0;
    }

    id v29 = v26;
    v30 = v29;
    if (a4 && v29)
    {
      v31 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        v44 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v43;
        __int16 v73 = 2112;
        v74 = v44;
        __int16 v75 = 2112;
        v76 = v30;
        _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v32 = v30;
    }
    else
    {
      if (!a4 || !v60[5])
      {
        id v28 = (id)objc_opt_new();
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v34 = *((id *)v66 + 5);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v71 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v52 != v36) {
                objc_enumerationMutation(v34);
              }
              v38 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v39 = [v38 startDate];
              int v40 = [v7 containsDate:v39];

              if (v40) {
                [v28 addObject:v38];
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v71 count:16];
          }
          while (v35);
        }

        goto LABEL_33;
      }
      v33 = _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        v47 = NSStringFromSelector(aSelector);
        v48 = (void *)v60[5];
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v46;
        __int16 v73 = 2112;
        v74 = v47;
        __int16 v75 = 2112;
        v76 = v48;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);
      }
      id v32 = (id) v60[5];
    }
    *a4 = v32;
    id v28 = *((id *)v66 + 5);
LABEL_33:

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(v65, 8);

    goto LABEL_34;
  }
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v65 = 0;
    _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v65, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"dateInterval");
    id v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
LABEL_34:

  return v28;
}

void __84__RTVisitPipelineModuleMotionStateTrimmer__fetchActivitiesWithinDateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_trimVisitClusterForMotionActivity:(id)a3
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v91 = (objc_class *)objc_opt_class();
    v92 = NSStringFromClass(v91);
    NSStringFromSelector(a2);
    v93 = (char *)objc_claimAutoreleasedReturnValue();
    v94 = [v4 visit];
    v95 = [v94 entry];
    v96 = [v4 visit];
    v97 = [v96 exit];
    *(_DWORD *)buf = 138413058;
    v167 = v92;
    __int16 v168 = 2112;
    v169 = v93;
    __int16 v170 = 2112;
    uint64_t v171 = (uint64_t)v95;
    __int16 v172 = 2112;
    id v173 = v97;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@ %@: Trimming input cluster for motion, between %@ and %@", buf, 0x2Au);
  }
  id v6 = [v4 visit];
  v151 = [v6 entry];

  uint64_t v7 = [v4 visit];
  v150 = [v7 exit];

  id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [(RTVisitPipelineMotionAccumulatorParams *)self->_motionAccumulatorParams maxTimeToTrim];
  double v10 = v9;
  id v11 = [v4 points];
  id v12 = [v11 firstDate];
  v13 = (void *)[v8 initWithTimeInterval:v12 sinceDate:v10];

  [(RTVisitPipelineMotionAccumulatorParams *)self->_motionAccumulatorParams maxTimeToTrim];
  double v15 = v14;
  [(RTVisitPipelineMotionAccumulatorParams *)self->_motionAccumulatorParams motionLookWindowOutsideVisit];
  v140 = [v13 dateByAddingTimeInterval:-(v15 + v16)];
  v141 = v13;
  uint64_t v165 = 0;
  v144 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v140 endDate:v13];
  double v17 = -[RTVisitPipelineModuleMotionStateTrimmer _fetchActivitiesWithinDateInterval:error:](self, "_fetchActivitiesWithinDateInterval:error:");
  id v18 = 0;
  if (v18)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v107 = (objc_class *)objc_opt_class();
      NSStringFromClass(v107);
      v109 = v108 = v17;
      NSStringFromSelector(a2);
      v110 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v167 = v109;
      __int16 v168 = 2112;
      v169 = v110;
      __int16 v170 = 2112;
      uint64_t v171 = (uint64_t)v18;
      __int16 v172 = 2112;
      id v173 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "%@ %@: Failed to fetch motion activities at start, error, %@, for cluster %@", buf, 0x2Au);

      double v17 = v108;
    }
  }
  v145 = self;
  v20 = [[RTVisitPipelineMotionAccumulator alloc] initWithParams:self->_motionAccumulatorParams processInReverse:1];
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v142 = v17;
  v21 = [v17 reverseObjectEnumerator];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v161 objects:v184 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v162;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v162 != v24) {
          objc_enumerationMutation(v21);
        }
        [(RTVisitPipelineMotionAccumulator *)v20 processMotionActivity:*(void *)(*((void *)&v161 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v161 objects:v184 count:16];
    }
    while (v23);
  }

  id v26 = [v144 startDate];
  [(RTVisitPipelineMotionAccumulator *)v20 finishMotionObservations:v26];

  v27 = [(RTVisitPipelineMotionAccumulator *)v20 getTrimDate];
  v139 = v27;
  if (v27)
  {
    uint64_t v28 = [v27 laterDate:v151];

    v151 = (void *)v28;
  }
  id v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v98 = (objc_class *)objc_opt_class();
    v99 = NSStringFromClass(v98);
    NSStringFromSelector(a2);
    v100 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v101 = [v142 count];
    *(_DWORD *)buf = 138412802;
    v167 = v99;
    __int16 v168 = 2112;
    v169 = v100;
    __int16 v170 = 2048;
    uint64_t v171 = v101;
    _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "%@ %@: Visit start, number of detected moving activities: %lu.", buf, 0x20u);
  }
  id v30 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [(RTVisitPipelineMotionAccumulatorParams *)v145->_motionAccumulatorParams maxTimeToTrim];
  double v32 = -v31;
  v33 = [v4 visit];
  id v34 = [v33 exit];
  uint64_t v35 = (void *)[v30 initWithTimeInterval:v34 sinceDate:v32];

  id v36 = objc_alloc(MEMORY[0x1E4F28C18]);
  v37 = [v4 visit];
  v38 = [v37 entry];
  v138 = v35;
  v39 = [v35 laterDate:v38];
  [(RTVisitPipelineMotionAccumulatorParams *)v145->_motionAccumulatorParams maxTimeToTrim];
  double v41 = v40;
  [(RTVisitPipelineMotionAccumulatorParams *)v145->_motionAccumulatorParams motionLookWindowOutsideVisit];
  uint64_t v43 = [v36 initWithStartDate:v39 duration:v41 + v42];

  v44 = (void *)v43;
  id v160 = v18;
  v45 = [(RTVisitPipelineModuleMotionStateTrimmer *)v145 _fetchActivitiesWithinDateInterval:v43 error:&v160];
  id v46 = v160;

  if (v46)
  {
    v47 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v111 = (objc_class *)objc_opt_class();
      v112 = NSStringFromClass(v111);
      NSStringFromSelector(a2);
      v113 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v167 = v112;
      __int16 v168 = 2112;
      v169 = v113;
      __int16 v170 = 2112;
      uint64_t v171 = (uint64_t)v46;
      __int16 v172 = 2112;
      id v173 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_DEBUG, "%@ %@: Failed to fetch motion activities at end, error, %@, for cluster %@", buf, 0x2Au);
    }
  }
  v48 = [[RTVisitPipelineMotionAccumulator alloc] initWithParams:v145->_motionAccumulatorParams processInReverse:0];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v49 = v45;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v156 objects:v183 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v157;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v157 != v52) {
          objc_enumerationMutation(v49);
        }
        [(RTVisitPipelineMotionAccumulator *)v48 processMotionActivity:*(void *)(*((void *)&v156 + 1) + 8 * j)];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v156 objects:v183 count:16];
    }
    while (v51);
  }

  long long v54 = [v44 endDate];
  [(RTVisitPipelineMotionAccumulator *)v48 finishMotionObservations:v54];

  v55 = [(RTVisitPipelineMotionAccumulator *)v48 getTrimDate];
  v137 = v55;
  if (v55)
  {
    uint64_t v56 = [v55 earlierDate:v150];

    v150 = (void *)v56;
  }
  v57 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    v102 = (objc_class *)objc_opt_class();
    v103 = NSStringFromClass(v102);
    NSStringFromSelector(a2);
    v104 = v44;
    v105 = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v106 = [v49 count];
    *(_DWORD *)buf = 138412802;
    v167 = v103;
    __int16 v168 = 2112;
    v169 = v105;
    __int16 v170 = 2048;
    uint64_t v171 = v106;
    _os_log_debug_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_DEBUG, "%@ %@: Visit end, number of detected moving activities: %lu.", buf, 0x20u);

    v44 = v104;
  }

  v143 = v4;
  if ([v151 isOnOrBefore:v150])
  {
    v132 = v44;
    id v133 = v46;
    os_log_t log = (os_log_t)objc_opt_new();
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v58 = [v4 points];
    uint64_t v59 = [v58 locations];

    uint64_t v60 = [v59 countByEnumeratingWithState:&v152 objects:v182 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v153;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v153 != v62) {
            objc_enumerationMutation(v59);
          }
          id v64 = *(void **)(*((void *)&v152 + 1) + 8 * k);
          v65 = [v64 date];
          uint64_t v66 = [v65 compare:v151];

          if (v66 != -1)
          {
            uint64_t v67 = [v64 date];
            uint64_t v68 = [v150 compare:v67];

            if (v68 != -1) {
              [log addObject:v64];
            }
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v152 objects:v182 count:16];
      }
      while (v61);
    }

    uint64_t v69 = [log count];
    id v70 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v71 = v70;
    if (v69)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v72 = (objc_class *)objc_opt_class();
        v146 = NSStringFromClass(v72);
        NSStringFromSelector(a2);
        aSelectora = (char *)objc_claimAutoreleasedReturnValue();
        v130 = [v143 visit];
        v128 = [v130 entry];
        __int16 v73 = [v128 stringFromDate];
        v74 = [v151 stringFromDate];
        v127 = [v143 visit];
        v126 = [v127 exit];
        __int16 v75 = [v126 stringFromDate];
        v76 = [v150 stringFromDate];
        v125 = [v143 points];
        v77 = [v125 locations];
        uint64_t v78 = [v77 count];
        uint64_t v79 = [log count];
        *(_DWORD *)buf = 138414082;
        v167 = v146;
        __int16 v168 = 2112;
        v169 = aSelectora;
        __int16 v170 = 2112;
        uint64_t v171 = (uint64_t)v73;
        __int16 v172 = 2112;
        id v173 = v74;
        __int16 v174 = 2112;
        v175 = v75;
        __int16 v176 = 2112;
        v177 = v76;
        __int16 v178 = 2048;
        uint64_t v179 = v78;
        __int16 v180 = 2048;
        uint64_t v181 = v79;
        _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "%@ %@: Visit trimming, entry date %@ -> %@, exit date %@ -> %@ Locations count %lu -> %lu", buf, 0x52u);
      }
      id v131 = objc_alloc(MEMORY[0x1E4F5CFC8]);
      v147 = [v143 visit];
      uint64_t v129 = [v147 type];
      aSelectorb = [v143 visit];
      v80 = [aSelectorb location];
      uint64_t v81 = [log count];
      v82 = [v143 visit];
      [v82 confidence];
      double v84 = v83;
      v85 = [v143 visit];
      v86 = [v85 placeInference];
      v71 = [v131 initWithDate:v151 type:v129 location:v80 entry:v151 exit:v150 dataPointCount:v81 confidence:v84 placeInference:v86];

      v87 = [RTVisitCluster alloc];
      v88 = [[RTVisitLocationPoints alloc] initWithLocations:log];
      v89 = [(RTVisitCluster *)v87 initWithPoints:v88 visit:v71];

      v44 = v132;
      id v46 = v133;
    }
    else
    {
      id v46 = v133;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        v122 = (objc_class *)objc_opt_class();
        v123 = NSStringFromClass(v122);
        NSStringFromSelector(a2);
        v124 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v167 = v123;
        __int16 v168 = 2112;
        v169 = v124;
        __int16 v170 = 2112;
        uint64_t v171 = (uint64_t)v151;
        __int16 v172 = 2112;
        id v173 = v150;
        _os_log_debug_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_DEBUG, "%@ %@: Visit culled, no locations between %@ and %@", buf, 0x2Au);
      }
      v89 = 0;
      v44 = v132;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v114 = (objc_class *)objc_opt_class();
      v115 = NSStringFromClass(v114);
      NSStringFromSelector(a2);
      v116 = (char *)objc_claimAutoreleasedReturnValue();
      [v4 visit];
      v148 = v117 = v4;
      v118 = [v148 entry];
      v119 = [v117 visit];
      [v119 exit];
      v121 = v120 = v44;
      *(_DWORD *)buf = 138413058;
      v167 = v115;
      __int16 v168 = 2112;
      v169 = v116;
      __int16 v170 = 2112;
      uint64_t v171 = (uint64_t)v118;
      __int16 v172 = 2112;
      id v173 = v121;
      _os_log_debug_impl(&dword_1D9BFA000, log, OS_LOG_TYPE_DEBUG, "%@ %@: Visit culled, only motion between %@ and %@", buf, 0x2Au);

      v44 = v120;
    }
    v89 = 0;
  }

  return v89;
}

- (id)process:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v25 = v4;
      uint64_t v9 = *(void *)v29;
      id v26 = v6;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v12 = [v11 visit];
          v13 = [v12 entry];

          double v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v13)
          {
            if (v15)
            {
              id v18 = (objc_class *)objc_opt_class();
              v19 = NSStringFromClass(v18);
              v20 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v33 = v19;
              __int16 v34 = 2112;
              uint64_t v35 = v20;
              __int16 v36 = 2112;
              v37 = v11;
              _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: working on cluster, %@", buf, 0x20u);

              id v6 = v26;
            }

            id v16 = [(RTVisitPipelineModuleMotionStateTrimmer *)self _trimVisitClusterForMotionActivity:v11];
          }
          else
          {
            if (v15)
            {
              v21 = (objc_class *)objc_opt_class();
              uint64_t v22 = NSStringFromClass(v21);
              uint64_t v23 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v33 = v22;
              __int16 v34 = 2112;
              uint64_t v35 = v23;
              __int16 v36 = 2112;
              v37 = v11;
              _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: skipping cluster with null visit entry, %@ ", buf, 0x20u);

              id v6 = v26;
            }

            id v16 = v11;
          }
          double v17 = v16;
          if (v16) {
            [v5 addObject:v16];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v8);
      id v4 = v25;
    }
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (RTVisitPipelineMotionAccumulatorParams)motionAccumulatorParams
{
  return self->_motionAccumulatorParams;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivityManager, 0);

  objc_storeStrong((id *)&self->_motionAccumulatorParams, 0);
}

@end