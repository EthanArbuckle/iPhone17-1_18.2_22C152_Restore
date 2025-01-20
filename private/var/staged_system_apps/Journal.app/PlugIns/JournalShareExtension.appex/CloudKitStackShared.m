@interface CloudKitStackShared
- (_TtC21JournalShareExtension19CloudKitStackShared)init;
@end

@implementation CloudKitStackShared

- (_TtC21JournalShareExtension19CloudKitStackShared)init
{
  result = (_TtC21JournalShareExtension19CloudKitStackShared *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100008508(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21JournalShareExtension19CloudKitStackShared_inMemoryMetadata), *(void *)&self->inMemoryMetadata[OBJC_IVAR____TtC21JournalShareExtension19CloudKitStackShared_inMemoryMetadata]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension19CloudKitStackShared_ckContainer));

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21JournalShareExtension19CloudKitStackShared_sharedUploadRecordQueue);
}

@end