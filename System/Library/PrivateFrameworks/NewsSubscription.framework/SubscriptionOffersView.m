@interface SubscriptionOffersView
- (_TtC16NewsSubscription22SubscriptionOffersView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription22SubscriptionOffersView)initWithFrame:(CGRect)a3;
@end

@implementation SubscriptionOffersView

- (_TtC16NewsSubscription22SubscriptionOffersView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription22SubscriptionOffersView *)sub_1BFA70704(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription22SubscriptionOffersView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFA70BE4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_logoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_accessLabel1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_subscribeButton1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_accessLabel2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_subscribeButton2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_accessLabel3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_subscribeButton3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_webAuthButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription22SubscriptionOffersView_learnMoreLabel);
}

@end