@interface FMRecipient
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC6FindMy11FMRecipient)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation FMRecipient

- (id)copyWithZone:(void *)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for FMRecipient());
  v5 = self;
  id v6 = sub_1001C863C((uint64_t)v5);

  return v6;
}

- (int64_t)hash
{
  v2 = self;
  swift_bridgeObjectRetain();
  int64_t v3 = String.hashValue.getter();

  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1001C58D4((uint64_t)v8);

  sub_100067244((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_1001C6D64();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC6FindMy11FMRecipient)init
{
  result = (_TtC6FindMy11FMRecipient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy11FMRecipient_monogram);
}

@end