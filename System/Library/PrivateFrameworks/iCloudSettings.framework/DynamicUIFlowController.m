@interface DynamicUIFlowController
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (_TtC14iCloudSettings23DynamicUIFlowController)init;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
@end

@implementation DynamicUIFlowController

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_262A8231C(a4, a5);
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  return sub_262A82A3C() & 1;
}

- (_TtC14iCloudSettings23DynamicUIFlowController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings23DynamicUIFlowController_dynamicUI) = 0;
  *(void *)&self->dynamicUI[OBJC_IVAR____TtC14iCloudSettings23DynamicUIFlowController_flowCompletionDelegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicUIFlowController();
  return [(DynamicUIFlowController *)&v4 init];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings23DynamicUIFlowController_flowCompletionDelegate;

  sub_262A4A318((uint64_t)v3);
}

@end