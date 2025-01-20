@interface SiriAnalyticsMessageStaging
- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)init;
- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)initWithInternalTelemetry:(id)a3;
- (void)bootstrapAndPruneWithCompletionHandler:(id)a3;
- (void)purgeWithCompletionHandler:(id)a3;
@end

@implementation SiriAnalyticsMessageStaging

- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)initWithInternalTelemetry:(id)a3
{
  return (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging *)SiriAnalyticsMessageStaging.init(internalTelemetry:)(a3);
}

- (void)bootstrapAndPruneWithCompletionHandler:(id)a3
{
}

- (void)purgeWithCompletionHandler:(id)a3
{
}

- (_TtC13SiriAnalytics27SiriAnalyticsMessageStaging)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end