@interface ProvisioningVerificationCompletionFlowItem
- (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem)init;
- (void)showVerificationMethodsForVerificationCompletionViewController:(id)a3;
- (void)verificationCompletionViewControllerDidFinish:(id)a3;
@end

@implementation ProvisioningVerificationCompletionFlowItem

- (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem)init
{
  result = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_verificationController));
  swift_unknownObjectWeakDestroy();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)verificationCompletionViewControllerDidFinish:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF18A098, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)showVerificationMethodsForVerificationCompletionViewController:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_verificationController);
  id v8 = self;
  v5 = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)a3;
  objc_msgSend(v4, sel_clearSelectedChannel);
  uint64_t v6 = MEMORY[0x1A6224F80]((char *)v8 + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_managingSection);
  if (v6)
  {
    v7 = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)v6;
    sub_19F96BD38((uint64_t)v8, v6);

    v5 = v8;
    id v8 = v7;
  }
}

@end