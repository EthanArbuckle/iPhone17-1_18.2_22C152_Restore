@interface ProvisioningCarAddToWatchViewController
- (_TtC9PassKitUI39ProvisioningCarAddToWatchViewController)initWithContext:(int64_t)a3;
- (void)explanationViewControllerDidSelectCancel:(void *)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningCarAddToWatchViewController

- (void)loadView
{
  v2 = self;
  sub_19F842058();
}

- (_TtC9PassKitUI39ProvisioningCarAddToWatchViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI39ProvisioningCarAddToWatchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_credential));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator);
  if (v3)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F84C88]);
    id v7 = a3;
    v8 = self;
    id v9 = v3;
    id v10 = objc_msgSend(v6, sel_init);
    sub_19F704D44(v10);
  }
}

- (void)explanationViewControllerDidSelectCancel:(void *)a3
{
  v3 = *(void **)&a1[OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator];
  if (v3)
  {
    id v5 = a3;
    id v6 = a1;
    id v7 = v3;
    sub_19F705C34();
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v7 = self;
  id v5 = [(ProvisioningCarAddToWatchViewController *)v7 view];
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setUserInteractionEnabled_, v4 ^ 1);

    [(PKExplanationViewController *)v7 showSpinner:v4];
  }
  else
  {
    __break(1u);
  }
}

@end