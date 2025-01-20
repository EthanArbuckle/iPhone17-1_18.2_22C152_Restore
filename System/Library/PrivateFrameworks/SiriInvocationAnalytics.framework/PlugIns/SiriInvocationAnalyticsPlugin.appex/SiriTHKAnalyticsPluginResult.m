@interface SiriTHKAnalyticsPluginResult
+ (NSString)numTHKEventsKey;
+ (NSString)thkEventSummariesKey;
- (NSDictionary)thkEventSummaries;
- (_TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult)init;
- (int64_t)numTHKEvents;
- (void)setNumTHKEvents:(int64_t)a3;
- (void)setThkEventSummaries:(id)a3;
@end

@implementation SiriTHKAnalyticsPluginResult

+ (NSString)numTHKEventsKey
{
  sub_10000647C();
  NSString v2 = sub_1000085D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)thkEventSummariesKey
{
  static SiriTHKAnalyticsPluginResult.thkEventSummariesKey.getter();
  NSString v2 = sub_1000085D0();
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
  sub_10000414C(&qword_100011978);
  v2.super.isa = sub_1000085B0().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setThkEventSummaries:(id)a3
{
  sub_10000414C(&qword_100011978);
  uint64_t v4 = sub_1000085C0();
  v5 = self;
  sub_10000627C(v4);
}

- (_TtC29SiriInvocationAnalyticsPlugin28SiriTHKAnalyticsPluginResult)init
{
}

- (void).cxx_destruct
{
}

@end