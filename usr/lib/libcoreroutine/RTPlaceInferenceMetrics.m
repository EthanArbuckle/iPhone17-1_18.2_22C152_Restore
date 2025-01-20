@interface RTPlaceInferenceMetrics
- (NSDate)startDate;
- (NSMutableDictionary)metrics;
- (RTPlaceInferenceMetrics)init;
- (RTPlaceInferenceMetrics)initWithClientIdentifier:(id)a3 placeInferenceOptions:(id)a4;
- (double)entropyOfConflictFromTopResults:(id)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPlaceInferenceOptions:(id)a3;
- (void)setPlaceInferences:(id)a3;
- (void)setTopPersonalizedLabelsInferredMapItems:(id)a3 topBluePOIInferredMapItem:(id)a4;
- (void)setTopPlaceInference:(id)a3;
- (void)submitMetrics;
@end

@implementation RTPlaceInferenceMetrics

- (RTPlaceInferenceMetrics)initWithClientIdentifier:(id)a3 placeInferenceOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: clientIdentifier";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: options";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTPlaceInferenceMetrics;
  v9 = [(RTPlaceInferenceMetrics *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;

    uint64_t v12 = objc_opt_new();
    metrics = v9->_metrics;
    v9->_metrics = (NSMutableDictionary *)v12;

    [(NSMutableDictionary *)v9->_metrics setObject:v6 forKeyedSubscript:@"clientID"];
    [(NSMutableDictionary *)v9->_metrics setObject:&unk_1F3451980 forKeyedSubscript:@"count"];
    [(RTPlaceInferenceMetrics *)v9 setPlaceInferenceOptions:v8];
  }
  self = v9;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)setPlaceInferenceOptions:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  id v6 = [v4 numberWithUnsignedInteger:[v5 fidelityPolicy]];
  id v7 = [(RTPlaceInferenceMetrics *)self metrics];
  [v7 setObject:v6 forKeyedSubscript:@"fidelityPolicy"];

  v8 = NSNumber;
  v9 = [v5 locations];
  uint64_t v10 = [v8 numberWithUnsignedInteger:[v9 count]];
  v11 = [(RTPlaceInferenceMetrics *)self metrics];
  [v11 setObject:v10 forKeyedSubscript:@"inputLocationCount"];

  uint64_t v12 = NSNumber;
  id v15 = [v5 accessPoints];

  v13 = [v12 numberWithUnsignedInteger:[v15 count]];
  v14 = [(RTPlaceInferenceMetrics *)self metrics];
  [v14 setObject:v13 forKeyedSubscript:@"inputWiFiCount"];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTPlaceInferenceMetrics *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)submitMetrics
{
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [(RTPlaceInferenceMetrics *)self startDate];
  [v13 timeIntervalSinceDate:v3];
  double v5 = v4;

  id v6 = [NSNumber numberWithUnsignedInteger:10 * (unint64_t)(v5 * 100.0)];
  id v7 = [(RTPlaceInferenceMetrics *)self metrics];
  [v7 setObject:v6 forKeyedSubscript:@"latency"];

  id v8 = [NSString alloc];
  v9 = (void *)[v8 initWithCString:RTAnalyticsEventPlaceInferenceQuery encoding:1];
  uint64_t v10 = [(RTPlaceInferenceMetrics *)self metrics];
  log_analytics_submission(v9, v10);

  v11 = [NSString stringWithFormat:@"com.apple.%@", v9];
  uint64_t v12 = [(RTPlaceInferenceMetrics *)self metrics];
  AnalyticsSendEvent();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setPlaceInferences:(id)a3
{
  id v11 = a3;
  double v4 = [NSNumber numberWithInt:[v11 count] != 0];
  double v5 = [(RTPlaceInferenceMetrics *)self metrics];
  [v5 setObject:v4 forKeyedSubscript:@"hasFinalResults"];

  id v6 = [NSNumber numberWithUnsignedInteger:[v11 count]];
  id v7 = [(RTPlaceInferenceMetrics *)self metrics];
  [v7 setObject:v6 forKeyedSubscript:@"resultCount"];

  id v8 = [NSNumber numberWithUnsignedInteger:[v11 count]];
  v9 = [(RTPlaceInferenceMetrics *)self metrics];
  [v9 setObject:v8 forKeyedSubscript:@"resultFidelityPolicyNoneCount"];

  if ([v11 count])
  {
    uint64_t v10 = [v11 firstObject];
    [(RTPlaceInferenceMetrics *)self setTopPlaceInference:v10];
  }
}

- (void)setTopPlaceInference:(id)a3
{
  id v4 = a3;
  double v5 = NSNumber;
  id v26 = v4;
  if (v4) {
    uint64_t v6 = [v4 placeType];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [v5 numberWithUnsignedInteger:v6];
  id v8 = [(RTPlaceInferenceMetrics *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:@"placeType"];

  v9 = NSNumber;
  if (v26) {
    uint64_t v10 = [v26 userType];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [(RTPlaceInferenceMetrics *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"userSpecificPlaceType"];

  id v13 = NSNumber;
  if (v26) {
    [v26 confidence];
  }
  else {
    double v14 = 0.0;
  }
  id v15 = [v13 numberWithDouble:v14];
  v16 = [(RTPlaceInferenceMetrics *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"topConfidence"];

  v17 = NSNumber;
  if (v26)
  {
    [v26 confidence];
    uint64_t v19 = (int)(v18 * 100.0);
  }
  else
  {
    uint64_t v19 = 0;
  }
  v20 = [v17 numberWithInt:v19];
  v21 = [(RTPlaceInferenceMetrics *)self metrics];
  [v21 setObject:v20 forKeyedSubscript:@"confidenceScore"];

  v22 = NSNumber;
  if (v26) {
    uint64_t v23 = [v26 userTypeSource];
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = [v22 numberWithUnsignedInteger:v23];
  v25 = [(RTPlaceInferenceMetrics *)self metrics];
  [v25 setObject:v24 forKeyedSubscript:@"userTypeSource"];
}

- (void)setTopPersonalizedLabelsInferredMapItems:(id)a3 topBluePOIInferredMapItem:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] < 2)
  {
    uint64_t v19 = 0;
  }
  else
  {
    v43 = self;
    id v45 = v6;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      char v12 = 0;
      uint64_t v13 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (v11)
          {
            v16 = [v11 mapItem];
            v17 = [v15 mapItem];
            int v18 = [v16 isEqual:v17];

            if (!v18) {
              char v12 = 1;
            }
          }
          else
          {
            id v11 = v15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
      char v12 = 0;
    }

    uint64_t v19 = v12 & 1;
    self = v43;
    id v6 = v45;
  }
  uint64_t v20 = [v6 count:v43, v45];
  uint64_t v21 = 0;
  if (v7 && v20)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v22 = v6;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      v44 = self;
      id v46 = v6;
      uint64_t v25 = *(void *)v48;
      char v26 = 1;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v29 = [v7 mapItem:v44, v46, v47];
          v30 = [v28 mapItem];
          int v31 = [v29 isEqual:v30];

          if (v31) {
            char v26 = 0;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v24);
      uint64_t v21 = v26 & 1;
      self = v44;
      id v6 = v46;
    }
    else
    {
      uint64_t v21 = 1;
    }
  }
  v32 = NSNumber;
  [(RTPlaceInferenceMetrics *)self entropyOfConflictFromTopResults:v6];
  v33 = [v32 numberWithDouble:x0];
  v34 = [(RTPlaceInferenceMetrics *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"entropyOfConflict"];

  v35 = [NSNumber numberWithInt:[v6 count] != 0];
  v36 = [(RTPlaceInferenceMetrics *)self metrics];
  [v36 setObject:v35 forKeyedSubscript:@"hasLocalHints"];

  v37 = [NSNumber numberWithInt:v7 != 0];
  v38 = [(RTPlaceInferenceMetrics *)self metrics];
  [v38 setObject:v37 forKeyedSubscript:@"hasBluePOIResults"];

  v39 = [NSNumber numberWithBool:v21];
  v40 = [(RTPlaceInferenceMetrics *)self metrics];
  [v40 setObject:v39 forKeyedSubscript:@"hasFusionConflictBluePOI"];

  v41 = [NSNumber numberWithBool:v19];
  v42 = [(RTPlaceInferenceMetrics *)self metrics];
  [v42 setObject:v41 forKeyedSubscript:@"hasFusionConflictLocalHints"];
}

- (double)entropyOfConflictFromTopResults:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke;
    v17[3] = &unk_1E6B99448;
    id v5 = v4;
    id v18 = v5;
    uint64_t v19 = v20;
    [v3 enumerateObjectsUsingBlock:v17];
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_3;
    v9[3] = &unk_1E6B99470;
    id v6 = v5;
    id v10 = v6;
    id v11 = v20;
    char v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v9];
    double v7 = v14[3];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v20, 8);
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (RTPlaceInferenceMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithClientIdentifier_placeInferenceOptions_);
}

void __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_2;
  v9[3] = &unk_1E6B99420;
  id v10 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v9];
  double v7 = *(void **)(a1 + 32);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v5 mapItem];
  }
  else {
  id v8 = [v4 objectAtIndexedSubscript:v6];
  }
  [v7 addObject:v8];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 mapItem];
  uint64_t v8 = [v7 isEqualToMapItem:v6];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

long double __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  long double v3 = (double)(unint64_t)[*(id *)(a1 + 32) countForObject:a2]
     / (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long double v4 = log2(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  long double result = *(double *)(v5 + 24) - v3 * v4;
  *(long double *)(v5 + 24) = result;
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTPlaceInferenceMetrics *)self metrics];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)description
{
  long double v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(RTPlaceInferenceMetrics *)self metrics];
  uint64_t v5 = [v3 stringWithFormat:@"RTPlaceInferenceMetrics, %lu, ", [v4 count]];

  id v6 = [(RTPlaceInferenceMetrics *)self metrics];
  double v7 = [v6 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__RTPlaceInferenceMetrics_description__block_invoke;
  v12[3] = &unk_1E6B90A68;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __38__RTPlaceInferenceMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  long double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 metrics];
  id v8 = [v5 valueForKey:v4];

  id v6 = *(void **)(a1 + 40);
  double v7 = [NSString stringWithFormat:@"%@, %@, ", v4, v8];

  [v6 appendString:v7];
}

@end