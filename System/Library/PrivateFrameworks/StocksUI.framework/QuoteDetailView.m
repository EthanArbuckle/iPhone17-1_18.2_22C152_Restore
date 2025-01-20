@interface QuoteDetailView
- (_TtC8StocksUI15QuoteDetailView)initWithCoder:(id)a3;
- (_TtC8StocksUI15QuoteDetailView)initWithFrame:(CGRect)a3;
@end

@implementation QuoteDetailView

- (_TtC8StocksUI15QuoteDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI15QuoteDetailView *)sub_20A6DF4E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI15QuoteDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A6DFEB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI15QuoteDetailView_attributionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI15QuoteDetailView_attributionButton));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end