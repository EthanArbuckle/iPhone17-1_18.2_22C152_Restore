@interface ProvisioningAutoReloadSetUpFlowItem
- (_TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem)init;
- (void)autoReloadSetupControllerDidCancel:(id)a3;
- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4;
@end

@implementation ProvisioningAutoReloadSetUpFlowItem

- (_TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem)init
{
  result = (_TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_controller));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FB400D4(v6, v7);
}

- (void)autoReloadSetupControllerDidCancel:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningAutoReloadSetUpFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1A16D8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end