@interface TagFeedServiceConfigPrefetcher
- (_TtC7NewsUI230TagFeedServiceConfigPrefetcher)init;
- (void)revisitSuspendedState;
@end

@implementation TagFeedServiceConfigPrefetcher

- (void)revisitSuspendedState
{
  *(void *)(swift_allocObject() + 16) = self;
  v3 = self;
  sub_1DFDEE310();

  swift_release();
}

- (_TtC7NewsUI230TagFeedServiceConfigPrefetcher)init
{
  result = (_TtC7NewsUI230TagFeedServiceConfigPrefetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230TagFeedServiceConfigPrefetcher_formatService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230TagFeedServiceConfigPrefetcher_assetHandleFactory);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI230TagFeedServiceConfigPrefetcher_interest);
}

@end