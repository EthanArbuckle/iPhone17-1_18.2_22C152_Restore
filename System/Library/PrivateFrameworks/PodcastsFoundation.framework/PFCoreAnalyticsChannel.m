@interface PFCoreAnalyticsChannel
- (void)sendEvent:(id)a3;
@end

@implementation PFCoreAnalyticsChannel

- (void)sendEvent:(id)a3
{
  id v3 = a3;
  id v5 = [v3 name];
  v4 = [v3 payloadGenerator];

  AnalyticsSendEventLazy();
}

@end