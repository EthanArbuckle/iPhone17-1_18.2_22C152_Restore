@interface QuoteDetailViewRenderer
- (_TtC8StocksUI23QuoteDetailViewRenderer)init;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation QuoteDetailViewRenderer

- (_TtC8StocksUI23QuoteDetailViewRenderer)init
{
  result = (_TtC8StocksUI23QuoteDetailViewRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v8 = self;
  objc_msgSend(v4, sel_contentOffset);
  v5 = (char *)v8 + OBJC_IVAR____TtC8StocksUI23QuoteDetailViewRenderer_lastKnownContentOffset;
  *(void *)v5 = v6;
  *((void *)v5 + 1) = v7;
  v5[16] = 0;
}

@end