@interface ArticleListeningProgressManager
- (_TtC12NewsArticles31ArticleListeningProgressManager)init;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
@end

@implementation ArticleListeningProgressManager

- (_TtC12NewsArticles31ArticleListeningProgressManager)init
{
  result = (_TtC12NewsArticles31ArticleListeningProgressManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles31ArticleListeningProgressManager_readingHistory));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31ArticleListeningProgressManager_paidBundleConfigManager);
  swift_release();
  swift_unknownObjectRelease();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1BF4A9C68();
  uint64_t v6 = sub_1BF7E38A8();
  id v7 = a3;
  v8 = self;
  sub_1BF7B3A14(v6);

  swift_bridgeObjectRelease();
}

@end