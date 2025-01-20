@interface SiriAnalyticsLocalStorageDispatcher
- (SiriAnalyticsLocalStorageDispatcher)init;
- (SiriAnalyticsLocalStorageDispatcher)initWithPlusStream:(id)a3;
@end

@implementation SiriAnalyticsLocalStorageDispatcher

- (SiriAnalyticsLocalStorageDispatcher)initWithPlusStream:(id)a3
{
  id v4 = a3;
  return (SiriAnalyticsLocalStorageDispatcher *)LocalStorageDispatcherShim.init(plusStream:)(a3);
}

- (SiriAnalyticsLocalStorageDispatcher)init
{
}

- (void).cxx_destruct
{
}

@end