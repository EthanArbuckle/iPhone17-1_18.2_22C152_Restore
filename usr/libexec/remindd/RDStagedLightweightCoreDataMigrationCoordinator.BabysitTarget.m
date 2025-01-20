@interface RDStagedLightweightCoreDataMigrationCoordinator.BabysitTarget
- (_TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget)init;
- (id)waiterID;
@end

@implementation RDStagedLightweightCoreDataMigrationCoordinator.BabysitTarget

- (id)waiterID
{
  v2 = self;
  _StringGuts.grow(_:)(79);
  v3._object = (void *)0x80000001007D2B10;
  v3._countAndFlagsBits = 0xD00000000000004DLL;
  String.append(_:)(v3);
  v4._countAndFlagsBits = URL.path.getter();
  String.append(_:)(v4);

  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget)init
{
  result = (_TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC7remindd47RDStagedLightweightCoreDataMigrationCoordinatorP33_D88389F778BE955B340162F613733C4913BabysitTarget_storeURL;
  uint64_t v3 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end