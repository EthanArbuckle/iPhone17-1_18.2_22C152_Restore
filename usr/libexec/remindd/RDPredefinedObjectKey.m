@interface RDPredefinedObjectKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC7remindd21RDPredefinedObjectKey)init;
- (int64_t)hash;
@end

@implementation RDPredefinedObjectKey

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_10067CC90((uint64_t)v8);

  sub_1000F5B8C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  uint64_t v3 = NSObject.hashValue.getter();
  uint64_t v4 = NSObject.hashValue.getter();

  return v4 ^ v3;
}

- (NSString)description
{
  v2 = self;
  sub_10067CEE8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC7remindd21RDPredefinedObjectKey)init
{
  result = (_TtC7remindd21RDPredefinedObjectKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd21RDPredefinedObjectKey_objectID);
}

@end