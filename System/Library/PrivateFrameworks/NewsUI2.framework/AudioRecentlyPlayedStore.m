@interface AudioRecentlyPlayedStore
- (_TtC7NewsUI224AudioRecentlyPlayedStore)init;
- (uint64_t)readingHistory:(void *)a3 didRemoveArticlesWithIDs:;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
@end

@implementation AudioRecentlyPlayedStore

- (_TtC7NewsUI224AudioRecentlyPlayedStore)init
{
  result = (_TtC7NewsUI224AudioRecentlyPlayedStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224AudioRecentlyPlayedStore_headlineService);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI224AudioRecentlyPlayedStore_paidBundleConfigManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4 = a3;
  v5 = self;
  swift_retain();
  sub_1DFDECF60();

  swift_release();
}

- (uint64_t)readingHistory:(void *)a3 didRemoveArticlesWithIDs:
{
  id v4 = a3;
  id v5 = a1;
  swift_retain();
  sub_1DFDECF60();

  return swift_release();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1DE919914(0, (unint64_t *)&qword_1EBABB070);
  sub_1DFDFDAF0();
  id v6 = a3;
  v7 = self;
  sub_1DFB415E8();

  swift_bridgeObjectRelease();
}

@end