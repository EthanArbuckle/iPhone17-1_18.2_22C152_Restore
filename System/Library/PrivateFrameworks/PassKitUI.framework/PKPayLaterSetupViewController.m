@interface PKPayLaterSetupViewController
- (BOOL)disableLeftBarButton;
- (BOOL)disableRightBarButton;
- (BOOL)nextStepButtonTapped;
- (BOOL)previousViewControllerIsApplyFlow;
- (PKPayLaterDynamicContentPage)dynamicContentPage;
- (PKPayLaterSetupFlowController)setupController;
- (PKPayLaterSetupViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4;
- (id)_buttonForBarButtonType:(int64_t)a3;
- (id)navigationControllerViewControllers;
- (int64_t)leftBarButton;
- (int64_t)rightBarButton;
- (void)_handlePostApprovalScreenSteps;
- (void)_presentPayLaterPassIfNecessaryWithCompletion:(id)a3;
- (void)_showCancelAddingToWalletAlertWithCancelBlock:(id)a3 continueBlock:(id)a4;
- (void)cancelButtonTapped;
- (void)didTapHyperLink:(id)a3;
- (void)dismissSetupFlowWithCompletion:(id)a3;
- (void)doneButtonTapped;
- (void)nextButtonTapped;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)provisionPayLaterPassFromApprovalScreen;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDisableLeftBarButton:(BOOL)a3;
- (void)setDisableRightBarButton:(BOOL)a3;
- (void)setLeftBarButton:(int64_t)a3;
- (void)setNextStepButtonTapped:(BOOL)a3;
- (void)setPreviousViewControllerIsApplyFlow:(BOOL)a3;
- (void)setRightBarButton:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPayLaterSetupViewController

- (PKPayLaterSetupViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterSetupViewController;
  v8 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v18, sel_initWithProvisioningController_context_delegate_, 0, [v7 setupContext], 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_setupController, a3);
    v9->_dynamicContentPageType = a4;
    v10 = [v7 financingController];
    v11 = [v10 dynamicContent];
    uint64_t v12 = [v7 selectedProductType];
    v13 = [v7 selectedFinancingOption];
    v14 = [v13 identifier];
    uint64_t v15 = [v11 dynamicContentPageForPageType:a4 productType:v12 optionIdentifier:v14];
    dynamicContentPage = v9->_dynamicContentPage;
    v9->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v15;

    [(PKPayLaterSetupViewController *)v9 setRightBarButton:1];
    [(PKPayLaterSetupViewController *)v9 setModalInPresentation:1];
  }

  return v9;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)PKPayLaterSetupViewController;
  [(PKPaymentSetupOptionsViewController *)&v38 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v3];

  v4 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v4 setTitleAccessoriesEnabled:0];
  [v4 setAdditionalBottomPadding:8.0];
  v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
  if ([(PKPayLaterSetupFlowController *)self->_setupController controllerContext] != 4)
  {
    if (self->_previousViewControllerIsApplyFlow) {
      goto LABEL_4;
    }
    v6 = [(PKPayLaterSetupViewController *)self navigationController];
    id v7 = [v6 viewControllers];
    v8 = [v7 firstObject];
    int v9 = PKEqualObjects();

    if (v9) {
LABEL_4:
    }
      [(PKPayLaterSetupViewController *)self setLeftBarButton:3];
  }
  if ((unint64_t)([(PKPayLaterSetupFlowController *)self->_setupController controllerContext]- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    v10 = [v5 footerView];
    [(PKPayLaterSetupViewController *)self setLeftBarButton:0];
    [(PKPayLaterSetupViewController *)self setRightBarButton:0];
    v11 = [(PKPayLaterSetupViewController *)self navigationItem];
    [v11 setHidesBackButton:1];

    BOOL v12 = [(PKPayLaterSetupFlowController *)self->_setupController hasPayLaterPass];
    v13 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
    v14 = v13;
    if (v12) {
      [v13 primaryActionTitle];
    }
    else {
    uint64_t v15 = [v13 altPrimaryActionTitle];
    }
    if (v15)
    {
      v16 = [v5 primaryButton];
      [v16 setTitle:v15 forState:0];

      v17 = &selRef_provisionPayLaterPassFromApprovalScreen;
      if (v12) {
        v17 = &selRef_doneButtonTapped;
      }
      objc_super v18 = *v17;
      v19 = [v5 primaryButton];
      [v19 addTarget:self action:v18 forControlEvents:64];

      if (v12) {
        goto LABEL_18;
      }
    }
    else
    {
      [v5 setPrimaryButton:0];
      if (v12) {
        goto LABEL_18;
      }
    }
    uint64_t v20 = [v14 secondaryActionTitle];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [v10 manualEntryButton];
      [v22 setTitle:v21 forState:0];

      v23 = [v10 manualEntryButton];
      [v23 addTarget:self action:sel_cancelButtonTapped forControlEvents:64];

LABEL_19:
      [v10 setSetupLaterButton:0];

      goto LABEL_20;
    }
LABEL_18:
    [v10 setManualEntryButton:0];
    goto LABEL_19;
  }
LABEL_20:
  v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v25 = [(PKPayLaterSetupViewController *)self view];
  [v25 setBackgroundColor:v24];

  v26 = [(PKDynamicCollectionViewController *)self collectionView];
  [v26 setBackgroundColor:v24];

  v27 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage footerContent];
  uint64_t v28 = [v27 footerText];
  v29 = (void *)v28;
  if (v27 && v28)
  {
    objc_initWeak(&location, self);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __44__PKPayLaterSetupViewController_viewDidLoad__block_invoke;
    v35 = &unk_1E59CC0E8;
    objc_copyWeak(&v36, &location);
    v30 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:v27 linkTapped:&v32];
    v31 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v31, "setText:", v29, v32, v33, v34, v35);
    [(PKMultiHyperlinkView *)v31 setTextAlignment:1];
    [(PKMultiHyperlinkView *)v31 setSources:v30];
    [v5 setAdditionalLinkView:v31];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

void __44__PKPayLaterSetupViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didTapHyperLink:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterSetupViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 viewWillAppear:a3];
  self->_nextStepButtonTapped = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (!self->_nextStepButtonTapped) {
    [(PKPayLaterSetupFlowController *)self->_setupController endSetupFlowFromViewController:self shouldDismiss:0];
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = [(PKPayLaterSetupViewController *)self navigationController];
    [v7 pushViewController:v6 animated:v4];
  }
}

- (id)navigationControllerViewControllers
{
  v2 = [(PKPayLaterSetupViewController *)self navigationController];
  v3 = [v2 viewControllers];

  return v3;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPayLaterSetupViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:v3];
}

- (void)didTapHyperLink:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 linkURL];
  id v6 = [v4 termsIdentifier];

  id v7 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  v8 = [v7 payLaterAccount];

  if (!v6)
  {
    if (!v5) {
      goto LABEL_11;
    }
    v10 = [v5 scheme];
    int v11 = [v10 containsString:@"http"];

    if (v11)
    {
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
      [v12 setModalPresentationStyle:2];
      [(PKPayLaterSetupViewController *)self presentViewController:v12 animated:1 completion:0];

      goto LABEL_11;
    }
    v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v13 openSensitiveURL:v5 withOptions:0];
LABEL_10:

    goto LABEL_11;
  }
  if (!v8)
  {
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  setupController = self->_setupController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__PKPayLaterSetupViewController_didTapHyperLink___block_invoke;
  v14[3] = &unk_1E59CCCE8;
  v14[4] = self;
  [(PKPayLaterSetupFlowController *)setupController termsViewControllerForTermsIdentifier:v6 completion:v14];
LABEL_11:
}

uint64_t __49__PKPayLaterSetupViewController_didTapHyperLink___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) presentViewController:a2 animated:1 completion:0];
  }
  return result;
}

- (void)setRightBarButton:(int64_t)a3
{
  if (self->_rightBarButton != a3)
  {
    self->_rightBarButton = a3;
    -[PKPayLaterSetupViewController _buttonForBarButtonType:](self, "_buttonForBarButtonType:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = PKAXIDForBarButton(self->_rightBarButton);
    [v6 setAccessibilityIdentifier:v4];

    id v5 = [(PKPayLaterSetupViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
}

- (void)setLeftBarButton:(int64_t)a3
{
  if (self->_leftBarButton != a3)
  {
    self->_leftBarButton = a3;
    -[PKPayLaterSetupViewController _buttonForBarButtonType:](self, "_buttonForBarButtonType:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = PKAXIDForBarButton(self->_leftBarButton);
    [v6 setAccessibilityIdentifier:v4];

    id v5 = [(PKPayLaterSetupViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:v6];
  }
}

- (void)setDisableRightBarButton:(BOOL)a3
{
  self->_disableRightBarButton = a3;
  id v5 = [(PKPayLaterSetupViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:!self->_disableRightBarButton];
}

- (void)setDisableLeftBarButton:(BOOL)a3
{
  self->_disableLeftBarButton = a3;
  id v5 = [(PKPayLaterSetupViewController *)self navigationItem];
  id v4 = [v5 leftBarButtonItem];
  [v4 setEnabled:!self->_disableLeftBarButton];
}

- (void)nextButtonTapped
{
  self->_nextStepButtonTapped = 1;
}

- (void)doneButtonTapped
{
  self->_nextStepButtonTapped = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke;
  aBlock[3] = &unk_1E59CCD30;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ((unint64_t)([(PKPayLaterSetupFlowController *)self->_setupController controllerContext]- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke_2;
    v4[3] = &unk_1E59CA7D0;
    v4[4] = self;
    v3[2](v3, v4);
  }
  else
  {
    v3[2](v3, 0);
  }
}

uint64_t __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dismissSetupFlowWithCompletion:a2];
}

uint64_t __49__PKPayLaterSetupViewController_doneButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePostApprovalScreenSteps];
}

- (void)cancelButtonTapped
{
  self->_nextStepButtonTapped = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  if ((unint64_t)([(PKPayLaterSetupFlowController *)self->_setupController controllerContext]- 1) <= 2&& self->_dynamicContentPageType == 11)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_2;
    v5[3] = &unk_1E59CAA98;
    id v6 = v3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_3;
    v4[3] = &unk_1E59CA7D0;
    v4[4] = self;
    [(PKPayLaterSetupViewController *)self _showCancelAddingToWalletAlertWithCancelBlock:v5 continueBlock:v4];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissSetupFlowWithCompletion:0];
}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PKPayLaterSetupViewController_cancelButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) provisionPayLaterPassFromApprovalScreen];
}

- (void)_handlePostApprovalScreenSteps
{
  int v3 = PKHidePayLaterOptions();
  if ((v3 & 1) == 0) {
    PKSetShouldSeePayLaterEnablementAlert();
  }
  int64_t v4 = [(PKPayLaterSetupFlowController *)self->_setupController controllerContext];
  if (v4 == 1 || v4 == 3)
  {
    if (v3)
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Presenting pay later enablement alert", v17, 2u);
      }

      id v7 = PKCreateAlertControllerForPayLaterEnablement();
      v8 = PKUIKeyWindow();
      int v9 = [v8 rootViewController];

      v10 = [(PKPayLaterSetupViewController *)self traitCollection];
      uint64_t v11 = [v10 userInterfaceIdiom];

      if (!v11)
      {
        uint64_t v12 = [v9 presentedViewController];
        v13 = (void *)v12;
        if (v12) {
          v14 = (void *)v12;
        }
        else {
          v14 = v9;
        }
        id v15 = v14;

        int v9 = v15;
      }
      [v9 presentViewController:v7 animated:1 completion:&__block_literal_global_25];
    }
  }
  else if (v4 == 2)
  {
    if (v3)
    {
      v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "The user has pay later options turned off in settings. Turning on the preference to present the alert", buf, 2u);
      }

      PKSetShouldSeePayLaterEnablementAlert();
    }
    [(PKPayLaterSetupViewController *)self _presentPayLaterPassIfNecessaryWithCompletion:0];
  }
}

uint64_t __63__PKPayLaterSetupViewController__handlePostApprovalScreenSteps__block_invoke()
{
  return PKSetShouldSeePayLaterEnablementAlert();
}

- (void)provisionPayLaterPassFromApprovalScreen
{
  self->_nextStepButtonTapped = 1;
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  int v3 = [(PKPayLaterSetupViewController *)self setupController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke;
  v4[3] = &unk_1E59CBA18;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 provisionPayLaterPassWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2;
  v8[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  char v12 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      objc_initWeak(location, *(id *)(a1 + 40));
      int v3 = [WeakRetained setupController];
      uint64_t v4 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_31;
      v10[3] = &unk_1E59CCD58;
      objc_copyWeak(&v12, location);
      id v11 = *(id *)(a1 + 32);
      [v3 nextViewControllerFromState:9 parentViewController:v4 completion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void **)(a1 + 32);
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Failed to provision pay later pass %@", (uint8_t *)location, 0xCu);
      }

      id v7 = PKAccountDisplayableError();
      id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
      {
        id v9 = [WeakRetained navigationController];
        [v9 presentViewController:v8 animated:1 completion:0];
      }
      [WeakRetained setShowNavigationBarSpinner:0];
    }
  }
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_31(uint64_t a1, void *a2, void *a3)
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
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2_32;
      v16[3] = &unk_1E59CB6D8;
      v16[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v16);
    }
    else
    {
      if (!v6)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_5;
        v12[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v13, (id *)(a1 + 40));
        [v8 dismissSetupFlowWithCompletion:v12];
        objc_destroyWeak(&v13);
        goto LABEL_5;
      }
      uint64_t v10 = PKAccountDisplayableError();
      id v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      if (v9)
      {
        id v11 = [v8 navigationController];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_3;
        v15[3] = &unk_1E59CA7D0;
        v15[4] = v8;
        [v11 presentViewController:v9 animated:1 completion:v15];
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_4;
        v14[3] = &unk_1E59CA7D0;
        v14[4] = v8;
        [v8 dismissSetupFlowWithCompletion:v14];
      }
    }
  }
LABEL_5:
}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_2_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

void __72__PKPayLaterSetupViewController_provisionPayLaterPassFromApprovalScreen__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setShowNavigationBarSpinner:0];
    [v2 _handlePostApprovalScreenSteps];
    id WeakRetained = v2;
  }
}

- (void)dismissSetupFlowWithCompletion:(id)a3
{
  id v5 = a3;
  [(PKPayLaterSetupFlowController *)self->_setupController endSetupFlowFromViewController:self shouldDismiss:1];
  uint64_t v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    uint64_t v4 = v5;
  }
}

- (void)_showCancelAddingToWalletAlertWithCancelBlock:(id)a3 continueBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  id v9 = [v8 payLaterAccount];

  uint64_t v10 = +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", [v9 feature], v9);
  id v11 = (void *)MEMORY[0x1E4FB1418];
  id v12 = PKLocalizedCocoonString(&cfstr_CancelAddToWal.isa);
  id v13 = PKLocalizedCocoonString(&cfstr_CancelAddToWal_0.isa);
  v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

  id v15 = (void *)MEMORY[0x1E4FB1410];
  v16 = PKLocalizedApplyFeatureString();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke;
  v26[3] = &unk_1E59CB150;
  id v27 = v6;
  id v17 = v6;
  objc_super v18 = [v15 actionWithTitle:v16 style:0 handler:v26];

  [v14 addAction:v18];
  [v14 setPreferredAction:v18];
  v19 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v20 = PKLocalizedApplyFeatureString();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke_2;
  v24[3] = &unk_1E59CB150;
  id v25 = v7;
  id v21 = v7;
  v22 = [v19 actionWithTitle:v20 style:0 handler:v24];

  [v14 addAction:v22];
  [(PKPayLaterSetupViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __93__PKPayLaterSetupViewController__showCancelAddingToWalletAlertWithCancelBlock_continueBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentPayLaterPassIfNecessaryWithCompletion:(id)a3
{
  setupController = self->_setupController;
  id v5 = a3;
  id v7 = [(PKPayLaterSetupFlowController *)setupController payLaterPassUniqueIdentifier];
  id v6 = [(PKPayLaterSetupFlowController *)self->_setupController setupViewControllerDelegate];
  [v6 viewController:self requestPresentPassUniqueIdentifier:v7 completion:v5];
}

- (id)_buttonForBarButtonType:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      p_cancelButton = &self->_cancelButton;
      cancelButton = self->_cancelButton;
      if (!cancelButton)
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped];
        id v7 = *p_cancelButton;
        *p_cancelButton = (UIBarButtonItem *)v12;
LABEL_11:

        cancelButton = *p_cancelButton;
        goto LABEL_12;
      }
      goto LABEL_12;
    case 2:
      p_cancelButton = &self->_doneButton;
      cancelButton = self->_doneButton;
      if (!cancelButton)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
        id v7 = PKLocalizedString(&cfstr_Done.isa);
        id v8 = sel_doneButtonTapped;
        id v9 = v13;
        uint64_t v10 = v7;
        uint64_t v11 = 2;
        goto LABEL_10;
      }
LABEL_12:
      v16 = cancelButton;
      goto LABEL_14;
    case 1:
      p_cancelButton = &self->_nextButton;
      cancelButton = self->_nextButton;
      if (!cancelButton)
      {
        id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
        id v7 = PKLocalizedPaymentString(&cfstr_Next.isa);
        id v8 = sel_nextButtonTapped;
        id v9 = v6;
        uint64_t v10 = v7;
        uint64_t v11 = 0;
LABEL_10:
        uint64_t v14 = [v9 initWithTitle:v10 style:v11 target:self action:v8];
        id v15 = *p_cancelButton;
        *p_cancelButton = (UIBarButtonItem *)v14;

        goto LABEL_11;
      }
      goto LABEL_12;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (PKPayLaterSetupFlowController)setupController
{
  return self->_setupController;
}

- (PKPayLaterDynamicContentPage)dynamicContentPage
{
  return self->_dynamicContentPage;
}

- (int64_t)rightBarButton
{
  return self->_rightBarButton;
}

- (int64_t)leftBarButton
{
  return self->_leftBarButton;
}

- (BOOL)disableRightBarButton
{
  return self->_disableRightBarButton;
}

- (BOOL)disableLeftBarButton
{
  return self->_disableLeftBarButton;
}

- (BOOL)previousViewControllerIsApplyFlow
{
  return self->_previousViewControllerIsApplyFlow;
}

- (void)setPreviousViewControllerIsApplyFlow:(BOOL)a3
{
  self->_previousViewControllerIsApplyFlow = a3;
}

- (BOOL)nextStepButtonTapped
{
  return self->_nextStepButtonTapped;
}

- (void)setNextStepButtonTapped:(BOOL)a3
{
  self->_nextStepButtonTapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);

  objc_storeStrong((id *)&self->_nextButton, 0);
}

@end