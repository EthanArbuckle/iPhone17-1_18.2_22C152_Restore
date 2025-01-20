@interface SearchMoreDataManager
- (_TtC7NewsUI221SearchMoreDataManager)init;
@end

@implementation SearchMoreDataManager

- (_TtC7NewsUI221SearchMoreDataManager)init
{
  result = (_TtC7NewsUI221SearchMoreDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI221SearchMoreDataManager_delegate);
  sub_1DF51C008((uint64_t)self + OBJC_IVAR____TtC7NewsUI221SearchMoreDataManager_resultsStream);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221SearchMoreDataManager_headlineService);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221SearchMoreDataManager_accessQueue);
}

@end