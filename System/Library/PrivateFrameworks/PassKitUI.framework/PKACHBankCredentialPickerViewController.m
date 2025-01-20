@interface PKACHBankCredentialPickerViewController
- (PKACHBankCredentialPickerViewController)initWithCoder:(id)a3;
- (PKACHBankCredentialPickerViewController)initWithCurrentBankInformation:(id)a3 selectAction:(id)a4 cancelAction:(id)a5;
- (PKACHBankCredentialPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKACHBankCredentialPickerViewController

- (PKACHBankCredentialPickerViewController)initWithCurrentBankInformation:(id)a3 selectAction:(id)a4 cancelAction:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  id v11 = a3;
  v12 = (PKACHBankCredentialPickerViewController *)sub_19FA0AF98(a3, (uint64_t)sub_19F533B00, v9, (uint64_t)sub_19F5789D8, v10);

  swift_release();
  swift_release();
  return v12;
}

- (PKACHBankCredentialPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s9PassKitUI37ACHBankCredentialPickerViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19FA0307C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_19FA037A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_19FA038CC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ACHBankCredentialPickerViewController();
  v4 = (char *)v7.receiver;
  [(PKACHBankCredentialPickerViewController *)&v7 viewDidDisappear:v3];
  v5 = &v4[OBJC_IVAR___PKACHBankCredentialPickerViewController_cancellables];
  swift_beginAccess();
  uint64_t v6 = sub_1A03AE138();
  sub_19FA02A70(v6);
  swift_bridgeObjectRelease();
  *(void *)v5 = MEMORY[0x1E4FBC870];

  swift_bridgeObjectRelease();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ACHBankCredentialPickerViewController();
  uint64_t v6 = (char *)v7.receiver;
  [(PKACHBankCredentialPickerViewController *)&v7 setEditing:v5 animated:v4];
  if (*(void *)&v6[OBJC_IVAR___PKACHBankCredentialPickerViewController_pickerViewState])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1A03ADE18();
    sub_1A03B10B8();
  }
}

- (PKACHBankCredentialPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_hostingVC));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_addCredentialHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_editCredentialHandler));

  swift_bridgeObjectRelease();
}

@end