@interface ProvisioningCarHeroViewController
- (_TtC9PassKitUI33ProvisioningCarHeroViewController)initWithContext:(int64_t)a3;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)skipCardButtonPressed;
@end

@implementation ProvisioningCarHeroViewController

- (void)loadView
{
  v2 = self;
  sub_19F612B70();
}

- (void)skipCardButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI33ProvisioningCarHeroViewController_linkedApplication);
  if (v2)
  {
    v3 = self;
    id v4 = v2;
    if (objc_msgSend(v4, sel_state) == (id)1) {
      objc_msgSend(v4, sel_openApplication_withLaunchOptions_, 0, 1);
    }
  }
}

- (_TtC9PassKitUI33ProvisioningCarHeroViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI33ProvisioningCarHeroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI33ProvisioningCarHeroViewController_credential));
  sub_19F614F8C((uint64_t)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCarHeroViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI33ProvisioningCarHeroViewController_linkedApplication);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t Strong = swift_unknownObjectUnownedLoadStrong();
  uint64_t v5 = Strong + OBJC_IVAR____TtC9PassKitUI27ProvisioningCarHeroFlowItem_delegate;
  if (MEMORY[0x1A6224F80](Strong + OBJC_IVAR____TtC9PassKitUI27ProvisioningCarHeroFlowItem_delegate))
  {
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190(Strong, (uint64_t)&off_1EF18ADA8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = a3;
  }
  swift_unknownObjectRelease();
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  swift_unknownObjectUnownedLoadStrong();
  id v5 = a3;
  uint64_t v6 = self;
  sub_19F6B4F10();

  swift_unknownObjectRelease();
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7 = self;
  id v5 = [(ProvisioningCarHeroViewController *)v7 view];
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