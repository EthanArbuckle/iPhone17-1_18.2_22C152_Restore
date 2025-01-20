@interface CHMindfulnessSessionsStatistics
- (CHMindfulnessSessionsStatistics)init;
- (CHMindfulnessSessionsStatistics)initWithSessionCount:(int64_t)a3 totalDuration:(double)a4;
- (id)formattedSessionCount;
- (id)formattedTotalDurationWithFormattingManager:(id)a3;
@end

@implementation CHMindfulnessSessionsStatistics

- (CHMindfulnessSessionsStatistics)initWithSessionCount:(int64_t)a3 totalDuration:(double)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_sessionCount) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_totalDuration) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MindfulnessSessionsStatistics();
  return [(CHMindfulnessSessionsStatistics *)&v5 init];
}

- (CHMindfulnessSessionsStatistics)init
{
  result = (CHMindfulnessSessionsStatistics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)formattedSessionCount
{
  v3 = self;
  v4 = self;
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  id v6 = [v3 stringWithNumber:isa decimalPrecision:1];

  if (v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)formattedTotalDurationWithFormattingManager:(id)a3
{
  double v4 = *(double *)((char *)&self->super.isa + OBJC_IVAR___CHMindfulnessSessionsStatistics_totalDuration);
  id v5 = a3;
  id v6 = self;
  id result = [v5 stringWithDuration:3 durationFormat:v4];
  if (result)
  {
    id v8 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end