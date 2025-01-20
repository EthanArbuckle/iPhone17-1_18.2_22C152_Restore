@interface RTSignificantRegionHintInjectionMetrics
+ (void)submitMetricsWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7;
- (BOOL)hintSubmitted;
- (NSError)matchingError;
- (RTLearnedLocationOfInterest)locationOfInterest;
- (RTLocation)region;
- (RTSignificantRegionHintInjectionMetrics)init;
- (RTSignificantRegionHintInjectionMetrics)initWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7;
- (id)computeMetrics;
- (int64_t)hintSource;
- (void)setHintSource:(int64_t)a3;
- (void)setHintSubmitted:(BOOL)a3;
- (void)setMatchingError:(id)a3;
- (void)submitMetrics;
@end

@implementation RTSignificantRegionHintInjectionMetrics

- (RTSignificantRegionHintInjectionMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHintSource_region_locationOfInterest_hintSubmitted_matchingError_);
}

- (RTSignificantRegionHintInjectionMetrics)initWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTSignificantRegionHintInjectionMetrics;
  v16 = [(RTSignificantRegionHintInjectionMetrics *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_region, a4);
    objc_storeStrong((id *)&v17->_locationOfInterest, a5);
    v17->_hintSource = a3;
    v17->_hintSubmitted = a6;
    objc_storeStrong((id *)&v17->_matchingError, a7);
  }

  return v17;
}

- (id)computeMetrics
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithLongLong:-[RTSignificantRegionHintInjectionMetrics hintSource](self, "hintSource")];
  [v3 setObject:v4 forKeyedSubscript:@"hintSource"];

  v5 = NSNumber;
  v6 = [(RTSignificantRegionHintInjectionMetrics *)self region];
  [v6 horizontalUncertainty];
  v7 = [v5 numberWithDouble:];
  [v3 setObject:v7 forKeyedSubscript:@"regionRadius"];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"matched"];
  v8 = [(RTSignificantRegionHintInjectionMetrics *)self locationOfInterest];

  if (v8)
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"matched"];
    v9 = NSNumber;
    v10 = [(RTSignificantRegionHintInjectionMetrics *)self locationOfInterest];
    v11 = [v10 location];
    v12 = [v11 location];
    [v12 horizontalUncertainty];
    id v13 = [v9 numberWithDouble:];
    [v3 setObject:v13 forKeyedSubscript:@"loiRadius"];
  }
  id v14 = [NSNumber numberWithBool:-[RTSignificantRegionHintInjectionMetrics hintSubmitted](self, "hintSubmitted")];
  [v3 setObject:v14 forKeyedSubscript:@"hintSubmitted"];

  id v15 = [(RTSignificantRegionHintInjectionMetrics *)self matchingError];

  if (v15)
  {
    v16 = [(RTSignificantRegionHintInjectionMetrics *)self matchingError];
    v17 = [v16 domain];
    [v3 setObject:v17 forKeyedSubscript:@"errorDomain"];

    v18 = NSNumber;
    objc_super v19 = [(RTSignificantRegionHintInjectionMetrics *)self matchingError];
    v20 = [v18 numberWithInteger:[v19 code]];
    [v3 setObject:v20 forKeyedSubscript:@"errorCode"];
  }

  return v3;
}

- (void)submitMetrics
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke;
  v15[3] = &unk_1E6B94DE8;
  v15[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1E016DB00](v15, a2);
  id v3 = [NSString alloc];
  v4 = (void *)[v3 initWithCString:RTAnalyticsEventSignificanRegionHintInjection encoding:1];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke_2;
  v12 = &unk_1E6B943B0;
  id v13 = v4;
  id v14 = v2;
  id v5 = v4;
  id v6 = v2;
  v7 = (void *)MEMORY[0x1E016DB00](&v9);
  v8 = [NSString stringWithFormat:@"com.apple.%@", v5, v9, v10, v11, v12];
  AnalyticsSendEventLazy();
}

uint64_t __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) computeMetrics];
}

id __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  log_analytics_submission(*(void **)(a1 + 32), v2);

  return v2;
}

+ (void)submitMetricsWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = [[RTSignificantRegionHintInjectionMetrics alloc] initWithHintSource:a3 region:v13 locationOfInterest:v12 hintSubmitted:v7 matchingError:v11];

  [(RTSignificantRegionHintInjectionMetrics *)v14 submitMetrics];
}

- (RTLocation)region
{
  return self->_region;
}

- (RTLearnedLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (int64_t)hintSource
{
  return self->_hintSource;
}

- (void)setHintSource:(int64_t)a3
{
  self->_hintSource = a3;
}

- (NSError)matchingError
{
  return self->_matchingError;
}

- (void)setMatchingError:(id)a3
{
}

- (BOOL)hintSubmitted
{
  return self->_hintSubmitted;
}

- (void)setHintSubmitted:(BOOL)a3
{
  self->_hintSubmitted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingError, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end