@interface ProvisioningVerificationFlowSection
- (_TtC9PassKitUI35ProvisioningVerificationFlowSection)init;
- (id)presentationContext;
- (void)dealloc;
- (void)didFinishVerification;
@end

@implementation ProvisioningVerificationFlowSection

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_verificationController);
  v5 = self;
  objc_msgSend(v4, sel_setFlowDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ProvisioningVerificationFlowSection *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_verificationController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate);

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI35ProvisioningVerificationFlowSection)init
{
  result = (_TtC9PassKitUI35ProvisioningVerificationFlowSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)presentationContext
{
  v2 = self;
  id v3 = sub_19F686378();

  return v3;
}

- (void)didFinishVerification
{
  id v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    objc_super v6 = self;
    sub_19FBE1190((uint64_t)v6, (uint64_t)&off_1EF18A330, ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

@end