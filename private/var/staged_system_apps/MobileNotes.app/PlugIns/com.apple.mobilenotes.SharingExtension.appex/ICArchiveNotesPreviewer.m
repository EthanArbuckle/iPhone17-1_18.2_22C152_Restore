@interface ICArchiveNotesPreviewer
- (_TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer)init;
- (id)initForArchiveAt:(id)a3 error:(id *)a4;
@end

@implementation ICArchiveNotesPreviewer

- (id)initForArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1000B6F10();
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B6EE0();
  return (id)ICArchiveNotesPreviewer.init(forArchiveAt:)((uint64_t)v6);
}

- (_TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer)init
{
  result = (_TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end