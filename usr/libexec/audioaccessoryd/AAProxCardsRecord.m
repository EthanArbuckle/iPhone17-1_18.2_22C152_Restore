@interface AAProxCardsRecord
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd17AAProxCardsRecord)init;
@end

@implementation AAProxCardsRecord

- (NSString)description
{
  v2 = self;
  AAProxCardsRecord.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  NSString v3 = [(AAProxCardsRecord *)v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC15audioaccessoryd17AAProxCardsRecord)init
{
  result = (_TtC15audioaccessoryd17AAProxCardsRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000AA8F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata), *(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_cloudMetadata]);
  NSString v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd17AAProxCardsRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end