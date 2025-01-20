@interface AggregatedStats
- (NSString)modelVersion;
- (_TtC23SiriInvocationAnalytics15AggregatedStats)init;
- (double)intendedRequestRatio;
- (double)triggeredMechanismRequestRatio;
- (int64_t)intendedRequestCount;
- (int64_t)requestCount;
- (int64_t)triggeredMechanism;
- (int64_t)unintendedRequestCount;
- (void)setIntendedRequestCount:(int64_t)a3;
- (void)setIntendedRequestRatio:(double)a3;
- (void)setModelVersion:(id)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)setTriggeredMechanism:(int64_t)a3;
- (void)setTriggeredMechanismRequestRatio:(double)a3;
- (void)setUnintendedRequestCount:(int64_t)a3;
@end

@implementation AggregatedStats

- (int64_t)triggeredMechanism
{
  return AggregatedStats.triggeredMechanism.getter();
}

- (void)setTriggeredMechanism:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_7_16((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.triggeredMechanism.setter(v3);
}

- (int64_t)requestCount
{
  return AggregatedStats.requestCount.getter();
}

- (void)setRequestCount:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_7_16((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.requestCount.setter(v3);
}

- (int64_t)intendedRequestCount
{
  return AggregatedStats.intendedRequestCount.getter();
}

- (void)setIntendedRequestCount:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_7_16((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.intendedRequestCount.setter(v3);
}

- (int64_t)unintendedRequestCount
{
  return AggregatedStats.unintendedRequestCount.getter();
}

- (void)setUnintendedRequestCount:(int64_t)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_7_16((uint64_t)self, (uint64_t)a2, a3);
  AggregatedStats.unintendedRequestCount.setter(v3);
}

- (double)intendedRequestRatio
{
  return AggregatedStats.intendedRequestRatio.getter();
}

- (void)setIntendedRequestRatio:(double)a3
{
}

- (double)triggeredMechanismRequestRatio
{
  return AggregatedStats.triggeredMechanismRequestRatio.getter();
}

- (void)setTriggeredMechanismRequestRatio:(double)a3
{
}

- (NSString)modelVersion
{
  return (NSString *)sub_25C9FF6C0((uint64_t)self, (uint64_t)a2, (void (*)(void))AggregatedStats.modelVersion.getter);
}

- (void)setModelVersion:(id)a3
{
}

- (_TtC23SiriInvocationAnalytics15AggregatedStats)init
{
}

- (void).cxx_destruct
{
}

@end