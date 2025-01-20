@interface TodayDataManager
- (_TtC7NewsUI216TodayDataManager)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation TodayDataManager

- (_TtC7NewsUI216TodayDataManager)init
{
  result = (_TtC7NewsUI216TodayDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_sharedItemManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_bundleSessionManager);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_nativeAdService);
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_sportsOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_shortcutService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_puzzleStatsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_puzzleHistoryService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_offlineFeedPrimer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_offlineFeatures);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_shortcutsModule);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI216TodayDataManager_shortcutsPluginConfig);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 56);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v7 = a3;
  id v8 = self;
  sub_1DF590088(v7);
}

@end