@interface AgeRatingBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore18AgeRatingBadgeView)initWithCoder:(id)a3;
- (_TtC8AppStore18AgeRatingBadgeView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation AgeRatingBadgeView

- (_TtC8AppStore18AgeRatingBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18AgeRatingBadgeView *)sub_1005D2BCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore18AgeRatingBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D3C90();
}

- (void)tintColorDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_ageLabel);
  v4 = self;
  id v3 = [(AgeRatingBadgeView *)v4 tintColor];
  [v2 setTextColor:v3];

  [(AgeRatingBadgeView *)v4 setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_1005D3404(x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1005D36F4(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v2 = (char *)v11.receiver;
  [(AgeRatingBadgeView *)&v11 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_ageLabel];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 sizeThatFits:v4, v5, [v11 receiver], [v11 super_class]];
  double v7 = v6;
  double v9 = v8;
  LayoutMarginsAware<>.layoutFrame.getter();
  CGFloat v10 = CGRectGetMidX(v12) - v7 * 0.5;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:CGRectMake(v10, CGRectGetMidY(v13) - v9 * 0.5, v7, v9)];
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_scalableCornerRadius;
  uint64_t v4 = type metadata accessor for StaticDimension();
  double v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_scalableHeight, v4);
  v5((char *)self + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_scalableHorizontalPadding, v4);
  v5((char *)self + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_scalableBorderWidth, v4);
  double v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18AgeRatingBadgeView_ageLabel);
}

@end