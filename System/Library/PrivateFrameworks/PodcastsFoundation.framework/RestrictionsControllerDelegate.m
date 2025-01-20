@interface RestrictionsControllerDelegate
- (_TtC18PodcastsFoundationP33_1BB6D7E8455315190AE4E4AB578E53C530RestrictionsControllerDelegate)init;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation RestrictionsControllerDelegate

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    sub_1ACE75FF8();
  }
  id v7 = a3;
  v6 = self;
  sub_1ACC6AC98();
  swift_bridgeObjectRelease();
}

- (_TtC18PodcastsFoundationP33_1BB6D7E8455315190AE4E4AB578E53C530RestrictionsControllerDelegate)init
{
  result = (_TtC18PodcastsFoundationP33_1BB6D7E8455315190AE4E4AB578E53C530RestrictionsControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end