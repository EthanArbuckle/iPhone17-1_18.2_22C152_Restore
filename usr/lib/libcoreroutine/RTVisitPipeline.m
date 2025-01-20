@interface RTVisitPipeline
+ (id)typeToString:(unint64_t)a3;
- (BOOL)bootStrappingDone;
- (BOOL)isRedundantForVisit:(id)a3 currentVisit:(id)a4 distanceCalculator:(id)a5;
- (NSDate)lastProcessedLocationDate;
- (NSString)name;
- (RTVisit)lastVisit;
- (RTVisitHyperParameter)hyperParameter;
- (RTVisitPipeline)init;
- (RTVisitPipeline)initWithModules:(id)a3 name:(id)a4 type:(unint64_t)a5 lastVisit:(id)a6 hyperParameter:(id)a7;
- (id)description;
- (id)filterLocations:(id)a3;
- (id)filterVisitClusters:(id)a3;
- (id)processLocations:(id)a3;
- (id)processVisitCluster:(id)a3;
- (unint64_t)type;
- (void)setBootStrappingDone:(BOOL)a3;
- (void)setLastProcessedLocationDate:(id)a3;
- (void)shutdown;
@end

@implementation RTVisitPipeline

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B91EE8[a3 - 1];
  }
}

- (RTVisitPipeline)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithModules_name_type_lastVisit_hyperParameter_);
}

- (RTVisitPipeline)initWithModules:(id)a3 name:(id)a4 type:(unint64_t)a5 lastVisit:(id)a6 hyperParameter:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (![v12 count])
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v44 = "Invalid parameter not satisfying: modules.count";
LABEL_36:
    _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_37;
  }
  if (!v13)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v44 = "Invalid parameter not satisfying: name";
    goto LABEL_36;
  }
  if (a5 > 4 || ((1 << a5) & 0x16) == 0)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", buf, 2u);
    }

    if (a5 != 4) {
      goto LABEL_38;
    }
  }
  if (!v15)
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v44 = "Invalid parameter not satisfying: hyperParameter";
      goto LABEL_36;
    }
LABEL_37:

LABEL_38:
    v42 = 0;
    goto LABEL_39;
  }
  unint64_t v48 = a5;
  id v49 = a7;
  v50 = v14;
  v51 = v13;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v58;
    *(void *)&long long v18 = 138413058;
    long long v47 = v18;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ((objc_msgSend(v22, "conformsToProtocol:", &unk_1F3455680, v47) & 1) == 0)
        {
          v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v47;
            v63 = v22;
            __int16 v64 = 2112;
            v65 = v51;
            __int16 v66 = 2080;
            v67 = "-[RTVisitPipeline initWithModules:name:type:lastVisit:hyperParameter:]";
            __int16 v68 = 1024;
            int v69 = 97;
            _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "%@ doesn't conform to RTVisitPipelineModule for pipeline, %@ (in %s:%d)", buf, 0x26u);
          }
        }
        if (![v22 conformsToProtocol:&unk_1F3455680])
        {

          v42 = 0;
          goto LABEL_33;
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  v56.receiver = self;
  v56.super_class = (Class)RTVisitPipeline;
  v24 = [(RTVisitPipeline *)&v56 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    modules = v24->_modules;
    v24->_modules = (NSArray *)v25;

    uint64_t v27 = objc_opt_new();
    moduleStats = v24->_moduleStats;
    v24->_moduleStats = (NSMutableDictionary *)v27;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v29 = v24->_modules;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v53 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = objc_opt_new();
          v35 = v24->_moduleStats;
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:v37];
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v31);
    }

    uint64_t v38 = [v50 copy];
    lastVisit = v24->_lastVisit;
    v24->_lastVisit = (RTVisit *)v38;

    uint64_t v40 = [v51 copy];
    name = v24->_name;
    v24->_name = (NSString *)v40;

    v24->_type = v48;
    objc_storeStrong((id *)&v24->_hyperParameter, v49);
  }
  self = v24;
  v42 = self;
LABEL_33:
  id v14 = v50;
  id v13 = v51;
LABEL_39:

  return v42;
}

- (void)shutdown
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = self->_modules;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        [v3 addObject:v10];
        moduleStats = self->_moduleStats;
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        id v14 = [(NSMutableDictionary *)moduleStats objectForKeyedSubscript:v13];

        id v15 = NSNumber;
        [v14 cumulativeProcessingDuration];
        id v16 = [v15 numberWithDouble:];
        [v3 addObject:v16];

        if (objc_opt_respondsToSelector()) {
          [v8 shutdown];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v5);
  }

  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = NSStringFromSelector(a2);
    name = self->_name;
    unint64_t iteration = self->_iteration;
    v21 = [v3 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = name;
    __int16 v32 = 2048;
    unint64_t v33 = iteration;
    __int16 v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, pipeline, %@, iterations, %lu, moduleProcessingDurations, %@", buf, 0x2Au);
  }
}

- (id)description
{
  v3 = NSString;
  name = self->_name;
  uint64_t v5 = [(id)objc_opt_class() typeToString:self->_type];
  NSUInteger v6 = [(NSArray *)self->_modules count];
  uint64_t v7 = @"YES";
  if (!self->_bootStrappingDone) {
    uint64_t v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"name, %@, type, %@, %lu modules, bootstrappingDone, %@, lastVisit, %@", name, v5, v6, v7, self->_lastVisit];

  return v8;
}

- (id)filterLocations:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__RTVisitPipeline_filterLocations___block_invoke;
  v8[3] = &unk_1E6B91EC8;
  v8[4] = self;
  id v4 = a3;
  uint64_t v5 = [v3 predicateWithBlock:v8];
  NSUInteger v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __35__RTVisitPipeline_filterLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 72)
    && ([v5 date],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isOnOrBefore:*(void *)(*(void *)(a1 + 32) + 72)],
        v7,
        (v8 & 1) != 0)
    || ([v5 horizontalUncertainty],
        double v10 = v9,
        [*(id *)(*(void *)(a1 + 32) + 64) maxHorizontalAccuracy],
        v10 > v11))
  {
    BOOL v12 = 0;
  }
  else
  {
    [v5 horizontalUncertainty];
    BOOL v12 = v13 >= 0.0;
  }

  return v12;
}

- (id)processLocations:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(RTVisitPipeline *)self filterLocations:a3];
  if ([v4 count])
  {
    ++self->_iteration;
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      unint64_t iteration = self->_iteration;
      uint64_t v15 = [v4 count];
      id v16 = [v4 firstObject];
      uint64_t v17 = [v16 date];
      long long v18 = [v17 stringFromDate];
      uint64_t v19 = [v4 lastObject];
      uint64_t v20 = [v19 date];
      v21 = [v20 stringFromDate];
      *(_DWORD *)buf = 138413314;
      v35 = name;
      __int16 v36 = 2048;
      unint64_t v37 = iteration;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v18;
      __int16 v42 = 2112;
      v43 = v21;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, with %lu points from, %@, to %@", buf, 0x34u);
    }
    id v6 = [v4 lastObject];
    uint64_t v7 = [v6 date];
    lastProcessedLocationDate = self->_lastProcessedLocationDate;
    self->_lastProcessedLocationDate = v7;

    double v9 = [[RTVisitLocationPoints alloc] initWithLocations:v4];
    double v10 = [[RTVisitCluster alloc] initWithPoints:v9];
    v46[0] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];

    BOOL v12 = [(RTVisitPipeline *)self processVisitCluster:v11];
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v22 = [(RTVisitPipeline *)self name];
      unint64_t v29 = self->_iteration;
      uint64_t v28 = [v12 count];
      uint64_t v27 = [v4 count];
      unint64_t v33 = [v4 firstObject];
      uint64_t v31 = [v33 date];
      v23 = [v31 stringFromDate];
      long long v24 = [v4 lastObject];
      long long v25 = [v24 date];
      long long v26 = [v25 stringFromDate];
      *(_DWORD *)buf = 138413570;
      v35 = v22;
      __int16 v36 = 2048;
      unint64_t v37 = v29;
      __int16 v38 = 2048;
      uint64_t v39 = v28;
      __int16 v40 = 2048;
      uint64_t v41 = v27;
      __int16 v42 = 2112;
      v43 = v23;
      __int16 v44 = 2112;
      v45 = v26;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, detected %lu visits from %lu locations ranging from %@ to %@", buf, 0x3Eu);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)processVisitCluster:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v5 = self->_modules;
  uint64_t v49 = [(NSArray *)v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (!v49)
  {

LABEL_24:
    uint64_t v32 = [(RTVisitPipeline *)self filterVisitClusters:v4];

    id v4 = (id)v32;
    goto LABEL_25;
  }
  char v47 = 0;
  uint64_t v48 = *(void *)v55;
  *(void *)&long long v6 = 138412802;
  long long v45 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v49; ++i)
    {
      if (*(void *)v55 != v48) {
        objc_enumerationMutation(v5);
      }
      char v8 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      double v9 = (void *)MEMORY[0x1E016D870]();
      moduleStats = self->_moduleStats;
      double v11 = (objc_class *)objc_opt_class();
      BOOL v12 = NSStringFromClass(v11);
      double v13 = [(NSMutableDictionary *)moduleStats objectForKeyedSubscript:v12];

      [v13 startIterationWithVisitClusters:v4];
      id v14 = [v8 process:v4];

      [v13 stopIterationWithVisitClusters:v14];
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        unint64_t iteration = self->_iteration;
        long long v25 = (objc_class *)objc_opt_class();
        long long v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138413058;
        long long v60 = name;
        __int16 v61 = 2048;
        unint64_t v62 = iteration;
        __int16 v63 = 2112;
        __int16 v64 = v26;
        __int16 v65 = 2112;
        __int16 v66 = v13;
        _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, module, %@, stats, %@", buf, 0x2Au);
      }
      double v16 = (double)(unint64_t)[v13 lastLocationCount];
      [(RTVisitHyperParameter *)self->_hyperParameter maxGapInVisit];
      if (v17 < v16)
      {
        long long v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          uint64_t v27 = self->_name;
          uint64_t v28 = [v13 lastLocationCount];
          [(RTVisitHyperParameter *)self->_hyperParameter maxGapInVisit];
          *(_DWORD *)buf = v45;
          long long v60 = v27;
          __int16 v61 = 2048;
          unint64_t v62 = v28;
          __int16 v63 = 2048;
          __int16 v64 = v29;
          _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "pipeline, %@, lastLocationCount, %lu, exceeded maxLocationCount, %.0f", buf, 0x20u);
        }
      }
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      int v23 = [v20 isEqualToString:v22];

      if (v23)
      {
        id v4 = [(RTVisitPipeline *)self filterVisitClusters:v14];

        char v47 = 1;
      }
      else
      {
        id v4 = v14;
      }
      if (!objc_msgSend(v4, "count", v45))
      {
        __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = self->_name;
          unint64_t v42 = self->_iteration;
          v43 = (objc_class *)objc_opt_class();
          __int16 v44 = NSStringFromClass(v43);
          *(_DWORD *)buf = v45;
          long long v60 = v41;
          __int16 v61 = 2048;
          unint64_t v62 = v42;
          __int16 v63 = 2112;
          __int16 v64 = v44;
          _os_log_debug_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, is terminated by %@", buf, 0x20u);
        }
        uint64_t v31 = 0;
        goto LABEL_35;
      }
    }
    uint64_t v49 = [(NSArray *)v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v49) {
      continue;
    }
    break;
  }

  if ((v47 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v4 count]];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = (NSArray *)v4;
  uint64_t v33 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v5);
        }
        unint64_t v37 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        __int16 v38 = [v37 visit];

        if (v38)
        {
          uint64_t v39 = [v37 visit];
          [v31 addObject:v39];
        }
      }
      uint64_t v34 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v34);
  }
  id v4 = v5;
LABEL_35:

  return v31;
}

- (BOOL)isRedundantForVisit:(id)a3 currentVisit:(id)a4 distanceCalculator:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_32;
  }
  uint64_t v11 = [v8 exit];
  if (v11)
  {
    BOOL v12 = (void *)v11;
    double v13 = [v9 entry];
    id v14 = [v8 exit];
    char v15 = [v13 isOnOrAfter:v14];

    if (v15) {
      goto LABEL_32;
    }
  }
  double v16 = [v8 exit];
  if (v16) {
    goto LABEL_9;
  }
  double v16 = [v8 entry];
  double v17 = [v9 entry];
  if (([v16 isEqualToDate:v17] & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  long long v18 = [v9 exit];

  if (v18) {
    goto LABEL_32;
  }
LABEL_10:
  uint64_t v19 = [v8 exit];
  if (v19)
  {

    goto LABEL_13;
  }
  uint64_t v20 = [v9 exit];

  if (v20)
  {
LABEL_13:
    v21 = [v8 entry];
    v22 = [v9 entry];
    if ([v21 isEqualToDate:v22])
    {
      int v23 = [v9 exit];

      if (!v23)
      {
        long long v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          long long v45 = (const char *)v9;
          __int16 v46 = 2112;
          id v47 = v8;
          _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "likely false LC visit, %@, with identical entry as last visit, %@", buf, 0x16u);
        }
LABEL_22:
        BOOL v27 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
    }
    long long v25 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      long long v45 = (const char *)name;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@ hits illegitimate case with current visit, %@, last visit, %@", buf, 0x20u);
    }

    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v45 = "-[RTVisitPipeline isRedundantForVisit:currentVisit:distanceCalculator:]";
      __int16 v46 = 1024;
      LODWORD(v47) = 286;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "illegitimate case (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_22;
  }
  uint64_t v28 = [v8 location];
  unint64_t v29 = [v9 location];
  id v43 = 0;
  [v10 distanceFromLocation:v28 toLocation:v29 error:&v43];
  double v31 = v30;
  uint64_t v32 = (char *)v43;

  if (v32)
  {
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v45 = v32;
      _os_log_debug_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
    }
  }
  uint64_t v34 = [v9 entry];
  uint64_t v35 = [v8 entry];
  int v36 = [v34 isOnOrAfter:v35];
  if (!v36 || v31 > 250.0)
  {

    if (!v36) {
      goto LABEL_30;
    }
LABEL_32:
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = self->_name;
      *(_DWORD *)buf = 138412802;
      long long v45 = (const char *)v41;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@ Added non-redundant visit, %@, last visit, %@,", buf, 0x20u);
    }
    BOOL v27 = 0;
    goto LABEL_35;
  }
  unint64_t v37 = [v8 entry];
  __int16 v38 = [v9 entry];
  [v37 timeIntervalSinceDate:v38];
  double v40 = v39;

  if (v40 > 86400.0) {
    goto LABEL_32;
  }
LABEL_30:
  BOOL v27 = 1;
LABEL_36:

  return v27;
}

- (id)filterVisitClusters:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v37 = (id)objc_opt_new();
    id v5 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v36 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (!v7) {
      goto LABEL_36;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        BOOL v12 = [v11 visit];

        if (v12)
        {
          double v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = (const char *)v11;
            _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "inspecting cluster=%@", buf, 0xCu);
          }

          id v14 = [v11 visit];
          char v15 = [v14 entry];

          if (!v15)
          {
            double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v43 = "-[RTVisitPipeline filterVisitClusters:]";
              __int16 v44 = 1024;
              LODWORD(v45) = 310;
              _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit.entry (in %s:%d)", buf, 0x12u);
            }
          }
          double v17 = [v11 visit];
          long long v18 = [v17 location];

          if (!v18)
          {
            uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v43 = "-[RTVisitPipeline filterVisitClusters:]";
              __int16 v44 = 1024;
              LODWORD(v45) = 311;
              _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit.location (in %s:%d)", buf, 0x12u);
            }
          }
          uint64_t v20 = [v11 visit];
          if ([v20 type] == 3)
          {
LABEL_22:
          }
          else
          {
            v21 = [v11 visit];
            uint64_t v22 = [v21 type];

            if (v22 != 1)
            {
              uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v43 = "-[RTVisitPipeline filterVisitClusters:]";
                __int16 v44 = 1024;
                LODWORD(v45) = 312;
                _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTVisitTypeExit == cluster.visit.type || RTVisitTypeEntry == cluster.visit.type (in %s:%d)", buf, 0x12u);
              }
              goto LABEL_22;
            }
          }
          int v23 = [v11 visit];
          if ([v23 type] == 3)
          {
            long long v24 = [v11 visit];
            long long v25 = [v24 exit];

            if (!v25)
            {
              int v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v43 = "-[RTVisitPipeline filterVisitClusters:]";
                __int16 v44 = 1024;
                LODWORD(v45) = 313;
                _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !(RTVisitTypeExit == cluster.visit.type) || cluster.visit.exit (in %s:%d)", buf, 0x12u);
              }
              goto LABEL_27;
            }
          }
          else
          {
LABEL_27:
          }
          lastVisit = self->_lastVisit;
          BOOL v27 = [v11 visit];
          uint64_t v28 = (void *)[v27 copy];
          LOBYTE(lastVisit) = [(RTVisitPipeline *)self isRedundantForVisit:lastVisit currentVisit:v28 distanceCalculator:v5];

          if (lastVisit)
          {
            unint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              name = self->_name;
              uint64_t v34 = self->_lastVisit;
              *(_DWORD *)buf = 138412802;
              id v43 = (const char *)name;
              __int16 v44 = 2112;
              long long v45 = v11;
              __int16 v46 = 2112;
              id v47 = v34;
              _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "%@ drop visit cluster, %@, last visit, %@", buf, 0x20u);
            }
          }
          else
          {
            [v37 addObject:v11];
          }
          double v30 = [v11 visit];
          double v31 = (RTVisit *)[v30 copy];
          uint64_t v32 = self->_lastVisit;
          self->_lastVisit = v31;

          continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (!v8)
      {
LABEL_36:

        id v4 = v36;
        goto LABEL_38;
      }
    }
  }
  id v37 = 0;
LABEL_38:

  return v37;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (RTVisit)lastVisit
{
  return self->_lastVisit;
}

- (BOOL)bootStrappingDone
{
  return self->_bootStrappingDone;
}

- (void)setBootStrappingDone:(BOOL)a3
{
  self->_bootStrappingDone = a3;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (NSDate)lastProcessedLocationDate
{
  return self->_lastProcessedLocationDate;
}

- (void)setLastProcessedLocationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedLocationDate, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_moduleStats, 0);

  objc_storeStrong((id *)&self->_modules, 0);
}

@end