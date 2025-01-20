@interface ProvisioningCarEducationViewController
- (_TtC9PassKitUI38ProvisioningCarEducationViewController)initWithContext:(int64_t)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningCarEducationViewController

- (void)loadView
{
  v2 = self;
  sub_19FA39808();
}

- (_TtC9PassKitUI38ProvisioningCarEducationViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI38ProvisioningCarEducationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningCarEducationViewController_provisionedPasses));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningCarEducationViewController_delegate;

  sub_19F614F8C((uint64_t)v3);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t Strong = swift_unknownObjectUnownedLoadStrong();
  uint64_t v5 = Strong + OBJC_IVAR____TtC9PassKitUI32ProvisioningCarEducationFlowItem_delegate;
  if (MEMORY[0x1A6224F80](Strong + OBJC_IVAR____TtC9PassKitUI32ProvisioningCarEducationFlowItem_delegate))
  {
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190(Strong, (uint64_t)&off_1EF18A4A0, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = a3;
  }
  swift_unknownObjectRelease();
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7 = self;
  id v5 = [(ProvisioningCarEducationViewController *)v7 view];
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