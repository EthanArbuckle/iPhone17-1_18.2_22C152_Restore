@interface ProvisioningPasscodeUpgradeFlowItem
- (_TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem)init;
- (id)topViewController;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningPasscodeUpgradeFlowItem

- (_TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem)init
{
  result = (_TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_passcodeController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningPasscodeUpgradeFlowItem_reporter);
}

- (id)topViewController
{
  v2 = self;
  v3 = sub_19FC29A68();

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_19FC29C14((uint64_t)v6, a4);
}

@end