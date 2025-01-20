@interface SearchFindMyHandle
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)id;
- (_TtC4Maps18SearchFindMyHandle)init;
- (id)handleIdentifier;
- (id)title;
- (int64_t)hash;
@end

@implementation SearchFindMyHandle

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (id)title
{
  NSUUID v2 = self;
  Handle.prettyName.getter();
  if (!v3) {
    Handle.identifier.getter();
  }

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)handleIdentifier
{
  NSUUID v2 = self;
  Handle.identifier.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100323B24(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps18SearchFindMyHandle_handle, (uint64_t (*)(char *, uint64_t))&static Handle.== infix(_:_:));
}

- (int64_t)hash
{
  NSUUID v2 = self;
  int64_t v3 = Handle.hashValue.getter();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_100323C0C(self, (uint64_t)a2, (void (*)(void))sub_1003237A4);
}

- (_TtC4Maps18SearchFindMyHandle)init
{
  result = (_TtC4Maps18SearchFindMyHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end