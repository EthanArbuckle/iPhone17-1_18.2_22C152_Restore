@interface PKApplyCollectionViewController
- (BOOL)shouldDisplayErrorOnWithdraw;
- (PKApplyCollectionViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6;
- (PKApplyController)controller;
- (PKDynamicProvisioningPageContent)page;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (id)_secondaryButton;
- (id)additionalAnalyticsDictionaryForViewAppearing:(BOOL)a3;
- (id)currentPage;
- (id)pageTag;
- (id)primaryButtonAction;
- (void)_cancelPressed;
- (void)_reportViewDidAppear:(BOOL)a3;
- (void)_withdrawApplicationTapped;
- (void)didTapFooterLink:(id)a3;
- (void)didTapLearnMore:(id)a3;
- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5;
- (void)displayDisplayableError:(id)a3;
- (void)handleNextStep;
- (void)handleNextViewController:(id)a3 displayableError:(id)a4;
- (void)primaryButtonTapped;
- (void)secondaryButtonTapped;
- (void)setPage:(id)a3;
- (void)setPrimaryButtonAction:(id)a3;
- (void)terminateSetupFlow;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyCollectionViewController

- (PKApplyCollectionViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyCollectionViewController;
  v14 = [(PKPaymentSetupOptionsViewController *)&v17 initWithProvisioningController:0 context:a5 delegate:0];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_setupDelegate, v12);
    objc_storeStrong((id *)&v15->_page, a6);
    objc_storeStrong((id *)&v15->_controller, a3);
  }

  return v15;
}

- (id)currentPage
{
  return self->_page;
}

- (void)viewDidLoad
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKApplyCollectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v38 viewDidLoad];
  v28 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v28 setTitleAccessoriesEnabled:0];
  [v28 setAdditionalBottomPadding:15.0];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  v3 = [(PKApplyCollectionViewController *)self navigationItem];
  v40[0] = v23;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v3 setLeftBarButtonItems:v4 animated:0];

  v22 = [(PKApplyCollectionViewController *)self navigationItem];
  [v22 setHidesBackButton:1];
  v30 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v27 = [v30 footerView];
  [v27 setManualEntryButton:0];
  v5 = [(PKDynamicProvisioningPageContent *)self->_page title];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v5];

  v6 = [(PKDynamicProvisioningPageContent *)self->_page subtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  v26 = [(PKDynamicProvisioningPageContent *)self->_page primaryActionTitle];
  if (v26)
  {
    v7 = [v30 primaryButton];
    [v7 setTitle:v26 forState:0];

    v8 = [v30 primaryButton];
    [v8 addTarget:self action:sel_primaryButtonTapped forControlEvents:64];
  }
  else
  {
    [v30 setPrimaryButton:0];
  }
  v25 = [(PKDynamicProvisioningPageContent *)self->_page secondaryActionTitle];
  if (v25)
  {
    v9 = [(PKApplyCollectionViewController *)self _secondaryButton];
    [v27 setSetupLaterButton:v9];
    [v9 setTitle:v25 forState:0];
    [v9 addTarget:self action:sel_secondaryButtonTapped forControlEvents:64];
  }
  else
  {
    [v27 setSetupLaterButton:0];
  }
  v29 = [(PKDynamicProvisioningPageContent *)self->_page footerContent];
  v24 = [v29 footerText];
  if (v29 && v24)
  {
    v21 = objc_alloc_init(PKMultiHyperlinkView);
    [(PKMultiHyperlinkView *)v21 setText:v24];
    [(PKMultiHyperlinkView *)v21 setTextAlignment:1];
    objc_initWeak(&location, self);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [v29 links];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v16 = [PKTextRangeHyperlink alloc];
          objc_super v17 = [v15 linkText];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __46__PKApplyCollectionViewController_viewDidLoad__block_invoke;
          v31[3] = &unk_1E59CB010;
          objc_copyWeak(&v32, &location);
          v31[4] = v15;
          v18 = [(PKTextRangeHyperlink *)v16 initWithLinkText:v17 action:v31];

          [v10 safelyAddObject:v18];
          objc_destroyWeak(&v32);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v12);
    }

    uint64_t v19 = [v10 count];
    if (v19) {
      v20 = (void *)[v10 copy];
    }
    else {
      v20 = 0;
    }
    [(PKMultiHyperlinkView *)v21 setSources:v20];
    if (v19) {

    }
    [v30 setAdditionalLinkView:v21];
    objc_destroyWeak(&location);
  }
}

void __46__PKApplyCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained didTapFooterLink:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyCollectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewDidAppear:a3];
  [(PKApplyCollectionViewController *)self _reportViewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyCollectionViewController;
  [(PKApplyCollectionViewController *)&v4 viewDidDisappear:a3];
  [(PKApplyCollectionViewController *)self _reportViewDidAppear:0];
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (id *)MEMORY[0x1E4F864A0];
  if (!a3) {
    v5 = (id *)MEMORY[0x1E4F864A8];
  }
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = *v5;
  id v12 = objc_alloc_init(v6);
  v8 = [(PKApplyCollectionViewController *)self additionalAnalyticsDictionaryForViewAppearing:v3];
  [v12 addEntriesFromDictionary:v8];

  [v12 setObject:v7 forKey:*MEMORY[0x1E4F86308]];
  v9 = [(PKApplyCollectionViewController *)self controller];
  id v10 = [(PKApplyCollectionViewController *)self currentPage];
  id v11 = [(PKApplyCollectionViewController *)self pageTag];
  [v9 reportAnalyticsDictionaryForPage:v10 pageTag:v11 additionalValues:v12];
}

- (id)pageTag
{
  return 0;
}

- (BOOL)shouldDisplayErrorOnWithdraw
{
  return 1;
}

- (id)additionalAnalyticsDictionaryForViewAppearing:(BOOL)a3
{
  return 0;
}

- (void)primaryButtonTapped
{
  v17[2] = *MEMORY[0x1E4F143B8];
  controller = self->_controller;
  objc_super v4 = [(PKApplyCollectionViewController *)self currentPage];
  v5 = [(PKApplyCollectionViewController *)self pageTag];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v16[0] = *MEMORY[0x1E4F86308];
  v16[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F861B8];
  v17[0] = *MEMORY[0x1E4F86380];
  v17[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v4 pageTag:v5 additionalValues:v8];

  primaryButtonAction = (unsigned int (**)(void))self->_primaryButtonAction;
  if (!primaryButtonAction || primaryButtonAction[2]())
  {
    [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
    id v10 = [(PKApplyCollectionViewController *)self currentPage];
    id v11 = [(PKApplyCollectionViewController *)self controller];
    id v12 = [v10 primaryActionIdentifier];
    uint64_t v13 = [v10 footerContent];
    v14 = [v13 termsIdentifiers];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__PKApplyCollectionViewController_primaryButtonTapped__block_invoke;
    v15[3] = &unk_1E59CB6B0;
    v15[4] = self;
    [v11 submitActionIdentifier:v12 termsIdentifiers:v14 odiAttributesDictionary:0 completion:v15];
  }
}

uint64_t __54__PKApplyCollectionViewController_primaryButtonTapped__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleNextViewController:a2 displayableError:a3];
}

- (void)secondaryButtonTapped
{
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_setupDelegate);
    [v5 viewControllerDidTerminateSetupFlow:self];
  }
}

- (id)_secondaryButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v3 setExclusiveTouch:1];
  objc_super v4 = [v3 titleLabel];
  [v4 setNumberOfLines:0];
  [v4 setTextAlignment:1];
  id v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B0]);
  [v4 setFont:v5];

  [v3 addTarget:self action:sel_secondaryButtonTapped forControlEvents:64];

  return v3;
}

- (void)_cancelPressed
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKApplyCollectionViewController__cancelPressed__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  objc_super v4 = [(PKApplyController *)self->_controller cancelAlertWithContinueAction:v3];
  if (v4)
  {
    id v5 = [(PKApplyCollectionViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __49__PKApplyCollectionViewController__cancelPressed__block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[161];
  objc_super v4 = [v2 currentPage];
  id v5 = [*(id *)(a1 + 32) pageTag];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86128];
  v13[0] = *MEMORY[0x1E4F86380];
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v3 reportAnalyticsDictionaryForPage:v4 pageTag:v5 additionalValues:v8];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1288) featureIdentifier];
  id v10 = *(id **)(a1 + 32);
  if (v9 != 5) {
    return [v10 _withdrawApplicationTapped];
  }
  [v10[161] endApplyFlow];
  return [*(id *)(a1 + 32) terminateSetupFlow];
}

- (void)_withdrawApplicationTapped
{
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E59CCD58;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(PKApplyController *)controller withdrawApplicationWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = [WeakRetained navigationController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke_2;
      v11[3] = &unk_1E59CB6D8;
      v11[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v11);
    }
    else
    {
      [WeakRetained setShowNavigationBarSpinner:0];
      if (!v6 || ![*(id *)(a1 + 32) shouldDisplayErrorOnWithdraw])
      {
        [v8[161] endApplyFlow];
        [v8 terminateSetupFlow];
        goto LABEL_9;
      }
      id v9 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      id v10 = [v8 navigationController];
      [v10 presentViewController:v9 animated:1 completion:0];
    }
  }
LABEL_9:
}

uint64_t __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 terminateSetupFlow];
  }
  return result;
}

- (void)handleNextStep
{
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PKApplyCollectionViewController_handleNextStep__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [(PKApplyController *)controller nextViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__PKApplyCollectionViewController_handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNextViewController:v8 displayableError:v5];
  }
}

- (void)handleNextViewController:(id)a3 displayableError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(PKApplyCollectionViewController *)self navigationController];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__PKApplyCollectionViewController_handleNextViewController_displayableError___block_invoke;
    v10[3] = &unk_1E59CB6D8;
    v10[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, v10);
  }
  else if (v7)
  {
    [(PKApplyCollectionViewController *)self displayDisplayableError:v7];
  }
  else
  {
    [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:0];
    [(PKApplyCollectionViewController *)self terminateSetupFlow];
  }
}

uint64_t __77__PKApplyCollectionViewController_handleNextViewController_displayableError___block_invoke(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 terminateSetupFlow];
  }
  return result;
}

- (void)displayDisplayableError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 underlyingErrors];
  id v6 = [v5 firstObject];

  id v7 = [v6 domain];
  id v8 = (void *)*MEMORY[0x1E4F870B0];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    id v11 = v10;
    if (!v9 || !v10)
    {

LABEL_10:
      goto LABEL_11;
    }
    int v12 = [v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_10;
    }
  }
  uint64_t v13 = [v6 code];

  if (v13 == 1)
  {
    [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:0];
    goto LABEL_17;
  }
LABEL_11:
  id v14 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
  if (v14)
  {
    v15 = [(PKApplyCollectionViewController *)self navigationController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PKApplyCollectionViewController_displayDisplayableError___block_invoke;
    void v17[3] = &unk_1E59CA7D0;
    v17[4] = self;
    [v15 presentViewController:v14 animated:1 completion:v17];
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Error could not generate alertController for: %@", buf, 0xCu);
    }

    [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:0];
    [(PKApplyCollectionViewController *)self terminateSetupFlow];
  }

LABEL_17:
}

uint64_t __59__PKApplyCollectionViewController_displayDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void)terminateSetupFlow
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v6 = [(PKApplyCollectionViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapLearnMore:(id)a3
{
  id v4 = a3;
  id v6 = [v4 buttonURL];
  id v5 = [v4 termsIdentifier];

  [(PKApplyCollectionViewController *)self didTapLink:v6 termsIdentifier:v5 analyticsIdentifier:0];
}

- (void)didTapFooterLink:(id)a3
{
  id v4 = a3;
  id v7 = [v4 linkURL];
  id v5 = [v4 termsIdentifier];
  id v6 = [v4 analyticsIdentifier];

  [(PKApplyCollectionViewController *)self didTapLink:v7 termsIdentifier:v5 analyticsIdentifier:v6];
}

- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PKApplyCollectionViewController *)self controller];
  int v12 = [v11 account];

  if (v10)
  {
    uint64_t v13 = [(PKApplyCollectionViewController *)self controller];
    id v14 = [(PKApplyCollectionViewController *)self currentPage];
    v15 = [(PKApplyCollectionViewController *)self pageTag];
    uint64_t v16 = *MEMORY[0x1E4F86380];
    uint64_t v17 = *MEMORY[0x1E4F86120];
    v32[0] = *MEMORY[0x1E4F86308];
    v32[1] = v17;
    v33[0] = v16;
    v33[1] = v10;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v13 reportAnalyticsDictionaryForPage:v14 pageTag:v15 additionalValues:v18];
  }
  if (v9)
  {
    if (v12)
    {
      id v19 = [PKAccountTermsAndConditionsController alloc];
      uint64_t v20 = [MEMORY[0x1E4F84D50] sharedService];
      v21 = [(PKAccountTermsAndConditionsController *)v19 initWithAccount:v12 webService:v20 context:[(PKPaymentSetupOptionsViewController *)self context] termsIdentifier:v9];
      termsController = self->_termsController;
      self->_termsController = v21;

      objc_initWeak(location, self);
      v23 = self->_termsController;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __82__PKApplyCollectionViewController_didTapLink_termsIdentifier_analyticsIdentifier___block_invoke;
      v29[3] = &unk_1E59CB9C8;
      objc_copyWeak(&v30, location);
      [(PKAccountTermsAndConditionsController *)v23 termsViewControllerWithCompletion:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak(location);
    }
    else
    {
      v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v9;
        _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
      }
    }
  }
  else if (v8)
  {
    v24 = [v8 scheme];
    int v25 = [v24 containsString:@"http"];

    if (v25)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v8];
      [v26 setModalPresentationStyle:2];
      [(PKApplyCollectionViewController *)self presentViewController:v26 animated:1 completion:0];
    }
    else
    {
      v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v28 openSensitiveURL:v8 withOptions:0];
    }
  }
}

void __82__PKApplyCollectionViewController_didTapLink_termsIdentifier_analyticsIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      id v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (PKApplyController)controller
{
  return self->_controller;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_termsController, 0);
}

@end