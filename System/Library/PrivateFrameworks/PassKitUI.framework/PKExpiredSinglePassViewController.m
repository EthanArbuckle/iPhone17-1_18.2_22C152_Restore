@interface PKExpiredSinglePassViewController
- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4;
- (PKExpiredSinglePassViewController)initWithPass:(id)a3;
- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3;
- (id)_infoButton;
- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3;
- (id)pass;
- (void)_deletePassConfirmed;
- (void)_deletePassPressed;
- (void)_didPresentDetailViewController;
- (void)_expiredPassRemovalConfirmedAsDeletion:(BOOL)a3;
- (void)_moreButtonPressed;
- (void)_recoverPassConfirmed;
- (void)_recoverPassPressed;
- (void)_sharePass;
- (void)disableButtons;
- (void)enableButtons;
- (void)passViewSetup;
- (void)passWasUpdated:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKExpiredSinglePassViewController

- (PKExpiredSinglePassViewController)initWithPass:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKExpiredSinglePassViewController;
  v6 = [(PKExpiredSinglePassViewController *)&v35 init];
  v7 = v6;
  if (v6)
  {
    p_pass = (id *)&v6->_pass;
    objc_storeStrong((id *)&v6->_pass, a3);
    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = PKLocalizedString(&cfstr_ExpiredPassesD.isa);
    uint64_t v11 = [v9 initWithTitle:v10 style:0 target:v7 action:sel__deletePassPressed];
    deleteBarButton = v7->_deleteBarButton;
    v7->_deleteBarButton = (UIBarButtonItem *)v11;

    [(UIBarButtonItem *)v7->_deleteBarButton setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];
    id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v14 = PKLocalizedString(&cfstr_ExpiredPassesU.isa);
    uint64_t v15 = [v13 initWithTitle:v14 style:0 target:v7 action:sel__recoverPassPressed];
    recoverBarButton = v7->_recoverBarButton;
    v7->_recoverBarButton = (UIBarButtonItem *)v15;

    [(UIBarButtonItem *)v7->_recoverBarButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpace = v7->_flexibleSpace;
    v7->_flexibleSpace = (UIBarButtonItem *)v17;

    id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v20 = [(PKExpiredSinglePassViewController *)v7 _infoButton];
    uint64_t v21 = [v19 initWithCustomView:v20];
    infoButton = v7->_infoButton;
    v7->_infoButton = (UIBarButtonItem *)v21;

    [(UIBarButtonItem *)v7->_infoButton setAccessibilityIdentifier:*MEMORY[0x1E4F85608]];
    if ([*p_pass supportsSharing])
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:v7 action:sel__sharePass];
      shareButton = v7->_shareButton;
      v7->_shareButton = (UIBarButtonItem *)v23;

      [(UIBarButtonItem *)v7->_shareButton setAccessibilityIdentifier:*MEMORY[0x1E4F859E0]];
    }
    v25 = [(PKExpiredSinglePassViewController *)v7 navigationItem];
    v26 = v7->_shareButton;
    if (v26)
    {
      v38[0] = v7->_infoButton;
      v38[1] = v26;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = (UIBarButtonItem **)v38;
      uint64_t v29 = 2;
    }
    else
    {
      v37 = v7->_infoButton;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = &v37;
      uint64_t v29 = 1;
    }
    v30 = [v27 arrayWithObjects:v28 count:v29];
    [v25 setRightBarButtonItems:v30];

    v31 = [[PKLinkedApplication alloc] initWithPass:*p_pass];
    linkedApplication = v7->_linkedApplication;
    v7->_linkedApplication = v31;

    v36[0] = v7->_deleteBarButton;
    v36[1] = v7->_flexibleSpace;
    v36[2] = v7->_recoverBarButton;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    [(PKExpiredSinglePassViewController *)v7 setToolbarItems:v33];
  }
  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKExpiredSinglePassViewController;
  [(PKExpiredSinglePassViewController *)&v6 viewDidLoad];
  v3 = [(PKExpiredSinglePassViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(PKExpiredSinglePassViewController *)self view];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85520]];

  [(PKExpiredSinglePassViewController *)self passViewSetup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKExpiredSinglePassViewController;
  [(PKExpiredSinglePassViewController *)&v5 viewWillAppear:a3];
  [(PKExpiredSinglePassViewController *)self enableButtons];
  v4 = [(PKExpiredSinglePassViewController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKExpiredSinglePassViewController;
  [(PKExpiredSinglePassViewController *)&v28 viewWillLayoutSubviews];
  v3 = [(PKExpiredSinglePassViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v5 + v16;
  double v18 = v7 + v12;
  double v20 = v9 - (v16 + v19);
  [(PKPassView *)self->_passView sizeOfFront];
  passView = self->_passView;
  if (v21 >= v20)
  {
    PKFloatRoundToPixel();
    double v25 = v27;
    double v26 = -16.0;
  }
  else
  {
    double v23 = v21;
    PKFloatRoundToPixel();
    double v17 = v24;
    double v25 = v18 + 16.0;
    double v26 = -32.0;
    double v20 = v23;
  }
  -[PKPassView setFrame:](passView, "setFrame:", v17, v25, v20, v11 - (v13 + v15) + v26);
}

- (void)passViewSetup
{
  v3 = [(PKExpiredSinglePassViewController *)self viewIfLoaded];
  if (v3)
  {
    id v7 = v3;
    double v4 = self->_passView;
    double v5 = [[PKPassView alloc] initWithPass:self->_pass content:5];
    passView = self->_passView;
    self->_passView = v5;

    [(PKPassView *)self->_passView setModallyPresented:1];
    [v7 addSubview:self->_passView];
    [v7 setNeedsLayout];
    if (v4) {
      [(PKPassView *)v4 removeFromSuperview];
    }

    v3 = v7;
  }
}

- (void)passWasUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);

  [(PKExpiredSinglePassViewController *)self passViewSetup];
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PKExpiredSinglePassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = self;
  [(PKExpiredSinglePassViewController *)self dismissViewControllerAnimated:1 completion:v5];
  return 1;
}

uint64_t __87__PKExpiredSinglePassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletePassConfirmed];
}

- (id)_infoButton
{
  v3 = PKUIBigInfoButtonImageWithDefaultConfiguration();
  double v4 = (void *)MEMORY[0x1E4FB14D8];
  double v5 = [v3 configuration];
  double v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  id v7 = objc_msgSend(v4, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v3, v5, v6);

  objc_initWeak(&location, self);
  double v8 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __48__PKExpiredSinglePassViewController__infoButton__block_invoke;
  double v16 = &unk_1E59CBEE0;
  objc_copyWeak(&v17, &location);
  double v9 = [v8 actionWithHandler:&v13];
  double v10 = objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v7, v9, v13, v14, v15, v16);
  [v10 setConfigurationUpdateHandler:&__block_literal_global_13];
  [v10 sizeToFit];
  [v10 setShowsLargeContentViewer:1];
  double v11 = PKLocalizedString(&cfstr_More.isa);
  [v10 setLargeContentTitle:v11];

  [v10 setLargeContentImage:v3];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __48__PKExpiredSinglePassViewController__infoButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _moreButtonPressed];
}

uint64_t __48__PKExpiredSinglePassViewController__infoButton__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)_deletePassPressed
{
  v3 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
  double v4 = PKLocalizedString(&cfstr_ExpiredPassesD.isa);
  double v5 = (void *)MEMORY[0x1E4FB1418];
  double v6 = PKLocalizedString(&cfstr_ExpiredPassesD_0.isa, &cfstr_Lu.isa, 1);
  id v7 = [v5 alertControllerWithTitle:0 message:v6 preferredStyle:0];

  double v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v3 style:1 handler:0];
  [v7 addAction:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKExpiredSinglePassViewController__deletePassPressed__block_invoke;
  v10[3] = &unk_1E59CB1F0;
  v10[4] = self;
  double v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v4 style:2 handler:v10];
  [v7 addAction:v9];

  [(PKExpiredSinglePassViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __55__PKExpiredSinglePassViewController__deletePassPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletePassConfirmed];
}

- (void)_recoverPassPressed
{
  v3 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
  double v4 = PKLocalizedString(&cfstr_ExpiredPassesU.isa);
  double v5 = (void *)MEMORY[0x1E4FB1418];
  double v6 = PKLocalizedString(&cfstr_ExpiredPassesU_0.isa, &cfstr_Lu.isa, 1);
  id v7 = [v5 alertControllerWithTitle:0 message:v6 preferredStyle:0];

  double v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v3 style:1 handler:0];
  [v7 addAction:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKExpiredSinglePassViewController__recoverPassPressed__block_invoke;
  v10[3] = &unk_1E59CB1F0;
  v10[4] = self;
  double v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v4 style:0 handler:v10];
  [v7 addAction:v9];

  [(PKExpiredSinglePassViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __56__PKExpiredSinglePassViewController__recoverPassPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverPassConfirmed];
}

- (void)_deletePassConfirmed
{
  [(PKExpiredSinglePassViewController *)self disableButtons];

  [(PKExpiredSinglePassViewController *)self _expiredPassRemovalConfirmedAsDeletion:1];
}

- (void)_recoverPassConfirmed
{
  [(PKExpiredSinglePassViewController *)self disableButtons];

  [(PKExpiredSinglePassViewController *)self _expiredPassRemovalConfirmedAsDeletion:0];
}

- (void)_expiredPassRemovalConfirmedAsDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  double v11 = [(PKExpiredSinglePassViewController *)self parentViewController];
  char v5 = objc_opt_respondsToSelector();
  double v6 = v11;
  if (v5)
  {
    id v7 = [v11 expiredPassesViewController];
    if (objc_opt_respondsToSelector())
    {
      double v8 = [(PKPass *)self->_pass uniqueID];
      [v7 removeExpiredSectionPassWithUniqueID:v8 isDeletion:v3];

      double v9 = [(PKExpiredSinglePassViewController *)self navigationController];
      id v10 = (id)[v9 popToRootViewControllerAnimated:1];
    }
    double v6 = v11;
  }
}

- (void)_moreButtonPressed
{
  PKPassType v3 = [(PKPass *)self->_pass passType];
  if (v3 == PKPassTypeSecureElement)
  {
    uint64_t v4 = [(PKExpiredSinglePassViewController *)self _paymentPassDetailsViewControllerForPaymentPass:self->_pass];
    if (v4) {
      goto LABEL_4;
    }
  }
  else if (v3 == PKPassTypeBarcode)
  {
    uint64_t v4 = [(PKExpiredSinglePassViewController *)self _barcodePassDetailsViewControllerForBarcodePass:self->_pass];
    if (v4)
    {
LABEL_4:
      id v6 = (id)v4;
      char v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
      [(PKExpiredSinglePassViewController *)self presentViewController:v5 animated:1 completion:0];

      return;
    }
  }

  [(PKExpiredSinglePassViewController *)self _didPresentDetailViewController];
}

- (void)_sharePass
{
  PKPassType v3 = objc_msgSend(MEMORY[0x1E4F9F2E8], "pkui_activityControllerForPass:passView:passLinkedApplication:", self->_pass, self->_passView, self->_linkedApplication);
  if (v3)
  {
    uint64_t v4 = self->_pass;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__PKExpiredSinglePassViewController__sharePass__block_invoke;
    v6[3] = &unk_1E59CBF28;
    id v7 = v4;
    char v5 = v4;
    [v3 setCompletionWithItemsHandler:v6];
    [(PKExpiredSinglePassViewController *)self presentViewController:v3 animated:1 completion:0];
  }
}

void __47__PKExpiredSinglePassViewController__sharePass__block_invoke(uint64_t a1, void *a2, int a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) noteShared];
    uint64_t v6 = *MEMORY[0x1E4F85C78];
    double v8 = @"activity";
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    MEMORY[0x1A6220EC0](v6, v7);
  }
  else
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C80], 0);
  }
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PKBarcodePassDetailViewController alloc] initWithPass:v4];

    [(PKBarcodePassDetailViewController *)v5 setDeleteOverrider:self];
    [(PKBarcodePassDetailViewController *)v5 setShowDoneButton:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F84A88];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    id v7 = [PKPaymentPassDetailViewController alloc];
    double v8 = [v5 paymentPass];

    double v9 = [MEMORY[0x1E4F84D50] sharedService];
    id v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    double v12 = [(PKPaymentPassDetailViewController *)v7 initWithPass:v8 group:0 groupsController:0 webService:v9 peerPaymentWebService:v10 style:0 passLibraryDataProvider:v11 paymentServiceDataProvider:v6];

    [(PKPaymentPassDetailViewController *)v12 setDeleteOverrider:self];
    [(PKPaymentPassDetailViewController *)v12 setShowDoneButton:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)enableButtons
{
  [(UIBarButtonItem *)self->_deleteBarButton setEnabled:1];
  deleteBarButton = self->_deleteBarButton;
  id v4 = [MEMORY[0x1E4FB1618] redColor];
  [(UIBarButtonItem *)deleteBarButton setTintColor:v4];

  [(UIBarButtonItem *)self->_recoverBarButton setEnabled:1];
  recoverBarButton = self->_recoverBarButton;
  id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(UIBarButtonItem *)recoverBarButton setTintColor:v6];

  id v8 = [(PKExpiredSinglePassViewController *)self navigationController];
  id v7 = [v8 toolbar];
  [v7 setNeedsLayout];
}

- (void)disableButtons
{
  [(UIBarButtonItem *)self->_deleteBarButton setEnabled:0];
  deleteBarButton = self->_deleteBarButton;
  id v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIBarButtonItem *)deleteBarButton setTintColor:v4];

  [(UIBarButtonItem *)self->_recoverBarButton setEnabled:0];
  recoverBarButton = self->_recoverBarButton;
  id v6 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIBarButtonItem *)recoverBarButton setTintColor:v6];

  id v8 = [(PKExpiredSinglePassViewController *)self navigationController];
  id v7 = [v8 toolbar];
  [v7 setNeedsLayout];
}

- (void)_didPresentDetailViewController
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKExpiredSinglePassViewController__didPresentDetailViewController__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKExpiredSinglePassViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __68__PKExpiredSinglePassViewController__didPresentDetailViewController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popToRootViewControllerAnimated:1];
}

- (id)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_recoverBarButton, 0);
  objc_storeStrong((id *)&self->_deleteBarButton, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end