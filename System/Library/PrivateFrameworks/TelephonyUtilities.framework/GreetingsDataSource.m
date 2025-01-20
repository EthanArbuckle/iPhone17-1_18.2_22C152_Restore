@interface GreetingsDataSource
- (_TtC13callservicesd19GreetingsDataSource)init;
- (_TtC13callservicesd19GreetingsDataSource)initWith:(id)a3 speechAssetManager:(id)a4;
- (void)assetsUpdated;
- (void)client:(id)a3 capabilitiesDidChange:(id)a4;
- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5;
- (void)handleVMAccountsDidChange;
- (void)subscriptionsDidChangeForClient:(id)a3;
@end

@implementation GreetingsDataSource

- (_TtC13callservicesd19GreetingsDataSource)initWith:(id)a3 speechAssetManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_10038121C();
  return result;
}

- (_TtC13callservicesd19GreetingsDataSource)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd19GreetingsDataSource_greetingsChecksums);
  swift_unknownObjectRelease();
  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd19GreetingsDataSource_voicemailManager);
  swift_release();
  type metadata accessor for LanguageManager();
  sub_10020233C();
  sub_1001F7664();
  v3();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd19GreetingsDataSource_speechAssetManager);
}

- (void)subscriptionsDidChangeForClient:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100388B8C();
  swift_unknownObjectRelease();
}

- (void)client:(id)a3 capabilitiesDidChange:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)handleVMAccountsDidChange
{
  v2 = self;
  sub_10038DE44();
}

- (void)assetsUpdated
{
  v2 = self;
  sub_10038DE44();
}

@end