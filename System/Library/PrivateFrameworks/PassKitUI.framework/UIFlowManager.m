@interface UIFlowManager
- (_TtC9PassKitUI13UIFlowManager)init;
- (void)rendererDidDisappearWithRenderer:(id)a3;
- (void)rendererDidRunOutOfContentWithRenderer:(id)a3;
@end

@implementation UIFlowManager

- (_TtC9PassKitUI13UIFlowManager)init
{
  result = (_TtC9PassKitUI13UIFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_parentRenderer);
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_resultHandler));
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_onViewLoaded));
  swift_release();
  swift_release();
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_completion));

  swift_bridgeObjectRelease();
}

- (void)rendererDidRunOutOfContentWithRenderer:(id)a3
{
}

- (void)rendererDidDisappearWithRenderer:(id)a3
{
}

@end