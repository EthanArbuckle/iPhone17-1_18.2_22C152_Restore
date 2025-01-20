@interface ProvisioningCarPairingPinCodeViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController)initWithContext:(int64_t)a3;
- (uint64_t)explanationViewControllerDidSelectCancel:(void *)a3;
- (void)doneButtonPressed;
- (void)keyboardDidChange:(id)a3;
- (void)loadView;
- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ProvisioningCarPairingPinCodeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_19F90A80C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(ProvisioningCarPairingPinCodeViewController *)&v6 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_pinCodeView];
  if (v5) {
    objc_msgSend(v5, sel_becomeFirstResponder, v6.receiver, v6.super_class);
  }
}

- (void)loadView
{
  v2 = self;
  sub_19F90ABA0();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_19F90B540();
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)doneButtonPressed
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate;
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v4 = *((void *)v3 + 1);
  uint64_t ObjectType = swift_getObjectType();
  objc_super v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v7 = self;
  v6(ObjectType, v4);

  swift_unknownObjectRelease();
}

- (void)keyboardDidChange:(id)a3
{
  uint64_t v4 = sub_1A03AE798();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AE778();
  v9 = self;
  id v10 = [(ProvisioningCarPairingPinCodeViewController *)v9 view];
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_setNeedsLayout);

    id v12 = [(ProvisioningCarPairingPinCodeViewController *)v9 view];
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel_layoutIfNeeded);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController)initWithContext:(int64_t)a3
{
  result = (_TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_credential));
  sub_19F614F8C((uint64_t)self + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_pinCodeView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_helpLabel);
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_19F90B9E4(a3, a4);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (uint64_t)explanationViewControllerDidSelectCancel:(void *)a3
{
  uint64_t v5 = &a1[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate];
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v6 = *((void *)v5 + 1);
  uint64_t ObjectType = swift_getObjectType();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  id v9 = a3;
  id v10 = a1;
  v8(ObjectType, v6);

  return swift_unknownObjectRelease();
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v7 = self;
  id v5 = [(ProvisioningCarPairingPinCodeViewController *)v7 view];
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