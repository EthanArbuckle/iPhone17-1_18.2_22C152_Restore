@interface MORehydrationThresholdMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)integerKeys;
+ (id)supportedMetricKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MORehydrationThresholdMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 failureCount:(int)a5;
- (MORehydrationThresholdMetrics)initWithLoggingEnabled:(BOOL)a3;
- (int)failureCount;
- (unint64_t)category;
- (unint64_t)provider;
- (void)setCategory:(unint64_t)a3;
- (void)setFailureCount:(int)a3;
- (void)setProvider:(unint64_t)a3;
- (void)setValues;
@end

@implementation MORehydrationThresholdMetrics

- (MORehydrationThresholdMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 failureCount:(int)a5
{
  result = [(MORehydrationThresholdMetrics *)self initWithLoggingEnabled:1];
  if (result)
  {
    result->_category = a3;
    result->_provider = a4;
    result->_failureCount = a5;
  }
  return result;
}

- (MORehydrationThresholdMetrics)initWithLoggingEnabled:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MORehydrationThresholdMetrics;
  v3 = [(MOMetric *)&v16 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [objc_opt_class() integerKeys];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
          v10 = [(MOMetric *)v3 metrics];
          [v10 setObject:&off_1002F4838 forKeyedSubscript:v9];

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:@"category", @"provider", @"failureCount", 0];
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() integerKeys];
  v3 = +[NSMutableSet setWithSet:v2];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  id v5 = MOAnalyticsEventMOEventRehydrationThreshold;
  [(MORehydrationThresholdMetrics *)self setValues];
  v7.receiver = self;
  v7.super_class = (Class)MORehydrationThresholdMetrics;
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

  id v8 = +[NSNumber numberWithInt:self->_failureCount];
  objc_super v7 = [(MOMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"failureCount"];
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

- (int)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int)a3
{
  self->_failureCount = a3;
}

@end