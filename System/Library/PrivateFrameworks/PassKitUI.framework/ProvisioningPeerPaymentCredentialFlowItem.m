@interface ProvisioningPeerPaymentCredentialFlowItem
- (_TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem)init;
- (void)peerPaymentSetupFlowControllerDidFinish:(id)a3;
@end

@implementation ProvisioningPeerPaymentCredentialFlowItem

- (_TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem)init
{
  result = (_TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_credential));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)peerPaymentSetupFlowControllerDidFinish:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1A6E60, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end