@interface HKSleepDaySummary(Analytics)
- (void)hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:()Analytics;
@end

@implementation HKSleepDaySummary(Analytics)

- (void)hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:()Analytics
{
  id v4 = a3;
  if ([a1 containsPeriodsWithAppleSleepTrackingData])
  {
    v5 = [a1 periods];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __92__HKSleepDaySummary_Analytics__hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock___block_invoke;
    v6[3] = &unk_2645D9968;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

@end