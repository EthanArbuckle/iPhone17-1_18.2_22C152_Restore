@interface SiriAnalyticsRawUnifiedStream
- (SiriAnalyticsRawUnifiedStream)init;
- (void)prune;
- (void)sendWithAnyEvent:(id)a3;
- (void)sendWithAnyEvents:(id)a3;
- (void)sendWithRuntimeEvents:(id)a3;
@end

@implementation SiriAnalyticsRawUnifiedStream

- (SiriAnalyticsRawUnifiedStream)init
{
  return (SiriAnalyticsRawUnifiedStream *)RawUnifiedStreamAdapter.init()();
}

- (void)sendWithAnyEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A2B50D6C(v4);
}

- (void)sendWithAnyEvents:(id)a3
{
}

- (void)sendWithRuntimeEvents:(id)a3
{
}

- (void)prune
{
  v2 = self;
  sub_1A2B51178();
}

- (void).cxx_destruct
{
}

@end