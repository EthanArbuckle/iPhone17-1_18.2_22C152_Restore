@interface RTMapItemProviderBluePOIWiFiScanMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binsForFingerprintsCount;
+ (id)binsForVisitDuration;
+ (id)binsForWiFiAPsCount;
+ (id)binsForWiFiInterval;
+ (id)supportedMetricKeys;
+ (unint64_t)bucketForFingerprintsCount:(unint64_t)a3;
+ (unint64_t)bucketForVisitInterval:(double)a3;
+ (unint64_t)bucketForWiFiAPsCount:(unint64_t)a3;
+ (unint64_t)bucketForWiFiInterval:(double)a3;
+ (void)submitBluePOIWiFiScanMetricsWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11;
- (RTMapItemProviderBluePOIWiFiScanMetrics)init;
- (RTMapItemProviderBluePOIWiFiScanMetrics)initWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11;
@end

@implementation RTMapItemProviderBluePOIWiFiScanMetrics

- (RTMapItemProviderBluePOIWiFiScanMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFingerprintsCount_fingerprintsZeroAccessPointsCount_fingerprintsNonZeroAccessPointsCount_isFingerprintWindowFallback_timeIntervalSinceEarliestFingerprint_timeIntervalSinceLatestFingerprint_totalAccessPointsCount_visitInterval_visitSource_);
}

- (RTMapItemProviderBluePOIWiFiScanMetrics)initWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11
{
  BOOL v13 = a6;
  v47.receiver = self;
  v47.super_class = (Class)RTMapItemProviderBluePOIWiFiScanMetrics;
  v20 = [(RTMetric *)&v47 init];
  if (v20)
  {
    int64_t v46 = a11;
    v45 = +[RTMapItemProviderBluePOIWiFiScanMetrics binsForWiFiAPsCount];
    v21 = +[RTMapItemProviderBluePOIWiFiScanMetrics binsForFingerprintsCount];
    v22 = [NSNumber numberWithUnsignedInteger:a3];
    v23 = +[RTMetric binForNumber:v22 bins:v21];
    v24 = [(RTMetric *)v20 metrics];
    [v24 setObject:v23 forKeyedSubscript:@"fingerprintsCount"];

    v25 = [NSNumber numberWithUnsignedInteger:a4];
    v26 = +[RTMetric binForNumber:v25 bins:v21];
    v27 = [(RTMetric *)v20 metrics];
    [v27 setObject:v26 forKeyedSubscript:@"fingerprintsWithZeroAPsCount"];

    v28 = [NSNumber numberWithUnsignedInteger:a5];
    v29 = +[RTMetric binForNumber:v28 bins:v21];
    v30 = [(RTMetric *)v20 metrics];
    [v30 setObject:v29 forKeyedSubscript:@"fingerprintsWithNonZeroAPsCount"];

    v31 = [NSNumber numberWithBool:v13];
    v32 = [(RTMetric *)v20 metrics];
    [v32 setObject:v31 forKeyedSubscript:@"isFingerprintWindowFallback"];

    v33 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() bucketForWiFiInterval:a7]];
    v34 = [(RTMetric *)v20 metrics];
    [v34 setObject:v33 forKeyedSubscript:@"timeIntervalEarliesttWiFiScan"];

    v35 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() bucketForWiFiInterval:a8]];
    v36 = [(RTMetric *)v20 metrics];
    [v36 setObject:v35 forKeyedSubscript:@"timeIntervalLatestWiFiScan"];

    v37 = [NSNumber numberWithUnsignedInteger:a9];
    v38 = +[RTMetric binForNumber:v37 bins:v45];
    v39 = [(RTMetric *)v20 metrics];
    [v39 setObject:v38 forKeyedSubscript:@"totalAccessPointsCount"];

    v40 = [NSNumber numberWithUnsignedInteger:[objc_opt_class() bucketForVisitInterval:a10]];
    v41 = [(RTMetric *)v20 metrics];
    [v41 setObject:v40 forKeyedSubscript:@"visitDuration"];

    v42 = [NSNumber numberWithInteger:v46];
    v43 = [(RTMetric *)v20 metrics];
    [v43 setObject:v42 forKeyedSubscript:@"visitSource"];
  }
  return v20;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventMapItemProviderBluePOIWiFiScansMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"fingerprintsCount", @"fingerprintsWithZeroAPsCount", @"fingerprintsWithNonZeroAPsCount", @"isFingerprintWindowFallback", @"timeIntervalEarliesttWiFiScan", @"timeIntervalLatestWiFiScan", @"totalAccessPointsCount", @"visitSource", @"visitDuration", 0];
}

+ (unint64_t)bucketForVisitInterval:(double)a3
{
  v4 = [NSNumber numberWithDouble:a3];
  v5 = [a1 binsForVisitDuration];
  v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (id)binsForVisitDuration
{
  uint64_t v2 = (void *)binsForVisitDuration_binsForVisitDuration;
  if (!binsForVisitDuration_binsForVisitDuration)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3452C88];
    v4 = (void *)binsForVisitDuration_binsForVisitDuration;
    binsForVisitDuration_binsForVisitDuration = v3;

    uint64_t v5 = 23;
    uint64_t v6 = 3600;
    do
    {
      unint64_t v7 = (void *)binsForVisitDuration_binsForVisitDuration;
      v8 = [NSNumber numberWithLong:v6];
      [v7 addObject:v8];

      v6 += 3600;
      --v5;
    }
    while (v5);
    uint64_t v9 = 4;
    uint64_t v10 = 86400;
    do
    {
      v11 = (void *)binsForVisitDuration_binsForVisitDuration;
      v12 = [NSNumber numberWithLong:v10];
      [v11 addObject:v12];

      v10 += 86400;
      --v9;
    }
    while (v9);
    uint64_t v2 = (void *)binsForVisitDuration_binsForVisitDuration;
  }

  return v2;
}

+ (id)binsForWiFiAPsCount
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3452CA0];
  uint64_t v3 = 10;
  do
  {
    v4 = [NSNumber numberWithInt:v3];
    [v2 addObject:v4];

    uint64_t v3 = (v3 + 10);
  }
  while (v3 != 60);
  uint64_t v5 = 100;
  do
  {
    uint64_t v6 = [NSNumber numberWithInt:v5];
    [v2 addObject:v6];

    uint64_t v5 = (v5 + 100);
  }
  while (v5 != 600);

  return v2;
}

+ (id)binsForFingerprintsCount
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3452CB8];
  uint64_t v3 = 10;
  do
  {
    v4 = [NSNumber numberWithInt:v3];
    [v2 addObject:v4];

    uint64_t v3 = (v3 + 10);
  }
  while (v3 != 110);

  return v2;
}

+ (unint64_t)bucketForWiFiInterval:(double)a3
{
  v4 = [NSNumber numberWithDouble:a3];
  uint64_t v5 = [a1 binsForWiFiInterval];
  uint64_t v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (id)binsForWiFiInterval
{
  uint64_t v2 = (void *)binsForWiFiInterval_binsForWiFiInterval;
  if (!binsForWiFiInterval_binsForWiFiInterval)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3452CD0];
    v4 = (void *)binsForWiFiInterval_binsForWiFiInterval;
    binsForWiFiInterval_binsForWiFiInterval = v3;

    uint64_t v5 = 1;
    do
    {
      uint64_t v6 = (void *)binsForWiFiInterval_binsForWiFiInterval;
      unint64_t v7 = [NSNumber numberWithInt:v5];
      [v6 addObject:v7];

      uint64_t v5 = (v5 + 1);
    }
    while (v5 != 15);
    for (uint64_t i = 60; i != 960; i += 60)
    {
      uint64_t v9 = (void *)binsForWiFiInterval_binsForWiFiInterval;
      uint64_t v10 = [NSNumber numberWithLong:i];
      [v9 addObject:v10];
    }
    uint64_t v2 = (void *)binsForWiFiInterval_binsForWiFiInterval;
  }

  return v2;
}

+ (unint64_t)bucketForWiFiAPsCount:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [a1 binsForWiFiAPsCount];
  uint64_t v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (unint64_t)bucketForFingerprintsCount:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [a1 binsForFingerprintsCount];
  uint64_t v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

+ (void)submitBluePOIWiFiScanMetricsWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11
{
  v11 = [[RTMapItemProviderBluePOIWiFiScanMetrics alloc] initWithFingerprintsCount:a3 fingerprintsZeroAccessPointsCount:a4 fingerprintsNonZeroAccessPointsCount:a5 isFingerprintWindowFallback:a6 timeIntervalSinceEarliestFingerprint:a9 timeIntervalSinceLatestFingerprint:a11 totalAccessPointsCount:a7 visitInterval:a8 visitSource:a10];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = 0;
    [(RTMetric *)v11 submitMetricsWithError:&v13];
  }
}

@end