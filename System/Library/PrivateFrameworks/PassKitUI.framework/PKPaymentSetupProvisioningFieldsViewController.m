@interface PKPaymentSetupProvisioningFieldsViewController
- (BOOL)hideSetupLaterButton;
- (BOOL)ignoreProgressDescriptionUpdates;
- (BOOL)isProvisioningHomeKey;
- (PKPaymentProvisioningController)paymentProvisioningController;
- (PKPaymentProvisioningViewControllerDelegate)flowItemDelegate;
- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5;
- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (PKPaymentSetupProvisioningFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (id)_cardDetailsFooterView;
- (id)continueActionHandler;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (void)addDifferentCard:(id)a3;
- (void)dealloc;
- (void)displayTermsForTermsURL:(id)a3 withCompletionHandler:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)resetRightBarButtonState;
- (void)setContinueActionHandler:(id)a3;
- (void)setFlowItemDelegate:(id)a3;
- (void)setHideSetupLaterButton:(BOOL)a3;
- (void)setIgnoreProgressDescriptionUpdates:(BOOL)a3;
- (void)setNotificationTextInFooterView:(id)a3;
- (void)setPaymentProvisioningController:(id)a3;
- (void)setupLater:(id)a3;
- (void)showVerifiedUIForPass:(id)a3;
- (void)suppressFooterViewManualEntryButton;
- (void)suppressFooterViewSetupLaterButton;
- (void)suppressFooterViewSkipCardButton;
- (void)updateLocationAuthorization;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupProvisioningFieldsViewController

- (PKPaymentSetupProvisioningFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  return -[PKPaymentSetupProvisioningFieldsViewController initWithProvisioningController:context:setupDelegate:](self, "initWithProvisioningController:context:setupDelegate:", 0, a4, a5, a6);
}

- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  return [(PKPaymentSetupProvisioningFieldsViewController *)self initWithProvisioningController:a3 context:a4 setupDelegate:a5 setupFieldsModel:0];
}

- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = [a3 webService];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  v13 = [(PKPaymentSetupFieldsViewController *)&v17 initWithWebService:v12 context:a4 setupDelegate:v11 setupFieldsModel:v10];

  if (v13)
  {
    v14 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
    termsUIController = v13->_termsUIController;
    v13->_termsUIController = v14;

    [(RemoteUIController *)v13->_termsUIController setDelegate:v13];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CLInUseAssertion *)self->_CLInUse invalidate];
  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator deactivate];
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  [(PKPaymentSetupTableViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1A00]);
  objc_super v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self view];
  v5 = (UINotificationFeedbackGenerator *)[v3 initWithView:v4];
  cardAddedFeedbackGenerator = self->_cardAddedFeedbackGenerator;
  self->_cardAddedFeedbackGenerator = v5;

  [(UINotificationFeedbackGenerator *)self->_cardAddedFeedbackGenerator activateWithCompletionBlock:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_CLInUse)
  {
    v5 = (void *)MEMORY[0x1E4F1E5E8];
    v6 = PKPassKitCoreBundle();
    objc_super v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"Passbook showing add card UI"];
    CLInUse = self->_CLInUse;
    self->_CLInUse = v7;
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v9 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    [(CLInUseAssertion *)CLInUse invalidate];
    v6 = self->_CLInUse;
    self->_CLInUse = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v7 viewWillDisappear:v3];
}

- (id)_cardDetailsFooterView
{
  cardDetailsFooterView = self->_cardDetailsFooterView;
  if (!cardDetailsFooterView)
  {
    objc_super v4 = [PKPaymentSetupFooterView alloc];
    int64_t v5 = [(PKPaymentSetupTableViewController *)self context];
    v6 = -[PKPaymentSetupFooterView initWithFrame:context:](v4, "initWithFrame:context:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v7 = self->_cardDetailsFooterView;
    self->_cardDetailsFooterView = v6;

    v8 = [(PKPaymentSetupFooterView *)self->_cardDetailsFooterView manualEntryButton];
    [v8 addTarget:self action:sel_addDifferentCard_ forControlEvents:0x2000];

    objc_super v9 = self->_cardDetailsFooterView;
    if (self->_hideSetupLaterButton)
    {
      [(PKPaymentSetupFooterView *)v9 setSetupLaterButton:0];
    }
    else
    {
      id v10 = [(PKPaymentSetupFooterView *)v9 setupLaterButton];
      [v10 addTarget:self action:sel_setupLater_ forControlEvents:0x2000];
    }
    id v11 = self->_cardDetailsFooterView;
    v12 = [(PKPaymentSetupTableViewController *)self tableView];
    [v12 bounds];
    -[PKPaymentSetupFooterView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
    double v14 = v13;
    double v16 = v15;

    -[PKPaymentSetupFooterView setFrame:](self->_cardDetailsFooterView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
    cardDetailsFooterView = self->_cardDetailsFooterView;
  }

  return cardDetailsFooterView;
}

- (void)suppressFooterViewSkipCardButton
{
  BOOL v3 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v3 setSkipCardButton:0];

  objc_super v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v4 sizeToFit];

  id v6 = [(PKPaymentSetupTableViewController *)self tableView];
  int64_t v5 = [(PKPaymentSetupProvisioningFieldsViewController *)self footerView];
  [v5 bounds];
  [v6 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v8)];
}

- (void)suppressFooterViewSetupLaterButton
{
  BOOL v3 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v3 setSetupLaterButton:0];

  objc_super v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v4 sizeToFit];

  id v6 = [(PKPaymentSetupTableViewController *)self tableView];
  int64_t v5 = [(PKPaymentSetupProvisioningFieldsViewController *)self footerView];
  [v5 bounds];
  [v6 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v8)];
}

- (void)suppressFooterViewManualEntryButton
{
  BOOL v3 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v3 setManualEntryButton:0];

  objc_super v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v4 sizeToFit];

  id v6 = [(PKPaymentSetupTableViewController *)self tableView];
  int64_t v5 = [(PKPaymentSetupProvisioningFieldsViewController *)self footerView];
  [v5 bounds];
  [v6 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v8)];
}

- (void)setNotificationTextInFooterView:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  id v6 = [v5 notificationText];
  [v6 setText:v4];

  objc_super v7 = [(PKPaymentSetupProvisioningFieldsViewController *)self _cardDetailsFooterView];
  [v7 sizeToFit];

  id v9 = [(PKPaymentSetupTableViewController *)self tableView];
  CGRect v8 = [(PKPaymentSetupProvisioningFieldsViewController *)self footerView];
  [v8 bounds];
  [v9 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v11)];
}

- (void)showVerifiedUIForPass:(id)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 supportsBarcodePayment];
  id v6 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v7 = *MEMORY[0x1E4F87028];
  v25[0] = *MEMORY[0x1E4F87020];
  v25[1] = v7;
  v25[2] = *MEMORY[0x1E4F87068];
  CGRect v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v9 = *MEMORY[0x1E4F86730];
  v23[0] = *MEMORY[0x1E4F86308];
  v23[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86F40];
  v24[0] = *MEMORY[0x1E4F864A0];
  v24[1] = v10;
  CGRect v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v6 subjects:v8 sendEvent:v11];

  [(PKPaymentSetupFieldsViewController *)self showCheckmarkAnimated:1];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v14 = v13;
  if (!v5)
  {
    if ([v4 accessType] == 3)
    {
      [v14 appendString:@"KEY_ADDED"];
      [v12 appendString:@"KEY_ADDED_MESSAGE"];
    }
    else
    {
      if ([v4 associatedAccountFeatureIdentifier] == 4)
      {
        [v14 appendString:@"CARD_ADDED_TITLE"];
        [v12 appendString:@"CARD_ADDED_BODY"];
        double v15 = (void (*)(id))MEMORY[0x1E4F880A0];
        goto LABEL_9;
      }
      [v14 appendString:@"CARD_ADDED"];
      double v16 = [(PKPaymentSetupFieldsViewController *)self webService];
      objc_super v17 = [v16 targetDevice];
      v18 = [v17 deviceName];

      CGRect v19 = PKDeviceSpecificLocalizedStringKeyForKey(@"CARD_ADDED_MESSAGE", [v18 isEqualToString:@"Apple Watch"]);
      [v12 appendString:v19];
    }
    double v15 = (void (*)(id))MEMORY[0x1E4F880B8];
    goto LABEL_9;
  }
  [v13 appendString:@"ACCOUNT_ADDED"];
  [v12 appendString:@"ACCOUNT_ADDED_MESSAGE"];
  double v15 = (void (*)(id))MEMORY[0x1E4F880A8];
LABEL_9:
  v20 = v15;
  v21 = v15(v14);
  v22 = v20(v12);
  [(PKPaymentSetupFieldsViewController *)self hideActivitySpinnerWithTitle:v21 subtitle:v22 animated:0];

  [(PKPaymentSetupFieldsViewController *)self endUserInteraction];
}

- (void)displayTermsForTermsURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGRect v8 = [(PKPaymentSetupProvisioningFieldsViewController *)self parentViewController];
  if (v8)
  {
  }
  else
  {
    double v15 = [(PKPaymentSetupProvisioningFieldsViewController *)self view];
    double v16 = [v15 window];
    objc_super v17 = [v16 rootViewController];

    if (v17 != self)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_6;
    }
  }
  [(PKPaymentSetupProvisioningFieldsViewController *)self resignFirstResponder];
  uint64_t v9 = objc_alloc_init(PKPortraitNavigationController);
  [(PKPortraitNavigationController *)v9 setModalInPresentation:1];
  [(RemoteUIController *)self->_termsUIController setNavigationController:v9];
  uint64_t v10 = [(RemoteUIController *)self->_termsUIController loader];
  CGRect v11 = [(PKPaymentSetupFieldsViewController *)self webService];
  id v12 = [v11 context];
  objc_msgSend(v10, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

  objc_initWeak(&location, self);
  termsUIController = self->_termsUIController;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E59CC788;
  objc_copyWeak(&v23, &location);
  double v14 = v9;
  CGRect v19 = v14;
  v20 = self;
  id v22 = v7;
  id v21 = v6;
  [(RemoteUIController *)termsUIController loadURL:v21 postBody:0 completion:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

LABEL_6:
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E59CC760;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  char v16 = a2;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v14 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      PKPaymentSetupApplyContextAppearance([WeakRetained context], *(void **)(a1 + 32));
      if (objc_msgSend(*(id *)(a1 + 40), "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      {
        id v5 = [*(id *)(a1 + 32) topViewController];
        id v6 = [v4 navigationController];
        uint64_t v7 = v6;
        if (v5 && v6)
        {
          id v8 = [v5 navigationItem];
          [v8 setHidesBackButton:1];

          [v7 pushViewController:v5 animated:1];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_3;
          aBlock[3] = &unk_1E59CA7D0;
          id v29 = v7;
          uint64_t v9 = _Block_copy(aBlock);
        }
        else
        {
          [v6 setModalPresentationStyle:3];
          [v4 presentViewController:v7 withTransition:1 completion:0];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_4;
          v26[3] = &unk_1E59CA7F8;
          objc_copyWeak(&v27, v2);
          uint64_t v9 = _Block_copy(v26);
          objc_destroyWeak(&v27);
        }
      }
      else
      {
        [v4 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_5;
        v24[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v25, v2);
        uint64_t v9 = _Block_copy(v24);
        objc_destroyWeak(&v25);
      }
      id v12 = (void *)v4[154];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_6;
      v20[3] = &unk_1E59E0E48;
      objc_copyWeak(&v23, v2);
      id v13 = v9;
      id v21 = v13;
      id v22 = *(id *)(a1 + 64);
      [v12 setHandlerForElementName:@"agree" handler:v20];
      id v14 = (void *)v4[154];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_7;
      v16[3] = &unk_1E59E0E48;
      objc_copyWeak(&v19, v2);
      id v15 = v13;
      id v17 = v15;
      id v18 = *(id *)(a1 + 64);
      [v14 setHandlerForElementName:@"disagree" handler:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

id __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popViewControllerAnimated:1];
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)addDifferentCard:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained provisioningViewControllerDidSelectManualEntry:self];
}

- (void)setupLater:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DC0], 0, a3);
  id v4 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  [v4 viewControllerDidTerminateSetupFlow:self];
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_termsUIController == a3)
  {
    id v6 = a4;
    PKPaymentSetupApplyContextAppearance([(PKPaymentSetupTableViewController *)self context], v6);
  }
}

- (id)defaultHeaderViewTitle
{
  return (id)PKLocalizedPaymentString(&cfstr_AddCard.isa);
}

- (id)defaultHeaderViewSubTitle
{
  return (id)PKLocalizedPaymentString(&cfstr_EnterCardInfoM.isa);
}

- (void)updateLocationAuthorization
{
  [(PKPaymentSetupTableViewController *)self context];
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    if ([MEMORY[0x1E4F1E600] locationServicesEnabled])
    {
      v2 = (void *)MEMORY[0x1E4F1E600];
      id v3 = PKPassKitCoreBundle();
      id v4 = [v3 bundlePath];
      LODWORD(v2) = [v2 authorizationStatusForBundlePath:v4];

      if (!v2)
      {
        id v5 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Setting authorization status for PassKitCore to WhenInUse", v8, 2u);
        }

        id v6 = (void *)MEMORY[0x1E4F1E600];
        uint64_t v7 = PKPassKitCoreBundle();
        [v6 setAuthorizationStatusByType:4 forBundle:v7];
      }
    }
  }
}

- (void)resetRightBarButtonState
{
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self isComplete];

  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItemsEnabled:v3];
}

- (PKPaymentProvisioningController)paymentProvisioningController
{
  return self->_paymentProvisioningController;
}

- (void)setPaymentProvisioningController:(id)a3
{
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
}

- (BOOL)isProvisioningHomeKey
{
  return self->_provisioningHomeKey;
}

- (BOOL)ignoreProgressDescriptionUpdates
{
  return self->_ignoreProgressDescriptionUpdates;
}

- (void)setIgnoreProgressDescriptionUpdates:(BOOL)a3
{
  self->_ignoreProgressDescriptionUpdates = a3;
}

- (PKPaymentProvisioningViewControllerDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentProvisioningViewControllerDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong((id *)&self->_paymentProvisioningController, 0);
  objc_storeStrong((id *)&self->_cardAddedFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_CLInUse, 0);
  objc_storeStrong((id *)&self->_termsUIController, 0);

  objc_storeStrong((id *)&self->_cardDetailsFooterView, 0);
}

@end