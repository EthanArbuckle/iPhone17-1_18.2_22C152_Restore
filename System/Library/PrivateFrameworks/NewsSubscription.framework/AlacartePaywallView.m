@interface AlacartePaywallView
- (_TtC16NewsSubscription19AlacartePaywallView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription19AlacartePaywallView)initWithFrame:(CGRect)a3;
@end

@implementation AlacartePaywallView

- (_TtC16NewsSubscription19AlacartePaywallView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription19AlacartePaywallView *)sub_1BFA6F1EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription19AlacartePaywallView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFA6F5CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_gradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_titleTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_webAuthButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_bottomHairline);
}

@end