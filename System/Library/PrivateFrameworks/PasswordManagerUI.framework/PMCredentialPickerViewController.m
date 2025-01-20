@interface PMCredentialPickerViewController
- (BOOL)validateReadyForAuthorization:(id)a3;
- (UIWindow)presentationAnchor;
- (_TtC17PasswordManagerUI32PMCredentialPickerViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5;
- (id)initRequiringTableView:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)numberOfTableRows;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)authenticationProvider:(id)a3 hideViewController:(id)a4;
- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6;
- (void)authenticationProvider:(id)a3 showViewController:(id)a4;
- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4;
- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6;
- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5;
- (void)credentialListViewControllerDidPrepareInterface:(id)a3;
- (void)expandLoginChoicesButtonPressed;
- (void)keychainSyncStatusMayHaveChangedWithNotificaiton:(id)a3;
- (void)manualPasswordEntryButtonPressed;
- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4;
- (void)performConditionalRegistrationIfPossible;
- (void)performPasswordAuthentication:(id)a3;
- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)useCABLEButtonPressed;
- (void)userTappedContinueButton;
- (void)viewDidLoad;
@end

@implementation PMCredentialPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_258CDB4C4();
}

- (_TtC17PasswordManagerUI32PMCredentialPickerViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5
{
  BOOL v6 = a4;
  v7 = (char *)a3;
  swift_unknownObjectRetain();
  return (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)PMCredentialPickerViewController.init(presentationContext:shouldExpandOtherLoginChoices:activity:)(v7, v6, (uint64_t)a5);
}

- (id)initRequiringTableView:(BOOL)a3
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_presentationContext));
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_uiContext;
  uint64_t v4 = sub_258D6BFB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_confirmButtonSubpane));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_authKitAuthorizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_alertQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_externalPasswordCredentialForSelectedLoginChoice));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_credentialAuthenticationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_credentialListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_secondaryButton));
  v5 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController__selectedLoginChoiceIndex;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0AD8C0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_258CE7E70();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_258CE7FF8(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_258D6B8F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B8C8();
  id v10 = a3;
  v11 = self;
  id v12 = PMCredentialPickerViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v7 = sub_258D6B958();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  if (a4 == 1)
  {
    id v12 = a3;
    v13 = self;
    sub_258D6B948();
    sub_258D6B938();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    v11 = (void *)sub_258D6F458();
    swift_bridgeObjectRelease();
  }

  return v11;
}

- (int64_t)numberOfTableRows
{
  v2 = self;
  int64_t v3 = PMCredentialPickerViewController.numberOfTableRows.getter();

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_258D6B8F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B8C8();
  id v10 = a3;
  v11 = self;
  PMCredentialPickerViewController.tableView(_:didSelectRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  PMCredentialPickerViewController.confirmButtonSubPaneDidEnterProcessingState(_:withAuthenticatedContext:)(v6, (uint64_t)a4);
}

- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_258CE830C(a4);
}

- (void)userTappedContinueButton
{
  v2 = self;
  PMCredentialPickerViewController.userTappedContinueButton()();
}

- (void)performPasswordAuthentication:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s17PasswordManagerUI32PMCredentialPickerViewControllerC07performA14AuthenticationyySo39ASCredentialRequestConfirmButtonSubPaneCF_0();
}

- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  sub_258CDF17C((uint64_t)a4, (uint64_t)sub_258CEBB80, v7);

  swift_release();
}

- (BOOL)validateReadyForAuthorization:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_loginChoicesToShow);
  if (v3 >> 62)
  {
    id v7 = a3;
    uint64_t v8 = self;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_258D6FE88();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 != 0;
}

- (void)expandLoginChoicesButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17PasswordManagerUI32PMCredentialPickerViewController_confirmButtonSubpane);
  uint64_t v4 = self;
  objc_msgSend(v2, sel_disableBiometricView);
  unint64_t v3 = [(ASCredentialRequestPaneViewController *)v4 delegate];
  if (v3)
  {
    [(ASCredentialRequestPaneViewControllerDelegate *)v3 requestPaneViewControllerPresentExpandedLoginChoiceInterface:v4];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)useCABLEButtonPressed
{
  v2 = self;
  sub_258CE37E8();
}

- (void)manualPasswordEntryButtonPressed
{
  unint64_t v3 = self;
  v2 = [(ASCredentialRequestPaneViewController *)v3 delegate];
  if (v2)
  {
    [(ASCredentialRequestPaneViewControllerDelegate *)v2 requestPaneViewControllerPresentManualPasswordEntryInterface:v3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = a5;
  sub_258CE88EC(v11, a4, a5, (char *)v13, (void (**)(void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6
{
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
}

- (void)credentialListViewControllerDidPrepareInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  PMCredentialPickerViewController.credentialListViewControllerDidPrepareInterface(_:)(v4);
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
}

- (void)performConditionalRegistrationIfPossible
{
  v2 = self;
  PMCredentialPickerViewController.performConditionalRegistrationIfPossible()();
}

- (void)authenticationProvider:(id)a3 showViewController:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_258CEA448(v6, (uint64_t)&unk_2706DD798, (uint64_t)sub_258CEB7FC, (uint64_t)&block_descriptor_124);
  swift_unknownObjectRelease();
}

- (void)authenticationProvider:(id)a3 hideViewController:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_258CEA728(v6);
  swift_unknownObjectRelease();
}

- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = _Block_copy(a6);
  uint64_t v10 = sub_258D6F338();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  swift_unknownObjectRetain();
  v13 = self;
  sub_258CEAA10(v10, (uint64_t)sub_258CEB5C4, v11, (uint64_t)sub_258CEBB88, v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (UIWindow)presentationAnchor
{
  v2 = self;
  id result = (UIWindow *)[(PMCredentialPickerViewController *)v2 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = result;
  id v5 = [(UIWindow *)result window];

  if (!v5)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  return (UIWindow *)v5;
}

- (void)keychainSyncStatusMayHaveChangedWithNotificaiton:(id)a3
{
  uint64_t v4 = sub_258D6B138();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B118();
  uint64_t v8 = self;
  sub_258CE7014();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end