@interface AccumulatedAggregationStats
- (NSArray)aggregationStats;
- (NSString)cohortType;
- (NSString)mitigationAssetVersion;
- (_TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats)init;
- (double)aggregationStartTimestamp;
- (double)intendedRequestRatio;
- (double)uesScore;
- (int)sdsdRetryCount;
- (int64_t)numberOfDaysAggregation;
- (void)setAggregationStartTimestamp:(double)a3;
- (void)setAggregationStats:(id)a3;
- (void)setCohortType:(id)a3;
- (void)setIntendedRequestRatio:(double)a3;
- (void)setMitigationAssetVersion:(id)a3;
- (void)setNumberOfDaysAggregation:(int64_t)a3;
- (void)setSdsdRetryCount:(int)a3;
- (void)setUesScore:(double)a3;
@end

@implementation AccumulatedAggregationStats

- (double)aggregationStartTimestamp
{
  return AccumulatedAggregationStats.aggregationStartTimestamp.getter();
}

- (void)setAggregationStartTimestamp:(double)a3
{
}

- (int64_t)numberOfDaysAggregation
{
  return AccumulatedAggregationStats.numberOfDaysAggregation.getter();
}

- (void)setNumberOfDaysAggregation:(int64_t)a3
{
  uint64_t v3 = sub_100005F28((uint64_t)self, (uint64_t)a2, a3);
  AccumulatedAggregationStats.numberOfDaysAggregation.setter(v3);
}

- (NSArray)aggregationStats
{
  return (NSArray *)sub_1000052E4((uint64_t)self, (uint64_t)a2, (void (*)(void))AccumulatedAggregationStats.aggregationStats.getter, (void (*)(void))type metadata accessor for AggregatedStats);
}

- (void)setAggregationStats:(id)a3
{
}

- (NSString)cohortType
{
  return (NSString *)sub_10000546C((uint64_t)self, (uint64_t)a2, (void (*)(void))AccumulatedAggregationStats.cohortType.getter);
}

- (void)setCohortType:(id)a3
{
}

- (double)intendedRequestRatio
{
  return AccumulatedAggregationStats.intendedRequestRatio.getter();
}

- (void)setIntendedRequestRatio:(double)a3
{
}

- (double)uesScore
{
  return AccumulatedAggregationStats.uesScore.getter();
}

- (void)setUesScore:(double)a3
{
}

- (NSString)mitigationAssetVersion
{
  return (NSString *)sub_10000546C((uint64_t)self, (uint64_t)a2, (void (*)(void))AccumulatedAggregationStats.mitigationAssetVersion.getter);
}

- (void)setMitigationAssetVersion:(id)a3
{
}

- (int)sdsdRetryCount
{
  return AccumulatedAggregationStats.sdsdRetryCount.getter();
}

- (void)setSdsdRetryCount:(int)a3
{
}

- (_TtC29SiriInvocationAnalyticsPlugin27AccumulatedAggregationStats)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end