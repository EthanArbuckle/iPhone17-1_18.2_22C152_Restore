@interface AudioFeedContentPrefetcher
- (_TtC7NewsUI226AudioFeedContentPrefetcher)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
@end

@implementation AudioFeedContentPrefetcher

- (_TtC7NewsUI226AudioFeedContentPrefetcher)init
{
  result = (_TtC7NewsUI226AudioFeedContentPrefetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioFeedContentPrefetcher_feedConfigManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioFeedContentPrefetcher_formatService);
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v10[4] = sub_1DFC840E4;
  v10[5] = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1DE9744A8;
  v10[3] = &block_descriptor_194;
  v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_scheduleLowPriorityBlock_, v7);
  _Block_release(v7);
}

@end