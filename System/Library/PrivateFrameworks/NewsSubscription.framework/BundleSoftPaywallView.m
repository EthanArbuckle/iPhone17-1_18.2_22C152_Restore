@interface BundleSoftPaywallView
- (_TtC16NewsSubscription21BundleSoftPaywallView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription21BundleSoftPaywallView)initWithFrame:(CGRect)a3;
@end

@implementation BundleSoftPaywallView

- (_TtC16NewsSubscription21BundleSoftPaywallView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription21BundleSoftPaywallView *)sub_1BFB2906C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription21BundleSoftPaywallView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFB29548();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_headerImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_titleTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_offersButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription21BundleSoftPaywallView_webAuthButton);
}

@end