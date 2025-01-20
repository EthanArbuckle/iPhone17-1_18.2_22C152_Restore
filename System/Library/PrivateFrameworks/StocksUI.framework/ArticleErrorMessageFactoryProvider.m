@interface ArticleErrorMessageFactoryProvider
- (_TtC8StocksUI34ArticleErrorMessageFactoryProvider)init;
- (id)errorMessageForArticleView;
- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3;
@end

@implementation ArticleErrorMessageFactoryProvider

- (_TtC8StocksUI34ArticleErrorMessageFactoryProvider)init
{
  result = (_TtC8StocksUI34ArticleErrorMessageFactoryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8StocksUI34ArticleErrorMessageFactoryProvider_reachability));
}

- (id)errorMessageForArticleView
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI34ArticleErrorMessageFactoryProvider_reachability);
  v3 = self;
  id v4 = sub_20A48497C((uint64_t)objc_msgSend(v2, sel_offlineReason));

  return v4;
}

- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  id v3 = sub_20A48497C(a3);

  return v3;
}

@end