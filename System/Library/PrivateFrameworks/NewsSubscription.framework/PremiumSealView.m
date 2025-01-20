@interface PremiumSealView
- (_TtC16NewsSubscription15PremiumSealView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription15PremiumSealView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PremiumSealView

- (_TtC16NewsSubscription15PremiumSealView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription15PremiumSealView *)PremiumSealView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription15PremiumSealView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16NewsSubscription15PremiumSealViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BFABDF14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription15PremiumSealView_outerTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription15PremiumSealView_innerTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription15PremiumSealView_outerImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription15PremiumSealView_innerImageView);
}

@end