@interface RTLearnedLocation
+ (double)confidenceFromDataPointCount:(unint64_t)a3 highConfidenceThreshold:(double)a4;
+ (id)removeLearnedVisitsInvalid:(id)a3;
+ (id)removeLearnedVisitsPinned:(id)a3;
+ (id)removeLearnedVisitsWithShortestDwell:(id)a3;
+ (id)removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:(id)a3;
+ (id)shiftLocation:(id)a3 shifter:(id)a4;
- (BOOL)isEqual:(id)a3;
- (RTLearnedLocation)init;
- (RTLearnedLocation)initWithChinaShiftedLearnedLocations:(id)a3 type:(unint64_t)a4;
- (RTLearnedLocation)initWithLearnedLocations:(id)a3 type:(unint64_t)a4;
- (RTLearnedLocation)initWithLearnedVisits:(id)a3;
- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 confidence:(double)a5;
- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 type:(unint64_t)a5;
- (RTLearnedLocation)initWithLocationOfInterest:(id)a3;
- (RTLearnedLocation)initWithMapItem:(id)a3 type:(unint64_t)a4;
- (RTLocation)location;
- (double)confidence;
- (id)aggregateLearnedLocations:(id)a3 updateAltitude:(BOOL)a4;
- (id)description;
- (unint64_t)dataPointCount;
- (unint64_t)hash;
- (void)calculateAltitude:(double *)a3 verticalUncertainty:(double *)a4 learnedLocations:(id)a5;
@end

@implementation RTLearnedLocation

- (RTLearnedLocation)initWithLocationOfInterest:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 location];
  [v7 latitude];
  double v9 = v8;
  v10 = [v5 location];
  [v10 longitude];
  double v12 = v11;
  v13 = [v5 location];
  [v13 horizontalUncertainty];
  double v15 = v14;
  v16 = [v5 location];
  [v16 altitude];
  double v18 = v17;
  v19 = [v5 location];
  [v19 verticalUncertainty];
  double v21 = v20;
  v22 = [v5 location];
  v23 = [v6 initWithLatitude:0 longitude:0 horizontalUncertainty:objc_msgSend(v22, "sourceAccuracy") altitude:v9 verticalUncertainty:v12 date:v15 referenceFrame:v21 speed:0.0 sourceAccuracy:0.0];

  v24 = [v5 location];

  v25 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](self, "initWithLocation:dataPointCount:type:", v23, [v24 sourceAccuracy] == 2, 2);
  return v25;
}

- (RTLearnedLocation)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_dataPointCount_confidence_);
}

- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 confidence:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTLearnedLocation;
    v10 = [(RTLearnedLocation *)&v15 init];
    double v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_location, a3);
      v11->_dataPointCount = a4;
      v11->_confidence = a5;
    }
    self = v11;
    double v12 = self;
  }
  else
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v17 = "-[RTLearnedLocation initWithLocation:dataPointCount:confidence:]";
      __int16 v18 = 1024;
      int v19 = 42;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    double v12 = 0;
  }

  return v12;
}

- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 type:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      double v17 = "-[RTLearnedLocation initWithLocation:dataPointCount:type:]";
      __int16 v18 = 1024;
      LODWORD(v19) = 61;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }
  }
  if (a5 >= 3)
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_super v15 = (char *)objc_claimAutoreleasedReturnValue();
      int v16 = 138412546;
      double v17 = v15;
      __int16 v18 = 2048;
      unint64_t v19 = a5;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", (uint8_t *)&v16, 0x16u);
    }
    double v11 = 30.0;
  }
  else
  {
    double v11 = dbl_1DA0FFB48[a5];
  }
  [(id)objc_opt_class() confidenceFromDataPointCount:a4 highConfidenceThreshold:v11];
  v13 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](self, "initWithLocation:dataPointCount:confidence:", v9, a4);

  return v13;
}

+ (id)shiftLocation:(id)a3 shifter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      double v8 = [v6 shiftedLocation:v5 allowNetwork:1 error:0];

      goto LABEL_10;
    }
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: shifter", v11, 2u);
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
  }

  double v8 = 0;
LABEL_10:

  return v8;
}

+ (id)removeLearnedVisitsPinned:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4838400.0];
    id v6 = (void *)MEMORY[0x1E4F28F60];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__RTLearnedLocation_removeLearnedVisitsPinned___block_invoke;
    v14[3] = &unk_1E6B98CB8;
    id v15 = v5;
    id v7 = v5;
    double v8 = [v6 predicateWithBlock:v14];
    id v9 = [v4 filteredArrayUsingPredicate:v8];

    if ([v9 count])
    {
      id v10 = v9;

      v4 = v10;
    }
    double v11 = v4;

    double v12 = v11;
  }
  else
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    double v12 = 0;
  }

  return v12;
}

uint64_t __47__RTLearnedLocation_removeLearnedVisitsPinned___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 entryDate];
  id v5 = [v3 earlierDate:v4];
  uint64_t v6 = [v5 isEqualToDate:*(void *)(a1 + 32)];

  return v6;
}

+ (id)removeLearnedVisitsInvalid:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v20 = v3;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v11 = [v10 location];
          double v12 = [v11 location];
          [v12 horizontalUncertainty];
          double v14 = v13;

          if (v14 <= -1.0)
          {
            id v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              int v16 = (objc_class *)objc_opt_class();
              double v17 = NSStringFromClass(v16);
              __int16 v18 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v27 = v17;
              __int16 v28 = 2112;
              v29 = v18;
              __int16 v30 = 2112;
              v31 = v10;
              _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "%@, %@, filter invalid visit, %@", buf, 0x20u);
            }
          }
          else
          {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v7);
      id v3 = v20;
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)removeLearnedVisitsWithShortestDwell:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          double v13 = [v12 location:v24];
          double v14 = [v13 location];
          uint64_t v15 = [v14 sourceAccuracy];

          if (v15 == 2) {
            int v16 = v5;
          }
          else {
            int v16 = v6;
          }
          [v16 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    if ((unint64_t)[v5 count] >= 5)
    {
      double v17 = [v5 sortedArrayUsingComparator:&__block_literal_global_76];
      __int16 v18 = (void *)MEMORY[0x1E4F1CA48];
      unint64_t v19 = [v17 subarrayWithRange:0, [v17 count] - (unint64_t)((double)(unint64_t)objc_msgSend(v17, "count") * 0.2)];
      id v20 = [v18 arrayWithArray:v19];

      [v20 addObjectsFromArray:v6];
      id v7 = v20;
    }
    double v21 = v7;

    long long v22 = v21;
  }
  else
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    long long v22 = 0;
  }

  return v22;
}

uint64_t __58__RTLearnedLocation_removeLearnedVisitsWithShortestDwell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 exitDate];
  id v7 = [v5 entryDate];

  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  uint64_t v10 = [v4 exitDate];
  double v11 = [v4 entryDate];

  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v9 <= v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v9 < v13) {
    return 1;
  }
  else {
    return v14;
  }
}

+ (id)removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ((unint64_t)[v4 count] > 2)
    {
      double v8 = [[_RTMap alloc] initWithInput:v5];
      double v9 = [(_RTMap *)v8 withBlock:&__block_literal_global_22_0];

      uint64_t v10 = [v9 sortedArrayUsingSelector:sel_compare_];
      double v11 = [v10 objectAtIndex:((unint64_t)[v9 count]) >> 1];
      [v11 doubleValue];
      double v13 = v12;

      double v14 = v13 * 3.0;
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v20 = v16;
        __int16 v21 = 2048;
        double v22 = v14;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, filter locations based on maximum horizonal uncertainty, %.1f", buf, 0x16u);
      }
      double v17 = [[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K <= %f", @"location", @"horizontalUncertainty", *(void *)&v14];
      id v6 = [v5 filteredArrayUsingPredicate:v17];
    }
    else
    {
      id v6 = v5;
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

id __81__RTLearnedLocation_removeOutlierLearnedLocationsWithLargeHorizontalUncertainty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  id v3 = [a2 location];
  [v3 horizontalUncertainty];
  id v4 = [v2 numberWithDouble:];

  return v4;
}

- (void)calculateAltitude:(double *)a3 verticalUncertainty:(double *)a4 learnedLocations:(id)a5
{
  id v7 = a5;
  double v8 = v7;
  if (!a3)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    double v12 = "Invalid parameter not satisfying: altitudeEstimation";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_11;
  }
  if (!a4)
  {
    double v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    double v12 = "Invalid parameter not satisfying: verticalUncertaintyEstimation";
    goto LABEL_21;
  }
  *a3 = 0.0;
  *a4 = -1.0;
  if ([v7 count])
  {
    *(void *)buf = 0;
    v35 = buf;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    v31 = (double *)&v30;
    uint64_t v32 = 0x2020000000;
    unint64_t v33 = 0xBFF0000000000000;
    uint64_t v26 = 0;
    long long v27 = (double *)&v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = 0;
    unint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__RTLearnedLocation_calculateAltitude_verticalUncertainty_learnedLocations___block_invoke;
    v17[3] = &unk_1E6B98D20;
    v17[4] = buf;
    v17[5] = &v30;
    v17[6] = &v18;
    v17[7] = &v26;
    v17[8] = &v22;
    [v8 enumerateObjectsUsingBlock:v17];
    if (*((unsigned char *)v19 + 24))
    {
      double v9 = *((double *)v35 + 3);
      uint64_t v10 = v31;
    }
    else
    {
      double v13 = v27;
      double v14 = v27[3];
      if (v14 == 0.0 && v23[3] == 0.0) {
        goto LABEL_7;
      }
      if (v14 <= 0.0)
      {
        uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int v16 = 0;
          _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inverseVerticalUncertaintySquaredSum > 0.0", v16, 2u);
        }

        goto LABEL_7;
      }
      uint64_t v10 = v31;
      v31[3] = sqrt(1.0 / v14);
      double v9 = v23[3] / v13[3];
      *((double *)v35 + 3) = v9;
    }
    *a3 = v9;
    *a4 = v10[3];
LABEL_7:
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(buf, 8);
  }
LABEL_12:
}

void __76__RTLearnedLocation_calculateAltitude_verticalUncertainty_learnedLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 location];
  [v7 altitude];
  double v9 = v8;

  uint64_t v10 = [v6 location];
  [v10 verticalUncertainty];
  double v12 = v11;

  if (v12 != -1.0)
  {
    if (v12 == 0.0)
    {
      double v13 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "this learnedLocation, %@, has zero verticalUncertainty, so it is chosen as the final estimate.", (uint8_t *)&v15, 0xCu);
      }

      *(double *)(*(void *)(a1[4] + 8) + 24) = v9;
      *(double *)(*(void *)(a1[5] + 8) + 24) = v12;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
    else
    {
      double v14 = 1.0 / (v12 * v12);
      *(double *)(*(void *)(a1[7] + 8) + 24) = v14 + *(double *)(*(void *)(a1[7] + 8) + 24);
      *(double *)(*(void *)(a1[8] + 8) + 24) = *(double *)(*(void *)(a1[8] + 8) + 24) + v9 * v14;
    }
  }
}

- (RTLearnedLocation)initWithLearnedVisits:(id)a3
{
  id v4 = +[RTLearnedLocation removeLearnedVisitsInvalid:a3];
  id v5 = +[RTLearnedLocation removeLearnedVisitsPinned:v4];

  id v6 = +[RTLearnedLocation removeLearnedVisitsWithShortestDwell:v5];

  id v7 = [[_RTMap alloc] initWithInput:v6];
  double v8 = [(_RTMap *)v7 withBlock:&__block_literal_global_39];

  double v9 = +[RTLearnedLocation removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:v8];
  uint64_t v10 = [(RTLearnedLocation *)self initWithLearnedLocations:v9 type:2];

  return v10;
}

uint64_t __43__RTLearnedLocation_initWithLearnedVisits___block_invoke(uint64_t a1, void *a2)
{
  return [a2 location];
}

- (RTLearnedLocation)initWithLearnedLocations:(id)a3 type:(unint64_t)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 count])
  {
    char v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations.count != 0", buf, 2u);
    }
    goto LABEL_37;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  double v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (!v9)
  {

LABEL_35:
    char v21 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v46 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v78 = v46;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, data point count was 0", buf, 0xCu);
    }
LABEL_37:
    v45 = 0;
    goto LABEL_38;
  }
  uint64_t v10 = v9;
  v64 = self;
  obuint64_t j = v8;
  aSelector = a2;
  unint64_t v62 = a4;
  id v63 = v7;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unsigned __int8 v13 = 0;
  uint64_t v14 = *(void *)v73;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v73 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      uint64_t v17 = [v16 location];
      uint64_t v18 = [v17 sourceAccuracy];

      unint64_t v19 = [v16 location];
      int v20 = [v19 referenceFrame];

      if (v20 == 2)
      {
        v43 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          v78 = v44;
          __int16 v79 = 2112;
          unint64_t v80 = (unint64_t)v16;
          _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, found China shifted location, %@", buf, 0x16u);
        }
        char v21 = obj;
        self = [(RTLearnedLocation *)v64 initWithChinaShiftedLearnedLocations:obj type:v62];
        v45 = self;
        id v7 = v63;
        goto LABEL_38;
      }
      v13 |= v18 == 2;
      if (v18 == 2) {
        ++v11;
      }
      v12 += [v16 dataPointCount];
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  id v7 = v63;
  self = v64;
  a2 = aSelector;
  if (!v12) {
    goto LABEL_35;
  }
  if ((v13 & (v11 > 2)) == 1)
  {
    [obj count];
    char v21 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v23 = obj;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          uint64_t v29 = [v28 location];
          uint64_t v30 = [v29 sourceAccuracy];

          if (v30 == 2) {
            v31 = v21;
          }
          else {
            v31 = v22;
          }
          [v31 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v25);
    }

    uint64_t v32 = [(RTLearnedLocation *)v64 aggregateLearnedLocations:v21 updateAltitude:0];
    unint64_t v33 = [(RTLearnedLocation *)v64 aggregateLearnedLocations:v22 updateAltitude:0];
    [v32 horizontalUncertainty];
    double v35 = v34;
    [v33 horizontalUncertainty];
    id v7 = v63;
    if (v32)
    {
      if (v35 >= v36) {
        double v37 = v35;
      }
      else {
        double v37 = v36;
      }
      [v32 latitude];
      double v39 = v38;
      [v32 longitude];
      double v41 = v40;
      unint64_t v42 = v62;
LABEL_47:
      double v66 = -1.0;
      double v67 = 0.0;
      [(RTLearnedLocation *)v64 calculateAltitude:&v67 verticalUncertainty:&v66 learnedLocations:v23];
      id v55 = objc_alloc(MEMORY[0x1E4F5CE00]);
      v56 = (void *)[v55 initWithLatitude:0 longitude:0 horizontalUncertainty:2 altitude:v39 verticalUncertainty:v41 date:v37 referenceFrame:v67 speed:v66 sourceAccuracy:0.0];
      if (v42 >= 2)
      {
        if (v42 == 2)
        {
          uint64_t v12 = [v21 count];
        }
        else
        {
          v57 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v60 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            v78 = v60;
            __int16 v79 = 2048;
            unint64_t v80 = v42;
            _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", buf, 0x16u);
          }
        }
      }
      v59 = [(RTLearnedLocation *)v64 initWithLocation:v56 dataPointCount:v12 type:v42];

      self = v59;
      v45 = v59;
    }
    else
    {
      unint64_t v42 = v62;
      if (v33)
      {
        [v33 latitude];
        double v39 = v52;
        [v33 longitude];
        double v41 = v53;
        [v33 horizontalUncertainty];
        double v37 = v54;
        goto LABEL_47;
      }
      v45 = 0;
      self = v64;
    }

    goto LABEL_38;
  }
  v48 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412290;
    v78 = v49;
    _os_log_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_INFO, "%@, high accurate location was not found", buf, 0xCu);
  }
  char v21 = [(RTLearnedLocation *)v64 aggregateLearnedLocations:obj updateAltitude:1];
  if (v62 == 2)
  {
    uint64_t v50 = 0;
    uint64_t v51 = 2;
  }
  else
  {
    uint64_t v50 = v12;
    uint64_t v51 = v62;
  }
  self = [(RTLearnedLocation *)v64 initWithLocation:v21 dataPointCount:v50 type:v51];
  v45 = self;
LABEL_38:

  return v45;
}

- (id)aggregateLearnedLocations:(id)a3 updateAltitude:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v45 = v30;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, aggregate zero locations", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if ([v6 count])
  {
    BOOL v38 = v4;
    double v37 = self;
    unint64_t v7 = 0;
    double v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      id v16 = [v6 objectAtIndex:v10, v37];
      uint64_t v17 = [v16 location];
      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        unint64_t v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v45 = v19;
        __int16 v46 = 2048;
        v47 = (void *)(v10 + 1);
        __int16 v48 = 2112;
        v49 = v17;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, location %lu, %@", buf, 0x20u);
      }
      if (!v8) {
        double v8 = v17;
      }
      uint64_t v20 = [v17 sourceAccuracy];
      double v42 = 0.0;
      double v43 = 0.0;
      double v41 = 0.0;
      [v8 latitude];
      [v8 longitude];
      [v17 latitude];
      [v17 longitude];
      if ((RTCommonConvertGeodeticToLocalFrame() & 1) == 0)
      {
        double v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          double v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "%@, failed to convert geodetic to local frame", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v20 == 2) {
        uint64_t v9 = 2;
      }
      double v11 = v11 + (double)(unint64_t)[v16 dataPointCount] * v42;
      double v12 = v12 + (double)(unint64_t)[v16 dataPointCount] * v41;
      double v13 = v13 + (double)(unint64_t)[v16 dataPointCount] * (v42 * v42);
      double v14 = v14 + (double)(unint64_t)[v16 dataPointCount] * (v41 * v41);
      double v21 = (double)(unint64_t)[v16 dataPointCount];
      [v17 horizontalUncertainty];
      double v15 = v15 + v21 * (v22 * v22);
      v7 += [v16 dataPointCount];

      ++v10;
    }
    while (v10 < [v6 count]);
    if (!v7) {
      goto LABEL_26;
    }
    double v42 = 0.0;
    double v43 = 0.0;
    [v8 latitude];
    [v8 longitude];
    if (RTCommonConvertLocalFrameToGeodetic())
    {
      RTCommonIsCoordinateValid();
      if (v23 != 0.0)
      {
        double v24 = sqrt((v14 + v13 + v15 - v11 * v11 / (double)v7 - v12 * v12 / (double)v7) / (double)v7);
        if (v24 >= 5.0) {
          double v25 = v24;
        }
        else {
          double v25 = 5.0;
        }
        double v40 = -1.0;
        double v41 = 0.0;
        if (v38) {
          [(RTLearnedLocation *)v37 calculateAltitude:&v41 verticalUncertainty:&v40 learnedLocations:v6];
        }
        id v26 = objc_alloc(MEMORY[0x1E4F5CE00]);
        long long v27 = (void *)[v26 initWithLatitude:0 longitude:0 horizontalUncertainty:v9 altitude:v43 verticalUncertainty:v42 date:v25 referenceFrame:v41 speed:v40 sourceAccuracy:0.0];
        uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v45 = v29;
          __int16 v46 = 2112;
          v47 = v27;
          _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%@, aggregated location, %@", buf, 0x16u);
        }
        goto LABEL_36;
      }
    }
    v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    uint64_t v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v45 = v32;
    unint64_t v33 = "%@, invalid coordinates converted from local frame";
  }
  else
  {
    double v8 = 0;
LABEL_26:
    v31 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    uint64_t v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v45 = v32;
    unint64_t v33 = "%@, zero data point count";
  }
  _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);

LABEL_34:
LABEL_35:
  long long v27 = 0;
LABEL_36:

  return v27;
}

- (RTLearnedLocation)initWithChinaShiftedLearnedLocations:(id)a3 type:(unint64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations.count != 0", buf, 2u);
    }
    goto LABEL_36;
  }
  if (![v6 count])
  {
    unint64_t v7 = 0;
LABEL_36:
    double v42 = 0;
    goto LABEL_39;
  }
  unint64_t v45 = a4;
  __int16 v46 = self;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v47 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  while (1)
  {
    uint64_t v17 = [v6 objectAtIndex:v9, v45];
    uint64_t v18 = [v17 location];
    unint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      double v52 = v20;
      __int16 v53 = 2048;
      unint64_t v54 = (unint64_t)v9;
      __int16 v55 = 2112;
      v56 = v18;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, location %lu, %@", buf, 0x20u);
    }
    double v21 = [v17 location];
    int v22 = [v21 referenceFrame];

    if (v22 == 2) {
      goto LABEL_11;
    }
    if (!v7) {
      unint64_t v7 = objc_opt_new();
    }
    uint64_t v23 = +[RTLearnedLocation shiftLocation:v18 shifter:v7];

    if (!v23) {
      break;
    }
    uint64_t v18 = (void *)v23;
LABEL_11:
    if ([v18 sourceAccuracy] == 2)
    {
      ++v10;
      double v24 = (double)(unint64_t)[v17 dataPointCount];
      [v18 latitude];
      double v15 = v15 + v24 * v25;
      double v26 = (double)(unint64_t)[v17 dataPointCount];
      [v18 longitude];
      double v16 = v16 + v26 * v27;
      v11 += [v17 dataPointCount];
      uint64_t v47 = 2;
    }
    double v28 = (double)(unint64_t)[v17 dataPointCount];
    [v18 latitude];
    double v12 = v12 + v28 * v29;
    double v30 = (double)(unint64_t)[v17 dataPointCount];
    [v18 longitude];
    double v13 = v13 + v30 * v31;
    double v32 = (double)(unint64_t)[v17 dataPointCount];
    [v18 horizontalUncertainty];
    double v14 = v14 + v32 * v33;
    v8 += [v17 dataPointCount];

    if ((unint64_t)++v9 >= [v6 count])
    {
      if (!v8) {
        goto LABEL_38;
      }
      if (v47 == 2) {
        double v34 = v15 / (double)v11;
      }
      else {
        double v34 = v12 / (double)v8;
      }
      if (v47 == 2) {
        double v35 = v16 / (double)v11;
      }
      else {
        double v35 = v13 / (double)v8;
      }
      if (v14 / (double)v8 >= 5.0) {
        double v36 = v14 / (double)v8;
      }
      else {
        double v36 = 5.0;
      }
      double v49 = -1.0;
      double v50 = 0.0;
      [(RTLearnedLocation *)v46 calculateAltitude:&v50 verticalUncertainty:&v49 learnedLocations:v6];
      id v37 = objc_alloc(MEMORY[0x1E4F5CE00]);
      BOOL v38 = (void *)[v37 initWithLatitude:0 longitude:2 horizontalUncertainty:v47 altitude:v34 verticalUncertainty:v35 date:v36 referenceFrame:v50 speed:v49 sourceAccuracy:0.0];
      double v39 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        double v40 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        double v52 = v40;
        __int16 v53 = 2112;
        unint64_t v54 = (unint64_t)v38;
        _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%@, aggregated location, %@", buf, 0x16u);
      }
      if (v45 >= 2)
      {
        if (v45 == 2)
        {
LABEL_32:
          self = [(RTLearnedLocation *)v46 initWithLocation:v38 dataPointCount:v10 type:v45];

          double v42 = self;
          goto LABEL_39;
        }
        double v41 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v44 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          double v52 = v44;
          __int16 v53 = 2048;
          unint64_t v54 = v45;
          _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", buf, 0x16u);
        }
      }
      unint64_t v10 = v8;
      goto LABEL_32;
    }
  }

LABEL_38:
  double v42 = 0;
  self = v46;
LABEL_39:

  return v42;
}

+ (double)confidenceFromDataPointCount:(unint64_t)a3 highConfidenceThreshold:(double)a4
{
  double v4 = 1.0;
  if ((double)a3 < a4)
  {
    double v5 = (double)a3 / a4;
    if (v5 <= 1.0) {
      return v5;
    }
  }
  return v4;
}

- (id)description
{
  id v3 = NSString;
  double v4 = [(RTLearnedLocation *)self location];
  unint64_t v5 = [(RTLearnedLocation *)self dataPointCount];
  [(RTLearnedLocation *)self confidence];
  unint64_t v7 = [v3 stringWithFormat:@"%@, dataPointCount, %lu, confidence, %.2f", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (RTLearnedLocation *)a3;
  uint64_t v6 = v5;
  if (v5 == self)
  {
    BOOL v12 = 1;
    goto LABEL_19;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v12 = 0;
    goto LABEL_19;
  }
  unint64_t v7 = v6;
  unint64_t v8 = [(RTLearnedLocation *)self location];
  if (!v8)
  {
    id v3 = [(RTLearnedLocation *)v7 location];
    if (!v3)
    {
      char v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  uint64_t v9 = [(RTLearnedLocation *)self location];
  unint64_t v10 = [(RTLearnedLocation *)v7 location];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:

  unint64_t v13 = [(RTLearnedLocation *)self dataPointCount];
  uint64_t v14 = [(RTLearnedLocation *)v7 dataPointCount];
  [(RTLearnedLocation *)self confidence];
  double v16 = v15;
  [(RTLearnedLocation *)v7 confidence];
  if (v13 == v14) {
    char v18 = v11;
  }
  else {
    char v18 = 0;
  }
  if (v16 == v17) {
    BOOL v12 = v18;
  }
  else {
    BOOL v12 = 0;
  }

LABEL_19:
  return v12;
}

- (unint64_t)hash
{
  id v3 = [(RTLearnedLocation *)self location];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [[NSNumber numberWithUnsignedInteger:-[RTLearnedLocation dataPointCount](self, "dataPointCount")];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = NSNumber;
  [(RTLearnedLocation *)self confidence];
  unint64_t v8 = [v7 numberWithDouble:];
  unint64_t v9 = v6 ^ [v8 hash];

  return v9;
}

- (RTLocation)location
{
  return self->_location;
}

- (unint64_t)dataPointCount
{
  return self->_dataPointCount;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

- (RTLearnedLocation)initWithMapItem:(id)a3 type:(unint64_t)a4
{
  uint64_t v6 = [a3 location];
  if (v6)
  {
    self = [(RTLearnedLocation *)self initWithLocation:v6 dataPointCount:0 type:a4];
    unint64_t v7 = self;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end