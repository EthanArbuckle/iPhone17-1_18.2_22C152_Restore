@interface ConstraintUsageMetricsManager
- (_TtC5amfid29ConstraintUsageMetricsManager)init;
- (void)clean;
- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6;
- (void)report;
@end

@implementation ConstraintUsageMetricsManager

- (_TtC5amfid29ConstraintUsageMetricsManager)init
{
  return (_TtC5amfid29ConstraintUsageMetricsManager *)ConstraintUsageMetricsManager.init()();
}

- (void)recordWithSigningIdentifier:(id)a3 teamIdentifier:(id)a4 validationCategory:(int64_t)a5 constraintType:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  v15 = self;
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  v17._countAndFlagsBits = v12;
  v17._object = v14;
  ConstraintUsageMetricsManager.record(signingIdentifier:teamIdentifier:validationCategory:constraintType:)(v16, v17, a5, a6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)report
{
  v2 = self;
  ConstraintUsageMetricsManager.report()();
}

- (void)clean
{
  v2 = self;
  ConstraintUsageMetricsManager.clean()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end