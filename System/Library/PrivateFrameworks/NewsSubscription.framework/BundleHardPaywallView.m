@interface BundleHardPaywallView
- (CGRect)accessibilityFrame;
- (_TtC16NewsSubscription21BundleHardPaywallView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription21BundleHardPaywallView)initWithFrame:(CGRect)a3;
@end

@implementation BundleHardPaywallView

- (_TtC16NewsSubscription21BundleHardPaywallView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription21BundleHardPaywallView *)sub_1BFB02EC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription21BundleHardPaywallView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFB03410();
}

- (CGRect)accessibilityFrame
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_contentView), sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_playerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_titleTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_offersButton));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription21BundleHardPaywallView_webAuthButton);
}

@end