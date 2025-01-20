@interface BTUserTransaction
- (NSString)description;
- (_TtC15audioaccessoryd17BTUserTransaction)init;
- (void)dealloc;
@end

@implementation BTUserTransaction

- (void)dealloc
{
  v2 = self;
  BTUserTransaction.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC15audioaccessoryd17BTUserTransaction)init
{
  result = (_TtC15audioaccessoryd17BTUserTransaction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  swift_bridgeObjectRetain();
  v3 = self;
  sub_1000AA024(&qword_1002632D0);
  v4._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 93;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

@end