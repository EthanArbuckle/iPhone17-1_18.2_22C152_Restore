@interface ProvisioningVerificationMethodsFlowItem
- (_TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem)init;
- (void)showExternalVerificationForVerificationMethodsViewController:(id)a3;
- (void)showVerificationCompletionForVerificationMethodsViewController:(id)a3;
- (void)showVerificationMethodsForVerificationMethodsViewController:(id)a3;
- (void)verificationMethodsViewControllerDidFinish:(id)a3;
@end

@implementation ProvisioningVerificationMethodsFlowItem

- (_TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem)init
{
  result = (_TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_verificationController));
  swift_unknownObjectWeakDestroy();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)showExternalVerificationForVerificationMethodsViewController:(id)a3
{
}

- (void)showVerificationCompletionForVerificationMethodsViewController:(id)a3
{
}

- (void)showVerificationMethodsForVerificationMethodsViewController:(id)a3
{
}

- (void)verificationMethodsViewControllerDidFinish:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF198DE0, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end