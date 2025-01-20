@interface ArticleAdLayoutProcessor
- (_TtC12NewsArticles24ArticleAdLayoutProcessor)init;
- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5;
@end

@implementation ArticleAdLayoutProcessor

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1BF4F3530(v9, v10);
}

- (_TtC12NewsArticles24ArticleAdLayoutProcessor)init
{
  result = (_TtC12NewsArticles24ArticleAdLayoutProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24ArticleAdLayoutProcessor_bannerAdRequesterFactory);
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles24ArticleAdLayoutProcessor_layoutEnvironment;
  uint64_t v4 = sub_1BF7E15A8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end