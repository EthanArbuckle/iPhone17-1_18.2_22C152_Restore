@interface SiriTHKAnalyticsPluginResult
+ (NSString)numTHKEventsKey;
+ (NSString)thkEventSummariesKey;
- (NSDictionary)thkEventSummaries;
- (_TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult)init;
- (int64_t)numTHKEvents;
- (void)setNumTHKEvents:(int64_t)a3;
- (void)setThkEventSummaries:(id)a3;
@end

@implementation SiriTHKAnalyticsPluginResult

+ (NSString)numTHKEventsKey
{
  sub_100005464();
  NSString v2 = sub_100009290();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)thkEventSummariesKey
{
  static SiriTHKAnalyticsPluginResult.thkEventSummariesKey.getter();
  NSString v2 = sub_100009290();
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
  sub_100004DD4(&qword_100011070);
  v2.super.isa = sub_100009270().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setThkEventSummaries:(id)a3
{
  sub_100004DD4(&qword_100011070);
  uint64_t v4 = sub_100009280();
  v5 = self;
  sub_100005264(v4);
}

- (_TtC17THKOnDemandPlugin28SiriTHKAnalyticsPluginResult)init
{
}

- (void).cxx_destruct
{
}

@end