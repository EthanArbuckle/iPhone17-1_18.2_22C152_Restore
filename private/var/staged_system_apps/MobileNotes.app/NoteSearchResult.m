@interface NoteSearchResult
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)folderManagedIdentifier;
- (NSString)folderName;
- (NSString)title;
- (_TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult)init;
- (int64_t)hash;
@end

@implementation NoteSearchResult

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDate)creationDate
{
  return (NSDate *)sub_10022E090((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_creationDate);
}

- (NSDate)modificationDate
{
  return (NSDate *)sub_10022E090((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_modificationDate);
}

- (NSString)folderName
{
  return (NSString *)sub_10022E1D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderName);
}

- (NSString)folderManagedIdentifier
{
  return (NSString *)sub_10022E1D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderManagedIdentifier);
}

- (int64_t)hash
{
  NSString v2 = self;
  Swift::Int v3 = sub_10022E270();

  return v3;
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
  char v6 = sub_10022E674((uint64_t)v8);

  sub_10002B754((uint64_t)v8, &qword_10069B4D0);
  return v6 & 1;
}

- (_TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult)init
{
  result = (_TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  Swift::Int v3 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_id;
  uint64_t v4 = type metadata accessor for NoteID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_creationDate, (uint64_t *)&unk_1006A3E20);
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_modificationDate, (uint64_t *)&unk_1006A3E20);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end