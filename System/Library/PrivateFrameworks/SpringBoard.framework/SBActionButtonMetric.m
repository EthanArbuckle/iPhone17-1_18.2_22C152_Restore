@interface SBActionButtonMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBActionButtonMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5 = a4;
  unint64_t v6 = a3 - 63;
  if (a3 - 63 <= 5)
  {
    v7 = NSStringFromAnalyticsEventType();
    v8 = [@"com.apple.springboard." stringByAppendingString:v7];

    id v10 = v5;
    AnalyticsSendEventLazy();
  }
  return v6 < 6;
}

id __48__SBActionButtonMetric_handleEvent_withContext___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eventPayload];
  v2 = [v1 coreAnalyticsRepresentation];

  return v2;
}

@end