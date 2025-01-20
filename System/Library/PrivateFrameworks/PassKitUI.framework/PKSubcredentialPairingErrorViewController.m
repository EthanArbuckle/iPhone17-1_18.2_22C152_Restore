@interface PKSubcredentialPairingErrorViewController
- (BOOL)_translateErrorCode:(int64_t)a3 toTitleText:(id *)a4 bodyText:(id *)a5;
- (BOOL)suppressFieldDetect;
- (PKSubcredentialPairingErrorViewController)initWithFlowController:(id)a3 context:(id)a4;
- (PKSubcredentialPairingFlowControllerContext)provisioningContext;
- (PKSubcredentialPairingFlowControllerProtocol)flowController;
- (id)_error;
- (unint64_t)operation;
- (void)cancelButtonPressed;
- (void)configureExplanationViewWithError:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSubcredentialPairingErrorViewController

- (PKSubcredentialPairingErrorViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 error];
  if (!v9)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with no error", v18, 2u);
    }
  }
  v11 = [(PKSubcredentialPairingErrorViewController *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_flowController, a3);
    objc_storeStrong((id *)&v12->_provisioningContext, a4);
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v12 action:sel_cancelButtonPressed];
    v14 = [(PKSubcredentialPairingErrorViewController *)v12 navigationItem];
    [v14 setLeftBarButtonItem:v13];

    id v15 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v15 configureWithTransparentBackground];
    v16 = [(PKSubcredentialPairingErrorViewController *)v12 navigationItem];
    [v16 setStandardAppearance:v15];
  }
  return v12;
}

- (unint64_t)operation
{
  return 0;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialPairingErrorViewController;
  [(PKSubcredentialPairingErrorViewController *)&v21 viewDidLoad];
  v3 = [[PKExplanationView alloc] initWithContext:0 delegate:self];
  explanationView = self->_explanationView;
  self->_explanationView = v3;

  v5 = self->_explanationView;
  v6 = [PKCredentialPairingExplanationHeaderView alloc];
  id v7 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  id v8 = [(PKCredentialPairingExplanationHeaderView *)v6 initWithConfiguration:v7];
  [(PKExplanationView *)v5 setHeroView:v8];

  v9 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  v10 = [v9 provisioningTemplateIdentifier];

  v11 = [MEMORY[0x1E4F84EC8] sharedInstance];
  v12 = [v11 provisioningString:@"TRY_AGAIN_BUTTON_TITLE" templateIdentifier:v10];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = v14;

  v16 = [(PKExplanationView *)self->_explanationView dockView];
  v17 = [v16 primaryButton];
  [v17 setTitle:v15 forState:0];

  v18 = [(PKSubcredentialPairingErrorViewController *)self _error];
  [(PKSubcredentialPairingErrorViewController *)self configureExplanationViewWithError:v18];

  v19 = [(PKSubcredentialPairingErrorViewController *)self view];
  v20 = PKProvisioningBackgroundColor();
  [v19 setBackgroundColor:v20];

  [v19 addSubview:self->_explanationView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialPairingErrorViewController;
  [(PKSubcredentialPairingErrorViewController *)&v9 viewDidAppear:a3];
  v4 = [(PKSubcredentialPairingErrorViewController *)self _error];
  id v7 = 0;
  id v8 = 0;
  -[PKSubcredentialPairingErrorViewController _translateErrorCode:toTitleText:bodyText:](self, "_translateErrorCode:toTitleText:bodyText:", [v4 code], &v8, &v7);
  id v5 = v8;
  id v6 = v7;

  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:0 errorMessage:v5 page:2];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialPairingErrorViewController;
  [(PKSubcredentialPairingErrorViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(PKSubcredentialPairingErrorViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  -[PKExplanationView setFrame:](self->_explanationView, "setFrame:", v5 + v12, v7 + 0.0, v9 - (v12 + v13), v11);
}

- (void)configureExplanationViewWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F87EC8]])
  {
    uint64_t v6 = [v4 code];
  }
  else
  {
    double v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = (uint64_t)v5;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with error of unknown domain: %@", buf, 0xCu);
    }

    uint64_t v6 = 0;
  }
  id v12 = 0;
  id v13 = 0;
  BOOL v8 = [(PKSubcredentialPairingErrorViewController *)self _translateErrorCode:v6 toTitleText:&v13 bodyText:&v12];
  id v9 = v13;
  id v10 = v12;
  if (!v8)
  {
    double v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v6;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Showing provisioning error view controller with unexpected error: %ld", buf, 0xCu);
    }
  }
  [(PKExplanationView *)self->_explanationView setTitleText:v9];
  [(PKExplanationView *)self->_explanationView setBodyText:v10];
}

- (void)cancelButtonPressed
{
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  if (self->_flowController)
  {
    if (!self->_isAdvancing)
    {
      self->_isAdvancing = 1;
      objc_initWeak(buf, self);
      flowController = self->_flowController;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke;
      v7[3] = &unk_1E59CD960;
      objc_copyWeak(&v8, buf);
      v7[4] = self;
      [(PKSubcredentialPairingFlowControllerProtocol *)flowController nextViewControllerFromProvisioningOperation:self withCompletion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
      goto LABEL_8;
    }
    double v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    double v5 = [(PKSubcredentialPairingErrorViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }

LABEL_8:
}

void __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      double v7 = [*(id *)(a1 + 32) navigationController];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke_2;
      v8[3] = &unk_1E59CB100;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      [WeakRetained[124] provisioningFinishedWithOperation:WeakRetained];
    }
  }
}

void __78__PKSubcredentialPairingErrorViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[984] = 0;
  }
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (id)_error
{
  return [(PKSubcredentialProvisioningFlowControllerContext *)self->_provisioningContext error];
}

- (BOOL)_translateErrorCode:(int64_t)a3 toTitleText:(id *)a4 bodyText:(id *)a5
{
  id v9 = [MEMORY[0x1E4F84EC8] sharedInstance];
  id v10 = [(PKSubcredentialPairingFlowControllerContext *)self->_provisioningContext configuration];
  double v11 = [v10 provisioningTemplateIdentifier];

  if (a3 == 4)
  {
    objc_super v14 = [v9 provisioningString:@"PAIRING_PREREQUISITES_NOT_MET_CODE_TITLE" templateIdentifier:v11];
    uint64_t v15 = v14;
    if (v14)
    {
      *a4 = v14;
    }
    else
    {
      PKLocalizedCredentialString(&cfstr_PairingPrerequ.isa);
      id v21 = objc_claimAutoreleasedReturnValue();
      *a4 = v21;
    }
    v19 = [v9 provisioningString:@"PAIRING_PREREQUISITES_NOT_MET_CODE_BODY" templateIdentifier:v11];
    if (!v19)
    {
      v20 = @"PAIRING_PREREQUISITES_NOT_MET_CODE_BODY";
      goto LABEL_16;
    }
LABEL_14:
    id v22 = v19;
    *a5 = v22;
LABEL_17:
    BOOL v24 = 1;
    goto LABEL_22;
  }
  if (a3 == 3)
  {
    id v12 = [v9 provisioningString:@"INVALID_PAIRING_CODE_TITLE" templateIdentifier:v11];
    id v13 = v12;
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      PKLocalizedCredentialString(&cfstr_InvalidPairing.isa);
      id v18 = objc_claimAutoreleasedReturnValue();
      *a4 = v18;
    }
    v19 = [v9 provisioningString:@"INVALID_PAIRING_CODE_BODY" templateIdentifier:v11];
    if (!v19)
    {
      v20 = @"INVALID_PAIRING_CODE_BODY";
LABEL_16:
      PKLocalizedCredentialString(&v20->isa);
      id v23 = objc_claimAutoreleasedReturnValue();
      *a5 = v23;

      id v22 = 0;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  uint64_t v16 = [v9 provisioningString:@"PAIRING_FAILED_TITLE" templateIdentifier:v11];
  v17 = v16;
  if (v16)
  {
    *a4 = v16;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_PairingFailedT.isa);
    id v25 = objc_claimAutoreleasedReturnValue();
    *a4 = v25;
  }
  v26 = [v9 provisioningString:@"PAIRING_FAILED_BODY" templateIdentifier:v11];
  if (v26)
  {
    id v22 = v26;
    BOOL v24 = 0;
    *a5 = v22;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_PairingFailedB.isa);
    id v27 = objc_claimAutoreleasedReturnValue();
    *a5 = v27;

    id v22 = 0;
    BOOL v24 = 0;
  }
LABEL_22:

  return v24;
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_flowController, 0);

  objc_storeStrong((id *)&self->_explanationView, 0);
}

@end