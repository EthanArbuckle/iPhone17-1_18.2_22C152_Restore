@interface SiriAnalyticsUserHistoryPolicy
- (SiriAnalyticsUserHistoryPolicy)init;
- (SiriAnalyticsUserHistoryPolicy)initWithMessageStaging:(id)a3 queue:(id)a4;
- (void)startObserving;
@end

@implementation SiriAnalyticsUserHistoryPolicy

- (SiriAnalyticsUserHistoryPolicy)initWithMessageStaging:(id)a3 queue:(id)a4
{
  return (SiriAnalyticsUserHistoryPolicy *)UserHistoryPolicyShim.init(messageStaging:queue:)(a3, a4);
}

- (void)startObserving
{
  v2 = self;
  sub_1A2BAD248();
}

- (SiriAnalyticsUserHistoryPolicy)init
{
}

- (void).cxx_destruct
{
}

@end