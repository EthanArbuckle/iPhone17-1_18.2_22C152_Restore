@interface PKPayLaterExplanationViewController
- (PKPayLaterExplanationViewController)initWithSetupFlowController:(id)a3;
- (id)_genericError;
- (void)_setDynamicContentPage;
- (void)_showLanguageDisclosureIfNecessaryWithCompletion:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPayLaterExplanationViewController

- (PKPayLaterExplanationViewController)initWithSetupFlowController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v10, sel_initWithContext_, [v5 setupContext]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupController, a3);
    [(PKPayLaterExplanationViewController *)v7 _setDynamicContentPage];
    uint64_t v8 = 1;
    [(PKPayLaterExplanationViewController *)v7 setModalInPresentation:1];
    [(PKExplanationViewController *)v7 setExplanationViewControllerDelegate:v7];
    switch([v5 controllerContext])
    {
      case 0:
        uint64_t v8 = PKOslo2024UIUpdatesEnabled() ^ 1;
        goto LABEL_5;
      case 1:
      case 3:
      case 4:
        goto LABEL_5;
      case 2:
        uint64_t v8 = 0;
LABEL_5:
        [(PKExplanationViewController *)v7 setShowCancelButton:v8];
        break;
      default:
        break;
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterExplanationViewController;
  [(PKExplanationViewController *)&v31 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 32);
  id v5 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
  [v4 setDisplayLanguage:v5];

  [(PKPayLaterExplanationViewController *)self addChildViewController:v4];
  [v3 setPrivacyLink:v4];
  [v3 setShowPrivacyView:1];
  [v4 didMoveToParentViewController:self];
  [v3 setDelegate:self];
  [v3 setBodyDataDetectorTypes:0];
  v6 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerTitle];
  [v3 setTitleText:v6];

  v7 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerSubtitle];
  [v3 setBodyText:v7];

  uint64_t v8 = PKProvisioningSecondaryBackgroundColor();
  v9 = [[PKApplyHeroCardView alloc] initWithFeatureIdentifier:3];
  [(PKApplyHeroCardView *)v9 setBackgroundColor:v8];
  v25 = v9;
  [v3 setHeroView:v9];
  [v3 setTopBackgroundColor:v8];
  objc_super v10 = [(PKPayLaterExplanationViewController *)self parentViewController];
  v11 = [v10 navigationController];
  v12 = [v11 navigationBar];
  [v12 setBackgroundColor:v8];

  v13 = [v3 dockView];
  v14 = [v13 footerView];
  v15 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage primaryActionTitle];
  if (v15)
  {
    v16 = [v13 primaryButton];
    [v16 setTitle:v15 forState:0];
  }
  v24 = v14;
  [v14 setManualEntryButton:0];
  v17 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  v18 = [v17 payLaterAccount];

  v19 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage footerContent];
  uint64_t v20 = [v19 footerText];
  v21 = (void *)v20;
  if (v19 && v20)
  {
    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke;
    v26[3] = &unk_1E59D7AA8;
    objc_copyWeak(&v29, &location);
    id v27 = v18;
    v28 = self;
    v22 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:v19 linkTapped:v26];
    v23 = objc_alloc_init(PKMultiHyperlinkView);
    [(PKMultiHyperlinkView *)v23 setText:v21];
    [(PKMultiHyperlinkView *)v23 setTextAlignment:1];
    [(PKMultiHyperlinkView *)v23 setSources:v22];
    [v13 setAdditionalLinkView:v23];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

void __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = [v3 linkURL];
    v7 = [v3 termsIdentifier];
    if (v7)
    {
      if (*(void *)(a1 + 32))
      {
        uint64_t v8 = [PKAccountTermsAndConditionsController alloc];
        uint64_t v9 = *(void *)(a1 + 32);
        objc_super v10 = [MEMORY[0x1E4F84D50] sharedService];
        uint64_t v11 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v8, "initWithAccount:webService:context:termsIdentifier:", v9, v10, [*(id *)(*(void *)(a1 + 40) + 1040) setupContext], v7);
        v12 = (void *)WeakRetained[134];
        WeakRetained[134] = v11;

        v13 = (void *)WeakRetained[134];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke_16;
        v18[3] = &unk_1E59CB9C8;
        objc_copyWeak(&v19, v4);
        [v13 termsViewControllerWithCompletion:v18];
        objc_destroyWeak(&v19);
      }
      else
      {
        v17 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v7;
          _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", buf, 0xCu);
        }
      }
    }
    else if (v6)
    {
      v14 = [v6 scheme];
      int v15 = [v14 containsString:@"http"];

      if (v15)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v6];
        [v16 setModalPresentationStyle:2];
        [WeakRetained presentViewController:v16 animated:1 completion:0];
      }
      else
      {
        v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v16 openSensitiveURL:v6 withOptions:0];
      }
    }
  }
}

void __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      uint64_t v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterExplanationViewController;
  [(PKPayLaterExplanationViewController *)&v17 viewWillAppear:a3];
  self->_didTapContinue = 0;
  v4 = [(PKPayLaterExplanationViewController *)self parentViewController];
  id v5 = [v4 navigationController];
  v6 = [v5 navigationBar];
  id v7 = [v6 backgroundColor];
  originalNavBarColor = self->_originalNavBarColor;
  self->_originalNavBarColor = v7;

  id v9 = [(PKPayLaterExplanationViewController *)self parentViewController];
  objc_super v10 = [v9 navigationController];
  uint64_t v11 = [v10 navigationBar];
  v12 = PKProvisioningSecondaryBackgroundColor();
  [v11 setBackgroundColor:v12];

  v13 = [(PKPayLaterExplanationViewController *)self parentViewController];
  v14 = [v13 navigationController];
  int v15 = [v14 navigationBar];
  v16 = PKProvisioningSecondaryBackgroundColor();
  [v15 setBackgroundColor:v16];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterExplanationViewController;
  [(PKPayLaterExplanationViewController *)&v7 viewWillDisappear:a3];
  v4 = [(PKPayLaterExplanationViewController *)self parentViewController];
  id v5 = [v4 navigationController];
  v6 = [v5 navigationBar];
  [v6 setBackgroundColor:self->_originalNavBarColor];

  if (![(PKExplanationViewController *)self showCancelButton] && !self->_didTapContinue) {
    [(PKPayLaterSetupFlowController *)self->_setupController endSetupFlowFromViewController:self shouldDismiss:0];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_dynamicContentPage)
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
    else
    {
      setupController = self->_setupController;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke;
      v7[3] = &unk_1E59CD2D0;
      v7[4] = self;
      id v8 = v4;
      [(PKPayLaterSetupFlowController *)setupController fetchPayLaterDynamicContentWithCompletion:v7];
    }
  }
}

void __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CF278;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDynamicContentPage];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  [(PKPayLaterExplanationViewController *)self _showSpinner:1];
  self->_didTapContinue = 1;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v10[3] = &unk_1E59D0108;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [v5 addOperation:v10];
  char v6 = [MEMORY[0x1E4F1CA98] null];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v8[3] = &unk_1E59D5420;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  id v7 = (id)[v5 evaluateWithInput:v6 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v13[3] = &unk_1E59CAE30;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 _showLanguageDisclosureIfNecessaryWithCompletion:v13];

  objc_destroyWeak(&v16);
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v7 isCanceled])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 1080) = 0;
      [*(id *)(a1 + 32) _showSpinner:0];
      [*(id *)(*(void *)(a1 + 32) + 1040) endSetupFlowFromViewController:*(void *)(a1 + 32) shouldDismiss:1];
    }
    else
    {
      id v9 = (void *)WeakRetained[130];
      uint64_t v10 = *(void *)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_4;
      v11[3] = &unk_1E59CCD58;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      v11[4] = *(void *)(a1 + 32);
      [v9 nextViewControllerFromState:0 parentViewController:v10 completion:v11];
      objc_destroyWeak(&v12);
    }
  }
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = [WeakRetained navigationController];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_5;
      v12[3] = &unk_1E59CB6D8;
      v12[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 1080) = 0;
      if (!v6)
      {
        [*(id *)(a1 + 32) _showSpinner:0];
        [*(id *)(*(void *)(a1 + 32) + 1040) endSetupFlowFromViewController:*(void *)(a1 + 32) shouldDismiss:1];
        goto LABEL_5;
      }
      uint64_t v10 = PKAccountDisplayableError();
      id v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      if (v9)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_6;
        v11[3] = &unk_1E59CA7D0;
        v11[4] = v8;
        [v8 presentViewController:v9 animated:1 completion:v11];
      }
    }
  }
LABEL_5:
}

uint64_t __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

uint64_t __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSpinner:0];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
}

- (void)_showLanguageDisclosureIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if (!self->_languageDisclosureDynamicContentPage)
    {
LABEL_5:
      v4[2](v4, 1);
      goto LABEL_6;
    }
    unint64_t v5 = [(PKPayLaterSetupFlowController *)self->_setupController controllerContext];
    if (v5 <= 4)
    {
      if (v5 != 2) {
        goto LABEL_5;
      }
      id v6 = [(PKPayLaterDynamicContentPage *)self->_languageDisclosureDynamicContentPage contentItem];
      id v7 = [v6 contentTitle];

      id v8 = [(PKPayLaterDynamicContentPage *)self->_languageDisclosureDynamicContentPage contentItem];
      id v9 = [v8 contentSubtitle];

      uint64_t v10 = [(PKPayLaterDynamicContentPage *)self->_languageDisclosureDynamicContentPage primaryActionTitle];
      uint64_t v11 = [(PKPayLaterDynamicContentPage *)self->_languageDisclosureDynamicContentPage secondaryActionTitle];
      id v12 = (void *)v11;
      if (v7) {
        BOOL v13 = v9 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13 || v10 == 0 || v11 == 0)
      {
        id v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error forming lanauge disclosure alert", buf, 2u);
        }

        v4[2](v4, 1);
      }
      else
      {
        objc_super v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
        v18 = (void *)MEMORY[0x1E4FB1410];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke;
        v27[3] = &unk_1E59CB150;
        id v19 = v4;
        v28 = v19;
        uint64_t v20 = [v18 actionWithTitle:v10 style:0 handler:v27];
        [v17 addAction:v20];

        v21 = (void *)MEMORY[0x1E4FB1410];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke_2;
        v25[3] = &unk_1E59CB150;
        uint64_t v22 = v19;
        v26 = v22;
        v23 = [v21 actionWithTitle:v12 style:1 handler:v25];
        [v17 addAction:v23];

        if (v17)
        {
          [(PKPayLaterExplanationViewController *)self presentViewController:v17 animated:1 completion:0];
        }
        else
        {
          v24 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Error forming lanauge disclosure alert", buf, 2u);
          }

          v22[2](v22, 1);
        }
      }
    }
  }
LABEL_6:
}

uint64_t __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  id v6 = [(PKExplanationViewController *)self explanationView];
  id v7 = [v6 dockView];
  [v7 setButtonsEnabled:v5];

  [(PKExplanationViewController *)self showSpinner:v3];
  id v13 = [(PKPayLaterExplanationViewController *)self navigationController];
  id v8 = [v13 navigationBar];
  [v8 setUserInteractionEnabled:v5];

  id v9 = [v13 interactivePopGestureRecognizer];
  [v9 setEnabled:v5];

  uint64_t v10 = [(PKPayLaterExplanationViewController *)self navigationItem];
  uint64_t v11 = [v10 leftBarButtonItem];
  [v11 setEnabled:v5];

  id v12 = [v10 rightBarButtonItem];
  [v12 setEnabled:v5];
}

- (id)_genericError
{
  BOOL v3 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
  id v4 = PKLocalizedApplyFeatureString();

  BOOL v5 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
  id v6 = PKLocalizedApplyFeatureString();

  id v7 = PKDisplayableErrorCustom();

  return v7;
}

- (void)_setDynamicContentPage
{
  BOOL v3 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  id v11 = [v3 dynamicContent];

  unint64_t v4 = [(PKPayLaterSetupFlowController *)self->_setupController selectedProductType];
  BOOL v5 = [(PKPayLaterSetupFlowController *)self->_setupController selectedFinancingOption];
  id v6 = [v5 identifier];
  id v7 = [v11 dynamicContentPageForPageType:2 productType:v4 optionIdentifier:v6];
  dynamicContentPage = self->_dynamicContentPage;
  self->_dynamicContentPage = v7;

  id v9 = [v11 dynamicContentPageForPageType:13];
  languageDisclosureDynamicContentPage = self->_languageDisclosureDynamicContentPage;
  self->_languageDisclosureDynamicContentPage = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalNavBarColor, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_languageDisclosureDynamicContentPage, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_applyController, 0);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end