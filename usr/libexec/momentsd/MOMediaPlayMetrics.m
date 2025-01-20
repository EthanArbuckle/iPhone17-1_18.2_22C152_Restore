@interface MOMediaPlayMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)bucketedKeys;
+ (id)supportedMetricKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MOMediaPlayMetrics)initWithFirstPartyAppRatio:(double)a3 firstPartyAppTime:(double)a4 musciAppTime:(double)a5;
- (MOMediaPlayMetrics)initWithLoggingEnabled:(BOOL)a3;
- (int)firstPartyAppRatio;
- (int)firstPartyAppTime;
- (int)musicAppTime;
- (void)setFirstPartyAppRatio:(int)a3;
- (void)setFirstPartyAppTime:(int)a3;
- (void)setMusicAppTime:(int)a3;
- (void)setValues;
@end

@implementation MOMediaPlayMetrics

- (MOMediaPlayMetrics)initWithFirstPartyAppRatio:(double)a3 firstPartyAppTime:(double)a4 musciAppTime:(double)a5
{
  result = [(MOMediaPlayMetrics *)self initWithLoggingEnabled:1];
  if (result)
  {
    if (a3 > 0.0) {
      result->_firstPartyAppRatio = (int)(a3 * 100.0);
    }
    if (a4 > 0.0) {
      result->_firstPartyAppTime = (int)(a4 / 600.0);
    }
    if (a5 > 0.0) {
      result->_musicAppTime = (int)(a5 / 600.0);
    }
  }
  return result;
}

- (MOMediaPlayMetrics)initWithLoggingEnabled:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MOMediaPlayMetrics;
  v3 = [(MOMetric *)&v16 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [objc_opt_class() bucketedKeys];
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
          [v10 setObject:&off_1002F4820 forKeyedSubscript:v9];

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

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:@"firstPartyAppRatio", @"firstPartyAppTime", @"musicAppTime", 0];
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() bucketedKeys];
  v3 = +[NSMutableSet setWithSet:v2];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  id v5 = MOAnalyticsEventMediaPlayMetrics;
  [(MOMediaPlayMetrics *)self setValues];
  v7.receiver = self;
  v7.super_class = (Class)MOMediaPlayMetrics;
  return [(MOMetric *)&v7 submitMetricsWithError:a3 forEvent:v5];
}

- (void)setValues
{
  v3 = +[NSNumber numberWithInt:self->_firstPartyAppRatio];
  v4 = [(MOMetric *)self metrics];
  [v4 setObject:v3 forKeyedSubscript:@"firstPartyAppRatio"];

  id v5 = +[NSNumber numberWithInt:self->_firstPartyAppTime];
  id v6 = [(MOMetric *)self metrics];
  [v6 setObject:v5 forKeyedSubscript:@"firstPartyAppTime"];

  id v8 = +[NSNumber numberWithInt:self->_musicAppTime];
  objc_super v7 = [(MOMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"musicAppTime"];
}

- (int)firstPartyAppRatio
{
  return self->_firstPartyAppRatio;
}

- (void)setFirstPartyAppRatio:(int)a3
{
  self->_firstPartyAppRatio = a3;
}

- (int)firstPartyAppTime
{
  return self->_firstPartyAppTime;
}

- (void)setFirstPartyAppTime:(int)a3
{
  self->_firstPartyAppTime = a3;
}

- (int)musicAppTime
{
  return self->_musicAppTime;
}

- (void)setMusicAppTime:(int)a3
{
  self->_musicAppTime = a3;
}

@end