@interface PayLaterSetupViewController.Coordinator
- (_TtCV9PassKitUI27PayLaterSetupViewController11Coordinator)init;
- (void)payLaterSetupFlowController:(id)a3 didSelect:(id)a4;
- (void)payLaterSetupFlowController:(id)a3 didTerminateApplicationState:(unint64_t)a4;
- (void)payLaterSetupFlowControllerDidFinish:(id)a3;
@end

@implementation PayLaterSetupViewController.Coordinator

- (void)payLaterSetupFlowController:(id)a3 didSelect:(id)a4
{
  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_didSelectAction);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v6(a4);
}

- (void)payLaterSetupFlowController:(id)a3 didTerminateApplicationState:(unint64_t)a4
{
  v4 = *(void (**)(void))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_changeFundingModeTabAction);
  if (v4) {
    BOOL v5 = a4 == 7;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5
    && !*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_controllerContext))
  {
    id v7 = a3;
    id v8 = self;
    sub_19F48BAB4((uint64_t)v4);
    v4(0);
    sub_19F48BB68((uint64_t)v4);
  }
}

- (void)payLaterSetupFlowControllerDidFinish:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_19FD10E68();
}

- (_TtCV9PassKitUI27PayLaterSetupViewController11Coordinator)init
{
  result = (_TtCV9PassKitUI27PayLaterSetupViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_parent];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_parent + 24];
  swift_release();

  swift_release();
  sub_19F48BB68(v4);
  swift_release();
  swift_release();
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PayLaterSetupViewController11Coordinator_changeFundingModeTabAction));

  swift_release();
}

@end