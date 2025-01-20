@interface SMHandoffMetricsManager
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)supportedMetricKeys;
- (SMHandoffMetricsManager)init;
- (void)addMetricErrorCode:(int64_t)a3;
- (void)addMetricErrorDomain:(id)a3;
- (void)addMetricForLatencyEligibilityChecks:(double)a3;
- (void)addMetricForLatencyFetchActiveSessionDetailsCK:(double)a3;
- (void)addMetricForLatencyHandoffCriteria:(double)a3;
- (void)addMetricForLatencyHandoffEndToEnd:(double)a3;
- (void)addMetricForLatencyWriteActiveSessionDetailsCK:(double)a3;
- (void)addMetricHandoffReason:(int64_t)a3;
- (void)addMetricSucceeded:(BOOL)a3;
- (void)resetMetrics;
@end

@implementation SMHandoffMetricsManager

- (SMHandoffMetricsManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)SMHandoffMetricsManager;
  v2 = [(RTMetric *)&v4 init];
  [(SMHandoffMetricsManager *)v2 resetMetrics];
  return v2;
}

- (void)addMetricHandoffReason:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  objc_super v4 = [(RTMetric *)self metrics];
  [v4 setObject:v5 forKeyedSubscript:@"handoffReason"];
}

- (void)addMetricErrorCode:(int64_t)a3
{
  id v5 = [NSNumber numberWithLong:a3];
  objc_super v4 = [(RTMetric *)self metrics];
  [v4 setObject:v5 forKeyedSubscript:@"errorCodeForDomain"];
}

- (void)addMetricErrorDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(RTMetric *)self metrics];
  [v5 setObject:v4 forKeyedSubscript:@"errorDomain"];
}

- (void)addMetricForLatencyEligibilityChecks:(double)a3
{
  id v5 = objc_opt_class();
  v6 = [NSNumber numberWithDouble:round(a3)];
  id v8 = [v5 binForNumber:v6 bins:&unk_1F3452958];

  v7 = [(RTMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"latencyEligibilityChecks"];
}

- (void)addMetricForLatencyFetchActiveSessionDetailsCK:(double)a3
{
  id v5 = objc_opt_class();
  v6 = [NSNumber numberWithDouble:round(a3)];
  id v8 = [v5 binForNumber:v6 bins:&unk_1F3452970];

  v7 = [(RTMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"latencyFetchActiveSessionDetailsCK"];
}

- (void)addMetricForLatencyHandoffCriteria:(double)a3
{
  id v5 = objc_opt_class();
  v6 = [NSNumber numberWithDouble:round(a3)];
  id v8 = [v5 binForNumber:v6 bins:&unk_1F3452988];

  v7 = [(RTMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"latencyHandoffCriteria"];
}

- (void)addMetricForLatencyHandoffEndToEnd:(double)a3
{
  id v5 = objc_opt_class();
  v6 = [NSNumber numberWithDouble:round(a3)];
  id v8 = [v5 binForNumber:v6 bins:&unk_1F34529A0];

  v7 = [(RTMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"latencyHandoffEndToEnd"];
}

- (void)addMetricForLatencyWriteActiveSessionDetailsCK:(double)a3
{
  id v5 = objc_opt_class();
  v6 = [NSNumber numberWithDouble:round(a3)];
  id v8 = [v5 binForNumber:v6 bins:&unk_1F34529B8];

  v7 = [(RTMetric *)self metrics];
  [v7 setObject:v8 forKeyedSubscript:@"latencyWriteActiveSessionDetailsCK"];
}

- (void)addMetricSucceeded:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(RTMetric *)self metrics];
  [v4 setObject:v5 forKeyedSubscript:@"succeeded"];
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventSafetyMonitorMultiDeviceHandoffSessionMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObjects:@"handoffReason", @"errorCodeForDomain", @"errorDomain", @"latencyEligibilityChecks", @"latencyFetchActiveSessionDetailsCK", @"latencyHandoffCriteria", @"latencyHandoffEndToEnd", @"latencyWriteActiveSessionDetailsCK", @"succeeded", 0];
}

- (void)resetMetrics
{
  v3 = [(RTMetric *)self metrics];
  [v3 setObject:&unk_1F344F760 forKeyedSubscript:@"handoffReason"];

  [(SMHandoffMetricsManager *)self addMetricErrorCode:0];
  [(SMHandoffMetricsManager *)self addMetricErrorDomain:@"Unknown"];
  [(SMHandoffMetricsManager *)self addMetricForLatencyEligibilityChecks:-1.0];
  [(SMHandoffMetricsManager *)self addMetricForLatencyFetchActiveSessionDetailsCK:-1.0];
  [(SMHandoffMetricsManager *)self addMetricForLatencyHandoffCriteria:-1.0];
  [(SMHandoffMetricsManager *)self addMetricForLatencyHandoffEndToEnd:-1.0];
  [(SMHandoffMetricsManager *)self addMetricForLatencyWriteActiveSessionDetailsCK:-1.0];

  [(SMHandoffMetricsManager *)self addMetricSucceeded:0];
}

@end