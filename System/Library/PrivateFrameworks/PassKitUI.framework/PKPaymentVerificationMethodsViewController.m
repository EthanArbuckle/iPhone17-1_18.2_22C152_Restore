@interface PKPaymentVerificationMethodsViewController
- (BOOL)alwaysPerformExternalVerificationInline;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentVerificationController)verificationController;
- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3;
- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 fieldsModel:(id)a4;
- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 verificationChannels:(id)a4;
- (PKPaymentVerificationMethodsViewControllerFlowItemDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_newVerificationRequest;
- (id)_requestErrorAlertController:(id)a3;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)presentationContext;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)visibleFieldIdentifiers;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configure;
- (void)_handleVerificationFinished;
- (void)_loadVerificationOptions;
- (void)_showSetupAssistantVerifyLaterAlertAndTerminate;
- (void)_terminateSetupFlow;
- (void)_verifyLaterButtonPressed;
- (void)handleNextButtonTapped:(id)a3;
- (void)hideActivitySpinner;
- (void)loadView;
- (void)setAlwaysPerformExternalVerificationInline:(BOOL)a3;
- (void)setFlowItemDelegate:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setReporter:(id)a3;
- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentVerificationMethodsViewController

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 fieldsModel:(id)a4
{
  v6 = (PKPaymentVerificationController *)a3;
  id v7 = a4;
  v8 = [(PKPaymentVerificationController *)v6 webService];
  uint64_t v9 = [(PKPaymentVerificationController *)v6 context];
  v10 = [(PKPaymentVerificationController *)v6 setupDelegate];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentVerificationMethodsViewController;
  v11 = [(PKPaymentSetupFieldsViewController *)&v17 initWithWebService:v8 context:v9 setupDelegate:v10 setupFieldsModel:v7];

  verificationController = v11->_verificationController;
  v11->_verificationController = v6;
  v13 = v6;

  v14 = [[PKPaymentSetupVerificationMethodTableController alloc] initWithVerificationController:v13];
  methodTableController = v11->_methodTableController;
  v11->_methodTableController = v14;

  return v11;
}

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3
{
  return [(PKPaymentVerificationMethodsViewController *)self initWithVerificationController:a3 fieldsModel:0];
}

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 verificationChannels:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPaymentVerificationMethodsViewController *)self initWithVerificationController:a3];
  v8 = v7;
  if (v7) {
    [(PKPaymentSetupVerificationMethodTableController *)v7->_methodTableController setVerificationChannels:v6];
  }

  return v8;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentVerificationMethodsViewController;
  [(PKPaymentSetupTableViewController *)&v12 loadView];
  v3 = [(PKPaymentSetupFieldsViewController *)self headerView];
  v4 = [(PKPaymentVerificationController *)self->_verificationController passSnapshot];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    [v3 setPassSnapshotUsingDefaultSize:v4 animated:0 needsCorners:0];
  }
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:MEMORY[0x1E4F1CBF0] animated:0];
  id v6 = [(PKPaymentSetupTableViewController *)self dockView];
  id v7 = [v6 footerView];
  [v7 setManualEntryButton:0];
  [v7 setSetupLaterButton:0];
  v8 = [v7 skipCardButton];
  uint64_t v9 = PKLocalizedPaymentString(&cfstr_ActivationVeri.isa);
  [v8 setTitle:v9 forState:0];

  [v8 addTarget:self action:sel__verifyLaterButtonPressed forControlEvents:0x2000];
  v10 = [v6 primaryButton];
  [v10 setEnabled:1];
  [v10 addTarget:self action:sel_handleNextButtonTapped_ forControlEvents:0x2000];
  v11 = PKLocalizedPaymentString(&cfstr_Next.isa);
  [v10 setTitle:v11 forState:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
  [(PKPaymentSetupFieldsViewController *)&v4 viewWillAppear:a3];
  [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  [(PKPaymentVerificationMethodsViewController *)self _configure];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
  [(PKPaymentSetupFieldsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
  [(PKPaymentVerificationMethodsViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  [v4 resetAllPaymentSetupFieldValues];
}

- (void)_configure
{
  v3 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  objc_super v4 = [v3 visiblePaymentSetupFields];
  if ([v4 count])
  {
  }
  else
  {
    objc_super v5 = [(PKPaymentSetupVerificationMethodTableController *)self->_methodTableController verificationChannels];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [(PKPaymentVerificationMethodsViewController *)self defaultHeaderViewTitle];
      [(PKPaymentVerificationMethodsViewController *)self showActivitySpinnerWithTitle:v7 subtitle:&stru_1EF1B5B50];

      v8 = [(PKPaymentSetupTableViewController *)self dockView];
      [v8 setButtonsEnabled:0];

      objc_initWeak(&location, self);
      uint64_t v9 = (void *)MEMORY[0x1E4F84D40];
      v10 = [(PKPaymentVerificationController *)self->_verificationController pass];
      v11 = [v9 requestWithPass:v10];

      verificationController = self->_verificationController;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__PKPaymentVerificationMethodsViewController__configure__block_invoke;
      v13[3] = &unk_1E59CC670;
      objc_copyWeak(&v14, &location);
      [(PKPaymentVerificationController *)verificationController performVerificationOptionsRequest:v11 completion:v13];
      objc_destroyWeak(&v14);

      objc_destroyWeak(&location);
      return;
    }
  }

  [(PKPaymentVerificationMethodsViewController *)self _loadVerificationOptions];
}

void __56__PKPaymentVerificationMethodsViewController__configure__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PKPaymentVerificationMethodsViewController__configure__block_invoke_2;
    block[3] = &unk_1E59CC648;
    id v9 = WeakRetained;
    uint64_t v11 = a2;
    id v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__PKPaymentVerificationMethodsViewController__configure__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) hideActivitySpinner];
  v2 = [*(id *)(a1 + 32) dockView];
  [v2 setButtonsEnabled:1];

  if (*(void *)(a1 + 48) == 1)
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 1248) verificationRecord];
    uint64_t v4 = [v3 verificationStatus];
    if ((unint64_t)(v4 - 2) < 2 || v4 == 4000)
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Updating verification OTP methods", (uint8_t *)&v13, 2u);
      }

      uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 1224);
      uint64_t v6 = [v3 allChannels];
      [v11 setVerificationChannels:v6];
    }
    else if (v4 == 1)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updating verification fields", (uint8_t *)&v13, 2u);
      }

      uint64_t v6 = [*(id *)(a1 + 32) fieldsModel];
      id v7 = [v3 requiredVerificationFields];
      [v6 replaceAllPaymentSetupFields:v7];
    }
    else
    {
      objc_super v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Verification status: unknown, showing error.", (uint8_t *)&v13, 2u);
      }

      uint64_t v6 = [*(id *)(a1 + 32) _requestErrorAlertController:*(void *)(a1 + 40)];
      if (v6) {
        [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
      }
    }

    [*(id *)(a1 + 32) _loadVerificationOptions];
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 40) description];
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Showing error: %@", (uint8_t *)&v13, 0xCu);
    }
    v3 = [*(id *)(a1 + 32) _requestErrorAlertController:*(void *)(a1 + 40)];
    if (v3) {
      [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
    }
  }
}

- (void)_loadVerificationOptions
{
  v3 = [(PKPaymentVerificationController *)self->_verificationController verificationRecord];
  self->_verificationStatus = [v3 verificationStatus];

  uint64_t v4 = [(PKPaymentVerificationMethodsViewController *)self defaultHeaderViewTitle];
  id v5 = [(PKPaymentVerificationMethodsViewController *)self defaultHeaderViewSubTitle];
  [(PKPaymentSetupFieldsViewController *)self setHeaderViewTitle:v4 subtitle:v5];

  uint64_t v6 = [(PKPaymentSetupTableViewController *)self dockView];
  [v6 setButtonsEnabled:1];

  id v7 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 reloadData];
}

- (id)defaultHeaderViewTitle
{
  int64_t verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
  {
    v3 = [(PKPaymentSetupVerificationMethodTableController *)self->_methodTableController defaultHeaderViewTitle];
  }
  else
  {
    id v5 = [(PKPaymentVerificationController *)self->_verificationController pass];
    char v6 = [v5 supportsBarcodePayment];

    if (v6) {
      PKLocalizedAquamanString(&cfstr_AccountVerific.isa);
    }
    else {
    v3 = PKLocalizedPaymentString(&cfstr_CardVerificati.isa);
    }
  }

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  int64_t verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
  {
    v3 = [(PKPaymentSetupVerificationMethodTableController *)self->_methodTableController defaultHeaderViewSubTitle];
  }
  else
  {
    v3 = PKLocalizedPaymentString(&cfstr_EnterVerificat.isa);
  }

  return v3;
}

- (id)visibleFieldIdentifiers
{
  v2 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  v3 = [v2 visibleSetupFieldIdentifiers];

  return v3;
}

- (id)presentationContext
{
  v2 = [(PKPaymentVerificationMethodsViewController *)self view];
  v3 = [v2 window];

  return v3;
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
  [(PKPaymentSetupFieldsViewController *)self setHeaderViewTitle:a3 subtitle:a4];

  [(PKPaymentVerificationMethodsViewController *)self showLoadingUI:1 animated:1];
}

- (void)hideActivitySpinner
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_verificationStatus == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
    return [(PKPaymentSetupFieldsViewController *)&v5 numberOfSectionsInTableView:a3];
  }
  else
  {
    methodTableController = self->_methodTableController;
    return [(PKPaymentSetupVerificationMethodTableController *)methodTableController numberOfSectionsInTableView:a3];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_verificationStatus == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentVerificationMethodsViewController;
    return [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 numberOfRowsInSection:a4];
  }
  else
  {
    methodTableController = self->_methodTableController;
    return [(PKPaymentSetupVerificationMethodTableController *)methodTableController tableView:a3 numberOfRowsInSection:a4];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (self->_verificationStatus == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentVerificationMethodsViewController;
    [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 heightForRowAtIndexPath:a4];
  }
  else
  {
    methodTableController = self->_methodTableController;
    [(PKPaymentSetupVerificationMethodTableController *)methodTableController tableView:a3 heightForRowAtIndexPath:a4];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (self->_verificationStatus == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentVerificationMethodsViewController;
    uint64_t v4 = [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];
  }
  else
  {
    uint64_t v4 = [(PKPaymentSetupVerificationMethodTableController *)self->_methodTableController tableView:a3 cellForRowAtIndexPath:a4];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (self->_verificationStatus == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
    [(PKPaymentSetupFieldsViewController *)&v5 tableView:a3 didSelectRowAtIndexPath:a4];
  }
  else
  {
    methodTableController = self->_methodTableController;
    [(PKPaymentSetupVerificationMethodTableController *)methodTableController tableView:a3 didSelectRowAtIndexPath:a4];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_verificationStatus == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentVerificationMethodsViewController;
    [(PKPaymentSetupFieldsViewController *)&v6 tableView:a3 willDisplayCell:a4 forRowAtIndexPath:a5];
  }
  else
  {
    methodTableController = self->_methodTableController;
    [(PKPaymentSetupVerificationMethodTableController *)methodTableController tableView:a3 willDisplayCell:a4 forRowAtIndexPath:a5];
  }
}

- (void)_verifyLaterButtonPressed
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];

  [(PKPaymentVerificationMethodsViewController *)self _handleVerificationFinished];
}

- (void)_handleVerificationFinished
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained verificationMethodsViewControllerDidFinish:self];
}

- (void)_terminateSetupFlow
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v8, 2u);
  }

  uint64_t v4 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    [v6 verificationMethodsViewControllerDidFinish:self];
  }
  else if (v4)
  {
    [v4 viewControllerDidTerminateSetupFlow:self];
    [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:0 animated:0];
  }
  else
  {
    id v7 = [(PKPaymentVerificationMethodsViewController *)self presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)handleNextButtonTapped:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPaymentVerificationMethodsViewController *)self showActivitySpinnerWithTitle:0 subtitle:0];
  id v5 = [(PKPaymentVerificationMethodsViewController *)self _newVerificationRequest];
  id v6 = [v5 channel];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Performing verification update request for channel: %@", buf, 0xCu);
  }

  if (v6 && [v6 type] == 2)
  {
    if ([v6 requiresUserInteraction])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "User interaction required by verification channel. Skipping background observation.", buf, 2u);
      }
    }
    else
    {
      v8 = [(PKPaymentVerificationController *)self->_verificationController webService];
      id v7 = [v8 targetDevice];

      if (objc_opt_respondsToSelector())
      {
        id v9 = [(PKPaymentVerificationController *)self->_verificationController pass];
        [v7 startBackgroundVerificationObserverForPass:v9 verificationMethod:v6];
      }
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = [v6 typeDescriptionUnlocalized];
  [v10 safelySetObject:v11 forKey:*MEMORY[0x1E4F86E00]];

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0 context:v10];
  objc_initWeak((id *)buf, self);
  verificationController = self->_verificationController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke;
  v14[3] = &unk_1E59CC6C0;
  objc_copyWeak(&v16, (id *)buf);
  v14[4] = self;
  id v13 = v5;
  id v15 = v13;
  [(PKPaymentVerificationController *)verificationController performVerificationUpdateRequest:v13 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2;
    v10[3] = &unk_1E59CC698;
    v15[1] = a2;
    id v8 = WeakRetained;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    objc_copyWeak(v15, (id *)(a1 + 48));
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v10);

    objc_destroyWeak(v15);
  }
}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 72);
  v3 = *(id **)(a1 + 32);
  if (v2 == 1)
  {
    id v4 = [v3[156] verificationRecord];
    uint64_t v5 = [v4 verificationStatus];
    if (v5 <= 2)
    {
      if (v5 == 1)
      {
        uint64_t v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Presenting verification fields", buf, 2u);
        }

        [*(id *)(a1 + 32) hideActivitySpinner];
        [*(id *)(a1 + 40) setHidesBackButton:0 animated:0];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));

        if (!WeakRetained)
        {
          id v40 = objc_alloc(MEMORY[0x1E4F84C88]);
          v41 = [v4 requiredVerificationFields];
          id v8 = (PKPaymentVerificationMethodsViewController *)[v40 initWithPaymentSetupFields:v41];

          v42 = [PKPaymentVerificationMethodsViewController alloc];
          uint64_t v44 = *(void *)(a1 + 32);
          v43 = (id *)(a1 + 32);
          v45 = [(PKPaymentVerificationMethodsViewController *)v42 initWithVerificationController:*(void *)(v44 + 1248) fieldsModel:v8];
          [(PKPaymentVerificationMethodsViewController *)v45 setProvisioningController:*((void *)*v43 + 157)];
          v46 = [*v43 navigationController];
          [v46 pushViewController:v45 animated:1];

          goto LABEL_51;
        }
        goto LABEL_8;
      }
      if (v5 == 2)
      {
        id v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Presenting verification OTP methods", buf, 2u);
        }

        [*(id *)(a1 + 32) hideActivitySpinner];
        [*(id *)(a1 + 32) setHidesBackButton:0 animated:0];
        id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));

        if (!v7)
        {
          v34 = [PKPaymentVerificationMethodsViewController alloc];
          uint64_t v36 = *(void *)(a1 + 32);
          v35 = (id *)(a1 + 32);
          uint64_t v37 = *(void *)(v36 + 1248);
          v38 = [v4 allChannels];
          id v8 = [(PKPaymentVerificationMethodsViewController *)v34 initWithVerificationController:v37 verificationChannels:v38];

          [(PKPaymentVerificationMethodsViewController *)v8 setProvisioningController:*((void *)*v35 + 157)];
          v39 = [*v35 navigationController];
          [v39 pushViewController:v8 animated:1];

          goto LABEL_51;
        }
LABEL_8:
        id v8 = (PKPaymentVerificationMethodsViewController *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));
        [(PKPaymentVerificationMethodsViewController *)v8 showVerificationMethodsForVerificationMethodsViewController:*(void *)(a1 + 32)];
LABEL_51:

        goto LABEL_53;
      }
LABEL_25:
      v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [*(id *)(a1 + 56) description];
        *(_DWORD *)buf = 138412290;
        v59 = v22;
        _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Showing error: %@", buf, 0xCu);
      }
      v24 = *(void **)(a1 + 32);
      uint64_t v23 = a1 + 32;
      id v8 = [v24 _requestErrorAlertController:*(void *)(v23 + 24)];
      v25 = *(void **)v23;
      if (v8) {
        [v25 presentViewController:v8 animated:1 completion:0];
      }
      else {
        [v25 _handleVerificationFinished];
      }
      goto LABEL_51;
    }
    if (v5 == 3) {
      goto LABEL_30;
    }
    if (v5 != 4000) {
      goto LABEL_25;
    }
    id v14 = *(unsigned char **)(a1 + 32);
    if (v14[1240])
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to perform external validation without checking if it can be performed inline", buf, 2u);
      }

      id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));
      uint64_t v17 = *(void *)(a1 + 32);
      if (v16)
      {
        id v18 = objc_loadWeakRetained((id *)(v17 + 1264));
        [v18 showExternalVerificationForVerificationMethodsViewController:*(void *)(a1 + 32)];
      }
      else
      {
        [*(id *)(v17 + 1248) continueVerification];
      }
      goto LABEL_53;
    }
    [v14 context];
    if (PKPaymentSetupContextIsSetupAssistant())
    {
LABEL_30:
      [*(id *)(a1 + 32) hideActivitySpinner];
      [*(id *)(a1 + 32) context];
      if ((PKPaymentSetupContextIsiOSSetupAssistant() & 1) == 0)
      {
        v26 = [v4 channel];
        uint64_t v27 = [v26 type];

        if (v27 == 2)
        {
          v28 = [*(id *)(a1 + 48) channel];

          v29 = PKLogFacilityTypeGetObject();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Presenting verification OTP method entry", buf, 2u);
            }
            uint64_t v31 = 0;
          }
          else
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Presenting verification completion", buf, 2u);
            }
            uint64_t v31 = 1;
          }

          [*(id *)(a1 + 32) setHidesBackButton:0 animated:0];
          id v49 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));

          if (v49)
          {
            id v8 = (PKPaymentVerificationMethodsViewController *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1264));
            [(PKPaymentVerificationMethodsViewController *)v8 showVerificationCompletionForVerificationMethodsViewController:*(void *)(a1 + 32)];
          }
          else
          {
            v50 = [PKPaymentSetupVerificationCompletionViewController alloc];
            v52 = *(void **)(a1 + 32);
            v51 = (id *)(a1 + 32);
            v53 = [v52 verificationController];
            id v8 = [(PKPaymentSetupVerificationCompletionViewController *)v50 initWithVerificationController:v53 mode:v31 offerOtherMethods:0];

            [(PKPaymentVerificationMethodsViewController *)v8 setProvisioningController:*((void *)*v51 + 157)];
            v54 = [*v51 setupDelegate];
            [(PKPaymentSetupFieldsViewController *)v8 setSetupDelegate:v54];

            v55 = [*v51 navigationController];
            [v55 pushViewController:v8 animated:1];
          }
          goto LABEL_51;
        }
      }
      [*(id *)(a1 + 32) context];
      int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
      v33 = *(void **)(a1 + 32);
      if (IsSetupAssistant) {
        [v33 _showSetupAssistantVerifyLaterAlertAndTerminate];
      }
      else {
        [v33 _handleVerificationFinished];
      }
    }
    else
    {
      v47 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v47, OS_LOG_TYPE_DEFAULT, "Attempting to perform external validation", buf, 2u);
      }

      v48 = [*(id *)(a1 + 32) verificationController];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_60;
      v56[3] = &unk_1E59CB100;
      objc_copyWeak(&v57, (id *)(a1 + 64));
      [v48 canPerformVerificationInline:v56];

      objc_destroyWeak(&v57);
    }
  }
  else
  {
    [v3 hideActivitySpinner];
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 56) description];
      *(_DWORD *)buf = 138412290;
      v59 = v10;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Showing error: %@", buf, 0xCu);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v11 = a1 + 32;
    id v4 = [v12 _requestErrorAlertController:*(void *)(v11 + 24)];
    id v13 = *(void **)v11;
    if (v4)
    {
      [v13 presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      [v13 _handleVerificationFinished];
      id v4 = 0;
    }
  }
LABEL_53:
}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_60(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2_61;
  v3[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2_61(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v5 = WeakRetained;
    [WeakRetained hideActivitySpinner];
    if (*(unsigned char *)(a1 + 40))
    {
      id v3 = objc_loadWeakRetained(v5 + 158);

      if (v3)
      {
        id v4 = objc_loadWeakRetained(v5 + 158);
        [v4 showExternalVerificationForVerificationMethodsViewController:v5];
      }
      else
      {
        [v5[156] continueVerification];
      }
    }
    else
    {
      [v5 context];
      if (PKPaymentSetupContextIsSetupAssistant()) {
        [v5 _showSetupAssistantVerifyLaterAlertAndTerminate];
      }
      else {
        [v5 _handleVerificationFinished];
      }
    }
    id WeakRetained = v5;
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  uint64_t v2 = [(PKPaymentVerificationController *)self->_verificationController verificationRecord];
  BOOL v3 = [v2 verificationStatus] == 1;

  return v3;
}

- (id)_newVerificationRequest
{
  int64_t verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
  {
    methodTableController = self->_methodTableController;
    return [(PKPaymentSetupVerificationMethodTableController *)methodTableController newVerificationRequest];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F84D48]);
    id v7 = [(PKPaymentVerificationController *)self->_verificationController pass];
    [v6 setPass:v7];

    id v8 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
    uint64_t v9 = *MEMORY[0x1E4F87B98];
    id v10 = [v8 submissionValuesForDestination:*MEMORY[0x1E4F87B98]];

    [v6 setOverlayParameters:v10];
    uint64_t v11 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
    uint64_t v12 = [v11 secureSubmissionValuesForDestination:v9];

    [v6 setSecureOverlayParameters:v12];
    return v6;
  }
}

- (void)_showSetupAssistantVerifyLaterAlertAndTerminate
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Showing setup assistant OTP enter later alert", buf, 2u);
  }

  id v4 = [(PKPaymentVerificationController *)self->_verificationController verificationRecord];
  char v5 = [v4 channel];
  uint64_t v6 = [v5 type];

  [(PKPaymentSetupTableViewController *)self context];
  int IsBridge = PKPaymentSetupContextIsBridge();
  switch(v6)
  {
    case 8:
      id v8 = [(PKPaymentVerificationController *)self->_verificationController pass];
      uint64_t v9 = [v8 organizationName];
      uint64_t v10 = PKLocalizedPaymentString(&cfstr_SetupAssistant_3.isa, &stru_1EF1B4C70.isa, v9);
      uint64_t v11 = @"SETUP_ASSISTANT_URL_VERIFICATION_ALERT_MESSAGE";
      goto LABEL_9;
    case 5:
      id v8 = [(PKPaymentVerificationController *)self->_verificationController pass];
      uint64_t v9 = [v8 organizationName];
      uint64_t v10 = PKLocalizedPaymentString(&cfstr_SetupAssistant_1.isa, &stru_1EF1B4C70.isa, v9);
      uint64_t v11 = @"SETUP_ASSISTANT_BANK_APP_VERIFICATION_ALERT_MESSAGE";
      goto LABEL_9;
    case 4:
      id v8 = [(PKPaymentVerificationController *)self->_verificationController pass];
      uint64_t v9 = [v8 organizationName];
      uint64_t v10 = PKLocalizedPaymentString(&cfstr_SetupAssistant.isa, &stru_1EF1B4C70.isa, v9);
      uint64_t v11 = @"SETUP_ASSISTANT_OUTBOUND_CALL_VERIFICATION_ALERT_MESSAGE";
LABEL_9:

      PKDeviceSpecificLocalizedStringKeyForKey(v11, IsBridge);
      uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = PKLocalizedPaymentString(v12);

      goto LABEL_11;
  }
  uint64_t v10 = 0;
  uint64_t v13 = 0;
LABEL_11:
  if (!(v10 | v13))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "no title or message to show cannot create alert", buf, 2u);
    }

    goto LABEL_17;
  }
  id v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v13 preferredStyle:1];
  id v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PKPaymentVerificationMethodsViewController__showSetupAssistantVerifyLaterAlertAndTerminate__block_invoke;
  v18[3] = &unk_1E59CB1F0;
  v18[4] = self;
  uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:v18];
  [v14 addAction:v17];

  if (!v14)
  {
LABEL_17:
    [(PKPaymentVerificationMethodsViewController *)self _handleVerificationFinished];
    goto LABEL_18;
  }
  [(PKPaymentVerificationMethodsViewController *)self presentViewController:v14 animated:1 completion:0];

LABEL_18:
}

uint64_t __93__PKPaymentVerificationMethodsViewController__showSetupAssistantVerifyLaterAlertAndTerminate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleVerificationFinished];
}

- (id)_requestErrorAlertController:(id)a3
{
  id v3 = a3;
  id v4 = PKLocalizedPaymentString(&cfstr_ActivationNotA.isa);
  char v5 = PKLocalizedPaymentString(&cfstr_ActivationNotA_0.isa);
  uint64_t v6 = [v3 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v7)
  {
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);

    uint64_t v9 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
LABEL_10:
    id v14 = v5;
    id v4 = (void *)v8;
    char v5 = (void *)v9;
    goto LABEL_11;
  }
  uint64_t v10 = [v3 domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F88098]];

  if (!v11)
  {
    id v14 = [v3 domain];
    if (![v14 isEqualToString:*MEMORY[0x1E4F87C30]])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v15 = [v3 localizedFailureReason];

    if (!v15)
    {
LABEL_12:
      id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
      uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
      id v18 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      uint64_t v19 = [v17 actionWithTitle:v18 style:1 handler:0];
      [v16 addAction:v19];

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  uint64_t v12 = [v3 code];
  if ((unint64_t)(v12 - 2) < 4)
  {
LABEL_5:
    uint64_t v13 = [v3 localizedFailureReason];

    if (!v13) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v8 = [v3 localizedFailureReason];

    uint64_t v9 = [v3 localizedRecoverySuggestion];
    goto LABEL_10;
  }
  if (v12 != 1)
  {
    if (v12) {
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(PKPaymentVerificationMethodsViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  id v8 = [(PKPaymentSetupTableViewController *)self dockView];
  [v8 setButtonsEnabled:v4 ^ 1];
  int v7 = [v8 primaryButton];
  [v7 setShowSpinner:v4];
}

- (PKPaymentVerificationController)verificationController
{
  return self->_verificationController;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (BOOL)alwaysPerformExternalVerificationInline
{
  return self->_alwaysPerformExternalVerificationInline;
}

- (void)setAlwaysPerformExternalVerificationInline:(BOOL)a3
{
  self->_alwaysPerformExternalVerificationInline = a3;
}

- (PKPaymentVerificationMethodsViewControllerFlowItemDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentVerificationMethodsViewControllerFlowItemDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);

  objc_storeStrong((id *)&self->_methodTableController, 0);
}

@end