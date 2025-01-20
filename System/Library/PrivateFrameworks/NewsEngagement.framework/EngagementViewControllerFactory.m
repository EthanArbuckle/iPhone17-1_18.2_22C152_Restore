@interface EngagementViewControllerFactory
- (BOOL)messageViewControllerDidEnqueueImpression:(id)a3;
- (_TtC14NewsEngagement31EngagementViewControllerFactory)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
@end

@implementation EngagementViewControllerFactory

- (_TtC14NewsEngagement31EngagementViewControllerFactory)init
{
  return (_TtC14NewsEngagement31EngagementViewControllerFactory *)EngagementViewControllerFactory.init()();
}

- (void).cxx_destruct
{
  sub_1BF8EC74C((uint64_t)self + OBJC_IVAR____TtC14NewsEngagement31EngagementViewControllerFactory_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  EngagementViewControllerFactory.messageViewController(_:didSelectActionWith:)((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1BF8FBDCC(a4);
}

- (BOOL)messageViewControllerDidEnqueueImpression:(id)a3
{
  id v4 = a3;
  v5 = self;
  EngagementViewControllerFactory.messageViewControllerDidEnqueueImpression(_:)(v4);

  return 1;
}

@end