@interface BuyButtonUIView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5Books15BuyButtonUIView)initWithCoder:(id)a3;
- (_TtC5Books15BuyButtonUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BuyButtonUIView

- (_TtC5Books15BuyButtonUIView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15BuyButtonUIView *)sub_10035DB7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15BuyButtonUIView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10035E140();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10035DDAC();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15BuyButtonUIView_button);
  id v3 = self;
  [v2 intrinsicContentSize];
  [v2 alignmentRectForFrame:0.0, 0.0, v4, v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15BuyButtonUIView_button);
  double v6 = self;
  [v5 sizeThatFits:width, height];
  [v5 alignmentRectForFrame:0.0, 0.0, v7, v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15BuyButtonUIView_spinner);
}

@end