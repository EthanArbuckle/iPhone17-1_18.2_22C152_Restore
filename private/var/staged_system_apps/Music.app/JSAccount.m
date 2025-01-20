@interface JSAccount
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (int64_t)hash;
@end

@implementation JSAccount

- (NSString)description
{
  v2 = self;
  JSAccount.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
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
  char v6 = JSAccount.isEqual(_:)((uint64_t)v8);

  sub_1000637B8((uint64_t)v8, (uint64_t *)&unk_10109BF40);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = String.hashValue.getter();

  return v3;
}

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore9JSAccount_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end