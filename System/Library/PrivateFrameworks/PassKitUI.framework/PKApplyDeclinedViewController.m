@interface PKApplyDeclinedViewController
- (BOOL)_shouldOfferAddPayLaterPassToWallet;
- (void)_auxiliaryAction;
- (void)_cancelAction;
- (void)_continueAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyDeclinedViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PKApplyDeclinedViewController;
  [(PKApplyExplanationViewController *)&v14 viewDidLoad];
  v3 = [(PKApplyExplanationViewController *)self controller];
  v4 = [v3 featureApplication];
  if ([v4 applicationStateReason] == 7
    || [(PKApplyDeclinedViewController *)self _shouldOfferAddPayLaterPassToWallet])
  {
    [(PKExplanationViewController *)self setShowCancelButton:1];
  }
  v5 = [(PKExplanationViewController *)self explanationView];
  v6 = PKFeatureApplicationHeaderImageWithImage([v3 featureIdentifier], 0);
  [v5 setImage:v6];
  if (v6) {
    [v5 setTopMargin:30.0];
  }
  [v5 setBodyButtonNumberOfLines:2];
  [v5 setBodyDataDetectorTypes:1];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E59CCC50;
  objc_copyWeak(&v12, &location);
  [(PKApplyExplanationViewController *)self setContinueAction:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_2;
  v9[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  [(PKDynamicProvisioningPageViewController *)self setCancelButtonAction:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_3;
  v7[3] = &unk_1E59CCC50;
  objc_copyWeak(&v8, &location);
  [(PKApplyExplanationViewController *)self setAuxiliaryAction:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _continueAction];
  }

  return 0;
}

void __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancelAction];
    id WeakRetained = v2;
  }
}

uint64_t __44__PKApplyDeclinedViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _auxiliaryAction];
  }

  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyDeclinedViewController;
  [(PKApplyExplanationViewController *)&v8 viewDidAppear:a3];
  v4 = [(PKApplyExplanationViewController *)self controller];
  v5 = [v4 featureApplication];
  v6 = [v5 declineDetails];
  v7 = [v6 declinedTermsIdentifier];
  [v4 termsShownWithIdentifier:v7];
}

- (void)_continueAction
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke;
  aBlock[3] = &unk_1E59CB240;
  objc_copyWeak(&v19, &location);
  v3 = _Block_copy(aBlock);
  v4 = [(PKApplyExplanationViewController *)self controller];
  v5 = [v4 featureApplication];

  if ([v5 applicationStateReason] == 7)
  {
    if (+[PKBusinessChatController deviceSupportsBusinessChat])
    {
      if (!self->_businessChatController)
      {
        v6 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v6;
      }
      objc_super v8 = [PKBuinessChatApplyContext alloc];
      v9 = [v5 businessChatIdentifier];
      id v10 = [(PKBuinessChatApplyContext *)v8 initWithIdentifier:v9 intent:1];

      v11 = self->_businessChatController;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_2;
      v16[3] = &unk_1E59CC620;
      id v17 = v3;
      [(PKBusinessChatController *)v11 openBusinessChatWithContext:v10 completion:v16];
    }
  }
  else if ([(PKApplyDeclinedViewController *)self _shouldOfferAddPayLaterPassToWallet])
  {
    [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
    dispatch_time_t v12 = dispatch_time(0, 3000000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_4;
    v13[3] = &unk_1E59D6D98;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    id v14 = v3;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);

    objc_destroyWeak(&v15);
  }
  else
  {
    (*((void (**)(void *, void))v3 + 2))(v3, 0);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v4 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      [WeakRetained presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      v5 = [WeakRetained controller];
      [v5 endApplyFlow];

      [WeakRetained handleNextStep];
    }
  }
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_3;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __48__PKApplyDeclinedViewController__continueAction__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_4(id *a1)
{
  id v2 = [a1[4] controller];
  id v3 = [v2 payLaterSetupController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PKApplyDeclinedViewController__continueAction__block_invoke_5;
  v4[3] = &unk_1E59CD2F8;
  objc_copyWeak(&v6, a1 + 6);
  id v5 = a1[5];
  [v3 provisionPayLaterPassWithCompletion:v4];

  objc_destroyWeak(&v6);
}

void __48__PKApplyDeclinedViewController__continueAction__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained showNavigationBarSpinner:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)_shouldOfferAddPayLaterPassToWallet
{
  id v3 = [(PKApplyExplanationViewController *)self controller];
  id v4 = [v3 featureApplication];

  id v5 = [(PKApplyExplanationViewController *)self controller];
  id v6 = [v5 payLaterSetupController];

  if ([v4 feature] == 3)
  {
    BOOL v7 = 0;
    if ([v4 applicationStateReason] == 16 && v6) {
      BOOL v7 = [v6 controllerContext] == 2;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_cancelAction
{
  id v3 = [(PKApplyExplanationViewController *)self controller];
  [v3 endApplyFlow];

  [(PKApplyExplanationViewController *)self handleNextStep];
}

- (void)_auxiliaryAction
{
  id v3 = [(PKApplyExplanationViewController *)self controller];
  [v3 endApplyFlow];

  [(PKApplyExplanationViewController *)self handleNextStep];
}

- (void).cxx_destruct
{
}

@end