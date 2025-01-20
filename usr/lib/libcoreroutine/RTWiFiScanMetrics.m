@interface RTWiFiScanMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)binsForWiFiAPsCount;
+ (id)supportedMetricKeys;
+ (unint64_t)bucketForWiFiAPsCount:(unint64_t)a3;
+ (void)submitWiFiScanMetricsWithErrorCode:(unint64_t)a3 accessPointsscanResultsCount:(unint64_t)a4 isScanIssuedByOtherClient:(BOOL)a5 isCacheQuery:(BOOL)a6;
- (RTWiFiScanMetrics)init;
- (RTWiFiScanMetrics)initWithAccessPointsscanResultsCount:(unint64_t)a3 errorCode:(unint64_t)a4 isCacheQuery:(BOOL)a5 isScanIssuedByOtherClient:(BOOL)a6;
@end

@implementation RTWiFiScanMetrics

+ (void)submitWiFiScanMetricsWithErrorCode:(unint64_t)a3 accessPointsscanResultsCount:(unint64_t)a4 isScanIssuedByOtherClient:(BOOL)a5 isCacheQuery:(BOOL)a6
{
  v6 = [[RTWiFiScanMetrics alloc] initWithAccessPointsscanResultsCount:a4 errorCode:a3 isCacheQuery:a6 isScanIssuedByOtherClient:a5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    [(RTMetric *)v6 submitMetricsWithError:&v8];
  }
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventWiFiScanMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"wifiScanTotalAccessPointsCount", @"errorCode", @"isCacheQuery", @"isScanIssuedByAnotherClient", 0];
}

- (RTWiFiScanMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccessPointsscanResultsCount_errorCode_isCacheQuery_isScanIssuedByOtherClient_);
}

- (RTWiFiScanMetrics)initWithAccessPointsscanResultsCount:(unint64_t)a3 errorCode:(unint64_t)a4 isCacheQuery:(BOOL)a5 isScanIssuedByOtherClient:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RTWiFiScanMetrics;
  v10 = [(RTMetric *)&v22 init];
  if (v10)
  {
    v11 = +[RTWiFiScanMetrics binsForWiFiAPsCount];
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    v13 = +[RTMetric binForNumber:v12 bins:v11];
    v14 = [(RTMetric *)v10 metrics];
    [v14 setObject:v13 forKeyedSubscript:@"wifiScanTotalAccessPointsCount"];

    v15 = [NSString stringWithFormat:@"%lu", a4];
    v16 = [(RTMetric *)v10 metrics];
    [v16 setObject:v15 forKeyedSubscript:@"errorCode"];

    v17 = [NSNumber numberWithBool:v7];
    v18 = [(RTMetric *)v10 metrics];
    [v18 setObject:v17 forKeyedSubscript:@"isCacheQuery"];

    v19 = [NSNumber numberWithBool:v6];
    v20 = [(RTMetric *)v10 metrics];
    [v20 setObject:v19 forKeyedSubscript:@"isScanIssuedByAnotherClient"];
  }
  return v10;
}

+ (id)binsForWiFiAPsCount
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3453600];
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
    BOOL v6 = [NSNumber numberWithInt:v5];
    [v2 addObject:v6];

    uint64_t v5 = (v5 + 100);
  }
  while (v5 != 600);

  return v2;
}

+ (unint64_t)bucketForWiFiAPsCount:(unint64_t)a3
{
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [a1 binsForWiFiAPsCount];
  BOOL v6 = [a1 binForNumber:v4 bins:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

@end