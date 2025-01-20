@interface PaidBundleChangeNotificationModifier
- (_TtC7NewsUI236PaidBundleChangeNotificationModifier)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
@end

@implementation PaidBundleChangeNotificationModifier

- (_TtC7NewsUI236PaidBundleChangeNotificationModifier)init
{
  result = (_TtC7NewsUI236PaidBundleChangeNotificationModifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI236PaidBundleChangeNotificationModifier_notificationController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF7F3FD8();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF7F3788(1);
}

@end