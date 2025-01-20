@interface ProvisioningAutoReloadCompleteFlowItem
- (_TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem)init;
- (void)autoReloadSetupCompleteViewControllerDidComplete;
@end

@implementation ProvisioningAutoReloadCompleteFlowItem

- (_TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem)init
{
  result = (_TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_amount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_threshold));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_controller));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_reporter);
}

- (void)autoReloadSetupCompleteViewControllerDidComplete
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningAutoReloadCompleteFlowItem_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = self;
    sub_19FBE1190((uint64_t)v6, (uint64_t)&off_1EF1A1688, ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

@end