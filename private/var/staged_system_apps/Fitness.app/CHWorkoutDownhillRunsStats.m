@interface CHWorkoutDownhillRunsStats
- (CHWorkoutDownhillRunsStats)init;
- (CHWorkoutDownhillRunsStats)initWithDownhillRunBridges:(id)a3;
- (CHWorkoutDownhillRunsStats)initWithDownhillRuns:(id)a3;
- (HKQuantity)averageHeartRate;
- (HKQuantity)averageSpeed;
- (HKQuantity)distance;
- (HKQuantity)elevationAscended;
- (HKQuantity)elevationDescended;
- (HKQuantity)maximumSpeed;
- (double)duration;
- (int64_t)runsCount;
@end

@implementation CHWorkoutDownhillRunsStats

- (HKQuantity)maximumSpeed
{
  v2 = self;
  v3 = (void *)DownhillRunsStats.maximumSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationAscended
{
  v2 = self;
  v3 = (void *)DownhillRunsStats.elevationAscended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationDescended
{
  v2 = self;
  v3 = (void *)DownhillRunsStats.elevationDescended.getter();

  return (HKQuantity *)v3;
}

- (int64_t)runsCount
{
  v2 = self;
  int64_t v3 = DownhillRunsStats.runsCount.getter();

  return v3;
}

- (HKQuantity)averageHeartRate
{
  v2 = self;
  int64_t v3 = (void *)DownhillRunsStats.averageHeartRate.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)averageSpeed
{
  v2 = self;
  int64_t v3 = (void *)DownhillRunsStats.averageSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)distance
{
  v2 = self;
  int64_t v3 = (void *)DownhillRunsStats.distance.getter();

  return (HKQuantity *)v3;
}

- (double)duration
{
  v2 = self;
  DownhillRunsStats.duration.getter();
  double v4 = v3;

  return v4;
}

- (CHWorkoutDownhillRunsStats)initWithDownhillRuns:(id)a3
{
  type metadata accessor for DownhillRun();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for DownhillRunsStats();
  swift_allocObject();
  double v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CHWorkoutDownhillRunsStats_downhillRunsStats) = (Class)DownhillRunsStats.init(downhillRuns:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DownhillRunsStatsBridge();
  return [(CHWorkoutDownhillRunsStats *)&v6 init];
}

- (CHWorkoutDownhillRunsStats)initWithDownhillRunBridges:(id)a3
{
  type metadata accessor for DownhillRunBridge();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CHWorkoutDownhillRunsStats *)sub_100330E80(v3);
}

- (CHWorkoutDownhillRunsStats)init
{
  result = (CHWorkoutDownhillRunsStats *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end