@interface PKAddToWatchOfferViewController
- (PKAddToWatchOfferViewController)initWithPass:(id)a3 context:(int64_t)a4;
- (PKSecureElementPass)pass;
- (unint64_t)edgesForExtendedLayout;
- (void)_clearInteractionDisabledView;
- (void)_configureNavigationItem;
- (void)_setIdleTimerDisabled:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)showSpinner:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddToWatchOfferViewController

- (PKAddToWatchOfferViewController)initWithPass:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v8 = [(PKExplanationViewController *)self initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pass, a3);
    v10 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
    heroView = v9->_heroView;
    v9->_heroView = v10;

    v12 = objc_alloc_init(PKPassSnapshotter);
    pass = v9->_pass;
    [(PKHeroCardWatchExplainationHeaderView *)v9->_heroView recommendedCardImageSize];
    double v15 = v14;
    double v17 = v16;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke;
    v20[3] = &unk_1E59CA898;
    v18 = v9;
    v21 = v18;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](v12, "snapshotWithPass:size:completion:", pass, v20, v15, v17);
    [(PKAddToWatchOfferViewController *)v18 _configureNavigationItem];
  }
  return v9;
}

void __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1048) setCardImage:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(PKAddToWatchOfferViewController *)self _clearInteractionDisabledView];
  v3.receiver = self;
  v3.super_class = (Class)PKAddToWatchOfferViewController;
  [(PKAddToWatchOfferViewController *)&v3 dealloc];
}

- (void)_configureNavigationItem
{
  objc_super v3 = [(PKAddToWatchOfferViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v5 = PKLocalizedString(&cfstr_Done.isa);
  id v8 = (id)[v4 initWithTitle:v5 style:2 target:self action:sel__addLater];

  id v6 = [(PKAddToWatchOfferViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v8];

  id v7 = [(PKAddToWatchOfferViewController *)self navigationItem];
  [v7 setTitle:&stru_1EF1B5B50];
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)PKAddToWatchOfferViewController;
  [(PKExplanationViewController *)&v13 loadView];
  objc_super v3 = [(PKAddToWatchOfferViewController *)self view];
  id v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  v5 = [(PKExplanationViewController *)self explanationView];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [v5 setHeroView:self->_heroView];
  [v5 setTopBackgroundColor:0];
  [(PKExplanationViewController *)self setPrivacyLinkController:0];
  id v6 = PKLocalizedPaymentString(&cfstr_AddToAppleWatc.isa);
  [v5 setTitleText:v6];

  id v7 = [(PKSecureElementPass *)self->_pass paymentPass];
  id v8 = [v7 localizedDescription];
  v9 = PKLocalizedPaymentString(&cfstr_AddToAppleWatc_0.isa, &stru_1EF1B4C70.isa, v8);
  [v5 setBodyText:v9];

  v10 = [v5 dockView];
  v11 = [v10 primaryButton];
  v12 = PKLocalizedPaymentString(&cfstr_AddNow.isa);
  [v11 setTitle:v12 forState:0];

  [v11 addTarget:self action:sel__addToWatch forControlEvents:64];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PKAddToWatchOfferViewController;
  [(PKExplanationViewController *)&v2 viewWillLayoutSubviews];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAddToWatchOfferViewController;
  [(PKAddToWatchOfferViewController *)&v4 viewWillDisappear:a3];
  [(PKAddToWatchOfferViewController *)self _clearInteractionDisabledView];
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [(PKExplanationViewController *)self explanationView];
  v5 = [v17 dockView];
  id v6 = [v5 primaryButton];

  BOOL v7 = !v3;
  [v6 setEnabled:v7];
  if (v7)
  {
    [v6 setShowSpinner:0];
    double v15 = [(PKAddToWatchOfferViewController *)self navigationItem];
    double v16 = [v15 rightBarButtonItem];
    [v16 setEnabled:1];

    [(PKAddToWatchOfferViewController *)self _clearInteractionDisabledView];
  }
  else
  {
    [v6 setShowSpinner:1];
    id v8 = [(PKAddToWatchOfferViewController *)self navigationItem];
    v9 = [v8 rightBarButtonItem];
    [v9 setEnabled:0];

    if (!self->_interactionDisabledView)
    {
      v10 = [(PKAddToWatchOfferViewController *)self navigationController];
      v11 = v10;
      if (!v10) {
        v10 = self;
      }
      v12 = [v10 view];
      interactionDisabledView = self->_interactionDisabledView;
      self->_interactionDisabledView = v12;

      double v14 = self->_interactionDisabledView;
      if (v14)
      {
        [(UIView *)v14 setUserInteractionEnabled:0];
        [(PKAddToWatchOfferViewController *)self _setIdleTimerDisabled:1];
      }
    }
  }
}

- (void)_clearInteractionDisabledView
{
  interactionDisabledView = self->_interactionDisabledView;
  if (interactionDisabledView)
  {
    [(UIView *)interactionDisabledView setUserInteractionEnabled:1];
    objc_super v4 = self->_interactionDisabledView;
    self->_interactionDisabledView = 0;

    [(PKAddToWatchOfferViewController *)self _setIdleTimerDisabled:0];
  }
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"enabled";
    if (v3) {
      v5 = @"disabled";
    }
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    v10 = @"PKAddToWatchOfferViewController";
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@)", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v6 _setIdleTimerDisabled:v3 forReason:@"PKAddToWatchOfferViewController"];
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(PKAddToWatchOfferViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKAddToWatchOfferViewController *)self showSpinner:v4];
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_heroView, 0);

  objc_storeStrong((id *)&self->_interactionDisabledView, 0);
}

@end