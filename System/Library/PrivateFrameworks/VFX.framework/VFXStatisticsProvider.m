@interface VFXStatisticsProvider
- (id)collectedShadersForPid:(int)a3;
- (id)performanceStatisticsForPid:(int)a3;
- (int)startCollectingPerformanceStatisticsForPid:(int)a3;
- (int)stopCollectingPerformanceStatisticsForPid:(int)a3;
@end

@implementation VFXStatisticsProvider

- (int)startCollectingPerformanceStatisticsForPid:(int)a3
{
  return _VFXStartCollectingPerformanceStatisticsForPid(a3);
}

- (int)stopCollectingPerformanceStatisticsForPid:(int)a3
{
  return 1;
}

- (id)performanceStatisticsForPid:(int)a3
{
  return _VFXGetPerformanceStatisticsForPid(a3);
}

- (id)collectedShadersForPid:(int)a3
{
  return _VFXGetCollectedShadersForPid();
}

@end