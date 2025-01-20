@interface UserEngagementStatsAnalyticsPluginResult
- (NSArray)accumulatedAggregationStats;
- (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats)dailyAggregatedStats;
- (_TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult)init;
- (void)setAccumulatedAggregationStats:(id)a3;
- (void)setDailyAggregatedStats:(id)a3;
@end

@implementation UserEngagementStatsAnalyticsPluginResult

- (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats)dailyAggregatedStats
{
  v2 = UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.getter();
  return (_TtC23SiriInvocationAnalytics27AccumulatedAggregationStats *)v2;
}

- (void)setDailyAggregatedStats:(id)a3
{
  id v5 = a3;
  v6 = self;
  UserEngagementStatsAnalyticsPluginResult.dailyAggregatedStats.setter(a3);
}

- (NSArray)accumulatedAggregationStats
{
  return (NSArray *)sub_25C9FF534((uint64_t)self, (uint64_t)a2, (void (*)(void))UserEngagementStatsAnalyticsPluginResult.accumulatedAggregationStats.getter, (void (*)(void))type metadata accessor for AccumulatedAggregationStats);
}

- (void)setAccumulatedAggregationStats:(id)a3
{
}

- (_TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SiriInvocationAnalytics40UserEngagementStatsAnalyticsPluginResult_dailyAggregatedStats));
  swift_bridgeObjectRelease();
}

@end