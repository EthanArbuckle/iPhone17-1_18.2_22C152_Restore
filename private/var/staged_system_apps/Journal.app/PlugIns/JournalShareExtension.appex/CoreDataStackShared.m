@interface CoreDataStackShared
- (_TtC21JournalShareExtension19CoreDataStackShared)init;
@end

@implementation CoreDataStackShared

- (_TtC21JournalShareExtension19CoreDataStackShared)init
{
  result = (_TtC21JournalShareExtension19CoreDataStackShared *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC21JournalShareExtension19CoreDataStackShared_sessionID;
  uint64_t v4 = sub_1001094F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_1000192F8((uint64_t)self + OBJC_IVAR____TtC21JournalShareExtension19CoreDataStackShared_customBundleURL);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21JournalShareExtension19CoreDataStackShared_container);
}

@end