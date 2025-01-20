@interface APECMetricSampler
+ (BOOL)_shouldSample:(id)a3;
- (APECMetricSampler)init;
- (BOOL)_hasSession:(id)a3 purpose:(int64_t)a4;
- (BOOL)isSampleRateExpired:(id)a3 purpose:(int64_t)a4;
- (BOOL)sampleEvent:(int64_t)a3;
- (NSDictionary)samplingSettings;
- (double)sampleSessionStartTimeFromPurpose:(id)a3 purpose:(int64_t)a4;
- (id)_loadAllSampleRates;
- (id)_loadSampleSessionsfromStorage;
- (id)_samplePeriodFromConfig:(int64_t)a3;
- (id)_sampleRateFromConfig:(int64_t)a3;
- (void)_updateRateAndTime:(id)a3 rate:(id)a4 purpose:(int64_t)a5;
- (void)_updateSampleSessionStorage:(id)a3;
- (void)setSamplingSettings:(id)a3;
@end

@implementation APECMetricSampler

- (APECMetricSampler)init
{
  v7.receiver = self;
  v7.super_class = (Class)APECMetricSampler;
  v2 = [(APECMetricSampler *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(APECMetricSampler *)v2 _loadAllSampleRates];
    samplingSettings = v3->_samplingSettings;
    v3->_samplingSettings = (NSDictionary *)v4;
  }
  return v3;
}

- (id)_loadSampleSessionsfromStorage
{
  id v2 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:0];
  v3 = [v2 valueForKey:@"com.apple.ap.APECSampleSettings"];

  return v3;
}

- (void)_updateSampleSessionStorage:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:0];
  [v4 setValue:v3 forKey:@"com.apple.ap.APECSampleSettings"];
}

- (id)_sampleRateFromConfig:(int64_t)a3
{
  if (!a3)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v3 = +[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:");
  id v4 = v3;
  if (!v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = [v3 samplePercentage];

  if (v5)
  {
    v5 = [v4 samplePercentage];
  }
LABEL_7:

  return v5;
}

- (id)_samplePeriodFromConfig:(int64_t)a3
{
  if (!a3)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v3 = +[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:");
  id v4 = v3;
  if (!v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = [v3 samplePeriod];

  if (v5)
  {
    v5 = [v4 samplePeriod];
  }
LABEL_7:

  return v5;
}

- (id)_loadAllSampleRates
{
  id v3 = [(APECMetricSampler *)self _loadSampleSessionsfromStorage];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v4 = +[NSMutableDictionary dictionary];
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v6 = qword_1001D73A0[i];
    if ([(APECMetricSampler *)self _hasSession:v4 purpose:v6])
    {
      if (![(APECMetricSampler *)self isSampleRateExpired:v4 purpose:v6]) {
        continue;
      }
      objc_super v7 = [(APECMetricSampler *)self _sampleRateFromConfig:v6];
LABEL_8:
      [(APECMetricSampler *)self _updateRateAndTime:v4 rate:v7 purpose:v6];
      goto LABEL_9;
    }
    objc_super v7 = [(APECMetricSampler *)self _sampleRateFromConfig:v6];
    if (v7) {
      goto LABEL_8;
    }
LABEL_9:
  }
  [(APECMetricSampler *)self _updateSampleSessionStorage:v4];
  v8 = +[NSDictionary dictionaryWithDictionary:v4];

  return v8;
}

- (BOOL)_hasSession:(id)a3 purpose:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithInteger:a4];
  objc_super v7 = [v5 objectForKeyedSubscript:v6];

  return v7 != 0;
}

- (void)_updateRateAndTime:(id)a3 rate:(id)a4 purpose:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  BOOL v12 = +[APECMetricSampler _shouldSample:v8];
  v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v14 = @"NO";
    if (v12) {
      CFStringRef v14 = @"YES";
    }
    int v25 = 138412290;
    CFStringRef v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Device should sample metrics (%@)", (uint8_t *)&v25, 0xCu);
  }

  v15 = +[NSNumber numberWithInteger:a5];
  v16 = [v7 objectForKeyedSubscript:v15];

  if (!v16)
  {
    id v17 = [&__NSDictionary0__struct mutableCopy];
    v18 = +[NSNumber numberWithInteger:a5];
    [v7 setObject:v17 forKey:v18];
  }
  v19 = +[NSNumber numberWithBool:v12];
  v20 = +[NSNumber numberWithInteger:a5];
  v21 = [v7 objectForKeyedSubscript:v20];
  [v21 setObject:v19 forKeyedSubscript:@"Sample"];

  v22 = +[NSNumber numberWithDouble:v11];
  v23 = +[NSNumber numberWithInteger:a5];
  v24 = [v7 objectForKeyedSubscript:v23];
  [v24 setObject:v22 forKeyedSubscript:@"TimeInterval"];
}

- (double)sampleSessionStartTimeFromPurpose:(id)a3 purpose:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithInteger:a4];
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v7 objectForKeyedSubscript:@"TimeInterval"];

  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (BOOL)isSampleRateExpired:(id)a3 purpose:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSDate date];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  [(APECMetricSampler *)self sampleSessionStartTimeFromPurpose:v6 purpose:a4];
  double v11 = v10;

  BOOL v12 = [(APECMetricSampler *)self _samplePeriodFromConfig:a4];
  v13 = v12;
  if (v12) {
    double v14 = (double)(int)[v12 intValue];
  }
  else {
    double v14 = 604800.0;
  }
  BOOL v15 = v9 - v11 > v14;

  return v15;
}

- (BOOL)sampleEvent:(int64_t)a3
{
  id v4 = [(APECMetricSampler *)self samplingSettings];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 objectForKeyedSubscript:@"Sample"];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)_shouldSample:(id)a3
{
  id v3 = a3;
  uint32_t v4 = arc4random_uniform(0x186A0u);
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "sample random number (%u)", (uint8_t *)v8, 8u);
  }

  unsigned int v6 = [v3 unsignedIntValue];
  return v4 <= v6;
}

- (NSDictionary)samplingSettings
{
  return self->_samplingSettings;
}

- (void)setSamplingSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end