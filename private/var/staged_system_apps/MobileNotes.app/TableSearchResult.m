@interface TableSearchResult
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (_TtC11MobileNotesP33_3A26B74EEED685164DF9267FE58E345F17TableSearchResult)init;
- (int64_t)hash;
@end

@implementation TableSearchResult

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)hash
{
  Hasher.init()();
  type metadata accessor for TableID();
  sub_100019168(&qword_10069D3E0, (void (*)(uint64_t))&type metadata accessor for TableID);
  v3 = self;
  dispatch thunk of Hashable.hash(into:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v4 = Hasher.finalize()();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    Swift::Int v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1003E87B4((uint64_t)v8);

  sub_10002B754((uint64_t)v8, &qword_10069B4D0);
  return v6 & 1;
}

- (_TtC11MobileNotesP33_3A26B74EEED685164DF9267FE58E345F17TableSearchResult)init
{
  result = (_TtC11MobileNotesP33_3A26B74EEED685164DF9267FE58E345F17TableSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_3A26B74EEED685164DF9267FE58E345F17TableSearchResult_id;
  uint64_t v3 = type metadata accessor for TableID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end