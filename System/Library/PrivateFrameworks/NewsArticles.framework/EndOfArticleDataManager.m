@interface EndOfArticleDataManager
- (_TtC12NewsArticles23EndOfArticleDataManager)init;
@end

@implementation EndOfArticleDataManager

- (_TtC12NewsArticles23EndOfArticleDataManager)init
{
  result = (_TtC12NewsArticles23EndOfArticleDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23EndOfArticleDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23EndOfArticleDataManager_articleRecirculationService);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

@end