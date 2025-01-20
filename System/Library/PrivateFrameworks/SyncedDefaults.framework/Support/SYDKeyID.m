@interface SYDKeyID
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)storeIdentifier;
- (_TtC13syncdefaultsd8SYDKeyID)init;
- (_TtC13syncdefaultsd8SYDKeyID)initWithKey:(id)a3 storeIdentifier:(id)a4;
- (int64_t)hash;
@end

@implementation SYDKeyID

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

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
  char v6 = SYDKeyID.isEqual(_:)((uint64_t)v8);

  sub_100003C14((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_1000043D0();
  v3 = self;
  uint64_t v4 = StringProtocol.hash.getter();
  uint64_t v5 = StringProtocol.hash.getter();

  return v5 ^ v4;
}

- (NSString)storeIdentifier
{
  return (NSString *)sub_10000C044();
}

- (NSString)key
{
  return (NSString *)sub_10000C044();
}

- (_TtC13syncdefaultsd8SYDKeyID)initWithKey:(id)a3 storeIdentifier:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SYDKeyID();
  return [(SYDKeyID *)&v13 init];
}

- (NSString)description
{
  v2 = self;
  SYDKeyID.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC13syncdefaultsd8SYDKeyID)init
{
  result = (_TtC13syncdefaultsd8SYDKeyID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end