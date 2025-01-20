@interface SiriTHKAnalyticsPluginResult
+ (NSString)numTHKEventsKey;
+ (NSString)thkEventSummariesKey;
- (NSDictionary)thkEventSummaries;
- (_TtC23SiriInvocationAnalytics28SiriTHKAnalyticsPluginResult)init;
- (int64_t)numTHKEvents;
- (void)setNumTHKEvents:(int64_t)a3;
- (void)setThkEventSummaries:(id)a3;
@end

@implementation SiriTHKAnalyticsPluginResult

+ (NSString)numTHKEventsKey
{
  OUTLINED_FUNCTION_2_29();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)thkEventSummariesKey
{
  static SiriTHKAnalyticsPluginResult.thkEventSummariesKey.getter();
  v2 = (void *)sub_25CA45978();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)numTHKEvents
{
  return SiriTHKAnalyticsPluginResult.numTHKEvents.getter();
}

- (void)setNumTHKEvents:(int64_t)a3
{
}

- (NSDictionary)thkEventSummaries
{
  SiriTHKAnalyticsPluginResult.thkEventSummaries.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1AE0);
  v2 = (void *)sub_25CA45868();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setThkEventSummaries:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1AE0);
  uint64_t v4 = sub_25CA45878();
  v5 = self;
  sub_25CA3E5A4(v4);
}

- (_TtC23SiriInvocationAnalytics28SiriTHKAnalyticsPluginResult)init
{
}

- (void).cxx_destruct
{
}

@end