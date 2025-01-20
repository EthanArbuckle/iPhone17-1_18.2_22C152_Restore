@interface RTRelabelerMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)doubleKeys;
+ (id)integerKeys;
+ (id)supportedMetricKeys;
+ (id)unsignedIntegerKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (RTRelabeler)relabeler;
- (RTRelabelerMetrics)initWithLoggingEnabled:(BOOL)a3;
- (RTRelabelerMetrics)initWithRelabeler:(id)a3;
- (double)calculateEntropyOfProbVector:(id)a3;
- (double)logMax2ConfidenceRatioOfRelabeledProbVector:(id)a3;
- (id)getUUIDForPotentialRelabelingItemUsingInputCandidate:(id)a3 relabeledProbVector:(id)a4;
- (id)maxUUIDOfProbVector:(id)a3;
- (void)setDerivedMetrics;
- (void)setErrorMetrics:(id)a3;
- (void)setFilteredInputMetricsUsingContextCandidates:(id)a3;
- (void)setNonRevGeoCandidates:(id)a3 revGeoCandidates:(id)a4;
- (void)setNumberOfUniqueMapItems:(id)a3;
- (void)setOutputMetricsUsingInputCandidate:(id)a3 priorVector:(id)a4 observationVector:(id)a5 posteriorVector:(id)a6 relabeledProbVector:(id)a7 relabeledInferredMapItem:(id)a8;
- (void)setPreprocessedMetricsUsingInputCandidate:(id)a3 contextCandidates:(id)a4;
- (void)setRelabeler:(id)a3;
@end

@implementation RTRelabelerMetrics

- (RTRelabelerMetrics)initWithLoggingEnabled:(BOOL)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)RTRelabelerMetrics;
  v3 = [(RTMetric *)&v61 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v58;
      uint64_t v8 = MEMORY[0x1E4F1CC28];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v58 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v57 + 1) + 8 * v9);
          v11 = [(RTMetric *)v3 metrics];
          [v11 setObject:v8 forKeyedSubscript:v10];

          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v6);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v12 = [(id)objc_opt_class() unsignedIntegerKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * v16);
          v18 = [(RTMetric *)v3 metrics];
          [v18 setObject:&unk_1F3451DD0 forKeyedSubscript:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v14);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v19 = [(id)objc_opt_class() integerKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v50;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * v23);
          v25 = [(RTMetric *)v3 metrics];
          [v25 setObject:&unk_1F3451DE8 forKeyedSubscript:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
      }
      while (v21);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v26 = [(id)objc_opt_class() doubleKeys];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * v30);
          v32 = [(RTMetric *)v3 metrics];
          [v32 setObject:&unk_1F3453AA8 forKeyedSubscript:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v63 count:16];
      }
      while (v28);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v33 = [objc_opt_class() bucketedKeys];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v62 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v42;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v41 + 1) + 8 * v37);
          v39 = [(RTMetric *)v3 metrics];
          [v39 setObject:&unk_1F3451DD0 forKeyedSubscript:v38];

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v62 count:16];
      }
      while (v35);
    }
  }
  return v3;
}

- (RTRelabelerMetrics)initWithRelabeler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_relabeler, a3);
    self = [(RTRelabelerMetrics *)self initWithLoggingEnabled:0];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeler", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)BOOLeanKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"relabelingCandidateIsPlaceholder", @"hasSomethingToRelabelTo", @"madePlaceholderBecauseOfConfidenceRatioThreshold", 0];
}

+ (id)unsignedIntegerKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"errorDomain", @"numberOfPreFilteredContextCandidates", @"relabelingCandidateMapItemType", @"numberOfFilteredContextCandidates", @"numberOfNonPlaceholderCandidates", @"numberOfPlaceholderCandidates", @"numberOfUniqueNonPlaceholderMapItems", @"relabelerAction", 0];
}

+ (id)integerKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"errorCode", 0];
}

+ (id)doubleKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"confidenceOfRelabelingCandidate", @"relabeledConfidence", @"logObservationNonPlaceholderRatio", @"logPriorNonPlaceholderRatio", @"logPosteriorNonPlaceholderRatio", @"logObservationPlaceholderRatio", @"logPriorPlaceholderRatio", @"logPosteriorPlaceholderRatio", @"logMax2ConfidenceRatio", @"predictionEntropy", 0];
}

+ (id)bucketedKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"bucketedConfidenceOfRelabelingCandidate", @"bucketedNumberOfNonPlaceholderCandidates", @"bucketedNumberOfPlaceholderCandidates", @"bucketedNumberOfUniqueNonPlaceholderMapItems", @"bucketedRelabeledConfidence", @"bucketedLogPriorNonPlaceholderRatio", @"bucketedLogPriorPlaceholderRatio", 0];
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventRelabelerQuery;
}

+ (id)supportedMetricKeys
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = [(id)objc_opt_class() BOOLeanKeys];
  v4 = [v2 setWithSet:v3];

  id v5 = [(id)objc_opt_class() unsignedIntegerKeys];
  uint64_t v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [(id)objc_opt_class() integerKeys];
  uint64_t v8 = [v7 allObjects];
  [v4 addObjectsFromArray:v8];

  uint64_t v9 = [(id)objc_opt_class() doubleKeys];
  uint64_t v10 = [v9 allObjects];
  [v4 addObjectsFromArray:v10];

  v11 = [(id)objc_opt_class() bucketedKeys];
  v12 = [v11 allObjects];
  [v4 addObjectsFromArray:v12];

  return v4;
}

- (void)setPreprocessedMetricsUsingInputCandidate:(id)a3 contextCandidates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputCandidate", v22, 2u);
    }
    goto LABEL_11;
  }
  uint64_t v8 = [NSNumber numberWithBool:-[RTRelabeler placeholderCandidate:](self->_relabeler, "placeholderCandidate:", v6)];
  uint64_t v9 = [(RTMetric *)self metrics];
  [v9 setObject:v8 forKeyedSubscript:@"relabelingCandidateIsPlaceholder"];

  uint64_t v10 = NSNumber;
  v11 = [v6 firstObject];
  [v11 placeConfidence];
  v12 = [v10 numberWithDouble:];
  uint64_t v13 = [(RTMetric *)self metrics];
  [v13 setObject:v12 forKeyedSubscript:@"confidenceOfRelabelingCandidate"];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:[v7 count]];
  uint64_t v15 = [(RTMetric *)self metrics];
  [v15 setObject:v14 forKeyedSubscript:@"numberOfPreFilteredContextCandidates"];

  uint64_t v16 = [v6 secondObject];
  uint64_t v17 = [v16 extendedAttributes];
  uint64_t v18 = [v17 wifiFingerprintLabelType];

  switch(v18)
  {
    case 2:
      v19 = [(RTMetric *)self metrics];
      uint64_t v20 = v19;
      uint64_t v21 = &unk_1F3451E30;
      goto LABEL_10;
    case 1:
      v19 = [(RTMetric *)self metrics];
      uint64_t v20 = v19;
      uint64_t v21 = &unk_1F3451E18;
      goto LABEL_10;
    case 0:
      v19 = [(RTMetric *)self metrics];
      uint64_t v20 = v19;
      uint64_t v21 = &unk_1F3451E00;
LABEL_10:
      [v19 setObject:v21 forKeyedSubscript:@"relabelingCandidateMapItemType"];
LABEL_11:

      break;
  }
}

- (void)setFilteredInputMetricsUsingContextCandidates:(id)a3
{
  [NSNumber numberWithUnsignedInteger:[a3 count]];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(RTMetric *)self metrics];
  [v4 setObject:v5 forKeyedSubscript:@"numberOfFilteredContextCandidates"];
}

- (void)setNonRevGeoCandidates:(id)a3 revGeoCandidates:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithUnsignedInteger:[a3 count]];
  uint64_t v9 = [(RTMetric *)self metrics];
  [v9 setObject:v8 forKeyedSubscript:@"numberOfNonPlaceholderCandidates"];

  uint64_t v10 = NSNumber;
  uint64_t v11 = [v7 count];

  id v13 = [v10 numberWithUnsignedInteger:v11];
  v12 = [(RTMetric *)self metrics];
  [v12 setObject:v13 forKeyedSubscript:@"numberOfPlaceholderCandidates"];
}

- (void)setNumberOfUniqueMapItems:(id)a3
{
  if (a3)
  {
    v4 = NSNumber;
    uint64_t v8 = 0;
    id v5 = [a3 allUniqueMapItemsWithError:&v8];
    id v6 = [[v4 numberWithUnsignedInteger:-[NSObject count](v5, "count")];
    id v7 = [(RTMetric *)self metrics];
    [v7 setObject:v6 forKeyedSubscript:@"numberOfUniqueNonPlaceholderMapItems"];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }
  }
}

- (double)calculateEntropyOfProbVector:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v9 = -1.0;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Invalid parameter not satisfying: probVector";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_17;
  }
  if (![v3 count])
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    double v9 = -1.0;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Invalid parameter not satisfying: probVector.count > 0";
    goto LABEL_15;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v11 doubleValue];
        double v13 = v12;
        [v11 doubleValue];
        double v9 = v9 - v13 * log(v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }
LABEL_17:

  return v9;
}

- (id)getUUIDForPotentialRelabelingItemUsingInputCandidate:(id)a3 relabeledProbVector:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v28 = v6;
  if (!v6)
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = "Invalid parameter not satisfying: inputCandidate";
LABEL_23:
    _os_log_error_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_24;
  }
  if (!v7)
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = "Invalid parameter not satisfying: relabeledProbVector";
    goto LABEL_23;
  }
  if (![v7 count])
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = "Invalid parameter not satisfying: relabeledProbVector.count > 0";
    goto LABEL_23;
  }
  BOOL v9 = [(RTRelabeler *)self->_relabeler placeholderCandidate:v6];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v10)
  {
LABEL_24:
    uint64_t v22 = 0;
    goto LABEL_25;
  }
  uint64_t v11 = v10;
  v26 = v8;
  uint64_t v12 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(obj);
      }
      long double v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (v9) {
        goto LABEL_30;
      }
      uint64_t v15 = [*(id *)(*((void *)&v29 + 1) + 8 * i) mapItem];
      uint64_t v16 = [v15 identifier];
      long long v17 = [v28 secondObject];
      long long v18 = [v17 identifier];
      char v19 = [v16 isEqual:v18];

      if ((v19 & 1) == 0)
      {
LABEL_30:
        long long v20 = [v14 mapItem];
        uint64_t v21 = [v20 identifier];

        if (v21)
        {
          uint64_t v24 = [v14 mapItem];
          uint64_t v22 = [v24 identifier];

          goto LABEL_20;
        }
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  uint64_t v22 = 0;
LABEL_20:
  uint64_t v8 = v26;
LABEL_25:

  return v22;
}

- (double)logMax2ConfidenceRatioOfRelabeledProbVector:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      double v10 = -1.0;
      goto LABEL_8;
    }
    __int16 v16 = 0;
    uint64_t v12 = "Invalid parameter not satisfying: relabeledProbVector";
    double v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v15 = 0;
    uint64_t v12 = "Invalid parameter not satisfying: relabeledProbVector.count > 1";
    double v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 confidence];
  double v7 = log(v6);
  uint64_t v8 = [v4 objectAtIndexedSubscript:1];
  [v8 confidence];
  double v10 = v7 - log(v9);

LABEL_8:
  return v10;
}

- (id)maxUUIDOfProbVector:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    char v19 = "Invalid parameter not satisfying: probabilityVector";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_16;
  }
  if (![v3 count])
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    char v19 = "Invalid parameter not satisfying: probabilityVector.count > 0";
    goto LABEL_21;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (!v6)
  {
LABEL_16:
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v22;
  double v10 = -1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      double v13 = -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v12, (void)v21);
      [v13 doubleValue];
      double v15 = v14;

      if (v15 > v10)
      {
        id v16 = v12;

        long long v17 = [v5 objectForKeyedSubscript:v16];
        [v17 doubleValue];
        double v10 = v18;

        uint64_t v8 = v16;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  }
  while (v7);
LABEL_17:

  return v8;
}

- (void)setOutputMetricsUsingInputCandidate:(id)a3 priorVector:(id)a4 observationVector:(id)a5 posteriorVector:(id)a6 relabeledProbVector:(id)a7 relabeledInferredMapItem:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: inputCandidate";
LABEL_40:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_52;
  }
  if (!v15)
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: priorVector";
    goto LABEL_40;
  }
  if (!v16)
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: observationVector";
    goto LABEL_40;
  }
  if (!v17)
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: posteriorVector";
    goto LABEL_40;
  }
  if (!v18)
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: relabeledProbVector";
    goto LABEL_40;
  }
  if (![v18 count])
  {
    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: relabeledProbVector.count > 0";
    goto LABEL_40;
  }
  if (v19)
  {
    v128 = self;
    long long v20 = (void *)MEMORY[0x1E4F1CAD0];
    long long v21 = [v15 allKeys];
    long long v22 = [v20 setWithArray:v21];

    long long v23 = (void *)MEMORY[0x1E4F1CAD0];
    long long v24 = [v16 allKeys];
    uint64_t v25 = [v23 setWithArray:v24];

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = [v17 allKeys];
    uint64_t v28 = [v26 setWithArray:v27];

    v129 = (void *)v25;
    v130 = (void *)v28;
    if ([v22 isEqualToSet:v25])
    {
      if ([v22 isEqualToSet:v28])
      {
        long long v29 = v128;
        BOOL v126 = [(RTRelabeler *)v128->_relabeler placeholderCandidate:v14];
        if (v126) {
          goto LABEL_12;
        }
        long long v30 = [v14 secondObject];
        long long v31 = [v30 identifier];
        char v123 = [v22 containsObject:v31];

        long long v29 = v128;
        if (v123)
        {
LABEL_12:
          long long v32 = [(RTRelabeler *)v29->_relabeler placeholderUUID];
          char v33 = [v22 containsObject:v32];

          if (v33)
          {
            uint64_t v34 = [v19 mapItem];

            if (v34) {
              char v35 = 1;
            }
            else {
              char v35 = v126;
            }
            if (v35)
            {
              if (v34) {
                char v36 = v126;
              }
              else {
                char v36 = 1;
              }
              if (v36)
              {
                if (v34) {
                  BOOL v37 = 0;
                }
                else {
                  BOOL v37 = v126;
                }
                uint64_t v38 = [(RTMetric *)v128 metrics];
                v39 = v38;
                if (v37) {
                  v40 = &unk_1F3451E60;
                }
                else {
                  v40 = &unk_1F3451E78;
                }
                [v38 setObject:v40 forKeyedSubscript:@"relabelerAction"];
                long long v44 = v128;
                goto LABEL_60;
              }
              long long v47 = [v14 secondObject];
              long long v48 = [v19 mapItem];
              char v124 = [v47 isEqualToMapItem:v48];

              long long v44 = v128;
              long long v45 = [(RTMetric *)v128 metrics];
              v39 = v45;
              if (v124) {
                long long v46 = &unk_1F3451E48;
              }
              else {
                long long v46 = &unk_1F3451E30;
              }
            }
            else
            {
              long long v44 = v128;
              long long v45 = [(RTMetric *)v128 metrics];
              v39 = v45;
              long long v46 = &unk_1F3451E18;
            }
            [v45 setObject:v46 forKeyedSubscript:@"relabelerAction"];
LABEL_60:

            long long v49 = NSNumber;
            [v19 confidence];
            long long v50 = [v49 numberWithDouble:];
            [(RTMetric *)v44 metrics];
            long long v52 = p_isa = (id *)&v44->super.super.isa;
            [v52 setObject:v50 forKeyedSubscript:@"relabeledConfidence"];

            if (v126)
            {
              v127 = [p_isa[3] placeholderUUID];
            }
            else
            {
              long long v53 = [v14 secondObject];
              v127 = [v53 identifier];
            }
            long long v54 = p_isa;
            v125 = [p_isa getUUIDForPotentialRelabelingItemUsingInputCandidate:v14 relabeledProbVector:v18];
            if (v125)
            {
              long long v55 = [p_isa metrics];
              [v55 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasSomethingToRelabelTo"];

              long long v56 = NSNumber;
              v117 = [v16 objectForKeyedSubscript:v127];
              [v117 doubleValue];
              double v58 = log(v57);
              long long v59 = [v16 objectForKeyedSubscript:v125];
              [v59 doubleValue];
              objc_super v61 = [v56 numberWithDouble:(double)(v58 - log(v60))];
              v62 = [v54 metrics];
              [v62 setObject:v61 forKeyedSubscript:@"logObservationNonPlaceholderRatio"];

              v63 = NSNumber;
              v118 = [v15 objectForKeyedSubscript:v127];
              [v118 doubleValue];
              double v65 = log(v64);
              v112 = [v15 objectForKeyedSubscript:v125];
              [v112 doubleValue];
              uint64_t v67 = [v63 numberWithDouble:(double)(v65 - log(v66))];
              v68 = [(RTMetric *)v128 metrics];
              [v68 setObject:v67 forKeyedSubscript:@"logPriorNonPlaceholderRatio"];

              v69 = NSNumber;
              v119 = [v17 objectForKeyedSubscript:v127];
              [v119 doubleValue];
              double v71 = log(v70);
              v113 = [v17 objectForKeyedSubscript:v125];
              [v113 doubleValue];
              v73 = [v69 numberWithDouble:(double)(v71 - log(v72))];
              v74 = [(RTMetric *)v128 metrics];
              [v74 setObject:v73 forKeyedSubscript:@"logPosteriorNonPlaceholderRatio"];

              long long v54 = (id *)&v128->super.super.isa;
            }
            v75 = NSNumber;
            v120 = [v16 objectForKeyedSubscript:v127];
            [v120 doubleValue];
            double v77 = log(v76);
            v114 = [v54[3] placeholderUUID];
            v109 = [v16 objectForKeyedSubscript:v114];
            [v109 doubleValue];
            v79 = [v75 numberWithDouble:(double)(v77 - log(v78))];
            [v54 metrics];
            v81 = v80 = v54;
            [v81 setObject:v79 forKeyedSubscript:@"logObservationPlaceholderRatio"];

            v82 = NSNumber;
            v121 = [v15 objectForKeyedSubscript:v127];
            [v121 doubleValue];
            double v84 = log(v83);
            v115 = [v80[3] placeholderUUID];
            v110 = [v15 objectForKeyedSubscript:v115];
            [v110 doubleValue];
            v86 = [v82 numberWithDouble:(double)(v84 - log(v85))];
            v87 = [v80 metrics];
            [v87 setObject:v86 forKeyedSubscript:@"logPriorPlaceholderRatio"];

            v88 = NSNumber;
            v122 = [v17 objectForKeyedSubscript:v127];
            [v122 doubleValue];
            double v90 = log(v89);
            v116 = [v80[3] placeholderUUID];
            v111 = [v17 objectForKeyedSubscript:v116];
            [v111 doubleValue];
            v92 = [v88 numberWithDouble:(double)(v90 - log(v91))];
            v93 = [v80 metrics];
            [v93 setObject:v92 forKeyedSubscript:@"logPosteriorPlaceholderRatio"];

            if ((unint64_t)[v18 count] >= 2)
            {
              [(RTRelabelerMetrics *)v128 logMax2ConfidenceRatioOfRelabeledProbVector:v18];
              double v95 = v94;
              v96 = [NSNumber numberWithDouble:];
              v97 = [(RTMetric *)v128 metrics];
              [v97 setObject:v96 forKeyedSubscript:@"logMax2ConfidenceRatio"];

              v98 = [(RTRelabeler *)v128->_relabeler parameters];
              [v98 minimumConfidenceRatio];
              double v100 = log(v99);

              v101 = v128;
              if (v95 <= v100)
              {
                v102 = [(RTRelabelerMetrics *)v128 maxUUIDOfProbVector:v17];
                v103 = [(RTRelabeler *)v128->_relabeler placeholderUUID];
                char v104 = [v102 isEqual:v103];

                v101 = v128;
                if ((v104 & 1) == 0)
                {
                  v105 = [(RTMetric *)v128 metrics];
                  [v105 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"madePlaceholderBecauseOfConfidenceRatioThreshold"];
                }
              }
              v106 = NSNumber;
              [(RTRelabelerMetrics *)v101 calculateEntropyOfProbVector:v17];
              v107 = [v106 numberWithDouble:x0];
              v108 = [(RTMetric *)v101 metrics];
              [v108 setObject:v107 forKeyedSubscript:@"predictionEntropy"];
            }
            goto LABEL_51;
          }
          long long v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            long long v43 = "Invalid parameter not satisfying: [priorUUIDs containsObject:_relabeler.placeholderUUID]";
            goto LABEL_49;
          }
        }
        else
        {
          long long v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            long long v43 = "Invalid parameter not satisfying: [priorUUIDs containsObject:inputCandidate.secondObject.identifier]";
            goto LABEL_49;
          }
        }
LABEL_50:

LABEL_51:
        goto LABEL_52;
      }
      long long v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      long long v43 = "Invalid parameter not satisfying: [priorUUIDs isEqualToSet:posteriorUUIDs]";
    }
    else
    {
      long long v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      long long v43 = "Invalid parameter not satisfying: [priorUUIDs isEqualToSet:observationUUIDs]";
    }
LABEL_49:
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
    goto LABEL_50;
  }
  long long v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    long long v41 = "Invalid parameter not satisfying: relabeledInferredMapItem";
    goto LABEL_40;
  }
LABEL_52:
}

- (void)setErrorMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    id v5 = [(RTMetric *)self metrics];
    [v5 setObject:&unk_1F3451E00 forKeyedSubscript:@"relabelerAction"];

    uint64_t v6 = [v15 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F5CFE8]];

    if (v7)
    {
      uint64_t v8 = [(RTMetric *)self metrics];
      uint64_t v9 = v8;
      double v10 = &unk_1F3451E18;
    }
    else
    {
      uint64_t v11 = [v15 domain];
      int v12 = [v11 isEqualToString:@"RTRelabelerErrorDomain"];

      uint64_t v8 = [(RTMetric *)self metrics];
      uint64_t v9 = v8;
      if (v12) {
        double v10 = &unk_1F3451E30;
      }
      else {
        double v10 = &unk_1F3451E00;
      }
    }
    [v8 setObject:v10 forKeyedSubscript:@"errorDomain"];

    double v13 = [NSNumber numberWithInteger:[v15 code]];
    id v14 = [(RTMetric *)self metrics];
    [v14 setObject:v13 forKeyedSubscript:@"errorCode"];

    id v4 = v15;
  }
}

- (void)setDerivedMetrics
{
  id v31 = +[RTMetric binsFromStart:&unk_1F3453AB8 toEnd:&unk_1F3453AC8 gap:&unk_1F3453AD8];
  id v3 = [(RTMetric *)self metrics];
  id v4 = [v3 objectForKeyedSubscript:@"confidenceOfRelabelingCandidate"];
  id v5 = +[RTMetric binForNumber:v4 bins:v31];
  uint64_t v6 = [(RTMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"bucketedConfidenceOfRelabelingCandidate"];

  int v7 = [(RTMetric *)self metrics];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"numberOfNonPlaceholderCandidates"];
  uint64_t v9 = +[RTMetric binForNumber:v8 bins:&unk_1F34532D0];
  double v10 = [(RTMetric *)self metrics];
  [v10 setObject:v9 forKeyedSubscript:@"bucketedNumberOfNonPlaceholderCandidates"];

  uint64_t v11 = [(RTMetric *)self metrics];
  int v12 = [v11 objectForKeyedSubscript:@"numberOfPlaceholderCandidates"];
  double v13 = +[RTMetric binForNumber:v12 bins:&unk_1F34532D0];
  id v14 = [(RTMetric *)self metrics];
  [v14 setObject:v13 forKeyedSubscript:@"bucketedNumberOfPlaceholderCandidates"];

  id v15 = [(RTMetric *)self metrics];
  id v16 = [v15 objectForKeyedSubscript:@"numberOfUniqueNonPlaceholderMapItems"];
  id v17 = +[RTMetric binForNumber:v16 bins:&unk_1F34532D0];
  id v18 = [(RTMetric *)self metrics];
  [v18 setObject:v17 forKeyedSubscript:@"bucketedNumberOfUniqueNonPlaceholderMapItems"];

  id v19 = [(RTMetric *)self metrics];
  long long v20 = [v19 objectForKeyedSubscript:@"relabeledConfidence"];
  long long v21 = +[RTMetric binForNumber:v20 bins:v31];
  long long v22 = [(RTMetric *)self metrics];
  [v22 setObject:v21 forKeyedSubscript:@"bucketedRelabeledConfidence"];

  long long v23 = [(RTMetric *)self metrics];
  long long v24 = [v23 objectForKeyedSubscript:@"logPriorNonPlaceholderRatio"];
  uint64_t v25 = +[RTMetric binForNumber:v24 bins:&unk_1F34532E8];
  v26 = [(RTMetric *)self metrics];
  [v26 setObject:v25 forKeyedSubscript:@"bucketedLogPriorNonPlaceholderRatio"];

  uint64_t v27 = [(RTMetric *)self metrics];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"logPriorPlaceholderRatio"];
  long long v29 = +[RTMetric binForNumber:v28 bins:&unk_1F34532E8];
  long long v30 = [(RTMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"bucketedLogPriorPlaceholderRatio"];
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(RTRelabelerMetrics *)self setDerivedMetrics];
  v6.receiver = self;
  v6.super_class = (Class)RTRelabelerMetrics;
  return [(RTMetric *)&v6 submitMetricsWithError:a3];
}

- (RTRelabeler)relabeler
{
  return self->_relabeler;
}

- (void)setRelabeler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end