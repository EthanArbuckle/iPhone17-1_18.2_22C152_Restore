@interface TabOverviewItemView.ClosingBackgroundView
- (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TabOverviewItemView.ClosingBackgroundView

- (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView *)sub_18C5C48BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView *)sub_18C5C4A00(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18C5C4B2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView____lazy_storage___blurRadius));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView21ClosingBackgroundView_backdropView);
}

@end