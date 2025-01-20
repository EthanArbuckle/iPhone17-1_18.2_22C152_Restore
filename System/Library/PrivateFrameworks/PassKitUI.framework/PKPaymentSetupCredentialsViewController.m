@interface PKPaymentSetupCredentialsViewController
- (BOOL)_readerModeIsSupported;
- (PKPaymentSetupCredentialsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 credentials:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7 reporter:(id)a8;
- (PKPaymentSetupCredentialsViewControllerFlowDelegate)flowDelegate;
- (unint64_t)showPrivacyDisclosure;
- (void)_beginReportingIfNecessary;
- (void)_configureAndUpdateDockView;
- (void)_continueButtonPressed;
- (void)_endReportingIfNecessary;
- (void)_presentCredentialDoubleCheckAlert:(id)a3 continueHandler:(id)a4 setupLaterHandler:(id)a5;
- (void)_presentManualAddController;
- (void)_presentProvisioningFlowForCredentials:(id)a3;
- (void)_reportSelectedCredentials:(id)a3;
- (void)_requestAuthAndStartProvisioningForCredentials:(id)a3;
- (void)_requestExternalizedAuthIfNeededWithCompletion:(id)a3;
- (void)_setUserInteractionEnabled:(BOOL)a3;
- (void)_setupLaterTapped;
- (void)_terminateSetupFlow;
- (void)_toggleEdit;
- (void)_transferExistingCardTapped;
- (void)_updateEditButtonVisibility;
- (void)dealloc;
- (void)presentRefundFlowForCredential:(id)a3;
- (void)presentUnavailableDetailsForCredential:(id)a3;
- (void)reloadAnimated:(BOOL)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setShowNoResultsView:(BOOL)a3;
- (void)setShowPrivacyDisclosure:(unint64_t)a3;
- (void)showCredentialDeletionError;
- (void)showDeleteConfirmationWithCompletion:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)showMaxSelectionAlertForCredential:(id)a3;
- (void)showUnableToDeleteCredentialError;
- (void)showUnableToDeleteSafariCredentialError;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupCredentialsViewController

- (PKPaymentSetupCredentialsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 credentials:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7 reporter:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupCredentialsViewController;
  v18 = [(PKPaymentSetupOptionsViewController *)&v22 initWithProvisioningController:v14 context:a4 delegate:0];
  if (v18)
  {
    v19 = [[PKPaymentSetupCredentialsSectionController alloc] initWithCredentials:v15 provisioningController:v14 context:a4 product:v16];
    sectionController = v18->_sectionController;
    v18->_sectionController = v19;

    [(PKPaymentSetupCredentialsSectionController *)v18->_sectionController setDelegate:v18];
    [(PKPaymentSetupCredentialsSectionController *)v18->_sectionController setDataChangeDelegate:v18];
    objc_storeStrong((id *)&v18->_product, a6);
    [(PKPaymentSetupOptionsViewController *)v18 setAllowsManualEntry:v9];
    [(PKDynamicCollectionViewController *)v18 setUseItemIdentityWhenUpdating:1];
    objc_storeStrong((id *)&v18->_reporter, a8);
  }

  return v18;
}

- (void)dealloc
{
  [(LAContext *)self->_localAuthenticationContext invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKPaymentSetupCredentialsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKPaymentSetupOptionsViewController *)&v13 viewDidLoad];
  objc_super v3 = [(PKDynamicCollectionViewController *)self collectionView];
  [v3 setAllowsMultipleSelection:1];
  [v3 setAllowsSelectionDuringEditing:1];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F857F0]];
  v4 = [(PKPaymentSetupProduct *)self->_product configuration];
  uint64_t v5 = [v4 type];

  if (v5 == 6)
  {
    v6 = PKLocalizedPaymentString(&cfstr_PaymentSetupBa.isa);
    v7 = [(PKPaymentSetupProduct *)self->_product displayName];
    v8 = PKLocalizedPaymentString(&cfstr_PaymentSetupBa_0.isa, &stru_1EF1B4C70.isa, v7);
  }
  else if (v5 == 11)
  {
    v6 = PKLocalizedPaymentString(&cfstr_PaymentSetupCa_0.isa);
    v8 = PKLocalizedPaymentString(&cfstr_PaymentSetupCa_1.isa);
    self->_showPrivacyDisclosure = 2;
  }
  else
  {
    if (v5 == 9) {
      PKLocalizedAquamanString(&cfstr_AccountsOnFile.isa);
    }
    else {
    v6 = PKLocalizedPaymentString(&cfstr_PaymentSetupYo_1.isa);
    }
    v8 = PKLocalizedPaymentString(&cfstr_PaymentSetupYo_0.isa);
  }
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v8];
  [(PKPaymentSetupOptionsViewController *)self setNoResultsIcon:0];
  [(PKPaymentSetupOptionsViewController *)self setNoResultsTitle:0];
  BOOL v9 = PKLocalizedPaymentString(&cfstr_PaymentSetupYo_2.isa);
  [(PKPaymentSetupOptionsViewController *)self setNoResultsSubtitle:v9];

  [(PKPaymentSetupCredentialsViewController *)self _configureAndUpdateDockView];
  v14[0] = self->_sectionController;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v10 animated:0];

  [(PKPaymentSetupCredentialsViewController *)self _beginReportingIfNecessary];
  uint64_t v11 = [(PKPaymentSetupOptionsViewController *)self context];
  v12 = [(PKPaymentSetupCredentialsViewController *)self view];
  PKPaymentSetupApplyContextAppearance(v11, v12);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewWillAppear:a3];
  [(PKPaymentSetupCredentialsSectionController *)self->_sectionController reloadCredentialStores];
  [(PKPaymentSetupCredentialsViewController *)self _updateEditButtonVisibility];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKDynamicCollectionViewController *)&v4 viewWillDisappear:a3];
  [(PKPaymentSetupCredentialsViewController *)self _endReportingIfNecessary];
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87068];
  objc_super v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87068]];

  if (!v4)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87068]];
  }
}

- (void)reloadAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = self->_sectionController;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialsViewController;
  [(PKPaymentSetupOptionsViewController *)&v6 setSections:v5 animated:v3];
}

- (void)presentRefundFlowForCredential:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  objc_super v6 = [v4 arrayWithObjects:&v7 count:1];

  -[PKPaymentSetupCredentialsViewController _presentProvisioningFlowForCredentials:](self, "_presentProvisioningFlowForCredentials:", v6, v7, v8);
}

- (void)presentUnavailableDetailsForCredential:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  objc_super v6 = [v4 arrayWithObjects:&v7 count:1];

  -[PKPaymentSetupCredentialsViewController _presentProvisioningFlowForCredentials:](self, "_presentProvisioningFlowForCredentials:", v6, v7, v8);
}

- (void)showMaxSelectionAlertForCredential:(id)a3
{
  product = self->_product;
  id v5 = a3;
  objc_super v6 = [(PKPaymentSetupProduct *)product configuration];
  uint64_t v7 = [v6 type];

  unint64_t v8 = [(PKPaymentSetupCredentialsSectionController *)self->_sectionController maximumNumberOfSelectableCredentials];
  if (v8 == -1)
  {
    uint64_t v9 = PKLocalizedPaymentString(&cfstr_MaxCardsSelect.isa);
  }
  else
  {
    if (v7 == 9) {
      PKLocalizedAquamanString(&cfstr_MaxAccountsSel.isa, &cfstr_Lu.isa, v8);
    }
    else {
    uint64_t v9 = PKLocalizedString(&cfstr_MaxCardsSelect_0.isa, &cfstr_Lu.isa, v8);
    }
  }
  id v16 = (id)v9;
  v10 = [v5 longDescription];

  uint64_t v11 = PKLocalizedPaymentString(&cfstr_MaxCardsSelect_1.isa, &stru_1EF1B4C70.isa, v10);

  v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v16 message:v11 preferredStyle:1];
  objc_super v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PKLocalizedPaymentString(&cfstr_MaxCardsSelect_2.isa);
  id v15 = [v13 actionWithTitle:v14 style:1 handler:0];
  [v12 addAction:v15];

  [(PKPaymentSetupCredentialsViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)showDeleteConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPaymentSetupCredentialsViewController *)self presentedViewController];
    if (v5)
    {
    }
    else
    {
      objc_super v6 = [(PKPaymentSetupCredentialsViewController *)self navigationController];
      uint64_t v7 = [v6 topViewController];

      if (v7 == self)
      {
        unint64_t v8 = PKLocalizedPaymentString(&cfstr_DeleteCardConf.isa);
        BOOL v9 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
        v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v8 preferredStyle:v9];
        uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
        v12 = PKLocalizedPaymentString(&cfstr_DeleteCardConf_0.isa);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke;
        v23[3] = &unk_1E59CB150;
        id v13 = v4;
        id v24 = v13;
        id v14 = [v11 actionWithTitle:v12 style:2 handler:v23];
        [v10 addAction:v14];

        id v15 = (void *)MEMORY[0x1E4FB1410];
        id v16 = PKLocalizedPaymentString(&cfstr_DeleteCardConf_1.isa);
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        v20 = __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke_2;
        v21 = &unk_1E59CB150;
        id v22 = v13;
        id v17 = [v15 actionWithTitle:v16 style:1 handler:&v18];
        objc_msgSend(v10, "addAction:", v17, v18, v19, v20, v21);

        [(PKPaymentSetupCredentialsViewController *)self presentViewController:v10 animated:1 completion:0];
        goto LABEL_6;
      }
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_6:
}

uint64_t __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showUnableToDeleteCredentialError
{
  BOOL v3 = [(PKPaymentSetupCredentialsViewController *)self presentedViewController];
  if (!v3)
  {
    id v4 = [(PKPaymentSetupCredentialsViewController *)self navigationController];
    id v5 = [v4 topViewController];

    if (v5 != self) {
      return;
    }
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_UnableToDelete.isa);
    objc_super v6 = PKLocalizedPaymentString(&cfstr_UnableToDelete_0.isa);
    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v6 preferredStyle:1];
    unint64_t v8 = (void *)MEMORY[0x1E4FB1410];
    BOOL v9 = PKLocalizedPaymentString(&cfstr_UnableToDelete_1.isa);
    v10 = [v8 actionWithTitle:v9 style:1 handler:0];
    [v7 addAction:v10];

    [(PKPaymentSetupCredentialsViewController *)self presentViewController:v7 animated:1 completion:0];
    BOOL v3 = (void *)v11;
  }
}

- (void)showUnableToDeleteSafariCredentialError
{
  BOOL v3 = [(PKPaymentSetupCredentialsViewController *)self presentedViewController];
  if (!v3)
  {
    id v4 = [(PKPaymentSetupCredentialsViewController *)self navigationController];
    id v5 = [v4 topViewController];

    if (v5 != self) {
      return;
    }
    uint64_t v11 = PKLocalizedVirtualCardString(&cfstr_SafariCardImpo.isa);
    objc_super v6 = PKLocalizedVirtualCardString(&cfstr_SafariCardImpo_0.isa);
    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v6 preferredStyle:1];
    unint64_t v8 = (void *)MEMORY[0x1E4FB1410];
    BOOL v9 = PKLocalizedPaymentString(&cfstr_UnableToDelete_1.isa);
    v10 = [v8 actionWithTitle:v9 style:1 handler:0];
    [v7 addAction:v10];

    [(PKPaymentSetupCredentialsViewController *)self presentViewController:v7 animated:1 completion:0];
    BOOL v3 = (void *)v11;
  }
}

- (void)showCredentialDeletionError
{
  BOOL v3 = [(PKPaymentSetupCredentialsViewController *)self presentedViewController];
  if (!v3)
  {
    id v4 = [(PKPaymentSetupCredentialsViewController *)self navigationController];
    id v5 = [v4 topViewController];

    if (v5 != self) {
      return;
    }
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_DeleteCardErro.isa);
    objc_super v6 = PKLocalizedPaymentString(&cfstr_DeleteCardErro_0.isa);
    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v6 preferredStyle:1];
    unint64_t v8 = (void *)MEMORY[0x1E4FB1410];
    BOOL v9 = PKLocalizedPaymentString(&cfstr_DeleteCardErro_1.isa);
    v10 = [v8 actionWithTitle:v9 style:1 handler:0];
    [v7 addAction:v10];

    [(PKPaymentSetupCredentialsViewController *)self presentViewController:v7 animated:1 completion:0];
    BOOL v3 = (void *)v11;
  }
}

- (void)setShowNoResultsView:(BOOL)a3
{
  [(PKPaymentSetupOptionsViewController *)self setShowNoResultsView:a3 animated:1];

  [(PKPaymentSetupCredentialsViewController *)self _updateEditButtonVisibility];
}

- (void)_configureAndUpdateDockView
{
  $96EE1C12479E9B303E9C2794B92A11A2 v3 = ($96EE1C12479E9B303E9C2794B92A11A2)[(PKPaymentSetupCredentialsSectionController *)self->_sectionController credentialSelectionState];
  BOOL v4 = [(PKPaymentSetupOptionsViewController *)self allowsManualEntry];
  [(PKPaymentSetupOptionsViewController *)self context];
  int IsExpressSetupAssistant = PKPaymentSetupContextIsExpressSetupAssistant();
  int v6 = IsExpressSetupAssistant;
  if (v3.var0 || v4 || (IsExpressSetupAssistant & 1) != 0)
  {
    id v23 = [(PKPaymentSetupOptionsViewController *)self dockView];
    if (!self->_isDockViewConfigured)
    {
      self->_isDockViewConfigured = 1;
      uint64_t v7 = [v23 primaryButton];
      [v7 setEnabled:1];
      [v7 addTarget:self action:sel__continueButtonPressed forControlEvents:0x2000];
      unint64_t v8 = PKLocalizedPaymentString(&cfstr_Continue.isa);
      [v7 setTitle:v8 forState:0];

      [v23 setButtonsEnabled:1];
      BOOL v9 = [v23 footerView];
      v10 = v9;
      if (v6)
      {
        [v9 setForceShowSetupLaterButton:1];
        uint64_t v11 = [v10 setupLaterButton];
        [v11 addTarget:self action:sel__setupLaterTapped forControlEvents:0x2000];
      }
      if (v4)
      {
        v12 = [v10 manualEntryButton];
        [v12 addTarget:self action:sel__presentManualAddController forControlEvents:0x2000];
        id v13 = [(PKPaymentSetupProduct *)self->_product configuration];
        uint64_t v14 = [v13 type];

        if (v14 == 9) {
          PKLocalizedAquamanString(&cfstr_AddADifferentA.isa);
        }
        else {
        id v15 = PKLocalizedPaymentString(&cfstr_AddANewCard.isa);
        }
        [v12 setTitle:v15 forState:0];
      }
      if ([(PKPaymentSetupOptionsViewController *)self allowsManualEntry]
        && [(PKPaymentSetupCredentialsViewController *)self _readerModeIsSupported])
      {
        id v16 = [v10 secondaryActionButton];
        id v17 = PKLocalizedPaymentString(&cfstr_SetupPurchaseT.isa);
        [v16 setTitle:v17 forState:0];

        [v16 addTarget:self action:sel__transferExistingCardTapped forControlEvents:0x2000];
      }
      [v10 setButtonsEnabled:1];
      if (!v4) {
        [v10 setManualEntryButton:0];
      }
      if ((v6 & 1) == 0) {
        [v10 setSetupLaterButton:0];
      }
    }
    unint64_t showPrivacyDisclosure = self->_showPrivacyDisclosure;
    if (showPrivacyDisclosure == 1
      || !showPrivacyDisclosure && (PKPaymentSetupContextIsNonExpressSetupAssistant() & 1) == 0)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 255);
      [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:v19];
    }
    v20 = [(PKDynamicCollectionViewController *)self collectionView];
    int v21 = [v20 isEditing];

    LOBYTE(v20) = v21 ^ 1;
    [v23 setButtonsEnabled:v21 ^ 1u];
    id v22 = [v23 primaryButton];
    [v22 setEnabled:v20 & ((unsigned __int16)(*(_WORD *)&v3 & 0x100) >> 8)];
  }
  else
  {
    self->_isDockViewConfigured = 0;
    [(PKPaymentSetupOptionsViewController *)self removeSetupDockView];
  }
}

- (BOOL)_readerModeIsSupported
{
  if (![MEMORY[0x1E4F845F0] isSupported]) {
    return 0;
  }
  $96EE1C12479E9B303E9C2794B92A11A2 v3 = [(PKPaymentSetupProduct *)self->_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
  if (v3) {
    BOOL v4 = ([(PKPaymentSetupProduct *)self->_product allSupportedProtocols] & 4) == 0
  }
      || PKFelicaSecureElementIsAvailable() != 0;
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_presentCredentialDoubleCheckAlert:(id)a3 continueHandler:(id)a4 setupLaterHandler:(id)a5
{
  id v8 = a3;
  BOOL v9 = (void (**)(void))a4;
  v10 = (void (**)(void))a5;
  [(PKPaymentSetupOptionsViewController *)self context];
  if (PKPaymentSetupContextIsiOSSetupAssistant())
  {
    uint64_t v11 = [v8 accountCredential];
    v12 = v11;
    if (v11)
    {
      id v13 = [v11 account];
      uint64_t v14 = (void *)MEMORY[0x1E4FB1418];
      id v15 = PKLocalizedFeatureString();
      id v16 = PKLocalizedFeatureString();
      id v17 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

      uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v19 = PKLocalizedFeatureString();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke;
      v28[3] = &unk_1E59D0C88;
      v28[4] = self;
      id v29 = v8;
      v30 = v9;
      v20 = [v18 actionWithTitle:v19 style:0 handler:v28];
      [v17 addAction:v20];

      int v21 = (void *)MEMORY[0x1E4FB1410];
      id v22 = PKLocalizedFeatureString();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_2;
      v25[3] = &unk_1E59D0C60;
      id v26 = v13;
      v27 = v10;
      id v23 = v13;
      id v24 = [v21 actionWithTitle:v22 style:1 handler:v25];
      [v17 addAction:v24];

      [(PKPaymentSetupCredentialsViewController *)self presentViewController:v17 animated:1 completion:0];
    }
    else if (v9)
    {
      v9[2](v9);
    }
  }
  else
  {
    v10[2](v10);
  }
}

uint64_t __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 1280) setCredential:a1[5] selected:1];
  uint64_t result = a1[6];
  if (result)
  {
    $96EE1C12479E9B303E9C2794B92A11A2 v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F84270] sharedInstance];
  $96EE1C12479E9B303E9C2794B92A11A2 v3 = [*(id *)(a1 + 32) accountIdentifier];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_3;
  v4[3] = &unk_1E59CAA98;
  id v5 = *(id *)(a1 + 40);
  [v2 scheduleSetupReminderForAccountWithIdentifier:v3 completion:v4];
}

void __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_4;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_continueButtonPressed
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  BOOL v4 = _Block_copy(aBlock);
  id v3 = v4;
  PKRequestContactAccessWithCompletion();
}

void __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1280) selectedCredentials];
  [*(id *)(a1 + 32) _requestAuthAndStartProvisioningForCredentials:v2];
}

void __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1280) unselectedCredentialRequiringAction];
  id v3 = (id)v2;
  if (v2) {
    [*(id *)(a1 + 32) _presentCredentialDoubleCheckAlert:v2 continueHandler:*(void *)(a1 + 40) setupLaterHandler:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_transferExistingCardTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained credentialsViewControllerDidSelectSecondaryManualEntry:self];
}

- (void)_setupLaterTapped
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke_2;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  BOOL v4 = (void (**)(void))_Block_copy(v6);
  id v5 = [(PKPaymentSetupCredentialsSectionController *)self->_sectionController availableCredentialRequiringAction];
  if (v5) {
    [(PKPaymentSetupCredentialsViewController *)self _presentCredentialDoubleCheckAlert:v5 continueHandler:v3 setupLaterHandler:v4];
  }
  else {
    v4[2](v4);
  }
}

void __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1280) selectedCredentials];
  uint64_t v2 = [v4 count];
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _requestAuthAndStartProvisioningForCredentials:v4];
  }
  else {
    [v3 _terminateSetupFlow];
  }
}

uint64_t __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateSetupFlow];
}

- (void)_presentManualAddController
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  [WeakRetained credentialsViewControllerDidSelectManualEntry:self];
}

- (void)_reportSelectedCredentials:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v5 = *MEMORY[0x1E4F86308];
  v6[0] = *MEMORY[0x1E4F86388];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportEvent:v4];
}

- (void)_requestAuthAndStartProvisioningForCredentials:(id)a3
{
  id v4 = a3;
  [(PKPaymentSetupCredentialsViewController *)self _setUserInteractionEnabled:0];
  [(PKPaymentSetupCredentialsViewController *)self _reportSelectedCredentials:v4];
  if ([(PKPaymentSetupCredentialsSectionController *)self->_sectionController doesContainCredentialThatRequiresAuth:v4])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __90__PKPaymentSetupCredentialsViewController__requestAuthAndStartProvisioningForCredentials___block_invoke;
    v5[3] = &unk_1E59DE0C0;
    v5[4] = self;
    id v6 = v4;
    [(PKPaymentSetupCredentialsViewController *)self _requestExternalizedAuthIfNeededWithCompletion:v5];
  }
  else
  {
    [(PKPaymentSetupCredentialsViewController *)self _presentProvisioningFlowForCredentials:v4];
  }
}

void __90__PKPaymentSetupCredentialsViewController__requestAuthAndStartProvisioningForCredentials___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if (v5)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "state", (void)v13);
            [v12 setExternalizedAuth:v6];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_presentProvisioningFlowForCredentials:", *(void *)(a1 + 40), (void)v13);
  }
  else
  {
    [*(id *)(a1 + 32) _setUserInteractionEnabled:1];
  }
}

- (void)_presentProvisioningFlowForCredentials:(id)a3
{
  p_flowDelegate = &self->_flowDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  [WeakRetained credentialsViewController:self didSelectCredentials:v5];
}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKDynamicCollectionViewController *)self collectionView];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [(PKPaymentSetupCredentialsViewController *)self view];
  [v6 setUserInteractionEnabled:v3];

  id v7 = [(PKPaymentSetupCredentialsViewController *)self navigationItem];
  uint64_t v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v3];

  if (self->_isDockViewConfigured)
  {
    id v14 = [(PKPaymentSetupOptionsViewController *)self dockView];
    uint64_t v9 = [v14 footerView];
    [v9 setButtonsEnabled:v3];

    uint64_t v10 = [v14 primaryButton];
    uint64_t v11 = v10;
    if (v3)
    {
      v12 = [(PKPaymentSetupCredentialsSectionController *)self->_sectionController selectedCredentials];
      objc_msgSend(v11, "setEnabled:", objc_msgSend(v12, "count") != 0);
    }
    else
    {
      [v10 setEnabled:0];
    }

    long long v13 = [v14 primaryButton];
    [v13 setShowSpinner:v3 ^ 1];
  }
}

- (void)_terminateSetupFlow
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    [v5 credentialsViewControllerDidTerminate:self];
  }
  else
  {
    [(PKPaymentSetupCredentialsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_requestExternalizedAuthIfNeededWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  int64_t v5 = [(PKPaymentSetupOptionsViewController *)self context];
  if (PKPaymentSetupContextIsSetupAssistant()
    && (([(PKPaymentSetupOptionsViewController *)self provisioningController],
         id v6 = objc_claimAutoreleasedReturnValue(),
         int v7 = [v6 hasExternalizedAuth],
         v6,
         v5 != 5)
     || v7))
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = @"N";
      if (v7) {
        long long v15 = @"Y";
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion returning %@ for buddy.", buf, 0xCu);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"N";
      if (v5 == 4) {
        uint64_t v9 = @"Y";
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion shouldGetAuthFromWatch %@.", buf, 0xCu);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CAD18;
    aBlock[4] = self;
    uint64_t v10 = v4;
    id v20 = v10;
    uint64_t v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v5 == 4)
    {
      long long v13 = [(PKPaymentSetupOptionsViewController *)self provisioningController];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_203;
      v16[3] = &unk_1E59DE110;
      v16[4] = self;
      id v17 = v10;
      id v18 = v12;
      [v13 requestExternalizedAuthForWatchWithVisibleViewController:self completion:v16];
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
  }
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1304);
  *(void *)(v3 + 1304) = v2;

  v12[0] = &unk_1EF2B9A38;
  int64_t v5 = PKLocalizedShareableCredentialString(&cfstr_LocalAuthentic.isa);
  v12[1] = &unk_1EF2B9A50;
  v13[0] = v5;
  id v6 = PKLocalizedString(&cfstr_Wallet_0.isa);
  v13[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1304);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_201;
  v10[3] = &unk_1E59DE0E8;
  v10[4] = v8;
  id v11 = *(id *)(a1 + 40);
  [v9 evaluatePolicy:1025 options:v7 reply:v10];
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = 0;
  if (a2 && !a3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1304) externalizedContext];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = @"Y";
    }
    else {
      uint64_t v3 = @"N";
    }
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion requested local auth and returning %@.", (uint8_t *)&v6, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    id v4 = [*(id *)(a1 + 40) provisioningController];
    [v4 storeExternalizedAuth:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_203(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2_204;
    block[3] = &unk_1E59CA938;
    id v9 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2_204(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternalizedAuthForWatchWithVisibleViewController returning error: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] == 0, 0);
  id v4 = (void *)a1[4];
  if (v4)
  {
    id v5 = (void *)a1[5];
    id v6 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_toggleEdit
{
  id v9 = [(PKDynamicCollectionViewController *)self collectionView];
  int v3 = [v9 isEditing];
  uint64_t v4 = v3 ^ 1u;
  [v9 setEditing:v4];
  if (v3) {
    id v5 = @"EDIT_BUTTON";
  }
  else {
    id v5 = @"DONE_BUTTON";
  }
  id v6 = PKLocalizedPaymentString(&v5->isa);
  int v7 = [(PKPaymentSetupCredentialsViewController *)self navigationItem];
  uint64_t v8 = [v7 rightBarButtonItem];
  [v8 setTitle:v6];

  [(PKPaymentSetupCredentialsSectionController *)self->_sectionController setEditing:v4];
  [(PKPaymentSetupCredentialsViewController *)self _configureAndUpdateDockView];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:1];
}

- (void)_updateEditButtonVisibility
{
  id v11 = [(PKPaymentSetupCredentialsViewController *)self navigationItem];
  int v3 = [v11 rightBarButtonItem];

  BOOL v4 = [(PKPaymentSetupCredentialsSectionController *)self->_sectionController shouldShowEditButton];
  if (v4 && v3 == 0)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v9 = PKLocalizedPaymentString(&cfstr_EditButton.isa);
    uint64_t v10 = (void *)[v8 initWithTitle:v9 style:2 target:self action:sel__toggleEdit];

    [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F854C0]];
    [v11 setRightBarButtonItem:v10];
  }
  else
  {
    if (v3) {
      char v6 = v4;
    }
    else {
      char v6 = 1;
    }
    int v7 = v11;
    if (v6) {
      goto LABEL_12;
    }
    [v11 setRightBarButtonItem:0 animated:1];
  }
  int v7 = v11;
LABEL_12:
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
}

- (PKPaymentSetupCredentialsViewControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentSetupCredentialsViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (unint64_t)showPrivacyDisclosure
{
  return self->_showPrivacyDisclosure;
}

- (void)setShowPrivacyDisclosure:(unint64_t)a3
{
  self->_unint64_t showPrivacyDisclosure = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_product, 0);

  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end