@interface Migration
- (NSArray)uuids;
- (NSDate)date;
- (_TtC8Podcasts9Migration)init;
@end

@implementation Migration

- (NSDate)date
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;

  return (NSDate *)v2.super.isa;
}

- (NSArray)uuids
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (_TtC8Podcasts9Migration)init
{
  result = (_TtC8Podcasts9Migration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSArray v2 = (char *)self + OBJC_IVAR____TtC8Podcasts9Migration_date;
  uint64_t v3 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end