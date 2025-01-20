@interface AudioFeedDataManager
- (_TtC7NewsUI220AudioFeedDataManager)init;
- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingHistoryLikelyClearedRemotely:(id)a3;
@end

@implementation AudioFeedDataManager

- (_TtC7NewsUI220AudioFeedDataManager)init
{
  result = (_TtC7NewsUI220AudioFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_offlineFeedPrimer);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_offlineFeatures;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  sub_1DFDFE220();
  id v6 = a3;
  v7 = self;
  sub_1DF71E948(v6);

  swift_bridgeObjectRelease();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1DE919914(0, (unint64_t *)&qword_1EBABB070);
  sub_1DFDFDAF0();
  id v6 = a3;
  v7 = self;
  sub_1DF720EF8();

  swift_bridgeObjectRelease();
}

- (void)readingHistoryDidClear:(id)a3
{
}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  uint64_t v6 = MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_delegate, a2, a3, a4);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = a3;
    v9 = self;
    sub_1DF71F6D8((uint64_t)&unk_1F3A6A370, v7);

    swift_unknownObjectRelease();
  }
}

@end