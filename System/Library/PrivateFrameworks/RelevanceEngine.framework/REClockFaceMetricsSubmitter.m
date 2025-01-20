@interface REClockFaceMetricsSubmitter
- (BOOL)_runningInClockFace;
- (BOOL)_runningInTest;
- (BOOL)_shouldRecordMetrics;
- (void)recordCallibrationCurveMetrics:(id)a3 forInteraction:(id)a4;
- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4;
@end

@implementation REClockFaceMetricsSubmitter

- (BOOL)_runningInClockFace
{
  if (-[REClockFaceMetricsSubmitter _runningInClockFace]::onceToken != -1) {
    dispatch_once(&-[REClockFaceMetricsSubmitter _runningInClockFace]::onceToken, &__block_literal_global_24_0);
  }
  return -[REClockFaceMetricsSubmitter _runningInClockFace]::MetricsEnabled;
}

void __50__REClockFaceMetricsSubmitter__runningInClockFace__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  -[REClockFaceMetricsSubmitter _runningInClockFace]::MetricsEnabled = [v0 isEqualToString:@"com.apple.clockface"];
}

- (BOOL)_runningInTest
{
  Class v2 = NSClassFromString((NSString *)@"UIApplication");
  if (!v2) {
    return 0;
  }
  Class v3 = v2;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [(objc_class *)v3 isRunningTest];
}

- (BOOL)_shouldRecordMetrics
{
  BOOL v3 = [(REClockFaceMetricsSubmitter *)self _runningInClockFace];
  if (v3) {
    LOBYTE(v3) = ![(REClockFaceMetricsSubmitter *)self _runningInTest];
  }
  return v3;
}

- (void)recordTrainingMetrics:(id)a3 forInteraction:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(REClockFaceMetricsSubmitter *)self _shouldRecordMetrics]
    && [v6 isEqualToString:@"tap"])
  {
    AnalyticsSendEvent();
  }
}

- (void)recordCallibrationCurveMetrics:(id)a3 forInteraction:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(REClockFaceMetricsSubmitter *)self _shouldRecordMetrics]
    && [v6 isEqualToString:@"tap"])
  {
    AnalyticsSendEvent();
  }
}

@end