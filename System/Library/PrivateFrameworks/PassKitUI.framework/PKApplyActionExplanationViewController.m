@interface PKApplyActionExplanationViewController
- (void)_configureAppleCardIcon;
- (void)_handleCancelTapped;
- (void)_terminateFlow;
- (void)_withdrawApplicationTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyActionExplanationViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKApplyActionExplanationViewController;
  [(PKApplyExplanationViewController *)&v16 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [(PKApplyExplanationViewController *)self controller];
  v4 = [(PKApplyExplanationViewController *)self controller];
  v5 = [v4 featureApplication];

  if ([v5 feature] == 2 || objc_msgSend(v3, "featureIdentifier") == 2)
  {
    v6 = [v3 featureApplication];
    uint64_t v7 = [v6 applicationState];

    if (v7 == 7)
    {
      [(PKApplyActionExplanationViewController *)self _configureAppleCardIcon];
      v8 = [(PKExplanationViewController *)self explanationView];
      [v8 setBodyButtonNumberOfLines:2];
    }
    else if ([v3 applicationType] == 2)
    {
      [(PKApplyActionExplanationViewController *)self _configureAppleCardIcon];
    }
  }
  else if (([v5 applicationState] == 1 || objc_msgSend(v5, "applicationState") == 4) {
         && [v5 feature] == 3)
  }
  {
    [(PKExplanationViewController *)self setShowCancelButton:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke;
    v13[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v14, &location);
    [(PKDynamicProvisioningPageViewController *)self setCancelButtonAction:v13];
    objc_destroyWeak(&v14);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_2;
  v11[3] = &unk_1E59CCC50;
  objc_copyWeak(&v12, &location);
  [(PKApplyExplanationViewController *)self setContinueAction:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_4;
  v9[3] = &unk_1E59CCC50;
  objc_copyWeak(&v10, &location);
  [(PKApplyExplanationViewController *)self setAuxiliaryAction:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleCancelTapped];
    id WeakRetained = v2;
  }
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained showNavigationBarSpinner:1];
    v3 = [v2 currentPage];
    v4 = [v2 controller];
    v5 = [v3 primaryActionIdentifier];
    v6 = [v3 footerContent];
    uint64_t v7 = [v6 termsIdentifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_3;
    v9[3] = &unk_1E59CB6B0;
    id v10 = v2;
    [v4 submitActionIdentifier:v5 termsIdentifiers:v7 odiAttributesDictionary:0 completion:v9];
  }
  return 0;
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleNextViewController:a2 displayableError:a3];
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained showNavigationBarSpinner:1];
    v3 = [v2 currentPage];
    v4 = [v2 controller];
    v5 = [v3 secondaryActionIdentifier];
    v6 = [v3 footerContent];
    uint64_t v7 = [v6 termsIdentifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_5;
    v9[3] = &unk_1E59CB6B0;
    id v10 = v2;
    [v4 submitActionIdentifier:v5 termsIdentifiers:v7 odiAttributesDictionary:0 completion:v9];
  }
  return 0;
}

uint64_t __53__PKApplyActionExplanationViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleNextViewController:a2 displayableError:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyActionExplanationViewController;
  [(PKApplyExplanationViewController *)&v8 viewDidAppear:a3];
  v4 = [(PKApplyExplanationViewController *)self controller];
  v5 = [v4 featureApplication];
  v6 = [v5 declineDetails];
  uint64_t v7 = [v6 declinedTermsIdentifier];

  if ([v5 applicationState] == 7 && objc_msgSend(v7, "length")) {
    [v4 termsShownWithIdentifier:v7];
  }
}

- (void)_configureAppleCardIcon
{
  v3 = [(PKApplyExplanationViewController *)self controller];
  PKFeatureApplicationHeaderImageWithImage([v3 featureIdentifier], 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setImage:v5];
  [v4 setTopMargin:30.0];
}

- (void)_handleCancelTapped
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKApplyActionExplanationViewController__handleCancelTapped__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [(PKApplyExplanationViewController *)self controller];
  id v5 = [v4 cancelAlertWithContinueAction:v3];

  if (v5)
  {
    v6 = [(PKApplyActionExplanationViewController *)self navigationController];
    [v6 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __61__PKApplyActionExplanationViewController__handleCancelTapped__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) controller];
  v3 = [*(id *)(a1 + 32) currentPage];
  v4 = [*(id *)(a1 + 32) analyticsPageTag];
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v9[0] = *MEMORY[0x1E4F86308];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86128];
  v10[0] = *MEMORY[0x1E4F86380];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 reportAnalyticsDictionaryForPage:v3 pageTag:v4 additionalValues:v7];

  return [*(id *)(a1 + 32) _withdrawApplicationTapped];
}

- (void)_withdrawApplicationTapped
{
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  v3 = [(PKApplyExplanationViewController *)self controller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [v3 withdrawApplicationWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = [WeakRetained navigationController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke_2;
      v13[3] = &unk_1E59CB6D8;
      id v14 = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v13);
    }
    else
    {
      [WeakRetained showNavigationBarSpinner:0];
      if (v6)
      {
        id v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        v11 = [v8 navigationController];
        [v11 presentViewController:v10 animated:1 completion:0];
      }
      else
      {
        id v12 = [v8 controller];
        [v12 endApplyFlow];

        [v8 _terminateFlow];
      }
    }
  }
}

uint64_t __68__PKApplyActionExplanationViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showNavigationBarSpinner:0];
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

- (void)_terminateFlow
{
  v3 = [(PKApplyExplanationViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    v4 = [(PKApplyActionExplanationViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

@end