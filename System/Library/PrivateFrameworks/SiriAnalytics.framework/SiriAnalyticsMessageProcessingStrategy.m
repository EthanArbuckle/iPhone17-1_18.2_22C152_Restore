@interface SiriAnalyticsMessageProcessingStrategy
- (SiriAnalyticsMessageProcessingStrategy)init;
- (SiriAnalyticsMessageProcessingStrategy)initWithMessageStaging:(id)a3;
- (void)processWithMessages:(id)a3;
@end

@implementation SiriAnalyticsMessageProcessingStrategy

- (SiriAnalyticsMessageProcessingStrategy)initWithMessageStaging:(id)a3
{
  return (SiriAnalyticsMessageProcessingStrategy *)MessageProcessingStrategy.init(messageStaging:)(a3);
}

- (void)processWithMessages:(id)a3
{
  sub_1A2B9BD08();
  uint64_t v4 = sub_1A2C0D5E0();
  v5 = self;
  sub_1A2B9B16C(v4);

  swift_bridgeObjectRelease();
}

- (SiriAnalyticsMessageProcessingStrategy)init
{
}

- (void).cxx_destruct
{
}

@end