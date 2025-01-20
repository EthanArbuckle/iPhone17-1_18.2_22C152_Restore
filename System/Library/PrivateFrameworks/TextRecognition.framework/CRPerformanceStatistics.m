@interface CRPerformanceStatistics
+ (BOOL)_canEnableRecentPeakReset;
- (BOOL)measureRecentPeak;
- (CRPerformanceStatistics)initWithDictionary:(id)a3;
- (CRPerformanceStatistics)initWithName:(id)a3;
- (CRPerformanceStatistics)initWithName:(id)a3 measureRecentPeak:(BOOL)a4;
- (CRPerformanceStatistics)initWithStatistics:(id)a3;
- (NSDictionary)metrics;
- (NSString)name;
- (id)description;
- (id)dictionary;
- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7;
- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4;
- (void)addStatistics:(id)a3;
- (void)measureBlock:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CRPerformanceStatistics

- (CRPerformanceStatistics)initWithName:(id)a3
{
  return [(CRPerformanceStatistics *)self initWithName:a3 measureRecentPeak:0];
}

- (CRPerformanceStatistics)initWithName:(id)a3 measureRecentPeak:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRPerformanceStatistics;
  v8 = [(CRPerformanceStatistics *)&v12 init];
  if (v8)
  {
    v9 = objc_opt_new();
    [(CRPerformanceStatistics *)v8 setMetrics:v9];

    objc_storeStrong((id *)&v8->_name, a3);
    BOOL v10 = v4
       && +[CRPerformanceStatistics _canEnableRecentPeakReset];
    v8->_measureRecentPeak = v10;
    [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricExecutionTime" name:@"Execution Time" unit:@"ms" denominator:0 pcMetricID:1.0];
    [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricCPUTime" name:@"CPU Time" unit:@"ms" denominator:0x63707574696D6500 pcMetricID:1000000.0];
    [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricLifetimeMemPeak" name:@"Lifetime Mem Peak" unit:@"MB" denominator:0x6C6966657065616BLL pcMetricID:1000.0];
    [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricDeltaMem" name:@"Delta Mem" unit:@"MB" denominator:0x6D656D64656C7461 pcMetricID:1000.0];
    if (v8->_measureRecentPeak)
    {
      [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricDeltaMemPeak" name:@"Delta Mem Peak" unit:@"MB" denominator:0x7065616B646C7461 pcMetricID:1000.0];
      [(CRPerformanceStatistics *)v8 _addMetricWithKey:@"CRPerformanceMetricRecentMemPeak" name:@"Recent Mem Peak" unit:@"MB" denominator:0x72636E747065616BLL pcMetricID:1000.0];
    }
  }

  return v8;
}

- (CRPerformanceStatistics)initWithStatistics:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = (void *)[v5 copy];
  id v7 = -[CRPerformanceStatistics initWithName:measureRecentPeak:](self, "initWithName:measureRecentPeak:", v6, [v4 measureRecentPeak]);

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v9 = [v4 metrics];
    BOOL v10 = (void *)[v8 initWithDictionary:v9 copyItems:1];
    [(CRPerformanceStatistics *)v7 setMetrics:v10];
  }
  return v7;
}

- (CRPerformanceStatistics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"CRPerformanceStatisticsName"];
  v6 = [v4 objectForKey:@"CRPerformanceMetricMeasureRecentPeak"];
  if ([v6 BOOLValue]) {
    BOOL v7 = +[CRPerformanceStatistics _canEnableRecentPeakReset];
  }
  else {
    BOOL v7 = 0;
  }

  id v8 = [(CRPerformanceStatistics *)self initWithName:v5 measureRecentPeak:v7];
  if (v8)
  {
    v9 = [v4 objectForKeyedSubscript:@"CRPerformanceStatisticsMetrics"];
    BOOL v10 = objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__CRPerformanceStatistics_initWithDictionary___block_invoke;
    v13[3] = &unk_1E6CDC590;
    id v14 = v10;
    id v11 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
    [(CRPerformanceStatistics *)v8 setMetrics:v11];
  }
  return v8;
}

void __46__CRPerformanceStatistics_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = [[CRPerformanceMetric alloc] initWithDictionary:v5 key:v6];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)description
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v3 = NSString;
  id v4 = [(CRPerformanceStatistics *)self name];
  id v5 = [(CRPerformanceStatistics *)self metrics];
  id v6 = [v5 allValues];
  BOOL v7 = [v6 objectAtIndexedSubscript:0];
  [v3 stringWithFormat:@"\n===========%@ (# Samples = %ld)===========\n", v4, objc_msgSend(v7, "numSamples")];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(CRPerformanceStatistics *)self metrics];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__CRPerformanceStatistics_description__block_invoke;
  v11[3] = &unk_1E6CDC5B8;
  v11[4] = &v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __38__CRPerformanceStatistics_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  if ([v19 numSamples] >= 1)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = [v19 displayName];
    id v6 = [v19 unit];
    id v7 = [v5 stringByAppendingFormat:@" (%@)", v6];
    uint64_t v8 = [v7 cStringUsingEncoding:4];
    [v19 mean];
    uint64_t v10 = v9;
    [v19 stdDev];
    uint64_t v12 = v11;
    [v19 first];
    uint64_t v14 = v13;
    [v19 max];
    uint64_t v16 = objc_msgSend(v4, "stringByAppendingFormat:", @"%*s: %.3f (σ = %.3f | first = %.3f | max = %.3f)\n", 22, v8, v10, v12, v14, v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

- (void)measureBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = pc_session_create();
  id v6 = [MEMORY[0x1E4F28F80] processInfo];
  [v6 processIdentifier];
  pc_session_set_procpid();

  if (self->_measureRecentPeak)
  {
    pc_session_add_metric();
    pc_session_add_metric();
  }
  id v8 = (id)objc_opt_new();
  pc_session_begin();
  v4[2](v4);

  pc_session_end();
  id v7 = objc_opt_new();
  [v7 timeIntervalSinceDate:v8];
  -[CRPerformanceStatistics _evaluateEndedSession:duration:](self, "_evaluateEndedSession:duration:", v5);

  pc_session_destroy();
}

- (void)addStatistics:(id)a3
{
  id v4 = [a3 metrics];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CRPerformanceStatistics_addStatistics___block_invoke;
  v5[3] = &unk_1E6CDC5E0;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __41__CRPerformanceStatistics_addStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) metrics];
  id v7 = [v6 objectForKeyedSubscript:v10];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) metrics];
    uint64_t v9 = [v8 objectForKeyedSubscript:v10];
    [v9 mergeMetric:v5];
  }
}

- (id)dictionary
{
  v3 = objc_opt_new();
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"CRPerformanceStatisticsName"];
  }
  id v6 = [NSNumber numberWithBool:self->_measureRecentPeak];
  [v4 setObject:v6 forKey:@"CRPerformanceMetricMeasureRecentPeak"];

  id v7 = objc_opt_new();
  id v8 = [(CRPerformanceStatistics *)self metrics];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__CRPerformanceStatistics_dictionary__block_invoke;
  v12[3] = &unk_1E6CDC5E0;
  id v13 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];

  [v4 setObject:v9 forKeyedSubscript:@"CRPerformanceStatisticsMetrics"];
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v10;
}

void __37__CRPerformanceStatistics_dictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionary];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7
{
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA60];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(CRPerformanceStatistics *)self metrics];
  id v19 = [v12 dictionaryWithDictionary:v16];

  if (a7) {
    +[CRPerformanceMetric pcMetricWithDisplayName:v14 pcMetricID:a7 unit:v13 denominator:v15 serializationKey:a6];
  }
  else {
  uint64_t v17 = +[CRPerformanceMetric metricWithDisplayName:v14 unit:v13 denominator:v15 serializationKey:a6];
  }

  [v19 setObject:v17 forKeyedSubscript:v15];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v19];
  [(CRPerformanceStatistics *)self setMetrics:v18];
}

- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4
{
  id v7 = [(CRPerformanceStatistics *)self metrics];
  id v8 = [v7 objectForKeyedSubscript:@"CRPerformanceMetricExecutionTime"];
  [v8 addSample:a4 * 1000.0];

  id v9 = [(CRPerformanceStatistics *)self metrics];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CRPerformanceStatistics__evaluateEndedSession_duration___block_invoke;
  v10[3] = &__block_descriptor_40_e46_v32__0__NSString_8__CRPerformanceMetric_16_B24l;
  v10[4] = a3;
  [v9 enumerateKeysAndObjectsUsingBlock:v10];
}

void __58__CRPerformanceStatistics__evaluateEndedSession_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 pcMetricID])
  {
    [v3 pcMetricID];
    pc_session_get_value();
    [v3 denominator];
    [v3 addSample:0.0 / v4];
  }
}

+ (BOOL)_canEnableRecentPeakReset
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"com.apple.CoreRecognition.enable_recent_peak_reset"];

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)measureRecentPeak
{
  return self->_measureRecentPeak;
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end