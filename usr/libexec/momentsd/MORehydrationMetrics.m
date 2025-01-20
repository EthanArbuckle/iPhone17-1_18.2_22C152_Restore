@interface MORehydrationMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)integerKeys;
+ (id)stringKeys;
+ (id)supportedMetricKeys;
- (BOOL)rehydrationSuccess;
- (BOOL)rehydrationSuccessAfterPreFail;
- (BOOL)spiSuccess;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MORehydrationMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 spiSuccess:(BOOL)a5 spiError:(id)a6 failCount:(double)a7 successAfterPreFailCount:(double)a8 totalCount:(int)a9 rehydrationTrigger:(int)a10;
- (MORehydrationMetrics)initWithLoggingEnabled:(BOOL)a3;
- (NSString)spiError;
- (double)failPercentage;
- (double)successAfterPreFailPercentage;
- (int)failCount;
- (int)rehydrationTrigger;
- (int)successAfterPreFailCount;
- (int)totalCount;
- (unint64_t)category;
- (unint64_t)provider;
- (void)setCategory:(unint64_t)a3;
- (void)setFailCount:(int)a3;
- (void)setFailPercentage:(double)a3;
- (void)setProvider:(unint64_t)a3;
- (void)setRehydrationSuccess:(BOOL)a3;
- (void)setRehydrationSuccessAfterPreFail:(BOOL)a3;
- (void)setRehydrationTrigger:(int)a3;
- (void)setSpiError:(id)a3;
- (void)setSpiSuccess:(BOOL)a3;
- (void)setSuccessAfterPreFailCount:(int)a3;
- (void)setSuccessAfterPreFailPercentage:(double)a3;
- (void)setTotalCount:(int)a3;
- (void)setValues;
@end

@implementation MORehydrationMetrics

- (MORehydrationMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 spiSuccess:(BOOL)a5 spiError:(id)a6 failCount:(double)a7 successAfterPreFailCount:(double)a8 totalCount:(int)a9 rehydrationTrigger:(int)a10
{
  id v19 = a6;
  v20 = [(MORehydrationMetrics *)self initWithLoggingEnabled:1];
  v21 = v20;
  if (v20)
  {
    v20->_category = a3;
    v20->_provider = a4;
    v20->_spiSuccess = a5;
    objc_storeStrong((id *)&v20->_spiError, a6);
    v21->_totalCount = a9;
    v21->_failCount = (int)a7;
    v21->_successAfterPreFailCount = (int)a8;
    if (a9 < 1)
    {
      v21->_failPercentage = 0.0;
      double v22 = 0.0;
    }
    else
    {
      v21->_failPercentage = a7 / (double)a9 * 100.0;
      double v22 = a8 / (double)a9 * 100.0;
    }
    v21->_successAfterPreFailPercentage = v22;
    v21->_rehydrationTrigger = a10;
    v21->_rehydrationSuccess = v21->_failCount == 0;
    v21->_rehydrationSuccessAfterPreFail = v21->_successAfterPreFailCount != 0;
  }

  return v21;
}

- (MORehydrationMetrics)initWithLoggingEnabled:(BOOL)a3
{
  v49.receiver = self;
  v49.super_class = (Class)MORehydrationMetrics;
  v3 = [(MOMetric *)&v49 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    id v5 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v46;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v46 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v8);
          v10 = [(MOMetric *)v3 metrics];
          [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v6);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v11 = [(id)objc_opt_class() integerKeys];
    id v12 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v42;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v15);
          v17 = [(MOMetric *)v3 metrics];
          [v17 setObject:&off_1002F4868 forKeyedSubscript:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v13);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v18 = [(id)objc_opt_class() bucketedKeys];
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        double v22 = 0;
        do
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v22);
          v24 = [(MOMetric *)v3 metrics];
          [v24 setObject:&off_1002F4868 forKeyedSubscript:v23];

          double v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v20);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = [objc_opt_class() stringKeys];
    id v26 = [v25 countByEnumeratingWithState:&v33 objects:v50 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v29);
          v31 = [(MOMetric *)v3 metrics];
          [v31 setObject:&off_1002F4880 forKeyedSubscript:v30];

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v33 objects:v50 count:16];
      }
      while (v27);
    }
  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:@"spiSuccess", @"rehydrationSuccess", @"rehydrationSuccessAfterPreFail", 0];
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:@"category", @"provider", @"rehydrationTrigger", @"successAfterPreFailEventCount", @"totalEventCount", @"failEventCount", 0];
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:@"failPercentage", @"successAfterPreFailPercentage", 0];
}

+ (id)stringKeys
{
  return +[NSSet setWithObjects:@"spiError", 0];
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() integerKeys];
  v3 = +[NSMutableSet setWithSet:v2];

  v4 = [(id)objc_opt_class() BOOLeanKeys];
  id v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  id v6 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  v8 = [(id)objc_opt_class() stringKeys];
  uint64_t v9 = [v8 allObjects];
  [v3 addObjectsFromArray:v9];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  id v5 = MOAnalyticsEventEventRehydration;
  [(MORehydrationMetrics *)self setValues];
  v7.receiver = self;
  v7.super_class = (Class)MORehydrationMetrics;
  return [(MOMetric *)&v7 submitMetricsWithError:a3 forEvent:v5];
}

- (void)setValues
{
  v3 = +[NSNumber numberWithUnsignedInteger:self->_category];
  v4 = [(MOMetric *)self metrics];
  [v4 setObject:v3 forKeyedSubscript:@"category"];

  id v5 = +[NSNumber numberWithUnsignedInteger:self->_provider];
  id v6 = [(MOMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"provider"];

  objc_super v7 = +[NSNumber numberWithInt:self->_rehydrationTrigger];
  v8 = [(MOMetric *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:@"rehydrationTrigger"];

  uint64_t v9 = +[NSNumber numberWithBool:self->_spiSuccess];
  v10 = [(MOMetric *)self metrics];
  [v10 setObject:v9 forKeyedSubscript:@"spiSuccess"];

  v11 = +[NSNumber numberWithBool:self->_rehydrationSuccess];
  id v12 = [(MOMetric *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"rehydrationSuccess"];

  id v13 = +[NSNumber numberWithInt:self->_successAfterPreFailCount];
  uint64_t v14 = [(MOMetric *)self metrics];
  [v14 setObject:v13 forKeyedSubscript:@"successAfterPreFailEventCount"];

  v15 = +[NSNumber numberWithInt:self->_totalCount];
  uint64_t v16 = [(MOMetric *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"totalEventCount"];

  v17 = +[NSNumber numberWithInt:self->_failCount];
  v18 = [(MOMetric *)self metrics];
  [v18 setObject:v17 forKeyedSubscript:@"failEventCount"];

  id v19 = +[NSNumber numberWithBool:self->_rehydrationSuccessAfterPreFail];
  id v20 = [(MOMetric *)self metrics];
  [v20 setObject:v19 forKeyedSubscript:@"rehydrationSuccessAfterPreFail"];

  spiError = self->_spiError;
  double v22 = [(MOMetric *)self metrics];
  uint64_t v23 = v22;
  if (spiError) {
    CFStringRef v24 = (const __CFString *)spiError;
  }
  else {
    CFStringRef v24 = &stru_1002D2AC8;
  }
  [v22 setObject:v24 forKeyedSubscript:@"spiError"];

  v25 = +[NSNumber numberWithDouble:self->_failPercentage];
  id v26 = [(MOMetric *)self metrics];
  [v26 setObject:v25 forKeyedSubscript:@"failPercentage"];

  id v28 = +[NSNumber numberWithDouble:self->_successAfterPreFailPercentage];
  id v27 = [(MOMetric *)self metrics];
  [v27 setObject:v28 forKeyedSubscript:@"successAfterPreFailPercentage"];
}

- (unint64_t)provider
{
  return self->_provider;
}

- (void)setProvider:(unint64_t)a3
{
  self->_provider = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (BOOL)spiSuccess
{
  return self->_spiSuccess;
}

- (void)setSpiSuccess:(BOOL)a3
{
  self->_spiSuccess = a3;
}

- (NSString)spiError
{
  return self->_spiError;
}

- (void)setSpiError:(id)a3
{
}

- (double)failPercentage
{
  return self->_failPercentage;
}

- (void)setFailPercentage:(double)a3
{
  self->_failPercentage = a3;
}

- (double)successAfterPreFailPercentage
{
  return self->_successAfterPreFailPercentage;
}

- (void)setSuccessAfterPreFailPercentage:(double)a3
{
  self->_successAfterPreFailPercentage = a3;
}

- (int)rehydrationTrigger
{
  return self->_rehydrationTrigger;
}

- (void)setRehydrationTrigger:(int)a3
{
  self->_rehydrationTrigger = a3;
}

- (BOOL)rehydrationSuccess
{
  return self->_rehydrationSuccess;
}

- (void)setRehydrationSuccess:(BOOL)a3
{
  self->_rehydrationSuccess = a3;
}

- (BOOL)rehydrationSuccessAfterPreFail
{
  return self->_rehydrationSuccessAfterPreFail;
}

- (void)setRehydrationSuccessAfterPreFail:(BOOL)a3
{
  self->_rehydrationSuccessAfterPreFail = a3;
}

- (int)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(int)a3
{
  self->_totalCount = a3;
}

- (int)failCount
{
  return self->_failCount;
}

- (void)setFailCount:(int)a3
{
  self->_failCount = a3;
}

- (int)successAfterPreFailCount
{
  return self->_successAfterPreFailCount;
}

- (void)setSuccessAfterPreFailCount:(int)a3
{
  self->_successAfterPreFailCount = a3;
}

- (void).cxx_destruct
{
}

@end