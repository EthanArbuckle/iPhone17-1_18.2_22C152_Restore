@interface ProvisioningPrecursorEducationViewController
- (_TtC9PassKitUI44ProvisioningPrecursorEducationViewController)initWithContext:(int64_t)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningPrecursorEducationViewController

- (void)loadView
{
  v2 = self;
  sub_19F64EF10();
}

- (_TtC9PassKitUI44ProvisioningPrecursorEducationViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI44ProvisioningPrecursorEducationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_precursorRequest));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_delegate;

  sub_19F482DB0((uint64_t)v3);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v5 = MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_delegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v5 + OBJC_IVAR____TtC9PassKitUI38ProvisioningPrecursorEducationFlowItem_delegate;
    if (MEMORY[0x1A6224F80](v5 + OBJC_IVAR____TtC9PassKitUI38ProvisioningPrecursorEducationFlowItem_delegate))
    {
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t ObjectType = swift_getObjectType();
      id v10 = a3;
      v11 = self;
      sub_19FBE1190(v6, (uint64_t)&off_1EF1A25E8, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  id v4 = [(ProvisioningPrecursorEducationViewController *)v6 view];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);

    [(PKExplanationViewController *)v6 showSpinner:1];
  }
  else
  {
    __break(1u);
  }
}

@end