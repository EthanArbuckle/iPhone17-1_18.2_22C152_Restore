@interface EngagementInlineViewManager
- (_TtC14NewsEngagement27EngagementInlineViewManager)init;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
@end

@implementation EngagementInlineViewManager

- (_TtC14NewsEngagement27EngagementInlineViewManager)init
{
  result = (_TtC14NewsEngagement27EngagementInlineViewManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14NewsEngagement27EngagementInlineViewManager_engagementBannerLayoutStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14NewsEngagement27EngagementInlineViewManager_inlineDialogViewControllerFactory);
  swift_unknownObjectRelease();
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = self;
  EngagementInlineViewManager.messageViewController(_:didUpdate:)(v7, width, height);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  EngagementInlineViewManager.messageViewController(_:didSelectActionWith:)(v6, v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  EngagementInlineViewManager.messageViewController(_:didFailWithError:)(v6, a4);
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  EngagementInlineViewManager.messageViewController(_:didLoad:)(v6, v7);
}

@end