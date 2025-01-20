@interface ProvisioningCardReaderViewController
- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)visibleFieldIdentifiers;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)applicationWillResignActive;
- (void)backButtonPressed;
- (void)cancelButtonPressed;
- (void)didBecomeActiveNotification;
- (void)handleNextButtonTapped:(id)a3;
- (void)loadView;
- (void)manualEntryButtonPressed;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setupLaterButtonPressed;
- (void)tryAgainButtonPressed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ProvisioningCardReaderViewController

- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19FD6A16C();
}

- (void)loadView
{
  v2 = self;
  sub_19FD60CF4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_19FD615E8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_19FD617A4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_19FD619CC(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_19FD61AE0();
}

- (void)manualEntryButtonPressed
{
  v2 = self;
  sub_19FD61FB0();
}

- (void)setupLaterButtonPressed
{
  v2 = self;
  sub_19FD621D8();
}

- (void)tryAgainButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_coordinator);
  if (v2)
  {
    id v4 = v2;
    v5 = self;
    v6 = [(PKPaymentSetupFieldsViewController *)v5 fieldsModel];
    if (v6)
    {
      v7 = v6;
      sub_19FBA451C(v6);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)cancelButtonPressed
{
  v2 = self;
  sub_19FD624D4();
}

- (void)backButtonPressed
{
  v6 = self;
  v2 = (_TtC9PassKitUI36ProvisioningCardReaderViewController *)[(ProvisioningCardReaderViewController *)v6 navigationController];
  if (v2)
  {
    id v3 = v2;
    id v4 = [(ProvisioningCardReaderViewController *)v2 popViewControllerAnimated:1];

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }
}

- (void)applicationWillResignActive
{
  v2 = self;
  sub_19FD626A8();
}

- (void)didBecomeActiveNotification
{
  v2 = self;
  sub_19FD627AC();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_19F5789D8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_19FD6295C(v10, a4, v8, v9);
  sub_19F48BB68((uint64_t)v8);
}

- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a6;
  result = (_TtC9PassKitUI36ProvisioningCardReaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_coordinator));
  swift_release();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_reporter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_animationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurBackgroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_readFailureBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_manualEntryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_springFactory));

  swift_release();
}

- (id)visibleFieldIdentifiers
{
  v2 = self;
  id result = [(PKPaymentSetupFieldsViewController *)v2 fieldsModel];
  if (result)
  {
    id v4 = result;
    id v5 = objc_msgSend(result, sel_visibleSetupFieldIdentifiers);

    if (v5)
    {
      uint64_t v6 = sub_1A03B4C58();
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4FBC860];
    }
    sub_19F7F2334(v6);

    swift_bridgeObjectRelease();
    id v7 = (void *)sub_1A03B4C38();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)handleNextButtonTapped:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A03B57A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_19FD632BC();

  sub_19F5DE960((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  v2 = self;
  sub_19FD633D8();

  swift_bridgeObjectRelease();
  id v3 = (void *)sub_1A03B4958();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  v2 = self;
  sub_19FD633D8();
  uint64_t v4 = v3;

  swift_bridgeObjectRelease();
  if (v4)
  {
    id v5 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)defaultFields
{
  v2 = (void *)sub_1A03B4C38();

  return v2;
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  int64_t v9 = sub_19FD6A2EC(v7);

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)sub_19FD69794(v4);

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_19FD6A404(v8);
  v13 = v12;

  return v13;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  v14 = sub_19FD6A69C(a4, v11, v12);

  return v14;
}

@end