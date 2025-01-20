@interface PKNewPaymentCredentialProvisioningViewController
- (BOOL)hasRemainingCredentialsToProvision;
- (BOOL)isComplete;
- (BOOL)showSkipButton;
- (PKNewPaymentCredentialProvisioningViewController)initWithProvisioningController:(id)a3 webService:(id)a4 context:(int64_t)a5 paymentCredential:(id)a6 setupProduct:(id)a7 allowsManualEntry:(BOOL)a8 reporter:(id)a9;
- (PKPaymentCredentialProvisioningViewControllerCoordinator)coordinator;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_defaultHeaderViewSubTitleForLocalCredential;
- (id)_defaultHeaderViewSubTitleForLocalCredentialTransfer;
- (id)_remoteExistingCredentialDefaultHeaderViewSubTitle;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)readonlyFieldIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)visibleFieldIdentifiers;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createPassSnapshotFromPaymentPass:(id)a3 completion:(id)a4;
- (void)_skipCard;
- (void)_updatePassSnapshotHeader;
- (void)addDifferentCard:(id)a3;
- (void)dealloc;
- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4;
- (void)didUpdateFieldModel;
- (void)handleNextButtonTapped:(id)a3;
- (void)loadView;
- (void)paymentPassUpdatedOnCredential:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setHasRemainingCredentialsToProvision:(BOOL)a3;
- (void)setPassSnapshot:(id)a3 needsCorners:(BOOL)a4;
- (void)setShowSkipButton:(BOOL)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)showWithProvisioningError:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKNewPaymentCredentialProvisioningViewController

- (PKNewPaymentCredentialProvisioningViewController)initWithProvisioningController:(id)a3 webService:(id)a4 context:(int64_t)a5 paymentCredential:(id)a6 setupProduct:(id)a7 allowsManualEntry:(BOOL)a8 reporter:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v71 = a7;
  id v18 = a9;
  v72.receiver = self;
  v72.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  v19 = [(PKPaymentSetupProvisioningFieldsViewController *)&v72 initWithProvisioningController:v15 context:a5 setupDelegate:0];
  v20 = v19;
  if (!v19) {
    goto LABEL_50;
  }
  id v68 = v18;
  objc_storeStrong((id *)&v19->_provisioningController, a3);
  objc_storeStrong((id *)&v20->_webService, a4);
  [v15 addDelegate:v20];
  objc_storeStrong((id *)&v20->_setupProduct, a7);
  p_paymentCredential = (id *)&v20->_paymentCredential;
  objc_storeStrong((id *)&v20->_paymentCredential, a6);
  char v22 = 1;
  v20->_displayType = 1;
  v20->_allowsManualEntry = a8;
  objc_storeStrong((id *)&v20->_reporter, a9);
  char IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  char IsExpressSetupAssistant = PKPaymentSetupContextIsExpressSetupAssistant();
  if (([v17 isHomeKeyCredential] & 1) == 0)
  {
    if (([v17 isShareableCredential] & 1) != 0
      || ([v17 isDigitalIssuanceProductCredential] & 1) != 0
      || ([v17 isSafariCredential] & 1) != 0
      || ([v17 isPrecursorCredential] & 1) != 0)
    {
      char v22 = 1;
    }
    else
    {
      char v22 = [v17 couldSupportSuperEasyProvisioning] & IsSetupAssistant | IsExpressSetupAssistant;
    }
  }
  v20->_shouldAutoProvision = v22;
  int v25 = objc_msgSend(*p_paymentCredential, "isRemoteCredential", v68);
  id v26 = *p_paymentCredential;
  if (!v25)
  {
    if ([v26 isHomeKeyCredential])
    {
      uint64_t v32 = 11;
LABEL_17:
      v20->_credentialProvisioningType = v32;
      v20->_displayType = 0;
      goto LABEL_42;
    }
    if ([*p_paymentCredential isAppleBalanceCredential])
    {
      uint64_t v33 = 13;
      goto LABEL_20;
    }
    int v34 = [*p_paymentCredential isLocalPassCredential];
    id v35 = *p_paymentCredential;
    if (v34)
    {
      v36 = [v35 localPassCredential];
      v37 = [v36 paymentPass];
      int v38 = [v37 requiresTransferSerialNumberBasedProvisioning];

      if (!v38)
      {
        v20->_credentialProvisioningType = 0;
        goto LABEL_42;
      }
      uint64_t v32 = 1;
      goto LABEL_17;
    }
    int v39 = [v35 isDigitalIssuanceProductCredential];
    id v40 = *p_paymentCredential;
    if (v39)
    {
      id v41 = [v40 digitalIssuanceProductCredential];
      v42 = [v41 metadata];
      uint64_t v43 = [v42 count];

      if (v43) {
        v20->_displayType = 2;
      }
      v20->_credentialProvisioningType = 7;
      goto LABEL_64;
    }
    int v45 = [v40 isPurchasedProductCredential];
    id v46 = *p_paymentCredential;
    if (v45)
    {
      id v41 = [v46 purchasedProductCredential];
      v47 = [v41 purchase];
      uint64_t v48 = [v47 state];
      uint64_t v49 = 8;
      if (v48 == 3) {
        uint64_t v49 = 9;
      }
      v20->_credentialProvisioningType = v49;

      v50 = [v41 metadata];
      uint64_t v51 = [v50 count];

      if (v51)
      {
        uint64_t v52 = 2;
LABEL_63:
        v20->_displayType = v52;
        goto LABEL_64;
      }
      if (v20->_credentialProvisioningType == 9)
      {
        uint64_t v52 = 0;
        goto LABEL_63;
      }
    }
    else
    {
      if (![v46 isIssuerProvisioningExtensionCredential])
      {
        if ([*p_paymentCredential isSafariCredential])
        {
          uint64_t v33 = 12;
        }
        else
        {
          if ([*p_paymentCredential isPrecursorCredential])
          {
            uint64_t v32 = 14;
            goto LABEL_17;
          }
          uint64_t v33 = 6;
        }
LABEL_20:
        v20->_credentialProvisioningType = v33;
        goto LABEL_42;
      }
      v20->_credentialProvisioningType = 10;
      v20->_displayType = 2;
      v61 = [*p_paymentCredential issuerProvisioningExtensionCredential];
      v62 = [v61 entry];

      id v41 = v62;
      CGImageRef v63 = CGImageRetain((CGImageRef)[v41 art]);
      if (v63)
      {
        v64 = v63;
        v65 = (UIImage *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v63];
        CGImageRelease(v64);
        if (v65)
        {
          passSnapshot = v20->_passSnapshot;
          v20->_passSnapshot = v65;
          v67 = v65;

          v20->_passSnapshotNeedsCorners = 1;
          v20->_passSnapshotOverrideSize = (CGSize)DefaultSnapshotSize;
        }
      }
    }
LABEL_64:

    goto LABEL_42;
  }
  v27 = [v26 remoteCredential];
  v28 = [v27 metadata];
  uint64_t v29 = [v28 count];

  if (v29) {
    v20->_displayType = 2;
  }
  v30 = [v27 remoteCredential];
  uint64_t v31 = [v30 status];

  switch(v31)
  {
    case -1:
    case 0:
    case 3:
    case 4:
      v20->_credentialProvisioningType = 5;
      if (v20->_displayType == 1) {
        v20->_displayType = 0;
      }
      [(PKPaymentSetupFieldsViewController *)v20 _setRightBarButtonItems:0 animated:0];
      break;
    case 1:
      if ([*p_paymentCredential credentialType] == 135) {
        uint64_t v44 = 13;
      }
      else {
        uint64_t v44 = 4;
      }
      goto LABEL_40;
    case 2:
      uint64_t v44 = 3;
      goto LABEL_40;
    case 5:
      uint64_t v44 = 2;
LABEL_40:
      v20->_credentialProvisioningType = v44;
      break;
    default:
      break;
  }

LABEL_42:
  id v53 = [(PKPaymentSetupProduct *)v20->_setupProduct configuration];
  if ([v53 type] == 9 || objc_msgSend(*p_paymentCredential, "credentialType") == 123)
  {

LABEL_45:
    uint64_t v54 = 2;
    goto LABEL_46;
  }
  v57 = [*p_paymentCredential issuerProvisioningExtensionCredential];
  v58 = [v57 entry];
  v59 = [v58 addRequestConfiguration];
  int v60 = [v59 isPaymentAccount];

  if (v60) {
    goto LABEL_45;
  }
  if (v20->_credentialProvisioningType != 11)
  {
    v20->_category = 0;
    goto LABEL_47;
  }
  uint64_t v54 = 1;
LABEL_46:
  v20->_category = v54;
LABEL_47:
  id v18 = v69;
  [(PKPaymentSetupProvisioningFieldsViewController *)v20 setIgnoreProgressDescriptionUpdates:1];
  unint64_t v55 = [*p_paymentCredential cardType];
  if (v55 <= 4) {
    id v53 = **((id **)&unk_1E59DD8C8 + v55);
  }
  [v69 setProductType:v53 subtype:0];

LABEL_50:
  return v20;
}

- (void)dealloc
{
  [(PKPaymentProvisioningController *)self->_provisioningController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKPaymentSetupProvisioningFieldsViewController *)&v3 dealloc];
}

- (void)loadView
{
  v25.receiver = self;
  v25.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKPaymentSetupTableViewController *)&v25 loadView];
  unint64_t credentialProvisioningType = self->_credentialProvisioningType;
  if (credentialProvisioningType == 7) {
    [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  }
  v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self footerView];
  v5 = v4;
  if (credentialProvisioningType == 7 || self->_showSkipButton)
  {
    v7 = [v4 skipCardButton];
    [v7 addTarget:self action:sel__skipCard forControlEvents:0x2000];

    unint64_t category = self->_category;
    if (category == 2)
    {
      v9 = [v5 skipCardButton];
      uint64_t v11 = PKLocalizedAquamanString(&cfstr_AddAccountToWa.isa);
    }
    else
    {
      if (category == 1)
      {
        v9 = [v5 skipCardButton];
        v10 = @"ADD_TO_WALLET_LATER_KEY";
      }
      else
      {
        if (category) {
          goto LABEL_15;
        }
        v9 = [v5 skipCardButton];
        v10 = @"ADD_TO_WALLET_LATER";
      }
      uint64_t v11 = PKLocalizedPaymentString(&v10->isa);
    }
    v12 = (void *)v11;
    [v9 setTitle:v11 forState:0];
  }
LABEL_15:
  if (!self->_allowsManualEntry)
  {
    [(PKPaymentSetupProvisioningFieldsViewController *)self suppressFooterViewManualEntryButton];
    goto LABEL_27;
  }
  unint64_t v13 = self->_category;
  if (v13 == 2)
  {
    uint64_t v15 = PKLocalizedAquamanString(&cfstr_AddADifferentA.isa);
  }
  else
  {
    if (v13 == 1)
    {
      v14 = @"ADD_A_NEW_KEY";
    }
    else
    {
      if (v13)
      {
        id v16 = 0;
        goto LABEL_26;
      }
      v14 = @"ADD_A_NEW_CARD";
    }
    uint64_t v15 = PKLocalizedPaymentString(&v14->isa);
  }
  id v16 = (void *)v15;
LABEL_26:
  id v17 = [v5 manualEntryButton];
  [v17 setTitle:v16 forState:0];

LABEL_27:
  if (self->_displayType == 2)
  {
    if ((self->_credentialProvisioningType & 0xFFFFFFFFFFFFFFFELL) == 8) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 1;
    }
    v19 = [PKPaymentCredentialMetadataTableController alloc];
    v20 = [(PKPaymentCredential *)self->_paymentCredential metadata];
    v21 = [(PKPaymentCredentialMetadataTableController *)v19 initWithMetadata:v20 setupContext:[(PKPaymentSetupTableViewController *)self context] cellStyle:v18];
    metadataController = self->_metadataController;
    self->_metadataController = v21;
  }
  if ([(PKPaymentSetupProvisioningFieldsViewController *)self hideSetupLaterButton]) {
    [(PKPaymentSetupProvisioningFieldsViewController *)self suppressFooterViewSetupLaterButton];
  }
  unint64_t v23 = self->_credentialProvisioningType;
  if (v23 == 9)
  {
    [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:0 animated:0];
    [(PKPaymentSetupProvisioningFieldsViewController *)self suppressFooterViewSkipCardButton];
    unint64_t v23 = self->_credentialProvisioningType;
  }
  if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    v24 = PKLocalizedPaymentString(&cfstr_SetupPurchaseC.isa);
    [(PKPaymentSetupProvisioningFieldsViewController *)self setNotificationTextInFooterView:v24];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKPaymentSetupProvisioningFieldsViewController *)&v12 viewWillAppear:a3];
  if (PKShowFakePaymentSetupFields())
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Showing fake payment setup fields", v11, 2u);
    }

    v5 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
    v6 = [MEMORY[0x1E4F84C88] fakePaymentSetupProvisioningFields];
    [v5 updateWithPaymentSetupFields:v6];
  }
  BOOL v7 = [(PKNewPaymentCredentialProvisioningViewController *)self isComplete];
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItemsEnabled:v7];
  [(PKPaymentSetupFieldsViewController *)self noteFieldIdentifiersChangedAndUpdateHeaders];
  [(PKNewPaymentCredentialProvisioningViewController *)self _updatePassSnapshotHeader];
  if (v7 && self->_shouldAutoProvision)
  {
    v8 = [(PKPaymentCredentialProvisioningViewControllerCoordinator *)self->_coordinator provisionedPass];

    if (!v8)
    {
      self->_shouldAutoProvision = 0;
      [(PKNewPaymentCredentialProvisioningViewController *)self didTransitionTo:4 loading:1];
      coordinator = self->_coordinator;
      v10 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
      [(PKPaymentCredentialProvisioningViewControllerCoordinator *)coordinator continueWithFieldModel:v10];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKPaymentSetupFieldsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKNewPaymentCredentialProvisioningViewController *)&v4 viewDidDisappear:a3];
  if ([(PKNewPaymentCredentialProvisioningViewController *)self isMovingFromParentViewController])[(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter resetProductTypes]; {
}
  }

- (void)addDifferentCard:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:1];
  id v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self flowItemDelegate];
  [v4 provisioningViewControllerDidSelectManualEntry:self];
}

- (void)handleNextButtonTapped:(id)a3
{
  [(PKPaymentSetupProvisioningFieldsViewController *)self updateLocationAuthorization];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  coordinator = self->_coordinator;
  id v5 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  [(PKPaymentCredentialProvisioningViewControllerCoordinator *)coordinator continueWithFieldModel:v5];
}

- (void)_skipCard
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Skipping to next credential", v5, 2u);
  }

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  [(PKPaymentSetupFieldsViewController *)self showActivitySpinnerWithTitle:0 subtitle:0];
  [(PKPaymentSetupFieldsViewController *)self resetCellStyling];
  id v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self flowItemDelegate];
  [v4 provisioningViewController:self didFinishWithSuccess:0];
}

- (void)setPassSnapshot:(id)a3 needsCorners:(BOOL)a4
{
  self->_passSnapshotNeedsCorners = a4;
}

- (void)_createPassSnapshotFromPaymentPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak(location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke;
      v9[3] = &unk_1E59CB038;
      objc_copyWeak(&v12, location);
      id v10 = v6;
      id v11 = v7;
      [v10 loadImageSetAsync:0 preheat:1 withCompletion:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "No payment pass to generate snapshot", (uint8_t *)location, 2u);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __98__PKNewPaymentCredentialProvisioningViewController__createPassSnapshotFromPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [[PKPassView alloc] initWithPass:*(void *)(a1 + 32) content:5 suppressedContent:4087];
    id v4 = [(PKPassView *)v3 snapshotOfFrontFace];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id WeakRetained = v5;
  }
}

- (void)_updatePassSnapshotHeader
{
  unint64_t credentialProvisioningType = self->_credentialProvisioningType;
  uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self headerView];
  id v5 = (void *)v4;
  if (credentialProvisioningType != 12 && v4 != 0)
  {
    passSnapshotPlaceHolder = self->_passSnapshotPlaceHolder;
    if (self->_passSnapshot)
    {
      self->_passSnapshotPlaceHolder = 0;

      if (self->_passSnapshotOverrideSize.width == *MEMORY[0x1E4F1DB30]
        && self->_passSnapshotOverrideSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        [v5 setPassSnapshotUsingDefaultSize:self->_passSnapshot animated:passSnapshotPlaceHolder != 0 needsCorners:self->_passSnapshotNeedsCorners];
      }
      else
      {
        objc_msgSend(v5, "setPassSnapshot:withSize:animated:needsCorners:", self->_passSnapshot, passSnapshotPlaceHolder != 0, self->_passSnapshotNeedsCorners);
      }
    }
    else
    {
      if (!passSnapshotPlaceHolder)
      {
        PKUIImageNamed(@"PlaceholderCardArt_Large");
        v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        id v10 = self->_passSnapshotPlaceHolder;
        self->_passSnapshotPlaceHolder = v9;

        passSnapshotPlaceHolder = self->_passSnapshotPlaceHolder;
      }
      objc_msgSend(v5, "setImageViewImage:withSize:animated:", passSnapshotPlaceHolder, 0, 130.0, 82.0);
      id v11 = [(PKPaymentCredential *)self->_paymentCredential underlyingPaymentPass];
      if (v11)
      {
        id v12 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
        unint64_t v13 = [v12 targetDevice];

        v14 = [v13 secureElementIdentifiers];
        int v15 = [v11 remoteAssetsDownloadedForSEIDs:v14];

        if (v15)
        {
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __77__PKNewPaymentCredentialProvisioningViewController__updatePassSnapshotHeader__block_invoke;
          v17[3] = &unk_1E59CA898;
          v17[4] = self;
          [(PKNewPaymentCredentialProvisioningViewController *)self _createPassSnapshotFromPaymentPass:v11 completion:v17];
        }
      }
    }
    [v5 sizeToFit];
    id v16 = [(PKPaymentSetupTableViewController *)self tableView];
    [v5 bounds];
    [v16 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v18)];
  }
}

void __77__PKNewPaymentCredentialProvisioningViewController__updatePassSnapshotHeader__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1368), a2);
    [*(id *)(a1 + 32) _updatePassSnapshotHeader];
    id v4 = v5;
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  if (self->_metadataController)
  {
    id v5 = -[PKPaymentCredentialMetadataTableController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_metadataController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    id v5 = -[PKPaymentSetupTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](&v7, sel_tableView_contextMenuConfigurationForRowAtIndexPath_point_, a3, a4, a5.x, a5.y);
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_metadataController)
  {
    metadataController = self->_metadataController;
    return [(PKPaymentCredentialMetadataTableController *)metadataController numberOfRowsInSection:a4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    return [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 numberOfRowsInSection:a4];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_metadataController)
  {
    metadataController = self->_metadataController;
    [(PKPaymentCredentialMetadataTableController *)metadataController willDisplayCell:a4 forRowAtIndexPath:a5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 willDisplayCell:a4 forRowAtIndexPath:a5];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (self->_metadataController) {
    return *MEMORY[0x1E4FB2F28];
  }
  v5.receiver = self;
  v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  [(PKPaymentSetupFieldsViewController *)&v5 tableView:a3 heightForRowAtIndexPath:a4];
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  metadataController = self->_metadataController;
  if (metadataController)
  {
    id v6 = [(PKPaymentCredentialMetadataTableController *)metadataController cellForRowAtIndexPath:a4];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
    id v6 = [(PKPaymentSetupFieldsViewController *)&v12 tableView:a3 cellForRowAtIndexPath:a4];
    objc_super v7 = [v6 paymentSetupField];
    v8 = [v7 identifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F87B08]];

    if (v9)
    {
      paymentCredential = self->_paymentCredential;
      id v6 = v6;
      objc_msgSend(v6, "setPaymentCredentialType:", -[PKPaymentCredential credentialType](paymentCredential, "credentialType"));
    }
  }

  return v6;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543362;
    v28 = v7;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting: %{public}@", buf, 0xCu);
  }
  v8 = [(PKPaymentCredential *)self->_paymentCredential localPassCredential];
  int v9 = [v8 paymentPass];

  int v10 = [(PKPaymentCredential *)self->_paymentCredential isPurchasedProductCredential];
  paymentCredential = self->_paymentCredential;
  if (v10)
  {
    objc_super v12 = [(PKPaymentCredential *)paymentCredential purchasedProductCredential];
LABEL_7:
    unint64_t v13 = v12;
    v14 = [v12 product];

    goto LABEL_9;
  }
  if ([(PKPaymentCredential *)paymentCredential isDigitalIssuanceProductCredential])
  {
    objc_super v12 = [(PKPaymentCredential *)self->_paymentCredential digitalIssuanceProductCredential];
    goto LABEL_7;
  }
  v14 = 0;
LABEL_9:
  int v15 = dispatch_group_create();
  if ([v9 isTransitPass])
  {
    id v16 = [(PKPaymentWebService *)self->_webService targetDevice];
    if (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(v15);
      id v17 = [v9 uniqueID];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke;
      v24[3] = &unk_1E59D36D8;
      v24[4] = self;
      id v25 = v9;
      id v26 = v15;
      [v16 plansForPaymentPassWithUniqueIdentifier:v17 completion:v24];
    }
  }
  if (v14)
  {
    dispatch_group_enter(v15);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_2;
    v22[3] = &unk_1E59CC3C8;
    v22[4] = self;
    unint64_t v23 = v15;
    id v18 = (id)[v14 digitalCardCachedImage:v22];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_3;
  v20[3] = &unk_1E59CAA98;
  id v21 = v4;
  id v19 = v4;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v20);
}

void __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F850D0];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithPass:a1[5]];
  uint64_t v6 = a1[4];
  objc_super v7 = *(void **)(v6 + 1416);
  *(void *)(v6 + 1416) = v5;

  [*(id *)(a1[4] + 1416) updateWithDynamicCommutePlans:v4];
  v8 = a1[6];

  dispatch_group_leave(v8);
}

void __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1368), a3);
    *(unsigned char *)(*(void *)(a1 + 32) + 1376) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __76__PKNewPaymentCredentialProvisioningViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)defaultFields
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)visibleFieldIdentifiers
{
  if (self->_displayType == 1)
  {
    v2 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
    id v3 = [v2 visibleSetupFieldIdentifiers];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)readonlyFieldIdentifiers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_credentialProvisioningType == 13)
  {
    v6[0] = *MEMORY[0x1E4F87AF8];
    v2 = v6;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F87B08];
    v2 = &v5;
  }
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];

  return v3;
}

- (BOOL)isComplete
{
  unint64_t credentialProvisioningType = self->_credentialProvisioningType;
  if (credentialProvisioningType == 5 || credentialProvisioningType == 9) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKNewPaymentCredentialProvisioningViewController;
  return [(PKPaymentSetupFieldsViewController *)&v5 isComplete];
}

- (void)didUpdateFieldModel
{
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItemsEnabled:[(PKNewPaymentCredentialProvisioningViewController *)self isComplete]];

  [(PKPaymentSetupFieldsViewController *)self noteFieldIdentifiersChanged];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  unint64_t credentialProvisioningType = self->_credentialProvisioningType;
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    if (credentialProvisioningType == 13)
    {
      uint64_t v6 = PKLocalizedLynxString(&cfstr_CouldNotAddCar.isa);
      uint64_t v7 = PKLocalizedLynxString(&cfstr_CouldNotAddCar_0.isa);
    }
    else
    {
      unint64_t category = self->_category;
      if (category == 2)
      {
        uint64_t v6 = PKLocalizedAquamanString(&cfstr_CouldNotAddAcc.isa);
        uint64_t v7 = PKLocalizedAquamanString(&cfstr_CouldNotAddAcc_0.isa);
      }
      else
      {
        if (category == 1)
        {
          uint64_t v6 = PKLocalizedPaymentString(&cfstr_CouldNotAddKey.isa);
          int v9 = @"COULD_NOT_ADD_HOME_KEY_MESSAGE";
        }
        else
        {
          if (category)
          {
            uint64_t v6 = 0;
            int v10 = 0;
            goto LABEL_12;
          }
          uint64_t v6 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
          int v9 = @"COULD_NOT_ADD_CARD_MESSAGE";
        }
        uint64_t v7 = PKLocalizedPaymentString(&v9->isa);
      }
    }
    int v10 = (void *)v7;
LABEL_12:
    [v4 setLocalizedTitle:v6];
    [v4 setLocalizedMessage:v10];
  }
  if (self->_hasRemainingCredentialsToProvision)
  {
    unint64_t v11 = self->_category;
    if (v11 != 2)
    {
      if (v11 == 1)
      {
        objc_super v12 = @"ADD_TO_WALLET_LATER_KEY";
        goto LABEL_25;
      }
      if (!v11)
      {
        objc_super v12 = @"ADD_TO_WALLET_LATER";
LABEL_25:
        uint64_t v13 = PKLocalizedPaymentString(&v12->isa);
        goto LABEL_26;
      }
LABEL_32:
      int v15 = 0;
      goto LABEL_27;
    }
    v14 = @"ADD_ACCOUNT_TO_WALLET_LATER";
LABEL_23:
    uint64_t v13 = PKLocalizedAquamanString(&v14->isa);
    goto LABEL_26;
  }
  [(PKPaymentSetupTableViewController *)self context];
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    objc_super v12 = @"SET_UP_LATER_BUTTON_TITLE";
    goto LABEL_25;
  }
  if (credentialProvisioningType != 13)
  {
    unint64_t v17 = self->_category;
    if (v17 != 2)
    {
      if (v17 == 1)
      {
        objc_super v12 = @"COULD_NOT_ADD_KEY_ADD_LATER";
        goto LABEL_25;
      }
      if (!v17)
      {
        objc_super v12 = @"COULD_NOT_ADD_CARD_ADD_LATER";
        goto LABEL_25;
      }
      goto LABEL_32;
    }
    v14 = @"COULD_NOT_ADD_ACCOUNT_ADD_LATER";
    goto LABEL_23;
  }
  uint64_t v13 = PKLocalizedLynxString(&cfstr_OkButtonTitle.isa);
LABEL_26:
  int v15 = (void *)v13;
LABEL_27:
  v18[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v19[3] = &unk_1E59CA7D0;
  v19[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v18[3] = &unk_1E59CA7D0;
  id v16 = [MEMORY[0x1E4FB1418] alertForErrorWithError:v4 acknowledgeButtonText:0 exitButtonText:v15 onAcknowledge:&__block_literal_global_201 onExit:v19 onTryAgain:v18];
  [(PKNewPaymentCredentialProvisioningViewController *)self presentViewController:v16 animated:1 completion:0];
}

uint64_t __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1440) terminate];
}

void __78__PKNewPaymentCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[180];
  id v3 = [v1 fieldsModel];
  [v2 continueWithFieldModel:v3];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    unint64_t credentialProvisioningType = self->_credentialProvisioningType;
    if ((unint64_t)(a3 - 1) < 5)
    {
      if (credentialProvisioningType - 1 <= 1)
      {
        uint64_t v6 = @"SETTINGS_TRANSFER_PASS_MOVING";
LABEL_5:
        PKLocalizedPaymentString(&v6->isa);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = @"PROGRESS_CONTACTING_ISSUER";
LABEL_6:
        uint64_t v8 = PKLocalizedPaymentString(&v7->isa);
LABEL_23:
        id v14 = v24;
        int v10 = (void *)v8;
LABEL_41:
        id v25 = v14;
        [(PKPaymentSetupFieldsViewController *)self showActivitySpinnerWithTitle:v14 subtitle:v10];
        goto LABEL_42;
      }
      if (credentialProvisioningType == 13)
      {
LABEL_15:
        PKLocalizedPaymentString(&cfstr_AddingCard.isa);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = PKLocalizedLynxString(&cfstr_AddingCardBody.isa);
        goto LABEL_23;
      }
      unint64_t category = self->_category;
      if (category != 2)
      {
        if (category == 1)
        {
          PKLocalizedPaymentString(&cfstr_AddingKey.isa);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v7 = @"PROGRESS_CONTACTING_ISSUER_KEY";
          goto LABEL_6;
        }
        if (!category)
        {
          uint64_t v6 = @"ADDING_CARD";
          goto LABEL_5;
        }
LABEL_34:
        int v10 = 0;
        id v14 = 0;
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    if (a3 == 6)
    {
      if (credentialProvisioningType - 1 > 1)
      {
        if (credentialProvisioningType == 13) {
          goto LABEL_15;
        }
        unint64_t v17 = self->_category;
        if (v17 == 2)
        {
LABEL_35:
          PKLocalizedAquamanString(&cfstr_AddingAccount.isa);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [(PKPaymentCredential *)self->_paymentCredential longDescription];
          id v16 = (__CFString *)v18;
          if (v18) {
            PKLocalizedAquamanString(&cfstr_ProgressSettin_0.isa, &stru_1EF1B4C70.isa, v18);
          }
          else {
          uint64_t v19 = PKLocalizedAquamanString(&cfstr_ProgressSettin.isa);
          }
          goto LABEL_40;
        }
        if (v17 == 1)
        {
          PKLocalizedPaymentString(&cfstr_AddingKey.isa);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          id v16 = [(PKPaymentCredential *)self->_paymentCredential longDescription];
          uint64_t v19 = PKLocalizedPaymentString(&cfstr_SettupUpPass.isa, &stru_1EF1B4C70.isa, v16);
          goto LABEL_40;
        }
        if (v17) {
          goto LABEL_34;
        }
        uint64_t v13 = @"ADDING_CARD";
      }
      else
      {
        uint64_t v13 = @"SETTINGS_TRANSFER_PASS_MOVING";
      }
      PKLocalizedPaymentString(&v13->isa);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = PKCoreLocalizedString(&cfstr_ProgressEnabli.isa);
      goto LABEL_23;
    }
    if (a3 != 7) {
      goto LABEL_34;
    }
    if (credentialProvisioningType - 1 > 1)
    {
      if (credentialProvisioningType != 13)
      {
        unint64_t v23 = self->_category;
        if (v23 == 2)
        {
          uint64_t v15 = PKLocalizedAquamanString(&cfstr_AddingAccount.isa);
LABEL_27:
          id v26 = (id)v15;
          if (!self->_category)
          {
            v20 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
            id v21 = [v20 targetDevice];
            char v22 = [v21 deviceName];

            PKDeviceSpecificLocalizedStringKeyForKey(@"PROGRESS_DOWNLOADING_CARD", [v22 isEqualToString:@"Apple Watch"]);
            id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
LABEL_28:
          id v16 = @"PROGRESS_DOWNLOADING_CARD_IPHONE";
LABEL_39:
          uint64_t v19 = PKCoreLocalizedString(&v16->isa);
LABEL_40:
          int v10 = (void *)v19;

          id v14 = v26;
          goto LABEL_41;
        }
        if (v23 == 1)
        {
          unint64_t v11 = @"ADDING_KEY";
          goto LABEL_26;
        }
        if (v23)
        {
          id v26 = 0;
          goto LABEL_28;
        }
      }
      unint64_t v11 = @"ADDING_CARD";
    }
    else
    {
      unint64_t v11 = @"SETTINGS_TRANSFER_PASS_MOVING";
    }
LABEL_26:
    uint64_t v15 = PKLocalizedPaymentString(&v11->isa);
    goto LABEL_27;
  }
  if (a3 == 8)
  {
    id v25 = [(PKPaymentCredentialProvisioningViewControllerCoordinator *)self->_coordinator provisionedPass];
    int v9 = [v25 paymentPass];
    [(PKPaymentSetupProvisioningFieldsViewController *)self showVerifiedUIForPass:v9];

    [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:1];
    [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:0 animated:0];
    goto LABEL_43;
  }
  id v25 = [(PKNewPaymentCredentialProvisioningViewController *)self defaultHeaderViewTitle];
  int v10 = [(PKNewPaymentCredentialProvisioningViewController *)self defaultHeaderViewSubTitle];
  [(PKPaymentSetupFieldsViewController *)self hideActivitySpinnerWithTitle:v25 subtitle:v10 animated:1];
LABEL_42:

LABEL_43:
}

- (id)defaultHeaderViewTitle
{
  switch(self->_credentialProvisioningType)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      unint64_t category = self->_category;
      switch(category)
      {
        case 2uLL:
          uint64_t v8 = @"ADD_ACCOUNT";
          goto LABEL_10;
        case 1uLL:
          goto LABEL_6;
        case 0uLL:
          id v4 = @"ADD_CARD";
          goto LABEL_20;
      }
      goto LABEL_26;
    case 1uLL:
    case 2uLL:
      if ([(PKTransitBalanceModel *)self->_transitBalanceModel hasDeviceBoundCommutePlans])
      {
        objc_super v5 = [(PKPaymentCredential *)self->_paymentCredential localPassCredential];
        uint64_t v6 = [v5 paymentPass];

        uint64_t v7 = PKPassLocalizedStringWithFormat();

        goto LABEL_27;
      }
      id v4 = @"SETTINGS_TRANSFER_PASS_TITLE";
      goto LABEL_20;
    case 5uLL:
      unint64_t v14 = self->_category;
      if (v14 == 2)
      {
        uint64_t v8 = @"ACCOUNT_UNAVAILABLE";
        goto LABEL_10;
      }
      if (v14 == 1)
      {
        id v4 = @"UNABLE_TO_ADD_Key";
      }
      else
      {
        if (v14) {
          goto LABEL_26;
        }
        id v4 = @"UNABLE_TO_ADD_CARD";
      }
      goto LABEL_20;
    case 8uLL:
      id v4 = @"PENDING_PURCHASE";
      goto LABEL_20;
    case 9uLL:
      id v4 = @"REFUNDED_PURCHASE";
      goto LABEL_20;
    case 0xAuLL:
      int v10 = [(PKPaymentCredential *)self->_paymentCredential issuerProvisioningExtensionCredential];
      unint64_t v11 = [v10 entry];
      objc_super v12 = [v11 addRequestConfiguration];
      uint64_t v13 = [v12 style];

      if (v13 == 1)
      {
        id v4 = @"ISSUER_ADD_CARD_WALLET";
LABEL_20:
        uint64_t v9 = PKLocalizedPaymentString(&v4->isa);
LABEL_21:
        uint64_t v7 = (void *)v9;
        goto LABEL_27;
      }
      unint64_t v15 = self->_category;
      switch(v15)
      {
        case 2uLL:
          uint64_t v8 = @"ISSUER_ADD_ACCOUNT_WALLET";
LABEL_10:
          uint64_t v9 = PKLocalizedAquamanString(&v8->isa);
          goto LABEL_21;
        case 1uLL:
          id v4 = @"ISSUER_ADD_KEY";
          goto LABEL_20;
        case 0uLL:
          id v4 = @"ISSUER_ADD_CARD";
          goto LABEL_20;
      }
LABEL_26:
      uint64_t v7 = 0;
LABEL_27:
      return v7;
    case 0xBuLL:
LABEL_6:
      id v4 = @"ADD_KEY";
      goto LABEL_20;
    default:
      goto LABEL_26;
  }
}

- (id)defaultHeaderViewSubTitle
{
  switch(self->_credentialProvisioningType)
  {
    case 0uLL:
      uint64_t v3 = [(PKNewPaymentCredentialProvisioningViewController *)self _defaultHeaderViewSubTitleForLocalCredential];
      goto LABEL_3;
    case 1uLL:
      uint64_t v3 = [(PKNewPaymentCredentialProvisioningViewController *)self _defaultHeaderViewSubTitleForLocalCredentialTransfer];
      goto LABEL_3;
    case 2uLL:
      objc_super v5 = [(PKPaymentCredential *)self->_paymentCredential remoteCredential];
      uint64_t v6 = [v5 transferableFromDevices];
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = [v7 name];

      [(PKPaymentSetupTableViewController *)self context];
      if (PKPaymentSetupContextIsBridge())
      {
        if (v8)
        {
          char v22 = v8;
          unint64_t v23 = v8;
          uint64_t v9 = @"SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_WATCH_NAME";
LABEL_20:
          PKLocalizedPaymentString(&v9->isa, &stru_1EF1B5770.isa, v22, v23);
          goto LABEL_21;
        }
        unint64_t v17 = @"SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_WATCH";
LABEL_33:
        uint64_t v10 = PKLocalizedPaymentString(&v17->isa);
LABEL_34:
        id v4 = (__CFString *)v10;
      }
      else
      {
        if (v8)
        {
          char v22 = v8;
          unint64_t v23 = v8;
          uint64_t v9 = @"SETTINGS_TRANSFER_PASS_SUBTITLE_REMOTE_TO_IPHONE_NAME";
          goto LABEL_20;
        }
        uint64_t v18 = [(PKPaymentCredential *)self->_paymentCredential remoteCredential];
        unint64_t v14 = [v18 paymentPass];

        uint64_t v19 = [v14 paymentApplications];
        int v20 = objc_msgSend(v19, "pk_hasObjectPassingTest:", &__block_literal_global_267);

        if (v20) {
          PKPassLocalizedStringWithFormat();
        }
        else {
        uint64_t v15 = PKLocalizedPaymentString(&cfstr_SettingsTransf_4.isa);
        }
LABEL_16:
        id v4 = (__CFString *)v15;
      }
LABEL_35:

LABEL_36:
      return v4;
    case 3uLL:
    case 4uLL:
    case 0xBuLL:
    case 0xEuLL:
      uint64_t v3 = [(PKNewPaymentCredentialProvisioningViewController *)self _remoteExistingCredentialDefaultHeaderViewSubTitle];
      goto LABEL_3;
    case 5uLL:
      uint64_t v8 = [(PKPaymentCredential *)self->_paymentCredential remoteCredential];
      uint64_t v10 = [v8 statusDescription];
      goto LABEL_34;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      id v4 = &stru_1EF1B5B50;
      goto LABEL_36;
    case 0xAuLL:
      unint64_t v11 = [(PKPaymentCredential *)self->_paymentCredential issuerProvisioningExtensionCredential];
      objc_super v12 = [v11 entry];
      uint64_t v13 = [v12 addRequestConfiguration];
      uint64_t v8 = [v13 localizedDescription];

      if ([v8 length])
      {
        PKLocalizedPaymentString(&cfstr_IssuerAddDescr_0.isa, &stru_1EF1B4C70.isa, v8);
        uint64_t v10 = LABEL_21:;
        goto LABEL_34;
      }
      unint64_t category = self->_category;
      switch(category)
      {
        case 2uLL:
          uint64_t v10 = PKLocalizedAquamanString(&cfstr_IssuerAddAccou_0.isa);
          goto LABEL_34;
        case 1uLL:
          unint64_t v17 = @"ISSUER_ADD_DESCRIPTION_GENERIC_KEY";
          goto LABEL_33;
        case 0uLL:
          unint64_t v17 = @"ISSUER_ADD_DESCRIPTION_GENERIC";
          goto LABEL_33;
      }
      id v4 = 0;
      goto LABEL_35;
    case 0xCuLL:
      uint64_t v8 = [(PKPaymentCredential *)self->_paymentCredential longDescription];
      if ([v8 length])
      {
        unint64_t v14 = [(PKPaymentCredential *)self->_paymentCredential longDescription];
        uint64_t v15 = PKLocalizedVirtualCardString(&cfstr_ProvisioningAd.isa, &stru_1EF1B4C70.isa, v14);
        goto LABEL_16;
      }
      uint64_t v10 = PKLocalizedVirtualCardString(&cfstr_ProvisioningAd_0.isa);
      goto LABEL_34;
    case 0xDuLL:
      uint64_t v3 = PKLocalizedLynxString(&cfstr_AddCardBody.isa);
LABEL_3:
      id v4 = (__CFString *)v3;
      goto LABEL_36;
    default:
      id v4 = 0;
      goto LABEL_36;
  }
}

BOOL __77__PKNewPaymentCredentialProvisioningViewController_defaultHeaderViewSubTitle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 paymentNetworkIdentifier] == 131;
}

- (id)_remoteExistingCredentialDefaultHeaderViewSubTitle
{
  if (self->_displayType != 1)
  {
    uint64_t v18 = &stru_1EF1B5B50;
    goto LABEL_44;
  }
  unint64_t credentialProvisioningType = self->_credentialProvisioningType;
  [(PKPaymentSetupTableViewController *)self context];
  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  objc_super v5 = [(PKNewPaymentCredentialProvisioningViewController *)self visibleFieldIdentifiers];
  uint64_t v6 = [(PKNewPaymentCredentialProvisioningViewController *)self readonlyFieldIdentifiers];
  uint64_t v7 = objc_msgSend(v5, "pk_arrayByRemovingObjectsInArray:", v6);

  uint64_t v8 = [(PKPaymentCredential *)self->_paymentCredential state];
  uint64_t v9 = [v8 requirementsResponse];
  uint64_t v10 = [v9 requiredPaymentSetupFields];
  uint64_t v11 = [v10 count];

  if ([v7 count] == 1 && objc_msgSend(v7, "containsObject:", *MEMORY[0x1E4F87B10]))
  {
    unint64_t category = self->_category;
    uint64_t v13 = @"ENTER_ON_FILE_CARD_SECURITY_CODE_%@";
    if (IsSetupAssistant)
    {
      uint64_t v13 = @"ENTER_ON_FILE_CARD_SECURITY_CODE_SETUP_ASSISTANT_%@";
      unint64_t v14 = @"ENTER_ON_FILE_ACCOUNT_SECURITY_CODE_SETUP_ASSISTANT_%@";
    }
    else
    {
      unint64_t v14 = @"ENTER_ON_FILE_ACCOUNT_SECURITY_CODE_%@";
    }
    BOOL v15 = category >= 2;
    if (category == 2) {
      id v16 = v14;
    }
    else {
      id v16 = 0;
    }
    if (v15) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v13;
    }
  }
  else
  {
    uint64_t v19 = [v7 count];
    unint64_t v20 = self->_category;
    if (v19)
    {
      id v21 = @"VERIFY_AND_COMPLETE_ON_FILE_CARD_INFO_%@";
      BOOL v22 = v20 >= 2;
      BOOL v23 = v20 == 2;
      id v24 = @"VERIFY_AND_COMPLETE_ON_FILE_ACCOUNT_INFO_%@";
    }
    else
    {
      if (v20 != 2 && credentialProvisioningType != 3 && !v11)
      {
        int v25 = 1;
        unint64_t v17 = @"CONFIRM_ADDING_ON_FILE_CARD_INFO_%@";
        goto LABEL_28;
      }
      id v21 = @"VERIFY_ON_FILE_CARD_INFO_%@";
      BOOL v22 = v20 >= 2;
      BOOL v23 = v20 == 2;
      id v24 = @"VERIFY_ON_FILE_ACCOUNT_INFO_%@";
    }
    if (!v23) {
      id v24 = 0;
    }
    if (v22) {
      unint64_t v17 = v24;
    }
    else {
      unint64_t v17 = v21;
    }
  }
  if (credentialProvisioningType != 3)
  {
    int v25 = 0;
LABEL_28:
    id v26 = [(PKPaymentCredential *)self->_paymentCredential longDescription];
    if (v26)
    {
      PKStringWithValidatedFormat();
      unint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        [(PKPaymentSetupTableViewController *)self context];
        int IsBridge = PKPaymentSetupContextIsBridge();
        uint64_t v28 = PKDeviceSpecificLocalizedStringKeyForKey(v17, IsBridge);

        unint64_t v17 = (__CFString *)v28;
      }
      unint64_t v29 = self->_category;
      if (v29 < 2)
      {
        uint64_t v30 = PKLocalizedPaymentString(&v17->isa, &stru_1EF1B4C70.isa, v26);
LABEL_40:
        uint64_t v18 = (__CFString *)v30;
LABEL_42:

        goto LABEL_43;
      }
      if (v29 == 2)
      {
        uint64_t v30 = PKLocalizedAquamanString(&v17->isa, &stru_1EF1B4C70.isa, v26);
        goto LABEL_40;
      }
    }
    uint64_t v18 = &stru_1EF1B5B50;
    goto LABEL_42;
  }
  PKStringWithValidatedFormat();
  unint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = self->_category;
  if (v31 < 2)
  {
    id v26 = PKStringWithValidatedFormat();
    uint64_t v30 = PKLocalizedPaymentString((NSString *)v26);
    goto LABEL_40;
  }
  if (v31 == 2)
  {
    id v26 = PKStringWithValidatedFormat();
    uint64_t v30 = PKLocalizedAquamanString((NSString *)v26);
    goto LABEL_40;
  }
  uint64_t v18 = &stru_1EF1B5B50;
LABEL_43:

LABEL_44:

  return v18;
}

- (id)_defaultHeaderViewSubTitleForLocalCredentialTransfer
{
  uint64_t v3 = [(PKPaymentCredential *)self->_paymentCredential localPassCredential];
  id v4 = [v3 paymentPass];

  int v5 = [(PKTransitBalanceModel *)self->_transitBalanceModel hasDeviceBoundCommutePlans];
  uint64_t v6 = [v4 devicePrimaryPaymentApplication];
  uint64_t v7 = [v6 paymentNetworkIdentifier];

  if ([v4 isRemotePass])
  {
    if (v7 == 131) {
      goto LABEL_5;
    }
    uint64_t v9 = @"SETTINGS_TRANSFER_PASS_SUBTITLE_WATCH_TO_IPHONE";
  }
  else
  {
    if (v5)
    {
LABEL_5:
      uint64_t v8 = PKPassLocalizedStringWithFormat();
      goto LABEL_9;
    }
    uint64_t v9 = @"SETTINGS_TRANSFER_PASS_SUBTITLE_IPHONE_TO_WATCH";
  }
  uint64_t v8 = PKLocalizedPaymentString(&v9->isa);
LABEL_9:
  uint64_t v10 = (void *)v8;

  return v10;
}

- (id)_defaultHeaderViewSubTitleForLocalCredential
{
  [(PKPaymentCredential *)self->_paymentCredential credentialType];
  uint64_t v3 = [(PKNewPaymentCredentialProvisioningViewController *)self visibleFieldIdentifiers];
  id v4 = [(PKNewPaymentCredentialProvisioningViewController *)self readonlyFieldIdentifiers];
  int v5 = objc_msgSend(v3, "pk_arrayByRemovingObjectsInArray:", v4);

  if ([v5 count] == 1 && (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E4F87B10]) & 1) != 0)
  {
    uint64_t v6 = @"ENTER_LOCAL_PASS_SECURITY_CODE_APPLE_WATCH";
  }
  else if ([v5 count])
  {
    uint64_t v6 = @"VERIFY_AND_COMPLETE_LOCAL_PASS_INFO_APPLE_WATCH";
  }
  else if ([v3 count])
  {
    uint64_t v6 = @"VERIFY_LOCAL_PASS_INFO_APPLE_WATCH";
  }
  else
  {
    uint64_t v6 = @"CONFIRM_ADDING_LOCAL_PASS_APPLE_WATCH";
  }
  uint64_t v7 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType();
  uint64_t v8 = PKLocalizedPaymentString(&v6->isa, &stru_1EF1B4C70.isa, v7);

  return v8;
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  if ([a3 isEqual:self->_paymentCredential])
  {
    [(PKNewPaymentCredentialProvisioningViewController *)self _updatePassSnapshotHeader];
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    [(PKPaymentSetupFieldsViewController *)self endUserInteraction];
  }
}

- (BOOL)hasRemainingCredentialsToProvision
{
  return self->_hasRemainingCredentialsToProvision;
}

- (void)setHasRemainingCredentialsToProvision:(BOOL)a3
{
  self->_hasRemainingCredentialsToProvision = a3;
}

- (BOOL)showSkipButton
{
  return self->_showSkipButton;
}

- (void)setShowSkipButton:(BOOL)a3
{
  self->_showSkipButton = a3;
}

- (PKPaymentCredentialProvisioningViewControllerCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_passSnapshot, 0);
  objc_storeStrong((id *)&self->_setupProduct, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);
  objc_storeStrong((id *)&self->_passSnapshotPlaceHolder, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end