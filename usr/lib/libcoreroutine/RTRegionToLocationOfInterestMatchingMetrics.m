@interface RTRegionToLocationOfInterestMatchingMetrics
+ (void)submitMetricsWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7;
- (NSError)matchingError;
- (RTLearnedLocationOfInterest)locationOfInterest;
- (RTLocation)region;
- (RTRegionToLocationOfInterestMatchingMetrics)init;
- (RTRegionToLocationOfInterestMatchingMetrics)initWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7;
- (id)computeMetrics;
- (unint64_t)numberOfMatches;
- (void)submitMetrics;
@end

@implementation RTRegionToLocationOfInterestMatchingMetrics

- (RTRegionToLocationOfInterestMatchingMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_region_locationOfInterest_matchingError_numberOfMatches_);
}

- (RTRegionToLocationOfInterestMatchingMetrics)initWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v19 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_9;
  }
  if (!v14)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: region";
    goto LABEL_12;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTRegionToLocationOfInterestMatchingMetrics;
  v17 = [(RTRegionToLocationOfInterestMatchingMetrics *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_distanceCalculator, a3);
    objc_storeStrong((id *)&v18->_region, a4);
    objc_storeStrong((id *)&v18->_locationOfInterest, a5);
    objc_storeStrong((id *)&v18->_matchingError, a6);
    v18->_numberOfMatches = a7;
  }
  self = v18;
  v19 = self;
LABEL_10:

  return v19;
}

- (id)computeMetrics
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"matched"];
  v4 = [NSNumber numberWithUnsignedInteger:-[RTRegionToLocationOfInterestMatchingMetrics numberOfMatches](self, "numberOfMatches")];
  [v3 setObject:v4 forKeyedSubscript:@"numberOfMatches"];

  v5 = [(RTRegionToLocationOfInterestMatchingMetrics *)self matchingError];

  if (v5)
  {
    v6 = [(RTRegionToLocationOfInterestMatchingMetrics *)self matchingError];
    v7 = [v6 domain];
    [v3 setObject:v7 forKeyedSubscript:@"errorDomain"];

    v8 = NSNumber;
    v9 = [(RTRegionToLocationOfInterestMatchingMetrics *)self matchingError];
    v10 = [v8 numberWithInteger:[v9 code]];
    [v3 setObject:v10 forKeyedSubscript:@"errorCode"];
  }
  v11 = NSNumber;
  v12 = [(RTRegionToLocationOfInterestMatchingMetrics *)self region];
  [v12 horizontalUncertainty];
  id v13 = [v11 numberWithDouble:];
  [v3 setObject:v13 forKeyedSubscript:@"regionRadius"];

  id v14 = [(RTRegionToLocationOfInterestMatchingMetrics *)self locationOfInterest];

  if (v14)
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"matched"];
    id v15 = NSNumber;
    id v16 = [(RTRegionToLocationOfInterestMatchingMetrics *)self locationOfInterest];
    v17 = [v16 location];
    v18 = [v17 location];
    [v18 horizontalUncertainty];
    v19 = [v15 numberWithDouble:x0];
    [v3 setObject:v19 forKeyedSubscript:@"loiRadius"];

    distanceCalculator = self->_distanceCalculator;
    v21 = [(RTRegionToLocationOfInterestMatchingMetrics *)self region];
    v22 = [(RTRegionToLocationOfInterestMatchingMetrics *)self locationOfInterest];
    objc_super v23 = [v22 location];
    v24 = [v23 location];
    id v32 = 0;
    [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v21 toLocation:v24 error:&v32];
    double v26 = v25;
    id v27 = v32;

    if (v27)
    {
      v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        region = self->_region;
        locationOfInterest = self->_locationOfInterest;
        *(_DWORD *)buf = 138412802;
        v34 = locationOfInterest;
        __int16 v35 = 2112;
        v36 = region;
        __int16 v37 = 2112;
        id v38 = v27;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "METRICS: Unable to compute the distance between matching candidate, %@, and the target region, %@, because of a distance computation error, %@. Not recording the distance.", buf, 0x20u);
      }
    }
    else
    {
      v28 = [NSNumber numberWithDouble:v26];
      [v3 setObject:v28 forKeyedSubscript:@"distanceRegionToLoi"];
    }
  }

  return v3;
}

- (void)submitMetrics
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke;
  v15[3] = &unk_1E6B94DE8;
  v15[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1E016DB00](v15, a2);
  id v3 = [NSString alloc];
  v4 = (void *)[v3 initWithCString:RTAnalyticsEventRegionToLOIMatching encoding:1];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke_2;
  v12 = &unk_1E6B943B0;
  id v13 = v4;
  id v14 = v2;
  id v5 = v4;
  id v6 = v2;
  v7 = (void *)MEMORY[0x1E016DB00](&v9);
  v8 = [NSString stringWithFormat:@"com.apple.%@", v5, v9, v10, v11, v12];
  AnalyticsSendEventLazy();
}

uint64_t __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) computeMetrics];
}

id __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

+ (void)submitMetricsWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[RTRegionToLocationOfInterestMatchingMetrics alloc] initWithDistanceCalculator:v14 region:v13 locationOfInterest:v12 matchingError:v11 numberOfMatches:a7];

  [(RTRegionToLocationOfInterestMatchingMetrics *)v15 submitMetrics];
}

- (RTLocation)region
{
  return self->_region;
}

- (RTLearnedLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (NSError)matchingError
{
  return self->_matchingError;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingError, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end