@interface StockView
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (NSString)tsaxAccessibilityLabelForReordering;
- (_TtC8StocksUI9StockView)initWithCoder:(id)a3;
- (_TtC8StocksUI9StockView)initWithFrame:(CGRect)a3;
@end

@implementation StockView

- (_TtC8StocksUI9StockView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI9StockView *)sub_20A747BE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI9StockView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A74A3CC();
}

- (void).cxx_destruct
{
  swift_release();
  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI9StockView_makeAccessibilityCustomActions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI9StockView_accessibilityPriceString));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_20A749F30();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)tsaxAccessibilityLabelForReordering
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI9StockView_companyLabel);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_20A8CE280();

    v6 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }

  return (NSString *)v6;
}

@end