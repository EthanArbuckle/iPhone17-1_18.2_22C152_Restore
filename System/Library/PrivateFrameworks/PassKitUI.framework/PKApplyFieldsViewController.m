@interface PKApplyFieldsViewController
- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3;
- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder;
- (PKApplyFieldsViewController)initWithController:(id)a3 setupDelegate:(id)a4 applyPage:(id)a5;
- (id)currentPage;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (unint64_t)onPresentationRemoveViewControllersAfterMarker;
- (void)_analyticsReportError:(id)a3;
- (void)_analyticsReportRowTapForFieldCell:(id)a3;
- (void)_completeInWalletLater;
- (void)_featureApplicationUpdated;
- (void)_handleNextStep;
- (void)_handleNextViewController:(id)a3 displayableError:(id)a4 terminationHandler:(id)a5;
- (void)_terminateFlow;
- (void)_withdrawApplicationTapped;
- (void)didTapFooterLink:(id)a3;
- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5;
- (void)fieldCellDidTapButton:(id)a3;
- (void)handleCancelTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyFieldsViewController

- (PKApplyFieldsViewController)initWithController:(id)a3 setupDelegate:(id)a4 applyPage:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyFieldsViewController;
  v12 = -[PKDynamicProvisioningFieldsPageViewController initWithWebService:context:setupDelegate:fieldsPage:](&v14, sel_initWithWebService_context_setupDelegate_fieldsPage_, 0, [v9 context], v11, v10);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a3);
    objc_storeStrong((id *)&v12->_applyPage, a5);
    if ([(PKApplyController *)v12->_controller featureIdentifier] == 5) {
      [(PKPaymentSetupTableViewController *)v12 setMoveFooterWithKeyboard:[(UIViewController *)v12 pkui_userInterfaceIdiomSupportsLargeLayouts] ^ 1];
    }
  }

  return v12;
}

- (void)viewDidLoad
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKApplyFieldsViewController;
  [(PKDynamicProvisioningFieldsPageViewController *)&v28 viewDidLoad];
  v19 = [(PKApplyRequiredFieldsPage *)self->_applyPage footerContent];
  v18 = [v19 footerText];
  v16 = [(PKPaymentSetupTableViewController *)self dockView];
  if (v19) {
    BOOL v2 = v18 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    v17 = objc_alloc_init(PKMultiHyperlinkView);
    [(PKMultiHyperlinkView *)v17 setText:v18];
    [(PKMultiHyperlinkView *)v17 setTextAlignment:1];
    objc_initWeak(&location, self);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v4 = [v19 links];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v9 = [PKTextRangeHyperlink alloc];
          id v10 = [v8 linkText];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __42__PKApplyFieldsViewController_viewDidLoad__block_invoke;
          v21[3] = &unk_1E59CB010;
          objc_copyWeak(&v22, &location);
          v21[4] = v8;
          id v11 = [(PKTextRangeHyperlink *)v9 initWithLinkText:v10 action:v21];

          [v3 safelyAddObject:v11];
          objc_destroyWeak(&v22);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v5);
    }

    uint64_t v12 = [v3 count];
    if (v12) {
      v13 = (void *)[v3 copy];
    }
    else {
      v13 = 0;
    }
    [(PKMultiHyperlinkView *)v17 setSources:v13];
    if (v12) {

    }
    [v16 setAdditionalLinkView:v17];
    [v16 setAdditionalLinkBottomPadding:16.0];

    objc_destroyWeak(&location);
  }
  if (([(PKApplyController *)self->_controller applicationType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_super v14 = PKFeatureApplicationHeaderImageWithImage([(PKApplyController *)self->_controller featureIdentifier], 0);
    v15 = [(PKPaymentSetupFieldsViewController *)self headerView];
    [v14 size];
    objc_msgSend(v15, "setImageViewImage:withSize:animated:", v14, 0);
  }
}

void __42__PKApplyFieldsViewController_viewDidLoad__block_invoke(uint64_t a1)
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
  v21[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKApplyFieldsViewController;
  [(PKPaymentSetupFieldsViewController *)&v19 viewDidAppear:a3];
  [(PKApplyController *)self->_controller applyFlowDidAppear];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__featureApplicationUpdated name:@"PKApplyControllerUpdatedNotification" object:0];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(PKApplyRequiredFieldsPage *)self->_applyPage fieldModel];
  v7 = [v6 setupFieldAnalytics];
  [v5 addEntriesFromDictionary:v7];

  uint64_t v8 = *MEMORY[0x1E4F864A0];
  uint64_t v9 = *MEMORY[0x1E4F86308];
  [v5 setObject:*MEMORY[0x1E4F864A0] forKey:*MEMORY[0x1E4F86308]];
  controller = self->_controller;
  id v11 = [(PKApplyFieldsViewController *)self currentPage];
  uint64_t v12 = *MEMORY[0x1E4F85F78];
  [controller reportAnalyticsDictionaryForPage:v11 pageTag:*MEMORY[0x1E4F85F78] additionalValues:v5];

  unint64_t v13 = [(PKApplyController *)self->_controller featureIdentifier];
  if (v13 != 3)
  {
    controller = [(PKApplyController *)self->_controller featureApplication];
    if ([controller feature] != 3) {
      goto LABEL_7;
    }
  }
  objc_super v14 = [(PKApplyController *)self->_controller payLaterSetupController];
  uint64_t v15 = [v14 controllerContext];

  if (v13 != 3) {
  if (!v15)
  }
  {
    v16 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v17 = *MEMORY[0x1E4F87020];
    uint64_t v18 = *MEMORY[0x1E4F86730];
    v20[0] = v9;
    v20[1] = v18;
    v21[0] = v8;
    v21[1] = v12;
    controller = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    [v16 subject:v17 sendEvent:controller];
LABEL_7:
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKApplyFieldsViewController;
  [(PKApplyFieldsViewController *)&v10 viewDidDisappear:a3];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"PKApplyControllerUpdatedNotification" object:0];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(PKApplyRequiredFieldsPage *)self->_applyPage fieldModel];
  v7 = [v6 setupFieldAnalytics];
  [v5 addEntriesFromDictionary:v7];

  [v5 setObject:*MEMORY[0x1E4F864A8] forKey:*MEMORY[0x1E4F86308]];
  controller = self->_controller;
  uint64_t v9 = [(PKApplyFieldsViewController *)self currentPage];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v9 pageTag:*MEMORY[0x1E4F85F78] additionalValues:v5];
}

- (id)currentPage
{
  return self->_applyPage;
}

- (void)didTapFooterLink:(id)a3
{
  id v4 = a3;
  id v7 = [v4 linkURL];
  id v5 = [v4 termsIdentifier];
  uint64_t v6 = [v4 analyticsIdentifier];

  [(PKApplyFieldsViewController *)self didTapLink:v7 termsIdentifier:v5 analyticsIdentifier:v6];
}

- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    controller = self->_controller;
    uint64_t v12 = [(PKApplyFieldsViewController *)self currentPage];
    uint64_t v13 = *MEMORY[0x1E4F86380];
    uint64_t v14 = *MEMORY[0x1E4F86120];
    v23[0] = *MEMORY[0x1E4F86308];
    v23[1] = v14;
    v24[0] = v13;
    v24[1] = v10;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v12 pageTag:0 additionalValues:v15];
  }
  if (v9)
  {
    v16 = [PKApplyTermsAndConditionsViewController alloc];
    uint64_t v17 = self->_controller;
    uint64_t v18 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
    objc_super v19 = [(PKApplyTermsAndConditionsViewController *)v16 initWithController:v17 setupDelegate:v18 context:[(PKPaymentSetupTableViewController *)self context] termsIdentifier:v9];

    [(PKFeatureTermsAndConditionsViewController *)v19 setUseModalPresentation:1];
    [(PKApplyTermsAndConditionsViewController *)v19 setPreflightPDFTerms:1];
    v20 = [(PKApplyFieldsViewController *)self navigationController];
    objc_msgSend(v20, "pk_presentPaymentSetupViewController:animated:completion:", v19, 1, 0);
  }
  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    v21 = [v8 scheme];
    int v22 = [v21 containsString:@"http"];

    if (v22)
    {
      objc_super v19 = (PKApplyTermsAndConditionsViewController *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v8];
      [(PKApplyTermsAndConditionsViewController *)v19 setModalPresentationStyle:2];
      [(PKApplyFieldsViewController *)self presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [(PKApplyTermsAndConditionsViewController *)v19 openSensitiveURL:v8 withOptions:0];
    }
  }

LABEL_6:
}

- (void)_featureApplicationUpdated
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKDynamicProvisioningFieldsPageViewController *)self isLoading];
  id v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received but current view controller is loading - skipping update", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);
    }
    controller = self->_controller;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = self;
    id v4 = [(PKApplyController *)controller applicationUpdatedAlertControllerWithHandler:v11];
    [(PKApplyFieldsViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) showSpinner:1];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1280);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_2;
  v5[3] = &unk_1E59CB6B0;
  v5[4] = v2;
  return [v3 nextViewControllerWithCompletion:v5];
}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_3;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = v3;
  return [v3 _handleNextViewController:a2 displayableError:a3 terminationHandler:v5];
}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateFlow];
}

- (void)_withdrawApplicationTapped
{
  [(PKDynamicProvisioningFieldsPageViewController *)self showSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [(PKApplyController *)controller withdrawApplicationWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = [WeakRetained navigationController];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke_2;
      v12[3] = &unk_1E59CB6D8;
      uint64_t v13 = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
    }
    else
    {
      [WeakRetained showSpinner:0];
      if (v6)
      {
        id v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        id v11 = [v8 navigationController];
        [v11 presentViewController:v10 animated:1 completion:0];
      }
      else
      {
        [v8[160] endApplyFlow];
        [v8 _terminateFlow];
      }
    }
  }
}

uint64_t __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

- (void)_completeInWalletLater
{
  [(PKApplyController *)self->_controller endApplyFlow];

  [(PKApplyFieldsViewController *)self _handleNextStep];
}

- (void)fieldCellDidTapButton:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyFieldsViewController;
  id v4 = a3;
  [(PKPaymentSetupFieldsViewController *)&v5 fieldCellDidTapButton:v4];
  -[PKApplyFieldsViewController _analyticsReportRowTapForFieldCell:](self, "_analyticsReportRowTapForFieldCell:", v4, v5.receiver, v5.super_class);
}

- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  [(PKApplyFieldsViewController *)self _analyticsReportRowTapForFieldCell:v4];
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsViewController;
  LOBYTE(self) = [(PKPaymentSetupFieldsViewController *)&v6 fieldCellEditableTextFieldShouldBeginEditing:v4];

  return (char)self;
}

- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder
{
  uint64_t v2 = [(PKPaymentSetupFieldsViewController *)self firstEmptySetupField];
  BOOL v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F87B28]];

  return v4 ^ 1;
}

- (id)defaultHeaderViewTitle
{
  return (id)[(PKApplyRequiredFieldsPage *)self->_applyPage title];
}

- (id)defaultHeaderViewSubTitle
{
  return (id)[(PKApplyRequiredFieldsPage *)self->_applyPage subtitle];
}

- (void)handleCancelTapped
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKApplyFieldsViewController_handleCancelTapped__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  char v4 = [(PKApplyController *)self->_controller cancelAlertWithContinueAction:v3];
  if (v4)
  {
    objc_super v5 = [(PKApplyFieldsViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __49__PKApplyFieldsViewController_handleCancelTapped__block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[160];
  char v4 = [v2 currentPage];
  uint64_t v5 = *MEMORY[0x1E4F85F78];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86128];
  v13[0] = *MEMORY[0x1E4F86380];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v3 reportAnalyticsDictionaryForPage:v4 pageTag:v5 additionalValues:v8];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1280) featureIdentifier];
  id v10 = *(id **)(a1 + 32);
  if (v9 != 5) {
    return [v10 _withdrawApplicationTapped];
  }
  [v10[160] endApplyFlow];
  return [*(id *)(a1 + 32) _terminateFlow];
}

- (void)_handleNextStep
{
  v15[2] = *MEMORY[0x1E4F143B8];
  [(PKDynamicProvisioningFieldsPageViewController *)self showSpinner:1];
  controller = self->_controller;
  char v4 = [(PKApplyFieldsViewController *)self currentPage];
  uint64_t v5 = *MEMORY[0x1E4F86380];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v14[0] = *MEMORY[0x1E4F86308];
  v14[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86670];
  v15[0] = v5;
  v15[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v4 pageTag:*MEMORY[0x1E4F85F78] additionalValues:v8];

  objc_initWeak(&location, self);
  uint64_t v9 = self->_controller;
  applyPage = self->_applyPage;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PKApplyFieldsViewController__handleNextStep__block_invoke;
  v11[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v12, &location);
  [(PKApplyController *)v9 submitFieldsPage:applyPage completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__PKApplyFieldsViewController__handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PKApplyFieldsViewController__handleNextStep__block_invoke_2;
    v9[3] = &unk_1E59CA7D0;
    v9[4] = WeakRetained;
    [WeakRetained _handleNextViewController:v5 displayableError:v6 terminationHandler:v9];
  }
}

uint64_t __46__PKApplyFieldsViewController__handleNextStep__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: No next step to take. Terminating setup flow - File a radar", v4, 2u);
  }

  return [*(id *)(a1 + 32) _terminateFlow];
}

- (void)_handleNextViewController:(id)a3 displayableError:(id)a4 terminationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (v8)
  {
    id v11 = [(PKApplyFieldsViewController *)self navigationController];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke;
    v14[3] = &unk_1E59CB6D8;
    v14[4] = self;
    objc_msgSend(v11, "pk_presentPaymentSetupViewController:animated:delay:completion:", v8, 1, 0, v14);
LABEL_5:

    goto LABEL_6;
  }
  [(PKDynamicProvisioningFieldsPageViewController *)self showSpinner:0];
  if (v9)
  {
    [(PKApplyFieldsViewController *)self _analyticsReportError:v9];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke_2;
    void v13[3] = &unk_1E59CA7D0;
    v13[4] = self;
    id v11 = PKAlertForDisplayableErrorWithHandlers(v9, 0, v13, 0);
    id v12 = [(PKApplyFieldsViewController *)self navigationController];
    [v12 presentViewController:v11 animated:1 completion:0];

    goto LABEL_5;
  }
  if (v10) {
    v10[2](v10);
  }
LABEL_6:
}

uint64_t __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

void __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke_2(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[160];
  BOOL v3 = [v1 currentPage];
  uint64_t v4 = *MEMORY[0x1E4F85F78];
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F866D8];
  v9[0] = *MEMORY[0x1E4F86380];
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v2 reportAnalyticsDictionaryForPage:v3 pageTag:v4 additionalValues:v7];
}

- (void)_terminateFlow
{
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    uint64_t v4 = [(PKApplyFieldsViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_analyticsReportRowTapForFieldCell:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 paymentSetupField];
  id v5 = [v4 identifier];

  if ([v5 length])
  {
    controller = self->_controller;
    uint64_t v7 = [(PKApplyFieldsViewController *)self currentPage];
    uint64_t v8 = *MEMORY[0x1E4F86BB0];
    v11[0] = *MEMORY[0x1E4F86308];
    v11[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F85F78];
    v12[0] = *MEMORY[0x1E4F86468];
    v12[1] = v5;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(PKApplyController *)controller reportAnalyticsDictionaryForPage:v7 pageTag:v9 additionalValues:v10];
  }
}

- (void)_analyticsReportError:(id)a3
{
  controller = self->_controller;
  id v5 = a3;
  id v6 = [(PKApplyFieldsViewController *)self currentPage];
  [(PKApplyController *)controller reportAnalyticsError:v5 page:v6 pageTag:*MEMORY[0x1E4F85F78] additionalValues:0];
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyPage, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end