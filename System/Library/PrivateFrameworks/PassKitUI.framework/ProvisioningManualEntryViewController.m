@interface ProvisioningManualEntryViewController
- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4;
- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (id)cameraCaptureViewControllerDidFail:(id)a3;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)visibleFieldIdentifiers;
- (void)_skipCardButtonPressed;
- (void)_tapToProvisionButtonPressed;
- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3;
- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3;
- (void)fieldCell:(id)a3 didTapKeyboardAccessory:(unint64_t)a4;
- (void)fieldCellEditableTextFieldValueDidChange:(id)a3;
- (void)handleNextButtonTapped:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ProvisioningManualEntryViewController

- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showTapToProvisionButton) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showCameraCaptureButton) = 0;
  id v4 = a3;

  result = (_TtC9PassKitUI37ProvisioningManualEntryViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19FA36614();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v8.receiver;
  [(PKPaymentSetupFieldsViewController *)&v8 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = PKSecureElementPassProductTypeAnalyticsDescriptor();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, sel_setProductType_subtype_, v6, 0, v8.receiver, v8.super_class);

LABEL_4:
    objc_msgSend(v5, sel_reportViewAppeared, v8.receiver, v8.super_class);

    return;
  }
  __break(1u);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(ProvisioningManualEntryViewController *)&v6 viewDidDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v6.receiver, v6.super_class))
  {
    v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter];
    if (v5) {
      objc_msgSend(v5, sel_resetProductTypes);
    }
  }
}

- (void)_skipCardButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator);
  if (v2)
  {
    BOOL v3 = self;
    id v4 = v2;
    sub_19FBA51C8();
  }
}

- (void)_tapToProvisionButtonPressed
{
  uint64_t Strong = swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    uint64_t v5 = MEMORY[0x1A6224F80](Strong + OBJC_IVAR____TtC9PassKitUI31ProvisioningManualEntryFlowItem_managingSection);
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = self;
      sub_19FA38CE0(v4, 2u, v6);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a6;
  result = (_TtC9PassKitUI37ProvisioningManualEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_19F614F8C((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator);
}

- (id)visibleFieldIdentifiers
{
  v2 = self;
  BOOL v3 = sub_19FA36D30();

  if (v3)
  {
    uint64_t v4 = (void *)sub_1A03B4C38();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)handleNextButtonTapped:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A03B57A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_19FA37054();

  sub_19F5DE960((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  v2 = self;
  sub_19FA37170();

  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_1A03B4958();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  v2 = self;
  sub_19FA37170();
  uint64_t v4 = v3;

  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v5 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)defaultFields
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultPaymentSetupProvisioningFields);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_1A03B4C58();

    id v7 = (void *)sub_1A03B4C38();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (void)fieldCellEditableTextFieldValueDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_19FA37634(a3);
}

- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4
{
  if (a4 == 1) {
    return *((unsigned char *)&self->super.super.super.super.super.isa
  }
           + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showCameraCaptureButton);
  else {
    return 0;
  }
}

- (void)fieldCell:(id)a3 didTapKeyboardAccessory:(unint64_t)a4
{
  if (a4 == 1)
  {
    id v6 = a3;
    id v7 = self;
    sub_19FA3781C();
  }
}

- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_1A03B4C58();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  id v8 = self;
  sub_19FA38970(a3, v6);

  swift_bridgeObjectRelease();
}

- (id)cameraCaptureViewControllerDidFail:(id)a3
{
  if (a3) {
    return objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  __break(1u);
  return result;
}

- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3
{
}

- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3
{
}

@end