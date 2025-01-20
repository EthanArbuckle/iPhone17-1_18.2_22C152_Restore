@interface StockSectionFooterView
- (CGRect)accessibilityFrame;
- (_TtC8StocksUI22StockSectionFooterView)initWithCoder:(id)a3;
- (_TtC8StocksUI22StockSectionFooterView)initWithFrame:(CGRect)a3;
@end

@implementation StockSectionFooterView

- (_TtC8StocksUI22StockSectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI22StockSectionFooterView *)sub_20A7D14F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI22StockSectionFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A7D1AF8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_moreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_symbolLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_arrowShapeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_topLineView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_onTap);
}

- (CGRect)accessibilityFrame
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_moreLabel);
  id v3 = self;
  objc_msgSend(v2, sel_accessibilityFrame);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_symbolLabel), sel_accessibilityFrame);
  v37.origin.CGFloat x = v12;
  v37.origin.CGFloat y = v13;
  v37.size.CGFloat width = v14;
  v37.size.CGFloat height = v15;
  v32.origin.CGFloat x = v5;
  v32.origin.CGFloat y = v7;
  v32.size.CGFloat width = v9;
  v32.size.CGFloat height = v11;
  CGRect v33 = CGRectUnion(v32, v37);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI22StockSectionFooterView_arrowShapeView), sel_accessibilityFrame);
  v38.origin.CGFloat x = v20;
  v38.origin.CGFloat y = v21;
  v38.size.CGFloat width = v22;
  v38.size.CGFloat height = v23;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectUnion(v34, v38);
  CGFloat v24 = v35.origin.x;
  CGFloat v25 = v35.origin.y;
  CGFloat v26 = v35.size.width;
  CGFloat v27 = v35.size.height;

  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

@end