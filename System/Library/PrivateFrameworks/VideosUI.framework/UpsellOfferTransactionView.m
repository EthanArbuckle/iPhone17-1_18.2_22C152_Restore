@interface UpsellOfferTransactionView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI26UpsellOfferTransactionView)initWithCoder:(id)a3;
- (_TtC8VideosUI26UpsellOfferTransactionView)initWithFrame:(CGRect)a3;
@end

@implementation UpsellOfferTransactionView

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1E30B6F00(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  double v7 = self;
  sub_1E30B7430(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.CGFloat height = v13;
  result.double width = v12;
  return result;
}

- (_TtC8VideosUI26UpsellOfferTransactionView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26UpsellOfferTransactionView *)sub_1E30B74FC();
}

- (_TtC8VideosUI26UpsellOfferTransactionView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI26UpsellOfferTransactionView *)sub_1E30B75CC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UpsellOfferTransactionView_disclaimerLabel));
  swift_bridgeObjectRelease();
}

@end