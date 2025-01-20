@interface CHAwardsDataProvider
- (CHAwardsDataProvider)init;
- (id)achievementsForWorkoutIdentifier:(id)a3;
@end

@implementation CHAwardsDataProvider

- (CHAwardsDataProvider)init
{
  result = (CHAwardsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)achievementsForWorkoutIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10007E4EC((Class *)((char *)&self->super.isa + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider), *(void *)&self->awardsDataProvider[OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider + 16]);
  v4 = self;
  dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)();

  swift_bridgeObjectRelease();
  sub_10022242C();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

@end