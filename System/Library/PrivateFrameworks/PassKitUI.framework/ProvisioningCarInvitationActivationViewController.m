@interface ProvisioningCarInvitationActivationViewController
- (_TtC9PassKitUI49ProvisioningCarInvitationActivationViewController)initWithContext:(int64_t)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningCarInvitationActivationViewController

- (void)loadView
{
  v2 = self;
  sub_19F6EB33C();
}

- (_TtC9PassKitUI49ProvisioningCarInvitationActivationViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_invitation));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_delegate;

  sub_19F482DB0((uint64_t)v3);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v5 = MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_delegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v5 + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarInvitationActivationFlowItem_delegate;
    if (MEMORY[0x1A6224F80](v5 + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarInvitationActivationFlowItem_delegate))
    {
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t ObjectType = swift_getObjectType();
      id v10 = a3;
      v11 = self;
      sub_19FBE1190(v6, (uint64_t)&off_1EF18E6A8, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v7 = self;
  id v5 = [(ProvisioningCarInvitationActivationViewController *)v7 view];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setUserInteractionEnabled_, v4 ^ 1);

    [(PKExplanationViewController *)v7 showSpinner:v4];
  }
  else
  {
    __break(1u);
  }
}

@end