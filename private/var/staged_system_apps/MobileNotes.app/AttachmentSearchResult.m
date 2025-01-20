@interface AttachmentSearchResult
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (_TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult)init;
- (int64_t)hash;
@end

@implementation AttachmentSearchResult

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
  type metadata accessor for AttachmentID();
  sub_10029F7BC(&qword_10069EEF8, (void (*)(uint64_t))&type metadata accessor for AttachmentID);
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
  char v6 = sub_100291A44((uint64_t)v8);

  sub_10002B754((uint64_t)v8, &qword_10069B4D0);
  return v6 & 1;
}

- (_TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult)init
{
  result = (_TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_id;
  uint64_t v3 = type metadata accessor for AttachmentID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end