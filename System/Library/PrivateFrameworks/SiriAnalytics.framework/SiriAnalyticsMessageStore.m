@interface SiriAnalyticsMessageStore
- (SiriAnalyticsMessageStore)init;
- (SiriAnalyticsMessageStore)initWithPrefs:(id)a3;
- (void)prune;
@end

@implementation SiriAnalyticsMessageStore

- (SiriAnalyticsMessageStore)initWithPrefs:(id)a3
{
  return (SiriAnalyticsMessageStore *)MessageStoreShim.init(prefs:)(a3);
}

- (void)prune
{
  v2 = self;
  sub_1A2B80230();
}

- (SiriAnalyticsMessageStore)init
{
}

- (void).cxx_destruct
{
}

@end