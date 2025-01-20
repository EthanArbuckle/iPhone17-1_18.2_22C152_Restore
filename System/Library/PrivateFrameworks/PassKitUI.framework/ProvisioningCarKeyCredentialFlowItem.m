@interface ProvisioningCarKeyCredentialFlowItem
- (_TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem)init;
@end

@implementation ProvisioningCarKeyCredentialFlowItem

- (_TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem)init
{
  result = (_TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem_credential));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem_coordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem_viewController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyCredentialFlowItem_provisionedPasses);
}

@end