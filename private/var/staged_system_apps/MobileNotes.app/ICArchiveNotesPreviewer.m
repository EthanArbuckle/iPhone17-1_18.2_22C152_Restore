@interface ICArchiveNotesPreviewer
- (_TtC11MobileNotes23ICArchiveNotesPreviewer)init;
- (id)initForArchiveAt:(id)a3 error:(id *)a4;
@end

@implementation ICArchiveNotesPreviewer

- (id)initForArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (id)ICArchiveNotesPreviewer.init(forArchiveAt:)((uint64_t)v6);
}

- (_TtC11MobileNotes23ICArchiveNotesPreviewer)init
{
  result = (_TtC11MobileNotes23ICArchiveNotesPreviewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end