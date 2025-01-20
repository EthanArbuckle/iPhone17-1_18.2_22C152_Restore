@interface BundlePaywallPlayerView
+ (Class)layerClass;
- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation BundlePaywallPlayerView

+ (Class)layerClass
{
  sub_1BFADEB00();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription23BundlePaywallPlayerView *)sub_1BFADE474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16NewsSubscription23BundlePaywallPlayerView_displayStateCoordinator;
  sub_1BFBD4548();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BFBD4538();

  result = (_TtC16NewsSubscription23BundlePaywallPlayerView *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BundlePaywallPlayerView();
  id v2 = v3.receiver;
  [(BundlePaywallPlayerView *)&v3 didMoveToWindow];
  sub_1BFBD44F8();
}

- (void).cxx_destruct
{
}

@end