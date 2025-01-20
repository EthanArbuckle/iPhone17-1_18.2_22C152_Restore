@interface RTLearnedLocationReconcilerModel
- (double)_weightWithDeviceWeight:(double)a3 visitsPercentage:(double)a4 transitionsPercentage:(double)a5 semanticLabel:(BOOL)a6 firstVisit:(BOOL)a7 earliestTransition:(BOOL)a8 rawLocationCount:(unint64_t)a9;
- (double)scoreForDeviceClass:(id)a3;
- (double)weightForVisit:(id)a3 modelContext:(id)a4;
@end

@implementation RTLearnedLocationReconcilerModel

- (double)scoreForDeviceClass:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 containsString:@"iPhone"])
  {
    double v4 = 0.3333;
  }
  else if ([v3 containsString:@"Watch"])
  {
    double v4 = 0.2667;
  }
  else if ([v3 containsString:@"iPad"])
  {
    double v4 = 0.2;
  }
  else
  {
    double v4 = 0.1333;
    if (([v3 containsString:@"Mac"] & 1) == 0
      && ([v3 containsString:@"VMWare"] & 1) == 0)
    {
      if ([v3 containsString:@"iPod"])
      {
        double v4 = 0.0667;
      }
      else
      {
        v5 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138412290;
          id v9 = v3;
          _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "cannot calculate score for device class, %@, because it is unknown.", (uint8_t *)&v8, 0xCu);
        }

        v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v8 = 138412802;
          id v9 = v3;
          __int16 v10 = 2080;
          v11 = "-[RTLearnedLocationReconcilerModel scoreForDeviceClass:]";
          __int16 v12 = 1024;
          int v13 = 44;
          _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "cannot calculate score for device class, %@, because it is unknown. (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
        }

        double v4 = -1.0;
      }
    }
  }

  return v4;
}

- (double)weightForVisit:(id)a3 modelContext:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 device];
  id v9 = [v8 deviceClass];
  v57 = self;
  [(RTLearnedLocationReconcilerModel *)self scoreForDeviceClass:v9];
  double v11 = v10;

  __int16 v12 = [v6 device];
  int v13 = [v12 visits];
  unint64_t v14 = [v13 count];

  v15 = [v7 devices];
  v16 = [v15 valueForKeyPath:@"@sum.visits.@count"];
  unint64_t v17 = [v16 unsignedIntegerValue];

  v18 = [v6 device];
  v19 = [v18 transitions];
  unint64_t v20 = [v19 count];

  v21 = [v7 devices];
  v22 = [v21 valueForKeyPath:@"@sum.transitions.@count"];
  unint64_t v23 = [v22 unsignedIntegerValue];

  v24 = [v6 place];
  v25 = [v24 type];
  uint64_t v56 = [v25 unsignedIntegerValue];

  v26 = [v6 dataPointCount];
  uint64_t v55 = [v26 unsignedIntegerValue];

  if (v17) {
    double v27 = (double)v14 / (double)v17;
  }
  else {
    double v27 = 0.0;
  }
  if (v23) {
    double v28 = (double)v20 / (double)v23;
  }
  else {
    double v28 = 0.0;
  }
  v29 = [v6 place];
  v30 = [v29 visits];
  if ([v30 count] == 1)
  {
    v31 = [v6 place];
    v32 = [v31 visits];
    v33 = [v32 allObjects];
    v34 = [v33 firstObject];
    unsigned int v54 = [v34 isEqual:v6];
  }
  else
  {
    unsigned int v54 = 0;
  }

  v35 = [v6 outbound];
  v36 = [v35 startDate];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v58 = v7;
  v37 = [v7 overlappingVisits];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v60 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v43 = [v42 outbound];
        v44 = [v43 startDate];
        int v45 = [v44 isBeforeDate:v36];

        if (v45)
        {
          v46 = [v42 outbound];
          uint64_t v47 = [v46 startDate];

          v36 = (void *)v47;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v39);
  }

  v48 = [v6 outbound];
  v49 = [v48 startDate];
  uint64_t v50 = [v36 isEqual:v49];

  [(RTLearnedLocationReconcilerModel *)v57 _weightWithDeviceWeight:(unint64_t)(v56 - 1) < 3 visitsPercentage:v54 transitionsPercentage:v50 semanticLabel:v55 firstVisit:v11 earliestTransition:v27 rawLocationCount:v28];
  double v52 = v51;

  return v52;
}

- (double)_weightWithDeviceWeight:(double)a3 visitsPercentage:(double)a4 transitionsPercentage:(double)a5 semanticLabel:(BOOL)a6 firstVisit:(BOOL)a7 earliestTransition:(BOOL)a8 rawLocationCount:(unint64_t)a9
{
  double v9 = a4 * 0.1538 + a3 * 0.2308 + a5 * 0.0769 + (double)a6 * 0.0769 + (double)a7 * 0.2308 + (double)a8 * 0.1923;
  if (a9 <= 0xC7) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }
  double v11 = v9 + v10 * 0.0385;
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  return fmin(v11, 1.0);
}

@end